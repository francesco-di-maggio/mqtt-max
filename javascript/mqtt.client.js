// [mqtt.client]: one MQTT connection, shared by name with [mqtt.send], [mqtt.receive],
// [mqtt.homie.device] and [mqtt.homie.controller].
// Those objects reach this script through [mqtt.client]; their messages start with the role and the object's id
// ([forward] reads "send" as a destination, hence sender and receiver):
//   sender <id> ...   receiver <id> ...   device <id> ...   controller <id> ...

const maxApi = require("max-api");
const { Client } = require("./lib/client");
const { Subscriptions } = require("./lib/subscriptions");
const { matches } = require("./lib/topic");
const { FORMATS, decode, encodeText, encodeBytes, toAtom } = require("./lib/payload");
const { isId, HomieDevice, HomieController } = require("./lib/homie");

// keepalive 10 s: a dropped connection is detected in about 15 s (1.5 x keepalive), so a Homie last will arrives soon.
const settings = { url: "", username: "", password: "", clientid: "", keepalive: 10, clean: true, qos: 0, retain: false, format: "text" };
const senders = new Map();
const receivers = new Map();
let device = null;
let controller = null;

const dumpout = (...args) => maxApi.outlet("dumpout", ...args);
const error = (text) => dumpout("error", text);

const client = new Client({
  onStatus: (state) => dumpout("status", state),
  onError: error,
  onConnect,
  onMessage,
});
const subscriptions = new Subscriptions(client);

// The interface a role's module uses: publishing as is, subscribing under the role's name.
function roleClient(owner) {
  return {
    publish: (topic, payload, options) => client.publish(topic, payload, options),
    subscribe: (filter, options = {}) => subscriptions.add(owner, filter, options.qos ?? 0),
    unsubscribe: (filter) => subscriptions.remove(owner, filter),
  };
}

function onConnect() {
  subscriptions.restore();
  device?.homie?.announce();
}

function onMessage(topic, payload, retained) {
  if (subscriptions.owns("client", topic)) maxApi.outlet("message", topic, ...decode(payload, settings.format));
  for (const [id, role] of receivers) receive(id, role, topic, payload, retained);
  if (device?.homie?.handle(topic, payload)) return;
  controller?.homie?.handle(topic, payload);
}

// A connection that is already open is closed cleanly first, so a Homie device publishes "disconnected", not "lost".
async function connect() {
  if (!settings.url) return error("connect needs a url, e.g. connect mqtt://localhost:1883");
  if (client.active) await disconnect();
  client.connect({ ...settings, will: device?.homie?.will() });
}

function disconnect() {
  if (!client.active) return;
  const homie = device?.homie;
  const last = homie && client.connected ? { topic: `${homie.base}/$state`, payload: "disconnected", options: { qos: 2, retain: true } } : null;
  homie?.stop();
  return client.disconnect(last);
}

// The last will is part of the connection, so a change of device needs a new connection.
async function withNewConnection(change) {
  const wasActive = client.active;
  if (wasActive) await disconnect();
  change();
  if (wasActive) connect();
}

