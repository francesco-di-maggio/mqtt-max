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
        "rect": [ 60.0, 60.0, 700.0, 520.0 ],
        "boxes": [
            {
                "box": {
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 400.0, 20.0 ],
                    "text": "PHONE → MIDI PORT",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "setup",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 600.0, 40.0 ],
                    "text": "Phone app: Send MIDI, prefix remote, Motion on, then Connect. Every phone publishes to remote/<id>/midi.\nIts CCs and notes arrive on the MIDI port mqtt-max: plain ctlin and notein, in any patch or application."
                }
            },
            {
                "box": {
                    "id": "conn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 90.0, 261.0, 22.0 ],
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
                    "patching_rect": [ 290.0, 90.0, 66.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "disconnect"
                }
            },
            {
                "box": {
                    "id": "client",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 125.0, 140.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "mqtt.client phone-midi"
                }
            },
            {
                "box": {
                    "id": "rstatus",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 180.0, 125.0, 75.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route status"
                }
            },
            {
                "box": {
                    "id": "pstatus",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 180.0, 155.0, 72.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "status",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 260.0, 155.0, 100.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": ""
                }
            },
            {
                "box": {
                    "id": "midi",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [ 20.0, 200.0, 300.0, 22.0 ],
                    "outlettype": [ "", "", "" ],
                    "text": "mqtt.midi phone-midi @receive remote/+/midi @port mqtt-max"
                }
            },
            {
                "box": {
                    "id": "cport",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 330.0, 200.0, 330.0, 33.0 ],
                    "text": "port <name> once the port exists: MIDI objects look up their port when created"
                }
            },
            {
                "box": {
                    "id": "ctlin",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [ 20.0, 250.0, 90.0, 22.0 ],
                    "outlettype": [ "", "", "" ],
                    "text": "ctlin mqtt-max"
                }
            },
            {
                "box": {
                    "id": "pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 280.0, 55.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "pack 0 0"
                }
            },
            {
                "box": {
                    "id": "rev",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 310.0, 45.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "zl.rev"
                }
            },
            {
                "box": {
                    "id": "rcc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 8,
                    "patching_rect": [ 20.0, 340.0, 120.0, 22.0 ],
                    "outlettype": [ "", "", "", "", "", "", "", "" ],
                    "text": "route 1 2 3 4 5 6 7"
                }
            },
            {
                "box": {
                    "id": "s0",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 375.0, 30.0, 110.0 ],
                    "outlettype": [ "" ],
                    "size": 128.0,
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "l0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 18.0, 490.0, 45.0, 20.0 ],
                    "text": "pitch"
                }
            },
            {
                "box": {
                    "id": "s1",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 65.0, 375.0, 30.0, 110.0 ],
                    "outlettype": [ "" ],
                    "size": 128.0,
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "l1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 63.0, 490.0, 45.0, 20.0 ],
                    "text": "roll"
                }
            },
            {
                "box": {
                    "id": "s2",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 110.0, 375.0, 30.0, 110.0 ],
                    "outlettype": [ "" ],
                    "size": 128.0,
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "l2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 108.0, 490.0, 45.0, 20.0 ],
                    "text": "yaw"
                }
            },
            {
                "box": {
                    "id": "s3",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 155.0, 375.0, 30.0, 110.0 ],
                    "outlettype": [ "" ],
                    "size": 128.0,
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "l3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 153.0, 490.0, 45.0, 20.0 ],
                    "text": "net"
                }
            },
            {
                "box": {
                    "id": "s4",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 200.0, 375.0, 30.0, 110.0 ],
                    "outlettype": [ "" ],
                    "size": 128.0,
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "l4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 198.0, 490.0, 45.0, 20.0 ],
                    "text": "x"
                }
            },
            {
                "box": {
                    "id": "s5",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 245.0, 375.0, 30.0, 110.0 ],
                    "outlettype": [ "" ],
                    "size": 128.0,
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "l5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 243.0, 490.0, 45.0, 20.0 ],
                    "text": "y"
                }
            },
            {
                "box": {
                    "id": "s6",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 290.0, 375.0, 30.0, 110.0 ],
                    "outlettype": [ "" ],
                    "size": 128.0,
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "l6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 288.0, 490.0, 45.0, 20.0 ],
                    "text": "slider"
                }
            },
            {
                "box": {
                    "id": "ccc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 335.0, 375.0, 60.0, 20.0 ],
                    "text": "CC 1-7"
                }
            },
            {
                "box": {
                    "id": "notein",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [ 420.0, 250.0, 95.0, 22.0 ],
                    "outlettype": [ "", "", "" ],
                    "text": "notein mqtt-max"
                }
            },
            {
                "box": {
                    "id": "ks",
                    "maxclass": "kslider",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 420.0, 285.0, 200.0, 40.0 ],
                    "outlettype": [ "int", "int" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "cnote",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 420.0, 330.0, 200.0, 20.0 ],
                    "text": "pad: note 60 while touched"
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
                    "destination": [ "rstatus", 0 ],
                    "source": [ "client", 1 ]
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
                    "destination": [ "status", 0 ],
                    "source": [ "pstatus", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ctlin", 0 ],
                    "source": [ "midi", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pack", 0 ],
                    "source": [ "ctlin", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pack", 1 ],
                    "source": [ "ctlin", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rev", 0 ],
                    "source": [ "pack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rcc", 0 ],
                    "source": [ "rev", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s0", 0 ],
                    "source": [ "rcc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s1", 0 ],
                    "source": [ "rcc", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s2", 0 ],
                    "source": [ "rcc", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s3", 0 ],
                    "source": [ "rcc", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s4", 0 ],
                    "source": [ "rcc", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s5", 0 ],
                    "source": [ "rcc", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s6", 0 ],
                    "source": [ "rcc", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "notein", 0 ],
                    "source": [ "midi", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ks", 1 ],
                    "source": [ "notein", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ks", 0 ],
                    "source": [ "notein", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}