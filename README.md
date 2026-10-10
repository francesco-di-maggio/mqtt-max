# mqtt-max

MIDI and data over MQTT between Max and any device: phones, microcontrollers, other computers. A Node for Max script turns MQTT into a virtual MIDI port, so patches use plain `ctlin` / `notein`, and passes text, bytes and JSON through for everything else.

```
device ──MQTT──▶ broker ──MQTT──▶ mqtt-max.js ──MIDI port "mqtt-max"──▶ ctlin / notein
       ◀──────────────────────────             ◀───────────────────────── ctlout / noteout
```

MIDI uses the topic format of [@grantler-instruments/mqtt-midi](https://github.com/grantler-instruments/mqtt-midi), so any client that speaks it can join.

## Features

- **MIDI port in Max**: `{prefix}/in/…` plays on a virtual port; MIDI sent to it is published on `{prefix}/out/…`. Note on/off, CC, program change, pitch bend, clock / start / stop / continue.
- **Any MQTT data**: subscribe and publish text, raw bytes or JSON (as Max dicts).
- **Retain and QoS** for publish and subscribe.
- **Presence**: named clients appear as `online` / `offline`, also after a crash (last will).
- **Web controller** for phones: tilt, slider, XY pad and network round trip as MIDI, with a list of who is online.

## Requirements

- Max 9 with Node for Max (bundled). Tested with Max 9.2.
- macOS for the MIDI port. Plain MQTT also works on Windows, where RtMidi has no virtual ports.
- An MQTT broker. The examples use the public [shiftr.io](https://www.shiftr.io) broker.

## Quick start

1. Clone the repo and add its folder to Max's search path (Options → File Preferences). Open `max/mqtt-bridge.maxpat`; on first use on a machine, click `script npm install`.
2. Click `connect mqtt://public.cloud.shiftr.io public public`. The MIDI port `mqtt-max` now exists.
3. On a phone, open [francesco-di-maggio.github.io/mqtt-max/phone/](https://francesco-di-maggio.github.io/mqtt-max/phone/), keep prefix `remote` and tap Connect.
4. Open `max/examples/midi-test.maxpat` and tilt the phone: `ctlin mqtt-max` shows CC 1–3.

The public broker is shared and readable by anyone. Use a prefix of your own and send test data only.

## Repository layout

```
index.html              landing page (GitHub Pages)
phone/index.html        web controller
max/
  mqtt-max.js           Node for Max script: MQTT client and MIDI port
  mqtt-bridge.maxpat    the bridge
  examples/             example patches
```

## mqtt-max.js

```
[node.script mqtt-max.js @autostart 1 @watch 1 @args --prefix remote --port mqtt-max --name max]
```

| Launch option | Default | |
|---|---|---|
| `--prefix <prefix>` | `remote` | Topic prefix for MIDI and presence |
| `--port <name>` | none | Create a virtual MIDI port and subscribe to `{prefix}/in/#` |
| `--name <id>` | none | Enable presence: announce `{prefix}/status/{id}`, report other clients as `presence` |

Patches outside `max/`, including `max/examples/`, find the script through Max's search path: add the repo folder in Options → File Preferences.

### Messages

| Message | |
|---|---|
| `connect <url> [user] [password]` | `mqtt://`, `mqtts://`, `ws://` or `wss://` URL |
| `disconnect` | Disconnect; publishes `offline` when named |
| `subscribe <topic>` / `unsubscribe <topic>` | Wildcards `+` and `#` allowed |
| `publish <topic> <values…>` | Text payload, values joined by spaces |
| `publishbytes <topic> <bytes…>` | Raw byte payload |
| `publishjson <topic> <dict>` | A Max dict as JSON, e.g. `[dict.pack]` → `[prepend publishjson <topic>]` |
| `format text \| bytes \| json` | How incoming payloads are output (default `text`) |
| `qos 0 \| 1 \| 2` | QoS for following publishes and subscribes (default 0) |
| `retain 0 \| 1` | Retain following publishes (default 0). `retain 1` + `publish <topic>` with no payload clears a retained message |
| `port <name>` | As `--port`, at runtime |
| `prefix <prefix>` | As `--prefix`, at runtime |
| `name <id>` | As `--name`; takes effect on the next connect |

MIDI from the port is always sent with QoS 0 and no retain.

### Output

| Output | |
|---|---|
| `message <topic> <payload…>` | Every incoming message. With `format json`, JSON objects arrive as a dict |
| `midi <in\|out> <type> <channel> [<number>] <value>` | Decoded MIDI under the prefix, e.g. `midi in cc 1 7 64` |
| `presence <name> online\|offline` | Clients under the prefix, when named |
| `status connected <url>` / `reconnecting` / `disconnected` | Connection state |
| `error <text>` | Errors |

## Patches

| Patch | |
|---|---|
| `mqtt-bridge.maxpat` | Creates the `mqtt-max` port and shows who is online. Keep it open while using the MIDI patches. |
| `examples/midi-test.maxpat` | `ctlin` / `notein` in, `ctlout` / `noteout` out |
| `examples/phone-to-live.maxpat` | Smooths CC 1–4 and sends them as CC 20–23, pad note passed through, to a MIDI output for Ableton Live |
| `examples/phone-latency.maxpat` | Latency: laptop ↔ broker, and the full loop through the phone |
| `examples/mqtt-raw.maxpat` | MQTT without a MIDI port: text, bytes, JSON, QoS, retain, presence |

Run one bridge per prefix, or every message arrives twice.

## Web controller

Served at [francesco-di-maggio.github.io/mqtt-max/phone/](https://francesco-di-maggio.github.io/mqtt-max/phone/). Motion sensors need HTTPS; iOS asks for permission on the first Connect.

| Control | Sends |
|---|---|
| Pitch (front / back) | CC 1 |
| Roll (left / right) | CC 2 |
| Yaw (rotation, wraps 360° → 0°) | CC 3 |
| Slider | CC 4 |
| XY pad | X → CC 6, Y → CC 7 (bottom-left 0, top-right 127); note 60, velocity 100, while touched |
| Network round trip, phone → broker → phone | CC 5: 0–500 ms → 0–127; a ping lost for 1 s → 127 |

All on `{prefix}/in/…`, on the channel set in Setup. **Echo notes** sends notes arriving on `{prefix}/out/…` back on `{prefix}/in/…`, for round-trip latency tests. The page announces itself as `{prefix}/status/{name}` and lists the clients online under the same prefix.

## Topics

| Topic | Payload |
|---|---|
| `{prefix}/{in\|out}/noteon/{channel}/{note}` | 1 byte, velocity |
| `{prefix}/{in\|out}/noteoff/{channel}/{note}` | 1 byte, velocity |
| `{prefix}/{in\|out}/cc/{channel}/{controller}` | 1 byte, value |
| `{prefix}/{in\|out}/program/{channel}` | 1 byte, program |
| `{prefix}/{in\|out}/pitchbend/{channel}` | 2 bytes, LSB MSB |
| `{prefix}/{in\|out}/{clock\|start\|stop\|continue}` | empty |
| `{prefix}/status/{name}` | `online` / `offline`, retained, QoS 1 |
| `{prefix}/ping/{name}` | Web controller's round-trip ping to itself |

`in` is toward the MIDI port, `out` is from it. Channels are 1–16, data bytes 0–127; other MIDI topics are not played on the port, but still arrive as `message`.

## Troubleshooting

- **No `mqtt-max` port**: the bridge patch must be open. If the Max Console shows `Cannot find module`, click `script npm install`.
- **`node.script` can't find `mqtt-max.js`** in an example: the repo folder is missing from Max's search path.
- **Every message twice**: two clients bridge the same prefix. Close one.
- **Notes repeat forever**: with Echo notes on, `notein mqtt-max` is patched to `noteout mqtt-max`. The phone sends every note back, and the patch sends it out again.

## Development

The web pages are plain HTML, served by GitHub Pages from `main`: pushing updates the live page. The Max side needs `npm install` in `max/` (or `script npm install` in Max) for `mqtt` and `@julusian/midi`.

## Credits

- [@grantler-instruments/mqtt-midi](https://github.com/grantler-instruments/mqtt-midi) by Grantler Instruments: topic format, and the web controller's MIDI client
- [MQTT.js](https://github.com/mqttjs/MQTT.js)
- [@julusian/midi](https://github.com/Julusian/node-midi) (RtMidi)

## License

MIT, see [LICENSE](LICENSE).
