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
        "rect": [ 106.0, 170.0, 794.0, 550.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 21.0, 143.0, 20.0 ],
                    "text": "MQTT <-> MIDI BRIDGE"
                }
            },
            {
                "box": {
                    "id": "info",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 46.0, 356.0, 60.0 ],
                    "text": "Keep this patch open: it creates the MIDI port mqtt-max.\nremote/in/...  ->  mqtt-max  ->  ctlin / notein mqtt-max in any patch\nctlout / noteout mqtt-max  ->  remote/out/...\nRun one bridge per prefix, or every message arrives twice."
                }
            },
            {
                "box": {
                    "id": "conn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 130.0, 261.0, 22.0 ],
                    "text": "connect mqtt://public.cloud.shiftr.io public public"
                }
            },
            {
                "box": {
                    "id": "connl",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 308.0, 130.0, 165.0, 22.0 ],
                    "text": "connect mqtt://localhost:1883"
                }
            },
            {
                "box": {
                    "id": "disc",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 215.0, 163.0, 66.0, 22.0 ],
                    "text": "disconnect"
                }
            },
            {
                "box": {
                    "id": "cconn",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 477.0, 131.0, 227.0, 20.0 ],
                    "text": "localhost needs a broker on this machine"
                }
            },
            {
                "box": {
                    "id": "node",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 236.0, 535.0, 22.0 ],
                    "saved_object_attributes": {
                        "args": [ "--prefix", "remote", "--port", "mqtt-max", "--name", "max" ],
                        "autostart": 1,
                        "defer": 0,
                        "node_bin_path": "",
                        "npm_bin_path": "",
                        "watch": 1
                    },
                    "text": "node.script mqtt-max.js @autostart 1 @watch 1 @args --prefix remote --port mqtt-max --name max",
                    "textfile": {
                        "filename": "mqtt-max.js",
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
                    "patching_rect": [ 20.0, 278.0, 137.0, 22.0 ],
                    "text": "route status error clients"
                }
            },
            {
                "box": {
                    "id": "pns",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 536.0, 278.0, 95.0, 22.0 ],
                    "text": "print node-script"
                }
            },
            {
                "box": {
                    "id": "pset",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 339.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "dontreplace": 1,
                    "id": "state",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 389.0, 205.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "perr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 126.33333333333334, 339.0, 88.0, 22.0 ],
                    "text": "print mqtt-error"
                }
            },
            {
                "box": {
                    "id": "npm",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 375.0, 163.0, 98.0, 22.0 ],
                    "text": "script npm install"
                }
            },
            {
                "box": {
                    "id": "cnpm",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 477.0, 164.0, 139.0, 20.0 ],
                    "text": "once, on a new machine"
                }
            },
            {
                "box": {
                    "id": "cargs",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 68.0, 212.0, 605.0, 20.0 ],
                    "text": "--prefix: topic prefix (default remote)   --port: MIDI port (none = no port)   --name: presence on remote/status/max"
                }
            },
            {
                "box": {
                    "id": "pview",
                    "maxclass": "dict.view",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 248.66666666666669, 339.0, 285.0, 186.0 ]
                }
            },
            {
                "box": {
                    "id": "punpack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 568.0, 339.0, 144.0, 22.0 ],
                    "saved_object_attributes": {
                        "legacy": 1
                    },
                    "text": "dict.unpack online: count:"
                }
            },
            {
                "box": {
                    "id": "ponset",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 568.0, 389.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "dontreplace": 1,
                    "id": "ponmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 568.0, 503.0, 200.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "pcount",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 673.0, 389.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cclients",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 727.0, 390.0, 41.0, 20.0 ],
                    "text": "online"
                }
            },
            {
                "box": {
                    "id": "pzero",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 673.0, 419.0, 34.0, 22.0 ],
                    "text": "sel 0"
                }
            },
            {
                "box": {
                    "id": "pclear",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 673.0, 449.0, 29.5, 22.0 ],
                    "text": "set"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "midpoints": [ 29.5, 153.0, 29.5, 153.0 ],
                    "source": [ "conn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "midpoints": [ 317.5, 198.0, 29.5, 198.0 ],
                    "source": [ "connl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "midpoints": [ 224.5, 198.0, 29.5, 198.0 ],
                    "source": [ "disc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pns", 0 ],
                    "midpoints": [ 545.5, 261.0, 545.5, 261.0 ],
                    "source": [ "node", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "route", 0 ],
                    "midpoints": [ 29.5, 261.0, 29.5, 261.0 ],
                    "source": [ "node", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "midpoints": [ 384.5, 198.0, 29.5, 198.0 ],
                    "source": [ "npm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ponmsg", 0 ],
                    "midpoints": [ 682.5, 489.0, 577.5, 489.0 ],
                    "source": [ "pclear", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pzero", 0 ],
                    "midpoints": [ 682.5, 414.0, 682.5, 414.0 ],
                    "source": [ "pcount", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ponmsg", 0 ],
                    "midpoints": [ 577.5, 414.0, 577.5, 414.0 ],
                    "source": [ "ponset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "state", 0 ],
                    "midpoints": [ 29.5, 363.0, 29.5, 363.0 ],
                    "source": [ "pset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pcount", 0 ],
                    "midpoints": [ 640.0, 375.0, 682.5, 375.0 ],
                    "source": [ "punpack", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ponset", 0 ],
                    "midpoints": [ 577.5, 363.0, 577.5, 363.0 ],
                    "source": [ "punpack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pclear", 0 ],
                    "midpoints": [ 682.5, 444.0, 682.5, 444.0 ],
                    "source": [ "pzero", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "perr", 0 ],
                    "midpoints": [ 68.83333333333334, 324.0, 135.83333333333334, 324.0 ],
                    "source": [ "route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pset", 0 ],
                    "midpoints": [ 29.5, 303.0, 29.5, 303.0 ],
                    "source": [ "route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "punpack", 0 ],
                    "midpoints": [ 108.16666666666667, 324.0, 577.5, 324.0 ],
                    "order": 0,
                    "source": [ "route", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pview", 0 ],
                    "midpoints": [ 108.16666666666667, 324.0, 258.1666666666667, 324.0 ],
                    "order": 1,
                    "source": [ "route", 2 ]
                }
            }
        ],
        "autosave": 0
    }
}