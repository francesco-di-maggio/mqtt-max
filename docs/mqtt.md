# MQTT for Max

## MQTT

Publish/subscribe messaging protocol, standardised by OASIS. 3.1.1 (2014) is also ISO/IEC 20922. 5.0 (2019) adds message expiry, request/response and more. mqtt-max uses 3.1.1.

Clients connect to a **broker**, a server that passes messages on. They never talk directly:

```
phone ──publish──▶ broker ──deliver──▶ Max
                     ▲
ESP32 ──publish──────┘
```

Every client connects out to the broker, so devices behind routers, mobile networks and firewalls reach each other without port forwarding.

### Topics

Messages are published to a **topic**, a path such as `studio/sensor/1`. Clients **subscribe** to filters:

| Filter | Matches |
|---|---|
| `studio/sensor/1` | exactly that topic |
| `studio/+/1` | one level: `studio/sensor/1`, `studio/light/1` |
| `studio/#` | everything below `studio` |

Topics exist once published to. Nothing is declared.

### Payloads

Bytes. Their meaning is up to the application: text, numbers, JSON, binary.

### Quality of service

Per message:

| QoS | Delivery | Use |
|---|---|---|
| 0 | at most once, may be lost | fast streams: sensors, gestures |
| 1 | at least once, may be duplicated | events that must arrive |
| 2 | exactly once | state that must not repeat |

Higher levels cost more round trips. Messages from one client on one topic arrive in order when they use the same QoS.

### Retained messages

The broker stores the last **retained** message per topic and sends it to every new subscriber, who gets the current state at once. An empty retained message deletes it.

### Last will and keepalive

**Last will**: a message the broker publishes for a client whose connection drops without a clean disconnect. **Keepalive**: the client's ping interval; after 1.5 times that without traffic, the broker considers the client gone. Together they report a lost device within seconds.

### Connections

| URL | Transport | Usual port |
|---|---|---|
| `mqtt://` | TCP | 1883 |
| `mqtts://` | TCP with TLS | 8883 |
| `ws://` | WebSocket | depends on the broker |
| `wss://` | WebSocket with TLS | depends on the broker |

Web pages, such as the Remote, use WebSockets only.

### Brokers

| Broker | |
|---|---|
| Public test broker: `public.cloud.shiftr.io`, `test.mosquitto.org` | No setup. Shared, readable by anyone, often slow. For tests. |
| Local: `[mqtt.broker]`, Mosquitto on a computer or Raspberry Pi | A few ms. Private. |
| Hosted or own server | Across the internet. Login, TLS. |

## Homie

[Homie](https://homieiot.github.io/specification/) describes devices. A device publishes, retained:

```
homie/5/lamp/$state         ready
homie/5/lamp/$description   {"nodes": {"light": {"properties": {"level": {"datatype": "integer", "format": "0:100", "settable": true}}}}}
homie/5/lamp/light/level    80
```

- **`$state`** is `init`, `ready`, `disconnected`, `sleeping` or `lost`; the last will sets `lost`.
- **`$description`** lists the device's nodes and their properties, each with a datatype, range and unit.
- **Values** are text, typed by the description: numbers, booleans, colours, JSON.
- **Commands** go to `…/light/level/set`. The device confirms by publishing the new value.

Controllers discover devices by `$state` and read each value's type from the description. Default domain: `homie`. Another domain, such as `remote`, keeps a group apart.

## OSC and MQTT

| | OSC | MQTT |
|---|---|---|
| Path | direct, device to device (usually UDP) | through a broker (TCP or WebSocket) |
| Latency | lowest | a broker hop more |
| Networks | the local network, or with port forwarding | any network, from behind routers |
| Delivery | not guaranteed | QoS 0, 1 or 2 |
| State and presence | none built in | retained messages, last will |
| Browsers | no | yes, over WebSocket |

OSC: dense gestures in one room. MQTT: devices, state and presence across networks.

## mqtt-max

Objects: see the [README](../README.md). Uses:

- Phones and browsers → Max over WebSocket, nothing to install.
- Microcontrollers (e.g. ESP32) publishing sensor values.
- Devices on different networks, through a broker on the internet.
- Presence: retained states and the last will report joins, disconnects and dropped connections.
- Sound and MIDI made in Max from any device's values.
- Other MQTT software: Node-RED, Home Assistant, openHAB.

## Further reading

- [MQTT 3.1.1 specification (OASIS)](https://docs.oasis-open.org/mqtt/mqtt/v3.1.1/os/mqtt-v3.1.1-os.html)
- [MQTT 5.0 specification (OASIS)](https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html)
- [Homie convention](https://homieiot.github.io/specification/)
- [MQTT.js](https://github.com/mqttjs/MQTT.js), the client library mqtt-max uses
