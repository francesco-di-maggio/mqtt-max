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
        "rect": [ 134.0, 163.0, 855.0, 600.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 104.0, 20.0 ],
                    "text": "REMOTE → MIDI"
                }
            },
            {
                "box": {
                    "id": "setup",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 760.0, 33.0 ],
                    "text": "Remote: prefix remote, XY pad, Buttons and Sliders on, Connect. Choose a MIDI output below. On macOS, the IAC Driver reaches any DAW:\nenable it in Audio MIDI Setup. Buttons: notes 60-72 (C major). Pad X, Y: CC 20, 21. Sliders 1-4: CC 22-25. Channel 1."
                }
            },
            {
                "box": {
                    "id": "conn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 78.0, 261.0, 22.0 ],
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
                    "patching_rect": [ 391.0, 78.0, 66.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 113.0, 130.0, 22.0 ],
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
                    "patching_rect": [ 200.0, 113.0, 71.0, 22.0 ],
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
                    "patching_rect": [ 200.0, 143.0, 72.0, 22.0 ],
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
                    "patching_rect": [ 299.0, 143.0, 100.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "ctl",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 20.0, 188.0, 283.0, 22.0 ],
                    "text": "mqtt.homie.controller remote-midi @domain remote"
                }
            },
            {
                "box": {
                    "id": "slice",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 223.0, 55.0, 22.0 ],
                    "text": "zl.slice 1"
                }
            },
            {
                "box": {
                    "id": "pdev",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 120.0, 253.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "dev",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 219.0, 253.0, 140.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cdev",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 369.0, 253.0, 43.0, 20.0 ],
                    "text": "device"
                }
            },
            {
                "box": {
                    "id": "rnode",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 20.0, 288.0, 128.0, 22.0 ],
                    "text": "route pad button slider"
                }
            },
            {
                "box": {
                    "id": "cport",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 188.0, 71.0, 20.0 ],
                    "text": "MIDI output"
                }
            },
            {
                "box": {
                    "id": "load",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 560.0, 213.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "refresh",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 640.0, 213.0, 35.0, 22.0 ],
                    "text": "bang"
                }
            },
            {
                "box": {
                    "id": "info",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 243.0, 50.0, 22.0 ],
                    "text": "midiinfo"
                }
            },
            {
                "box": {
                    "id": "menu",
                    "items": [ "AU DLS Synth 1", ",", "IAC Driver Bus 1", ",", "UMC1820", ",", "from Max 1", ",", "from Max 2" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 560.0, 273.0, 180.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "tosym",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 303.0, 57.0, 22.0 ],
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
                    "patching_rect": [ 560.0, 333.0, 77.0, 22.0 ],
                    "text": "prepend port"
                }
            },
            {
                "box": {
                    "id": "cbtn",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 323.0, 96.0, 20.0 ],
                    "text": "buttons → notes"
                }
            },
            {
                "box": {
                    "id": "bunp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 20.0, 348.0, 67.0, 22.0 ],
                    "text": "unpack 0 0"
                }
            },
            {
                "box": {
                    "id": "vel",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 173.0, 378.0, 37.0, 22.0 ],
                    "text": "* 100"
                }
            },
            {
                "box": {
                    "id": "bsel",
                    "maxclass": "newobj",
                    "numinlets": 9,
                    "numoutlets": 9,
                    "outlettype": [ "bang", "bang", "bang", "bang", "bang", "bang", "bang", "bang", "" ],
                    "patching_rect": [ 20.0, 378.0, 104.0, 22.0 ],
                    "text": "sel 1 2 3 4 5 6 7 8"
                }
            },
            {
                "box": {
                    "id": "bn0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 408.0, 29.5, 22.0 ],
                    "text": "60"
                }
            },
            {
                "box": {
                    "id": "bn1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 54.0, 408.0, 29.5, 22.0 ],
                    "text": "62"
                }
            },
            {
                "box": {
                    "id": "bn2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 88.0, 408.0, 29.5, 22.0 ],
                    "text": "64"
                }
            },
            {
                "box": {
                    "id": "bn3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 122.0, 408.0, 29.5, 22.0 ],
                    "text": "65"
                }
            },
            {
                "box": {
                    "id": "bn4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 156.0, 408.0, 29.5, 22.0 ],
                    "text": "67"
                }
            },
            {
                "box": {
                    "id": "bn5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 408.0, 29.5, 22.0 ],
                    "text": "69"
                }
            },
            {
                "box": {
                    "id": "bn6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 224.0, 408.0, 29.5, 22.0 ],
                    "text": "71"
                }
            },
            {
                "box": {
                    "id": "bn7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 258.0, 408.0, 29.5, 22.0 ],
                    "text": "72"
                }
            },
            {
                "box": {
                    "id": "npk",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 443.0, 54.0, 22.0 ],
                    "text": "pack 0 0"
                }
            },
            {
                "box": {
                    "id": "nout",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 478.0, 59.0, 22.0 ],
                    "text": "noteout 1"
                }
            },
            {
                "box": {
                    "id": "ccc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 320.0, 323.0, 106.0, 20.0 ],
                    "text": "pad, sliders → CC"
                }
            },
            {
                "box": {
                    "id": "rpad",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 320.0, 348.0, 55.0, 22.0 ],
                    "text": "route x y"
                }
            },
            {
                "box": {
                    "id": "rsl",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "patching_rect": [ 420.0, 348.0, 76.0, 22.0 ],
                    "text": "route 1 2 3 4"
                }
            },
            {
                "box": {
                    "id": "e0",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 320.0, 408.0, 121.0, 22.0 ],
                    "text": "expr int($f1*127+0.5)"
                }
            },
            {
                "box": {
                    "id": "c0",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 320.0, 478.0, 64.0, 22.0 ],
                    "text": "ctlout 20 1"
                }
            },
            {
                "box": {
                    "id": "e1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 395.0, 438.0, 121.0, 22.0 ],
                    "text": "expr int($f1*127+0.5)"
                }
            },
            {
                "box": {
                    "id": "c1",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 395.0, 478.0, 64.0, 22.0 ],
                    "text": "ctlout 21 1"
                }
            },
            {
                "box": {
                    "id": "e2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 470.0, 408.0, 121.0, 22.0 ],
                    "text": "expr int($f1*127+0.5)"
                }
            },
            {
                "box": {
                    "id": "c2",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 470.0, 478.0, 64.0, 22.0 ],
                    "text": "ctlout 22 1"
                }
            },
            {
                "box": {
                    "id": "e3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 545.0, 438.0, 121.0, 22.0 ],
                    "text": "expr int($f1*127+0.5)"
                }
            },
            {
                "box": {
                    "id": "c3",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 545.0, 478.0, 64.0, 22.0 ],
                    "text": "ctlout 23 1"
                }
            },
            {
                "box": {
                    "id": "e4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 620.0, 408.0, 121.0, 22.0 ],
                    "text": "expr int($f1*127+0.5)"
                }
            },
            {
                "box": {
                    "id": "c4",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 620.0, 478.0, 64.0, 22.0 ],
                    "text": "ctlout 24 1"
                }
            },
            {
                "box": {
                    "id": "e5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 695.0, 438.0, 121.0, 22.0 ],
                    "text": "expr int($f1*127+0.5)"
                }
            },
            {
                "box": {
                    "id": "c5",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 695.0, 478.0, 64.0, 22.0 ],
                    "text": "ctlout 25 1"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "npk", 0 ],
                    "source": [ "bn0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "npk", 0 ],
                    "source": [ "bn1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "npk", 0 ],
                    "source": [ "bn2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "npk", 0 ],
                    "source": [ "bn3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "npk", 0 ],
                    "source": [ "bn4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "npk", 0 ],
                    "source": [ "bn5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "npk", 0 ],
                    "source": [ "bn6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "npk", 0 ],
                    "source": [ "bn7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bn0", 0 ],
                    "source": [ "bsel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bn1", 0 ],
                    "source": [ "bsel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bn2", 0 ],
                    "source": [ "bsel", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bn3", 0 ],
                    "source": [ "bsel", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bn4", 0 ],
                    "source": [ "bsel", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bn5", 0 ],
                    "source": [ "bsel", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bn6", 0 ],
                    "source": [ "bsel", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bn7", 0 ],
                    "source": [ "bsel", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bsel", 0 ],
                    "source": [ "bunp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "vel", 0 ],
                    "source": [ "bunp", 1 ]
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
                    "destination": [ "client", 0 ],
                    "source": [ "conn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "slice", 0 ],
                    "source": [ "ctl", 0 ]
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
                    "destination": [ "c0", 0 ],
                    "source": [ "e0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "c1", 0 ],
                    "source": [ "e1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "c2", 0 ],
                    "source": [ "e2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "c3", 0 ],
                    "source": [ "e3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "c4", 0 ],
                    "source": [ "e4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "c5", 0 ],
                    "source": [ "e5", 0 ]
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
                    "destination": [ "info", 0 ],
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
                    "destination": [ "nout", 0 ],
                    "source": [ "npk", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dev", 0 ],
                    "source": [ "pdev", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "c0", 0 ],
                    "order": 5,
                    "source": [ "pport", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "c1", 0 ],
                    "order": 4,
                    "source": [ "pport", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "c2", 0 ],
                    "order": 3,
                    "source": [ "pport", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "c3", 0 ],
                    "order": 2,
                    "source": [ "pport", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "c4", 0 ],
                    "order": 1,
                    "source": [ "pport", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "c5", 0 ],
                    "order": 0,
                    "source": [ "pport", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "nout", 0 ],
                    "order": 6,
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
                    "destination": [ "info", 0 ],
                    "source": [ "refresh", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bunp", 0 ],
                    "source": [ "rnode", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rpad", 0 ],
                    "source": [ "rnode", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rsl", 0 ],
                    "source": [ "rnode", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "e0", 0 ],
                    "source": [ "rpad", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "e1", 0 ],
                    "source": [ "rpad", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "e2", 0 ],
                    "source": [ "rsl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "e3", 0 ],
                    "source": [ "rsl", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "e4", 0 ],
                    "source": [ "rsl", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "e5", 0 ],
                    "source": [ "rsl", 3 ]
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
                    "destination": [ "pdev", 0 ],
                    "source": [ "slice", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rnode", 0 ],
                    "source": [ "slice", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pport", 0 ],
                    "source": [ "tosym", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "npk", 1 ],
                    "source": [ "vel", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}