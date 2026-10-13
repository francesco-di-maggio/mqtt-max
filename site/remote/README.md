# Remote

Web app. Sends touch, motion and mic level from a phone, tablet or computer over MQTT, as MIDI or Homie values.

[francesco-di-maggio.github.io/mqtt-max/remote/](https://francesco-di-maggio.github.io/mqtt-max/remote/)

Motion and Mic level need HTTPS. The browser asks for permission on Connect. A blocked permission is changed in the browser's site settings.

## Inputs

Switched on and off in Setup. An input that is off is hidden and sends nothing. CC 20–31 are undefined in MIDI 1.0.

| Input | Default | MIDI | Homie |
|---|---|---|---|
| Motion: pitch, −180° … 180° | off | CC 20, flat = 64 | `motion/pitch`, ° |
| Motion: roll, −90° … 90° | off | CC 21, flat = 64 | `motion/roll`, ° |
| Motion: yaw, 360° | off | CC 22, start = 64 | `motion/yaw`, −180° … 180°, start = 0 |
| Latency: round trip | on | CC 23, 0–500 ms → 0–127 | `latency/rtt`, ms |
| Mic level | off | CC 24, −60 … 0 dBFS → 0–127 | `mic/level`, dBFS |
| XY pad | on | CC 25 X, CC 26 Y, bottom-left = 0 | `pad/x`, `pad/y`, 0–1 |
| XY pad: touch | on | CC 27, 127 / 0 | `pad/touch`, `true` / `false` |
| Sliders 1–4 | on | CC 28–31 | `slider/1` … `slider/4`, 0–1 |
| Buttons 1–8 | on | Notes 60 62 64 65 67 69 71 72, velocity 100 | `button/1` … `button/8`, `true` / `false` |

- Yaw: 0 is the direction on Connect. Tap the Yaw row to reset.
- Latency: pings `{prefix}/ping/{id}` every 500 ms. No reply within 1 s: lost, CC 23 = 127.

## Setup

| Field | Default | |
|---|---|---|
| Broker | `wss://public.cloud.shiftr.io` | WebSocket URL |
| User, Password | `public`, `public` | |
| Prefix | `remote` | First topic level, Homie domain |
| ID | `phone-`, `tablet-` or `computer-` + 4 hex digits | Homie device ID |
| Send | MIDI | MIDI or Homie |
| Channel | 1 | MIDI channel |

- Prefix and ID: a-z, 0-9, `-`. Capitals are lowercased, accents removed, spaces become `-`, other characters are dropped.
- Theme: the header button cycles Auto (system), Light, Dark. Saved.
- Settings are saved in the browser on every change. Tabs in one browser share the ID: connect one at a time.
- While connected: fields and inputs are locked, the screen stays on, the header shows `{prefix}/{id}`, Online lists ready Homie devices under the prefix.

### Link parameters

`…/remote/?broker=wss://broker.example:8884&prefix=studio&send=homie&inputs=pad,slider,button`

Applied over the saved settings, saved, then removed from the address bar.

| Parameter | Value |
|---|---|
| `broker`, `user`, `password` | Text |
| `prefix`, `id` | Text, cleaned as when typed |
| `send` | `midi`, `homie` |
| `channel` | 1–16 |
| `inputs` | Inputs that are on: `motion`, `latency`, `pad`, `slider`, `button`, `mic` |

A link with `password` contains the password.

## Topics

Always a Homie 5 device. With Send: MIDI, the description has no nodes.

| Topic | |
|---|---|
| `{prefix}/5/{id}/$state` | `init`, `ready`, `disconnected`, `lost` (last will). Retained, QoS 2 |
| `{prefix}/5/{id}/$description` | Nodes of the inputs that are on. Retained, QoS 2 |
| `{prefix}/5/{id}/{node}/{property}` | Send: Homie. Not retained, QoS 0 |
| `{prefix}/{id}/midi` | Send: MIDI. One MIDI message per MQTT message |
| `{prefix}/ping/{id}` | Latency ping |

## Hosting

One HTML file, no build step. Serve `site/remote/index.html` over HTTPS. Loads MQTT.js 5.16.0 from esm.sh.
