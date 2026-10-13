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
        "rect": [ 100.0, 100.0, 620.0, 590.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 63.0, 20.0 ],
                    "text": "mqtt-max"
                }
            },
            {
                "box": {
                    "id": "lead",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 337.0, 20.0 ],
                    "text": "MQTT for Max: client, broker, MIDI, Homie."
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "c1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 85.0, 167.0, 20.0 ],
                    "text": "1  ·  ONCE PER COMPUTER"
                }
            },
            {
                "box": {
                    "id": "npm",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 110.0, 98.0, 22.0 ],
                    "text": "script npm install"
                }
            },
            {
                "box": {
                    "id": "client",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 140.0, 63.0, 22.0 ],
                    "text": "mqtt.client"
                }
            },
            {
                "box": {
                    "id": "pnpm",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 110.0, 170.0, 85.0, 22.0 ],
                    "text": "print mqtt-max"
                }
            },
            {
                "box": {
                    "id": "cnpm",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 140.0, 110.0, 431.0, 20.0 ],
                    "text": "installs the Node modules. The Max Console reports when done."
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "c2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 215.0, 89.0, 20.0 ],
                    "text": "2  ·  OBJECTS"
                }
            },
            {
                "box": {
                    "id": "h0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 240.0, 89.0, 22.0 ],
                    "text": "help mqtt.client"
                }
            },
            {
                "box": {
                    "id": "ch0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 180.0, 240.0, 260.0, 20.0 ],
                    "text": "connection to a broker"
                }
            },
            {
                "box": {
                    "id": "h1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 268.0, 95.0, 22.0 ],
                    "text": "help mqtt.broker"
                }
            },
            {
                "box": {
                    "id": "ch1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 180.0, 268.0, 188.0, 20.0 ],
                    "text": "broker on this computer"
                }
            },
            {
                "box": {
                    "id": "h2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 296.0, 83.0, 22.0 ],
                    "text": "help mqtt.midi"
                }
            },
            {
                "box": {
                    "id": "ch2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 180.0, 296.0, 223.0, 20.0 ],
                    "text": "MIDI over MQTT, with a virtual MIDI port"
                }
            },
            {
                "box": {
                    "id": "h3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 324.0, 132.0, 22.0 ],
                    "text": "help mqtt.homie.device"
                }
            },
            {
                "box": {
                    "id": "ch3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 180.0, 324.0, 133.0, 20.0 ],
                    "text": "Max as a Homie device"
                }
            },
            {
                "box": {
                    "id": "h4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 352.0, 147.0, 22.0 ],
                    "text": "help mqtt.homie.controller"
                }
            },
            {
                "box": {
                    "id": "ch4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 180.0, 352.0, 198.0, 20.0 ],
                    "text": "discover and control Homie devices"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "c3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 393.0, 223.0, 20.0 ],
                    "text": "3  ·  EXAMPLES  (with the remote)"
                }
            },
            {
                "box": {
                    "id": "e0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 418.0, 200.0, 22.0 ],
                    "text": "loadunique mqtt-remote-midi.maxpat"
                }
            },
            {
                "box": {
                    "id": "ce0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 230.0, 418.0, 110.0, 20.0 ],
                    "text": "remote → MIDI port"
                }
            },
            {
                "box": {
                    "id": "e1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 446.0, 211.0, 22.0 ],
                    "text": "loadunique mqtt-remote-homie.maxpat"
                }
            },
            {
                "box": {
                    "id": "ce1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 230.0, 446.0, 133.0, 20.0 ],
                    "text": "remote → Homie values"
                }
            },
            {
                "box": {
                    "id": "e2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 474.0, 196.0, 22.0 ],
                    "text": "loadunique mqtt-remote-live.maxpat"
                }
            },
            {
                "box": {
                    "id": "ce2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 230.0, 474.0, 126.0, 20.0 ],
                    "text": "remote → Ableton Live"
                }
            },
            {
                "box": {
                    "id": "e3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 502.0, 215.0, 22.0 ],
                    "text": "loadunique mqtt-remote-latency.maxpat"
                }
            },
            {
                "box": {
                    "id": "ce3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 230.0, 502.0, 65.0, 20.0 ],
                    "text": "round trips"
                }
            },
            {
                "box": {
                    "id": "pcontrol",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 450.0, 418.0, 51.0, 22.0 ],
                    "text": "pcontrol"
                }
            },
            {
                "box": {
                    "id": "phone",
                    "linecount": 2,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 543.0, 403.0, 35.0 ],
                    "text": ";\rmax launchbrowser https://francesco-di-maggio.github.io/mqtt-max/remote/"
                }
            },
            {
                "box": {
                    "id": "cphone",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 437.0, 550.5, 85.0, 20.0 ],
                    "text": "the remote"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "pnpm", 0 ],
                    "source": [ "client", 1 ]
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
                    "source": [ "h4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "client", 0 ],
                    "source": [ "npm", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}