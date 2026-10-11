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
                    "jsarguments": [ "mqtt.homie.controller" ],
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
                    "text": "js helpstarter.js mqtt.homie.controller"
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
                                    "jsarguments": [ "mqtt.homie.controller" ],
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
                                    "text": "Discovers the Homie devices of a domain: who is online, and their values. Here a device on the same client to discover."
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
                                    "text": "mqtt.client controller-help"
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
                                    "id": "bang",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 150.0, 35.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "bang"
                                }
                            },
                            {
                                "box": {
                                    "id": "dict",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 5,
                                    "patching_rect": [ 380.0, 180.0, 150.0, 22.0 ],
                                    "outlettype": [ "dictionary", "", "", "", "" ],
                                    "text": "dict help-lamp-description @embed 1",
                                    "saved_object_attributes": {
                                        "embed": 1,
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0
                                    },
                                    "data": {
                                        "name": "Lamp",
                                        "nodes": {
                                            "light": {
                                                "name": "Light",
                                                "properties": {
                                                    "level": {
                                                        "name": "Level",
                                                        "datatype": "integer",
                                                        "format": "0:100",
                                                        "settable": true
                                                    },
                                                    "on": {
                                                        "name": "On",
                                                        "datatype": "boolean",
                                                        "settable": true
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            },
                            {
                                "box": {
                                    "id": "device",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 380.0, 220.0, 330.0, 22.0 ],
                                    "outlettype": [ "", "" ],
                                    "text": "mqtt.homie.device controller-help help-lamp @domain mqtt-max-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "lvl",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 380.0, 255.0, 50.0, 22.0 ],
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "plvl",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 440.0, 255.0, 150.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend value light level"
                                }
                            },
                            {
                                "box": {
                                    "id": "ctl",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [ 20.0, 300.0, 345.0, 22.0 ],
                                    "outlettype": [ "", "", "" ],
                                    "text": "mqtt.homie.controller controller-help @domain mqtt-max-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "pre1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 335.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "disp2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 365.0, 260.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "c3",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 290.0, 365.0, 200.0, 20.0 ],
                                    "text": "values"
                                }
                            },
                            {
                                "box": {
                                    "id": "view",
                                    "maxclass": "dict.view",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 410.0, 300.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "pdump",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 335.0, 95.0, 22.0 ],
                                    "text": "print controller"
                                }
                            },
                            {
                                "box": {
                                    "id": "cd",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 340.0, 410.0, 340.0, 48.0 ],
                                    "text": "Without @domain, all domains (the Homie default), named <domain>/<device>. The phone app in Data mode uses the domain remote."
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
                                    "destination": [ "dict", 0 ],
                                    "source": [ "bang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "device", 0 ],
                                    "source": [ "dict", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "plvl", 0 ],
                                    "source": [ "lvl", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "device", 0 ],
                                    "source": [ "plvl", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pre1", 0 ],
                                    "source": [ "ctl", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "disp2", 0 ],
                                    "source": [ "pre1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "view", 0 ],
                                    "source": [ "ctl", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pdump", 0 ],
                                    "source": [ "ctl", 2 ]
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
                                    "jsarguments": [ "mqtt.homie.controller" ],
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
                                    "text": "set publishes to the property's /set topic. Only settable properties of known devices; never retained."
                                }
                            },
                            {
                                "box": {
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 20.0, 220.0, 226.0, 22.0 ],
                                    "outlettype": [ "", "" ],
                                    "text": "mqtt.client controller-set-help"
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
                                    "id": "bang",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 150.0, 35.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "bang"
                                }
                            },
                            {
                                "box": {
                                    "id": "dict",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 5,
                                    "patching_rect": [ 380.0, 180.0, 150.0, 22.0 ],
                                    "outlettype": [ "dictionary", "", "", "", "" ],
                                    "text": "dict set-lamp-description @embed 1",
                                    "saved_object_attributes": {
                                        "embed": 1,
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0
                                    },
                                    "data": {
                                        "name": "Lamp",
                                        "nodes": {
                                            "light": {
                                                "name": "Light",
                                                "properties": {
                                                    "level": {
                                                        "name": "Level",
                                                        "datatype": "integer",
                                                        "format": "0:100",
                                                        "settable": true
                                                    },
                                                    "on": {
                                                        "name": "On",
                                                        "datatype": "boolean",
                                                        "settable": true
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            },
                            {
                                "box": {
                                    "id": "device",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 380.0, 220.0, 330.0, 22.0 ],
                                    "outlettype": [ "", "" ],
                                    "text": "mqtt.homie.device controller-set-help set-lamp @domain mqtt-max-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "ctl",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [ 20.0, 330.0, 360.0, 22.0 ],
                                    "outlettype": [ "", "", "" ],
                                    "text": "mqtt.homie.controller controller-set-help @domain mqtt-max-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "m1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 295.0, 160.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "set set-lamp light level 80"
                                }
                            },
                            {
                                "box": {
                                    "id": "m2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 190.0, 295.0, 135.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "set set-lamp light on 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "m3",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 260.0, 145.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "broadcast hello everyone"
                                }
                            },
                            {
                                "box": {
                                    "id": "pre4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 260.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "disp5",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 290.0, 150.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "c6",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 540.0, 290.0, 200.0, 20.0 ],
                                    "text": "command received"
                                }
                            },
                            {
                                "box": {
                                    "id": "rdump",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [ 380.0, 330.0, 130.0, 22.0 ],
                                    "outlettype": [ "", "", "" ],
                                    "text": "route state broadcast"
                                }
                            },
                            {
                                "box": {
                                    "id": "pstate",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 360.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "state",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 390.0, 80.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "pbc",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 480.0, 360.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "bc",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 480.0, 390.0, 150.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "pderr",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 540.0, 330.0, 105.0, 22.0 ],
                                    "text": "print device-error"
                                }
                            },
                            {
                                "box": {
                                    "id": "cstate",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 415.0, 200.0, 20.0 ],
                                    "text": "state                       broadcast"
                                }
                            },
                            {
                                "box": {
                                    "id": "perr",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 365.0, 95.0, 22.0 ],
                                    "text": "print controller"
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
                                    "destination": [ "dict", 0 ],
                                    "source": [ "bang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "device", 0 ],
                                    "source": [ "dict", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ctl", 0 ],
                                    "source": [ "m1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ctl", 0 ],
                                    "source": [ "m2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ctl", 0 ],
                                    "source": [ "m3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pre4", 0 ],
                                    "source": [ "device", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "disp5", 0 ],
                                    "source": [ "pre4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "rdump", 0 ],
                                    "source": [ "device", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pstate", 0 ],
                                    "source": [ "rdump", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "state", 0 ],
                                    "source": [ "pstate", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pbc", 0 ],
                                    "source": [ "rdump", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "bc", 0 ],
                                    "source": [ "pbc", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pderr", 0 ],
                                    "source": [ "rdump", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "perr", 0 ],
                                    "source": [ "ctl", 2 ]
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
                    "text": "p commands",
                    "varname": "basic_tab[1]"
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
                    "patching_rect": [ 10.0, 170.0, 120.0, 22.0 ],
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