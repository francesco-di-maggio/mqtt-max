const test = require("node:test");
const assert = require("node:assert/strict");
const { decode, encodeText, encodeBytes } = require("../javascript/lib/payload");

test("decodes text into Max atoms", () => {
  assert.deepEqual(decode(Buffer.from("1 2.5 hello"), "text"), [1, 2.5, "hello"]);
  assert.deepEqual(decode(Buffer.from(""), "text"), []);
});

test("decodes bytes", () => {
  assert.deepEqual(decode(Buffer.from([64, 0, 255]), "bytes"), [64, 0, 255]);
});

test("decodes JSON objects, other JSON as text", () => {
  assert.deepEqual(decode(Buffer.from('{"temp": 21}'), "json"), [{ temp: 21 }]);
  assert.deepEqual(decode(Buffer.from("[1, 2]"), "json"), ["[1,", "2]"]);
});

test("encodes atoms as text and a dict as JSON", () => {
  assert.equal(encodeText([1, 2, "three"]), "1 2 three");
  assert.equal(encodeText([{ temp: 21 }]), '{"temp":21}');
  assert.deepEqual(encodeBytes([1, 256, 255]), Buffer.from([1, 0, 255]));
});
