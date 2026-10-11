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
        "rect": [ 140.0, 140.0, 720.0, 560.0 ],
        "boxes": [
            {
                "box": {
                    "id": "in",
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 20.0, 30.0, 30.0 ],
                    "outlettype": [ "" ],
                    "comment": "value <node> <property> <value>, a description dict, state, alert, log, domain",
                    "index": 0
                }
            },
            {
                "box": {
                    "id": "rdict",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 60.0, 95.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route dictionary"
                }
            },
            {
                "box": {
                    "id": "pdesc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 95.0, 170.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend description dictionary"
                }
            },
            {
                "box": {
                    "id": "role",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 135.0, 145.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend device #0-device"
                }
            },
            {
                "box": {
                    "id": "fwd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 450.0, 55.0, 22.0 ],
                    "text": "forward"
                }
            },
            {
                "box": {
                    "id": "recv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 480.0, 420.0, 50.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "receive"
                }
            },
            {
                "box": {
                    "id": "rrole",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [ 480.0, 450.0, 105.0, 22.0 ],
                    "outlettype": [ "", "", "" ],
                    "text": "route device ready"
                }
            },
            {
                "box": {
                    "id": "rid",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 480.0, 480.0, 95.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route #0-device"
                }
            },
            {
                "box": {
                    "id": "rkind",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [ 480.0, 510.0, 105.0, 22.0 ],
                    "outlettype": [ "", "", "" ],
                    "text": "route set dumpout"
                }
            },
            {
                "box": {
                    "id": "out0",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 480.0, 545.0, 30.0, 30.0 ],
                    "comment": "commands from controllers: <node> <property> <value>",
                    "index": 0
                }
            },
            {
                "box": {
                    "id": "out1",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 620.0, 545.0, 30.0, 30.0 ],
                    "comment": "dumpout",
                    "index": 1
                }
            },
            {
                "box": {
                    "id": "load",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 260.0, 20.0, 60.0, 22.0 ],
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
                    "patching_rect": [ 260.0, 50.0, 40.0, 22.0 ],
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
                    "patching_rect": [ 260.0, 80.0, 55.0, 22.0 ],
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
                    "patching_rect": [ 260.0, 115.0, 40.0, 22.0 ],
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
                    "patching_rect": [ 310.0, 150.0, 55.0, 22.0 ],
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
                    "patching_rect": [ 260.0, 185.0, 75.0, 22.0 ],
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
                    "patching_rect": [ 380.0, 220.0, 70.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route done"
                }
            },
            {
                "box": {
                    "id": "unpack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 260.0, 220.0, 65.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "unpack s s"
                }
            },
            {
                "box": {
                    "id": "pid",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 320.0, 255.0, 65.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend id"
                }
            },
            {
                "box": {
                    "id": "tname",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 260.0, 290.0, 40.0, 22.0 ],
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
                    "patching_rect": [ 260.0, 320.0, 190.0, 22.0 ],
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
                    "patching_rect": [ 290.0, 350.0, 195.0, 22.0 ],
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
                    "patching_rect": [ 260.0, 385.0, 78.0, 22.0 ],
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
                    "patching_rect": [ 360.0, 385.0, 72.0, 22.0 ],
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
                    "patching_rect": [ 460.0, 50.0, 60.0, 22.0 ],
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
                    "patching_rect": [ 460.0, 80.0, 35.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "free"
                }
            },
            {
                "box": {
                    "id": "rset",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 130.0, 60.0, 60.0, 22.0 ],
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
                    "patching_rect": [ 130.0, 90.0, 200.0, 22.0 ],
                    "text": "prepend device #0-device set"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "unpack", 0 ],
                    "source": [ "args", 0 ]
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
                    "destination": [ "role", 0 ],
                    "source": [ "pid", 0 ]
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
                    "source": [ "unpack", 0 ]
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
                    "destination": [ "role", 0 ],
                    "source": [ "pdesc", 0 ]
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
                    "destination": [ "rrole", 0 ],
                    "source": [ "recv", 0 ]
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
                    "source": [ "rset", 0 ],
                    "destination": [ "pset", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "rset", 1 ],
                    "destination": [ "role", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "pset", 0 ],
                    "destination": [ "fwd", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}