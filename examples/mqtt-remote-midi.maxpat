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
        "rect": [ 134.0, 163.0, 770.0, 554.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 132.0, 20.0 ],
                    "text": "REMOTE → MIDI PORT"
                }
            },
            {
                "box": {
                    "id": "setup",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 581.0, 33.0 ],
                    "text": "Remote: Send MIDI, prefix remote, Motion on, Connect. Each remote publishes to remote/<id>/midi.\nCCs and notes arrive on the MIDI port mqtt-max, for ctlin and notein in any patch or application."
                }
            },
            {
                "box": {
                    "id": "conn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 90.0, 261.0, 22.0 ],
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
                    "patching_rect": [ 290.0, 90.0, 66.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 125.0, 126.0, 22.0 ],
                    "text": "mqtt.client remote-midi"
                }
            },
            {
                "box": {
                    "id": "rstatus",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 180.0, 125.0, 71.0, 22.0 ],
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
                    "patching_rect": [ 180.0, 155.0, 72.0, 22.0 ],
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
                    "patching_rect": [ 260.0, 155.0, 64.0, 22.0 ],
                    "text": "connected"
                }
            },
            {
                "box": {
                    "id": "midi",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 20.0, 200.0, 340.0, 22.0 ],
                    "text": "mqtt.midi remote-midi @receive remote/+/midi @port mqtt-max"
                }
            },
            {
                "box": {
                    "id": "cport",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 330.0, 200.0, 425.0, 20.0 ],
                    "text": "port <name> once the port exists: MIDI objects look up their port when created"
                }
            },
            {
                "box": {
                    "id": "ctlin",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 20.0, 250.0, 83.0, 22.0 ],
                    "text": "ctlin mqtt-max"
                }
            },
            {
                "box": {
                    "id": "pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 280.0, 54.0, 22.0 ],
                    "text": "pack 0 0"
                }
            },
            {
                "box": {
                    "id": "rev",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 310.0, 37.0, 22.0 ],
                    "text": "zl.rev"
                }
            },
            {
                "box": {
                    "id": "rcc",
                    "maxclass": "newobj",
                    "numinlets": 8,
                    "numoutlets": 13,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 20.0, 340.0, 195.0, 22.0 ],
                    "text": "route 1 2 3 4 5 6 7 8 9 10 11 12"
                }
            },
            {
                "box": {
                    "id": "s0",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 375.0, 20.0, 140.0 ]
                }
            },
            {
                "box": {
                    "id": "l0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 18.0, 520.0, 34.0, 20.0 ],
                    "text": "pitch"
                }
            },
            {
                "box": {
                    "id": "s1",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 65.0, 375.0, 20.0, 140.0 ]
                }
            },
            {
                "box": {
                    "id": "l1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 63.0, 520.0, 25.0, 20.0 ],
                    "text": "roll"
                }
            },
            {
                "box": {
                    "id": "s2",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 110.0, 375.0, 20.0, 140.0 ]
                }
            },
            {
                "box": {
                    "id": "l2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 108.0, 520.0, 30.0, 20.0 ],
                    "text": "yaw"
                }
            },
            {
                "box": {
                    "id": "s3",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 155.0, 375.0, 20.0, 140.0 ]
                }
            },
            {
                "box": {
                    "id": "l3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 153.0, 520.0, 25.0, 20.0 ],
                    "text": "net"
                }
            },
            {
                "box": {
                    "id": "s4",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 200.0, 375.0, 20.0, 140.0 ]
                }
            },
            {
                "box": {
                    "id": "l4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 198.0, 520.0, 19.0, 20.0 ],
                    "text": "x"
                }
            },
            {
                "box": {
                    "id": "s5",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 245.0, 375.0, 20.0, 140.0 ]
                }
            },
            {
                "box": {
                    "id": "l5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 243.0, 520.0, 19.0, 20.0 ],
                    "text": "y"
                }
            },
            {
                "box": {
                    "id": "s6",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 290.0, 375.0, 20.0, 140.0 ]
                }
            },
            {
                "box": {
                    "id": "l6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 288.0, 520.0, 25.0, 20.0 ],
                    "text": "s1"
                }
            },
            {
                "box": {
                    "id": "ccc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 565.0, 375.0, 55.0, 20.0 ],
                    "text": "CC 1-12"
                }
            },
            {
                "box": {
                    "id": "notein",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 420.0, 250.0, 95.0, 22.0 ],
                    "text": "notein mqtt-max"
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
                    "patching_rect": [ 420.0, 285.0, 196.0, 34.0 ]
                }
            },
            {
                "box": {
                    "id": "cnote",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 420.0, 330.0, 200.0, 20.0 ],
                    "text": "buttons: C major, notes 60-72"
                }
            },
            {
                "box": {
                    "id": "s7",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 335.0, 375.0, 20.0, 140.0 ]
                }
            },
            {
                "box": {
                    "id": "l7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 333.0, 520.0, 25.0, 20.0 ],
                    "text": "s2"
                }
            },
            {
                "box": {
                    "id": "s8",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 380.0, 375.0, 20.0, 140.0 ]
                }
            },
            {
                "box": {
                    "id": "l8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 378.0, 520.0, 25.0, 20.0 ],
                    "text": "s3"
                }
            },
            {
                "box": {
                    "id": "s9",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 425.0, 375.0, 20.0, 140.0 ]
                }
            },
            {
                "box": {
                    "id": "l9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 423.0, 520.0, 25.0, 20.0 ],
                    "text": "s4"
                }
            },
            {
                "box": {
                    "id": "s10",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 470.0, 375.0, 20.0, 140.0 ]
                }
            },
            {
                "box": {
                    "id": "l10",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 468.0, 520.0, 40.0, 20.0 ],
                    "text": "sound"
                }
            },
            {
                "box": {
                    "id": "s11",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 515.0, 375.0, 20.0, 140.0 ]
                }
            },
            {
                "box": {
                    "id": "l11",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 513.0, 520.0, 40.0, 20.0 ],
                    "text": "touch"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "rstatus", 0 ],
                    "source": [ "client", 1 ]
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
                    "destination": [ "pack", 1 ],
                    "source": [ "ctlin", 1 ]
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
                    "destination": [ "client", 0 ],
                    "source": [ "disc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ctlin", 0 ],
                    "order": 1,
                    "source": [ "midi", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "notein", 0 ],
                    "order": 0,
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
            },
            {
                "patchline": {
                    "destination": [ "rev", 0 ],
                    "source": [ "pack", 0 ]
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
                    "destination": [ "rcc", 0 ],
                    "source": [ "rev", 0 ]
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
                    "destination": [ "s7", 0 ],
                    "source": [ "rcc", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s8", 0 ],
                    "source": [ "rcc", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s9", 0 ],
                    "source": [ "rcc", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s10", 0 ],
                    "source": [ "rcc", 10 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s11", 0 ],
                    "source": [ "rcc", 11 ]
                }
            }
        ],
        "autosave": 0
    }
}