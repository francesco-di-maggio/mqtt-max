# mqtt-max

MIDI over MQTT between phones, browsers and Max, using the topic format of [@grantler-instruments/mqtt-midi](https://github.com/grantler-instruments/mqtt-midi). [Midge](https://github.com/grantler-instruments/midge) bridges MQTT to a MIDI port on the computer.

```
phone --MQTT--> broker --MQTT--> Midge --MIDI--> Max
```

## Contents

- `phone/` — web controller, served at [francesco-di-maggio.github.io/mqtt-max/phone/](https://francesco-di-maggio.github.io/mqtt-max/phone/). Pitch / roll / yaw → CC 1–3, slider → CC 4, pad → note 60, all on `{prefix}/in/…`. "Echo notes" sends notes arriving on `{prefix}/out/…` back on `{prefix}/in/…`, for latency tests.
- `max/mqtt-client.js` — Max `node.script` MQTT client (`connect`, `subscribe`, `publish`, `publishbytes`, `format text|bytes`).
- `max/mqtt-client.maxpat` — test patch for the client, Midge and MIDI notes/CC.
- `max/phone-midi-latency.maxpat` — phone input plus round-trip latency tests (baseline and full loop through the phone).

## Setup

1. Broker: `public.cloud.shiftr.io` (user/pass `public`, shared and publicly visible) or a local one such as [ragazzi](https://github.com/grantler-instruments/ragazzi).
2. Midge: same broker and prefix, create the virtual port `midge`, enable Listen.
3. Max: open a patch in `max/`. On first use on a new machine, click `script npm install`.
4. Phone: open the page (HTTPS is required for motion sensors), enter broker and prefix, tap Connect.

The pages are static files with no build step, deployed by GitHub Pages from `main`.
