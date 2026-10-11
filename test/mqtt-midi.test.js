const test = require("node:test");
const assert = require("node:assert/strict");
const { parse, format, opposite } = require("../javascript/lib/mqtt-midi");

const bytes = (...b) => Buffer.from(b);

test("parses every message type", () => {
  assert.deepEqual(parse("remote", "remote/in/noteon/1/60", bytes(100)), { direction: "in", bytes: [0x90, 60, 100] });
  assert.deepEqual(parse("remote", "remote/in/noteoff/16/60", bytes(0)), { direction: "in", bytes: [0x8f, 60, 0] });
  assert.deepEqual(parse("remote", "remote/out/cc/2/7", bytes(64)), { direction: "out", bytes: [0xb1, 7, 64] });
  assert.deepEqual(parse("remote", "remote/in/program/1", bytes(5)), { direction: "in", bytes: [0xc0, 5] });
  assert.deepEqual(parse("remote", "remote/in/pitchbend/1", bytes(0, 64)), { direction: "in", bytes: [0xe0, 0, 64] });
  assert.deepEqual(parse("remote", "remote/in/clock", bytes()), { direction: "in", bytes: [0xf8] });
  assert.deepEqual(parse("remote", "remote/in/stop", bytes()), { direction: "in", bytes: [0xfc] });
  const sysex = Buffer.from(JSON.stringify({ data: [0xf0, 0x7d, 0x09, 0xf7] }));
  assert.deepEqual(parse("remote", "remote/in/sysex", sysex), { direction: "in", bytes: [0xf0, 0x7d, 0x09, 0xf7] });
});

test("rejects what mqtt-midi does not define", () => {
  assert.equal(parse("remote", "other/in/cc/1/7", bytes(1)), null);
  assert.equal(parse("remote", "remote/sideways/cc/1/7", bytes(1)), null);
  assert.equal(parse("remote", "remote/in/cc/0/7", bytes(1)), null);
  assert.equal(parse("remote", "remote/in/cc/17/7", bytes(1)), null);
  assert.equal(parse("remote", "remote/in/cc/1/128", bytes(1)), null);
  assert.equal(parse("remote", "remote/in/cc/1/7", bytes(128)), null);
  assert.equal(parse("remote", "remote/in/cc/1/7", bytes(1, 2)), null);
  assert.equal(parse("remote", "remote/in/pitchbend/1", bytes(1)), null);
  assert.equal(parse("remote", "remote/in/sysex", Buffer.from('{"data":[1,2]}')), null);
  assert.equal(parse("remote", "remote/in/sysex", Buffer.from("not json")), null);
  assert.equal(parse("remote", "remote/in/clock/extra", bytes()), null);
});

test("formats MIDI messages as the inverse of parse", () => {
  for (const message of [[0x90, 60, 100], [0xb1, 7, 64], [0xc0, 5], [0xe0, 0, 64], [0xf8], [0xf0, 0x7d, 0xf7]]) {
    const [topic, payload] = format("remote", "out", message);
    assert.deepEqual(parse("remote", topic, payload).bytes, message);
  }
});

test("note on with velocity 0 is a note off", () => {
  assert.deepEqual(format("remote", "out", [0x90, 60, 0]), ["remote/out/noteoff/1/60", bytes(0)]);
});

test("drops messages mqtt-midi has no topic for", () => {
  assert.equal(format("remote", "out", [0xa0, 60, 10]), null);
  assert.equal(format("remote", "out", [0xd0, 10]), null);
  assert.equal(format("remote", "out", [0xf6]), null);
});

test("opposite direction", () => {
  assert.equal(opposite("in"), "out");
  assert.equal(opposite("out"), "in");
});
