const test = require("node:test");
const assert = require("node:assert/strict");
const { matches } = require("../javascript/lib/topic");

test("matches MQTT topic filters", () => {
  assert.ok(matches("a/b", "a/b"));
  assert.ok(!matches("a/b", "a/c"));
  assert.ok(matches("a/+", "a/b"));
  assert.ok(!matches("a/+", "a/b/c"));
  assert.ok(matches("a/#", "a/b/c"));
  assert.ok(matches("a/#", "a"));
  assert.ok(matches("#", "a/b"));
  assert.ok(matches("+/5/+/$state", "remote/5/phone/$state"));
  assert.ok(!matches("a/b/c", "a/b"));
});

test("first-level wildcards do not match $ topics", () => {
  assert.ok(!matches("#", "$SYS/broker"));
  assert.ok(!matches("+/broker", "$SYS/broker"));
  assert.ok(matches("$SYS/#", "$SYS/broker"));
});
