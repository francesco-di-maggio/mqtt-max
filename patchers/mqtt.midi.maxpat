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
        "rect": [ 120.0, 120.0, 680.0, 540.0 ],
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
                    "id": "load",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 340.0, 20.0, 60.0, 22.0 ],
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
                    "patching_rect": [ 340.0, 50.0, 40.0, 22.0 ],
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
                    "patching_rect": [ 340.0, 80.0, 55.0, 22.0 ],
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
                    "patching_rect": [ 340.0, 115.0, 40.0, 22.0 ],
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
                    "patching_rect": [ 390.0, 150.0, 55.0, 22.0 ],
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
                    "patching_rect": [ 340.0, 185.0, 75.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "patcherargs"
                }
            },
            {
                "box": {
                    "id": "tname",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 340.0, 220.0, 40.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "done",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 460.0, 220.0, 70.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route done"
                }
            },
            {
                "box": {
                    "id": "namein",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 340.0, 255.0, 190.0, 22.0 ],
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
                    "patching_rect": [ 370.0, 285.0, 195.0, 22.0 ],
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
                    "patching_rect": [ 340.0, 320.0, 78.0, 22.0 ],
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
                    "patching_rect": [ 440.0, 320.0, 72.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend set"
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
                    "patching_rect": [ 130.0, 95.0, 75.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend port"
                }
            },
            {
                "box": {
                    "id": "pbytes",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 190.0, 125.0, 80.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 170.0, 125.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 355.0, 55.0, 22.0 ],
                    "text": "forward"
                }
            },
            {
                "box": {
                    "id": "close",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 180.0, 290.0, 65.0, 22.0 ],
                    "outlettype": [ "bang" ],
                    "text": "freebang"
                }
            },
            {
                "box": {
                    "id": "free",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 180.0, 320.0, 35.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "free"
                }
            },
            {
                "box": {
                    "id": "recv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 440.0, 355.0, 50.0, 22.0 ],
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
                    "patching_rect": [ 440.0, 390.0, 100.0, 22.0 ],
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
                    "patching_rect": [ 440.0, 420.0, 85.0, 22.0 ],
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
                    "patching_rect": [ 440.0, 450.0, 115.0, 22.0 ],
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
                    "patching_rect": [ 440.0, 480.0, 35.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "iter"
                }
            },
            {
                "box": {
                    "id": "out0",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 440.0, 505.0, 30.0, 30.0 ],
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
                    "patching_rect": [ 570.0, 505.0, 30.0, 30.0 ],
                    "comment": "dumpout",
                    "index": 1
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
                    "destination": [ "pbytes", 0 ],
                    "source": [ "attr", 3 ]
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
                    "destination": [ "recv", 0 ],
                    "source": [ "setout", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "free", 0 ],
                    "source": [ "close", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "role", 0 ],
                    "source": [ "free", 0 ]
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
                    "destination": [ "out1", 0 ],
                    "source": [ "rkind", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out0", 0 ],
                    "source": [ "iter", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}