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
  device?.homie?.announce();
}

function onMessage(topic, payload) {
  if (subscriptions.owns("client", topic)) maxApi.outlet("message", topic, ...decode(payload, settings.format));
  for (const [id, role] of midis) receiveMidi(id, role, topic, payload);
  if (device?.homie?.handle(topic, payload)) return;
  controller?.homie?.handle(topic, payload);
}

function connect() {
  if (!settings.url) return error("connect needs a url, e.g. connect mqtt://localhost:1883");
  client.connect({ ...settings, will: device?.homie?.will() });
}

function disconnect() {
  const homie = device?.homie;
  const last = homie && client.connected ? { topic: `${homie.base}/$state`, payload: "disconnected", options: { qos: 2, retain: true } } : null;
  if (homie) homie.state = "disconnected";
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

// The device starts once its ID is known; domain and ID can arrive in any order, like attributes.
function startDevice() {
  if (!device.deviceId) return;
  if (!isId(device.domain) || !isId(device.deviceId)) return roleError("device", device.id)("domain and device ID may only contain a-z, 0-9 and -");
  return withNewConnection(() => {
    subscriptions.removeOwner("device");
    const { id } = device;
    const homie = new HomieDevice({
      client: roleClient("device"),
      domain: device.domain,
      id: device.deviceId,
      onSet: (node, prop, atoms) => maxApi.outlet("device", id, "set", node, prop, ...atoms),
    });
    if (device.homie) Object.assign(homie, { description: device.homie.description, values: device.homie.values });
    device.homie = homie;
  });
}

function needsHomie(command) {
  return (id, ...args) => (device.homie ? command(id, ...args) : roleError("device", id)("set the device ID first"));
}

const deviceCommands = {
  register: () => {},
  domain: (id, domain) => {
    if (String(domain) === device.domain && device.homie) return;
    device.domain = String(domain);
    return startDevice();
  },
  id: (id, deviceId) => {
    if (String(deviceId) === device.deviceId && device.homie) return;
    device.deviceId = String(deviceId);
    return startDevice();
  },
  description: needsHomie(async (id, ...rest) => {
    const dict = rest[0] === "dictionary" ? await maxApi.getDict(rest[1]).catch(() => null) : rest[0];
    if (!dict || typeof dict !== "object") return roleError("device", id)("description needs a dict");
    device.homie.setDescription(dict);
  }),
  value: needsHomie((id, node, prop, ...atoms) => roleError("device", id)(device.homie.setValue(String(node), String(prop), atoms))),
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
  controller.domain = domain;
  controller.homie = new HomieController({
    client: roleClient("controller"),
    domain,
    onDevices: (devices) => out("devices", devices),
    onDescription: (key, description) => out("description", key, description),
    onValue: (key, node, prop, atoms) => out("value", key, node, prop, ...atoms),
    onAlert: (key, alertId, text) => out("alert", key, alertId, text),
  });
  controller.homie.start();
}

const controllerCommands = {
  register: () => controller.homie || startController("+"),
  domain: (id, domain) => {
    const value = String(domain) === "*" ? "+" : String(domain);
    if (value !== controller.domain || !controller.homie) startController(value);
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
    if (!current()) create(String(id));
    if (current().id !== String(id)) return roleError(role, String(id))(`this client already has a Homie ${role}`);
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
  device: roleHandler("device", deviceCommands, () => device, (id) => (device = { id, domain: "homie", deviceId: null, homie: null })),
  controller: roleHandler("controller", controllerCommands, () => controller, (id) => (controller = { id, domain: null, homie: null })),
});

// Objects created before this script started send their settings again on "ready".
maxApi.outlet("ready");
