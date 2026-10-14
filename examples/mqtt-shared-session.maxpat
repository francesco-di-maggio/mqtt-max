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
        "rect": [ 134.0, 163.0, 1080.0, 850.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 109, 20.0 ],
                    "text": "SHARED SESSION"
                }
            },
            {
                "box": {
                    "id": "setup",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 1020, 34 ],
                    "text": "Patches in different places share one session: tempo and scene as retained state, a parameter as a stream, and who is online.\nOpen this patch on each computer and Connect. A patch that joins later gets the current tempo and scene at once.",
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "conn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 78.0, 361, 22.0 ],
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
                    "patching_rect": [ 391.0, 78.0, 82, 22.0 ],
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
                    "patching_rect": [ 20.0, 113.0, 191, 22.0 ],
                    "text": "mqtt.client shared-session"
                }
            },
            {
                "box": {
                    "id": "rstatus",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 231.0, 113.0, 96, 22.0 ],
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
                    "patching_rect": [ 231.0, 143.0, 89, 22.0 ],
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
                    "patching_rect": [ 330.0, 143.0, 100, 22.0 ],
                    "text": ""
                }
            },
            {
                "box": {
                    "id": "ca",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 188.0, 130, 20 ],
                    "text": "A  ·  WHO IS HERE",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "load",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 213.0, 68, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "rand",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 243.0, 96, 22.0 ],
                    "text": "random 10000"
                }
            },
            {
                "box": {
                    "id": "pid",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 273.0, 157, 22.0 ],
                    "text": "sprintf id member-%ld"
                }
            },
            {
                "box": {
                    "id": "rename",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 273.0, 109, 22.0 ],
                    "text": "id <your-name>"
                }
            },
            {
                "box": {
                    "id": "crename",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 320.0, 273.0, 198, 20 ],
                    "text": "edit and click: a-z, 0-9, -"
                }
            },
            {
                "box": {
                    "id": "member",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 308.0, 449, 22.0 ],
                    "text": "mqtt.homie.device shared-session @domain mqtt-max-shared-session"
                }
            },
            {
                "box": {
                    "id": "perr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 308.0, 150, 22.0 ],
                    "text": "print session-member"
                }
            },
            {
                "box": {
                    "id": "ctl",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 20.0, 343.0, 476, 22.0 ],
                    "text": "mqtt.homie.controller shared-session @domain mqtt-max-shared-session"
                }
            },
            {
                "box": {
                    "id": "view",
                    "maxclass": "dict.view",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 378.0, 300.0, 100.0 ]
                }
            },
            {
                "box": {
                    "id": "cview",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 330.0, 378.0, 517, 34 ],
                    "text": "online and offline members. The broker keeps each member's last state,\nso members that left stay listed as offline. A fixed name avoids new ones.",
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "cb",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 503.0, 170, 20 ],
                    "text": "B  ·  TEMPO  (retained)",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "tempo_in",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 533.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "ctin",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 75.0, 533.0, 36.0, 20 ],
                    "text": "set"
                }
            },
            {
                "box": {
                    "id": "tempo_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 563.0, 504, 22.0 ],
                    "text": "mqtt.send shared-session mqtt-max-example/shared-session/tempo @retain 1"
                }
            },
            {
                "box": {
                    "id": "tempo_recv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 598.0, 456, 22.0 ],
                    "text": "mqtt.receive shared-session mqtt-max-example/shared-session/tempo"
                }
            },
            {
                "box": {
                    "id": "tempo",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 628.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "ctempo",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 75.0, 628.0, 102, 20 ],
                    "text": "session tempo"
                }
            },
            {
                "box": {
                    "id": "ms",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 658.0, 75, 22.0 ],
                    "text": "!/ 60000."
                }
            },
            {
                "box": {
                    "id": "play",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 160.0, 658.0, 22.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cplay",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 185.0, 658.0, 41, 20 ],
                    "text": "play"
                }
            },
            {
                "box": {
                    "id": "metro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 160.0, 688.0, 75, 22.0 ],
                    "text": "metro 500"
                }
            },
            {
                "box": {
                    "id": "beat",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 160.0, 718.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "cphase",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 753.0, 480, 20 ],
                    "text": "The tempo is shared, not the beat: each computer's [metro] runs on its own clock."
                }
            },
            {
                "box": {
                    "id": "cc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 540.0, 503.0, 170, 20 ],
                    "text": "C  ·  SCENE  (retained)",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "scene_in",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 540.0, 533.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "csin",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 595.0, 533.0, 36.0, 20 ],
                    "text": "set"
                }
            },
            {
                "box": {
                    "id": "scene_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 540.0, 563.0, 504, 22.0 ],
                    "text": "mqtt.send shared-session mqtt-max-example/shared-session/scene @retain 1"
                }
            },
            {
                "box": {
                    "id": "scene_recv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 540.0, 598.0, 456, 22.0 ],
                    "text": "mqtt.receive shared-session mqtt-max-example/shared-session/scene"
                }
            },
            {
                "box": {
                    "id": "scene",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 540.0, 628.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cscene",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 595.0, 628.0, 102, 20 ],
                    "text": "session scene"
                }
            },
            {
                "box": {
                    "id": "cd",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 540.0, 673.0, 259, 20 ],
                    "text": "D  ·  CUTOFF  (stream, not retained)",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "cut_in",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 540.0, 703.0, 50.0, 22.0 ],
                    "format": 6
                }
            },
            {
                "box": {
                    "id": "cut_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 540.0, 733.0, 442, 22.0 ],
                    "text": "mqtt.send shared-session mqtt-max-example/shared-session/cutoff"
                }
            },
            {
                "box": {
                    "id": "cut_recv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 540.0, 768.0, 463, 22.0 ],
                    "text": "mqtt.receive shared-session mqtt-max-example/shared-session/cutoff"
                }
            },
            {
                "box": {
                    "id": "cut",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 540.0, 798.0, 50.0, 22.0 ],
                    "format": 6
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "client", 0 ],
                    "source": [ "conn", 0 ]
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
                    "destination": [ "rstatus", 0 ],
                    "source": [ "client", 1 ]
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
                    "destination": [ "status", 0 ],
                    "source": [ "pstatus", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rand", 0 ],
                    "source": [ "load", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pid", 0 ],
                    "source": [ "rand", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "member", 0 ],
                    "source": [ "pid", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "member", 0 ],
                    "source": [ "rename", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "perr", 0 ],
                    "source": [ "member", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "view", 0 ],
                    "source": [ "ctl", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tempo_send", 0 ],
                    "source": [ "tempo_in", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tempo", 0 ],
                    "source": [ "tempo_recv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ms", 0 ],
                    "source": [ "tempo", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "metro", 1 ],
                    "source": [ "ms", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "metro", 0 ],
                    "source": [ "play", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "beat", 0 ],
                    "source": [ "metro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "scene_send", 0 ],
                    "source": [ "scene_in", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "scene", 0 ],
                    "source": [ "scene_recv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "cut_send", 0 ],
                    "source": [ "cut_in", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "cut", 0 ],
                    "source": [ "cut_recv", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}