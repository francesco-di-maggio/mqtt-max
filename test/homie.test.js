const test = require("node:test");
const assert = require("node:assert/strict");
const { isId, fitNumber, formatValue, parseValue, checkDescription, HomieDevice, HomieController } = require("../javascript/lib/homie");

function fakeClient() {
  const published = [];
  const subscribed = [];
  return {
    published,
    subscribed,
    publish: async (topic, payload, options) => published.push([topic, String(payload), options.qos, options.retain]),
    subscribe: (filter) => subscribed.push(filter),
    unsubscribe: () => {},
  };
}

const DESCRIPTION = {
  name: "Test",
  nodes: {
    motion: { properties: { pitch: { datatype: "float", format: "-180:180", unit: "°", retained: false } } },
    light: { properties: { on: { datatype: "boolean", settable: true }, level: { datatype: "integer", format: "0:100", settable: true } } },
  },
};

test("IDs", () => {
  assert.ok(isId("phone-a1b2"));
  assert.ok(!isId("Phone"));
  assert.ok(!isId("a b"));
  assert.ok(!isId("$state"));
});

test("formats values by datatype", () => {
  assert.equal(formatValue({ datatype: "integer", format: "0:100" }, [42]), "42");
  assert.equal(formatValue({ datatype: "integer", format: "0:100" }, [101]), null);
  assert.equal(formatValue({ datatype: "integer" }, [1.5]), null);
  assert.equal(formatValue({ datatype: "float", format: "-180:180" }, [-12.5]), "-12.5");
  assert.equal(formatValue({ datatype: "float", format: "0:" }, [-1]), null);
  assert.equal(formatValue({ datatype: "boolean" }, [1]), "true");
  assert.equal(formatValue({ datatype: "boolean" }, [0]), "false");
  assert.equal(formatValue({ datatype: "boolean" }, [2]), null);
  assert.equal(formatValue({ datatype: "enum", format: "low,high" }, ["high"]), "high");
  assert.equal(formatValue({ datatype: "enum", format: "low,high" }, ["mid"]), null);
  assert.equal(formatValue({ datatype: "color", format: "rgb,hsv" }, ["rgb", 255, 0, 10]), "rgb,255,0,10");
  assert.equal(formatValue({ datatype: "color", format: "rgb" }, ["hsv", 300, 50, 75]), null);
  assert.equal(formatValue({ datatype: "color", format: "rgb" }, ["rgb", 256, 0, 0]), null);
  assert.equal(formatValue({ datatype: "color", format: "xyz" }, ["xyz", 0.25, 0.34]), "xyz,0.25,0.34");
  assert.equal(formatValue({ datatype: "enum", format: "low,high" }, []), null);
  assert.equal(formatValue({ datatype: "duration" }, ["PT12H5M46S"]), "PT12H5M46S");
  assert.equal(formatValue({ datatype: "duration" }, ["PT"]), null);
  assert.equal(formatValue({ datatype: "datetime" }, ["2026-10-12T10:00:00Z"]), "2026-10-12T10:00:00Z");
  assert.equal(formatValue({ datatype: "datetime" }, ["yesterday"]), null);
  assert.equal(formatValue({ datatype: "string" }, ["hello", "world"]), "hello world");
  assert.equal(formatValue({ datatype: "json" }, [{ a: 1 }]), '{"a":1}');
});

test("parses values by datatype", () => {
  assert.deepEqual(parseValue({ datatype: "float" }, "12.5"), [12.5]);
  assert.deepEqual(parseValue({ datatype: "boolean" }, "true"), [1]);
  assert.deepEqual(parseValue({ datatype: "color" }, "rgb,255,0,10"), ["rgb", 255, 0, 10]);
  assert.deepEqual(parseValue({ datatype: "integer" }, "abc"), ["abc"]);
  assert.deepEqual(parseValue({ datatype: "boolean" }, "maybe"), ["maybe"]);
  assert.deepEqual(parseValue({ datatype: "string" }, "12"), ["12"]);
  assert.deepEqual(parseValue(undefined, "12"), [12]);
});

