// [mqtt.client]: one MQTT connection, shared by name with [mqtt.midi], [mqtt.homie.device] and [mqtt.homie.controller].
// Those objects reach this script through [mqtt.client]; their messages start with the role and the object's id:
//   midi <id> ...   device <id> ...   controller <id> ...

const maxApi = require("max-api");
const { Client } = require("./lib/client");
const { Subscriptions } = require("./lib/subscriptions");
const { FORMATS, decode, encodeText, encodeBytes } = require("./lib/payload");
const mqttMidi = require("./lib/mqtt-midi");
const { MidiStream } = require("./lib/midi-stream");
const { MidiPort } = require("./lib/midi-port");
const { isId, HomieDevice, HomieController } = require("./lib/homie");

// keepalive 10 s: a dropped connection is detected in about 15 s (1.5 x keepalive), so a Homie last will arrives soon.
const settings = { url: "", username: "", password: "", clientid: "", keepalive: 10, clean: true, qos: 0, retain: false, format: "text" };
const midis = new Map();
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
  device?.homie.announce();
}

function onMessage(topic, payload) {
  if (subscriptions.owns("client", topic)) maxApi.outlet("message", topic, ...decode(payload, settings.format));
  for (const [id, role] of midis) receiveMidi(id, role, topic, payload);
  if (device?.homie.handle(topic, payload)) return;
  controller?.homie.handle(topic, payload);
}

function connect() {
  if (!settings.url) return error("connect needs a url, e.g. connect mqtt://localhost:1883");
  client.connect({ ...settings, will: device?.homie.will() });
}

function disconnect() {
  const last = device && client.connected ? { topic: `${device.homie.base}/$state`, payload: "disconnected", options: { qos: 2, retain: true } } : null;
  if (device) device.homie.state = "disconnected";
  return client.disconnect(last);
}

// The last will is part of the connection, so a change of device needs a new connection.
async function withNewConnection(change) {
  const wasConnected = client.connected;
  if (wasConnected) await disconnect();
  change();
  if (wasConnected) connect();
}

// --- [mqtt.midi] ---

const midiOut = (id, ...args) => maxApi.outlet("midi", id, ...args);
const midiFilter = (role) => `${role.prefix}/${role.direction}/#`;

function publishMidi(role, bytes) {
  const message = mqttMidi.format(role.prefix, mqttMidi.opposite(role.direction), bytes);
  if (message) client.publish(message[0], message[1], { qos: 0, retain: false });
}

function receiveMidi(id, role, topic, payload) {
  const parsed = mqttMidi.parse(role.prefix, topic, payload);
  if (!parsed || parsed.direction !== role.direction) return;
  role.port?.send(parsed.bytes);
  midiOut(id, "bytes", ...parsed.bytes);
}

function midiRole(id) {
  if (!midis.has(id)) {
    const role = { prefix: "remote", direction: "in", port: null, portName: "" };
    role.stream = new MidiStream((bytes) => publishMidi(role, bytes));
    midis.set(id, role);
    subscriptions.add(`midi ${id}`, midiFilter(role));
  }
  return midis.get(id);
}

function resubscribeMidi(id, role, change) {
  subscriptions.remove(`midi ${id}`, midiFilter(role));
  change();
  subscriptions.add(`midi ${id}`, midiFilter(role));
}

function openPort(id, role, name) {
  role.port?.close();
  role.port = null;
  role.portName = name;
  if (!name) return;
  try {
    role.port = new MidiPort(name, (bytes) => publishMidi(role, bytes));
  } catch (err) {
    midiOut(id, "dumpout", "error", `port ${name}: ${err.message}`);
  }
}

const midiCommands = {
  // Sent on load and on "ready", so that an [mqtt.midi] without attributes exists too.
  register: () => {},
  prefix: (id, role, value) => resubscribeMidi(id, role, () => (role.prefix = String(value))),
  direction: (id, role, value) => {
    if (!mqttMidi.DIRECTIONS.includes(value)) return midiOut(id, "dumpout", "error", "direction is in or out");
    resubscribeMidi(id, role, () => (role.direction = value));
  },
  port: (id, role, name = "") => {
    if (String(name) !== role.portName) openPort(id, role, String(name));
  },
  bytes: (id, role, ...bytes) => {
    for (const byte of bytes) role.stream.write(byte);
  },
  free: (id, role) => {
    subscriptions.removeOwner(`midi ${id}`);
    role.port?.close();
    midis.delete(id);
  },
};

// --- [mqtt.homie.device] ---

const roleError = (role, id) => (text) => text && maxApi.outlet(role, id, "dumpout", "error", text);

function startDevice(id, domain, deviceId) {
  const fail = roleError("device", id);
  if (device && device.id !== id) return fail("this client already has a Homie device");
  if (!isId(domain) || !isId(deviceId)) return fail("domain and device ID may only contain a-z, 0-9 and -");
  return withNewConnection(() => {
    const previous = device?.homie;
    subscriptions.removeOwner("device");
    const homie = new HomieDevice({
      client: roleClient("device"),
      domain,
      id: deviceId,
      onSet: (node, prop, atoms) => maxApi.outlet("device", id, "set", node, prop, ...atoms),
    });
    if (previous) Object.assign(homie, { description: previous.description, values: previous.values });
    device = { id, homie };
  });
}

