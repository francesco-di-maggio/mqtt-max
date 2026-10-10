# Phone app

A web app that sends a phone's motion and touch as MIDI over MQTT. Open [francesco-di-maggio.github.io/mqtt-max/phone/](https://francesco-di-maggio.github.io/mqtt-max/phone/), set up the broker and tap Connect.

Motion sensors need HTTPS. On iOS, the browser asks for motion access on the first Connect. All iOS browsers behave the same, since they share Safari's engine.

## Controls

| Control | Sends |
|---|---|
| Pitch, front / back, −180° … 180° | CC 1, flat = 64 |
| Roll, left / right, −90° … 90° | CC 2, flat = 64 |
| Yaw, rotation, 360° | CC 3, starting direction = 64 |
| Network round trip, phone → broker → phone | CC 4, 0–500 ms → 0–127 |
| XY pad | CC 5 (X) and CC 6 (Y), bottom-left 0, top-right 127 |
| XY pad, while touched | Note 60, velocity 100 |
| Slider | CC 7 |

Everything is sent on `{prefix}/in/…`, on the channel set in Setup.

- **Yaw** is measured from the direction the phone faces on Connect. Tap the Yaw row to re-centre it, e.g. after drift.
- **Network** pings `{prefix}/ping/{name}` every 500 ms and reports the real round trip of each ping. A ping without a reply within 1 s counts as lost and sends 127.

## Setup

| Field | Default | |
|---|---|---|
| Broker | `wss://public.cloud.shiftr.io` | WebSocket URL of the broker |
| User / Password | `public` / `public` | Broker login |
| Prefix | `remote` | Topic prefix, the same as in Max |
| Name | `phone-` + 4 random characters | Presence name |
| Channel | 1 | MIDI channel |
| Echo notes | off | Sends notes arriving on `{prefix}/out/…` back on `{prefix}/in/…`, for latency tests |

The page remembers the fields in the browser. While connected, the header shows `{prefix}/{name}`, and Setup lists the clients online under the same prefix.

## Topics

| Topic | |
|---|---|
| `{prefix}/in/cc/{channel}/{controller}` | Controls, 1 byte |
| `{prefix}/in/noteon/{channel}/60`, `…/noteoff/…` | XY pad note |
| `{prefix}/out/noteon/…`, `…/noteoff/…` | Notes to echo, when Echo notes is on |
| `{prefix}/status/{name}` | `online` / `offline`, retained, QoS 1, with a last will |
| `{prefix}/ping/{name}` | Round-trip ping to itself |

## Hosting your own

The phone app is a single HTML file with no build step. To adapt it, copy `phone/index.html` and serve it over HTTPS, e.g. from a fork with GitHub Pages. It loads [@grantler-instruments/mqtt-midi](https://github.com/grantler-instruments/mqtt-midi) 0.1.0 and MQTT.js 5.16.0 from esm.sh.
