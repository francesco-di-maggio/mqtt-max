// [mqtt.broker]: an MQTT broker in Max. Devices connect to this computer: mqtt://, mqtts://, ws:// or wss://.

const maxApi = require("max-api");
const { Broker, addresses } = require("./lib/broker");

// Port 1883 is MQTT's registered port; 0 turns a listener off.
const settings = { port: 1883, tlsport: 0, wsport: 0, wssport: 0, key: "", cert: "", username: "", password: "" };
let started = false;

const dumpout = (...args) => maxApi.outlet("dumpout", ...args);
const error = (text) => dumpout("error", text);

const broker = new Broker({
  onListening: (listeners) => {
    dumpout("status", "listening", ...listeners.flat());
    for (const host of addresses()) for (const [scheme, port] of listeners) dumpout("address", `${scheme}://${host}:${port}`);
    dumpout("clients", 0);
  },
  onStopped: () => dumpout("status", "stopped"),
  onClient: (event, ...args) => {
    maxApi.outlet("client", event, ...args);
    if (event === "connected" || event === "disconnected") dumpout("clients", broker.clients().length);
  },
  onError: error,
});

// Starts and stops run one after another. Settings changed while a restart is pending
// join that restart, which uses the settings as they are when it runs.
let queue = Promise.resolve();
let pending = false;

function run(action) {
  queue = queue.then(action, action);
  return queue;
}

function start() {
  started = true;
  if (pending) return queue;
  pending = true;
  return run(() => {
    pending = false;
    return broker.start(settings);
  });
}

// A setting changed while running restarts the broker with it.
function set(key, value) {
  settings[key] = value;
  if (started) return start();
}

const port = (key) => (value) => {
  const n = Number(value);
  if (!Number.isInteger(n) || n < 0 || n > 65535) return error(`${key} is a port number 0-65535, 0 for off`);
  return set(key, n);
};
const text = (key) => (value = "") => set(key, String(value));

maxApi.addHandlers({
  start,
  stop: () => {
    started = false;
    return run(() => broker.stop());
  },
  clients: () => dumpout("clients", broker.clients().length, ...broker.clients()),
  port: port("port"),
  tlsport: port("tlsport"),
  wsport: port("wsport"),
  wssport: port("wssport"),
  key: text("key"),
  cert: text("cert"),
  username: text("username"),
  password: text("password"),
});

// Settings arrive from the abstraction after "ready", then "start".
maxApi.outlet("ready");
