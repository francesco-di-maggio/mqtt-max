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
        "rect": [ 100.0, 100.0, 795.0, 591.0 ],
        "showrootpatcherontab": 0,
        "showontab": 0,
        "boxes": [
            {
                "box": {
                    "border": 0,
                    "filename": "helpname.js",
                    "id": "helpname",
                    "ignoreclick": 1,
                    "jsarguments": [ "mqtt.midi" ],
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 10.0, 10.0, 300.0, 58.0 ]
                }
            },
            {
                "box": {
                    "id": "starter",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 10.0, 75.0, 180.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "helpstarter.js",
                        "parameter_enable": 0
                    },
                    "text": "js helpstarter.js mqtt.midi"
                }
            },
            {
                "box": {
                    "id": "tab-basic_tab",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 0.0, 26.0, 795.0, 565.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpdetails.js",
                                    "id": "details",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "mqtt.midi" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 640.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 630.0, 20.0 ],
                                    "text": "One or more complete MIDI messages per MQTT message. @send: topic. @receive: topic filter."
                                }
                            },
                            {
                                "box": {
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 20.0, 220.0, 115.0, 22.0 ],
                                    "text": "mqtt.client midi-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "conn",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 150.0, 261.0, 22.0 ],
                                    "text": "connect mqtt://public.cloud.shiftr.io public public"
                                }
                            },
                            {
                                "box": {
                                    "id": "disc",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 300.0, 150.0, 66.0, 22.0 ],
                                    "text": "disconnect"
                                }
                            },
                            {
                                "box": {
                                    "id": "ks",
                                    "maxclass": "kslider",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 20.0, 270.0, 196.0, 34.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "pack",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 320.0, 54.0, 22.0 ],
                                    "text": "pack 0 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "fmt",
                                    "maxclass": "newobj",
                                    "numinlets": 7,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "" ],
                                    "patching_rect": [ 20.0, 350.0, 82.0, 22.0 ],
                                    "text": "midiformat"
                                }
                            },
                            {
                                "box": {
                                    "id": "ctl",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 20.0, 380.0, 284.0, 22.0 ],
                                    "text": "mqtt.midi midi-help @send mqtt-max-help/keys/midi"
                                }
                            },
                            {
                                "box": {
                                    "id": "cctl",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 405.0, 41.0, 20.0 ],
                                    "text": "sends"
                                }
                            },
                            {
                                "box": {
                                    "id": "inst",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 380.0, 270.0, 297.0, 22.0 ],
                                    "text": "mqtt.midi midi-help @receive mqtt-max-help/keys/midi"
                                }
                            },
                            {
                                "box": {
                                    "id": "cinst",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 245.0, 53.0, 20.0 ],
                                    "text": "receives"
                                }
                            },
                            {
                                "box": {
                                    "id": "parse",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 8,
                                    "outlettype": [ "", "", "", "int", "int", "", "int", "" ],
                                    "patching_rect": [ 380.0, 300.0, 92.5, 22.0 ],
                                    "text": "midiparse"
                                }
                            },
                            {
                                "box": {
                                    "id": "ks2",
                                    "maxclass": "kslider",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 380.0, 330.0, 196.0, 34.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "cbytes",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 440.0, 389.0, 20.0 ],
                                    "text": "In and out: raw MIDI bytes, as [midiin] and [midiout]."
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "conn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "disc", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ctl", 0 ],
                                    "source": [ "fmt", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "parse", 0 ],
                                    "source": [ "inst", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pack", 1 ],
                                    "source": [ "ks", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pack", 0 ],
                                    "source": [ "ks", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "fmt", 0 ],
                                    "source": [ "pack", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ks2", 0 ],
                                    "source": [ "parse", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 110.0, 120.0, 22.0 ],
                    "text": "p basic",
                    "varname": "basic_tab"
                }
            },
            {
                "box": {
                    "id": "tab-basic_tab[1]",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 0.0, 26.0, 795.0, 565.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpdetails.js",
                                    "id": "details",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "mqtt.midi" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 640.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 681.0, 33.0 ],
                                    "text": "@port: a virtual MIDI port. Received MIDI goes to the port; MIDI sent to the port is published on @send. The remote publishes to remote/<id>/midi."
                                }
                            },
                            {
                                "box": {
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 20.0, 230.0, 146.0, 22.0 ],
                                    "text": "mqtt.client midi-ports-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "conn",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 160.0, 261.0, 22.0 ],
                                    "text": "connect mqtt://public.cloud.shiftr.io public public"
                                }
                            },
                            {
                                "box": {
                                    "id": "disc",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 300.0, 160.0, 66.0, 22.0 ],
                                    "text": "disconnect"
                                }
                            },
                            {
                                "box": {
                                    "id": "m",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 20.0, 270.0, 558.0, 22.0 ],
                                    "text": "mqtt.midi midi-ports-help @receive remote/+/midi @send mqtt-max-help/port/midi @port mqtt-max-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "cport",
                                    "linecount": 3,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 300.0, 329.0, 47.0 ],
                                    "text": "MIDI objects look up their port when created. Middle outlet: port <name>, once the port exists. Connect it to them."
                                }
                            },
                            {
                                "box": {
                                    "id": "ctlin",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "int", "int" ],
                                    "patching_rect": [ 361.0, 341.0, 110.0, 22.0 ],
                                    "text": "ctlin mqtt-max-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "n1",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 361.0, 371.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "n2",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 421.0, 371.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "cc",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 361.0, 396.0, 93.0, 20.0 ],
                                    "text": "value  controller"
                                }
                            },
                            {
                                "box": {
                                    "id": "sl",
                                    "maxclass": "slider",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "orientation": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 361.0, 431.0, 140.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "ctlout",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 0,
                                    "patching_rect": [ 361.0, 461.0, 137.0, 22.0 ],
                                    "text": "ctlout mqtt-max-help 7 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "co",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 361.0, 486.0, 297.0, 20.0 ],
                                    "text": "CC 7 to the port: published on mqtt-max-help/port/midi"
                                }
                            },
                            {
                                "box": {
                                    "id": "cnote",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 520.0, 399.0, 20.0 ],
                                    "text": "Same name twice: the second port is \"<name> #2\"."
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "conn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "n1", 0 ],
                                    "source": [ "ctlin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "n2", 0 ],
                                    "source": [ "ctlin", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "disc", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ctlin", 0 ],
                                    "order": 1,
                                    "source": [ "m", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ctlout", 0 ],
                                    "order": 0,
                                    "source": [ "m", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ctlout", 0 ],
                                    "source": [ "sl", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 140.0, 120.0, 22.0 ],
                    "text": "p ports",
                    "varname": "basic_tab[1]"
                }
            },
            {
                "box": {
                    "id": "tab-basic_tab[2]",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 100.0, 126.0, 795.0, 565.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpdetails.js",
                                    "id": "details",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "mqtt.midi" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 640.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 411.0, 20.0 ],
                                    "text": "Clock, start, continue, stop and SysEx pass through."
                                }
                            },
                            {
                                "box": {
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 20.0, 220.0, 147.0, 22.0 ],
                                    "text": "mqtt.client midi-clock-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "conn",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 150.0, 261.0, 22.0 ],
                                    "text": "connect mqtt://public.cloud.shiftr.io public public"
                                }
                            },
                            {
                                "box": {
                                    "id": "disc",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 300.0, 150.0, 66.0, 22.0 ],
                                    "text": "disconnect"
                                }
                            },
                            {
                                "box": {
                                    "id": "tog",
                                    "maxclass": "toggle",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 20.0, 265.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "metro",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 20.0, 295.0, 56.0, 22.0 ],
                                    "text": "metro 20"
                                }
                            },
                            {
                                "box": {
                                    "id": "clock",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 325.0, 29.5, 22.0 ],
                                    "text": "248"
                                }
                            },
                            {
                                "box": {
                                    "id": "m1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 85.0, 325.0, 29.5, 22.0 ],
                                    "text": "250"
                                }
                            },
                            {
                                "box": {
                                    "id": "m2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 325.0, 29.5, 22.0 ],
                                    "text": "252"
                                }
                            },
                            {
                                "box": {
                                    "id": "cbytes",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 175.0, 325.0, 165.0, 20.0 ],
                                    "text": "clock 248, start 250, stop 252"
                                }
                            },
                            {
                                "box": {
                                    "id": "m3",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 360.0, 105.0, 22.0 ],
                                    "text": "240 125 1 2 3 247"
                                }
                            },
                            {
                                "box": {
                                    "id": "csx",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 145.0, 360.0, 94.0, 20.0 ],
                                    "text": "SysEx, F0 ... F7"
                                }
                            },
                            {
                                "box": {
                                    "id": "out",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 20.0, 400.0, 318.0, 22.0 ],
                                    "text": "mqtt.midi midi-clock-help @send mqtt-max-help/clock/midi"
                                }
                            },
                            {
                                "box": {
                                    "id": "inst",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 390.0, 265.0, 331.0, 22.0 ],
                                    "text": "mqtt.midi midi-clock-help @receive mqtt-max-help/clock/midi"
                                }
                            },
                            {
                                "box": {
                                    "id": "sel",
                                    "maxclass": "newobj",
                                    "numinlets": 4,
                                    "numoutlets": 4,
                                    "outlettype": [ "bang", "bang", "bang", "" ],
                                    "patching_rect": [ 390.0, 295.0, 94.0, 22.0 ],
                                    "text": "sel 248 250 252"
                                }
                            },
                            {
                                "box": {
                                    "id": "count",
                                    "maxclass": "newobj",
                                    "numinlets": 5,
                                    "numoutlets": 4,
                                    "outlettype": [ "int", "", "", "int" ],
                                    "patching_rect": [ 390.0, 325.0, 61.0, 22.0 ],
                                    "text": "counter"
                                }
                            },
                            {
                                "box": {
                                    "id": "cn",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 390.0, 355.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "mstart",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 455.0, 355.0, 32.0, 22.0 ],
                                    "text": "start"
                                }
                            },
                            {
                                "box": {
                                    "id": "mstop",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 505.0, 355.0, 31.0, 22.0 ],
                                    "text": "stop"
                                }
                            },
                            {
                                "box": {
                                    "id": "psx",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 560.0, 325.0, 93.0, 22.0 ],
                                    "text": "print sysex-byte"
                                }
                            },
                            {
                                "box": {
                                    "id": "ccount",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 390.0, 380.0, 112.0, 20.0 ],
                                    "text": "clock ticks received"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "out", 0 ],
                                    "source": [ "clock", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "conn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "cn", 0 ],
                                    "source": [ "count", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "disc", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sel", 0 ],
                                    "source": [ "inst", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "out", 0 ],
                                    "source": [ "m1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "out", 0 ],
                                    "source": [ "m2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "out", 0 ],
                                    "source": [ "m3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "clock", 0 ],
                                    "source": [ "metro", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "count", 0 ],
                                    "source": [ "sel", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "mstart", 0 ],
                                    "source": [ "sel", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "mstop", 0 ],
                                    "source": [ "sel", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "psx", 0 ],
                                    "source": [ "sel", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "metro", 0 ],
                                    "source": [ "tog", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 170.0, 120.0, 22.0 ],
                    "text": "p clock & sysex",
                    "varname": "basic_tab[2]"
                }
            },
            {
                "box": {
                    "id": "tab-q_tab",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 0.0, 26.0, 795.0, 565.0 ],
                        "showontab": 1,
                        "boxes": [],
                        "lines": []
                    },
                    "patching_rect": [ 10.0, 200.0, 120.0, 22.0 ],
                    "text": "p ?",
                    "varname": "q_tab"
                }
            }
        ],
        "lines": [],
        "autosave": 0
    }
}