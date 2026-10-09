# mqtt-max

MIDI over MQTT between phones, browsers and Max, using the topic format of [@grantler-instruments/mqtt-midi](https://github.com/grantler-instruments/mqtt-midi). `mqtt-bridge.maxpat` bridges MQTT to the MIDI port `mqtt-max` from inside Max; [Midge](https://github.com/grantler-instruments/midge) does the same as a separate app, on the port `midge`.

```
phone --MQTT--> broker --MQTT--> mqtt-bridge.maxpat (or Midge) --MIDI--> ctlin / notein
```

## Contents

- `phone/` — web controller, served at [francesco-di-maggio.github.io/mqtt-max/phone/](https://francesco-di-maggio.github.io/mqtt-max/phone/). Pitch / roll / yaw → CC 1–3, slider → CC 4, pad → note 60, all on `{prefix}/in/…`. "Echo notes" sends notes arriving on `{prefix}/out/…` back on `{prefix}/in/…`, for latency tests.
- `max/mqtt-client.js` — Max `node.script` MQTT client (`connect`, `subscribe`, `publish`, `publishbytes`, `publishjson`, `format text|bytes|json`, `prefix`, `port`). mqtt-midi topics under the prefix also come out decoded, e.g. `midi in cc 1 7 64`. `@args --prefix <prefix> --port <name>` (or the `prefix` / `port` messages) sets the prefix (default `remote`) and creates a virtual MIDI port: `{prefix}/in/…` is subscribed and played on it, and MIDI sent to it is published on `{prefix}/out/…`, as Midge does (note on with velocity 0 → `noteoff`, clock/start/stop/continue included, SysEx not).

| Patch | |
|---|---|
| `mqtt-bridge.maxpat` | The bridge: creates the `mqtt-max` port. Keep it open while using the patches below. |
| `midi-test.maxpat` | Phone in with `ctlin`/`notein`, CC and note out with `ctlout`/`noteout`. |
| `phone-to-live.maxpat` | Smooths CC 1–4 with `line` and sends them as CC 20–23 (pad note passed through) to a MIDI output such as "from Max 1". |
| `phone-latency.maxpat` | Phone input + latency tests: laptop ↔ broker, and the full loop through the phone. |
| `mqtt-raw.maxpat` | Plain MQTT client for non-MIDI data, no MIDI port. `format json` turns JSON payloads into dicts; `publishjson` sends a dict as JSON. |

The MIDI patches read the `mqtt-max` port; click `port midge` in them to use Midge instead. Run one bridge at a time, or every message arrives twice.

## Setup

1. Broker: `public.cloud.shiftr.io` (user/pass `public`, shared and publicly visible) or a local one such as [ragazzi](https://github.com/grantler-instruments/ragazzi).
2. Bridge: open `max/mqtt-bridge.maxpat` and click a connect. On first use on a new machine, click `script npm install`. Or Midge: same broker and prefix, create the virtual port `midge`, enable Listen.
3. Max: open a patch in `max/`.
4. Phone: open the page (HTTPS is required for motion sensors), enter broker and prefix, tap Connect.

The pages are static files with no build step, deployed by GitHub Pages from `main`.
