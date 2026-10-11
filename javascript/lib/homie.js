// The Homie 5 convention (https://homieiot.github.io/specification/): devices publish their state,
// a description and property values under {domain}/5/{device}; controllers discover and command them.

const { isObject, toAtom } = require("./payload");

const VERSION = "5.0";
const ID = /^[a-z0-9-]+$/;
const STATES = ["init", "ready", "disconnected", "sleeping", "lost"];
const LOG_LEVELS = ["debug", "info", "warn", "error", "fatal"];
const DATATYPES = ["integer", "float", "boolean", "string", "enum", "color", "datetime", "duration", "json"];
// Color payloads start with their type; values per type and their maximum (minimum 0).
const COLORS = { rgb: [255, 255, 255], hsv: [360, 100, 100], xyz: [1, 1] };
const DURATION = /^PT(?=\d)(\d+H)?(\d+M)?(\d+(\.\d+)?S)?$/;
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

// Number format "[min]:[max][:step]": round to the step from min, else max, else the current value,
// with floor(x + 0.5) as the spec recommends, then check the range.
function fitNumber(n, format, current) {
  const [min, max, step] = (format ?? "").split(":").map((s) => (s === undefined || s === "" ? NaN : Number(s)));
  if (step > 0) {
    const base = !Number.isNaN(min) ? min : !Number.isNaN(max) ? max : Number.isFinite(current) ? current : n;
    const decimals = Math.max(...[step, base].map((v) => (String(v).split(".")[1] ?? "").length));
    n = Number((base + Math.floor((n - base) / step + 0.5) * step).toFixed(decimals));
  }
  return n < min || n > max ? null : n;
}

// Max atoms -> Homie payload for a property, or null if the value does not fit its datatype.
// current: the property's current value, the base for rounding to a step.
function formatValue(property, atoms, current) {
  const { datatype, format } = property;
  const [first] = atoms;
  switch (datatype) {
    case "integer": {
      const n = Number.isInteger(first) ? fitNumber(first, format, current) : null;
      return n === null ? null : String(n);
    }
    case "float": {
      const n = typeof first === "number" && Number.isFinite(first) ? fitNumber(first, format, current) : null;
      return n === null ? null : String(n);
    }
    case "boolean":
      return first === 1 || first === "true" ? "true" : first === 0 || first === "false" ? "false" : null;
    case "enum":
      return first !== undefined && (format ?? "").split(",").includes(String(first)) ? String(first) : null;
    case "color": {
      const [type, ...values] = atoms;
      const ranges = COLORS[type];
      const fits = ranges && (format ?? "").split(",").includes(type) && values.length === ranges.length &&
        values.every((v, i) => typeof v === "number" && v >= 0 && v <= ranges[i]);
      return fits ? [type, ...values].join(",") : null;
    }
    case "datetime": {
      const text = atoms.join(" ");
      return text && !Number.isNaN(Date.parse(text)) ? text : null;
    }
    case "duration":
      return DURATION.test(String(first)) && atoms.length === 1 ? String(first) : null;
    case "json":
      return isObject(first) || Array.isArray(first) ? JSON.stringify(first) : null;
    default:
      // string: any text, including empty.
      return atoms.join(" ");
  }
}

