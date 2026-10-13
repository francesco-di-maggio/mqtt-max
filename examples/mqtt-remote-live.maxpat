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
        "rect": [ 100.0, 100.0, 720.0, 560.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 157.0, 20.0 ],
                    "text": "REMOTE → ABLETON LIVE"
                }
            },
            {
                "box": {
                    "id": "setup",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 682.0, 33.0 ],
                    "text": "Remote: Send MIDI, prefix remote, Motion on, Connect. Choose the output port below (e.g. \"from Max 1\")\nand enable it as a MIDI input in Live. CC 1-4 → smoothed → CC 20-23 (CC 1 is the mod wheel in many instruments)."
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
                    "patching_rect": [ 20.0, 125.0, 122.0, 22.0 ],
                    "text": "mqtt.client remote-live"
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
                    "patching_rect": [ 260.0, 155.0, 100.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "midi",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 20.0, 200.0, 246.0, 22.0 ],
                    "text": "mqtt.midi remote-live @receive remote/+/midi"
                }
            },
            {
                "box": {
                    "id": "parse",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 8,
                    "outlettype": [ "", "", "", "int", "int", "", "int", "" ],
                    "patching_rect": [ 20.0, 235.0, 92.5, 22.0 ],
                    "text": "midiparse"
                }
            },
            {
                "box": {
                    "id": "rcc",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "patching_rect": [ 120.0, 270.0, 76.0, 22.0 ],
                    "text": "route 1 2 3 4"
                }
            },
            {
                "box": {
                    "id": "cms",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 380.0, 200.0, 91.0, 20.0 ],
                    "text": "smoothing (ms)"
                }
            },
            {
                "box": {
                    "id": "ms",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 380.0, 225.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "ms50",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 440.0, 225.0, 29.5, 22.0 ],
                    "text": "50"
                }
            },
            {
                "box": {
                    "id": "load",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 480.0, 225.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "cport",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 380.0, 260.0, 66.0, 20.0 ],
                    "text": "output port"
                }
            },
            {
                "box": {
                    "id": "info",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 380.0, 285.0, 50.0, 22.0 ],
                    "text": "midiinfo"
                }
            },
            {
                "box": {
                    "id": "refresh",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 440.0, 285.0, 35.0, 22.0 ],
                    "text": "bang"
                }
            },
            {
                "box": {
                    "id": "menu",
                    "items": [ "AU DLS Synth 1", ",", "IAC Driver Bus 1", ",", "from Max 1", ",", "from Max 2" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 380.0, 315.0, 160.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "tosym",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 380.0, 345.0, 57.0, 22.0 ],
                    "text": "tosymbol"
                }
            },
            {
                "box": {
                    "id": "pport",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 450.0, 345.0, 77.0, 22.0 ],
                    "text": "prepend port"
                }
            },
            {
                "box": {
                    "id": "pk0",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 380.0, 61.0, 22.0 ],
                    "text": "pack 0 50"
                }
            },
            {
                "box": {
                    "id": "ln0",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 20.0, 410.0, 54.0, 22.0 ],
                    "text": "line 0 10"
                }
            },
            {
                "box": {
                    "id": "out0",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 440.0, 64.0, 22.0 ],
                    "text": "ctlout 20 1"
                }
            },
            {
                "box": {
                    "id": "c0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 465.0, 82.0, 20.0 ],
                    "text": "CC1 → CC20"
                }
            },
            {
                "box": {
                    "id": "pk1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 110.0, 380.0, 61.0, 22.0 ],
                    "text": "pack 0 50"
                }
            },
            {
                "box": {
                    "id": "ln1",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 110.0, 410.0, 54.0, 22.0 ],
                    "text": "line 0 10"
                }
            },
            {
                "box": {
                    "id": "out1",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 110.0, 440.0, 64.0, 22.0 ],
                    "text": "ctlout 21 1"
                }
            },
            {
                "box": {
                    "id": "c1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 110.0, 465.0, 82.0, 20.0 ],
                    "text": "CC2 → CC21"
                }
            },
            {
                "box": {
                    "id": "pk2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 380.0, 61.0, 22.0 ],
                    "text": "pack 0 50"
                }
            },
            {
                "box": {
                    "id": "ln2",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 200.0, 410.0, 54.0, 22.0 ],
                    "text": "line 0 10"
                }
            },
            {
                "box": {
                    "id": "out2",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 440.0, 64.0, 22.0 ],
                    "text": "ctlout 22 1"
                }
            },
            {
                "box": {
                    "id": "c2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 465.0, 82.0, 20.0 ],
                    "text": "CC3 → CC22"
                }
            },
            {
                "box": {
                    "id": "pk3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 290.0, 380.0, 61.0, 22.0 ],
                    "text": "pack 0 50"
                }
            },
            {
                "box": {
                    "id": "ln3",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 290.0, 410.0, 54.0, 22.0 ],
                    "text": "line 0 10"
                }
            },
            {
                "box": {
                    "id": "out3",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 290.0, 440.0, 64.0, 22.0 ],
                    "text": "ctlout 23 1"
                }
            },
            {
                "box": {
                    "id": "c3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 290.0, 465.0, 82.0, 20.0 ],
                    "text": "CC4 → CC23"
                }
            },
            {
                "box": {
                    "id": "noteout",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 380.0, 440.0, 59.0, 22.0 ],
                    "text": "noteout 1"
                }
            },
            {
                "box": {
                    "id": "cnote",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 380.0, 465.0, 128.0, 20.0 ],
                    "text": "button notes, unsmoothed"
                }
            },
            {
                "box": {
                    "id": "cyaw",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 500.0, 410.0, 20.0 ],
                    "text": "Yaw wraps 127 → 0 on a full turn. Smoothing turns the jump into a sweep."
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
                    "destination": [ "client", 0 ],
                    "source": [ "disc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "menu", 0 ],
                    "source": [ "info", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out0", 0 ],
                    "source": [ "ln0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out1", 0 ],
                    "source": [ "ln1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out2", 0 ],
                    "source": [ "ln2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out3", 0 ],
                    "source": [ "ln3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "info", 0 ],
                    "order": 1,
                    "source": [ "load", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ms50", 0 ],
                    "order": 0,
                    "source": [ "load", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tosym", 0 ],
                    "source": [ "menu", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "parse", 0 ],
                    "source": [ "midi", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk0", 1 ],
                    "order": 3,
                    "source": [ "ms", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk1", 1 ],
                    "order": 2,
                    "source": [ "ms", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk2", 1 ],
                    "order": 1,
                    "source": [ "ms", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk3", 1 ],
                    "order": 0,
                    "source": [ "ms", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ms", 0 ],
                    "source": [ "ms50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "noteout", 0 ],
                    "source": [ "parse", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rcc", 0 ],
                    "source": [ "parse", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ln0", 0 ],
                    "source": [ "pk0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ln1", 0 ],
                    "source": [ "pk1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ln2", 0 ],
                    "source": [ "pk2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ln3", 0 ],
                    "source": [ "pk3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "noteout", 0 ],
                    "order": 0,
                    "source": [ "pport", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out0", 0 ],
                    "order": 4,
                    "source": [ "pport", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out1", 0 ],
                    "order": 3,
                    "source": [ "pport", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out2", 0 ],
                    "order": 2,
                    "source": [ "pport", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out3", 0 ],
                    "order": 1,
                    "source": [ "pport", 0 ]
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
                    "destination": [ "pk0", 0 ],
                    "source": [ "rcc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk1", 0 ],
                    "source": [ "rcc", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk2", 0 ],
                    "source": [ "rcc", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk3", 0 ],
                    "source": [ "rcc", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "info", 0 ],
                    "source": [ "refresh", 0 ]
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
                    "destination": [ "pport", 0 ],
                    "source": [ "tosym", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}