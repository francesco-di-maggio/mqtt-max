const test = require("node:test");
const assert = require("node:assert/strict");
const mqtt = require("../javascript/node_modules/mqtt");
const { Broker } = require("../javascript/lib/broker");

const PORT = 18900 + Math.floor(Math.random() * 90);
const URL = `mqtt://localhost:${PORT}`;

function quiet() {
  const events = [];
  return { events, handlers: { onListening: (l) => events.push(["listening", l]), onStopped: () => events.push(["stopped"]), onClient: (...a) => events.push(a), onError: (e) => events.push(["error", e]) } };
}

function connect(options = {}) {
  return new Promise((resolve) => {
    const client = mqtt.connect(URL, { reconnectPeriod: 0, connectTimeout: 3000, ...options });
    client.once("connect", () => resolve({ client, ok: true }));
    client.once("error", (err) => resolve({ client, ok: false, error: err.message }));
  });
}

const wait = (ms) => new Promise((r) => setTimeout(r, ms));

test("relays messages, keeps retained messages and publishes last wills", async () => {
  const { events, handlers } = quiet();
  const broker = new Broker(handlers);
  await broker.start({ port: PORT, tlsport: 0, wsport: 0, wssport: 0 });
  assert.deepEqual(events[0], ["listening", [["mqtt", PORT]]]);
  const a = await connect({ clientId: "a" });
  const b = await connect({ clientId: "b" });
  const received = [];
  b.client.on("message", (topic, payload) => received.push(`${topic}=${payload}`));
  await b.client.subscribeAsync("t/#");
  await a.client.publishAsync("t/hello", "world", { qos: 1 });
  await a.client.publishAsync("t/kept", "retained", { qos: 1, retain: true });
  await wait(100);
  assert.deepEqual(received, ["t/hello=world", "t/kept=retained"]);
  const late = await connect({ clientId: "late" });
  const retained = new Promise((resolve) => late.client.on("message", (t, p, packet) => resolve([t, String(p), packet.retain])));
  await late.client.subscribeAsync("t/kept");
  assert.deepEqual(await retained, ["t/kept", "retained", true]);
  const will = new Promise((resolve) => b.client.on("message", (t, p) => t === "w/x" && resolve(String(p))));
  await b.client.subscribeAsync("w/x");
  const dropper = await connect({ clientId: "dropper", will: { topic: "w/x", payload: "gone", qos: 1 } });
  dropper.client.stream.destroy();
  assert.equal(await will, "gone");
  assert.deepEqual(broker.clients(), ["a", "b", "late"]);
  assert.ok(events.some((e) => e[0] === "subscribe" && e[1] === "b" && e[2] === "t/#"));
  for (const c of [a, b, late]) c.client.end(true);
  await broker.stop();
});

test("refuses a wrong login with return code 4", async () => {
  const { handlers } = quiet();
  const broker = new Broker(handlers);
  await broker.start({ port: PORT, tlsport: 0, wsport: 0, wssport: 0, username: "max", password: "secret" });
  const wrong = await connect({ username: "max", password: "wrong" });
  const none = await connect();
  const right = await connect({ username: "max", password: "secret" });
  assert.equal(wrong.ok, false);
  assert.match(wrong.error, /Bad username or password/);
  assert.equal(none.ok, false);
  assert.equal(right.ok, true);
  right.client.end(true);
  await broker.stop();
});

test("stops at once with clients connected; reports a busy port", async () => {
  const { events, handlers } = quiet();
  const broker = new Broker(handlers);
  await broker.start({ port: PORT, tlsport: 0, wsport: 0, wssport: 0 });
  const a = await connect();
  const started = Date.now();
  await broker.stop();
  assert.ok(Date.now() - started < 1000);
  a.client.end(true);
  const blocker = new Broker(quiet().handlers);
  await blocker.start({ port: PORT, tlsport: 0, wsport: 0, wssport: 0 });
  await broker.start({ port: PORT, tlsport: 0, wsport: 0, wssport: 0 });
  assert.deepEqual(events.at(-1), ["error", `port ${PORT} is already in use`]);
  await blocker.stop();
});
