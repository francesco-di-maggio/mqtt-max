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
        "rect": [ 100.0, 100.0, 560.0, 370.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 341.0, 20.0 ],
                    "text": "MQTT <-> MIDI BRIDGE  (Max-only replacement for Midge)"
                }
            },
            {
                "box": {
                    "id": "info",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 356.0, 60.0 ],
                    "text": "Keep this patch open: it creates the MIDI port mqtt-max.\nremote/in/...  ->  mqtt-max  ->  ctlin / notein mqtt-max in any patch\nctlout / noteout mqtt-max  ->  remote/out/...\nQuit Midge while this runs, or every message arrives twice."
                }
            },
            {
                "box": {
                    "id": "conn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 115.0, 261.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 145.0, 165.0, 22.0 ],
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
                    "patching_rect": [ 205.0, 145.0, 66.0, 22.0 ],
                    "text": "disconnect"
                }
            },
            {
                "box": {
                    "id": "cconn",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 320.0, 115.0, 165.0, 20.0 ],
                    "text": "click one; local needs ragazzi"
                }
            },
            {
                "box": {
                    "id": "node",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 190.0, 473.0, 22.0 ],
                    "saved_object_attributes": {
                        "args": [ "--prefix", "remote", "--port", "mqtt-max" ],
                        "autostart": 1,
                        "defer": 0,
                        "node_bin_path": "",
                        "npm_bin_path": "",
                        "watch": 1
                    },
                    "text": "node.script mqtt-client.js @autostart 1 @watch 1 @args --prefix remote --port mqtt-max",
                    "textfile": {
                        "filename": "mqtt-client.js",
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
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 20.0, 225.0, 100.0, 22.0 ],
                    "text": "route status error"
                }
            },
            {
                "box": {
                    "id": "pns",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 250.0, 225.0, 95.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 260.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "state",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 100.0, 260.0, 39.0, 22.0 ],
                    "text": "ready"
                }
            },
            {
                "box": {
                    "id": "perr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 140.0, 225.0, 88.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 300.0, 98.0, 22.0 ],
                    "text": "script npm install"
                }
            },
            {
                "box": {
                    "id": "cnpm",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 150.0, 300.0, 139.0, 20.0 ],
                    "text": "once, on a new machine"
                }
            },
            {
                "box": {
                    "id": "cargs",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 168.0, 416.0, 20.0 ],
                    "text": "--prefix: topic prefix (default remote)   --port: MIDI port name (none = no port)"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "conn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "connl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "disc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pns", 0 ],
                    "source": [ "node", 1 ]
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
                    "destination": [ "node", 0 ],
                    "source": [ "npm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "state", 0 ],
                    "source": [ "pset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "perr", 0 ],
                    "source": [ "route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pset", 0 ],
                    "source": [ "route", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}