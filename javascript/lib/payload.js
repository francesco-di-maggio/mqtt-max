// MQTT payloads <-> Max atoms. MQTT payloads are bytes; text, bytes and JSON are interpretations of them.

const FORMATS = ["text", "bytes", "json"];

function toAtom(word) {
  const n = Number(word);
  return word !== "" && !Number.isNaN(n) ? n : word;
}

function isObject(value) {
  return value !== null && typeof value === "object" && !Array.isArray(value);
}

function parseJson(text) {
  try {
    const value = JSON.parse(text);
    return isObject(value) ? value : null;
  } catch {
    return null;
  }
}

// format json: a JSON object becomes a dict, anything else falls back to text.
function decode(payload, format) {
  if (format === "bytes") return Array.from(payload);
  const text = payload.toString("utf8");
  if (text === "") return [];
  const json = format === "json" ? parseJson(text) : null;
  if (json) return [json];
  return text.split(" ").map(toAtom);
}

// Atoms are joined with spaces; a dict (a JS object from max-api) is sent as JSON.
function encodeText(atoms) {
  if (atoms.length === 1 && isObject(atoms[0])) return JSON.stringify(atoms[0]);
  return atoms.join(" ");
}

function encodeBytes(atoms) {
  return Buffer.from(atoms.map((b) => Number(b) & 0xff));
}

module.exports = { FORMATS, decode, encodeText, encodeBytes, isObject, toAtom };
