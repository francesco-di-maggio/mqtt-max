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
        "rect": [ 80.0, 80.0, 720.0, 560.0 ],
        "boxes": [
            {
                "box": {
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 400.0, 20.0 ],
                    "text": "PHONE → HOMIE VALUES",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "setup",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 600.0, 40.0 ],
                    "text": "Phone app: Send Homie, prefix remote, Motion on, then Connect.\nValues arrive typed, by device, node and property. [route phone-xxxx] after zl.slice picks one phone."
                }
            },
            {
                "box": {
                    "id": "conn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 90.0, 261.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "connect mqtt://public.cloud.shiftr.io public public"
                }
            },
            {
                "box": {
                    "id": "disc",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 290.0, 90.0, 66.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "disconnect"
                }
            },
            {
                "box": {
                    "id": "client",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 125.0, 140.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "mqtt.client phone-homie"
                }
            },
            {
                "box": {
                    "id": "rstatus",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 180.0, 125.0, 75.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route status"
                }
            },
            {
                "box": {
                    "id": "pstatus",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 180.0, 155.0, 72.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "status",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 260.0, 155.0, 100.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": ""
                }
            },
            {
                "box": {
                    "id": "ctl",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [ 20.0, 200.0, 285.0, 22.0 ],
                    "outlettype": [ "", "", "" ],
                    "text": "mqtt.homie.controller phone-homie @domain remote"
                }
            },
            {
                "box": {
                    "id": "slice",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 235.0, 60.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "zl.slice 1"
                }
            },
            {
                "box": {
                    "id": "pdev",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 120.0, 265.0, 72.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "dev",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 200.0, 265.0, 100.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": ""
                }
            },
            {
                "box": {
                    "id": "cdev",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 305.0, 265.0, 50.0, 20.0 ],
                    "text": "device"
                }
            },
            {
                "box": {
                    "id": "rnode",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [ 20.0, 300.0, 190.0, 22.0 ],
                    "outlettype": [ "", "", "", "", "" ],
                    "text": "route motion pad slider network"
                }
            },
            {
                "box": {
                    "id": "rmot",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "patching_rect": [ 20.0, 335.0, 115.0, 22.0 ],
                    "outlettype": [ "", "", "", "" ],
                    "text": "route pitch roll yaw"
                }
            },
            {
                "box": {
                    "id": "m0",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 365.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "m1",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 80.0, 365.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "m2",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 140.0, 365.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "cmot",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 390.0, 170.0, 20.0 ],
                    "text": "pitch  roll  yaw  (°)"
                }
            },
            {
                "box": {
                    "id": "rpad",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "patching_rect": [ 210.0, 335.0, 90.0, 22.0 ],
                    "outlettype": [ "", "", "", "" ],
                    "text": "route x y touch"
                }
            },
            {
                "box": {
                    "id": "px",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 210.0, 365.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "py",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 270.0, 365.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "touch",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 330.0, 365.0, 22.0, 22.0 ],
                    "outlettype": [ "int" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "cpad",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 210.0, 390.0, 150.0, 20.0 ],
                    "text": "x  y  (0-1)   touch"
                }
            },
            {
                "box": {
                    "id": "rsl",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 400.0, 335.0, 70.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route 1"
                }
            },
            {
                "box": {
                    "id": "sv",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 400.0, 365.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "csl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 400.0, 390.0, 90.0, 20.0 ],
                    "text": "slider 1 (0-1)"
                }
            },
            {
                "box": {
                    "id": "rnet",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 500.0, 335.0, 60.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route rtt"
                }
            },
            {
                "box": {
                    "id": "rtt",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 500.0, 365.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "cnet",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 500.0, 390.0, 100.0, 20.0 ],
                    "text": "round trip (ms)"
                }
            },
            {
                "box": {
                    "id": "conline",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 430.0, 200.0, 20.0 ],
                    "text": "online and offline devices"
                }
            },
            {
                "box": {
                    "id": "view",
                    "maxclass": "dict.view",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 455.0, 300.0, 120.0 ]
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
                    "destination": [ "slice", 0 ],
                    "source": [ "ctl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pdev", 0 ],
                    "source": [ "slice", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dev", 0 ],
                    "source": [ "pdev", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rnode", 0 ],
                    "source": [ "slice", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m0", 0 ],
                    "source": [ "rmot", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m1", 0 ],
                    "source": [ "rmot", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m2", 0 ],
                    "source": [ "rmot", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "px", 0 ],
                    "source": [ "rpad", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "py", 0 ],
                    "source": [ "rpad", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "touch", 0 ],
                    "source": [ "rpad", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rmot", 0 ],
                    "source": [ "rnode", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rpad", 0 ],
                    "source": [ "rnode", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rsl", 0 ],
                    "source": [ "rnode", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rnet", 0 ],
                    "source": [ "rnode", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sv", 0 ],
                    "source": [ "rsl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rtt", 0 ],
                    "source": [ "rnet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "view", 0 ],
                    "source": [ "ctl", 1 ]
                }
            }
        ],
        "autosave": 0
    }
}