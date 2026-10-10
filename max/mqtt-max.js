const maxApi = require("max-api");
const mqtt = require("mqtt");
const midi = require("@julusian/midi");

// Launch options from @args, e.g. @args --prefix remote --port mqtt-max
const args = process.argv.slice(2);
const option = (name) => {
  const i = args.indexOf(`--${name}`);
  return i >= 0 ? args[i + 1] : undefined;
};

let client = null;
let prefix = option("prefix") ?? "remote";
let port = null;
let format = "text";
// Options for publish / publishbytes / publishjson and subscribe; MIDI from the port always uses QoS 0, no retain.
let qos = 0;
let retain = false;
// With a name, Max is the Homie 5 device {prefix}/5/{name}: the prefix is the Homie domain, the name the device ID.
let clientName = option("name") ?? null;
// The device topic of the current connection, fixed at connect so that its $state and will match.
let ownDevice = null;

// Homie device attributes are retained, QoS 2 recommended. Topic level IDs: lowercase a-z, 0-9 and hyphens.
const ATTRIBUTE = { qos: 2, retain: true };
const ID = /^[a-z0-9-]+$/;

function toAtom(s) {
  const n = Number(s);
  return s !== "" && !isNaN(n) ? n : s;
}

function parseJson(text) {
  try {
    const value = JSON.parse(text);
    return value !== null && typeof value === "object" && !Array.isArray(value) ? value : null;
  } catch {
    return null;
  }
}

// format json: JSON objects come out as a Max dict, anything else as text.
function decode(payload) {
  if (format === "bytes") return Array.from(payload);
  const text = payload.toString("utf8");
  const json = format === "json" && parseJson(text);
  if (json) return [json];
  return text.split(" ").map(toAtom);
}

const STATUS = { noteoff: 0x80, noteon: 0x90, cc: 0xb0, program: 0xc0, pitchbend: 0xe0 };
const TYPE = Object.fromEntries(Object.entries(STATUS).map(([type, status]) => [status, type]));
const SYSTEM = { clock: 0xf8, start: 0xfa, continue: 0xfb, stop: 0xfc };
const SYSTEM_TYPE = Object.fromEntries(Object.entries(SYSTEM).map(([type, status]) => [status, type]));

const toInt = (s) => (/^\d+$/.test(s ?? "") ? Number(s) : NaN);
const isChannel = (n) => n >= 1 && n <= 16;
const isData = (n) => n >= 0 && n <= 127;

// mqtt-midi topics, payload = raw bytes:
//   {prefix}/{in|out}/{noteon|noteoff|cc}/{channel}/{note|controller}  1 byte
//   {prefix}/{in|out}/program/{channel}                               1 byte
//   {prefix}/{in|out}/pitchbend/{channel}                             2 bytes, lsb msb
//   {prefix}/{in|out}/{clock|start|stop|continue}                     empty
function parseMidi(topic, payload) {
  if (!topic.startsWith(`${prefix}/`)) return null;
  const parts = topic.slice(prefix.length + 1).split("/");
  const [direction, type] = parts;
  if (direction !== "in" && direction !== "out") return null;
  if (type in SYSTEM) {
    if (parts.length !== 2) return null;
    return { direction, list: [type], bytes: [SYSTEM[type]] };
  }
  if (!(type in STATUS)) return null;
  const channel = toInt(parts[2]);
  if (!isChannel(channel) || !Array.from(payload).every(isData)) return null;
  const status = STATUS[type] | (channel - 1);
  if (type === "pitchbend") {
    if (parts.length !== 3 || payload.length !== 2) return null;
    const [lsb, msb] = payload;
    return { direction, list: [type, channel, lsb | (msb << 7)], bytes: [status, lsb, msb] };
  }
  if (payload.length !== 1) return null;
  const value = payload[0];
  if (type === "program") {
    if (parts.length !== 3) return null;
    return { direction, list: [type, channel, value], bytes: [status, value] };
  }
  const number = toInt(parts[3]);
  if (parts.length !== 4 || !isData(number)) return null;
  return { direction, list: [type, channel, number, value], bytes: [status, number, value] };
}

