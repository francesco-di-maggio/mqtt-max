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
        "rect": [ 140.0, 140.0, 620.0, 580.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 240.0, 20.0 ],
                    "text": "MQTT CLIENT  (raw topics, no MIDI port)"
                }
            },
            {
                "box": {
                    "id": "info",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 515.0, 33.0 ],
                    "text": "Plain MQTT for non-MIDI data, e.g. sensors or an ESP32. Without a port message no MIDI port\nis created, so this runs next to mqtt-bridge.maxpat."
                }
            },
            {
                "box": {
                    "id": "conn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 85.0, 261.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 115.0, 165.0, 22.0 ],
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
                    "patching_rect": [ 205.0, 115.0, 66.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 155.0, 93.0, 22.0 ],
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
                    "patching_rect": [ 140.0, 155.0, 128.0, 22.0 ],
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
                    "patching_rect": [ 300.0, 155.0, 160.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 185.0, 65.0, 22.0 ],
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
                    "patching_rect": [ 100.0, 185.0, 75.0, 22.0 ],
                    "text": "format bytes"
                }
            },
            {
                "box": {
                    "id": "cfmt",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 280.0, 185.0, 299.0, 20.0 ],
                    "text": "payload as words/numbers, raw bytes, or JSON -> dict"
                }
            },
            {
                "box": {
                    "id": "node",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 285.0, 262.0, 22.0 ],
                    "saved_object_attributes": {
                        "autostart": 1,
                        "defer": 0,
                        "watch": 1
                    },
                    "text": "node.script mqtt-max.js @autostart 1 @watch 1",
                    "textfile": {
                        "filename": "mqtt-max.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "route",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 20.0, 320.0, 152.0, 22.0 ],
                    "text": "route message status error"
                }
            },
            {
                "box": {
                    "id": "pmsg",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 355.0, 111.0, 22.0 ],
                    "text": "print mqtt-message"
                }
            },
            {
                "box": {
                    "id": "pst",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 140.0, 355.0, 95.0, 22.0 ],
                    "text": "print mqtt-status"
                }
            },
            {
                "box": {
                    "id": "perr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 250.0, 355.0, 88.0, 22.0 ],
                    "text": "print mqtt-error"
                }
            },
            {
                "box": {
                    "id": "pns",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 320.0, 320.0, 95.0, 22.0 ],
                    "text": "print node-script"
                }
            },
            {
                "box": {
                    "id": "cmsg",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 385.0, 200.0, 20.0 ],
                    "text": "mqtt-message: <topic> <payload...>"
                }
            },
            {
                "box": {
                    "id": "fjson",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 185.0, 68.0, 22.0 ],
                    "text": "format json"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "cj",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 425.0, 297.0, 20.0 ],
                    "text": "JSON  (click subscribe test/# and format json first)"
                }
            },
            {
                "box": {
                    "id": "jn",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 450.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "jpack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "dictionary" ],
                    "patching_rect": [ 20.0, 480.0, 89.0, 22.0 ],
                    "text": "dict.pack temp:"
                }
            },
            {
                "box": {
                    "id": "jpre",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 510.0, 164.0, 22.0 ],
                    "text": "prepend publishjson test/json"
                }
            },
            {
                "box": {
                    "id": "cjs",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 75.0, 450.0, 94.0, 20.0 ],
                    "text": "send {\"temp\": n}"
                }
            },
            {
                "box": {
                    "id": "jroute",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 250.0, 450.0, 84.0, 22.0 ],
                    "text": "route test/json"
                }
            },
            {
                "box": {
                    "id": "junpack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 250.0, 480.0, 103.0, 22.0 ],
                    "saved_object_attributes": {
                        "legacy": 1
                    },
                    "text": "dict.unpack temp:"
                }
            },
            {
                "box": {
                    "id": "jout",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 250.0, 510.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cjr",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 305.0, 510.0, 84.0, 20.0 ],
                    "text": "received temp"
                }
            },
            {
                "box": {
                    "id": "q0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 215.0, 38.0, 22.0 ],
                    "text": "qos 0"
                }
            },
            {
                "box": {
                    "id": "q1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 70.0, 215.0, 38.0, 22.0 ],
                    "text": "qos 1"
                }
            },
            {
                "box": {
                    "id": "r0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 125.0, 215.0, 49.0, 22.0 ],
                    "text": "retain 0"
                }
            },
            {
                "box": {
                    "id": "r1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 185.0, 215.0, 49.0, 22.0 ],
                    "text": "retain 1"
                }
            },
            {
                "box": {
                    "id": "cqr",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 250.0, 208.0, 354.0, 33.0 ],
                    "text": "for publish and subscribe from now on. retain 1: the broker keeps\nthe last message per topic for new subscribers."
                }
            },
            {
                "box": {
                    "id": "clr",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 245.0, 98.0, 22.0 ],
                    "text": "publish test/hello"
                }
            },
            {
                "box": {
                    "id": "cclr",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 140.0, 245.0, 98.0, 20.0 ],
                    "text": "+ retain 1: clears"
                }
            },
            {
                "box": {
                    "id": "nm",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 240.0, 245.0, 61.0, 22.0 ],
                    "text": "name raw"
                }
            },
            {
                "box": {
                    "id": "sst",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 315.0, 245.0, 146.0, 22.0 ],
                    "text": "subscribe remote/status/#"
                }
            },
            {
                "box": {
                    "id": "cnm",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 480.0, 238.0, 125.0, 33.0 ],
                    "text": "name before connect:\nremote/status/raw"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "clr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "conn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "connl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "disc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "fbyt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "fjson", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "ftxt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "jpack", 0 ],
                    "source": [ "jn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "jpre", 0 ],
                    "source": [ "jpack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "jpre", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "junpack", 0 ],
                    "source": [ "jroute", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "jout", 0 ],
                    "source": [ "junpack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "nm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pns", 0 ],
                    "source": [ "node", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "route", 0 ],
                    "source": [ "node", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "pub", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "pubb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "q0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "q1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "r0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "r1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "jroute", 0 ],
                    "order": 0,
                    "source": [ "route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "perr", 0 ],
                    "source": [ "route", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pmsg", 0 ],
                    "order": 1,
                    "source": [ "route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pst", 0 ],
                    "source": [ "route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "sst", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "sub", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}