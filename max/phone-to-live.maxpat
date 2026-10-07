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
        "rect": [
            80.0,
            80.0,
            900.0,
            900.0
        ],
        "boxes": [
            {
                "box": {
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        15,
                        400,
                        21.0
                    ],
                    "text": "PHONE -> SMOOTHING -> ABLETON LIVE",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "setup",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        40,
                        620,
                        126.0
                    ],
                    "text": "SETUP\n1. Midge: shiftr (or ragazzi), prefix remote, Connect. MIDI: Create virtual port (\"midge\") -> Listen\n2. Phone: francesco-di-maggio.github.io/mqtt-max/phone/ -> same prefix -> Connect (Echo off)\n3. Section 3: pick the output port, e.g. \"from Max 1\" or an IAC bus. Never pick \"midge\":\n   that sends everything back over MQTT.\n4. Live: Settings -> Link, Tempo & MIDI -> MIDI Ports: that port as Input, Track + Remote on.\n   CCs: MIDI Map mode (Cmd+M), click a control, move the phone.\n   Pad: MIDI track, input = that port, Monitor In."
                }
            },
            {
                "box": {
                    "id": "c1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        190,
                        300,
                        21.0
                    ],
                    "text": "1 \u00b7 PHONE IN  (MIDI from Midge)",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "ctl",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        20,
                        215,
                        75,
                        22.0
                    ],
                    "text": "ctlin midge",
                    "outlettype": [
                        "",
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "pk",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        20,
                        245,
                        60,
                        22.0
                    ],
                    "text": "pack 0 0",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "rev",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [
                        20,
                        275,
                        45,
                        22.0
                    ],
                    "text": "zl.rev",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "rcc",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "patching_rect": [
                        20,
                        305,
                        250,
                        22.0
                    ],
                    "text": "route 1 2 3 4",
                    "outlettype": [
                        "",
                        "",
                        "",
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "cpk",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        105,
                        245,
                        280,
                        21.0
                    ],
                    "text": "value + CC number -> \"CC value\" -> split by CC"
                }
            },
            {
                "box": {
                    "id": "c2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        350,
                        400,
                        21.0
                    ],
                    "text": "2 \u00b7 SMOOTHING  ->  CC OUT (channel 1)",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "ms",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        20,
                        375,
                        50.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "sms",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        75,
                        375,
                        80,
                        22.0
                    ],
                    "text": "s smooth-ms"
                }
            },
            {
                "box": {
                    "id": "cms",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        165,
                        372,
                        340,
                        36.0
                    ],
                    "text": "ramp ms: each new value glides over this time.\n0 = raw. 30-100 = smooth. Larger = smoother but laggier."
                }
            },
            {
                "box": {
                    "id": "lbms",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        430,
                        350,
                        60,
                        22.0
                    ],
                    "text": "loadbang",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "ms50",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        500,
                        350,
                        30,
                        22.0
                    ],
                    "text": "50",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "cn0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        425,
                        125,
                        21.0
                    ],
                    "text": "CC1 pitch -> CC20"
                }
            },
            {
                "box": {
                    "id": "raw0",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        20,
                        450,
                        45.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "craw0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        68,
                        451,
                        35,
                        21.0
                    ],
                    "text": "raw"
                }
            },
            {
                "box": {
                    "id": "rms0",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "patching_rect": [
                        60,
                        480,
                        75,
                        22.0
                    ],
                    "text": "r smooth-ms",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "pk0",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        20,
                        510,
                        60,
                        22.0
                    ],
                    "text": "pack 0 50",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "line0",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "patching_rect": [
                        20,
                        540,
                        60,
                        22.0
                    ],
                    "text": "line 0 10",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "s0",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        20,
                        570,
                        22.0,
                        128.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "out0",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        50,
                        675,
                        45.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "cout0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        98,
                        676,
                        35,
                        21.0
                    ],
                    "text": "out"
                }
            },
            {
                "box": {
                    "id": "rport0",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "patching_rect": [
                        60,
                        705,
                        70,
                        22.0
                    ],
                    "text": "r live-port",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "cto0",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        735,
                        75,
                        22.0
                    ],
                    "text": "ctlout 20 1"
                }
            },
            {
                "box": {
                    "id": "cn1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        150,
                        425,
                        125,
                        21.0
                    ],
                    "text": "CC2 roll -> CC21"
                }
            },
            {
                "box": {
                    "id": "raw1",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        150,
                        450,
                        45.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "craw1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        198,
                        451,
                        35,
                        21.0
                    ],
                    "text": "raw"
                }
            },
            {
                "box": {
                    "id": "rms1",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "patching_rect": [
                        190,
                        480,
                        75,
                        22.0
                    ],
                    "text": "r smooth-ms",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "pk1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        150,
                        510,
                        60,
                        22.0
                    ],
                    "text": "pack 0 50",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "line1",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "patching_rect": [
                        150,
                        540,
                        60,
                        22.0
                    ],
                    "text": "line 0 10",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "s1",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        150,
                        570,
                        22.0,
                        128.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "out1",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        180,
                        675,
                        45.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "cout1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        228,
                        676,
                        35,
                        21.0
                    ],
                    "text": "out"
                }
            },
            {
                "box": {
                    "id": "rport1",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "patching_rect": [
                        190,
                        705,
                        70,
                        22.0
                    ],
                    "text": "r live-port",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "cto1",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [
                        150,
                        735,
                        75,
                        22.0
                    ],
                    "text": "ctlout 21 1"
                }
            },
            {
                "box": {
                    "id": "cn2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280,
                        425,
                        125,
                        21.0
                    ],
                    "text": "CC3 yaw -> CC22"
                }
            },
            {
                "box": {
                    "id": "raw2",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        280,
                        450,
                        45.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "craw2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        328,
                        451,
                        35,
                        21.0
                    ],
                    "text": "raw"
                }
            },
            {
                "box": {
                    "id": "rms2",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "patching_rect": [
                        320,
                        480,
                        75,
                        22.0
                    ],
                    "text": "r smooth-ms",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "pk2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        280,
                        510,
                        60,
                        22.0
                    ],
                    "text": "pack 0 50",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "line2",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "patching_rect": [
                        280,
                        540,
                        60,
                        22.0
                    ],
                    "text": "line 0 10",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "s2",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        280,
                        570,
                        22.0,
                        128.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "out2",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        310,
                        675,
                        45.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "cout2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        358,
                        676,
                        35,
                        21.0
                    ],
                    "text": "out"
                }
            },
            {
                "box": {
                    "id": "rport2",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "patching_rect": [
                        320,
                        705,
                        70,
                        22.0
                    ],
                    "text": "r live-port",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "cto2",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [
                        280,
                        735,
                        75,
                        22.0
                    ],
                    "text": "ctlout 22 1"
                }
            },
            {
                "box": {
                    "id": "cn3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        410,
                        425,
                        125,
                        21.0
                    ],
                    "text": "CC4 slider -> CC23"
                }
            },
            {
                "box": {
                    "id": "raw3",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        410,
                        450,
                        45.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "craw3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        458,
                        451,
                        35,
                        21.0
                    ],
                    "text": "raw"
                }
            },
            {
                "box": {
                    "id": "rms3",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "patching_rect": [
                        450,
                        480,
                        75,
                        22.0
                    ],
                    "text": "r smooth-ms",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "pk3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        410,
                        510,
                        60,
                        22.0
                    ],
                    "text": "pack 0 50",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "line3",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "patching_rect": [
                        410,
                        540,
                        60,
                        22.0
                    ],
                    "text": "line 0 10",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "s3",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        410,
                        570,
                        22.0,
                        128.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "out3",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        440,
                        675,
                        45.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "cout3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        488,
                        676,
                        35,
                        21.0
                    ],
                    "text": "out"
                }
            },
            {
                "box": {
                    "id": "rport3",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "patching_rect": [
                        450,
                        705,
                        70,
                        22.0
                    ],
                    "text": "r live-port",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "cto3",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [
                        410,
                        735,
                        75,
                        22.0
                    ],
                    "text": "ctlout 23 1"
                }
            },
            {
                "box": {
                    "id": "cyaw",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        770,
                        330,
                        36.0
                    ],
                    "text": "yaw wraps 127 <-> 0 when you turn a full circle;\nsmoothing then sweeps through the whole range."
                }
            },
            {
                "box": {
                    "id": "ccc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        360,
                        770,
                        330,
                        36.0
                    ],
                    "text": "CC 20-23 out instead of 1-4: CC 1 is the mod wheel,\nwhich many Live instruments already use."
                }
            },
            {
                "box": {
                    "id": "c4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        560,
                        190,
                        200,
                        21.0
                    ],
                    "text": "PAD NOTE (no smoothing)",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "nin",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        560,
                        215,
                        80,
                        22.0
                    ],
                    "text": "notein midge",
                    "outlettype": [
                        "",
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "np",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        560,
                        250,
                        45.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "nv",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        610,
                        250,
                        45.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "cnp",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        660,
                        251,
                        70,
                        21.0
                    ],
                    "text": "pitch  vel"
                }
            },
            {
                "box": {
                    "id": "rportn",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "patching_rect": [
                        660,
                        285,
                        70,
                        22.0
                    ],
                    "text": "r live-port",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "nout",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [
                        560,
                        315,
                        65,
                        22.0
                    ],
                    "text": "noteout 1"
                }
            },
            {
                "box": {
                    "id": "c3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        560,
                        365,
                        220,
                        21.0
                    ],
                    "text": "3 \u00b7 OUTPUT PORT  (to Live)",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "lbp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        560,
                        390,
                        60,
                        22.0
                    ],
                    "text": "loadbang",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "refresh",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        630,
                        390,
                        50,
                        22.0
                    ],
                    "text": "refresh",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "mi",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        560,
                        420,
                        60,
                        22.0
                    ],
                    "text": "midiinfo",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "menu",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        560,
                        450,
                        160,
                        22.0
                    ],
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "parameter_enable": 0,
                    "items": []
                }
            },
            {
                "box": {
                    "id": "sport",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        560,
                        480,
                        70,
                        22.0
                    ],
                    "text": "s live-port"
                }
            },
            {
                "box": {
                    "id": "cport",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        730,
                        448,
                        160,
                        36.0
                    ],
                    "text": "lists MIDI outputs;\nrefresh after adding a port"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": [
                        "ctl",
                        0
                    ],
                    "destination": [
                        "pk",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "ctl",
                        1
                    ],
                    "destination": [
                        "pk",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pk",
                        0
                    ],
                    "destination": [
                        "rev",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "rev",
                        0
                    ],
                    "destination": [
                        "rcc",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "lbms",
                        0
                    ],
                    "destination": [
                        "ms50",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "ms50",
                        0
                    ],
                    "destination": [
                        "ms",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "ms",
                        0
                    ],
                    "destination": [
                        "sms",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "rcc",
                        0
                    ],
                    "destination": [
                        "raw0",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "raw0",
                        0
                    ],
                    "destination": [
                        "pk0",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "rms0",
                        0
                    ],
                    "destination": [
                        "pk0",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pk0",
                        0
                    ],
                    "destination": [
                        "line0",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "line0",
                        0
                    ],
                    "destination": [
                        "s0",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "s0",
                        0
                    ],
                    "destination": [
                        "out0",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "out0",
                        0
                    ],
                    "destination": [
                        "cto0",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "rport0",
                        0
                    ],
                    "destination": [
                        "cto0",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "rcc",
                        1
                    ],
                    "destination": [
                        "raw1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "raw1",
                        0
                    ],
                    "destination": [
                        "pk1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "rms1",
                        0
                    ],
                    "destination": [
                        "pk1",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pk1",
                        0
                    ],
                    "destination": [
                        "line1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "line1",
                        0
                    ],
                    "destination": [
                        "s1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "s1",
                        0
                    ],
                    "destination": [
                        "out1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "out1",
                        0
                    ],
                    "destination": [
                        "cto1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "rport1",
                        0
                    ],
                    "destination": [
                        "cto1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "rcc",
                        2
                    ],
                    "destination": [
                        "raw2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "raw2",
                        0
                    ],
                    "destination": [
                        "pk2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "rms2",
                        0
                    ],
                    "destination": [
                        "pk2",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pk2",
                        0
                    ],
                    "destination": [
                        "line2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "line2",
                        0
                    ],
                    "destination": [
                        "s2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "s2",
                        0
                    ],
                    "destination": [
                        "out2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "out2",
                        0
                    ],
                    "destination": [
                        "cto2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "rport2",
                        0
                    ],
                    "destination": [
                        "cto2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "rcc",
                        3
                    ],
                    "destination": [
                        "raw3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "raw3",
                        0
                    ],
                    "destination": [
                        "pk3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "rms3",
                        0
                    ],
                    "destination": [
                        "pk3",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pk3",
                        0
                    ],
                    "destination": [
                        "line3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "line3",
                        0
                    ],
                    "destination": [
                        "s3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "s3",
                        0
                    ],
                    "destination": [
                        "out3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "out3",
                        0
                    ],
                    "destination": [
                        "cto3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "rport3",
                        0
                    ],
                    "destination": [
                        "cto3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "nin",
                        0
                    ],
                    "destination": [
                        "np",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "nin",
                        1
                    ],
                    "destination": [
                        "nv",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "nv",
                        0
                    ],
                    "destination": [
                        "nout",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "np",
                        0
                    ],
                    "destination": [
                        "nout",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "rportn",
                        0
                    ],
                    "destination": [
                        "nout",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "lbp",
                        0
                    ],
                    "destination": [
                        "mi",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "refresh",
                        0
                    ],
                    "destination": [
                        "mi",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "mi",
                        0
                    ],
                    "destination": [
                        "menu",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "menu",
                        1
                    ],
                    "destination": [
                        "sport",
                        0
                    ]
                }
            }
        ]
    }
}