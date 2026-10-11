const test = require("node:test");
const assert = require("node:assert/strict");
const { MidiStream } = require("../javascript/lib/midi-stream");

function collect(bytes) {
  const messages = [];
  const stream = new MidiStream((message) => messages.push(message));
  for (const byte of bytes) stream.write(byte);
  return messages;
}

test("splits channel messages", () => {
  assert.deepEqual(collect([0x90, 60, 100, 0xc0, 5, 0xe0, 0, 64]), [[0x90, 60, 100], [0xc0, 5], [0xe0, 0, 64]]);
});

test("running status", () => {
  assert.deepEqual(collect([0x90, 60, 100, 62, 100, 64, 0]), [[0x90, 60, 100], [0x90, 62, 100], [0x90, 64, 0]]);
});

test("real-time bytes pass through in the middle of a message", () => {
  assert.deepEqual(collect([0x90, 60, 0xf8, 100]), [[0xf8], [0x90, 60, 100]]);
});

test("SysEx up to its end byte, with real-time bytes inside", () => {
  assert.deepEqual(collect([0xf0, 0x7d, 0xf8, 0x09, 0xf7]), [[0xf8], [0xf0, 0x7d, 0x09, 0xf7]]);
});

test("a status byte ends an unterminated SysEx", () => {
  assert.deepEqual(collect([0xf0, 0x7d, 0x90, 60, 100]), [[0x90, 60, 100]]);
});

test("ignores data without status and invalid bytes", () => {
  assert.deepEqual(collect([60, 100, 300, -1, 0x90, 60, 100]), [[0x90, 60, 100]]);
});

test("system common messages do not keep running status", () => {
  assert.deepEqual(collect([0xf2, 1, 2, 3]), [[0xf2, 1, 2]]);
});
