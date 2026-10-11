// [mqtt.client]: one MQTT connection, shared by name with [mqtt.midi], [mqtt.homie.device] and [mqtt.homie.controller].
// Those objects reach this script through [mqtt.client]; their messages start with the role and the object's id:
//   midi <id> ...   device <id> ...   controller <id> ...

const maxApi = require("max-api");
const { Client } = require("./lib/client");
const { Subscriptions } = require("./lib/subscriptions");
const { FORMATS, decode, encodeText, encodeBytes, toAtom } = require("./lib/payload");
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

// Settings are stored until "register", which the abstraction sends after all its arguments and attributes,
// so a role starts once, with its final settings.
function midiRole(id) {
  if (!midis.has(id)) {
    const role = { prefix: "remote", direction: "in", portName: "", port: null, active: false };
    role.stream = new MidiStream((bytes) => publishMidi(role, bytes));
    midis.set(id, role);
  }
  return midis.get(id);
}

function changeMidi(id, role, change) {
  if (role.active) subscriptions.remove(`midi ${id}`, midiFilter(role));
  change();
  if (role.active) subscriptions.add(`midi ${id}`, midiFilter(role));
}

// MIDI objects look up their port when created, so the port reports itself once it exists:
// a patch passes "port <name>" on to [ctlin], [notein], [ctlout] etc.
function openPort(id, role) {
  role.port?.close();
  role.port = null;
  if (!role.portName) return;
  try {
    role.port = new MidiPort(role.portName, (bytes) => publishMidi(role, bytes));
    midiOut(id, "dumpout", "port", role.portName);
  } catch (err) {
    midiOut(id, "dumpout", "error", `port ${role.portName}: ${err.message}`);
  }
}

const midiCommands = {
  register: (id, role) => {
    if (role.active) return;
    role.active = true;
    subscriptions.add(`midi ${id}`, midiFilter(role));
    openPort(id, role);
  },
  prefix: (id, role, value) => changeMidi(id, role, () => (role.prefix = String(value))),
  direction: (id, role, value) => {
    if (!mqttMidi.DIRECTIONS.includes(value)) return midiOut(id, "dumpout", "error", "direction is in or out");
    changeMidi(id, role, () => (role.direction = value));
  },
  port: (id, role, name = "") => {
    if (String(name) === role.portName) return;
    role.portName = String(name);
    if (role.active) openPort(id, role);
  },
  bytes: (id, role, ...bytes) => {
    if (!role.active) return;
    for (const byte of bytes) role.stream.write(byte);
  },
};

function freeMidi(id) {
  const role = midis.get(id);
  if (!role) return;
  subscriptions.removeOwner(`midi ${id}`);
  role.port?.close();
  midis.delete(id);
}

// --- [mqtt.homie.device] ---

const roleError = (role, id) => (text) => text && maxApi.outlet(role, id, "dumpout", "error", text);

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
      onSet: (node, prop, atoms) => out("set", node, prop, ...atoms),
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
    onValue: (key, node, prop, atoms) => out("value", key, node, prop, ...atoms),
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
    const atoms = rest[0] === "dictionary" ? [await maxApi.getDict(rest[1]).catch(() => null)] : rest;
    if (atoms[0] === null) return error("publish: unknown dict");
    client.publish(String(topic), encodeText(atoms), { qos: settings.qos, retain: settings.retain });
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
  midi: (id, command, ...args) => {
    if (command === "free") return freeMidi(String(id));
    if (command in midiCommands) midiCommands[command](String(id), midiRole(String(id)), ...args);
  },
  device: roleHandler("device", deviceCommands, () => device, (id) => (device = { id, domain: "homie", deviceId: null, homie: null, registered: false, pending: { description: null, values: [] } })),
  controller: roleHandler("controller", controllerCommands, () => controller, (id) => (controller = { id, domain: "+", homie: null })),
});

// Objects created before this script started send their settings again on "ready".
maxApi.outlet("ready");
