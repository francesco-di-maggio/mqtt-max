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
        "rect": [ 100.0, 100.0, 721.0, 701.0 ],
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
                    "text": "MQTT for Max: client, broker, send and receive, Homie."
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
                    "fontface": 1,
                    "id": "c3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 423.0, 110.0, 20.0 ],
                    "text": "3  ·  EXAMPLES"
                }
            },
            {
                "box": {
                    "id": "pcontrol",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 640.0, 448.0, 51.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 631.0, 403.0, 35.0 ],
                    "text": ";\rmax launchbrowser https://francesco-di-maggio.github.io/mqtt-max/remote/"
                }
            },
            {
                "box": {
                    "id": "cphone",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 437.0, 638.5, 85.0, 20.0 ],
                    "text": "the Remote"
                }
            },
            {
                "box": {
                    "id": "h0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 240.0, 123, 22.0 ],
                    "text": "help mqtt.client"
                }
            },
            {
                "box": {
                    "id": "ch0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 240.0, 280.0, 20.0 ],
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
                    "patching_rect": [ 20.0, 268.0, 123, 22.0 ],
                    "text": "help mqtt.broker"
                }
            },
            {
                "box": {
                    "id": "ch1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 268.0, 280.0, 20.0 ],
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
                    "patching_rect": [ 20.0, 296.0, 109, 22.0 ],
                    "text": "help mqtt.send"
                }
            },
            {
                "box": {
                    "id": "ch2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 296.0, 280.0, 20.0 ],
                    "text": "publish to one topic, like [send]"
                }
            },
            {
                "box": {
                    "id": "h3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 324.0, 130, 22.0 ],
                    "text": "help mqtt.receive"
                }
            },
            {
                "box": {
                    "id": "ch3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 324.0, 280.0, 20.0 ],
                    "text": "messages on one topic, like [receive]"
                }
            },
            {
                "box": {
                    "id": "h4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 352.0, 164, 22.0 ],
                    "text": "help mqtt.homie.device"
                }
            },
            {
                "box": {
                    "id": "ch4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 352.0, 280.0, 20.0 ],
                    "text": "Max as a Homie device"
                }
            },
            {
                "box": {
                    "id": "h5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 380.0, 191, 22.0 ],
                    "text": "help mqtt.homie.controller"
                }
            },
            {
                "box": {
                    "id": "ch5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 380.0, 280.0, 20.0 ],
                    "text": "discover and control Homie devices"
                }
            },
            {
                "box": {
                    "id": "e0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 448.0, 266, 22.0 ],
                    "text": "loadunique mqtt-shared-session.maxpat"
                }
            },
            {
                "box": {
                    "id": "ce0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 301.0, 448.0, 300.0, 20.0 ],
                    "text": "patches in different places share one session"
                }
            },
            {
                "box": {
                    "id": "e1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 476.0, 252, 22.0 ],
                    "text": "loadunique mqtt-remote-sound.maxpat"
                }
            },
            {
                "box": {
                    "id": "ce1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 287.0, 476.0, 300.0, 20.0 ],
                    "text": "phones play a synth in Max"
                }
            },
            {
                "box": {
                    "id": "e2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 504.0, 245, 22.0 ],
                    "text": "loadunique mqtt-remote-midi.maxpat"
                }
            },
            {
                "box": {
                    "id": "ce2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 280.0, 504.0, 300.0, 20.0 ],
                    "text": "phones control a DAW"
                }
            },
            {
                "box": {
                    "id": "e3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 532.0, 252, 22.0 ],
                    "text": "loadunique mqtt-synth-device.maxpat"
                }
            },
            {
                "box": {
                    "id": "ce3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 287.0, 532.0, 300.0, 20.0 ],
                    "text": "a Max synth anyone on the network can play"
                }
            },
            {
                "box": {
                    "id": "e4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 560.0, 259, 22.0 ],
                    "text": "loadunique mqtt-local-network.maxpat"
                }
            },
            {
                "box": {
                    "id": "ce4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 294.0, 560.0, 300.0, 20.0 ],
                    "text": "no internet: Max is the broker"
                }
            },
            {
                "box": {
                    "id": "e5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 588.0, 245, 22.0 ],
                    "text": "loadunique mqtt-round-trips.maxpat"
                }
            },
            {
                "box": {
                    "id": "ce5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 280.0, 588.0, 300.0, 20.0 ],
                    "text": "how fast is the connection"
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
                    "destination": [ "client", 0 ],
                    "source": [ "npm", 0 ]
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
                    "destination": [ "pcontrol", 0 ],
                    "source": [ "h5", 0 ]
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
                    "source": [ "e4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pcontrol", 0 ],
                    "source": [ "e5", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}