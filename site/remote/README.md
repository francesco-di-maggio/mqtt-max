# Remote

Web app. Sends pad, sliders, buttons, motion and mic level from any browser over MQTT, as Homie values.

[francesco-di-maggio.github.io/mqtt-max/remote/](https://francesco-di-maggio.github.io/mqtt-max/remote/)

Motion and Mic level need HTTPS. The browser asks for permission on Connect. A blocked permission is changed in the browser's site settings.

## Inputs

Switched on and off in Setup. An input that is off is hidden, sends nothing and is not in the description. An input that cannot work is greyed out: Motion without a motion sensor, Motion and Mic level on a page without HTTPS. Each value is a Homie property: `{prefix}/5/{id}/{node}/{property}`.

| Input | Default | Property | Value |
|---|---|---|---|
| Round trip | on | `round-trip/time` | ms |
| Motion | off | `motion/pitch` | −180 … 180, ° |
| | | `motion/roll` | −90 … 90, ° |
| | | `motion/yaw` | −180 … 180, °; 0 = direction on Connect |
| Mic level | off | `mic/level` | −60 … 0, dBFS |
| XY pad | on | `pad/x`, `pad/y` | 0 … 1, bottom-left = 0 |
| | | `pad/touch` | `true` while touched |
| Sliders | on | `slider/1` … `slider/4` | 0 … 1 |
| Buttons | on | `button/1` … `button/8` | `true` while pressed |

- Yaw: tap the Yaw row to reset 0.
- Mic level: RMS of the input, with the browser's gain control, noise suppression and echo cancellation off.
- Motion: no reading within 1 s of Connect shows `—` and `no motion sensor`, e.g. on a computer.
- Round trip: pings `{prefix}/ping/{id}` every 500 ms. No reply within 1 s shows `lost`.

## Setup

| Field | Default | |
|---|---|---|
| URL | `wss://public.cloud.shiftr.io` | Broker, WebSocket URL |
| User, Password | `public`, `public` | |
| Prefix | `remote` | First topic level, Homie domain |
| ID | `phone-`, `tablet-` or `computer-` + 4 hex digits | Homie device ID |

- Prefix and ID: a-z, 0-9, `-`. Capitals are lowercased, accents removed, spaces become `-`, other characters are dropped.
- Theme: the header button cycles Auto (system), Light, Dark. Saved.
- Settings are saved in the browser on every change. Tabs in one browser share the ID: connect one at a time.
- Two tabs: Setup and Inputs. The Remote opens on Setup until the first Connect, then on Inputs.
- Connect: the button at the bottom of Setup. The header button shows the state and opens Setup: offline it reads Offline; connected it shows `{id} · {n}`, where n is the number of ready Homie devices under the prefix, this one included.
- While connected: fields and inputs are locked, the screen stays on. Disconnect is at the bottom of Setup.

### Link parameters

`…/remote/?broker=wss://broker.example:8884&prefix=studio&inputs=pad,slider,button`

Applied over the saved settings, saved, then removed from the address bar.

| Parameter | Value |
|---|---|
| `broker`, `user`, `password` | Text |
| `prefix`, `id` | Text, cleaned as when typed |
| `inputs` | Inputs that are on: `motion`, `round-trip`, `pad`, `slider`, `button`, `mic` |

A link with `password` contains the password.

## Topics

A Homie 5 device.

| Topic | |
|---|---|
| `{prefix}/5/{id}/$state` | `init`, `ready`, `disconnected`, `lost` (last will). Retained, QoS 2 |
| `{prefix}/5/{id}/$description` | Nodes of the inputs that are on. Retained, QoS 2 |
| `{prefix}/5/{id}/{node}/{property}` | Values. Not retained, QoS 0 |
| `{prefix}/ping/{id}` | Latency ping |

## Hosting

One HTML file, no build step. Serve `site/remote/index.html` over HTTPS. Loads MQTT.js 5.16.0 from esm.sh.
