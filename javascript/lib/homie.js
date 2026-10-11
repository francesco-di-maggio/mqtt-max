// The Homie 5 convention (https://homieiot.github.io/specification/): devices publish their state,
// a description and property values under {domain}/5/{device}; controllers discover and command them.

const { isObject, toAtom } = require("./payload");

const VERSION = "5.0";
const ID = /^[a-z0-9-]+$/;
const STATES = ["init", "ready", "disconnected", "sleeping", "lost"];
const LOG_LEVELS = ["debug", "info", "warn", "error", "fatal"];
// Retained attributes and values: QoS 2 recommended. Non-retained values and commands: QoS 0.
const RETAINED = { qos: 2, retain: true };
const STREAM = { qos: 0, retain: false };

const isId = (id) => typeof id === "string" && ID.test(id);

// FNV-1a: the description's version changes whenever its content does.
function hash(text) {
  let h = 0x811c9dc5;
  for (const c of text) h = Math.imul(h ^ c.codePointAt(0), 0x01000193);
  return h >>> 0;
}

// "min:max[:step]", either end may be empty.
function inRange(n, format) {
  if (!format) return true;
  const [min, max] = format.split(":").map((s) => (s === "" ? NaN : Number(s)));
  return !(n < min) && !(n > max);
}

// Max atoms -> Homie payload for a property, or null if the value does not fit its datatype.
function formatValue(property, atoms) {
  const { datatype, format } = property;
  const [first] = atoms;
  switch (datatype) {
    case "integer":
      return Number.isInteger(first) && inRange(first, format) ? String(first) : null;
    case "float":
      return typeof first === "number" && Number.isFinite(first) && inRange(first, format) ? String(first) : null;
    case "boolean":
      return first === 1 || first === "true" ? "true" : first === 0 || first === "false" ? "false" : null;
    case "enum":
      return format.split(",").includes(String(first)) ? String(first) : null;
    case "color":
      return atoms.length === 3 && atoms.every((n) => typeof n === "number") ? atoms.join(",") : null;
    case "json":
      return isObject(first) || Array.isArray(first) ? JSON.stringify(first) : null;
    default:
      // string, datetime, duration: text as given.
      return atoms.join(" ");
  }
}

// Homie payload -> Max atoms for a property; without a known property, a number or the text.
function parseValue(property, text) {
  if (!property) return [toAtom(text)];
  switch (property.datatype) {
    case "integer":
    case "float":
      return [Number(text)];
    case "boolean":
      return [text === "true" ? 1 : 0];
    case "color":
      return text.split(",").map(Number);
    case "json":
      try {
        return [JSON.parse(text)];
      } catch {
        return [text];
      }
    default:
      return [text];
  }
}

function property(description, node, prop) {
  return description?.nodes?.[node]?.properties?.[prop];
}

// A Homie device on one MQTT client. The client must be connected with will().
class HomieDevice {
  constructor({ client, domain, id, onSet }) {
    this.client = client;
    this.base = `${domain}/5/${id}`;
    this.onSet = onSet;
    this.description = { homie: VERSION, version: 0, nodes: {} };
    this.values = new Map();
    this.state = null;
  }

  will() {
    return { topic: `${this.base}/$state`, payload: "lost", ...RETAINED };
  }

  setDescription(doc) {
    const content = { ...doc, homie: VERSION };
    delete content.version;
    this.description = { ...content, version: hash(JSON.stringify(content)) };
    // The description may only change while the device is in init, disconnected or lost.
    if (this.state === "ready" || this.state === "sleeping") return this.announce();
  }

  async announce() {
    await this.publishState("init");
    await this.client.publish(`${this.base}/$description`, JSON.stringify(this.description), RETAINED);
    for (const [key, payload] of this.values) await this.client.publish(`${this.base}/${key}`, payload, RETAINED);
    for (const [node, prop] of this.settable()) this.client.subscribe(`${this.base}/${node}/${prop}/set`, { qos: 2 });
    await this.publishState("ready");
  }

  settable() {
    const pairs = [];
    for (const [node, { properties = {} }] of Object.entries(this.description.nodes ?? {})) {
      for (const [prop, p] of Object.entries(properties)) if (p.settable) pairs.push([node, prop]);
    }
    return pairs;
  }

  publishState(state) {
    this.state = state;
    return this.client.publish(`${this.base}/$state`, state, RETAINED);
  }

  // Returns an error text, or null when published.
  setValue(node, prop, atoms) {
    const p = property(this.description, node, prop);
    if (!p) return `no property ${node}/${prop} in the description`;
    const payload = formatValue(p, atoms);
    if (payload === null) return `${atoms.join(" ")} is not a valid ${p.datatype} for ${node}/${prop}`;
    const retained = p.retained !== false;
    if (retained) this.values.set(`${node}/${prop}`, payload);
    if (this.state === "ready") this.client.publish(`${this.base}/${node}/${prop}`, payload, retained ? RETAINED : STREAM);
    return null;
  }

  alert(alertId, text) {
    if (!isId(alertId)) return "alert IDs may only contain a-z, 0-9 and -";
    this.client.publish(`${this.base}/$alert/${alertId}`, text, RETAINED);
    return null;
  }

  log(level, text) {
    if (!LOG_LEVELS.includes(level)) return `log level must be one of ${LOG_LEVELS.join(", ")}`;
    this.client.publish(`${this.base}/$log/${level}`, text, STREAM);
    return null;
  }

