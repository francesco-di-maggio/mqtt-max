# mqtt-max

MQTT for Max. Connects patches, phones and devices over any network.

| Object | |
|---|---|
| `[mqtt.client]` | Connection to a broker. Subscribe, publish text, bytes or JSON dictionaries. QoS, retain. |
| `[mqtt.broker]` | Broker on this computer. TCP, TLS, WebSocket, login. |
| `[mqtt.midi]` | MIDI over MQTT as raw bytes, like `[midiin]` and `[midiout]`. Optional virtual MIDI port. |
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
[mqtt.client home]        ← shared by name: [mqtt.midi home], [mqtt.homie.device home lamp]
```

## Examples

The examples use the [remote](https://francesco-di-maggio.github.io/mqtt-max/remote/), a web app for phones, tablets and computers. They open from the landing patch.

| Example | |
|---|---|
| `mqtt-remote-midi` | Remote → MIDI port `mqtt-max` → `[ctlin]` and `[notein]` |
| `mqtt-remote-homie` | Remote → Homie values by device, node and property |
| `mqtt-remote-live` | Remote → smoothing → Ableton Live |
| `mqtt-remote-latency` | Round trips: Max → broker → Max, remote → broker → remote, sum |

Inputs and topics: [site/remote](site/remote/README.md).

## Standards

- `[mqtt.client]` and `[mqtt.broker]` implement MQTT 3.1.1.
- `[mqtt.midi]`: MIDI 1.0 messages, one or more complete messages per MQTT message. Topics set with `@receive` and `@send`.
- Homie objects: [Homie 5](https://homieiot.github.io/specification/). `$state`, `$description`, typed properties, `/set` commands.

## Troubleshooting

- **`Cannot find module` in the Max Console.** Run `script npm install` from the landing patch.
- **`[ctlin]` does not receive from the port.** MIDI objects look up their port when created. Connect the middle outlet of `[mqtt.midi]` (`port <name>`, sent once the port exists) to them.
- **The port appears as `<name> #2`.** Another object uses that name. Give each `[mqtt.midi]` its own.
- **Messages arrive late or not at all on the public broker.** It is shared and often slow. Use a broker on your network.
- **`[mqtt.broker]`: port already in use.** Another broker listens on it. Stop it, or set another `@port`.
- **Devices cannot reach `[mqtt.broker]`.** With the macOS firewall on, allow incoming connections when asked. Use an address it reports, not `localhost`.
- **Two clients keep disconnecting each other.** Same `@clientid`. Leave it empty for a random one.

## Acknowledgements

- [Aedes](https://github.com/moscajs/aedes), the MQTT broker
- [MQTT.js](https://github.com/mqttjs/MQTT.js), the MQTT client
- [@julusian/midi](https://github.com/Julusian/node-midi) (RtMidi), the virtual MIDI ports

## License

MIT. See [LICENSE](LICENSE.md).
