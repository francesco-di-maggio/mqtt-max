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
        "rect": [ 134.0, 91.0, 877.0, 807.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 248.0, 20.0 ],
                    "text": "PHONE -> SMOOTHING -> ABLETON LIVE"
                }
            },
            {
                "box": {
                    "id": "setup",
                    "linecount": 8,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 552.0, 114.0 ],
                    "text": "SETUP\n1. Bridge: open mqtt-bridge.maxpat and click connect.\n2. Phone: francesco-di-maggio.github.io/mqtt-max/phone/ -> prefix remote -> Connect (Echo notes off)\n3. Section 3: pick the output port, e.g. \"from Max 1\" or an IAC bus. Never pick \"mqtt-max\":\n   that sends everything back over MQTT.\n4. Live: Settings -> Link, Tempo & MIDI -> MIDI Ports: that port as Input, Track + Remote on.\n   CCs: MIDI Map mode (Cmd+M), click a control, move the phone.\n   Pad: MIDI track, input = that port, Monitor In."
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "c1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 216.0, 215.0, 20.0 ],
                    "text": "1 · PHONE IN  (MIDI from the bridge)"
                }
            },
            {
                "box": {
                    "id": "ctl",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 20.0, 241.0, 83.0, 22.0 ],
                    "text": "ctlin mqtt-max"
                }
            },
            {
                "box": {
                    "id": "pk",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 271.0, 54.0, 22.0 ],
                    "text": "pack 0 0"
                }
            },
            {
                "box": {
                    "id": "rev",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 301.0, 37.0, 22.0 ],
                    "text": "zl.rev"
                }
            },
            {
                "box": {
                    "id": "rcc",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "patching_rect": [ 20.0, 331.0, 76.0, 22.0 ],
                    "text": "route 1 2 3 4"
                }
            },
            {
                "box": {
                    "id": "cpk",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 105.0, 271.0, 263.0, 20.0 ],
                    "text": "value + CC number -> \"CC value\" -> split by CC"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "c2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 376.0, 237.0, 20.0 ],
                    "text": "2 · SMOOTHING  ->  CC OUT (channel 1)"
                }
            },
            {
                "box": {
                    "id": "ms",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 391.0, 272.3333333333333, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "sms",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 391.0, 301.0, 77.0, 22.0 ],
                    "text": "s smooth-ms"
                }
            },
            {
                "box": {
                    "id": "cms",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 165.0, 398.0, 312.0, 33.0 ],
                    "text": "ramp ms: each new value glides over this time.\n0 = raw. 30-100 = smooth. Larger = smoother but laggier."
                }
            },
            {
                "box": {
                    "id": "lbms",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 391.0, 215.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "ms50",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 391.0, 243.66666666666666, 29.5, 22.0 ],
                    "text": "50"
                }
            },
            {
                "box": {
                    "id": "cn0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 451.0, 110.0, 20.0 ],
                    "text": "CC1 pitch -> CC20"
                }
            },
            {
                "box": {
                    "id": "raw0",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 476.0, 45.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "craw0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 68.0, 477.0, 28.0, 20.0 ],
                    "text": "raw"
                }
            },
            {
                "box": {
                    "id": "rms0",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 506.0, 75.0, 22.0 ],
                    "text": "r smooth-ms"
                }
            },
            {
                "box": {
                    "id": "pk0",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 536.0, 61.0, 22.0 ],
                    "text": "pack 0 50"
                }
            },
            {
                "box": {
                    "id": "line0",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 20.0, 566.0, 54.0, 22.0 ],
                    "text": "line 0 10"
                }
            },
            {
                "box": {
                    "id": "s0",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 596.0, 22.0, 128.0 ]
                }
            },
            {
                "box": {
                    "id": "out0",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 50.0, 701.0, 45.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cout0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 98.0, 702.0, 25.0, 20.0 ],
                    "text": "out"
                }
            },
            {
                "box": {
                    "id": "rport0",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 731.0, 59.0, 22.0 ],
                    "text": "r live-port"
                }
            },
            {
                "box": {
                    "id": "cto0",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 761.0, 64.0, 22.0 ],
                    "text": "ctlout 20 1"
                }
            },
            {
                "box": {
                    "id": "cn1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 150.0, 451.0, 100.0, 20.0 ],
                    "text": "CC2 roll -> CC21"
                }
            },
            {
                "box": {
                    "id": "raw1",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 150.0, 476.0, 45.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "craw1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 198.0, 477.0, 28.0, 20.0 ],
                    "text": "raw"
                }
            },
            {
                "box": {
                    "id": "rms1",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 506.0, 75.0, 22.0 ],
                    "text": "r smooth-ms"
                }
            },
            {
                "box": {
                    "id": "pk1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 150.0, 536.0, 61.0, 22.0 ],
                    "text": "pack 0 50"
                }
            },
            {
                "box": {
                    "id": "line1",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 150.0, 566.0, 54.0, 22.0 ],
                    "text": "line 0 10"
                }
            },
            {
                "box": {
                    "id": "s1",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 150.0, 596.0, 22.0, 128.0 ]
                }
            },
            {
                "box": {
                    "id": "out1",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 180.0, 701.0, 45.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cout1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 228.0, 702.0, 25.0, 20.0 ],
                    "text": "out"
                }
            },
            {
                "box": {
                    "id": "rport1",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 731.0, 59.0, 22.0 ],
                    "text": "r live-port"
                }
            },
            {
                "box": {
                    "id": "cto1",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 150.0, 761.0, 64.0, 22.0 ],
                    "text": "ctlout 21 1"
                }
            },
            {
                "box": {
                    "id": "cn2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 280.0, 451.0, 106.0, 20.0 ],
                    "text": "CC3 yaw -> CC22"
                }
            },
            {
                "box": {
                    "id": "raw2",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 280.0, 476.0, 45.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "craw2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 328.0, 477.0, 28.0, 20.0 ],
                    "text": "raw"
                }
            },
            {
                "box": {
                    "id": "rms2",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 320.0, 506.0, 75.0, 22.0 ],
                    "text": "r smooth-ms"
                }
            },
            {
                "box": {
                    "id": "pk2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 280.0, 536.0, 61.0, 22.0 ],
                    "text": "pack 0 50"
                }
            },
            {
                "box": {
                    "id": "line2",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 280.0, 566.0, 54.0, 22.0 ],
                    "text": "line 0 10"
                }
            },
            {
                "box": {
                    "id": "s2",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 280.0, 596.0, 22.0, 128.0 ]
                }
            },
            {
                "box": {
                    "id": "out2",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 310.0, 701.0, 45.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cout2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 358.0, 702.0, 25.0, 20.0 ],
                    "text": "out"
                }
            },
            {
                "box": {
                    "id": "rport2",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 320.0, 731.0, 59.0, 22.0 ],
                    "text": "r live-port"
                }
            },
            {
                "box": {
                    "id": "cto2",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 280.0, 761.0, 64.0, 22.0 ],
                    "text": "ctlout 22 1"
                }
            },
            {
                "box": {
                    "id": "cn3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 410.0, 451.0, 113.0, 20.0 ],
                    "text": "CC4 network -> CC23"
                }
            },
            {
                "box": {
                    "id": "raw3",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 410.0, 476.0, 45.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "craw3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 458.0, 477.0, 28.0, 20.0 ],
                    "text": "raw"
                }
            },
            {
                "box": {
                    "id": "rms3",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 450.0, 506.0, 75.0, 22.0 ],
                    "text": "r smooth-ms"
                }
            },
            {
                "box": {
                    "id": "pk3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 410.0, 536.0, 61.0, 22.0 ],
                    "text": "pack 0 50"
                }
            },
            {
                "box": {
                    "id": "line3",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 410.0, 566.0, 54.0, 22.0 ],
                    "text": "line 0 10"
                }
            },
            {
                "box": {
                    "id": "s3",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 410.0, 596.0, 22.0, 128.0 ]
                }
            },
            {
                "box": {
                    "id": "out3",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 440.0, 701.0, 45.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cout3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 488.0, 702.0, 25.0, 20.0 ],
                    "text": "out"
                }
            },
            {
                "box": {
                    "id": "rport3",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 450.0, 731.0, 59.0, 22.0 ],
                    "text": "r live-port"
                }
            },
            {
                "box": {
                    "id": "cto3",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 410.0, 761.0, 64.0, 22.0 ],
                    "text": "ctlout 23 1"
                }
            },
            {
                "box": {
                    "id": "cyaw",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 796.0, 271.0, 33.0 ],
                    "text": "yaw wraps 127 <-> 0 when you turn a full circle;\nsmoothing then sweeps through the whole range."
                }
            },
            {
                "box": {
                    "id": "ccc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 360.0, 796.0, 287.0, 33.0 ],
                    "text": "CC 20-23 out instead of 1-4: CC 1 is the mod wheel,\nwhich many Live instruments already use."
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "c4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 216.0, 160.0, 20.0 ],
                    "text": "PAD NOTE (no smoothing)"
                }
            },
            {
                "box": {
                    "id": "nin",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 560.0, 241.0, 95.0, 22.0 ],
                    "text": "notein mqtt-max"
                }
            },
            {
                "box": {
                    "id": "np",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 560.0, 276.0, 45.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "nv",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 610.0, 276.0, 45.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cnp",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 660.0, 277.0, 56.0, 20.0 ],
                    "text": "pitch  vel"
                }
            },
            {
                "box": {
                    "id": "rportn",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 660.0, 311.0, 59.0, 22.0 ],
                    "text": "r live-port"
                }
            },
            {
                "box": {
                    "id": "nout",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 341.0, 59.0, 22.0 ],
                    "text": "noteout 1"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "c3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 391.0, 165.0, 20.0 ],
                    "text": "3 · OUTPUT PORT  (to Live)"
                }
            },
            {
                "box": {
                    "id": "lbp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 560.0, 416.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "refresh",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 630.0, 416.0, 46.0, 22.0 ],
                    "text": "refresh"
                }
            },
            {
                "box": {
                    "id": "mi",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 446.0, 50.0, 22.0 ],
                    "text": "midiinfo"
                }
            },
            {
                "box": {
                    "id": "menu",
                    "items": [ "AU DLS Synth 1", ",", "IAC Driver Bus 1", ",", "UMC1820", ",", "from Max 1", ",", "from Max 2" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 560.0, 476.0, 160.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "sport",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 506.0, 61.0, 22.0 ],
                    "text": "s live-port"
                }
            },
            {
                "box": {
                    "id": "cport",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 730.0, 474.0, 147.0, 33.0 ],
                    "text": "lists MIDI outputs;\nrefresh after adding a port"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "pk", 1 ],
                    "source": [ "ctl", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk", 0 ],
                    "source": [ "ctl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ms50", 0 ],
                    "source": [ "lbms", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mi", 0 ],
                    "source": [ "lbp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s0", 0 ],
                    "source": [ "line0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s1", 0 ],
                    "source": [ "line1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s2", 0 ],
                    "source": [ "line2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s3", 0 ],
                    "source": [ "line3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sport", 0 ],
                    "source": [ "menu", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "menu", 0 ],
                    "source": [ "mi", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sms", 0 ],
                    "source": [ "ms", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ms", 0 ],
                    "source": [ "ms50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "np", 0 ],
                    "source": [ "nin", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "nv", 0 ],
                    "source": [ "nin", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "nout", 0 ],
                    "source": [ "np", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "nout", 1 ],
                    "source": [ "nv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "cto0", 0 ],
                    "source": [ "out0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "cto1", 0 ],
                    "source": [ "out1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "cto2", 0 ],
                    "source": [ "out2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "cto3", 0 ],
                    "source": [ "out3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rev", 0 ],
                    "source": [ "pk", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "line0", 0 ],
                    "source": [ "pk0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "line1", 0 ],
                    "source": [ "pk1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "line2", 0 ],
                    "source": [ "pk2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "line3", 0 ],
                    "source": [ "pk3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk0", 0 ],
                    "source": [ "raw0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk1", 0 ],
                    "source": [ "raw1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk2", 0 ],
                    "source": [ "raw2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk3", 0 ],
                    "source": [ "raw3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "raw0", 0 ],
                    "source": [ "rcc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "raw1", 0 ],
                    "source": [ "rcc", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "raw2", 0 ],
                    "source": [ "rcc", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "raw3", 0 ],
                    "source": [ "rcc", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mi", 0 ],
                    "source": [ "refresh", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rcc", 0 ],
                    "source": [ "rev", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk0", 1 ],
                    "source": [ "rms0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk1", 1 ],
                    "source": [ "rms1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk2", 1 ],
                    "source": [ "rms2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk3", 1 ],
                    "source": [ "rms3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "cto0", 0 ],
                    "source": [ "rport0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "cto1", 0 ],
                    "source": [ "rport1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "cto2", 0 ],
                    "source": [ "rport2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "cto3", 0 ],
                    "source": [ "rport3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "nout", 0 ],
                    "source": [ "rportn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out0", 0 ],
                    "source": [ "s0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out1", 0 ],
                    "source": [ "s1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out2", 0 ],
                    "source": [ "s2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out3", 0 ],
                    "source": [ "s3", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}