  // Returns true if the message was a command for this device.
  handle(topic, payload) {
    if (!topic.startsWith(`${this.base}/`) || !topic.endsWith("/set")) return false;
    const [node, prop] = topic.slice(this.base.length + 1, -"/set".length).split("/");
    const p = property(this.description, node, prop);
    if (!p?.settable) return false;
    this.onSet(node, prop, parseValue(p, payload.toString("utf8")));
    return true;
  }
}

// A Homie controller: discovers devices under a domain ("+" for all) and their values.
class HomieController {
  constructor({ client, domain, onDevices, onDescription, onValue, onAlert }) {
    this.client = client;
    this.domain = domain;
    this.handlers = { onDevices, onDescription, onValue, onAlert };
    this.devices = new Map();
    this.reported = null;
  }

  topics() {
    const d = this.domain;
    // {device}/+/+ covers property values and $alert/{id}.
    return [`${d}/5/+/$state`, `${d}/5/+/$description`, `${d}/5/+/+/+`];
  }

  start() {
    for (const topic of this.topics()) this.client.subscribe(topic, { qos: 2 });
  }

  stop() {
    for (const topic of this.topics()) this.client.unsubscribe(topic);
    this.devices.clear();
    this.reported = null;
  }

  // Devices are named relative to the controller's domain: "phone-a1b2", or "remote/phone-a1b2" for all domains.
  key(domain, id) {
    return this.domain === "+" ? `${domain}/${id}` : id;
  }

  device(key) {
    if (!this.devices.has(key)) this.devices.set(key, { state: null, description: null, descriptionText: null });
    return this.devices.get(key);
  }

  // A child device is lost when its root is lost.
  effectiveState(key) {
    const device = this.devices.get(key);
    const root = device.description?.root;
    if (!root) return device.state;
    const rootKey = this.domain === "+" ? `${key.split("/")[0]}/${root}` : root;
    return this.devices.get(rootKey)?.state === "lost" ? "lost" : device.state;
  }

  // Reports only changes: a retained message can arrive twice, live and from a new subscription.
  report() {
    const keys = [...this.devices.keys()].filter((key) => this.devices.get(key).state).sort();
    const states = Object.fromEntries(keys.map((key) => [key, this.effectiveState(key)]));
    const online = keys.filter((key) => states[key] === "ready");
    const offline = keys.filter((key) => states[key] !== "ready");
    const devices = { online, offline, count: online.length, states };
    const text = JSON.stringify(devices);
    if (text === this.reported) return;
    this.reported = text;
    this.handlers.onDevices(devices);
  }

  // Returns true if the message belonged to Homie.
  handle(topic, payload) {
    const parts = topic.split("/");
    if (parts.length < 4 || parts[1] !== "5" || !isId(parts[2])) return false;
    if (this.domain !== "+" && parts[0] !== this.domain) return false;
    const [domain, , id, ...rest] = parts;
    const key = this.key(domain, id);
    const text = payload.toString("utf8");
    if (rest.length === 1 && rest[0] === "$state") return this.handleState(key, text);
    if (rest.length === 1 && rest[0] === "$description") return this.handleDescription(key, text);
    if (rest.length === 2 && rest[0] === "$alert") {
      this.handlers.onAlert(key, rest[1], text);
      return true;
    }
    if (rest.length === 2 && !rest[0].startsWith("$") && !rest[1].startsWith("$")) {
      const p = property(this.devices.get(key)?.description, rest[0], rest[1]);
      this.handlers.onValue(key, rest[0], rest[1], parseValue(p, text));
      return true;
    }
    return false;
  }

  handleState(key, text) {
    // An empty $state removes the device.
    if (text === "") this.devices.delete(key);
    else if (STATES.includes(text)) this.device(key).state = text;
    else return true;
    this.report();
    return true;
  }

  handleDescription(key, text) {
    if (this.devices.get(key)?.descriptionText === text) return true;
    try {
      const description = text === "" ? null : JSON.parse(text);
      if (description !== null && !isObject(description)) return true;
      Object.assign(this.device(key), { description, descriptionText: text });
      this.handlers.onDescription(key, description ?? {});
      this.report();
    } catch {
      // Controllers ignore invalid documents.
    }
    return true;
  }

  // Returns an error text, or null when published.
  set(key, node, prop, atoms) {
    const [domain, id] = this.domain === "+" ? key.split("/") : [this.domain, key];
    const p = property(this.devices.get(key)?.description, node, prop);
    if (!p?.settable) return `${key} has no settable property ${node}/${prop}`;
    const payload = formatValue(p, atoms);
    if (payload === null) return `${atoms.join(" ")} is not a valid ${p.datatype} for ${node}/${prop}`;
    // Commands are never retained.
    const qos = p.retained === false ? 0 : 2;
    this.client.publish(`${domain}/5/${id}/${node}/${prop}/set`, payload, { qos, retain: false });
    return null;
  }

  broadcast(subtopic, text) {
    if (this.domain === "+") return "broadcast needs a domain";
    this.client.publish(`${this.domain}/5/$broadcast/${subtopic}`, text, STREAM);
    return null;
  }
}

module.exports = { VERSION, isId, hash, formatValue, parseValue, HomieDevice, HomieController };
