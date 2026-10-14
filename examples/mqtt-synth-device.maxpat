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
        "rect": [ 79.0, 113.0, 880.0, 793.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 665.0, 268.0, 161.0, 22.0 ],
                    "text": "set max-synth synth gain 0.5"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 110.0, 20.0 ],
                    "text": "SYNTH DEVICE"
                }
            },
            {
                "box": {
                    "id": "setup",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 820.0, 48.0 ],
                    "text": "A synth that anyone on the network can play: Max publishes it as the Homie device max-synth in the domain mqtt-max-synth-device.\nPlay it from another computer, Home Assistant, any MQTT dashboard, or the [mqtt.homie.controller] help: domain mqtt-max-synth-device, then\nset max-synth synth pitch 60. Turn audio on."
                }
            },
            {
                "box": {
                    "id": "conn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 98.0, 261.0, 22.0 ],
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
                    "patching_rect": [ 391.0, 98.0, 66.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 133.0, 197, 22.0 ],
                    "text": "mqtt.client synth-device"
                }
            },
            {
                "box": {
                    "id": "rstatus",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 227.0, 133.0, 71.0, 22.0 ],
                    "text": "route status"
                }
            },
            {
                "box": {
                    "id": "pstatus",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 163.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "status",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 280.0, 163.0, 64.0, 22.0 ],
                    "text": "connected"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "cdev",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 208.0, 53.0, 20.0 ],
                    "text": "DEVICE"
                }
            },
            {
                "box": {
                    "id": "load",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 20.0, 233.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "tl",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 20.0, 263.0, 32.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "data": {
                        "name": "Max synth",
                        "nodes": {
                            "synth": {
                                "name": "Synth",
                                "properties": {
                                    "pitch": {
                                        "name": "Pitch",
                                        "datatype": "integer",
                                        "format": "36:84",
                                        "settable": 1
                                    },
                                    "cutoff": {
                                        "name": "Cutoff",
                                        "datatype": "float",
                                        "format": "100:8000",
                                        "unit": "Hz",
                                        "settable": 1
                                    },
                                    "gain": {
                                        "name": "Gain",
                                        "datatype": "float",
                                        "format": "0:1",
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
                    "patching_rect": [ 120.0, 293.0, 183.0, 22.0 ],
                    "saved_object_attributes": {
                        "embed": 1,
                        "legacy": 1,
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "dict synth-description @embed 1"
                }
            },
            {
                "box": {
                    "id": "init",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 328.0, 314.0, 22.0 ],
                    "text": "synth pitch 48, synth cutoff 1200, synth gain 0, synth on 1"
                }
            },
            {
                "box": {
                    "id": "device",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 398.0, 467, 22.0 ],
                    "text": "mqtt.homie.device synth-device max-synth @domain mqtt-max-synth-device"
                }
            },
            {
                "box": {
                    "id": "perr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 440.0, 433.0, 103.0, 22.0 ],
                    "text": "print synth-device"
                }
            },
            {
                "box": {
                    "id": "cmd",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 433.0, 68.0, 22.0 ],
                    "text": "route synth"
                }
            },
            {
                "box": {
                    "id": "rprop",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "patching_rect": [ 20.0, 463.0, 140.0, 22.0 ],
                    "text": "route pitch cutoff gain on"
                }
            },
            {
                "box": {
                    "id": "t0",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 493.0, 29.5, 22.0 ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "back0",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 523.0, 145.0, 22.0 ],
                    "text": "prepend value synth pitch"
                }
            },
            {
                "box": {
                    "id": "t1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 175.0, 493.0, 29.5, 22.0 ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "back1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 175.0, 523.0, 149.0, 22.0 ],
                    "text": "prepend value synth cutoff"
                }
            },
            {
                "box": {
                    "id": "t2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 334.0, 493.0, 29.5, 22.0 ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "back2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 334.0, 523.0, 143.0, 22.0 ],
                    "text": "prepend value synth gain"
                }
            },
            {
                "box": {
                    "id": "t3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 487.0, 493.0, 29.5, 22.0 ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "back3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 487.0, 523.0, 133.0, 22.0 ],
                    "text": "prepend value synth on"
                }
            },
            {
                "box": {
                    "id": "cback",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 630.0, 523.0, 212.0, 20.0 ],
                    "text": "accepted values go back to the device"
                }
            },
            {
                "box": {
                    "id": "mtof",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 578.0, 32.0, 22.0 ],
                    "text": "mtof"
                }
            },
            {
                "box": {
                    "id": "saw",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 20.0, 608.0, 77.0, 22.0 ],
                    "text": "saw~ 130.81"
                }
            },
            {
                "box": {
                    "id": "cpk",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 140.0, 578.0, 64.0, 22.0 ],
                    "text": "pack 0. 30"
                }
            },
            {
                "box": {
                    "id": "cline",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 140.0, 608.0, 34.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "id": "gm",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 260.0, 578.0, 55.0, 22.0 ],
                    "text": "pak 0. 0."
                }
            },
            {
                "box": {
                    "id": "gx",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 260.0, 608.0, 73.0, 22.0 ],
                    "text": "expr $f1*$f2"
                }
            },
            {
                "box": {
                    "id": "gpk",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 260.0, 638.0, 64.0, 22.0 ],
                    "text": "pack 0. 30"
                }
            },
            {
                "box": {
                    "id": "gline",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 260.0, 668.0, 34.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "id": "lores",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 20.0, 638.0, 92.0, 22.0 ],
                    "text": "lores~ 1200 0.3"
                }
            },
            {
                "box": {
                    "id": "amp",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 20.0, 673.0, 29.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "dac",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 708.0, 45.0, 45.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "dac", 1 ],
                    "order": 0,
                    "source": [ "amp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dac", 0 ],
                    "order": 1,
                    "source": [ "amp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "device", 0 ],
                    "source": [ "back0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "device", 0 ],
                    "source": [ "back1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "device", 0 ],
                    "source": [ "back2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "device", 0 ],
                    "source": [ "back3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rstatus", 0 ],
                    "source": [ "client", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "lores", 1 ],
                    "source": [ "cline", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rprop", 0 ],
                    "source": [ "cmd", 0 ]
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
                    "destination": [ "cline", 0 ],
                    "source": [ "cpk", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "cmd", 0 ],
                    "source": [ "device", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "perr", 0 ],
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
                    "destination": [ "amp", 1 ],
                    "source": [ "gline", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gx", 0 ],
                    "source": [ "gm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gline", 0 ],
                    "source": [ "gpk", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gpk", 0 ],
                    "source": [ "gx", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "cmd", 0 ],
                    "source": [ "init", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tl", 0 ],
                    "source": [ "load", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "amp", 0 ],
                    "source": [ "lores", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "saw", 0 ],
                    "source": [ "mtof", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "status", 0 ],
                    "source": [ "pstatus", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "t0", 0 ],
                    "source": [ "rprop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "t1", 0 ],
                    "source": [ "rprop", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "t2", 0 ],
                    "source": [ "rprop", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "t3", 0 ],
                    "source": [ "rprop", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pstatus", 0 ],
                    "source": [ "rstatus", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "lores", 0 ],
                    "source": [ "saw", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "back0", 0 ],
                    "source": [ "t0", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mtof", 0 ],
                    "source": [ "t0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "back1", 0 ],
                    "source": [ "t1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "cpk", 0 ],
                    "source": [ "t1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "back2", 0 ],
                    "source": [ "t2", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gm", 0 ],
                    "source": [ "t2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "back3", 0 ],
                    "source": [ "t3", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gm", 1 ],
                    "source": [ "t3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dict", 0 ],
                    "source": [ "tl", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "init", 0 ],
                    "source": [ "tl", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}