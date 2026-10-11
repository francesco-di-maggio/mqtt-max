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
        "rect": [ 160.0, 160.0, 900.0, 520.0 ],
        "boxes": [
            {
                "box": {
                    "id": "in",
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 20.0, 30.0, 30.0 ],
                    "outlettype": [ "" ],
                    "comment": "set <device> <node> <property> <value>, broadcast <subtopic> <text>, domain",
                    "index": 0
                }
            },
            {
                "box": {
                    "id": "rset",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 60.0, 60.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 90.0, 244.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend controller #0-controller set"
                }
            },
            {
                "box": {
                    "id": "role",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 200.0, 180.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend controller #0-controller"
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
                    "patching_rect": [ 300.0, 20.0, 80.0, 20.0 ],
                    "text": "connection"
                }
            },
            {
                "box": {
                    "id": "load",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 300.0, 45.0, 60.0, 22.0 ],
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
                    "patching_rect": [ 300.0, 75.0, 40.0, 22.0 ],
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
                    "patching_rect": [ 300.0, 105.0, 55.0, 22.0 ],
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
                    "patching_rect": [ 300.0, 135.0, 40.0, 22.0 ],
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
                    "patching_rect": [ 350.0, 165.0, 55.0, 22.0 ],
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
                    "patching_rect": [ 300.0, 200.0, 75.0, 22.0 ],
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
                    "patching_rect": [ 420.0, 230.0, 70.0, 22.0 ],
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
                    "patching_rect": [ 300.0, 290.0, 40.0, 22.0 ],
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
                    "patching_rect": [ 300.0, 320.0, 190.0, 22.0 ],
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
                    "patching_rect": [ 320.0, 350.0, 195.0, 22.0 ],
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
                    "patching_rect": [ 300.0, 385.0, 78.0, 22.0 ],
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
                    "patching_rect": [ 400.0, 385.0, 72.0, 22.0 ],
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
                    "patching_rect": [ 420.0, 45.0, 60.0, 22.0 ],
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
                    "patching_rect": [ 420.0, 75.0, 35.0, 22.0 ],
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
                    "id": "rrole",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [ 560.0, 75.0, 130.0, 22.0 ],
                    "outlettype": [ "", "", "" ],
                    "text": "route controller ready"
                }
            },
            {
                "box": {
                    "id": "rid",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 560.0, 105.0, 115.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route #0-controller"
                }
            },
            {
                "box": {
                    "id": "rkind",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 7,
                    "patching_rect": [ 560.0, 135.0, 275.0, 22.0 ],
                    "outlettype": [ "", "", "", "", "", "", "" ],
                    "text": "route value devices dumpout description alert log"
                }
            },
            {
                "box": {
                    "id": "pdesc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 680.0, 170.0, 115.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend description"
                }
            },
            {
                "box": {
                    "id": "palert",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 680.0, 200.0, 80.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend alert"
                }
            },
            {
                "box": {
                    "id": "plog",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 680.0, 230.0, 70.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend log"
                }
            },
            {
                "box": {
                    "id": "out0",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 470.0, 30.0, 30.0 ],
                    "comment": "values: <device> <node> <property> <value>",
                    "index": 0
                }
            },
            {
                "box": {
                    "id": "out1",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 640.0, 470.0, 30.0, 30.0 ],
                    "comment": "devices: dictionary of online and offline devices",
                    "index": 1
                }
            },
            {
                "box": {
                    "id": "out2",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 720.0, 470.0, 30.0, 30.0 ],
                    "comment": "dumpout: description, alert, log, error",
                    "index": 2
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "rset", 0 ],
                    "source": [ "in", 0 ]
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
                    "destination": [ "fwd", 0 ],
                    "source": [ "pset", 0 ]
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
                    "destination": [ "out2", 0 ],
                    "source": [ "rkind", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pdesc", 0 ],
                    "source": [ "rkind", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "palert", 0 ],
                    "source": [ "rkind", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "plog", 0 ],
                    "source": [ "rkind", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out2", 0 ],
                    "source": [ "pdesc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out2", 0 ],
                    "source": [ "palert", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out2", 0 ],
                    "source": [ "plog", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}