# Phone app

A web app that sends a phone's motion and touch over MQTT, as MIDI or as Homie values. Open [francesco-di-maggio.github.io/mqtt-max/phone/](https://francesco-di-maggio.github.io/mqtt-max/phone/), set up the broker and tap Connect.

Motion sensors need HTTPS. On iOS, the browser asks for motion access on the first Connect. All iOS browsers behave the same, since they share Safari's engine.

## Controls

| Control | Send: MIDI | Send: Homie |
|---|---|---|
| Pitch, front / back, −180° … 180° | CC 1, flat = 64 | `motion/pitch`, ° |
| Roll, left / right, −90° … 90° | CC 2, flat = 64 | `motion/roll`, ° |
| Yaw, rotation, 360° | CC 3, starting direction = 64 | `motion/yaw`, −180° … 180°, starting direction = 0 |
| Network round trip, phone → broker → phone | CC 4, 0–500 ms → 0–127 | `network/rtt`, ms |
| XY pad | CC 5 (X) and CC 6 (Y), bottom-left 0, top-right 127 | `pad/x`, `pad/y`, 0–1 |
| XY pad, while touched | Note 60, velocity 100 | `pad/touch`, `true` / `false` |
| Slider | CC 7 | `slider/value`, 0–1 |

- **Yaw** is measured from the direction the phone faces on Connect. Tap the Yaw row to re-centre it, e.g. after drift.
- **Network** pings `{prefix}/ping/{name}` every 500 ms and reports the real round trip of each ping. A ping without a reply within 1 s counts as lost and sends 127 as MIDI.

## Setup

| Field | Default | |
|---|---|---|
| Broker | `wss://public.cloud.shiftr.io` | WebSocket URL of the broker |
| User / Password | `public` / `public` | Broker login |
| Prefix | `remote` | First topic level and Homie domain, the same as in Max |
| Name | `phone-` + 4 random characters | Homie device ID |
| Send | MIDI | MIDI or Homie values |
| Channel | 1 | MIDI channel |
| Echo notes | off | Sends notes arriving on `{prefix}/{name}/midi/in` back on `{prefix}/{name}/midi`, for latency tests |

Prefix and name may only contain a-z, 0-9 and hyphens. The page remembers the fields in the browser. While connected, the connection fields are locked, the header shows `{prefix}/{name}`, and Setup lists the Homie devices that are ready under the same prefix.

## Topics

The phone is always a Homie 5 device. With Send: MIDI it publishes MIDI messages, one complete message per MQTT message.

| Topic | |
|---|---|
| `{prefix}/5/{name}/$state` | `init`, `ready`, `disconnected`; `lost` as the last will. Retained, QoS 2 |
| `{prefix}/5/{name}/$description` | The device description: no nodes with Send: MIDI, the nodes above with Send: Homie |
| `{prefix}/5/{name}/{node}/{property}` | Send: Homie values, not retained, QoS 0 |
| `{prefix}/{name}/midi` | Send: MIDI controls and the XY pad note, as MIDI messages |
| `{prefix}/{name}/midi/in` | MIDI to the phone: note on and note off are sent back when Echo notes is on |
| `{prefix}/ping/{name}` | Round-trip ping to itself |

## Hosting your own

The phone app is a single HTML file with no build step. To adapt it, copy `site/phone/index.html` and serve it over HTTPS, e.g. from a fork with GitHub Pages. It loads MQTT.js 5.16.0 from esm.sh.