const deviceCommands = {
  device: (id, domain, deviceId) => startDevice(id, String(domain), String(deviceId)),
  description: async (id, ...rest) => {
    const dict = rest[0] === "dictionary" ? await maxApi.getDict(rest[1]).catch(() => null) : rest[0];
    if (!dict || typeof dict !== "object") return roleError("device", id)("description needs a dict");
    device.homie.setDescription(dict);
  },
  value: (id, node, prop, ...atoms) => roleError("device", id)(device.homie.setValue(String(node), String(prop), atoms)),
  state: (id, state) => {
    if (!["ready", "sleeping"].includes(state)) return roleError("device", id)("state is ready or sleeping");
    device.homie.publishState(state);
  },
  alert: (id, alertId, ...text) => roleError("device", id)(device.homie.alert(String(alertId), text.join(" "))),
  log: (id, level, ...text) => roleError("device", id)(device.homie.log(String(level), text.join(" "))),
  free: () =>
    withNewConnection(() => {
      subscriptions.removeOwner("device");
      device = null;
    }),
};

// --- [mqtt.homie.controller] ---

function startController(id, domain) {
  const fail = roleError("controller", id);
  if (controller && controller.id !== id) return fail("this client already has a Homie controller");
  if (domain !== "+" && !isId(domain)) return fail("domain may only contain a-z, 0-9 and -, or * for all");
  controller?.homie.stop();
  const out = (...args) => maxApi.outlet("controller", id, ...args);
  const homie = new HomieController({
    client: roleClient("controller"),
    domain,
    onDevices: (devices) => out("devices", devices),
    onDescription: (key, description) => out("description", key, description),
    onValue: (key, node, prop, atoms) => out("value", key, node, prop, ...atoms),
    onAlert: (key, alertId, text) => out("alert", key, alertId, text),
  });
  controller = { id, homie };
  homie.start();
}

const controllerCommands = {
  domain: (id, domain) => startController(id, String(domain) === "*" ? "+" : String(domain)),
  set: (id, key, node, prop, ...atoms) => roleError("controller", id)(controller.homie.set(String(key), String(node), String(prop), atoms)),
  broadcast: (id, subtopic, ...text) => roleError("controller", id)(controller.homie.broadcast(String(subtopic), text.join(" "))),
  free: () => {
    controller.homie.stop();
    controller = null;
  },
};

// --- Max handlers ---

// device <id> device ... and controller <id> domain ... set a role up; other commands need that role.
function roleHandler(commands, setup, current) {
  return (id, command, ...args) => {
    if (!(command in commands)) return;
    if (command !== setup && current()?.id !== String(id)) return;
    commands[command](String(id), ...args);
  };
}

maxApi.addHandlers({
  connect: (url, username, password) => {
    if (url !== undefined) Object.assign(settings, { url: String(url), username: username ?? "", password: password ?? "" });
    connect();
  },
  disconnect,
  subscribe: (topic, qos = 0) => subscriptions.add("client", String(topic), [0, 1, 2].includes(qos) ? qos : 0),
  unsubscribe: (topic) => subscriptions.remove("client", String(topic)),
  publish: async (topic, ...rest) => {
    if (!client.connected) return error("not connected");
    const atoms = rest[0] === "dictionary" ? [await maxApi.getDict(rest[1]).catch(() => null)] : rest;
    if (atoms[0] === null) return error("publish: unknown dict");
    client.publish(String(topic), encodeText(atoms), { qos: settings.qos, retain: settings.retain });
  },
  publishbytes: (topic, ...bytes) => {
    if (!client.connected) return error("not connected");
    client.publish(String(topic), encodeBytes(bytes), { qos: settings.qos, retain: settings.retain });
  },
  url: (value = "") => (settings.url = String(value)),
  username: (value = "") => (settings.username = String(value)),
  password: (value = "") => (settings.password = String(value)),
  clientid: (value = "") => (settings.clientid = String(value)),
  keepalive: (seconds) => (settings.keepalive = Math.max(0, Number(seconds) || 0)),
  clean: (on) => (settings.clean = Boolean(on)),
  qos: (level) => (settings.qos = [0, 1, 2].includes(level) ? level : 0),
  retain: (on) => (settings.retain = Boolean(on)),
  format: (mode) => (settings.format = FORMATS.includes(mode) ? mode : "text"),
  midi: (id, command, ...args) => {
    if (command in midiCommands) midiCommands[command](String(id), midiRole(String(id)), ...args);
  },
  device: roleHandler(deviceCommands, "device", () => device),
  controller: roleHandler(controllerCommands, "domain", () => controller),
});

// Objects created before this script started send their settings again on "ready".
maxApi.outlet("ready");