// MIDI bytes -> mqtt-midi topic and payload, the inverse of parseMidi.
// Note on with velocity 0 is published as noteoff.
function toMqtt([status, data1, data2]) {
  if (status in SYSTEM_TYPE) return [`${prefix}/out/${SYSTEM_TYPE[status]}`, []];
  let type = TYPE[status & 0xf0];
  if (!type) return null;
  if (type === "noteon" && data2 === 0) type = "noteoff";
  const base = `${prefix}/out/${type}/${(status & 0x0f) + 1}`;
  if (type === "pitchbend") return [base, [data1, data2]];
  if (type === "program") return [base, [data1]];
  return [`${base}/${data1}`, [data2]];
}

// Virtual MIDI port pair: Max reads it with ctlin/notein, writes to it with ctlout/noteout.
function closePort() {
  if (!port) return;
  port.input.closePort();
  port.output.closePort();
  port = null;
}

function openPort(name) {
  closePort();
  const output = new midi.Output();
  output.openVirtualPort(name);
  const input = new midi.Input();
  // Pass clock/start/stop/continue; drop sysex and active sensing.
  input.ignoreTypes(true, false, true);
  input.on("message", (deltaTime, bytes) => {
    const msg = toMqtt(bytes);
    if (!msg || !client) return;
    client.publish(msg[0], Buffer.from(msg[1]));
  });
  input.openVirtualPort(name);
  port = { input, output };
}

function subscribeIn() {
  if (port && client?.connected) client.subscribe(`${prefix}/in/#`);
}

// FNV-1a, so that the description's version changes whenever its content does.
function hash(text) {
  let h = 0x811c9dc5;
  for (const c of text) h = Math.imul(h ^ c.codePointAt(0), 0x01000193);
  return h >>> 0;
}

function description() {
  const doc = { homie: "5.0", name: "mqtt-max", nodes: {} };
  return JSON.stringify({ ...doc, version: hash(JSON.stringify(doc)) });
}

function announce() {
  client.publish(`${ownDevice}/$state`, "init", ATTRIBUTE);
  client.publish(`${ownDevice}/$description`, description(), ATTRIBUTE);
  client.publish(`${ownDevice}/$state`, "ready", ATTRIBUTE);
}

// With a name, the Homie devices under {prefix}/5/+ come out as
//   presence <id> <state>   on each change of $state: init, ready, disconnected, sleeping or lost
//   devices <dict>          { online: [...], offline: [...], count, states: { id: state } }
// online lists the devices that are ready, count is their number.
let devices = new Map();

function subscribeState() {
  if (clientName && client?.connected) client.subscribe(`${prefix}/5/+/$state`, { qos: 2 });
}

function parseState(topic, payload) {
  const base = `${prefix}/5/`;
  if (!clientName || !topic.startsWith(base) || !topic.endsWith("/$state")) return null;
  const id = topic.slice(base.length, -"/$state".length);
  return ID.test(id) ? [id, payload.toString("utf8")] : null;
}

// An empty payload deletes the retained $state, and with it the device.
function updateDevices(id, state) {
  if (state === "") return devices.delete(id);
  if (devices.get(id) === state) return false;
  devices.set(id, state);
  return true;
}

function sendDevices() {
  const ids = [...devices.keys()].sort();
  const online = ids.filter((id) => devices.get(id) === "ready");
  const offline = ids.filter((id) => devices.get(id) !== "ready");
  const states = Object.fromEntries(ids.map((id) => [id, devices.get(id)]));
  maxApi.outlet("devices", { online, offline, count: online.length, states });
}

function resetDevices() {
  devices = new Map();
  if (clientName) sendDevices();
}

// A QoS 2 publish completes in a handshake, so the client closes once "disconnected" is delivered.
function disconnect() {
  if (!client) return;
  const closing = client;
  closing.removeAllListeners("message");
  if (ownDevice && closing.connected) {
    closing.publish(`${ownDevice}/$state`, "disconnected", ATTRIBUTE, () => closing.end());
  } else {
    closing.end();
  }
  client = null;
  ownDevice = null;
  resetDevices();
}

