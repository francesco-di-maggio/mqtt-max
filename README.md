# mqtt-max

MQTT for Max. Connect patches, phones and devices over any network.

| Object | |
|---|---|
| `[mqtt.client]` | A connection to an MQTT broker: subscribe, publish text, bytes or JSON dictionaries, QoS, retain. |
| `[mqtt.midi]` | MIDI over MQTT as raw MIDI bytes, like `[midiin]` and `[midiout]`, optionally on a virtual MIDI port for `[ctlin]`, `[notein]` and other applications. |
| `[mqtt.homie.device]` | Max as a Homie device: a description, typed values, commands from controllers. |
| `[mqtt.homie.controller]` | Discovers Homie devices, reports who is online, outputs their values and commands them. |

New to MQTT? [MQTT for Max](docs/mqtt.md) explains brokers, topics, QoS, retained messages and the last will, and what they make possible.

## Requirements

- Max 9 on macOS. Node for Max is bundled with Max.
- An MQTT broker. The help files and examples use the public test broker `public.cloud.shiftr.io`, which is shared and readable by anyone: use it for trying things out only.

## Install

1. Download or clone this repository into `~/Documents/Max 9/Packages/mqtt-max`.
2. Restart Max and open **Extras → mqtt-max**.
3. Click `script npm install` once. The Max Console reports when it is done.

## Getting started

Open the help of any object (right-click → Open Help). Each help file has tabs, from basic use to the details, and a reference tab.

```
[connect mqtt://public.cloud.shiftr.io public public(
|
[mqtt.client home]        ← other objects use this connection by name: [mqtt.midi home], [mqtt.homie.device home lamp]
```

## Examples

The examples work with the phone app at [francesco-di-maggio.github.io/mqtt-max/phone/](https://francesco-di-maggio.github.io/mqtt-max/phone/): its tilt, XY pad and slider, sent as MIDI or as Homie values. They open from the landing patch.

| Example | |
|---|---|
| `mqtt-phone-midi` | Phone → MIDI port `mqtt-max` → `[ctlin]` and `[notein]` |
| `mqtt-phone-homie` | Phone → Homie values by device, node and property |
| `mqtt-phone-live` | Phone → smoothing → Ableton Live |
| `mqtt-phone-latency` | Round trips: Max → broker → Max, and Max → phone → Max |

See [site/phone](site/phone/README.md) for the phone app's controls and topics.

## Standards

- `[mqtt.client]` implements MQTT 3.1.1.
- `[mqtt.midi]` carries MIDI messages as defined by the MIDI 1.0 specification: one or more complete messages per MQTT message. The topics are set with `@receive` and `@send`.
- The Homie objects follow the [Homie 5](https://homieiot.github.io/specification/) convention for devices: `$state`, `$description`, typed properties and `/set` commands.

## Troubleshooting

- **`Cannot find module` in the Max Console.** Run `script npm install` from the landing patch.
- **`[ctlin]` does not receive from the port.** MIDI objects look up their port when they are created. Connect the middle outlet of `[mqtt.midi]`, which sends `port <name>` once the port exists, to them.
- **The port appears as `<name> #2`.** Another object already created a port with that name: give each `[mqtt.midi]` its own.
- **Messages arrive late or not at all on the public broker.** It is shared, and often slow under load. Use a broker on your own network, such as Mosquitto, for anything beyond a test.
- **Two clients keep disconnecting each other.** They use the same `@clientid`. Leave it empty for a random one.

## Acknowledgements

- [MQTT.js](https://github.com/mqttjs/MQTT.js), the MQTT client
- [@julusian/midi](https://github.com/Julusian/node-midi) (RtMidi), the virtual MIDI ports

## License

MIT. See [LICENSE](LICENSE.md).
