// The mqtt-midi convention (@grantler-instruments/mqtt-midi): channel and message type in the topic,
// compact binary payloads, SysEx as JSON.
//   {prefix}/{in|out}/{noteon|noteoff|cc}/{channel}/{note|controller}   1 byte
//   {prefix}/{in|out}/program/{channel}                                 1 byte
//   {prefix}/{in|out}/pitchbend/{channel}                               2 bytes, lsb msb
//   {prefix}/{in|out}/{clock|start|continue|stop}                       empty
//   {prefix}/{in|out}/sysex                                             JSON { "data": [0xf0, ..., 0xf7] }
// Channels are 1-16.

const CHANNEL = { noteoff: 0x80, noteon: 0x90, cc: 0xb0, program: 0xc0, pitchbend: 0xe0 };
const CHANNEL_TYPE = Object.fromEntries(Object.entries(CHANNEL).map(([type, status]) => [status, type]));
const SYSTEM = { clock: 0xf8, start: 0xfa, continue: 0xfb, stop: 0xfc };
const SYSTEM_TYPE = Object.fromEntries(Object.entries(SYSTEM).map(([type, status]) => [status, type]));
const SYSEX_START = 0xf0;
const SYSEX_END = 0xf7;
const DIRECTIONS = ["in", "out"];

const toInt = (s) => (/^\d+$/.test(s ?? "") ? Number(s) : NaN);
const isChannel = (n) => n >= 1 && n <= 16;
const isData = (n) => Number.isInteger(n) && n >= 0 && n <= 127;
const isByte = (n) => Number.isInteger(n) && n >= 0 && n <= 255;

function parseSysex(payload) {
  try {
    const { data } = JSON.parse(payload.toString("utf8"));
    if (!Array.isArray(data) || data.length < 2 || !data.every(isByte)) return null;
    if (data[0] !== SYSEX_START || data[data.length - 1] !== SYSEX_END) return null;
    return data;
  } catch {
    return null;
  }
}

// Topic + payload -> { direction, bytes } with the complete MIDI message, or null if it is not valid mqtt-midi.
function parse(prefix, topic, payload) {
  if (!topic.startsWith(`${prefix}/`)) return null;
  const parts = topic.slice(prefix.length + 1).split("/");
  const [direction, type] = parts;
  if (!DIRECTIONS.includes(direction)) return null;
  if (type === "sysex") {
    const bytes = parts.length === 2 ? parseSysex(payload) : null;
    return bytes && { direction, bytes };
  }
  if (type in SYSTEM) return parts.length === 2 ? { direction, bytes: [SYSTEM[type]] } : null;
  if (!(type in CHANNEL)) return null;
  const channel = toInt(parts[2]);
  const data = Array.from(payload);
  if (!isChannel(channel) || !data.every(isData)) return null;
  const status = CHANNEL[type] | (channel - 1);
  if (type === "pitchbend" || type === "program") {
    const length = type === "pitchbend" ? 2 : 1;
    return parts.length === 3 && data.length === length ? { direction, bytes: [status, ...data] } : null;
  }
  const number = toInt(parts[3]);
  if (parts.length !== 4 || !isData(number) || data.length !== 1) return null;
  return { direction, bytes: [status, number, data[0]] };
}

// A complete MIDI message -> [topic, payload], or null for messages mqtt-midi does not define.
// Note on with velocity 0 is a note off, as MIDI defines it.
function format(prefix, direction, bytes) {
  const [status, data1, data2] = bytes;
  if (status === SYSEX_START) return [`${prefix}/${direction}/sysex`, Buffer.from(JSON.stringify({ data: bytes }))];
  if (status in SYSTEM_TYPE) return [`${prefix}/${direction}/${SYSTEM_TYPE[status]}`, Buffer.alloc(0)];
  let type = CHANNEL_TYPE[status & 0xf0];
  if (!type) return null;
  if (type === "noteon" && data2 === 0) type = "noteoff";
  const base = `${prefix}/${direction}/${type}/${(status & 0x0f) + 1}`;
  if (type === "pitchbend") return [base, Buffer.from([data1, data2])];
  if (type === "program") return [base, Buffer.from([data1])];
  return [`${base}/${data1}`, Buffer.from([data2])];
}

const opposite = (direction) => (direction === "in" ? "out" : "in");

module.exports = { DIRECTIONS, parse, format, opposite };