// Homie payload -> Max atoms for a property; without a known property, a number or the text.
function parseValue(property, text) {
  if (!property) return [toAtom(text)];
  switch (property.datatype) {
    case "integer":
    case "float":
      return [toAtom(text)];
    case "boolean":
      return text === "true" ? [1] : text === "false" ? [0] : [text];
    case "color": {
      const [type, ...values] = text.split(",");
      return [type, ...values.map(toAtom)];
    }
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

// Returns an error text for a description the device must not publish, or null.
function checkDescription(doc) {
  if (!isObject(doc)) return "the description must be a dictionary";
  if (doc.nodes !== undefined && !isObject(doc.nodes)) return "nodes must be a dictionary";
  for (const [node, n] of Object.entries(doc.nodes ?? {})) {
    if (!isId(node)) return `node ID ${node}: only a-z, 0-9 and -`;
    for (const [prop, p] of Object.entries(n?.properties ?? {})) {
      if (!isId(prop)) return `property ID ${node}/${prop}: only a-z, 0-9 and -`;
      if (!DATATYPES.includes(p?.datatype)) return `${node}/${prop}: datatype must be one of ${DATATYPES.join(", ")}`;
      if ((p.datatype === "enum" || p.datatype === "color") && !p.format) return `${node}/${prop}: a ${p.datatype} needs a format`;
    }
  }
  return null;
}

// A Homie device on one MQTT client. The client must be connected with will().
// onSet(node, property, atoms): a command; onState(state): each state it publishes;
// onBroadcast(subtopic, text): a controller's broadcast to all devices of the domain.
class HomieDevice {
  constructor({ client, domain, id, onSet, onState = () => {}, onBroadcast = () => {} }) {
    this.client = client;
    this.base = `${domain}/5/${id}`;
    this.broadcastBase = `${domain}/5/$broadcast/`;
    this.onSet = onSet;
    this.onState = onState;
    this.onBroadcast = onBroadcast;
    this.description = { homie: VERSION, version: hash("{}"), nodes: {} };
    this.values = new Map();
    this.state = null;
    this.run = 0;
  }

  will() {
    return { topic: `${this.base}/$state`, payload: "lost", ...RETAINED };
  }

  // Returns an error text, or null.
  setDescription(doc) {
    const error = checkDescription(doc);
    if (error) return error;
    const content = { ...doc, homie: VERSION };
    delete content.version;
    this.description = { ...content, version: hash(JSON.stringify(content)) };
    // The description may only change while the device is in init, disconnected or lost.
    if (this.state === "ready" || this.state === "sleeping") this.announce();
    return null;
  }

  // Each announcement stops as soon as a newer one starts or the device stops.
  async announce() {
    const run = ++this.run;
    const current = () => run === this.run;
    await this.publishState("init");
    if (!current()) return;
    await this.client.publish(`${this.base}/$description`, JSON.stringify(this.description), RETAINED);
    for (const [key, payload] of this.values) {
      if (!current()) return;
      await this.client.publish(`${this.base}/${key}`, payload, RETAINED);
    }
    if (!current()) return;
    for (const [node, prop] of this.settable()) this.client.subscribe(`${this.base}/${node}/${prop}/set`, { qos: 2 });
    this.client.subscribe(`${this.broadcastBase}#`, { qos: 0 });
    await this.publishState("ready");
  }

  // Before a clean disconnect: the caller publishes "disconnected" as the last message.
  stop() {
    this.run++;
    this.setState("disconnected");
  }

  settable() {
    const pairs = [];
    for (const [node, n] of Object.entries(this.description.nodes ?? {})) {
      for (const [prop, p] of Object.entries(n?.properties ?? {})) if (p.settable) pairs.push([node, prop]);
    }
    return pairs;
  }

  publishState(state) {
    this.setState(state);
    return this.client.publish(`${this.base}/$state`, state, RETAINED);
  }

  setState(state) {
    this.state = state;
    this.onState(state);
  }

  // Returns an error text, or null.
  setValue(node, prop, atoms) {
    const p = property(this.description, node, prop);
    if (!p) return `no property ${node}/${prop} in the description`;
    const key = `${node}/${prop}`;
    const payload = formatValue(p, atoms, Number(this.values.get(key)));
    if (payload === null) return `${atoms.join(" ")} is not a valid ${p.datatype} for ${key}`;
    const retained = p.retained !== false;
    if (retained) this.values.set(key, payload);
    if (this.state === "ready") this.client.publish(`${this.base}/${key}`, payload, retained ? RETAINED : STREAM);
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

  // Returns true if the message was a command or a broadcast for this device.
  handle(topic, payload) {
    if (topic.startsWith(this.broadcastBase)) {
      this.onBroadcast(topic.slice(this.broadcastBase.length), payload.toString("utf8"));
      return true;
    }
    if (!topic.startsWith(`${this.base}/`) || !topic.endsWith("/set")) return false;
    const [node, prop] = topic.slice(this.base.length + 1, -"/set".length).split("/");
    const p = property(this.description, node, prop);
    if (!p?.settable) return false;
    this.onSet(node, prop, parseValue(p, payload.toString("utf8")));
    return true;
  }
}

// A Homie controller: discovers devices under a domain ("+" for all), then subscribes to each device's values.
class HomieController {
  constructor({ client, domain, onDevices, onDescription, onValue, onAlert, onLog = () => {} }) {
    this.client = client;
    this.domain = domain;
    this.handlers = { onDevices, onDescription, onValue, onAlert, onLog };
    this.devices = new Map();
    this.reported = null;
  }

  discovery() {
    return [`${this.domain}/5/+/$state`, `${this.domain}/5/+/$description`];
  }

  start() {
    for (const topic of this.discovery()) this.client.subscribe(topic, { qos: 2 });
  }

  stop() {
    for (const topic of this.discovery()) this.client.unsubscribe(topic);
    for (const device of this.devices.values()) this.client.unsubscribe(device.values);
    this.devices.clear();
    this.reported = null;
  }

  // Devices are named relative to the controller's domain: "phone-a1b2", or "remote/phone-a1b2" for all domains.
  key(domain, id) {
    return this.domain === "+" ? `${domain}/${id}` : id;
  }

  // {device}/+/+ covers its property values, its $alert/{id} and its $log/{level}.
  device(domain, id) {
    const key = this.key(domain, id);
    if (!this.devices.has(key)) {
      const device = { state: null, description: null, descriptionText: null, values: `${domain}/5/${id}/+/+`, current: new Map() };
      this.devices.set(key, device);
      this.client.subscribe(device.values, { qos: 2 });
    }
    return this.devices.get(key);
  }

  remove(key) {
    const device = this.devices.get(key);
    if (!device) return;
    this.client.unsubscribe(device.values);
    this.devices.delete(key);
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
    const text = payload.toString("utf8");
    if (rest.length === 1 && rest[0] === "$state") return this.handleState(domain, id, text);
    if (rest.length === 1 && rest[0] === "$description") return this.handleDescription(domain, id, text);
    const key = this.key(domain, id);
    const device = this.devices.get(key);
    if (!device || rest.length !== 2) return false;
    if (rest[0] === "$alert") {
      this.handlers.onAlert(key, rest[1], text);
      return true;
    }
    if (rest[0] === "$log") {
      if (LOG_LEVELS.includes(rest[1])) this.handlers.onLog(key, rest[1], text);
      return true;
    }
    if (rest[0].startsWith("$") || rest[1].startsWith("$")) return false;
    const atoms = parseValue(property(device.description, rest[0], rest[1]), text);
    device.current.set(`${rest[0]}/${rest[1]}`, atoms[0]);
    this.handlers.onValue(key, rest[0], rest[1], atoms);
    return true;
  }

  handleState(domain, id, text) {
    // An empty $state removes the device.
    if (text === "") this.remove(this.key(domain, id));
    else if (STATES.includes(text)) this.device(domain, id).state = text;
    else return true;
    this.report();
    return true;
  }

  handleDescription(domain, id, text) {
    const key = this.key(domain, id);
    if (this.devices.get(key)?.descriptionText === text) return true;
    if (text === "") {
      if (this.devices.has(key)) Object.assign(this.devices.get(key), { description: null, descriptionText: text });
      return true;
    }
    try {
      const description = JSON.parse(text);
      // Controllers ignore invalid documents.
      if (!isObject(description)) return true;
      Object.assign(this.device(domain, id), { description, descriptionText: text });
      this.handlers.onDescription(key, description);
      this.report();
    } catch {
      // Controllers ignore invalid documents.
    }
    return true;
  }

  // Returns an error text, or null.
  set(key, node, prop, atoms) {
    const device = this.devices.get(key);
    const p = property(device?.description, node, prop);
    if (!p?.settable) return `${key} has no settable property ${node}/${prop}`;
    const payload = formatValue(p, atoms, device.current.get(`${node}/${prop}`));
    if (payload === null) return `${atoms.join(" ")} is not a valid ${p.datatype} for ${node}/${prop}`;
    const [domain, id] = this.domain === "+" ? key.split("/") : [this.domain, key];
    // Commands are never retained; non-retained properties are time-critical and use QoS 0.
    this.client.publish(`${domain}/5/${id}/${node}/${prop}/set`, payload, { qos: p.retained === false ? 0 : 2, retain: false });
    return null;
  }

  broadcast(subtopic, text) {
    if (this.domain === "+") return "broadcast needs a domain";
    if (!subtopic.split("/").every(isId)) return "broadcast subtopic levels may only contain a-z, 0-9 and -";
    this.client.publish(`${this.domain}/5/$broadcast/${subtopic}`, text, STREAM);
    return null;
  }
}

module.exports = { VERSION, isId, hash, fitNumber, formatValue, parseValue, checkDescription, HomieDevice, HomieController };
