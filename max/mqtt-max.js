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
// Presence: with a name, {prefix}/status/{name} is "online" while connected and "offline" after (retained, QoS 1).
let clientName = option("name") ?? null;
// The status topic of the current connection, fixed at connect so that its online, offline and will match.
let ownStatus = null;

const statusTopic = () => `${prefix}/status/${clientName}`;
const STATUS_OPTIONS = { qos: 1, retain: true };

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

// With a name, every client with a retained status under {prefix}/status/+ comes out as
//   presence <name> online|offline   on each change
//   clients <dict>                   { online: [...], offline: [...], count }, count = number online
let clients = new Map();

function subscribeStatus() {
  if (clientName && client?.connected) client.subscribe(`${prefix}/status/+`, { qos: 1 });
}

function parsePresence(topic, payload) {
  const base = `${prefix}/status/`;
  if (!clientName || !topic.startsWith(base)) return null;
  return [topic.slice(base.length), payload.toString("utf8")];
}

// An empty payload deletes the retained status, and with it the client.
function updateClients(name, state) {
  const known = clients.get(name);
  if (state === "") return clients.delete(name);
  const online = state === "online";
  if (known === online) return false;
  clients.set(name, online);
  return true;
}

function sendClients() {
  const names = [...clients.keys()].sort();
  const online = names.filter((name) => clients.get(name));
  const offline = names.filter((name) => !clients.get(name));
  maxApi.outlet("clients", { online, offline, count: online.length });
}

function resetClients() {
  clients = new Map();
  if (clientName) sendClients();
}

function disconnect() {
  if (!client) return;
  if (ownStatus && client.connected) client.publish(ownStatus, "offline", STATUS_OPTIONS);
  client.removeAllListeners("message");
  client.end();
  client = null;
  ownStatus = null;
  resetClients();
}

maxApi.addHandlers({
  connect: (url = "mqtt://localhost:1883", username, password) => {
    disconnect();
    const options = { username, password };
    ownStatus = clientName ? statusTopic() : null;
    if (ownStatus) {
      // The broker publishes the will when the connection drops without a disconnect;
      // keepalive 10 s detects a silent drop in about 15 s.
      options.will = { topic: ownStatus, payload: "offline", ...STATUS_OPTIONS };
      options.keepalive = 10;
    }
    client = mqtt.connect(url, options);
    client.on("connect", () => {
      if (ownStatus) client.publish(ownStatus, "online", STATUS_OPTIONS);
      subscribeIn();
      subscribeStatus();
      maxApi.outlet("status", "connected", url);
    });
    client.on("reconnect", () => maxApi.outlet("status", "reconnecting"));
    client.on("close", () => maxApi.outlet("status", "disconnected"));
    client.on("error", (err) => maxApi.outlet("error", err.message));
    client.on("message", (topic, payload) => {
      maxApi.outlet("message", topic, ...decode(payload));
      const presence = parsePresence(topic, payload);
      if (presence && updateClients(...presence)) {
        if (presence[1]) maxApi.outlet("presence", ...presence);
        sendClients();
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
    if (clientName && client) client.unsubscribe(`${prefix}/status/+`);
    prefix = String(name);
    resetClients();
    subscribeIn();
    subscribeStatus();
  },
});

const portName = option("port");
if (portName) openPort(portName);
