const maxApi = require("max-api");
const mqtt = require("mqtt");

let client = null;
let format = "text";

function toAtom(s) {
  const n = Number(s);
  return s !== "" && !isNaN(n) ? n : s;
}

function decode(payload) {
  if (format === "bytes") return Array.from(payload);
  return payload.toString("utf8").split(" ").map(toAtom);
}

// mqtt-midi topics: {prefix}/{in|out}/{type}/{channel}[/{note|controller}], payload = raw bytes.
const MIDI_TOPIC = /^.+\/(in|out)\/(noteon|noteoff|cc|program|pitchbend)\/(\d+)(?:\/(\d+))?$/;

function parseMidi(topic, payload) {
  const m = MIDI_TOPIC.exec(topic);
  if (!m || payload.length === 0) return null;
  const [, direction, type, channel, number] = m;
  if (type === "pitchbend") {
    return [direction, type, Number(channel), payload[0] | ((payload[1] ?? 0) << 7)];
  }
  if (type === "program") return [direction, type, Number(channel), payload[0]];
  if (number === undefined) return null;
  return [direction, type, Number(channel), Number(number), payload[0]];
}

function disconnect() {
  if (!client) return;
  client.end();
  client = null;
}

maxApi.addHandlers({
  connect: (url = "mqtt://localhost:1883", username, password) => {
    disconnect();
    client = mqtt.connect(url, { username, password });
    client.on("connect", () => maxApi.outlet("status", "connected", url));
    client.on("reconnect", () => maxApi.outlet("status", "reconnecting"));
    client.on("close", () => maxApi.outlet("status", "disconnected"));
    client.on("error", (err) => maxApi.outlet("error", err.message));
    client.on("message", (topic, payload) => {
      maxApi.outlet("message", topic, ...decode(payload));
      const midi = parseMidi(topic, payload);
      if (midi) maxApi.outlet("midi", ...midi);
    });
  },
  disconnect,
  subscribe: (topic) => {
    if (!client) return maxApi.outlet("error", "not connected");
    client.subscribe(String(topic));
  },
  unsubscribe: (topic) => {
    if (!client) return;
    client.unsubscribe(String(topic));
  },
  publish: (topic, ...values) => {
    if (!client) return maxApi.outlet("error", "not connected");
    client.publish(String(topic), values.join(" "));
  },
  // Raw bytes payload, e.g. mqtt-midi: publishbytes remote/in/noteon/1/60 100
  publishbytes: (topic, ...bytes) => {
    if (!client) return maxApi.outlet("error", "not connected");
    client.publish(String(topic), Buffer.from(bytes.map((b) => b & 0xff)));
  },
  format: (mode) => {
    format = mode === "bytes" ? "bytes" : "text";
  },
});