maxApi.addHandlers({
  connect: (url = "mqtt://localhost:1883", username, password) => {
    disconnect();
    if (clientName && !(ID.test(prefix) && ID.test(clientName))) {
      return maxApi.outlet("error", "with a name, prefix and name may only contain a-z, 0-9 and -");
    }
    const options = { username, password };
    ownDevice = clientName ? `${prefix}/5/${clientName}` : null;
    if (ownDevice) {
      // The broker publishes the will when the connection drops without a disconnect;
      // keepalive 10 s detects a silent drop in about 15 s.
      options.will = { topic: `${ownDevice}/$state`, payload: "lost", ...ATTRIBUTE };
      options.keepalive = 10;
    }
    client = mqtt.connect(url, options);
    client.on("connect", () => {
      if (ownDevice) announce();
      subscribeIn();
      subscribeState();
      maxApi.outlet("status", "connected", url);
    });
    client.on("reconnect", () => maxApi.outlet("status", "reconnecting"));
    client.on("close", () => maxApi.outlet("status", "disconnected"));
    client.on("error", (err) => maxApi.outlet("error", err.message));
    client.on("message", (topic, payload) => {
      maxApi.outlet("message", topic, ...decode(payload));
      const presence = parseState(topic, payload);
      if (presence && updateDevices(...presence)) {
        if (presence[1]) maxApi.outlet("presence", ...presence);
        sendDevices();
      }
      const parsed = parseMidi(topic, payload);
      if (!parsed) return;
      maxApi.outlet("midi", parsed.direction, ...parsed.list);
      if (port && parsed.direction === "in") port.output.sendMessage(parsed.bytes);
    });
  },
  disconnect,
  subscribe: (topic) => {
    if (!client) return maxApi.outlet("error", "not connected");
    client.subscribe(String(topic), { qos });
  },
  unsubscribe: (topic) => {
    if (!client) return;
    client.unsubscribe(String(topic));
  },
  publish: (topic, ...values) => {
    if (!client) return maxApi.outlet("error", "not connected");
    client.publish(String(topic), values.join(" "), { qos, retain });
  },
  // Raw bytes payload, e.g. mqtt-midi: publishbytes remote/in/noteon/1/60 100
  publishbytes: (topic, ...bytes) => {
    if (!client) return maxApi.outlet("error", "not connected");
    client.publish(String(topic), Buffer.from(bytes.map((b) => b & 0xff)), { qos, retain });
  },
  // publishjson <topic> <dict>, e.g. from [dict.pack] -> [prepend publishjson sensors/esp1]
  publishjson: async (topic, ...rest) => {
    if (!client) return maxApi.outlet("error", "not connected");
    const dict = rest[0] === "dictionary" ? await maxApi.getDict(rest[1]).catch(() => null) : rest[0];
    if (dict === null || typeof dict !== "object") return maxApi.outlet("error", "publishjson needs a dict");
    client.publish(String(topic), JSON.stringify(dict), { qos, retain });
  },
  // Takes effect on the next connect.
  name: (id) => {
    clientName = String(id);
  },
  qos: (level) => {
    qos = [0, 1, 2].includes(level) ? level : 0;
  },
  // retain 1 + publish <topic> with no payload clears the retained message on the broker
  retain: (on) => {
    retain = Boolean(on);
  },
  format: (mode) => {
    format = ["bytes", "json"].includes(mode) ? mode : "text";
  },
  // Opens a virtual MIDI port: {prefix}/in/... is subscribed and played on it, MIDI sent to it goes to {prefix}/out/...
  port: (name = "mqtt-max") => {
    openPort(String(name));
    subscribeIn();
  },
  prefix: (name) => {
    if (port && client) client.unsubscribe(`${prefix}/in/#`);
    if (clientName && client) client.unsubscribe(`${prefix}/5/+/$state`);
    prefix = String(name);
    resetDevices();
    subscribeIn();
    subscribeState();
  },
});

const portName = option("port");
if (portName) openPort(portName);
