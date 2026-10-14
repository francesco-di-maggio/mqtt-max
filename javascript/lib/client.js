// One MQTT connection (MQTT.js, MQTT 3.1.1).

const mqtt = require("mqtt");

class Client {
  // events: { onStatus(state), onError(text), onMessage(topic, payload, retained), onConnect() }
  constructor(events) {
    this.events = events;
    this.mqtt = null;
  }

  get connected() {
    return Boolean(this.mqtt?.connected);
  }

  // Connected, connecting or reconnecting.
  get active() {
    return this.mqtt !== null;
  }

  // settings: { url, username, password, clientid, keepalive, clean, will }
  connect(settings) {
    this.close();
    const options = {
      username: settings.username || undefined,
      password: settings.password || undefined,
      keepalive: settings.keepalive,
      clean: settings.clean,
      will: settings.will || undefined,
    };
    if (settings.clientid) options.clientId = settings.clientid;
    let connection;
    try {
      connection = mqtt.connect(settings.url, options);
    } catch (err) {
      return this.events.onError(`${settings.url}: ${err.message}`);
    }
    this.mqtt = connection;
    connection.on("connect", () => {
      this.events.onStatus("connected");
      this.events.onConnect();
    });
    connection.on("reconnect", () => this.events.onStatus("reconnecting"));
    connection.on("close", () => this.events.onStatus("disconnected"));
    connection.on("error", (err) => this.events.onError(err.message));
    // retained: the broker sends a stored message because of a new subscription (MQTT 3.1.1, 3.3.1.3).
    connection.on("message", (topic, payload, packet) => this.events.onMessage(topic, payload, packet.retain));
  }

  // Resolves once delivered for QoS 1 and 2, at once for QoS 0, without waiting while disconnected.
  publish(topic, payload, options = {}) {
    if (!this.connected) return Promise.resolve();
    return this.mqtt.publishAsync(topic, payload, options).catch((err) => this.events.onError(err.message));
  }

  // MQTT.js subscribes again by itself after a reconnect.
  subscribe(topic, options = {}) {
    if (this.connected) this.mqtt.subscribe(topic, options, (err) => err && this.events.onError(`subscribe ${topic}: ${err.message}`));
  }

  // Subscribing again makes the broker send the filter's retained messages once more (MQTT 3.1.1, 3.8.4).
  // MQTT.js skips filters it already subscribed to, unless asked with resubscribe.
  resubscribe(topic, options = {}) {
    if (this.connected) this.mqtt.subscribe({ [topic]: { qos: options.qos ?? 0 }, resubscribe: true }, (err) => err && this.events.onError(`subscribe ${topic}: ${err.message}`));
  }

  unsubscribe(topic) {
    if (this.connected) this.mqtt.unsubscribe(topic, (err) => err && this.events.onError(`unsubscribe ${topic}: ${err.message}`));
  }

  // last: an optional final publish, e.g. a Homie "disconnected", delivered before the connection closes.
  async disconnect(last) {
    const connection = this.mqtt;
    if (!connection) return;
    this.mqtt = null;
    connection.removeAllListeners("message");
    if (last && connection.connected) await connection.publishAsync(last.topic, last.payload, last.options).catch(() => {});
    // QoS 1 and 2 acknowledgements still in flight fail once the connection closes; they no longer matter.
    connection.removeAllListeners("error");
    connection.on("error", () => {});
    await connection.endAsync();
  }

  close() {
    if (!this.mqtt) return;
    this.mqtt.removeAllListeners();
    this.mqtt.end(true);
    this.mqtt = null;
  }
}

module.exports = { Client };
