# mqtt-max

MIDI over MQTT between phones, browsers and Max, using the topic format of [@grantler-instruments/mqtt-midi](https://github.com/grantler-instruments/mqtt-midi). [Midge](https://github.com/grantler-instruments/midge) bridges MQTT to a MIDI port on the computer.

```
phone --MQTT--> broker --MQTT--> Midge --MIDI--> Max
```

## Contents

- `phone/` — web controller, served at [francesco-di-maggio.github.io/mqtt-max/phone/](https://francesco-di-maggio.github.io/mqtt-max/phone/). Pitch / roll / yaw → CC 1–3, slider → CC 4, pad → note 60, all on `{prefix}/in/…`. "Echo notes" sends notes arriving on `{prefix}/out/…` back on `{prefix}/in/…`, for latency tests.
- `max/mqtt-client.js` — Max `node.script` MQTT client (`connect`, `subscribe`, `publish`, `publishbytes`, `format text|bytes`). mqtt-midi topics also come out decoded, e.g. `midi in cc 1 7 64`.
- `max/mqtt-client.maxpat` — test patch for the client, Midge and MIDI notes/CC.

Two versions of each phone patch:

| Patch | With Midge | Max only |
|---|---|---|
| Phone input + latency tests | `mqtt-phone-midi-latency-midge.maxpat` | `mqtt-phone-midi-latency-max.maxpat` |
| Phone → smoothing → Ableton Live | `mqtt-phone-to-live-midge.maxpat` | `mqtt-phone-to-live-max.maxpat` |

- **With Midge**: Midge turns MQTT into the MIDI port `midge`; Max reads it with `ctlin`/`notein`.
- **Max only**: `node.script` subscribes to `remote/in/#` and decodes the MIDI itself. Quit Midge while using these.
- The Live patches smooth CC 1–4 with `line` and send them as CC 20–23 (pad note passed through) to a MIDI output such as "from Max 1".

## Setup

1. Broker: `public.cloud.shiftr.io` (user/pass `public`, shared and publicly visible) or a local one such as [ragazzi](https://github.com/grantler-instruments/ragazzi).
2. Midge: same broker and prefix, create the virtual port `midge`, enable Listen.
3. Max: open a patch in `max/`. On first use on a new machine, click `script npm install`.
4. Phone: open the page (HTTPS is required for motion sensors), enter broker and prefix, tap Connect.

The pages are static files with no build step, deployed by GitHub Pages from `main`.
