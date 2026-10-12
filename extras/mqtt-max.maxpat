{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 2,
            "revision": 0,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 100.0, 100.0, 620.0, 560.0 ],
        "boxes": [
            {
                "box": {
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 200.0, 20.0 ],
                    "text": "mqtt-max",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "lead",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 520.0, 20.0 ],
                    "text": "MQTT for Max: a client, MIDI over MQTT, and Homie devices."
                }
            },
            {
                "box": {
                    "id": "c1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 85.0, 300.0, 20.0 ],
                    "text": "1  ·  ONCE PER COMPUTER",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "npm",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 110.0, 110.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "script npm install"
                }
            },
            {
                "box": {
                    "id": "client",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 140.0, 75.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "mqtt.client"
                }
            },
            {
                "box": {
                    "id": "pnpm",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 110.0, 170.0, 90.0, 22.0 ],
                    "text": "print mqtt-max"
                }
            },
            {
                "box": {
                    "id": "cnpm",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 140.0, 110.0, 440.0, 20.0 ],
                    "text": "installs MQTT.js and the MIDI port module; the Max Console reports when done"
                }
            },
            {
                "box": {
                    "id": "c2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 215.0, 300.0, 20.0 ],
                    "text": "2  ·  OBJECTS",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "h0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 240.0, 150.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "help mqtt.client"
                }
            },
            {
                "box": {
                    "id": "ch0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 180.0, 240.0, 330.0, 20.0 ],
                    "text": "a connection to a broker: publish and subscribe"
                }
            },
            {
                "box": {
                    "id": "h1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 268.0, 150.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "help mqtt.midi"
                }
            },
            {
                "box": {
                    "id": "ch1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 180.0, 268.0, 330.0, 20.0 ],
                    "text": "MIDI over MQTT, with a virtual MIDI port"
                }
            },
            {
                "box": {
                    "id": "h2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 296.0, 150.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "help mqtt.homie.device"
                }
            },
            {
                "box": {
                    "id": "ch2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 180.0, 296.0, 330.0, 20.0 ],
                    "text": "Max as a Homie device"
                }
            },
            {
                "box": {
                    "id": "h3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 324.0, 150.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "help mqtt.homie.controller"
                }
            },
            {
                "box": {
                    "id": "ch3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 180.0, 324.0, 330.0, 20.0 ],
                    "text": "discover and control Homie devices"
                }
            },
            {
                "box": {
                    "id": "c3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 365.0, 300.0, 20.0 ],
                    "text": "3  ·  EXAMPLES  (with the phone app)",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "e0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 390.0, 200.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "loadunique mqtt-phone-midi.maxpat"
                }
            },
            {
                "box": {
                    "id": "ce0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 230.0, 390.0, 200.0, 20.0 ],
                    "text": "phone → MIDI port"
                }
            },
            {
                "box": {
                    "id": "e1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 418.0, 200.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "loadunique mqtt-phone-homie.maxpat"
                }
            },
            {
                "box": {
                    "id": "ce1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 230.0, 418.0, 200.0, 20.0 ],
                    "text": "phone → Homie values"
                }
            },
            {
                "box": {
                    "id": "e2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 446.0, 200.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "loadunique mqtt-phone-live.maxpat"
                }
            },
            {
                "box": {
                    "id": "ce2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 230.0, 446.0, 200.0, 20.0 ],
                    "text": "phone → Ableton Live"
                }
            },
            {
                "box": {
                    "id": "e3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 474.0, 200.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "loadunique mqtt-phone-latency.maxpat"
                }
            },
            {
                "box": {
                    "id": "ce3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 230.0, 474.0, 200.0, 20.0 ],
                    "text": "round trips"
                }
            },
            {
                "box": {
                    "id": "pcontrol",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 450.0, 390.0, 60.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "pcontrol"
                }
            },
            {
                "box": {
                    "id": "phone",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 515.0, 470.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": ";\rmax launchbrowser https://francesco-di-maggio.github.io/mqtt-max/phone/"
                }
            },
            {
                "box": {
                    "id": "cphone",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 500.0, 515.0, 100.0, 20.0 ],
                    "text": "the phone app"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "client", 0 ],
                    "source": [ "npm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pnpm", 0 ],
                    "source": [ "client", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pcontrol", 0 ],
                    "source": [ "h0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pcontrol", 0 ],
                    "source": [ "h1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pcontrol", 0 ],
                    "source": [ "h2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pcontrol", 0 ],
                    "source": [ "h3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pcontrol", 0 ],
                    "source": [ "e0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pcontrol", 0 ],
                    "source": [ "e1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pcontrol", 0 ],
                    "source": [ "e2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pcontrol", 0 ],
                    "source": [ "e3", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}