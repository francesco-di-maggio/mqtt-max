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
        "rect": [ 100.0, 100.0, 825.0, 626.0 ],
        "showrootpatcherontab": 0,
        "showontab": 0,
        "boxes": [
            {
                "box": {
                    "border": 0,
                    "filename": "helpname.js",
                    "id": "helpname",
                    "ignoreclick": 1,
                    "jsarguments": [ "mqtt.homie.device" ],
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
                    "patching_rect": [ 10.0, 75.0, 189.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "helpstarter.js",
                        "parameter_enable": 0
                    },
                    "text": "js helpstarter.js mqtt.homie.device"
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
                        "rect": [ 0.0, 26.0, 825.0, 600.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpdetails.js",
                                    "id": "details",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "mqtt.homie.device" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 726.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 768.0, 20.0 ],
                                    "text": "Max as the Homie device mqtt-max-help/5/lamp. Description first (bang the dict), then values. A controller on the same client commands it."
                                }
                            },
                            {
                                "box": {
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 20.0, 230.0, 128.0, 22.0 ],
                                    "text": "mqtt.client device-help"
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
                                    "id": "bang",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 270.0, 35.0, 22.0 ],
                                    "text": "bang"
                                }
                            },
                            {
                                "box": {
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
                                                        "settable": 1
                                                    },
                                                    "on": {
                                                        "name": "On",
                                                        "datatype": "boolean",
                                                        "settable": 1
                                                    }
                                                }
                                            }
                                        }
                                    },
                                    "id": "dict",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 5,
                                    "outlettype": [ "dictionary", "", "", "", "" ],
                                    "patching_rect": [ 20.0, 300.0, 181.0, 22.0 ],
                                    "saved_object_attributes": {
                                        "embed": 1,
                                        "legacy": 1,
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0
                                    },
                                    "text": "dict lamp-description @embed 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "device",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 20.0, 340.0, 335.0, 22.0 ],
                                    "text": "mqtt.homie.device device-help lamp @domain mqtt-max-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "lvl",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 380.0, 270.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "plvl",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 300.0, 138.0, 22.0 ],
                                    "text": "prepend value light level"
                                }
                            },
                            {
                                "box": {
                                    "id": "on",
                                    "maxclass": "toggle",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 545.0, 270.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "pon",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 545.0, 300.0, 127.0, 22.0 ],
                                    "text": "prepend value light on"
                                }
                            },
                            {
                                "box": {
                                    "id": "cset",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 375.0, 323.0, 20.0 ],
                                    "text": "commands from a controller: send the accepted value back"
                                }
                            },
                            {
                                "box": {
                                    "id": "rlight",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 20.0, 400.0, 61.0, 22.0 ],
                                    "text": "route light"
                                }
                            },
                            {
                                "box": {
                                    "id": "rprop",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 20.0, 430.0, 81.0, 22.0 ],
                                    "text": "route level on"
                                }
                            },
                            {
                                "box": {
                                    "id": "rdump",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 380.0, 360.0, 121.0, 22.0 ],
                                    "text": "route state broadcast"
                                }
                            },
                            {
                                "box": {
                                    "id": "pstate",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 390.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "state",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 420.0, 80.0, 22.0 ],
                                    "text": "ready"
                                }
                            },
                            {
                                "box": {
                                    "id": "pbc",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 480.0, 390.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "bc",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 480.0, 420.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "pderr",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 540.0, 360.0, 99.0, 22.0 ],
                                    "text": "print device-error"
                                }
                            },
                            {
                                "box": {
                                    "id": "cstate",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 445.0, 164.0, 20.0 ],
                                    "text": "state                       broadcast"
                                }
                            },
                            {
                                "box": {
                                    "id": "ctl",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 380.0, 530.0, 320.0, 22.0 ],
                                    "text": "mqtt.homie.controller device-help @domain mqtt-max-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "cseen",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 490.0, 248.0, 20.0 ],
                                    "text": "what a controller sees: move the number box"
                                }
                            },
                            {
                                "box": {
                                    "id": "pre1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 515.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "disp2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 545.0, 220.0, 22.0 ],
                                    "text": "lamp light on 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "m3",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 495.0, 124.0, 22.0 ],
                                    "text": "set lamp light level 25"
                                }
                            },
                            {
                                "box": {
                                    "id": "m4",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 530.0, 495.0, 106.0, 22.0 ],
                                    "text": "set lamp light on 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "cexample",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 575.0, 300.0, 20.0 ],
                                    "text": "A complete setup: the example mqtt-synth-device."
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "dict", 0 ],
                                    "source": [ "bang", 0 ]
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
                                    "destination": [ "pre1", 0 ],
                                    "source": [ "ctl", 0 ]
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
                                    "destination": [ "rlight", 0 ],
                                    "source": [ "device", 0 ]
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
                                    "destination": [ "client", 0 ],
                                    "source": [ "disc", 0 ]
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
                                    "destination": [ "ctl", 0 ],
                                    "source": [ "m3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ctl", 0 ],
                                    "source": [ "m4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pon", 0 ],
                                    "source": [ "on", 0 ]
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
                                    "destination": [ "device", 0 ],
                                    "source": [ "plvl", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "device", 0 ],
                                    "source": [ "pon", 0 ]
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
                                    "destination": [ "pderr", 0 ],
                                    "source": [ "rdump", 2 ]
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
                                    "destination": [ "rprop", 0 ],
                                    "source": [ "rlight", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "lvl", 0 ],
                                    "source": [ "rprop", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "on", 0 ],
                                    "source": [ "rprop", 1 ]
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
                        "rect": [ 100.0, 126.0, 825.0, 600.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpdetails.js",
                                    "id": "details",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "mqtt.homie.device" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 726.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 540.0, 20.0 ],
                                    "text": "$description: nodes with properties. homie and version are added."
                                }
                            },
                            {
                                "box": {
                                    "id": "bang",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 150.0, 35.0, 22.0 ],
                                    "text": "bang"
                                }
                            },
                            {
                                "box": {
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
                                                        "settable": 1
                                                    },
                                                    "on": {
                                                        "name": "On",
                                                        "datatype": "boolean",
                                                        "settable": 1
                                                    }
                                                }
                                            }
                                        }
                                    },
                                    "id": "dict",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 5,
                                    "outlettype": [ "dictionary", "", "", "", "" ],
                                    "patching_rect": [ 20.0, 180.0, 168.0, 22.0 ],
                                    "saved_object_attributes": {
                                        "embed": 1,
                                        "legacy": 1,
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0
                                    },
                                    "text": "dict lamp-example @embed 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "view",
                                    "maxclass": "dict.view",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 215.0, 297.0, 296.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "ctypes",
                                    "linecount": 12,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 340.0, 150.0, 343.0, 167.0 ],
                                    "text": "datatype (Max value): integer, float (numbers) · boolean (1/0) · string, enum (symbol) · color (type and values: rgb 255 0 0, hsv, xyz) · json (dictionary) · datetime, duration (text)\n\nformat: \"min:max[:step]\" for numbers, \"a,b,c\" for enum, \"rgb,hsv\" for color\nsettable: true lets controllers send commands\nretained: false streams values at QoS 0 (sensors), otherwise retained\nunit: e.g. \"°\", \"%\", \"ms\"\n\nIDs: a-z, 0-9 and hyphens"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "dict", 0 ],
                                    "source": [ "bang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "view", 0 ],
                                    "source": [ "dict", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 140.0, 120.0, 22.0 ],
                    "text": "p description",
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
                        "rect": [ 0.0, 26.0, 825.0, 600.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpdetails.js",
                                    "id": "details",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "mqtt.homie.device" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 726.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 631.0, 20.0 ],
                                    "text": "Connect: init, description, values, ready. Dropped: lost (last will). Disconnect: disconnected."
                                }
                            },
                            {
                                "box": {
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 20.0, 220.0, 158.0, 22.0 ],
                                    "text": "mqtt.client device-state-help"
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
                                    "id": "bang",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 260.0, 35.0, 22.0 ],
                                    "text": "bang"
                                }
                            },
                            {
                                "box": {
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
                                                        "settable": 1
                                                    },
                                                    "on": {
                                                        "name": "On",
                                                        "datatype": "boolean",
                                                        "settable": 1
                                                    }
                                                }
                                            }
                                        }
                                    },
                                    "id": "dict",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 5,
                                    "outlettype": [ "dictionary", "", "", "", "" ],
                                    "patching_rect": [ 20.0, 290.0, 211.0, 22.0 ],
                                    "saved_object_attributes": {
                                        "embed": 1,
                                        "legacy": 1,
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0
                                    },
                                    "text": "dict lamp-state-description @embed 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "device",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 20.0, 330.0, 395.0, 22.0 ],
                                    "text": "mqtt.homie.device device-state-help lamp-state @domain mqtt-max-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "m1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 260.0, 83.0, 22.0 ],
                                    "text": "state sleeping"
                                }
                            },
                            {
                                "box": {
                                    "id": "m2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 480.0, 260.0, 68.0, 22.0 ],
                                    "text": "state ready"
                                }
                            },
                            {
                                "box": {
                                    "id": "m3",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 295.0, 133.0, 22.0 ],
                                    "text": "alert battery low battery"
                                }
                            },
                            {
                                "box": {
                                    "id": "m4",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 535.0, 295.0, 72.0, 22.0 ],
                                    "text": "alert battery"
                                }
                            },
                            {
                                "box": {
                                    "id": "ca",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 535.0, 320.0, 158.0, 20.0 ],
                                    "text": "alert without text: removes it"
                                }
                            },
                            {
                                "box": {
                                    "id": "m5",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 340.0, 76.0, 22.0 ],
                                    "text": "log info hello"
                                }
                            },
                            {
                                "box": {
                                    "id": "rdump",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 380.0, 380.0, 121.0, 22.0 ],
                                    "text": "route state broadcast"
                                }
                            },
                            {
                                "box": {
                                    "id": "pstate",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 410.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "state",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 440.0, 80.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "pbc",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 480.0, 410.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "bc",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 480.0, 440.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "pderr",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 540.0, 380.0, 99.0, 22.0 ],
                                    "text": "print device-error"
                                }
                            },
                            {
                                "box": {
                                    "id": "cstate",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 465.0, 164.0, 20.0 ],
                                    "text": "state                       broadcast"
                                }
                            },
                            {
                                "box": {
                                    "id": "ctl",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 20.0, 400.0, 350.0, 22.0 ],
                                    "text": "mqtt.homie.controller device-state-help @domain mqtt-max-help"
                                }
                            },
                            {
                                "box": {
                                    "id": "view",
                                    "maxclass": "dict.view",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 430.0, 300.0, 120.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "palert",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 560.0, 85.0, 22.0 ],
                                    "text": "print controller"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "dict", 0 ],
                                    "source": [ "bang", 0 ]
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
                                    "destination": [ "palert", 0 ],
                                    "source": [ "ctl", 2 ]
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
                                    "destination": [ "rdump", 0 ],
                                    "source": [ "device", 1 ]
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
                                    "destination": [ "client", 0 ],
                                    "source": [ "disc", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "device", 0 ],
                                    "source": [ "m1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "device", 0 ],
                                    "source": [ "m2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "device", 0 ],
                                    "source": [ "m3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "device", 0 ],
                                    "source": [ "m4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "device", 0 ],
                                    "source": [ "m5", 0 ]
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
                                    "destination": [ "pderr", 0 ],
                                    "source": [ "rdump", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pstate", 0 ],
                                    "source": [ "rdump", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 170.0, 120.0, 22.0 ],
                    "text": "p state & alerts",
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
                        "rect": [ 0.0, 26.0, 825.0, 600.0 ],
                        "showontab": 1,
                        "boxes": [  ],
                        "lines": [  ]
                    },
                    "patching_rect": [ 10.0, 200.0, 120.0, 22.0 ],
                    "text": "p ?",
                    "varname": "q_tab"
                }
            }
        ],
        "lines": [  ],
        "autosave": 0
    }
}