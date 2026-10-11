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
        "rect": [ 120.0, 120.0, 900.0, 640.0 ],
        "boxes": [
            {
                "box": {
                    "id": "in",
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 20.0, 30.0, 30.0 ],
                    "outlettype": [ "" ],
                    "comment": "raw MIDI bytes, as [midiout] takes them; prefix, direction, port",
                    "index": 0
                }
            },
            {
                "box": {
                    "id": "attr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "patching_rect": [ 20.0, 60.0, 160.0, 22.0 ],
                    "outlettype": [ "", "", "", "" ],
                    "text": "route prefix direction port"
                }
            },
            {
                "box": {
                    "id": "pprefix",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 95.0, 85.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend prefix"
                }
            },
            {
                "box": {
                    "id": "pdir",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 125.0, 100.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend direction"
                }
            },
            {
                "box": {
                    "id": "pport",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 155.0, 75.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend port"
                }
            },
            {
                "box": {
                    "id": "rset",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 140.0, 95.0, 60.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route set"
                }
            },
            {
                "box": {
                    "id": "pset",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 140.0, 125.0, 100.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend bytes set"
                }
            },
            {
                "box": {
                    "id": "pbytes",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 140.0, 155.0, 80.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend bytes"
                }
            },
            {
                "box": {
                    "id": "role",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 200.0, 125.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend midi #0-midi"
                }
            },
            {
                "box": {
                    "id": "fwd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 440.0, 55.0, 22.0 ],
                    "text": "forward"
                }
            },
            {
                "box": {
                    "id": "cconn",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 280.0, 20.0, 80.0, 20.0 ],
                    "text": "connection"
                }
            },
            {
                "box": {
                    "id": "load",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 280.0, 45.0, 60.0, 22.0 ],
                    "outlettype": [ "bang" ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "tload",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 280.0, 75.0, 40.0, 22.0 ],
                    "outlettype": [ "bang", "bang" ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "defer",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 280.0, 105.0, 55.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "deferlow"
                }
            },
            {
                "box": {
                    "id": "treg",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 280.0, 135.0, 40.0, 22.0 ],
                    "outlettype": [ "bang", "bang" ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "register",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 330.0, 165.0, 55.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "register"
                }
            },
            {
                "box": {
                    "id": "args",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 280.0, 200.0, 75.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "patcherargs"
                }
            },
            {
                "box": {
                    "id": "done",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 400.0, 230.0, 70.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route done"
                }
            },
            {
                "box": {
                    "id": "tname",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 280.0, 260.0, 40.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "t s s"
                }
            },
            {
                "box": {
                    "id": "namein",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 280.0, 290.0, 190.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "sprintf symout mqtt.client.%s.in"
                }
            },
            {
                "box": {
                    "id": "nameout",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 300.0, 320.0, 195.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "sprintf symout mqtt.client.%s.out"
                }
            },
            {
                "box": {
                    "id": "setin",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 280.0, 355.0, 78.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend send"
                }
            },
            {
                "box": {
                    "id": "setout",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 380.0, 355.0, 72.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "free",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 400.0, 45.0, 60.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "freebang"
                }
            },
            {
                "box": {
                    "id": "freemsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 400.0, 75.0, 35.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "free"
                }
            },
            {
                "box": {
                    "id": "cout",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 20.0, 60.0, 20.0 ],
                    "text": "output"
                }
            },
            {
                "box": {
                    "id": "recv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 560.0, 45.0, 50.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "receive"
                }
            },
            {
                "box": {
                    "id": "rmidi",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [ 560.0, 75.0, 100.0, 22.0 ],
                    "outlettype": [ "", "", "" ],
                    "text": "route midi ready"
                }
            },
            {
                "box": {
                    "id": "rid",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 560.0, 105.0, 85.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route #0-midi"
                }
            },
            {
                "box": {
                    "id": "rkind",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [ 560.0, 135.0, 115.0, 22.0 ],
                    "outlettype": [ "", "", "" ],
                    "text": "route bytes dumpout"
                }
            },
            {
                "box": {
                    "id": "iter",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 560.0, 165.0, 35.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "iter"
                }
            },
            {
                "box": {
                    "id": "rport",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 660.0, 165.0, 65.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route port"
                }
            },
            {
                "box": {
                    "id": "out0",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 590.0, 30.0, 30.0 ],
                    "comment": "raw MIDI bytes, as [midiin] outputs them",
                    "index": 0
                }
            },
            {
                "box": {
                    "id": "out1",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 660.0, 590.0, 30.0, 30.0 ],
                    "comment": "port <name> once Max lists the port: connect to ctlin, notein, ctlout ...",
                    "index": 1
                }
            },
            {
                "box": {
                    "id": "out2",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 760.0, 590.0, 30.0, 30.0 ],
                    "comment": "dumpout: error",
                    "index": 2
                }
            },
            {
                "box": {
                    "id": "cport",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 205.0, 330.0, 20.0 ],
                    "text": "port <name> once Max lists the port as an input and an output"
                }
            },
            {
                "box": {
                    "id": "tport",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [ 560.0, 230.0, 80.0, 22.0 ],
                    "outlettype": [ "bang", "bang", "", "", "" ],
                    "text": "t b b s s s"
                }
            },
            {
                "box": {
                    "id": "store",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 640.0, 260.0, 100.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend set port"
                }
            },
            {
                "box": {
                    "id": "portmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 640.0, 520.0, 150.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": ""
                }
            },
            {
                "box": {
                    "id": "arm",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 600.0, 290.0, 29.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "clear",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 760.0, 290.0, 40.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "id": "minus",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 560.0, 320.0, 29.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "-1"
                }
            },
            {
                "box": {
                    "id": "infoin",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 560.0, 350.0, 150.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "midiinfo @autopollinput 1"
                }
            },
            {
                "box": {
                    "id": "infoout",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 720.0, 350.0, 160.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "midiinfo @autopolloutput 1"
                }
            },
            {
                "box": {
                    "id": "appin",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 560.0, 380.0, 80.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route append"
                }
            },
            {
                "box": {
                    "id": "appout",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 720.0, 380.0, 80.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route append"
                }
            },
            {
                "box": {
                    "id": "selin",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 560.0, 410.0, 40.0, 22.0 ],
                    "outlettype": [ "bang", "" ],
                    "text": "sel -"
                }
            },
            {
                "box": {
                    "id": "selout",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 720.0, 410.0, 40.0, 22.0 ],
                    "outlettype": [ "bang", "" ],
                    "text": "sel -"
                }
            },
            {
                "box": {
                    "id": "gatein",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 560.0, 440.0, 50.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "gate 1 0"
                }
            },
            {
                "box": {
                    "id": "gateout",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 720.0, 440.0, 50.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "gate 1 0"
                }
            },
            {
                "box": {
                    "id": "tin",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 560.0, 470.0, 40.0, 22.0 ],
                    "outlettype": [ "bang", "" ],
                    "text": "t b 0"
                }
            },
            {
                "box": {
                    "id": "tout",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 720.0, 470.0, 40.0, 22.0 ],
                    "outlettype": [ "bang", "" ],
                    "text": "t b 0"
                }
            },
            {
                "box": {
                    "id": "both",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 640.0, 490.0, 50.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "buddy 2"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "attr", 0 ],
                    "source": [ "in", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pprefix", 0 ],
                    "source": [ "attr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pdir", 0 ],
                    "source": [ "attr", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pport", 0 ],
                    "source": [ "attr", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rset", 0 ],
                    "source": [ "attr", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pset", 0 ],
                    "source": [ "rset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pbytes", 0 ],
                    "source": [ "rset", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "role", 0 ],
                    "source": [ "pprefix", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "role", 0 ],
                    "source": [ "pdir", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "role", 0 ],
                    "source": [ "pport", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "role", 0 ],
                    "source": [ "pset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "role", 0 ],
                    "source": [ "pbytes", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "fwd", 0 ],
                    "source": [ "role", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tload", 0 ],
                    "source": [ "load", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "args", 0 ],
                    "source": [ "tload", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "defer", 0 ],
                    "source": [ "tload", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "treg", 0 ],
                    "source": [ "defer", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "args", 0 ],
                    "source": [ "treg", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "register", 0 ],
                    "source": [ "treg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "role", 0 ],
                    "source": [ "register", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tname", 0 ],
                    "source": [ "args", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "done", 0 ],
                    "source": [ "args", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "role", 0 ],
                    "source": [ "done", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "namein", 0 ],
                    "source": [ "tname", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "nameout", 0 ],
                    "source": [ "tname", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "setin", 0 ],
                    "source": [ "namein", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "setout", 0 ],
                    "source": [ "nameout", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "fwd", 0 ],
                    "source": [ "setin", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "freemsg", 0 ],
                    "source": [ "free", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "role", 0 ],
                    "source": [ "freemsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "recv", 0 ],
                    "source": [ "setout", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rmidi", 0 ],
                    "source": [ "recv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rid", 0 ],
                    "source": [ "rmidi", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "treg", 0 ],
                    "source": [ "rmidi", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rkind", 0 ],
                    "source": [ "rid", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "iter", 0 ],
                    "source": [ "rkind", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rport", 0 ],
                    "source": [ "rkind", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out0", 0 ],
                    "source": [ "iter", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out2", 0 ],
                    "source": [ "rport", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tport", 0 ],
                    "source": [ "rport", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "selin", 1 ],
                    "source": [ "tport", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "selout", 1 ],
                    "source": [ "tport", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "store", 0 ],
                    "source": [ "tport", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "arm", 0 ],
                    "source": [ "tport", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "clear", 0 ],
                    "source": [ "tport", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "minus", 0 ],
                    "source": [ "tport", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "infoout", 0 ],
                    "source": [ "tport", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "portmsg", 0 ],
                    "source": [ "store", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gatein", 0 ],
                    "source": [ "arm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gateout", 0 ],
                    "source": [ "arm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "both", 0 ],
                    "source": [ "clear", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "infoin", 1 ],
                    "source": [ "minus", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "appin", 0 ],
                    "source": [ "infoin", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "appout", 0 ],
                    "source": [ "infoout", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "selin", 0 ],
                    "source": [ "appin", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "selout", 0 ],
                    "source": [ "appout", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gatein", 1 ],
                    "source": [ "selin", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gateout", 1 ],
                    "source": [ "selout", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tin", 0 ],
                    "source": [ "gatein", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tout", 0 ],
                    "source": [ "gateout", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gatein", 0 ],
                    "source": [ "tin", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gateout", 0 ],
                    "source": [ "tout", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "both", 0 ],
                    "source": [ "tin", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "both", 1 ],
                    "source": [ "tout", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "portmsg", 0 ],
                    "source": [ "both", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out1", 0 ],
                    "source": [ "portmsg", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}