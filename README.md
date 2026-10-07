# mqtt-web

Browser controllers that send MIDI over MQTT, using the topic format of [@grantler-instruments/mqtt-midi](https://github.com/grantler-instruments/mqtt-midi). Static pages, no build step, served with GitHub Pages.

## Pages

- `phone/` — phone tilt → CC 1–3, touch pad → note 60. Publishes on `{prefix}/in/…`.

## Use

1. Open the page on the phone (HTTPS is required for motion sensors).
2. Enter broker URL, username, password and prefix, then tap Connect. Settings are remembered in the browser.
3. On the computer, run [Midge](https://github.com/grantler-instruments/midge) on the same broker and prefix. The MIDI arrives on Midge's virtual port.

Default broker is `wss://public.cloud.shiftr.io` (user/pass `public`), which is shared and publicly visible.
