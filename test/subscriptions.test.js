const test = require("node:test");
const assert = require("node:assert/strict");
const { Subscriptions } = require("../javascript/lib/subscriptions");

function fakeClient() {
  const calls = [];
  return {
    calls,
    subscribe: (filter, { qos }) => calls.push(["subscribe", filter, qos]),
    unsubscribe: (filter) => calls.push(["unsubscribe", filter]),
  };
}

test("one owner leaving does not cut off another", () => {
  const client = fakeClient();
  const subs = new Subscriptions(client);
  subs.add("client", "remote/in/#");
  subs.add("midi 1", "remote/in/#");
  subs.remove("client", "remote/in/#");
  assert.deepEqual(client.calls, [["subscribe", "remote/in/#", 0]]);
  subs.remove("midi 1", "remote/in/#");
  assert.deepEqual(client.calls.at(-1), ["unsubscribe", "remote/in/#"]);
});

test("the broker gets the highest QoS asked for", () => {
  const client = fakeClient();
  const subs = new Subscriptions(client);
  subs.add("a", "t", 0);
  subs.add("b", "t", 2);
  subs.remove("b", "t");
  assert.deepEqual(client.calls, [["subscribe", "t", 0], ["subscribe", "t", 2], ["subscribe", "t", 0]]);
});

test("owns and restore", () => {
  const client = fakeClient();
  const subs = new Subscriptions(client);
  subs.add("client", "a/#", 1);
  assert.ok(subs.owns("client", "a/b"));
  assert.ok(!subs.owns("midi 1", "a/b"));
  client.calls.length = 0;
  subs.restore();
  assert.deepEqual(client.calls, [["subscribe", "a/#", 1]]);
});