test("device announces in the order Homie defines", async () => {
  const client = fakeClient();
  const device = new HomieDevice({ client, domain: "remote", id: "max", onSet: () => {} });
  device.setDescription(DESCRIPTION);
  await device.announce();
  const topics = client.published.map(([topic, payload]) => `${topic.slice("remote/5/max/".length)} ${topic.endsWith("$description") ? "" : payload}`.trim());
  assert.deepEqual(topics, ["$state init", "$description", "$state ready"]);
  assert.ok(client.subscribed.includes("remote/5/$broadcast/#"));
  for (const [, , qos, retain] of client.published) assert.deepEqual([qos, retain], [2, true]);
  assert.deepEqual(client.subscribed, ["remote/5/max/light/on/set", "remote/5/max/light/level/set", "remote/5/$broadcast/#"]);
  const description = JSON.parse(client.published[1][1]);
  assert.equal(description.homie, "5.0");
  assert.ok(Number.isInteger(description.version));
});

test("the description version changes with its content only", () => {
  const device = new HomieDevice({ client: fakeClient(), domain: "remote", id: "max", onSet: () => {} });
  device.setDescription(DESCRIPTION);
  const first = device.description.version;
  device.setDescription(DESCRIPTION);
  assert.equal(device.description.version, first);
  device.setDescription({ ...DESCRIPTION, name: "Other" });
  assert.notEqual(device.description.version, first);
});

test("device values: streams non-retained at QoS 0, others retained, invalid ones rejected", async () => {
  const client = fakeClient();
  const device = new HomieDevice({ client, domain: "remote", id: "max", onSet: () => {} });
  device.setDescription(DESCRIPTION);
  await device.announce();
  client.published.length = 0;
  assert.equal(device.setValue("motion", "pitch", [12.5]), null);
  assert.equal(device.setValue("light", "level", [50]), null);
  assert.match(device.setValue("light", "level", [500]), /not a valid/);
  assert.match(device.setValue("motion", "nope", [1]), /no property/);
  assert.deepEqual(client.published, [
    ["remote/5/max/motion/pitch", "12.5", 0, false],
    ["remote/5/max/light/level", "50", 2, true],
  ]);
});

test("device passes /set commands for settable properties only", () => {
  const sets = [];
  const device = new HomieDevice({ client: fakeClient(), domain: "remote", id: "max", onSet: (...args) => sets.push(args) });
  device.setDescription(DESCRIPTION);
  assert.ok(device.handle("remote/5/max/light/on/set", Buffer.from("true")));
  assert.ok(!device.handle("remote/5/max/motion/pitch/set", Buffer.from("1")));
  assert.deepEqual(sets, [["light", "on", [1]]]);
});

test("controller tracks devices, children and values", () => {
  const events = { devices: [], values: [] };
  const controller = new HomieController({
    client: fakeClient(),
    domain: "remote",
    onDevices: (d) => events.devices.push(d),
    onDescription: () => {},
    onValue: (...args) => events.values.push(args),
    onAlert: () => {},
  });
  const msg = (topic, text) => controller.handle(topic, Buffer.from(text));
  msg("remote/5/phone/$state", "ready");
  msg("remote/5/phone/$description", JSON.stringify(DESCRIPTION));
  msg("remote/5/phone/motion/pitch", "12.5");
  msg("remote/5/bridge/$state", "ready");
  msg("remote/5/child/$description", JSON.stringify({ homie: "5.0", version: 1, root: "bridge" }));
  msg("remote/5/child/$state", "ready");
  msg("remote/5/bridge/$state", "lost");
  assert.deepEqual(events.values, [["phone", "motion", "pitch", [12.5]]]);
  assert.deepEqual(events.devices.at(-1), {
    online: ["phone"],
    offline: ["bridge", "child"],
    count: 1,
    states: { bridge: "lost", child: "lost", phone: "ready" },
  });
  msg("remote/5/phone/$state", "");
  assert.deepEqual(events.devices.at(-1).online, []);
  assert.ok(!msg("other/5/phone/$state", "ready"));
});

test("controller for all domains names devices with their domain", () => {
  const events = [];
  const controller = new HomieController({ client: fakeClient(), domain: "+", onDevices: (d) => events.push(d), onDescription: () => {}, onValue: () => {}, onAlert: () => {} });
  controller.handle("remote/5/phone/$state", Buffer.from("ready"));
  controller.handle("homie/5/lamp/$state", Buffer.from("ready"));
  assert.deepEqual(events.at(-1).online, ["homie/lamp", "remote/phone"]);
});

