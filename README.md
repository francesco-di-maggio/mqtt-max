# mqtt-max

MQTT for Max. Connects patches, phones and devices over any network.

| Object | |
|---|---|
| `[mqtt.client]` | Connection to a broker. Subscribe, publish text, bytes or JSON dictionaries. QoS, retain. |
| `[mqtt.broker]` | Broker on this computer. TCP, TLS, WebSocket, login. |
| `[mqtt.send]` | Publishes every message to one topic, like `[send]` across the network. |
| `[mqtt.receive]` | Outputs the messages on one topic, like `[receive]` across the network. |
| `[mqtt.homie.device]` | Max as a Homie device. Description, typed values, commands. |
| `[mqtt.homie.controller]` | Discovers Homie devices. Online state, values, commands. |

MQTT basics: [docs/mqtt.md](docs/mqtt.md).

## Requirements

- Max 9, macOS. Node for Max is included in Max.
- A broker: `[mqtt.broker]`, Mosquitto, or a hosted one. Help files and examples use `public.cloud.shiftr.io`, a public test broker: shared, readable by anyone.

## Install

1. Download or clone this repository into `~/Documents/Max 9/Packages/mqtt-max`.
2. Restart Max and open **Extras → mqtt-max**.
3. Click `script npm install` once. The Max Console reports when done.

## Getting started

Right-click an object → Open Help. Tabs go from basic use to reference.

```
[connect mqtt://public.cloud.shiftr.io public public(
|
[mqtt.client home]        ← shared by name: [mqtt.send home cutoff], [mqtt.homie.device home lamp]
```

## Examples

Starting points for real setups, one per setup. They open from the landing patch. The help file of each object shows the object itself, from basic to advanced use. Several examples use the [Remote](https://francescodimaggio.nl/mqtt-max/remote/), a web app for phones, tablets and computers; its inputs and topics: [site/remote](site/remote/README.md).

| Example | Setup |
|---|---|
| `mqtt-shared-session` | Patches in different places share one session: tempo and scene as retained state, a parameter as a stream, who is online |
| `mqtt-remote-sound` | Phones play a synth in Max |
| `mqtt-remote-midi` | Phones control a DAW: notes and CCs to any MIDI port, e.g. the IAC Driver |
| `mqtt-synth-device` | A Max synth as a Homie device that anyone on the network can play |
| `mqtt-local-network` | No internet: `[mqtt.broker]` in Max, phones and microcontrollers join on the local network |
| `mqtt-round-trips` | How fast the connection is: Max → broker → Max, Remote → broker → Remote |
| `mqtt-midge-bridge` | MIDI with midge and mqtt-midi: Max → DAW and DAW → Max, one topic per value |

## With mqtt-midi and midge

[mqtt-midi](https://github.com/grantler-instruments/mqtt-midi) and [midge](https://github.com/grantler-instruments/midge) (Grantler Instruments) carry MIDI over MQTT with one topic per value and a binary payload: `{prefix}/in/cc/{channel}/{controller}`, `{prefix}/in/noteon/{channel}/{note}`, and so on; `in` goes to a MIDI device, `out` comes from it. Max talks to them with the plain objects:

| | Max |
|---|---|
| To midge, e.g. a DAW | `[mqtt.send <client> remote/in/cc/1/7 @format bytes]`, values 0-127 |
| From midge | `[mqtt.receive <client> remote/out/# @format bytes]`: the topic, then the value bytes |

Example: `mqtt-midge-bridge`. The Remote sends Homie values: to reach midge, map them in Max to these topics.

## Standards

- `[mqtt.client]`, `[mqtt.broker]`, `[mqtt.send]` and `[mqtt.receive]`: MQTT 3.1.1.
- Homie objects: [Homie 5](https://homieiot.github.io/specification/). `$state`, `$description`, typed properties, `/set` commands.

## Troubleshooting

- **`Cannot find module` in the Max Console.** Run `script npm install` from the landing patch.
- **Messages arrive late or not at all on the public broker.** It is shared and often slow. Use a broker on your network.
- **`[mqtt.broker]`: port already in use.** Another broker listens on it. Stop it, or set another `@port`.
- **Devices cannot reach `[mqtt.broker]`.** With the macOS firewall on, allow incoming connections when asked. Use an address it reports, not `localhost`.
- **Two clients keep disconnecting each other.** Same `@clientid`. Leave it empty for a random one.

## Acknowledgements

- [Aedes](https://github.com/moscajs/aedes), the MQTT broker
- [MQTT.js](https://github.com/mqttjs/MQTT.js), the MQTT client

## License

MIT. See [LICENSE](LICENSE.md).
