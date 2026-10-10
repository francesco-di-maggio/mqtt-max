# mqtt-max

MIDI and data over MQTT between Max and any device: phones, microcontrollers, other computers. A Node for Max script turns MQTT into a virtual MIDI port, so patches use plain `ctlin` / `notein`, and passes text, bytes and JSON through for everything else.

```
device ──MQTT──▶ broker ──MQTT──▶ mqtt-max.js ──MIDI port "mqtt-max"──▶ ctlin / notein
       ◀──────────────────────────           ◀───────────────────────── ctlout / noteout
```

MIDI uses the topic format of [@grantler-instruments/mqtt-midi](https://github.com/grantler-instruments/mqtt-midi), so any client that speaks it can join.

## Features

- **MIDI port in Max.** `{prefix}/in/…` plays on a virtual port, and MIDI sent to it is published on `{prefix}/out/…`. Note on/off, CC, program change, pitch bend, clock, start, stop and continue.
- **Any MQTT data.** Subscribe and publish text, raw bytes or JSON (as Max dicts).
- **Retain and QoS** for publish and subscribe.
- **Presence.** Named clients appear as `online` or `offline`, also after a crash (last will).
- **[Phone app](phone/).** A web page that sends tilt, an XY pad, a slider and the network round trip as MIDI.

## Requirements

- Max 9 with Node for Max (bundled). Tested with Max 9.2.
- macOS for the MIDI port. Plain MQTT also works on Windows, where RtMidi has no virtual ports.
- An MQTT broker. The examples use the public [shiftr.io](https://www.shiftr.io) broker.

## Quick start

1. Clone the repo and add its folder to Max's search path (Options → File Preferences).
2. Open `max/mqtt-bridge.maxpat`. On first use on a machine, click `script npm install`.
3. Click `connect mqtt://public.cloud.shiftr.io public public`. The MIDI port `mqtt-max` now exists.
4. On a phone, open [francesco-di-maggio.github.io/mqtt-max/phone/](https://francesco-di-maggio.github.io/mqtt-max/phone/), keep prefix `remote` and tap Connect.
5. Open `max/examples/midi-test.maxpat` and tilt the phone. `ctlin mqtt-max` shows CC 1–3.

The public broker is shared and readable by anyone. Use a prefix of your own and send test data only.

## Repository layout

```
index.html              landing page (GitHub Pages)
assets/                 icon and link preview image
phone/                  phone app, see phone/README.md
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
| `--prefix <prefix>` | `remote` | Topic prefix |
| `--port <name>` | none | Create a MIDI port, subscribe to `{prefix}/in/#` |
| `--name <id>` | none | Announce presence, report other clients |

### Messages

| Message | |
|---|---|
| `connect <url> [user] [password]` | Connect, `mqtt(s)://` or `ws(s)://` |
| `disconnect` | Disconnect, publish `offline` if named |
| `subscribe <topic>` | Subscribe, `+` and `#` allowed |
| `unsubscribe <topic>` | Unsubscribe |
| `publish <topic> <values…>` | Text, values joined by spaces |
| `publishbytes <topic> <bytes…>` | Raw bytes |
| `publishjson <topic> <dict>` | A dict as JSON, e.g. from `[dict.pack]` |
| `format text \| bytes \| json` | Incoming payload format, default `text` |
| `qos 0 \| 1 \| 2` | QoS from now on, default 0, MIDI 0 |
| `retain 0 \| 1` | Retain from now on, default 0 |
| `publish <topic>` | With `retain 1`, clears a retained message |
| `port <name>` | As `--port`, at runtime |
| `prefix <prefix>` | As `--prefix`, at runtime |
| `name <id>` | As `--name`, from the next connect |

### Output

| Output | |
|---|---|
| `message <topic> <payload…>` | Every message, a dict with `format json` |
| `midi <in\|out> <type> <channel> …` | Decoded MIDI, e.g. `midi in cc 1 7 64` |
| `presence <name> <state>` | `online` / `offline`, if named |
| `status <state>` | `connected`, `reconnecting`, `disconnected` |
| `error <text>` | Errors |

## Patches

| Patch | |
|---|---|
| `mqtt-bridge.maxpat` | Creates the `mqtt-max` port, shows who is online |
| `examples/midi-test.maxpat` | MIDI in and out |
| `examples/phone-to-live.maxpat` | Smoothed phone CCs to Ableton Live |
| `examples/phone-latency.maxpat` | Latency tests |
| `examples/mqtt-raw.maxpat` | MQTT without MIDI: text, bytes, JSON |

Keep the bridge open while using the MIDI patches. Run one bridge per prefix, or every message arrives twice.

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

`in` is toward the MIDI port, `out` is from it. Channels are 1–16 and data bytes 0–127. Other MIDI topics are not played on the port, but still arrive as `message`.

## Troubleshooting

- **No `mqtt-max` port.** The bridge patch must be open. If the Max Console shows `Cannot find module`, click `script npm install`.
- **`node.script` can't find `mqtt-max.js`.** The repo folder is missing from Max's search path.
- **Every message twice.** Two clients bridge the same prefix. Close one.
- **Notes repeat forever.** With Echo notes on in the phone app, `notein mqtt-max` is patched to `noteout mqtt-max`. The phone sends every note back, and the patch sends it out again.

## Acknowledgements

- [@grantler-instruments/mqtt-midi](https://github.com/grantler-instruments/mqtt-midi) by Grantler Instruments: topic format, and the phone app's MIDI client
- [MQTT.js](https://github.com/mqttjs/MQTT.js)
- [@julusian/midi](https://github.com/Julusian/node-midi) (RtMidi)

## License

MIT, see [LICENSE](LICENSE).