test("controller sets settable properties without retaining", () => {
  const client = fakeClient();
  const controller = new HomieController({ client, domain: "remote", onDevices: () => {}, onDescription: () => {}, onValue: () => {}, onAlert: () => {} });
  controller.handle("remote/5/lamp/$state", Buffer.from("ready"));
  controller.handle("remote/5/lamp/$description", Buffer.from(JSON.stringify(DESCRIPTION)));
  assert.equal(controller.set("lamp", "light", "level", [30]), null);
  assert.match(controller.set("lamp", "motion", "pitch", [1]), /no settable/);
  assert.deepEqual(client.published, [["remote/5/lamp/light/level/set", "30", 2, false]]);
});

test("device reports its states and broadcasts", async () => {
  const states = [];
  const broadcasts = [];
  const device = new HomieDevice({
    client: fakeClient(), domain: "remote", id: "max", onSet: () => {},
    onState: (s) => states.push(s), onBroadcast: (...args) => broadcasts.push(args),
  });
  await device.announce();
  await device.publishState("sleeping");
  assert.deepEqual(states, ["init", "ready", "sleeping"]);
  assert.ok(device.handle("remote/5/$broadcast/alert/all", Buffer.from("hello everyone")));
  assert.ok(!device.handle("other/5/$broadcast/alert", Buffer.from("x")));
  assert.deepEqual(broadcasts, [["alert/all", "hello everyone"]]);
});

test("numbers round to the step as the spec describes", () => {
  assert.equal(fitNumber(5, "0:10:2"), 6);
  assert.equal(fitNumber(5, ":10:2"), 6);
  assert.equal(fitNumber(12, "0:10:2"), null);
  assert.equal(fitNumber(0.34, "0:1:0.1"), 0.3);
  assert.equal(fitNumber(7, "::5", 1), 6);
  assert.equal(formatValue({ datatype: "integer", format: "0:10:2" }, [5]), "6");
});

test("descriptions with invalid IDs or datatypes are rejected", () => {
  assert.equal(checkDescription({ nodes: { light: { properties: { level: { datatype: "integer" } } } } }), null);
  assert.match(checkDescription({ nodes: { Light: {} } }), /node ID/);
  assert.match(checkDescription({ nodes: { light: { properties: { Level: { datatype: "integer" } } } } }), /property ID/);
  assert.match(checkDescription({ nodes: { light: { properties: { level: { datatype: "number" } } } } }), /datatype/);
  assert.match(checkDescription({ nodes: { light: { properties: { mode: { datatype: "enum" } } } } }), /format/);
  const device = new HomieDevice({ client: fakeClient(), domain: "remote", id: "max", onSet: () => {} });
  assert.match(device.setDescription({ nodes: { Light: {} } }), /node ID/);
});

test("controller subscribes to the values of discovered devices only", () => {
  const client = fakeClient();
  const unsubscribed = [];
  client.unsubscribe = (f) => unsubscribed.push(f);
  const controller = new HomieController({ client, domain: "remote", onDevices: () => {}, onDescription: () => {}, onValue: () => {}, onAlert: () => {} });
  controller.start();
  assert.deepEqual(client.subscribed, ["remote/5/+/$state", "remote/5/+/$description"]);
  controller.handle("remote/5/lamp/$state", Buffer.from("ready"));
  assert.deepEqual(client.subscribed.at(-1), "remote/5/lamp/+/+");
  assert.ok(!controller.handle("remote/5/stranger/light/level", Buffer.from("1")));
  controller.handle("remote/5/lamp/$state", Buffer.from(""));
  assert.deepEqual(unsubscribed, ["remote/5/lamp/+/+"]);
});

test("an announcement interrupted by stop does not report ready", async () => {
  const states = [];
  let release;
  const client = fakeClient();
  client.publish = (topic, payload) => (payload === "init" ? new Promise((r) => (release = r)) : Promise.resolve());
  const device = new HomieDevice({ client, domain: "remote", id: "max", onSet: () => {}, onState: (s) => states.push(s) });
  const announcing = device.announce();
  device.stop();
  release();
  await announcing;
  assert.deepEqual(states, ["init", "disconnected"]);
});

test("controller reports device logs", () => {
  const logs = [];
  const controller = new HomieController({ client: fakeClient(), domain: "remote", onDevices: () => {}, onDescription: () => {}, onValue: () => {}, onAlert: () => {}, onLog: (...a) => logs.push(a) });
  controller.handle("remote/5/lamp/$state", Buffer.from("ready"));
  assert.ok(controller.handle("remote/5/lamp/$log/info", Buffer.from("hello")));
  assert.ok(controller.handle("remote/5/lamp/$log/verbose", Buffer.from("ignored")));
  assert.deepEqual(logs, [["lamp", "info", "hello"]]);
});
