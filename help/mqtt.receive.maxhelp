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
        "rect": [ 100.0, 100.0, 799.0, 559.0 ],
        "showrootpatcherontab": 0,
        "showontab": 0,
        "boxes": [
            {
                "box": {
                    "border": 0,
                    "filename": "helpname.js",
                    "id": "helpname",
                    "ignoreclick": 1,
                    "jsarguments": [ "mqtt.receive" ],
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
                    "patching_rect": [ 10.0, 75.0, 218.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "helpstarter.js",
                        "parameter_enable": 0
                    },
                    "text": "js helpstarter.js mqtt.receive"
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
                        "rect": [ 0.0, 26.0, 799.0, 533.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpdetails.js",
                                    "id": "details",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "mqtt.receive" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 679.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 552.0, 20.0 ],
                                    "text": "Outputs the messages on one topic, like [receive] across the network. Numbers come out as numbers."
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
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 20.0, 185.0, 132.0, 22.0 ],
                                    "text": "mqtt.client receive-help"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "a",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 20.0, 235.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "sa",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 265.0, 262.0, 22.0 ],
                                    "text": "mqtt.send receive-help mqtt-max-help/receive/a"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "b",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 315.0, 235.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "sb",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 315.0, 265.0, 262.0, 22.0 ],
                                    "text": "mqtt.send receive-help mqtt-max-help/receive/b"
                                }
                            },
                            {
                                "box": {
                                    "id": "ra",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 20.0, 320.0, 275.0, 22.0 ],
                                    "text": "mqtt.receive receive-help mqtt-max-help/receive/a"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "ra_v",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 20.0, 350.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "cexact",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 80.0, 350.0, 141.0, 20.0 ],
                                    "text": "exact topic: the message"
                                }
                            },
                            {
                                "box": {
                                    "id": "rw",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 315.0, 320.0, 275.0, 22.0 ],
                                    "text": "mqtt.receive receive-help mqtt-max-help/receive/+"
                                }
                            },
                            {
                                "box": {
                                    "id": "route",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 315.0, 350.0, 300.0, 22.0 ],
                                    "text": "route mqtt-max-help/receive/a mqtt-max-help/receive/b"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "rw_a",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 315.0, 380.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "rw_b",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 375.0, 380.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "cwild",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 315.0, 410.0, 229.0, 20.0 ],
                                    "text": "wildcard: the topic first, then the message"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "sa", 0 ],
                                    "source": [ "a", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sb", 0 ],
                                    "source": [ "b", 0 ]
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
                                    "destination": [ "client", 0 ],
                                    "source": [ "disc", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ra_v", 0 ],
                                    "source": [ "ra", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "rw_a", 0 ],
                                    "source": [ "route", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "rw_b", 0 ],
                                    "source": [ "route", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "route", 0 ],
                                    "source": [ "rw", 0 ]
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
                        "rect": [ 0.0, 26.0, 799.0, 533.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpdetails.js",
                                    "id": "details",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "mqtt.receive" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 679.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 532.0, 20.0 ],
                                    "text": "@format json: a JSON object comes out as a dictionary. text (default) and bytes as on [mqtt.client]."
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
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 20.0, 185.0, 170.0, 22.0 ],
                                    "text": "mqtt.client receive-format-help"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "cut",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 20.0, 215.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "pack",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "dictionary" ],
                                    "patching_rect": [ 20.0, 240.0, 112.0, 22.0 ],
                                    "text": "dict.pack cutoff: on:"
                                }
                            },
                            {
                                "box": {
                                    "id": "send",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 270.0, 315.0, 22.0 ],
                                    "text": "mqtt.send receive-format-help mqtt-max-help/receive/json"
                                }
                            },
                            {
                                "box": {
                                    "id": "recv",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 20.0, 310.0, 403.0, 22.0 ],
                                    "text": "mqtt.receive receive-format-help mqtt-max-help/receive/json @format json"
                                }
                            },
                            {
                                "box": {
                                    "id": "view",
                                    "maxclass": "dict.view",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 345.0, 300.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "cself",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 435.0, 311.0, 351.0, 20.0 ],
                                    "text": "A client also receives what it publishes on topics it subscribes to."
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
                                    "destination": [ "pack", 0 ],
                                    "source": [ "cut", 0 ]
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
                                    "destination": [ "send", 0 ],
                                    "source": [ "pack", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "view", 0 ],
                                    "source": [ "recv", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 140.0, 120.0, 22.0 ],
                    "text": "p format",
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
                        "rect": [ 100.0, 126.0, 799.0, 533.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpdetails.js",
                                    "id": "details",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "mqtt.receive" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 679.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 115.0, 453.0, 33.0 ],
                                    "text": "A retained message arrives as soon as the object subscribes, before any new one.\n@qos: the highest QoS the broker uses for this subscription; 1 or 2 confirm delivery."
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
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 20.0, 185.0, 179.0, 22.0 ],
                                    "text": "mqtt.client receive-retained-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "val",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 20.0, 235.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "send",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 270.0, 384.0, 22.0 ],
                                    "text": "mqtt.send receive-retained-help mqtt-max-help/receive/state @retain 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "sub",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 425.0, 235.0, 185.0, 22.0 ],
                                    "text": "topic mqtt-max-help/receive/state"
                                }
                            },
                            {
                                "box": {
                                    "id": "recv",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 425.0, 270.0, 235.0, 22.0 ],
                                    "text": "mqtt.receive receive-retained-help @qos 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "pset",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 425.0, 300.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "disp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 425.0, 330.0, 180.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "csub",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 425.0, 205.0, 292.0, 20.0 ],
                                    "text": "1. set a number  2. subscribe: the last number arrives"
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
                                    "destination": [ "disp", 0 ],
                                    "source": [ "pset", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pset", 0 ],
                                    "source": [ "recv", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "recv", 0 ],
                                    "source": [ "sub", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "send", 0 ],
                                    "source": [ "val", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 170.0, 120.0, 22.0 ],
                    "text": "p qos & retained",
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
                        "rect": [ 0.0, 26.0, 799.0, 533.0 ],
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