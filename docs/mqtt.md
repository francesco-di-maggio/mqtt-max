# MQTT for Max

This page explains MQTT, the formats mqtt-max uses on top of it, and the package itself.

## MQTT

MQTT is a publish/subscribe messaging protocol, standardised by OASIS. Version 3.1.1 (2014) is also the international standard ISO/IEC 20922. Version 5.0 (2019) adds features such as message expiry and request/response. mqtt-max uses 3.1.1, which every broker supports.

Clients never talk to each other directly. They connect to a **broker**, a server that passes messages on:

```
phone ──publish──▶ broker ──deliver──▶ Max
                     ▲
ESP32 ──publish──────┘
```

Because every client connects *out* to the broker, devices behind home routers, phone networks and firewalls can reach each other without port forwarding. That is what makes MQTT work over any network.

### Topics

A message is published to a **topic**, a path such as `studio/sensor/1`. Clients **subscribe** to topic filters:

| Filter | Matches |
|---|---|
| `studio/sensor/1` | exactly that topic |
| `studio/+/1` | one level: `studio/sensor/1`, `studio/light/1` |
| `studio/#` | everything below `studio` |

Topics are created by publishing; nothing has to be declared first.

### Payloads

A payload is a sequence of bytes. MQTT says nothing about what they mean: text, numbers, JSON or raw binary are all choices of the application.

### Quality of service

Each message is sent with a QoS level:

| QoS | Delivery | Use |
|---|---|---|
| 0 | at most once, may be lost | fast streams: sensors, gestures |
| 1 | at least once, may be duplicated | events that must arrive |
| 2 | exactly once | state that must not repeat |

Higher levels cost more round trips. Messages from one client on one topic arrive in order when they use the same QoS.

### Retained messages

A message published with **retain** is stored by the broker, one per topic, and sent to every client that subscribes later. It is how a new subscriber learns the current state, e.g. a device's settings, without waiting for the next update. Publishing an empty retained message deletes it.

### Last will and keepalive

When connecting, a client can leave a **last will**: a message the broker publishes for it if the connection drops without a clean disconnect. Clients send a **keepalive** at a set interval; the broker considers a client gone after 1.5 times that interval without traffic. Together they let others know, within seconds, that a device has disappeared.

### Connections

| URL | Transport | Usual port |
|---|---|---|
| `mqtt://` | TCP | 1883 |
| `mqtts://` | TCP with TLS | 8883 |
| `ws://` | WebSocket | depends on the broker |
| `wss://` | WebSocket with TLS | depends on the broker |

Web pages, such as the phone app, can only use WebSockets.

### Brokers

- **Public test brokers** (e.g. `public.cloud.shiftr.io`, `test.mosquitto.org`) need no setup, but are shared, readable by anyone and often slow. Use them for trying things out only.
- **A broker on your own network**, such as `[mqtt.broker]` in Max, or Mosquitto on a computer or a Raspberry Pi, adds only a few milliseconds and keeps data private.
- **A hosted or self-managed server** connects places over the internet, with user names, passwords and TLS.

## Formats on top of MQTT

MQTT leaves topic names and payloads open. mqtt-max uses two formats on top of it.

### MIDI

`[mqtt.midi]` publishes MIDI messages as the MIDI 1.0 specification defines them, as raw bytes: one or more complete messages per MQTT message. The topic is set per object. One topic per device keeps the senders apart:

```
studio/phone-a1b2/midi    B0 07 40       control change 7, value 64, channel 1
studio/phone-a1b2/midi    90 3C 64       note on 60, velocity 100
studio/phone-a1b2/midi    F0 7D 01 F7    SysEx
studio/phone-a1b2/midi    F8             clock
```

A subscription to `studio/+/midi` receives the MIDI of every device. MIDI keeps its limits: 7-bit values and 16 channels per topic.

### Homie

[Homie](https://homieiot.github.io/specification/) describes devices. A device publishes, retained:

```
homie/5/lamp/$state         ready
homie/5/lamp/$description   {"nodes": {"light": {"properties": {"level": {"datatype": "integer", "format": "0:100", "settable": true}}}}}
homie/5/lamp/light/level    80
```

- **`$state`** is `init`, `ready`, `disconnected`, `sleeping` or `lost`; the last will sets `lost`.
- **`$description`** lists the device's nodes and their properties, each with a datatype, range and unit.
- **Values** are text, typed by the description: numbers, booleans, colours, JSON.
- **Commands** go to `…/light/level/set`; the device confirms by publishing the new value.

Controllers discover devices from their `$state`, read the description, and know what each value means without any prior agreement. `homie` is the default domain; another single word, such as `remote`, keeps a group of devices apart.

## OSC and MQTT

| | OSC | MQTT |
|---|---|---|
| Path | direct, device to device (usually UDP) | through a broker (TCP or WebSocket) |
| Latency | lowest | a broker hop more |
| Networks | the local network, or with port forwarding | any network, from behind routers |
| Delivery | not guaranteed | QoS 0, 1 or 2 |
| State and presence | none built in | retained messages, last will |
| Browsers | no | yes, over WebSocket |

They complement each other: OSC for dense gestures within a room, MQTT for devices, state and presence across networks.

## mqtt-max

mqtt-max is a Max package with five objects:

| Object | |
|---|---|
| `[mqtt.client]` | A connection to a broker: subscribe, publish text, bytes or JSON dictionaries, QoS, retain. Other objects share it by name. |
| `[mqtt.broker]` | An MQTT broker on this computer: TCP, TLS, WebSocket and secure WebSocket, optional login. |
| `[mqtt.midi]` | MIDI as raw MIDI bytes, like `[midiin]` and `[midiout]`, optionally on a virtual MIDI port for any patch or application. |
| `[mqtt.homie.device]` | Max as a Homie device: its description from a dictionary, typed values, commands from controllers. |
| `[mqtt.homie.controller]` | Discovers Homie devices, reports which are online, outputs their values and commands them. |

Typical uses:

- Phones and browsers sending to Max over WebSocket, with nothing to install.
- Microcontrollers such as the ESP32 publishing sensor values with an MQTT library.
- Devices on different networks reaching Max through a broker on the internet.
- Knowing which devices are connected: retained states and the last will report joins, clean disconnects and dropped connections.
- MIDI from the network on a virtual MIDI port, for Max patches and other applications.
- Exchanging messages with other MQTT software, such as Node-RED, Home Assistant or openHAB.

## Further reading

- [MQTT 3.1.1 specification (OASIS)](https://docs.oasis-open.org/mqtt/mqtt/v3.1.1/os/mqtt-v3.1.1-os.html)
- [MQTT 5.0 specification (OASIS)](https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html)
- [Homie convention](https://homieiot.github.io/specification/)
- [MIDI 1.0 core specifications (MIDI Association)](https://midi.org/midi-1-0-core-specifications)
- [MQTT.js](https://github.com/mqttjs/MQTT.js), the client library mqtt-max uses
