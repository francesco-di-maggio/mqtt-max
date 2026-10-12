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
        "rect": [ 100.0, 100.0, 620.0, 420.0 ],
        "boxes": [
            {
                "box": {
                    "id": "in",
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 20.0, 30.0, 30.0 ],
                    "outlettype": [ "" ],
                    "comment": "start, stop, clients, attributes",
                    "index": 0
                }
            },
            {
                "box": {
                    "id": "cconn",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 300.0, 20.0, 80.0, 20.0 ],
                    "text": "settings"
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
                    "id": "args",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 300.0, 140.0, 75.0, 22.0 ],
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
                    "patching_rect": [ 380.0, 170.0, 70.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route done"
                }
            },
            {
                "box": {
                    "id": "cgate",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 300.0, 200.0, 250.0, 20.0 ],
                    "text": "attributes wait until the script is ready"
                }
            },
            {
                "box": {
                    "id": "gate",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 300.0, 225.0, 50.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "gate 1 0"
                }
            },
            {
                "box": {
                    "id": "node",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 270.0, 295.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "node.script mqtt.broker.js @autostart 1 @watch 0",
                    "saved_object_attributes": {
                        "autostart": 1,
                        "defer": 0,
                        "watch": 0
                    }
                }
            },
            {
                "box": {
                    "id": "route",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "patching_rect": [ 20.0, 305.0, 160.0, 22.0 ],
                    "outlettype": [ "", "", "", "" ],
                    "text": "route client dumpout ready"
                }
            },
            {
                "box": {
                    "id": "script",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 330.0, 305.0, 85.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend script"
                }
            },
            {
                "box": {
                    "id": "tready",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [ 180.0, 335.0, 55.0, 22.0 ],
                    "outlettype": [ "bang", "bang", "bang" ],
                    "text": "t b b b"
                }
            },
            {
                "box": {
                    "id": "open",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 300.0, 335.0, 29.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "start",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 180.0, 365.0, 40.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "start"
                }
            },
            {
                "box": {
                    "id": "out0",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 390.0, 30.0, 30.0 ],
                    "comment": "clients: connected, disconnected, subscribe, unsubscribe",
                    "index": 0
                }
            },
            {
                "box": {
                    "id": "out1",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 330.0, 390.0, 30.0, 30.0 ],
                    "comment": "dumpout: status, address, clients, error, script",
                    "index": 1
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "node", 0 ],
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
                    "destination": [ "args", 0 ],
                    "source": [ "defer", 0 ]
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
                    "destination": [ "gate", 1 ],
                    "source": [ "done", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "gate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "route", 0 ],
                    "source": [ "node", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "script", 0 ],
                    "source": [ "node", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out1", 0 ],
                    "source": [ "script", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out0", 0 ],
                    "source": [ "route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out1", 0 ],
                    "source": [ "route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tready", 0 ],
                    "source": [ "route", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "open", 0 ],
                    "source": [ "tready", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gate", 0 ],
                    "source": [ "open", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "args", 0 ],
                    "source": [ "tready", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "start", 0 ],
                    "source": [ "tready", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "start", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}