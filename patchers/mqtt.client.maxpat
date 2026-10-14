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
        "rect": [ 100.0, 100.0, 660.0, 560.0 ],
        "boxes": [
            {
                "box": {
                    "comment": "messages: connect, publish, subscribe, attributes",
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
                    "id": "load",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 300.0, 20.0, 58.0, 22.0 ],
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
                    "patching_rect": [ 300.0, 50.0, 32.0, 22.0 ],
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
                    "patching_rect": [ 300.0, 80.0, 54.0, 22.0 ],
                    "text": "deferlow"
                }
            },
            {
                "box": {
                    "id": "args",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 300.0, 115.0, 121.0, 22.0 ],
                    "text": "patcherargs #0-client"
                }
            },
            {
                "box": {
                    "id": "tname",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 300.0, 150.0, 29.5, 22.0 ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "namein",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 185.0, 174.0, 22.0 ],
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
                    "patching_rect": [ 330.0, 215.0, 181.0, 22.0 ],
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
                    "patching_rect": [ 300.0, 250.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "setout",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 410.0, 250.0, 82.0, 22.0 ],
                    "text": "prepend send"
                }
            },
            {
                "box": {
                    "id": "done",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 450.0, 150.0, 66.0, 22.0 ],
                    "text": "route done"
                }
            },
            {
                "box": {
                    "id": "recv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 285.0, 47.0, 22.0 ],
                    "text": "receive"
                }
            },
            {
                "box": {
                    "id": "cgate",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 330.0, 315.0, 504.0, 20.0 ],
                    "text": "messages from the inlet, attributes and other objects wait in the queue until the script is ready"
                }
            },
            {
                "box": {
                    "id": "node",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 375.0, 266.0, 22.0 ],
                    "saved_object_attributes": {
                        "autostart": 1,
                        "defer": 0,
                        "node_bin_path": "",
                        "npm_bin_path": "",
                        "watch": 0
                    },
                    "text": "node.script mqtt.client.js @autostart 1 @watch 0",
                    "textfile": {
                        "filename": "mqtt.client.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "route",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 20.0, 410.0, 171.0, 22.0 ],
                    "text": "route message dumpout ready"
                }
            },
            {
                "box": {
                    "id": "script",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 330.0, 410.0, 85.0, 22.0 ],
                    "text": "prepend script"
                }
            },
            {
                "box": {
                    "id": "tready",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 120.0, 440.0, 32.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "ready",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 120.0, 470.0, 39.0, 22.0 ],
                    "text": "ready"
                }
            },
            {
                "box": {
                    "id": "fwd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 230.0, 505.0, 49.0, 22.0 ],
                    "text": "forward"
                }
            },
            {
                "box": {
                    "comment": "incoming messages: <topic> <payload...>",
                    "id": "out0",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 520.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "dumpout: status, error, ready, script",
                    "id": "out1",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 330.0, 520.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "queue",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 340.0, 93.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "mqtt.queue.js",
                        "parameter_enable": 0
                    },
                    "text": "js mqtt.queue.js"
                }
            },
            {
                "box": {
                    "id": "rscr",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 280.0, 68.0, 22.0 ],
                    "text": "route script"
                }
            },
            {
                "box": {
                    "id": "pscr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 160.0, 310.0, 85.0, 22.0 ],
                    "text": "prepend script"
                }
            },
            {
                "box": {
                    "id": "cscr",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 160.0, 280.0, 259.0, 20.0 ],
                    "text": "script npm install etc. reach node.script at once"
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
                    "destination": [ "tname", 0 ],
                    "source": [ "args", 0 ]
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
                    "destination": [ "queue", 0 ],
                    "source": [ "done", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rscr", 0 ],
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
                    "destination": [ "node", 0 ],
                    "source": [ "pscr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "queue", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "fwd", 0 ],
                    "order": 1,
                    "source": [ "ready", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out1", 0 ],
                    "order": 0,
                    "source": [ "ready", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "queue", 1 ],
                    "order": 2,
                    "source": [ "ready", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "queue", 0 ],
                    "source": [ "recv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "fwd", 0 ],
                    "source": [ "route", 3 ]
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
                    "destination": [ "pscr", 0 ],
                    "source": [ "rscr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "queue", 0 ],
                    "source": [ "rscr", 1 ]
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
                    "destination": [ "recv", 0 ],
                    "source": [ "setin", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "fwd", 0 ],
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
                    "source": [ "tready", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ready", 0 ],
                    "source": [ "tready", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}