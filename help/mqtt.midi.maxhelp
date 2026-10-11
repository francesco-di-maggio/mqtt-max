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
        "rect": [ 100.0, 100.0, 720.0, 626.0 ],
        "autosave": 0,
        "showrootpatcherontab": 0,
        "showontab": 0,
        "boxes": [
            {
                "box": {
                    "id": "helpname",
                    "maxclass": "jsui",
                    "filename": "helpname.js",
                    "jsarguments": [ "mqtt.midi" ],
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
                        "rect": [ 0.0, 26.0, 720.0, 600.0 ],
                        "autosave": 0,
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "details",
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 10.0, 10.0, 640.0, 100.0 ],
                                    "outlettype": [ "" ],
                                    "filename": "helpdetails.js",
                                    "jsarguments": [ "mqtt.midi" ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 640.0, 20.0 ],
                                    "text": "One client, both sides of mqtt-midi: the controller side publishes to {prefix}/in, the instrument side listens there."
                                }
                            },
                            {
                                "box": {
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 20.0, 220.0, 156.0, 22.0 ],
                                    "outlettype": [ "", "" ],
                                    "text": "mqtt.client midi-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "conn",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 150.0, 261.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "connect mqtt://public.cloud.shiftr.io public public"
                                }
                            },
                            {
                                "box": {
                                    "id": "disc",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 300.0, 150.0, 66.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "disconnect"
                                }
                            },
                            {
                                "box": {
                                    "id": "ks",
                                    "maxclass": "kslider",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "patching_rect": [ 20.0, 270.0, 200.0, 40.0 ],
                                    "outlettype": [ "int", "int" ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "pack",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 320.0, 55.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "pack 0 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "fmt",
                                    "maxclass": "newobj",
                                    "numinlets": 7,
                                    "numoutlets": 2,
                                    "patching_rect": [ 20.0, 350.0, 65.0, 22.0 ],
                                    "outlettype": [ "", "" ],
                                    "text": "midiformat"
                                }
                            },
                            {
                                "box": {
                                    "id": "ctl",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [ 20.0, 380.0, 320.0, 22.0 ],
                                    "outlettype": [ "", "", "" ],
                                    "text": "mqtt.midi midi-help @prefix mqtt-max-help @direction out"
                                }
                            },
                            {
                                "box": {
                                    "id": "cctl",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 405.0, 100.0, 20.0 ],
                                    "text": "controller side"
                                }
                            },
                            {
                                "box": {
                                    "id": "inst",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [ 380.0, 270.0, 240.0, 22.0 ],
                                    "outlettype": [ "", "", "" ],
                                    "text": "mqtt.midi midi-help @prefix mqtt-max-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "cinst",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 245.0, 200.0, 20.0 ],
                                    "text": "instrument side (@direction in)"
                                }
                            },
                            {
                                "box": {
                                    "id": "parse",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 8,
                                    "patching_rect": [ 380.0, 300.0, 65.0, 22.0 ],
                                    "outlettype": [ "", "", "", "", "", "", "", "" ],
                                    "text": "midiparse"
                                }
                            },
                            {
                                "box": {
                                    "id": "ks2",
                                    "maxclass": "kslider",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "patching_rect": [ 380.0, 330.0, 200.0, 40.0 ],
                                    "outlettype": [ "int", "int" ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "cbytes",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 440.0, 450.0, 20.0 ],
                                    "text": "In and out: raw MIDI bytes, as [midiout] takes and [midiin] outputs them."
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
                                    "destination": [ "pack", 0 ],
                                    "source": [ "ks", 0 ]
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
                                    "destination": [ "fmt", 0 ],
                                    "source": [ "pack", 0 ]
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
                                    "destination": [ "ks2", 0 ],
                                    "source": [ "parse", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 110.0, 120.0, 22.0 ],
                    "saved_object_attributes": {
                        "description": "",
                        "digest": "",
                        "globalpatchername": "",
                        "tags": ""
                    },
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
                        "rect": [ 0.0, 26.0, 720.0, 600.0 ],
                        "autosave": 0,
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "details",
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 10.0, 10.0, 640.0, 100.0 ],
                                    "outlettype": [ "" ],
                                    "filename": "helpdetails.js",
                                    "jsarguments": [ "mqtt.midi" ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 640.0, 33.0 ],
                                    "text": "With @port, received MIDI also plays on a virtual MIDI port that other patches and apps can open, and what they send to it is published. The phone app uses the prefix remote."
                                }
                            },
                            {
                                "box": {
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 20.0, 230.0, 198.0, 22.0 ],
                                    "outlettype": [ "", "" ],
                                    "text": "mqtt.client midi-ports-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "conn",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 160.0, 261.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "connect mqtt://public.cloud.shiftr.io public public"
                                }
                            },
                            {
                                "box": {
                                    "id": "disc",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 300.0, 160.0, 66.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "disconnect"
                                }
                            },
                            {
                                "box": {
                                    "id": "m",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [ 20.0, 270.0, 335.0, 22.0 ],
                                    "outlettype": [ "", "", "" ],
                                    "text": "mqtt.midi midi-ports-help @prefix remote @port mqtt-max-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "cport",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 300.0, 330.0, 48.0 ],
                                    "text": "MIDI objects look up their port when they are created. The middle outlet sends port <name> once Max lists the new port: connect it to them."
                                }
                            },
                            {
                                "box": {
                                    "id": "ctlin",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [ 380.0, 270.0, 115.0, 22.0 ],
                                    "outlettype": [ "", "", "" ],
                                    "text": "ctlin mqtt-max-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "n1",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 380.0, 300.0, 50.0, 22.0 ],
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "n2",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 440.0, 300.0, 50.0, 22.0 ],
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "cc",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 325.0, 120.0, 20.0 ],
                                    "text": "value  controller"
                                }
                            },
                            {
                                "box": {
                                    "id": "sl",
                                    "maxclass": "slider",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 360.0, 140.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "orientation": 1,
                                    "size": 128.0
                                }
                            },
                            {
                                "box": {
                                    "id": "ctlout",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 390.0, 140.0, 22.0 ],
                                    "text": "ctlout mqtt-max-help 7 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "co",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 415.0, 280.0, 20.0 ],
                                    "text": "CC 7 to the port: published to remote/out/cc/1/7"
                                }
                            },
                            {
                                "box": {
                                    "id": "cnote",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 460.0, 420.0, 20.0 ],
                                    "text": "Port names: a second port with the same name appears as \"<name> #2\"."
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
                                    "destination": [ "ctlin", 0 ],
                                    "source": [ "m", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ctlout", 0 ],
                                    "source": [ "m", 1 ]
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
                                    "destination": [ "ctlout", 0 ],
                                    "source": [ "sl", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 140.0, 120.0, 22.0 ],
                    "saved_object_attributes": {
                        "description": "",
                        "digest": "",
                        "globalpatchername": "",
                        "tags": ""
                    },
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
                        "rect": [ 0.0, 26.0, 720.0, 600.0 ],
                        "autosave": 0,
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "details",
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 10.0, 10.0, 640.0, 100.0 ],
                                    "outlettype": [ "" ],
                                    "filename": "helpdetails.js",
                                    "jsarguments": [ "mqtt.midi" ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 600.0, 20.0 ],
                                    "text": "Clock, start, continue, stop and SysEx pass through like any MIDI message."
                                }
                            },
                            {
                                "box": {
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 20.0, 220.0, 198.0, 22.0 ],
                                    "outlettype": [ "", "" ],
                                    "text": "mqtt.client midi-clock-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "conn",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 150.0, 261.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "connect mqtt://public.cloud.shiftr.io public public"
                                }
                            },
                            {
                                "box": {
                                    "id": "disc",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 300.0, 150.0, 66.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "disconnect"
                                }
                            },
                            {
                                "box": {
                                    "id": "tog",
                                    "maxclass": "toggle",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 265.0, 24.0, 24.0 ],
                                    "outlettype": [ "int" ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "metro",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 295.0, 55.0, 22.0 ],
                                    "outlettype": [ "bang" ],
                                    "text": "metro 20"
                                }
                            },
                            {
                                "box": {
                                    "id": "clock",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 325.0, 35.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "248"
                                }
                            },
                            {
                                "box": {
                                    "id": "m1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 85.0, 325.0, 35.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "250"
                                }
                            },
                            {
                                "box": {
                                    "id": "m2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 130.0, 325.0, 35.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "252"
                                }
                            },
                            {
                                "box": {
                                    "id": "cbytes",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 175.0, 325.0, 180.0, 20.0 ],
                                    "text": "clock 248, start 250, stop 252"
                                }
                            },
                            {
                                "box": {
                                    "id": "m3",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 360.0, 115.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "240 125 1 2 3 247"
                                }
                            },
                            {
                                "box": {
                                    "id": "csx",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 145.0, 360.0, 120.0, 20.0 ],
                                    "text": "SysEx, F0 ... F7"
                                }
                            },
                            {
                                "box": {
                                    "id": "out",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [ 20.0, 400.0, 345.0, 22.0 ],
                                    "outlettype": [ "", "", "" ],
                                    "text": "mqtt.midi midi-clock-help @prefix mqtt-max-help @direction out"
                                }
                            },
                            {
                                "box": {
                                    "id": "inst",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [ 390.0, 265.0, 250.0, 22.0 ],
                                    "outlettype": [ "", "", "" ],
                                    "text": "mqtt.midi midi-clock-help @prefix mqtt-max-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "sel",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "patching_rect": [ 390.0, 295.0, 95.0, 22.0 ],
                                    "outlettype": [ "bang", "bang", "bang", "" ],
                                    "text": "sel 248 250 252"
                                }
                            },
                            {
                                "box": {
                                    "id": "count",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 4,
                                    "patching_rect": [ 390.0, 325.0, 55.0, 22.0 ],
                                    "outlettype": [ "", "", "", "" ],
                                    "text": "counter"
                                }
                            },
                            {
                                "box": {
                                    "id": "cn",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 390.0, 355.0, 50.0, 22.0 ],
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "mstart",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 455.0, 355.0, 40.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "start"
                                }
                            },
                            {
                                "box": {
                                    "id": "mstop",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 505.0, 355.0, 35.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "stop"
                                }
                            },
                            {
                                "box": {
                                    "id": "psx",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 560.0, 325.0, 95.0, 22.0 ],
                                    "text": "print sysex-byte"
                                }
                            },
                            {
                                "box": {
                                    "id": "ccount",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 390.0, 380.0, 130.0, 20.0 ],
                                    "text": "clock ticks received"
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
                                    "destination": [ "metro", 0 ],
                                    "source": [ "tog", 0 ]
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
                                    "destination": [ "out", 0 ],
                                    "source": [ "clock", 0 ]
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
                                    "destination": [ "count", 0 ],
                                    "source": [ "sel", 0 ]
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
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 170.0, 120.0, 22.0 ],
                    "saved_object_attributes": {
                        "description": "",
                        "digest": "",
                        "globalpatchername": "",
                        "tags": ""
                    },
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
                        "rect": [ 0.0, 26.0, 720.0, 600.0 ],
                        "autosave": 0,
                        "showontab": 1,
                        "boxes": [],
                        "lines": []
                    },
                    "patching_rect": [ 10.0, 200.0, 120.0, 22.0 ],
                    "saved_object_attributes": {
                        "description": "",
                        "digest": "",
                        "globalpatchername": "",
                        "tags": ""
                    },
                    "text": "p ?",
                    "varname": "q_tab"
                }
            }
        ],
        "lines": []
    }
}