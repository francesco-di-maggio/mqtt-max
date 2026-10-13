# Phone app

A web app that sends a phone's controls, motion and sound level over MQTT, as MIDI or as Homie values. Open [francesco-di-maggio.github.io/mqtt-max/phone/](https://francesco-di-maggio.github.io/mqtt-max/phone/), set up the broker and tap Connect.

Motion and Sound level need HTTPS and a permission, which the browser asks for on Connect when the input is on. All iOS browsers behave the same, since they share Safari's engine.

## Controls

| Input | On by default | Send: MIDI | Send: Homie |
|---|---|---|---|
| Motion: pitch, front / back, −180° … 180° | off | CC 1, flat = 64 | `motion/pitch`, ° |
| Motion: roll, left / right, −90° … 90° | off | CC 2, flat = 64 | `motion/roll`, ° |
| Motion: yaw, rotation, 360° | off | CC 3, starting direction = 64 | `motion/yaw`, −180° … 180°, starting direction = 0 |
| Network: round trip, phone → broker → phone | on | CC 4, 0–500 ms → 0–127 | `network/rtt`, ms |
| XY pad | on | CC 5 (X) and CC 6 (Y), bottom-left 0, top-right 127 | `pad/x`, `pad/y`, 0–1 |
| XY pad, while touched | on | Note 60, velocity 100 | `pad/touch`, `true` / `false` |
| Sliders 1–4 | on | CC 7–10 | `slider/1` … `slider/4`, 0–1 |
| Buttons 1–4, while pressed | on | Notes 36–39, velocity 100 | `button/1` … `button/4`, `true` / `false` |
| Sound level, −60 … 0 dBFS | off | CC 11, −60 dBFS → 0, 0 dBFS → 127 | `sound/level`, dBFS |

- **Yaw** is measured from the direction the phone faces on Connect. Tap the Yaw row to re-centre it, e.g. after drift.
- Inputs are switched on and off in Setup. An input that is off is hidden, sends nothing and is left out of the Homie description.
- **Network** pings `{prefix}/ping/{id}` every 500 ms and reports the real round trip of each ping. A ping without a reply within 1 s counts as lost and sends 127 as MIDI.

## Setup

| Field | Default | |
|---|---|---|
| Broker | `wss://public.cloud.shiftr.io` | WebSocket URL of the broker |
| User / Password | `public` / `public` | Broker login |
| Prefix | `remote` | First topic level and Homie domain, the same as in Max |
| ID | `phone-` + 4 random hex digits | Homie device ID |
| Send | MIDI | MIDI or Homie values |
| Channel | 1 | MIDI channel |
| Echo notes | off | Sends notes arriving on `{prefix}/{id}/midi/in` back on `{prefix}/{id}/midi`, for latency tests |

Prefix and ID accept a-z, 0-9 and `-`, as Homie topic IDs require. Typed capitals are lowercased, accents removed and spaces replaced with `-`; other characters are dropped. The page remembers the fields in the browser. While connected, the connection fields and inputs are locked, the header shows `{prefix}/{id}`, and Setup lists the Homie devices that are ready under the same prefix.

## Topics

The phone is always a Homie 5 device. With Send: MIDI it publishes MIDI messages, one complete message per MQTT message.

| Topic | |
|---|---|
| `{prefix}/5/{id}/$state` | `init`, `ready`, `disconnected`; `lost` as the last will. Retained, QoS 2 |
| `{prefix}/5/{id}/$description` | The device description: no nodes with Send: MIDI, the nodes above with Send: Homie |
| `{prefix}/5/{id}/{node}/{property}` | Send: Homie values, not retained, QoS 0 |
| `{prefix}/{id}/midi` | Send: MIDI controls and the XY pad note, as MIDI messages |
| `{prefix}/{id}/midi/in` | MIDI to the phone: note on and note off are sent back when Echo notes is on |
| `{prefix}/ping/{id}` | Round-trip ping to itself |

## Hosting your own

The phone app is a single HTML file with no build step. To adapt it, copy `site/phone/index.html` and serve it over HTTPS, e.g. from a fork with GitHub Pages. It loads MQTT.js 5.16.0 from esm.sh.
