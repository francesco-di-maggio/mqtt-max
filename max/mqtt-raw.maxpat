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
        "rect": [ 140.0, 140.0, 600.0, 400.0 ],
        "boxes": [
            {
                "box": {
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 500.0, 20.0 ],
                    "text": "MQTT CLIENT  (raw topics, no MIDI port)",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "info",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 550.0, 33.0 ],
                    "text": "Plain MQTT for non-MIDI data, e.g. sensors or an ESP32. Without a port message no MIDI port\nis created, so this runs next to mqtt-bridge.maxpat.",
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "conn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 85.0, 290.0, 22.0 ],
                    "text": "connect mqtt://public.cloud.shiftr.io public public"
                }
            },
            {
                "box": {
                    "id": "connl",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 115.0, 175.0, 22.0 ],
                    "text": "connect mqtt://localhost:1883"
                }
            },
            {
                "box": {
                    "id": "disc",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 205.0, 115.0, 70.0, 22.0 ],
                    "text": "disconnect"
                }
            },
            {
                "box": {
                    "id": "sub",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 155.0, 110.0, 22.0 ],
                    "text": "subscribe test/#"
                }
            },
            {
                "box": {
                    "id": "pub",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 140.0, 155.0, 150.0, 22.0 ],
                    "text": "publish test/hello 1 2 3"
                }
            },
            {
                "box": {
                    "id": "pubb",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 155.0, 180.0, 22.0 ],
                    "text": "publishbytes test/bytes 1 2 3"
                }
            },
            {
                "box": {
                    "id": "ftxt",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 185.0, 70.0, 22.0 ],
                    "text": "format text"
                }
            },
            {
                "box": {
                    "id": "fbyt",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 100.0, 185.0, 80.0, 22.0 ],
                    "text": "format bytes"
                }
            },
            {
                "box": {
                    "id": "cfmt",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 190.0, 185.0, 320.0, 20.0 ],
                    "text": "incoming payload as words/numbers, or as raw bytes"
                }
            },
            {
                "box": {
                    "id": "node",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 225.0, 290.0, 22.0 ],
                    "text": "node.script mqtt-client.js @autostart 1 @watch 1"
                }
            },
            {
                "box": {
                    "id": "route",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 20.0, 260.0, 170.0, 22.0 ],
                    "text": "route message status error"
                }
            },
            {
                "box": {
                    "id": "pmsg",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [ 20.0, 295.0, 110.0, 22.0 ],
                    "text": "print mqtt-message"
                }
            },
            {
                "box": {
                    "id": "pst",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [ 140.0, 295.0, 100.0, 22.0 ],
                    "text": "print mqtt-status"
                }
            },
            {
                "box": {
                    "id": "perr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [ 250.0, 295.0, 95.0, 22.0 ],
                    "text": "print mqtt-error"
                }
            },
            {
                "box": {
                    "id": "pns",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [ 320.0, 260.0, 100.0, 22.0 ],
                    "text": "print node-script"
                }
            },
            {
                "box": {
                    "id": "cmsg",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 325.0, 400.0, 20.0 ],
                    "text": "mqtt-message: <topic> <payload...>"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": [ "conn", 0 ],
                    "destination": [ "node", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "connl", 0 ],
                    "destination": [ "node", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "disc", 0 ],
                    "destination": [ "node", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sub", 0 ],
                    "destination": [ "node", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "pub", 0 ],
                    "destination": [ "node", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "pubb", 0 ],
                    "destination": [ "node", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "ftxt", 0 ],
                    "destination": [ "node", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "fbyt", 0 ],
                    "destination": [ "node", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "node", 0 ],
                    "destination": [ "route", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "node", 1 ],
                    "destination": [ "pns", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "route", 0 ],
                    "destination": [ "pmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "route", 1 ],
                    "destination": [ "pst", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "route", 2 ],
                    "destination": [ "perr", 0 ]
                }
            }
        ]
    }
}