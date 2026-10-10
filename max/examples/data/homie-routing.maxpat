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
        "rect": [ 140.0, 140.0, 700.0, 860.0 ],
        "boxes": [
            {
                "box": {
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 320.0, 20.0 ],
                    "text": "HOMIE DATA  (phone app in Mode: Data, no MIDI port)",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "info",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 520.0, 33 ],
                    "text": "Homie devices publish each value to {prefix}/5/{device}/{node}/{property}, the value as text.\nIn subscribe, + matches one level and # all the rest."
                }
            },
            {
                "box": {
                    "id": "conn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 85.0, 261.0, 22.0 ],
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
                    "patching_rect": [ 300.0, 85.0, 66.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "disconnect"
                }
            },
            {
                "box": {
                    "id": "suball",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 125.0, 120.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "subscribe remote/5/#"
                }
            },
            {
                "box": {
                    "id": "submot",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 155.0, 125.0, 170.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "subscribe remote/5/+/motion/#"
                }
            },
            {
                "box": {
                    "id": "unsub",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 340.0, 125.0, 135.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "unsubscribe remote/5/#"
                }
            },
            {
                "box": {
                    "id": "csub",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 150.0, 320.0, 20.0 ],
                    "text": "all devices, everything  /  all devices, motion only"
                }
            },
            {
                "box": {
                    "id": "node",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 185.0, 262.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "node.script mqtt-max.js @autostart 1 @watch 1",
                    "saved_object_attributes": {
                        "autostart": 1,
                        "defer": 0,
                        "watch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "pns",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 300.0, 185.0, 95.0, 22.0 ],
                    "text": "print node-script"
                }
            },
            {
                "box": {
                    "id": "route",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "patching_rect": [ 20.0, 220.0, 152.0, 22.0 ],
                    "outlettype": [ "", "", "", "" ],
                    "text": "route message status error"
                }
            },
            {
                "box": {
                    "id": "pst",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 255.0, 95.0, 22.0 ],
                    "text": "print mqtt-status"
                }
            },
            {
                "box": {
                    "id": "perr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 310.0, 255.0, 88.0, 22.0 ],
                    "text": "print mqtt-error"
                }
            },
            {
                "box": {
                    "id": "cfull",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 295.0, 460.0, 20.0 ],
                    "text": "ROUTE BY FULL ADDRESS  (replace phone-a1b2 with the name in the phone app)",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "rfull",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "patching_rect": [ 20.0, 320.0, 370.0, 22.0 ],
                    "outlettype": [ "", "", "" ],
                    "text": "route remote/5/phone-a1b2/motion/pitch remote/5/phone-a1b2/pad/x"
                }
            },
            {
                "box": {
                    "id": "fp",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 350.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "cfp",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 75.0, 350.0, 40.0, 20.0 ],
                    "text": "pitch"
                }
            },
            {
                "box": {
                    "id": "fx",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 200.0, 350.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "cfx",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 255.0, 350.0, 30.0, 20.0 ],
                    "text": "x"
                }
            },
            {
                "box": {
                    "id": "clevel",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 395.0, 240.0, 20.0 ],
                    "text": "ROUTE LEVEL BY LEVEL  (any device)",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "slice",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 420.0, 61.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "zl.slice 1"
                }
            },
            {
                "box": {
                    "id": "split",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 450.0, 140.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "fromsymbol @separator /"
                }
            },
            {
                "box": {
                    "id": "join",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 480.0, 45.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "zl.join"
                }
            },
            {
                "box": {
                    "id": "cjoin",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 175.0, 480.0, 270.0, 20.0 ],
                    "text": "remote 5 <device> <node> <property> <value>"
                }
            },
            {
                "box": {
                    "id": "rprefix",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 510.0, 77.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route remote"
                }
            },
            {
                "box": {
                    "id": "rver",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 540.0, 50.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route 5"
                }
            },
            {
                "box": {
                    "id": "sdev",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 570.0, 61.0, 22.0 ],
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
                    "patching_rect": [ 420.0, 600.0, 72.0, 22.0 ],
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
                    "patching_rect": [ 420.0, 630.0, 120.0, 22.0 ],
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
                    "patching_rect": [ 545.0, 630.0, 80.0, 20.0 ],
                    "text": "last device"
                }
            },
            {
                "box": {
                    "id": "rnode",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 5,
                    "patching_rect": [ 20.0, 610.0, 180.0, 22.0 ],
                    "outlettype": [ "", "", "", "", "" ],
                    "text": "route motion pad slider network"
                }
            },
            {
                "box": {
                    "id": "rmot",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "patching_rect": [ 20.0, 650.0, 115.0, 22.0 ],
                    "outlettype": [ "", "", "", "" ],
                    "text": "route pitch roll yaw"
                }
            },
            {
                "box": {
                    "id": "mp",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 680.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "mr",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 75.0, 680.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "my",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 130.0, 680.0, 50.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 705.0, 140.0, 20.0 ],
                    "text": "pitch  roll  yaw  (°)"
                }
            },
            {
                "box": {
                    "id": "rpad",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "patching_rect": [ 200.0, 650.0, 90.0, 22.0 ],
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
                    "patching_rect": [ 200.0, 680.0, 50.0, 22.0 ],
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
                    "patching_rect": [ 255.0, 680.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "stouch",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "patching_rect": [ 310.0, 680.0, 85.0, 22.0 ],
                    "outlettype": [ "bang", "bang", "" ],
                    "text": "sel true false"
                }
            },
            {
                "box": {
                    "id": "t1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 310.0, 710.0, 29.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "t0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 345.0, 710.0, 29.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "tog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 310.0, 740.0, 24.0, 24.0 ],
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
                    "patching_rect": [ 200.0, 705.0, 110.0, 20.0 ],
                    "text": "x  y  (0-1)   touch"
                }
            },
            {
                "box": {
                    "id": "rsl",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 770.0, 70.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route value"
                }
            },
            {
                "box": {
                    "id": "sv",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 800.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "csv",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 75.0, 800.0, 80.0, 20.0 ],
                    "text": "slider (0-1)"
                }
            },
            {
                "box": {
                    "id": "rnet",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 200.0, 770.0, 58.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route rtt"
                }
            },
            {
                "box": {
                    "id": "nr",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 200.0, 800.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "cnr",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 255.0, 800.0, 100.0, 20.0 ],
                    "text": "round trip (ms)"
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
                    "source": [ "disc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "suball", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "submot", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "unsub", 0 ]
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
                    "destination": [ "pns", 0 ],
                    "source": [ "node", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pst", 0 ],
                    "source": [ "route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "perr", 0 ],
                    "source": [ "route", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rfull", 0 ],
                    "source": [ "route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "fp", 0 ],
                    "source": [ "rfull", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "fx", 0 ],
                    "source": [ "rfull", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "slice", 0 ],
                    "source": [ "route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "split", 0 ],
                    "source": [ "slice", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "join", 1 ],
                    "source": [ "slice", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "join", 0 ],
                    "source": [ "split", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rprefix", 0 ],
                    "source": [ "join", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rver", 0 ],
                    "source": [ "rprefix", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sdev", 0 ],
                    "source": [ "rver", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pdev", 0 ],
                    "source": [ "sdev", 0 ]
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
                    "source": [ "sdev", 1 ]
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
                    "destination": [ "mp", 0 ],
                    "source": [ "rmot", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mr", 0 ],
                    "source": [ "rmot", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "my", 0 ],
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
                    "destination": [ "stouch", 0 ],
                    "source": [ "rpad", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "t1", 0 ],
                    "source": [ "stouch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "t0", 0 ],
                    "source": [ "stouch", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tog", 0 ],
                    "source": [ "t1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tog", 0 ],
                    "source": [ "t0", 0 ]
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
                    "destination": [ "nr", 0 ],
                    "source": [ "rnet", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}