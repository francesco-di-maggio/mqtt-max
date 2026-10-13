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
        "rect": [ 134.0, 163.0, 601.0, 700.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 400.0, 20.0 ],
                    "text": "REMOTE → HOMIE VALUES"
                }
            },
            {
                "box": {
                    "id": "setup",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 537.0, 33.0 ],
                    "text": "Remote: Send Homie, prefix remote, Motion on, Connect.\nValues by device, node, property. [route <id>] after zl.slice picks one device."
                }
            },
            {
                "box": {
                    "id": "conn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 90.0, 261.0, 22.0 ],
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
                    "patching_rect": [ 290.0, 90.0, 66.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 125.0, 140.0, 22.0 ],
                    "text": "mqtt.client remote-homie"
                }
            },
            {
                "box": {
                    "id": "rstatus",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 180.0, 125.0, 75.0, 22.0 ],
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
                    "patching_rect": [ 180.0, 155.0, 72.0, 22.0 ],
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
                    "patching_rect": [ 260.0, 155.0, 100.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "ctl",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 20.0, 200.0, 289.0, 22.0 ],
                    "text": "mqtt.homie.controller remote-homie @domain remote"
                }
            },
            {
                "box": {
                    "id": "slice",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 235.0, 60.0, 22.0 ],
                    "text": "zl.slice 1"
                }
            },
            {
                "box": {
                    "id": "pdev",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 120.0, 265.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "dev",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 265.0, 100.0, 22.0 ]
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
                    "numinlets": 5,
                    "numoutlets": 7,
                    "outlettype": [ "", "", "", "", "", "", "" ],
                    "patching_rect": [ 20.0, 300.0, 260.0, 22.0 ],
                    "text": "route motion pad slider latency button mic"
                }
            },
            {
                "box": {
                    "id": "rmot",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 20.0, 335.0, 115.0, 22.0 ],
                    "text": "route pitch roll yaw"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "m0",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 365.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "m1",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 80.0, 365.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "m2",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 140.0, 365.0, 50.0, 22.0 ]
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
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 210.0, 335.0, 90.0, 22.0 ],
                    "text": "route x y touch"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "px",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 210.0, 365.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "py",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 270.0, 365.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "touch",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 330.0, 365.0, 22.0, 22.0 ]
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
                    "id": "rnet",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 400.0, 335.0, 60.0, 22.0 ],
                    "text": "route rtt"
                }
            },
            {
                "box": {
                    "id": "rtt",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 400.0, 365.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cnet",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 400.0, 390.0, 100.0, 20.0 ],
                    "text": "round trip (ms)"
                }
            },
            {
                "box": {
                    "id": "conline",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 520.0, 200.0, 20.0 ],
                    "text": "online and offline devices"
                }
            },
            {
                "box": {
                    "id": "view",
                    "maxclass": "dict.view",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 545.0, 300.0, 120.0 ]
                }
            },
            {
                "box": {
                    "id": "rsl",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "patching_rect": [ 20.0, 425.0, 90.0, 22.0 ],
                    "text": "route 1 2 3 4"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "sv1",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 455.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "sv2",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 75.0, 455.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "sv3",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 130.0, 455.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "sv4",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 185.0, 455.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "csl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 480.0, 120.0, 20.0 ],
                    "text": "slider 1-4 (0-1)"
                }
            },
            {
                "box": {
                    "id": "rbtn",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 9,
                    "outlettype": [ "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 250.0, 425.0, 130.0, 22.0 ],
                    "text": "route 1 2 3 4 5 6 7 8"
                }
            },
            {
                "box": {
                    "id": "bt1",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 250.0, 455.0, 22.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "bt2",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 280.0, 455.0, 22.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "bt3",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 310.0, 455.0, 22.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "bt4",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 340.0, 455.0, 22.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cbtn",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 250.0, 480.0, 80.0, 20.0 ],
                    "text": "button 1-8"
                }
            },
            {
                "box": {
                    "id": "rsnd",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 500.0, 425.0, 70.0, 22.0 ],
                    "text": "route level"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "snd",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 500.0, 455.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "csnd",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 500.0, 480.0, 90.0, 20.0 ],
                    "text": "mic level (dBFS)"
                }
            },
            {
                "box": {
                    "id": "bt5",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 370.0, 455.0, 22.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "bt6",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 400.0, 455.0, 22.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "bt7",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 430.0, 455.0, 22.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "bt8",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 460.0, 455.0, 22.0, 22.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "rstatus", 0 ],
                    "source": [ "client", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "client", 0 ],
                    "source": [ "conn", 0 ]
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
                    "destination": [ "view", 0 ],
                    "source": [ "ctl", 1 ]
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
                    "destination": [ "dev", 0 ],
                    "source": [ "pdev", 0 ]
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
                    "destination": [ "rtt", 0 ],
                    "source": [ "rnet", 0 ]
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
                    "destination": [ "rnet", 0 ],
                    "source": [ "rnode", 3 ]
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
                    "destination": [ "pstatus", 0 ],
                    "source": [ "rstatus", 0 ]
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
                    "destination": [ "rnode", 0 ],
                    "source": [ "slice", 1 ]
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
                    "destination": [ "sv1", 0 ],
                    "source": [ "rsl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sv2", 0 ],
                    "source": [ "rsl", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sv3", 0 ],
                    "source": [ "rsl", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sv4", 0 ],
                    "source": [ "rsl", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rbtn", 0 ],
                    "source": [ "rnode", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bt1", 0 ],
                    "source": [ "rbtn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bt2", 0 ],
                    "source": [ "rbtn", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bt3", 0 ],
                    "source": [ "rbtn", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bt4", 0 ],
                    "source": [ "rbtn", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rsnd", 0 ],
                    "source": [ "rnode", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snd", 0 ],
                    "source": [ "rsnd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bt5", 0 ],
                    "source": [ "rbtn", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bt6", 0 ],
                    "source": [ "rbtn", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bt7", 0 ],
                    "source": [ "rbtn", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bt8", 0 ],
                    "source": [ "rbtn", 7 ]
                }
            }
        ],
        "autosave": 0
    }
}