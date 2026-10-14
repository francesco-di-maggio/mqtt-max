# Changelog

All notable changes are listed here. Versions follow [Semantic Versioning](https://semver.org/).

## 0.1.0 — unreleased

First release as a Max package.

- `[mqtt.client]`: MQTT 3.1.1 over TCP, TLS and WebSocket; subscribe, publish text, bytes or JSON dictionaries; QoS, retain, last will, keepalive, clean session; one connection shared by name; messages sent before the script is ready are held.
- `[mqtt.broker]`: an MQTT 3.1.1 broker (Aedes) on TCP, TLS, WebSocket and secure WebSocket, with optional login; reports client connections and subscriptions.
- `[mqtt.send]` and `[mqtt.receive]`: one topic per object, like `[send]` and `[receive]`; retain, QoS, wildcards; text, raw bytes or JSON; retained messages output or skipped.
- `[mqtt.homie.device]` and `[mqtt.homie.controller]`: Homie 5 devices and controllers: state and last will, descriptions, typed values with ranges and steps, commands, broadcasts, alerts and logs.
- Help files with tabs and reference pages for every object; seven examples, one per setup; a landing patch.
- Remote: web app for phones, tablets and computers. Motion, round trip, XY pad, 4 sliders, 8 buttons, mic level, as Homie values.
