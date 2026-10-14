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
        "rect": [ 140.0, 140.0, 880.0, 520.0 ],
        "boxes": [
            {
                "box": {
                    "comment": "value <node> <property> <value>, a description dictionary, state, alert, log, domain",
                    "id": "in",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 20.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "rdict",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 60.0, 91.0, 22.0 ],
                    "text": "route dictionary"
                }
            },
            {
                "box": {
                    "id": "pdesc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 90.0, 169.0, 22.0 ],
                    "text": "prepend description dictionary"
                }
            },
            {
                "box": {
                    "id": "rset",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 125.0, 55.0, 22.0 ],
                    "text": "route set"
                }
            },
            {
                "box": {
                    "id": "pset",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 155.0, 165.0, 22.0 ],
                    "text": "prepend device #0-device set"
                }
            },
            {
                "box": {
                    "id": "role",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 200.0, 146.0, 22.0 ],
                    "text": "prepend device #0-device"
                }
            },
            {
                "box": {
                    "id": "fwd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 440.0, 49.0, 22.0 ],
                    "text": "forward"
                }
            },
            {
                "box": {
                    "id": "cconn",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 300.0, 20.0, 67.0, 20.0 ],
                    "text": "connection"
                }
            },
            {
                "box": {
                    "id": "load",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 300.0, 45.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "tload",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 300.0, 75.0, 32.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "defer",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 105.0, 54.0, 22.0 ],
                    "text": "deferlow"
                }
            },
            {
                "box": {
                    "id": "treg",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 300.0, 135.0, 32.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "register",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 350.0, 165.0, 49.0, 22.0 ],
                    "text": "register"
                }
            },
            {
                "box": {
                    "id": "args",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 300.0, 200.0, 72.0, 22.0 ],
                    "text": "patcherargs"
                }
            },
            {
                "box": {
                    "id": "done",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 420.0, 230.0, 66.0, 22.0 ],
                    "text": "route done"
                }
            },
            {
                "box": {
                    "id": "unpack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 300.0, 230.0, 66.0, 22.0 ],
                    "text": "unpack s s"
                }
            },
            {
                "box": {
                    "id": "pid",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 340.0, 260.0, 65.0, 22.0 ],
                    "text": "prepend id"
                }
            },
            {
                "box": {
                    "id": "tname",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 300.0, 290.0, 31.0, 22.0 ],
                    "text": "t s s"
                }
            },
            {
                "box": {
                    "id": "namein",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 320.0, 174.0, 22.0 ],
                    "text": "sprintf symout mqtt.client.%s.in"
                }
            },
            {
                "box": {
                    "id": "nameout",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 320.0, 350.0, 181.0, 22.0 ],
                    "text": "sprintf symout mqtt.client.%s.out"
                }
            },
            {
                "box": {
                    "id": "setin",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 385.0, 82.0, 22.0 ],
                    "text": "prepend send"
                }
            },
            {
                "box": {
                    "id": "setout",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 385.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "free",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 420.0, 45.0, 56.0, 22.0 ],
                    "text": "freebang"
                }
            },
            {
                "box": {
                    "id": "freemsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 420.0, 75.0, 29.5, 22.0 ],
                    "text": "free"
                }
            },
            {
                "box": {
                    "id": "cout",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 20.0, 42.0, 20.0 ],
                    "text": "output"
                }
            },
            {
                "box": {
                    "id": "recv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 45.0, 47.0, 22.0 ],
                    "text": "receive"
                }
            },
            {
                "box": {
                    "id": "rrole",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 560.0, 75.0, 107.0, 22.0 ],
                    "text": "route device ready"
                }
            },
            {
                "box": {
                    "id": "rid",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 560.0, 105.0, 91.0, 22.0 ],
                    "text": "route #0-device"
                }
            },
            {
                "box": {
                    "id": "rkind",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 560.0, 135.0, 105.0, 22.0 ],
                    "text": "route set dumpout"
                }
            },
            {
                "box": {
                    "comment": "commands from controllers: <node> <property> <value>",
                    "id": "out0",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 470.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "dumpout: state, broadcast, error",
                    "id": "out1",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 680.0, 470.0, 30.0, 30.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "done", 0 ],
                    "source": [ "args", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "unpack", 0 ],
                    "source": [ "args", 0 ]
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
                    "destination": [ "role", 0 ],
                    "source": [ "done", 1 ]
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
                    "destination": [ "rdict", 0 ],
                    "source": [ "in", 0 ]
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
                    "destination": [ "role", 0 ],
                    "source": [ "pdesc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "role", 0 ],
                    "source": [ "pid", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "fwd", 0 ],
                    "source": [ "pset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pdesc", 0 ],
                    "source": [ "rdict", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rset", 0 ],
                    "source": [ "rdict", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rrole", 0 ],
                    "source": [ "recv", 0 ]
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
                    "destination": [ "rkind", 0 ],
                    "source": [ "rid", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out0", 0 ],
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
                    "destination": [ "fwd", 0 ],
                    "source": [ "role", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rid", 0 ],
                    "source": [ "rrole", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "treg", 0 ],
                    "source": [ "rrole", 1 ]
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
                    "destination": [ "role", 0 ],
                    "source": [ "rset", 1 ]
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
                    "destination": [ "pid", 0 ],
                    "source": [ "unpack", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tname", 0 ],
                    "source": [ "unpack", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}