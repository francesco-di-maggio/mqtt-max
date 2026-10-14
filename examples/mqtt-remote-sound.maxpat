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
        "rect": [ 134.0, 163.0, 852.0, 697.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 122.0, 20.0 ],
                    "text": "REMOTE → SOUND"
                }
            },
            {
                "box": {
                    "id": "setup",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 673.0, 33.0 ],
                    "text": "Remote: prefix remote, XY pad, Buttons and Sliders on, Connect. Turn audio on.\nButtons play C major from middle C. Pad: X filter cutoff, Y resonance. Slider 1: volume. Values from every Remote are mixed."
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
                    "patching_rect": [ 20.0, 113.0, 141.0, 22.0 ],
                    "text": "mqtt.client remote-sound"
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
                    "patching_rect": [ 280.0, 143.0, 100.0, 22.0 ],
                    "text": "connected"
                }
            },
            {
                "box": {
                    "id": "ctl",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 20.0, 188.0, 293.0, 22.0 ],
                    "text": "mqtt.homie.controller remote-sound @domain remote"
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
                    "patching_rect": [ 200.0, 253.0, 140.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cdev",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 345.0, 253.0, 43.0, 20.0 ],
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
                    "id": "cbtn",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 323.0, 48.0, 20.0 ],
                    "text": "buttons"
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
                    "id": "mtof",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 443.0, 32.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 473.0, 77.0, 22.0 ],
                    "text": "saw~ 261.63"
                }
            },
            {
                "box": {
                    "id": "bamp",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 160.0, 348.0, 40.0, 22.0 ],
                    "text": "* 0.25"
                }
            },
            {
                "box": {
                    "id": "bpk",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 160.0, 378.0, 64.0, 22.0 ],
                    "text": "pack 0. 20"
                }
            },
            {
                "box": {
                    "id": "bline",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 160.0, 473.0, 34.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "id": "cpad",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 380.0, 323.0, 29.0, 20.0 ],
                    "text": "pad"
                }
            },
            {
                "box": {
                    "id": "rpad",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 380.0, 348.0, 55.0, 22.0 ],
                    "text": "route x y"
                }
            },
            {
                "box": {
                    "id": "px",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 380.0, 378.0, 123.0, 22.0 ],
                    "text": "scale 0. 1. 200. 6000."
                }
            },
            {
                "box": {
                    "id": "ppk",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 380.0, 408.0, 64.0, 22.0 ],
                    "text": "pack 0. 30"
                }
            },
            {
                "box": {
                    "id": "pline",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 380.0, 473.0, 34.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "id": "py",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 378.0, 97.0, 22.0 ],
                    "text": "scale 0. 1. 0. 0.9"
                }
            },
            {
                "box": {
                    "id": "lcut",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 408.0, 90.0, 22.0 ],
                    "text": "loadmess 2000"
                }
            },
            {
                "box": {
                    "id": "csl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 640.0, 323.0, 47.0, 20.0 ],
                    "text": "slider 1"
                }
            },
            {
                "box": {
                    "id": "rsl",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 640.0, 348.0, 46.0, 22.0 ],
                    "text": "route 1"
                }
            },
            {
                "box": {
                    "id": "spk",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 667.0, 378.0, 64.0, 22.0 ],
                    "text": "pack 0. 50"
                }
            },
            {
                "box": {
                    "id": "lvol",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 700.0, 408.0, 80.0, 22.0 ],
                    "text": "loadmess 0.5"
                }
            },
            {
                "box": {
                    "id": "sline",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 640.0, 473.0, 34.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 518.0, 92.0, 22.0 ],
                    "text": "lores~ 2000 0.3"
                }
            },
            {
                "box": {
                    "id": "env",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 20.0, 553.0, 29.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "vol",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 20.0, 588.0, 29.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "dac",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 623.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "cmono",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 100.0, 638.0, 268.0, 20.0 ],
                    "text": "One voice: the last button pressed sets the pitch."
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "bpk", 0 ],
                    "source": [ "bamp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "env", 1 ],
                    "source": [ "bline", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mtof", 0 ],
                    "source": [ "bn0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mtof", 0 ],
                    "source": [ "bn1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mtof", 0 ],
                    "source": [ "bn2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mtof", 0 ],
                    "source": [ "bn3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mtof", 0 ],
                    "source": [ "bn4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mtof", 0 ],
                    "source": [ "bn5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mtof", 0 ],
                    "source": [ "bn6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mtof", 0 ],
                    "source": [ "bn7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bline", 0 ],
                    "source": [ "bpk", 0 ]
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
                    "destination": [ "bamp", 0 ],
                    "source": [ "bunp", 1 ]
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
                    "destination": [ "vol", 0 ],
                    "source": [ "env", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ppk", 0 ],
                    "source": [ "lcut", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "env", 0 ],
                    "source": [ "lores", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "spk", 0 ],
                    "source": [ "lvol", 0 ]
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
                    "destination": [ "dev", 0 ],
                    "source": [ "pdev", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "lores", 1 ],
                    "source": [ "pline", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pline", 0 ],
                    "source": [ "ppk", 0 ]
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
                    "destination": [ "ppk", 0 ],
                    "source": [ "px", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "lores", 2 ],
                    "source": [ "py", 0 ]
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
                    "destination": [ "px", 0 ],
                    "source": [ "rpad", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "py", 0 ],
                    "source": [ "rpad", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "spk", 0 ],
                    "source": [ "rsl", 0 ]
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
                    "destination": [ "vol", 1 ],
                    "source": [ "sline", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sline", 0 ],
                    "source": [ "spk", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dac", 1 ],
                    "order": 0,
                    "source": [ "vol", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dac", 0 ],
                    "order": 1,
                    "source": [ "vol", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}