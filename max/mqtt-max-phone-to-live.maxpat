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
                        500,
                        21.0
                    ],
                    "text": "PHONE -> SMOOTHING -> ABLETON LIVE  (Max only, no Midge)",
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
                        640,
                        126.0
                    ],
                    "text": "SETUP\n1. Section 1: click a connect. It subscribes to remote/in/# once connected.\n2. Phone: francesco-di-maggio.github.io/mqtt-max/phone/ -> prefix remote -> Connect (Echo off)\n3. Section 3: pick the output port, e.g. \"from Max 1\" or an IAC bus.\n4. Live: Settings -> Link, Tempo & MIDI -> MIDI Ports: that port as Input, Track + Remote on.\n   CCs: MIDI Map mode (Cmd+M), click a control, move the phone.\n   Pad: MIDI track, input = that port, Monitor In.\nMidge not needed. If Midge is also running, quit it or use mqtt-midge-phone-to-live.maxpat instead."
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
                        200,
                        290,
                        21.0
                    ],
                    "text": "1 \u00b7 PHONE IN  (MQTT straight into Max)",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "conn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        20,
                        225,
                        290,
                        22.0
                    ],
                    "text": "connect mqtt://public.cloud.shiftr.io public public",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "connl",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        20,
                        255,
                        175,
                        22.0
                    ],
                    "text": "connect mqtt://localhost:1883",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "disc",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        205,
                        255,
                        70,
                        22.0
                    ],
                    "text": "disconnect",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "node",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        20,
                        290,
                        290,
                        22.0
                    ],
                    "text": "node.script mqtt-client.js @autostart 1 @watch 1",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "route",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "patching_rect": [
                        20,
                        325,
                        140,
                        22.0
                    ],
                    "text": "route midi status error",
                    "outlettype": [
                        "",
                        "",
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "pns",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        320,
                        325,
                        100,
                        22.0
                    ],
                    "text": "print node-script"
                }
            },
            {
                "box": {
                    "id": "pst",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280,
                        450,
                        100,
                        22.0
                    ],
                    "text": "print mqtt-status"
                }
            },
            {
                "box": {
                    "id": "perr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280,
                        360,
                        95,
                        22.0
                    ],
                    "text": "print mqtt-error"
                }
            },
            {
                "box": {
                    "id": "rconn",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        170,
                        360,
                        100,
                        22.0
                    ],
                    "text": "route connected",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "sub",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        320,
                        255,
                        135,
                        22.0
                    ],
                    "text": "subscribe remote/in/#",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "csub",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        320,
                        202,
                        210,
                        36.0
                    ],
                    "text": "sent on every connect; change\n\"remote\" if the phone uses another prefix"
                }
            },
            {
                "box": {
                    "id": "tb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        280,
                        390,
                        30,
                        22.0
                    ],
                    "text": "t b",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "rin",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        20,
                        360,
                        55,
                        22.0
                    ],
                    "text": "route in",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "rtype",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "patching_rect": [
                        20,
                        390,
                        140,
                        22.0
                    ],
                    "text": "route cc noteon noteoff",
                    "outlettype": [
                        "",
                        "",
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "ccsl",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [
                        20,
                        420,
                        65,
                        22.0
                    ],
                    "text": "zl.slice 1",
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
                        450,
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
                    "id": "crcc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        95,
                        420,
                        330,
                        21.0
                    ],
                    "text": "midi in cc <ch> <cc> <value> -> drop ch -> split by CC"
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
                        495,
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
                        520,
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
                        520,
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
                        517,
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
                        495,
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
                        495,
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
                        570,
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
                        595,
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
                        596,
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
                        625,
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
                        655,
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
                        685,
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
                        715,
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
                        820,
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
                        821,
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
                        850,
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
                        880,
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
                        570,
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
                        595,
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
                        596,
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
                        625,
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
                        655,
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
                        685,
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
                        715,
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
                        820,
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
                        821,
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
                        850,
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
                        880,
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
                        570,
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
                        595,
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
                        596,
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
                        625,
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
                        655,
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
                        685,
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
                        715,
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
                        820,
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
                        821,
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
                        850,
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
                        880,
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
                        570,
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
                        595,
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
                        596,
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
                        625,
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
                        655,
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
                        685,
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
                        715,
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
                        820,
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
                        821,
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
                        850,
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
                        880,
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
                        915,
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
                        915,
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
                        200,
                        200,
                        21.0
                    ],
                    "text": "PAD NOTE (no smoothing)",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "nonsl",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [
                        560,
                        225,
                        65,
                        22.0
                    ],
                    "text": "zl.slice 1",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "noffsl",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [
                        650,
                        225,
                        65,
                        22.0
                    ],
                    "text": "zl.slice 1",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "noffn",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [
                        650,
                        255,
                        65,
                        22.0
                    ],
                    "text": "zl.slice 1",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "noff0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        650,
                        285,
                        35,
                        22.0
                    ],
                    "text": "$1 0",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "nup",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        560,
                        315,
                        70,
                        22.0
                    ],
                    "text": "unpack 0 0",
                    "outlettype": [
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
                        345,
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
                        345,
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
                        346,
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
                        375,
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
                        405,
                        65,
                        22.0
                    ],
                    "text": "noteout 1"
                }
            },
            {
                "box": {
                    "id": "cnoff",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        730,
                        225,
                        150,
                        36.0
                    ],
                    "text": "noteon: <note> <vel>\nnoteoff: <note> 0"
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
                        450,
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
                        475,
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
                        475,
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
                        505,
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
                        535,
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
                        565,
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
                        533,
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
                        "conn",
                        0
                    ],
                    "destination": [
                        "node",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "connl",
                        0
                    ],
                    "destination": [
                        "node",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "disc",
                        0
                    ],
                    "destination": [
                        "node",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "sub",
                        0
                    ],
                    "destination": [
                        "node",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "node",
                        0
                    ],
                    "destination": [
                        "route",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "node",
                        1
                    ],
                    "destination": [
                        "pns",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "route",
                        1
                    ],
                    "destination": [
                        "rconn",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "route",
                        1
                    ],
                    "destination": [
                        "pst",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "route",
                        2
                    ],
                    "destination": [
                        "perr",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "rconn",
                        0
                    ],
                    "destination": [
                        "tb",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "tb",
                        0
                    ],
                    "destination": [
                        "sub",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "route",
                        0
                    ],
                    "destination": [
                        "rin",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "rin",
                        0
                    ],
                    "destination": [
                        "rtype",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "rtype",
                        0
                    ],
                    "destination": [
                        "ccsl",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "ccsl",
                        1
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
                        "rtype",
                        1
                    ],
                    "destination": [
                        "nonsl",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "rtype",
                        2
                    ],
                    "destination": [
                        "noffsl",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "nonsl",
                        1
                    ],
                    "destination": [
                        "nup",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "noffsl",
                        1
                    ],
                    "destination": [
                        "noffn",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "noffn",
                        0
                    ],
                    "destination": [
                        "noff0",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "noff0",
                        0
                    ],
                    "destination": [
                        "nup",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "nup",
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
                        "nup",
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