const isTopic = (topic) => topic !== "" && !/[+#]/.test(topic);
const isQos = (level) => [0, 1, 2].includes(level);

// Messages and dicts as payloads, as [mqtt.client]'s publish sends them.
async function payloadOf(atoms) {
  if (atoms[0] !== "dictionary") return encodeText(atoms);
  const dict = await maxApi.getDict(atoms[1]).catch(() => null);
  return dict ? encodeText([dict]) : null;
}

// --- [mqtt.send] ---
// Like [send], across the network: every message in is published to one topic,
// as text (a dict as JSON) or, with @format bytes, as raw bytes: integers 0-255.

const sendOut = (id, ...args) => maxApi.outlet("sender", id, ...args);
const SEND_FORMATS = ["text", "bytes"];

const sendCommands = {
  topic: (id, role, topic = "") => {
    if (String(topic) !== "" && !isTopic(String(topic))) return sendOut(id, "dumpout", "error", "topic without + or #");
    role.topic = String(topic);
  },
  qos: (id, role, level) => {
    if (!isQos(level)) return sendOut(id, "dumpout", "error", "qos is 0, 1 or 2");
    role.qos = level;
  },
  retain: (id, role, on) => (role.retain = Boolean(on)),
  format: (id, role, mode) => {
    if (!SEND_FORMATS.includes(mode)) return sendOut(id, "dumpout", "error", `format is ${SEND_FORMATS.join(" or ")}`);
    role.format = mode;
  },
  // Topic, QoS, retain and format are read on arrival: a later attribute change does not reach an earlier message.
  value: async (id, role, ...atoms) => {
    if (!role.topic) return sendOut(id, "dumpout", "error", "no topic: [mqtt.send <client> <topic>]");
    if (!client.connected) return sendOut(id, "dumpout", "error", "not connected");
    const { topic, qos, retain, format } = role;
    // A bang publishes an empty message: with retain, the broker deletes the retained one.
    const bang = atoms.length === 0 || (atoms.length === 1 && atoms[0] === "bang");
    if (!bang && format === "bytes" && !encodeBytes(atoms)) return sendOut(id, "dumpout", "error", "bytes are integers 0-255");
    const payload = await (bang ? "" : format === "bytes" ? encodeBytes(atoms) : payloadOf(atoms));
    if (payload === null) return sendOut(id, "dumpout", "error", "unknown dict");
    client.publish(topic, payload, { qos, retain });
  },
};

function senderRole(id) {
  if (!senders.has(id)) senders.set(id, { topic: "", qos: 0, retain: false, format: "text" });
  return senders.get(id);
}

// --- [mqtt.receive] ---
// Like [receive], across the network: messages on one topic filter come out.
// With a wildcard in the filter, the topic comes first, so that [route] can tell senders apart.
// A client also receives what it publishes itself on a topic it subscribes to (MQTT 3.1.1 has no "no local").

const receiveOut = (id, ...args) => maxApi.outlet("receiver", id, ...args);

// @retained 0: only new messages; a stored one, sent because of a new subscription, is skipped.
function receive(id, role, topic, payload, retained) {
  if (!role.active || !role.filter || !matches(role.filter, topic)) return;
  if (retained && !role.retained) return;
  const atoms = decode(payload, role.format);
  if (isTopic(role.filter)) receiveOut(id, "message", ...atoms);
  else receiveOut(id, "message", topic, ...atoms);
}

// A filter that is already subscribed is subscribed again, so that the broker sends its retained messages
// to the new receiver too (MQTT 3.1.1, 3.8.4). Other owners of the filter receive them once more.
function resubscribe(id, role, change) {
  if (role.active && role.filter) subscriptions.remove(`receive ${id}`, role.filter);
  change();
  if (!role.active || !role.filter) return;
  const shared = subscriptions.qos(role.filter) !== -1;
  subscriptions.add(`receive ${id}`, role.filter, role.qos);
  if (shared) client.resubscribe(role.filter, { qos: subscriptions.qos(role.filter) });
}

const receiveCommands = {
  register: (id, role) => {
    if (role.active) return;
    resubscribe(id, role, () => (role.active = true));
  },
  topic: (id, role, filter = "") => resubscribe(id, role, () => (role.filter = String(filter))),
  qos: (id, role, level) => {
    if (!isQos(level)) return receiveOut(id, "dumpout", "error", "qos is 0, 1 or 2");
    resubscribe(id, role, () => (role.qos = level));
  },
  format: (id, role, mode) => {
    if (!FORMATS.includes(mode)) return receiveOut(id, "dumpout", "error", `format is ${FORMATS.join(", ")}`);
    role.format = mode;
  },
  retained: (id, role, on) => (role.retained = Boolean(on)),
};

function receiverRole(id) {
  if (!receivers.has(id)) receivers.set(id, { filter: "", qos: 0, format: "text", retained: true, active: false });
  return receivers.get(id);
}

function freeReceiver(id) {
  subscriptions.removeOwner(`receive ${id}`);
  receivers.delete(id);
}

// --- [mqtt.homie.device] ---

const roleError = (role, id) => (text) => text && maxApi.outlet(role, id, "dumpout", "error", text);

// Node and property IDs made of digits reach Max as numbers, so that [route 1 2] matches them.
const idAtom = (id) => (/^(0|[1-9][0-9]*)$/.test(id) ? Number(id) : id);

// The device starts on "register", once domain and ID are known; later changes restart it.
// A description and values sent before that are kept and applied at start.
function startDevice() {
  if (!device.registered) return;
  if (!device.deviceId) return roleError("device", device.id)("mqtt.homie.device needs a device ID: [mqtt.homie.device <client> <device-id>]");
  if (!isId(device.domain) || !isId(device.deviceId)) return roleError("device", device.id)("domain and device ID may only contain a-z, 0-9 and -");
  return withNewConnection(() => {
    subscriptions.removeOwner("device");
    const { id } = device;
    const out = (...args) => maxApi.outlet("device", id, ...args);
    const homie = new HomieDevice({
      client: roleClient("device"),
      domain: device.domain,
      id: device.deviceId,
      onSet: (node, prop, atoms) => out("set", idAtom(node), idAtom(prop), ...atoms),
      onState: (state) => out("dumpout", "state", state),
      onBroadcast: (subtopic, text) => out("dumpout", "broadcast", subtopic, ...text.split(" ").filter(Boolean).map(toAtom)),
    });
    if (device.homie) Object.assign(homie, { description: device.homie.description, values: device.homie.values });
    device.homie = homie;
    if (device.pending.description) roleError("device", id)(homie.setDescription(device.pending.description));
    for (const [node, prop, atoms] of device.pending.values) roleError("device", id)(homie.setValue(node, prop, atoms));
    device.pending = { description: null, values: [] };
  });
}

function needsHomie(command) {
  return (id, ...args) => (device.homie ? command(id, ...args) : roleError("device", id)("the device has not started: it needs a client and a device ID"));
}

const deviceCommands = {
  register: () => {
    if (device.registered) return;
    device.registered = true;
    return startDevice();
  },
  domain: (id, domain) => {
    if (String(domain) === device.domain) return;
    device.domain = String(domain);
    return startDevice();
  },
  id: (id, deviceId) => {
    if (String(deviceId) === device.deviceId) return;
    device.deviceId = String(deviceId);
    return startDevice();
  },
  description: async (id, ...rest) => {
    const dict = rest[0] === "dictionary" ? await maxApi.getDict(rest[1]).catch(() => null) : rest[0];
    if (!dict || typeof dict !== "object") return roleError("device", id)("description needs a dictionary");
    if (!device.homie) return (device.pending.description = dict);
    roleError("device", id)(device.homie.setDescription(dict));
  },
  value: (id, node, prop, ...atoms) => {
    if (!device.homie) return device.pending.values.push([String(node), String(prop), atoms]);
    roleError("device", id)(device.homie.setValue(String(node), String(prop), atoms));
  },
  state: needsHomie((id, state) => {
    if (!["ready", "sleeping"].includes(state)) return roleError("device", id)("state is ready or sleeping");
    device.homie.publishState(state);
  }),
  alert: needsHomie((id, alertId, ...text) => roleError("device", id)(device.homie.alert(String(alertId), text.join(" ")))),
  log: needsHomie((id, level, ...text) => roleError("device", id)(device.homie.log(String(level), text.join(" ")))),
  free: () =>
    withNewConnection(() => {
      subscriptions.removeOwner("device");
      device = null;
    }),
};

// --- [mqtt.homie.controller] ---

// Without a domain, a controller discovers devices in all domains, as Homie requires by default.
function startController(domain) {
  if (domain !== "+" && !isId(domain)) return roleError("controller", controller.id)("domain may only contain a-z, 0-9 and -, or * for all");
  controller.homie?.stop();
  const out = (...args) => maxApi.outlet("controller", controller.id, ...args);
  controller.homie = new HomieController({
    client: roleClient("controller"),
    domain,
    onDevices: (devices) => out("devices", devices),
    onDescription: (key, description) => out("description", key, description),
    onValue: (key, node, prop, atoms) => out("value", key, idAtom(node), idAtom(prop), ...atoms),
    onAlert: (key, alertId, text) => out("alert", key, alertId, text),
    onLog: (key, level, text) => out("log", key, level, text),
  });
  controller.homie.start();
}

// The controller starts on "register" with its domain; a later domain change restarts it.
const controllerCommands = {
  register: () => controller.homie || startController(controller.domain),
  domain: (id, domain) => {
    const value = String(domain) === "*" ? "+" : String(domain);
    if (value === controller.domain) return;
    controller.domain = value;
    if (controller.homie) startController(value);
  },
  set: (id, key, node, prop, ...atoms) => roleError("controller", id)(controller.homie?.set(String(key), String(node), String(prop), atoms)),
  broadcast: (id, subtopic, ...text) => roleError("controller", id)(controller.homie?.broadcast(String(subtopic), text.join(" "))),
  free: () => {
    controller.homie?.stop();
    controller = null;
  },
};

// --- Max handlers ---

// A client has one Homie device and one controller: the first object to register gets the role.
function roleHandler(role, commands, current, create) {
  return (id, command, ...args) => {
    if (!(command in commands)) return;
    // free from an object that never had the role: nothing to do.
    if (command === "free" && current()?.id !== String(id)) return;
    if (!current()) create(String(id));
    if (current().id !== String(id)) return roleError(role, String(id))(`this client already has a Homie ${role}`);
    commands[command](String(id), ...args);
  };
}

maxApi.addHandlers({
  connect: (url, username, password) => {
    if (url !== undefined) Object.assign(settings, { url: String(url), username: username ?? "", password: password ?? "" });
    return connect();
  },
  disconnect,
  subscribe: (topic, qos = 0) => {
    if (![0, 1, 2].includes(qos)) return error("qos is 0, 1 or 2");
    subscriptions.add("client", String(topic), qos);
  },
  unsubscribe: (topic) => subscriptions.remove("client", String(topic)),
  publish: async (topic, ...rest) => {
    if (!client.connected) return error("not connected");
    const payload = await payloadOf(rest);
    if (payload === null) return error("publish: unknown dict");
    client.publish(String(topic), payload, { qos: settings.qos, retain: settings.retain });
  },
  publishbytes: (topic, ...bytes) => {
    if (!client.connected) return error("not connected");
    const payload = encodeBytes(bytes);
    if (!payload) return error("publishbytes: bytes are integers 0-255");
    client.publish(String(topic), payload, { qos: settings.qos, retain: settings.retain });
  },
  url: (value = "") => (settings.url = String(value)),
  username: (value = "") => (settings.username = String(value)),
  password: (value = "") => (settings.password = String(value)),
  clientid: (value = "") => (settings.clientid = String(value)),
  keepalive: (seconds) => (settings.keepalive = Math.max(0, Number(seconds) || 0)),
  clean: (on) => (settings.clean = Boolean(on)),
  qos: (level) => {
    if (![0, 1, 2].includes(level)) return error("qos is 0, 1 or 2");
    settings.qos = level;
  },
  retain: (on) => (settings.retain = Boolean(on)),
  format: (mode) => {
    if (!FORMATS.includes(mode)) return error(`format is ${FORMATS.join(", ")}`);
    settings.format = mode;
  },
  sender: (id, command, ...args) => {
    if (command === "free") return senders.delete(String(id));
    if (command in sendCommands) sendCommands[command](String(id), senderRole(String(id)), ...args);
  },
  receiver: (id, command, ...args) => {
    if (command === "free") return freeReceiver(String(id));
    if (command in receiveCommands) receiveCommands[command](String(id), receiverRole(String(id)), ...args);
  },
  device: roleHandler("device", deviceCommands, () => device, (id) => (device = { id, domain: "homie", deviceId: null, homie: null, registered: false, pending: { description: null, values: [] } })),
  controller: roleHandler("controller", controllerCommands, () => controller, (id) => (controller = { id, domain: "+", homie: null })),
});

// Objects created before this script started send their settings again on "ready".
maxApi.outlet("ready");
