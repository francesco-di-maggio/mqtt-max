// An MQTT 3.1.1 broker (Aedes) listening on TCP, TLS, WebSocket and secure WebSocket.

const net = require("node:net");
const tls = require("node:tls");
const http = require("node:http");
const https = require("node:https");
const fs = require("node:fs");
const os = require("node:os");
const { Aedes } = require("aedes");
const { WebSocketServer, createWebSocketStream } = require("ws");

// CONNACK return code for a wrong user name or password (MQTT 3.1.1, 3.2.2.3).
const BAD_USERNAME_OR_PASSWORD = 4;

function listen(server, port) {
  return new Promise((resolve, reject) => {
    server.once("error", reject);
    server.listen(port, () => {
      server.off("error", reject);
      resolve();
    });
  });
}

function close(server) {
  return new Promise((resolve) => {
    server.close(() => resolve());
    server.closeAllConnections?.();
  });
}

// IPv4 addresses of this computer on its networks, for the URLs other devices connect to.
function addresses() {
  return Object.values(os.networkInterfaces())
    .flat()
    .filter((a) => a.family === "IPv4" && !a.internal)
    .map((a) => a.address);
}

class Broker {
  // events: { onListening(listeners), onStopped(), onClient(event, ...args), onError(text) }
  constructor(events) {
    this.events = events;
    this.aedes = null;
    this.servers = [];
    this.connected = new Set();
  }

  get running() {
    return this.aedes !== null;
  }

  clients() {
    return [...this.connected].sort();
  }

  // settings: { port, tlsport, wsport, wssport, key, cert, username, password }; a port of 0 is off.
  async start(settings) {
    await this.stop();
    const secure = settings.tlsport > 0 || settings.wssport > 0;
    let credentials = null;
    if (secure) {
      try {
        credentials = { key: fs.readFileSync(settings.key), cert: fs.readFileSync(settings.cert) };
      } catch (err) {
        return this.events.onError(`TLS needs key and cert files: ${err.message}`);
      }
    }
    const aedes = await Aedes.createBroker();
    if (settings.username) {
      aedes.authenticate = (client, username, password, callback) => {
        if (username === settings.username && String(password ?? "") === settings.password) return callback(null, true);
        const error = new Error("bad user name or password");
        error.returnCode = BAD_USERNAME_OR_PASSWORD;
        callback(error, false);
      };
    }
    aedes.on("clientReady", (client) => {
      this.connected.add(client.id);
      this.events.onClient("connected", client.id);
    });
    aedes.on("clientDisconnect", (client) => {
      this.connected.delete(client.id);
      this.events.onClient("disconnected", client.id);
    });
    aedes.on("subscribe", (subs, client) => {
      for (const s of subs) this.events.onClient("subscribe", client.id, s.topic, s.qos);
    });
    aedes.on("unsubscribe", (topics, client) => {
      for (const t of topics) this.events.onClient("unsubscribe", client.id, t);
    });

    const websocket = (server) => {
      const wss = new WebSocketServer({ server });
      wss.on("connection", (socket, req) => aedes.handle(createWebSocketStream(socket), req));
      return server;
    };
    const plan = [
      ["mqtt", settings.port, () => net.createServer(aedes.handle)],
      ["mqtts", settings.tlsport, () => tls.createServer(credentials, aedes.handle)],
      ["ws", settings.wsport, () => websocket(http.createServer())],
      ["wss", settings.wssport, () => websocket(https.createServer(credentials))],
    ];
    this.aedes = aedes;
    const listeners = [];
    for (const [scheme, port, create] of plan) {
      if (!(port > 0)) continue;
      const server = create();
      try {
        await listen(server, port);
      } catch (err) {
        await this.stop();
        return this.events.onError(err.code === "EADDRINUSE" ? `port ${port} is already in use` : `${scheme} port ${port}: ${err.message}`);
      }
      this.servers.push(server);
      listeners.push([scheme, port]);
    }
    if (listeners.length === 0) {
      await this.stop();
      return this.events.onError("no port to listen on: set port, tlsport, wsport or wssport");
    }
    this.events.onListening(listeners);
  }

  async stop() {
    if (!this.aedes) return;
    const aedes = this.aedes;
    this.aedes = null;
    // Aedes closes its client connections first; the servers then close without waiting for them.
    await new Promise((resolve) => aedes.close(() => resolve()));
    for (const server of this.servers) await close(server);
    this.servers = [];
    this.connected.clear();
    this.events.onStopped();
  }
}

module.exports = { Broker, addresses };
