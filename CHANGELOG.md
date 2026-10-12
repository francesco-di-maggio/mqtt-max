# Changelog

All notable changes are listed here. Versions follow [Semantic Versioning](https://semver.org/).

## 0.1.0 — unreleased

First release as a Max package.

- `[mqtt.client]`: MQTT 3.1.1 over TCP, TLS and WebSocket; subscribe, publish text, bytes or JSON dictionaries; QoS, retain, last will, keepalive, clean session; one connection shared by name.
- `[mqtt.broker]`: an MQTT 3.1.1 broker (Aedes) on TCP, TLS, WebSocket and secure WebSocket, with optional login; reports client connections and subscriptions.
- `[mqtt.midi]`: MIDI messages over MQTT, including SysEx and clock, as raw MIDI bytes, on topics set with `@receive` and `@send`; optional virtual MIDI port on macOS.
- `[mqtt.homie.device]` and `[mqtt.homie.controller]`: Homie 5 devices and controllers: state and last will, descriptions, typed values with ranges and steps, commands, broadcasts, alerts and logs.
- Help files with tabs and reference pages for every object; four examples with the phone app; a landing patch.
- Phone app: tilt, XY pad and slider, sent as MIDI or as Homie values.
