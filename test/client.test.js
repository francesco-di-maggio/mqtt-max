// mqtt.client.js end to end: [mqtt.send], [mqtt.receive] and the Homie objects as Max drives them,
// through a stand-in for max-api, against a local broker.
const test = require("node:test");
const assert = require("node:assert/strict");
const Module = require("node:module");
const { Broker } = require("../javascript/lib/broker");

const PORT = 18800 + Math.floor(Math.random() * 90);
const wait = (ms) => new Promise((r) => setTimeout(r, ms));

const outlets = [];
const dicts = { d1: { a: 1, b: [2, 3] } };
let handlers = {};
const maxApi = {
  addHandlers: (h) => (handlers = h),
  outlet: (...args) => outlets.push(args),
  getDict: async (name) => (name in dicts ? dicts[name] : Promise.reject(new Error("no dict"))),
};
const load = Module._load;
Module._load = function (request, ...rest) {
  return request === "max-api" ? maxApi : load.call(this, request, ...rest);
};
require("../javascript/mqtt.client.js");

// What one object received: its role's outlets, without role and id.
const out = (role, id) => outlets.filter((o) => o[0] === role && o[1] === id).map((o) => o.slice(2));
const sender = (id, ...args) => handlers.sender(id, ...args);
const receiver = (id, ...args) => handlers.receiver(id, ...args);

let broker;
test.before(async () => {
  broker = new Broker({ onListening() {}, onStopped() {}, onClient() {}, onError() {} });
  await broker.start({ port: PORT, tlsport: 0, wsport: 0, wssport: 0 });
  handlers.connect(`mqtt://localhost:${PORT}`);
  await wait(300);
});
test.after(async () => {
  await handlers.disconnect();
  await broker.stop();
});

test("send and receive: numbers, text, an empty message, a dict", async () => {
  receiver("r1", "topic", "t/value");
  receiver("r1", "register");
  receiver("r2", "topic", "t/dict");
  receiver("r2", "format", "json");
  receiver("r2", "register");
  sender("s1", "topic", "t/value");
  sender("s2", "topic", "t/dict");
  await wait(200);
  sender("s1", "value", 0.5);
  sender("s1", "value", "foo", 2, "bar");
  sender("s1", "value", "bang");
  sender("s2", "value", "dictionary", "d1");
  await wait(300);
  assert.deepEqual(out("receiver", "r1"), [["message", 0.5], ["message", "foo", 2, "bar"], ["message"]]);
  assert.deepEqual(out("receiver", "r2"), [["message", { a: 1, b: [2, 3] }]]);
});

test("a wildcard filter puts the topic first", async () => {
  receiver("r3", "topic", "w/+");
  receiver("r3", "register");
  sender("s3", "topic", "w/a");
  await wait(200);
  sender("s3", "value", 1);
  await wait(300);
  assert.deepEqual(out("receiver", "r3"), [["message", "w/a", 1]]);
});

test("a receiver created later gets the retained message, also on a filter already subscribed", async () => {
  receiver("r4", "topic", "s/state");
  receiver("r4", "register");
  sender("s4", "topic", "s/state");
  sender("s4", "retain", 1);
  await wait(200);
  sender("s4", "value", 7);
  await wait(300);
  receiver("r5", "topic", "s/state");
  receiver("r5", "register");
  await wait(300);
  assert.deepEqual(out("receiver", "r5"), [["message", 7]]);
});

test("@retained 0 skips the stored message and outputs new ones", async () => {
  sender("s9", "topic", "k/state");
  sender("s9", "retain", 1);
  await wait(200);
  sender("s9", "value", 3);
  await wait(300);
  receiver("r9", "topic", "k/state");
  receiver("r9", "retained", 0);
  receiver("r9", "register");
  await wait(300);
  sender("s9", "value", 4);
  await wait(300);
  assert.deepEqual(out("receiver", "r9"), [["message", 4]]);
});

test("send reads topic and retain on arrival, not after", async () => {
  receiver("r6", "topic", "o/#");
  receiver("r6", "register");
  sender("s6", "topic", "o/first");
  await wait(200);
  sender("s6", "value", 1);
  sender("s6", "topic", "o/second");
  sender("s6", "value", 2);
  await wait(300);
  assert.deepEqual(out("receiver", "r6"), [["message", "o/first", 1], ["message", "o/second", 2]]);
});

test("@format bytes sends raw bytes and refuses anything else", async () => {
  receiver("r8", "topic", "b/x");
  receiver("r8", "format", "bytes");
  receiver("r8", "register");
  sender("s8", "topic", "b/x");
  sender("s8", "format", "bytes");
  await wait(200);
  sender("s8", "value", 0, 127, 255);
  sender("s8", "value", 300);
  await wait(300);
  assert.deepEqual(out("receiver", "r8"), [["message", 0, 127, 255]]);
  assert.deepEqual(out("sender", "s8"), [["dumpout", "error", "bytes are integers 0-255"]]);
});

test("send refuses a missing topic and a wildcard", () => {
  sender("s7", "value", 1);
  sender("s7", "topic", "x/+");
  assert.deepEqual(out("sender", "s7"), [
    ["dumpout", "error", "no topic: [mqtt.send <client> <topic>]"],
    ["dumpout", "error", "topic without + or #"],
  ]);
});

test("Homie: a controller sets a device's property; digit IDs reach Max as numbers", async () => {
  const description = { nodes: { slider: { properties: { 1: { datatype: "float", format: "0:1", settable: true } } } } };
  handlers.device("d", "id", "synth");
  handlers.device("d", "domain", "test-domain");
  handlers.device("d", "description", description);
  handlers.device("d", "register");
  handlers.controller("c", "domain", "test-domain");
  handlers.controller("c", "register");
  await wait(600);
  handlers.device("d", "value", "slider", "1", 0.25);
  await wait(300);
  handlers.controller("c", "set", "synth", "slider", "1", 0.75);
  await wait(300);
  assert.deepEqual(out("device", "d").filter((o) => o[0] === "set"), [["set", "slider", 1, 0.75]]);
  assert.ok(out("controller", "c").some((o) => o[0] === "value" && o[1] === "synth" && o[2] === "slider" && o[3] === 1 && o[4] === 0.25));
});
