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
        "rect": [ -209.0, -988.0, 1149.0, 954.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1042.0, 421.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 804.0, 609.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 400.0, 20.0 ],
                    "text": "PHONE -> MQTT -> MIDI  +  LATENCY"
                }
            },
            {
                "box": {
                    "id": "setup",
                    "linecount": 6,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 457.0, 87.0 ],
                    "text": "SETUP\n1. Midge: host public.cloud.shiftr.io, port 1883, user/pass public, prefix remote\n   -> Connect. MIDI: Create virtual port (\"midge\") -> Listen\n2. Phone: francesco-di-maggio.github.io/mqtt-max/phone/ -> same prefix -> Connect\n3. Section 2 shows the phone. Sections 3-4 measure latency.\nSame prefix everywhere. Public shiftr is visible to anyone: test data only."
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "c1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 150.0, 360.0, 20.0 ],
                    "text": "1 · BROKER  (node.script, needed for test A only)"
                }
            },
            {
                "box": {
                    "id": "conn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 175.0, 290.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 205.0, 175.0, 22.0 ],
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
                    "patching_rect": [ 205.0, 205.0, 70.0, 22.0 ],
                    "text": "disconnect"
                }
            },
            {
                "box": {
                    "id": "cconn",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 230.0, 400.0, 20.0 ],
                    "text": "first click connect; the local one needs ragazzi + Midge on 127.0.0.1"
                }
            },
            {
                "box": {
                    "id": "rsend",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 255.0, 75.0, 22.0 ],
                    "text": "r mqtt-send"
                }
            },
            {
                "box": {
                    "id": "node",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 290.0, 290.0, 22.0 ],
                    "saved_object_attributes": {
                        "autostart": 1,
                        "defer": 0,
                        "node_bin_path": "",
                        "npm_bin_path": "",
                        "watch": 1
                    },
                    "text": "node.script mqtt-client.js @autostart 1 @watch 1",
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
                    "patching_rect": [ 20.0, 325.0, 110.0, 22.0 ],
                    "text": "route status error"
                }
            },
            {
                "box": {
                    "id": "pst",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 360.0, 100.0, 22.0 ],
                    "text": "print mqtt-status"
                }
            },
            {
                "box": {
                    "id": "perr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 130.0, 360.0, 95.0, 22.0 ],
                    "text": "print mqtt-error"
                }
            },
            {
                "box": {
                    "id": "pns",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 320.0, 325.0, 100.0, 22.0 ],
                    "text": "print node-script"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "c2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 620.0, 150.0, 360.0, 20.0 ],
                    "text": "2 · PHONE INPUT  (MIDI from Midge, no MQTT here)"
                }
            },
            {
                "box": {
                    "id": "ctl",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 620.0, 175.0, 75.0, 22.0 ],
                    "text": "ctlin midge"
                }
            },
            {
                "box": {
                    "id": "pk",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 620.0, 210.0, 60.0, 22.0 ],
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
                    "patching_rect": [ 620.0, 245.0, 45.0, 22.0 ],
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
                    "patching_rect": [ 620.0, 280.0, 110.0, 22.0 ],
                    "text": "route 1 2 3 4"
                }
            },
            {
                "box": {
                    "id": "cpk",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 705.0, 210.0, 263.0, 20.0 ],
                    "text": "value + CC number -> \"CC value\" -> split by CC"
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
                    "patching_rect": [ 620.0, 315.0, 22.0, 128.0 ]
                }
            },
            {
                "box": {
                    "id": "n0",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 616.0, 450.0, 38.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cs0",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 616.0, 475.0, 34.0, 33.0 ],
                    "text": "CC1\npitch"
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
                    "patching_rect": [ 660.0, 315.0, 22.0, 128.0 ]
                }
            },
            {
                "box": {
                    "id": "n1",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 656.0, 450.0, 38.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cs1",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 656.0, 475.0, 33.0, 33.0 ],
                    "text": "CC2\nroll"
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
                    "patching_rect": [ 700.0, 315.0, 22.0, 128.0 ]
                }
            },
            {
                "box": {
                    "id": "n2",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 696.0, 450.0, 38.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cs2",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 696.0, 475.0, 33.0, 33.0 ],
                    "text": "CC3\nyaw"
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
                    "patching_rect": [ 740.0, 315.0, 22.0, 128.0 ]
                }
            },
            {
                "box": {
                    "id": "n3",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 736.0, 450.0, 38.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cs3",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 736.0, 475.0, 37.0, 33.0 ],
                    "text": "CC4\nslider"
                }
            },
            {
                "box": {
                    "id": "nin",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 820.0, 315.0, 80.0, 22.0 ],
                    "text": "notein midge"
                }
            },
            {
                "box": {
                    "id": "strip",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 820.0, 350.0, 65.0, 22.0 ],
                    "text": "stripnote"
                }
            },
            {
                "box": {
                    "id": "sel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "" ],
                    "patching_rect": [ 820.0, 385.0, 65.0, 22.0 ],
                    "text": "sel 61 62"
                }
            },
            {
                "box": {
                    "id": "pad",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 890.0, 420.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "sb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 820.0, 420.0, 75.0, 22.0 ],
                    "text": "s lat-b-stop"
                }
            },
            {
                "box": {
                    "id": "sa",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 820.0, 450.0, 75.0, 22.0 ],
                    "text": "s lat-a-stop"
                }
            },
            {
                "box": {
                    "id": "cpad",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 945.0, 420.0, 90.0, 20.0 ],
                    "text": "pad note (60)"
                }
            },
            {
                "box": {
                    "id": "csel",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 905.0, 330.0, 185.0, 60.0 ],
                    "text": "notes 61/62 are latency pings,\neverything else is the phone pad.\nNever connect notein midge to\nnoteout midge: endless loop."
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "c3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 421.0, 480.0, 20.0 ],
                    "text": "3 · LATENCY A  —  baseline: laptop -> broker -> laptop"
                }
            },
            {
                "box": {
                    "id": "c3b",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 443.0, 384.0, 33.0 ],
                    "text": "Max publishes note 62 over MQTT -> broker -> Midge -> notein midge.\nNeeds section 1 connected to the same broker as Midge."
                }
            },
            {
                "box": {
                    "id": "atog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 486.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "actog",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 48.0, 488.0, 90.0, 20.0 ],
                    "text": "auto (1000 ms)"
                }
            },
            {
                "box": {
                    "id": "ametro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 20.0, 516.0, 69.0, 22.0 ],
                    "text": "metro 1000"
                }
            },
            {
                "box": {
                    "id": "abtn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 166.0, 486.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "acbtn",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 193.0, 488.0, 80.0, 20.0 ],
                    "text": "single ping"
                }
            },
            {
                "box": {
                    "id": "at",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 20.0, 551.0, 45.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "amsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 189.0, 538.0, 225.0, 22.0 ],
                    "text": "publishbytes remote/in/noteon/1/62 100"
                }
            },
            {
                "box": {
                    "id": "asend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 551.0, 75.0, 22.0 ],
                    "text": "s mqtt-send"
                }
            },
            {
                "box": {
                    "id": "ar",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 140.0, 586.0, 90.0, 22.0 ],
                    "text": "r lat-a-stop"
                }
            },
            {
                "box": {
                    "id": "atimer",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "float", "" ],
                    "patching_rect": [ 20.0, 621.0, 140.0, 22.0 ],
                    "text": "timer"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "ams",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 656.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "acms",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 678.0, 60.0, 20.0 ],
                    "text": "last ms"
                }
            },
            {
                "box": {
                    "id": "amean",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "int" ],
                    "patching_rect": [ 100.0, 656.0, 45.0, 22.0 ],
                    "text": "mean"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "aavg",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 100.0, 691.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "acavg",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 100.0, 713.0, 60.0, 20.0 ],
                    "text": "avg ms"
                }
            },
            {
                "box": {
                    "id": "acnt",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 165.0, 691.0, 45.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "accnt",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 165.0, 713.0, 50.0, 20.0 ],
                    "text": "count"
                }
            },
            {
                "box": {
                    "id": "atrough",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 220.0, 656.0, 50.0, 22.0 ],
                    "text": "trough"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "amin",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 220.0, 691.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "acmin",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 220.0, 713.0, 60.0, 20.0 ],
                    "text": "min ms"
                }
            },
            {
                "box": {
                    "id": "apeak",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 290.0, 656.0, 45.0, 22.0 ],
                    "text": "peak"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "amax",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 290.0, 691.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "acmax",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 290.0, 713.0, 60.0, 20.0 ],
                    "text": "max ms"
                }
            },
            {
                "box": {
                    "id": "arst",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 365.0, 621.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "acrst",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 392.0, 623.0, 45.0, 20.0 ],
                    "text": "reset"
                }
            },
            {
                "box": {
                    "id": "alb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 365.0, 586.0, 60.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "atr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "bang" ],
                    "patching_rect": [ 365.0, 726.0, 55.0, 22.0 ],
                    "text": "t b b b"
                }
            },
            {
                "box": {
                    "id": "aclr",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 365.0, 761.0, 40.0, 22.0 ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "id": "ahi",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 410.0, 761.0, 50.0, 22.0 ],
                    "text": "100000"
                }
            },
            {
                "box": {
                    "id": "alo",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 465.0, 865.0, 25.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "c4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 620.0, 540.0, 480.0, 20.0 ],
                    "text": "4 · LATENCY B  —  full loop through the phone"
                }
            },
            {
                "box": {
                    "id": "c4b",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 620.0, 562.0, 473.0, 33.0 ],
                    "text": "Phone: tick \"Echo notes\" in settings, then Connect.\nMax -> Midge -> remote/out -> broker -> phone -> remote/in -> broker -> Midge -> Max."
                }
            },
            {
                "box": {
                    "id": "btog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 620.0, 605.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "bctog",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 648.0, 607.0, 90.0, 20.0 ],
                    "text": "auto (1000 ms)"
                }
            },
            {
                "box": {
                    "id": "bmetro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 620.0, 635.0, 69.0, 22.0 ],
                    "text": "metro 1000"
                }
            },
            {
                "box": {
                    "id": "bbtn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 740.0, 635.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "bcbtn",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 767.0, 637.0, 80.0, 20.0 ],
                    "text": "single ping"
                }
            },
            {
                "box": {
                    "id": "bt",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 620.0, 670.0, 45.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "bmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 670.0, 640.0, 30.0, 22.0 ],
                    "text": "61"
                }
            },
            {
                "box": {
                    "id": "bmk",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "float", "float" ],
                    "patching_rect": [ 670.0, 670.0, 108.0, 22.0 ],
                    "text": "makenote 100 200"
                }
            },
            {
                "box": {
                    "id": "bout",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 670.0, 700.0, 85.0, 22.0 ],
                    "text": "noteout midge"
                }
            },
            {
                "box": {
                    "id": "br",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 740.0, 735.0, 90.0, 22.0 ],
                    "text": "r lat-b-stop"
                }
            },
            {
                "box": {
                    "id": "btimer",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "float", "" ],
                    "patching_rect": [ 620.0, 770.0, 140.0, 22.0 ],
                    "text": "timer"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "bms",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 620.0, 805.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "bcms",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 620.0, 827.0, 60.0, 20.0 ],
                    "text": "last ms"
                }
            },
            {
                "box": {
                    "id": "bmean",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "int" ],
                    "patching_rect": [ 700.0, 805.0, 45.0, 22.0 ],
                    "text": "mean"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "bavg",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 700.0, 840.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "bcavg",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 700.0, 862.0, 60.0, 20.0 ],
                    "text": "avg ms"
                }
            },
            {
                "box": {
                    "id": "bcnt",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 765.0, 840.0, 45.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "bccnt",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 765.0, 862.0, 50.0, 20.0 ],
                    "text": "count"
                }
            },
            {
                "box": {
                    "id": "btrough",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 820.0, 805.0, 50.0, 22.0 ],
                    "text": "trough"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "bmin",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 820.0, 840.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "bcmin",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 820.0, 862.0, 60.0, 20.0 ],
                    "text": "min ms"
                }
            },
            {
                "box": {
                    "id": "bpeak",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 890.0, 805.0, 45.0, 22.0 ],
                    "text": "peak"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "bmax",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 890.0, 840.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "bcmax",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 890.0, 862.0, 60.0, 20.0 ],
                    "text": "max ms"
                }
            },
            {
                "box": {
                    "id": "brst",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 965.0, 770.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "bcrst",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 992.0, 772.0, 45.0, 20.0 ],
                    "text": "reset"
                }
            },
            {
                "box": {
                    "id": "blb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 965.0, 735.0, 60.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "btr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "bang" ],
                    "patching_rect": [ 965.0, 875.0, 55.0, 22.0 ],
                    "text": "t b b b"
                }
            },
            {
                "box": {
                    "id": "bclr",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 965.0, 910.0, 40.0, 22.0 ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "id": "bhi",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1010.0, 910.0, 50.0, 22.0 ],
                    "text": "100000"
                }
            },
            {
                "box": {
                    "id": "blo",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1065.0, 910.0, 25.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "c5",
                    "linecount": 6,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 881.0, 557.0, 87.0 ],
                    "text": "READING THE NUMBERS\nphone <-> broker round trip  ~=  B avg - A avg\none-way phone -> laptop      ~=  (B avg - A avg) / 2   (assumes both directions are equal)\nmedian = typical value, not pulled up by spikes. jitter = max - min. For music, jitter matters as much as the average.\nClick reset before each run. Compare: cellular vs Wi-Fi vs local ragazzi."
                }
            },
            {
                "box": {
                    "id": "azls",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 741.0, 80.0, 22.0 ],
                    "text": "zl.stream 20"
                }
            },
            {
                "box": {
                    "id": "azlm",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 771.0, 65.0, 22.0 ],
                    "text": "zl.median"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "amed",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 801.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "acmed",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 85.0, 802.0, 160.0, 20.0 ],
                    "text": "median ms (last 20 pings)"
                }
            },
            {
                "box": {
                    "id": "azlc",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 110.0, 741.0, 50.0, 22.0 ],
                    "text": "zlclear"
                }
            },
            {
                "box": {
                    "id": "bzls",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 620.0, 890.0, 80.0, 22.0 ],
                    "text": "zl.stream 20"
                }
            },
            {
                "box": {
                    "id": "bzlm",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 620.0, 920.0, 65.0, 22.0 ],
                    "text": "zl.median"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "bmed",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 620.0, 950.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "bcmed",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 685.0, 951.0, 160.0, 20.0 ],
                    "text": "median ms (last 20 pings)"
                }
            },
            {
                "box": {
                    "id": "bzlc",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 710.0, 890.0, 50.0, 22.0 ],
                    "text": "zlclear"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "at", 0 ],
                    "source": [ "abtn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "amean", 0 ],
                    "source": [ "aclr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "atrough", 1 ],
                    "source": [ "ahi", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "arst", 0 ],
                    "source": [ "alb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "apeak", 1 ],
                    "source": [ "alo", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aavg", 0 ],
                    "source": [ "amean", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "acnt", 0 ],
                    "source": [ "amean", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "at", 0 ],
                    "source": [ "ametro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "asend", 0 ],
                    "source": [ "amsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "amax", 0 ],
                    "source": [ "apeak", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "atimer", 1 ],
                    "source": [ "ar", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "atr", 0 ],
                    "order": 0,
                    "source": [ "arst", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "azlc", 0 ],
                    "order": 1,
                    "source": [ "arst", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "amsg", 0 ],
                    "source": [ "at", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "atimer", 0 ],
                    "source": [ "at", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "amean", 0 ],
                    "order": 2,
                    "source": [ "atimer", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ams", 0 ],
                    "order": 4,
                    "source": [ "atimer", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "apeak", 0 ],
                    "order": 0,
                    "source": [ "atimer", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "atrough", 0 ],
                    "order": 1,
                    "source": [ "atimer", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "azls", 0 ],
                    "order": 3,
                    "source": [ "atimer", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ametro", 0 ],
                    "source": [ "atog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aclr", 0 ],
                    "source": [ "atr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ahi", 0 ],
                    "source": [ "atr", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "alo", 0 ],
                    "source": [ "atr", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "amin", 0 ],
                    "source": [ "atrough", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "azls", 0 ],
                    "source": [ "azlc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "amed", 0 ],
                    "source": [ "azlm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "azlm", 0 ],
                    "source": [ "azls", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bt", 0 ],
                    "source": [ "bbtn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bmean", 0 ],
                    "source": [ "bclr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btrough", 1 ],
                    "source": [ "bhi", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "brst", 0 ],
                    "source": [ "blb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bpeak", 1 ],
                    "source": [ "blo", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bavg", 0 ],
                    "source": [ "bmean", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bcnt", 0 ],
                    "source": [ "bmean", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bt", 0 ],
                    "source": [ "bmetro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bout", 1 ],
                    "source": [ "bmk", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bout", 0 ],
                    "source": [ "bmk", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bmk", 0 ],
                    "source": [ "bmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bmax", 0 ],
                    "source": [ "bpeak", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btimer", 1 ],
                    "source": [ "br", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btr", 0 ],
                    "order": 0,
                    "source": [ "brst", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bzlc", 0 ],
                    "order": 1,
                    "source": [ "brst", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bmsg", 0 ],
                    "source": [ "bt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btimer", 0 ],
                    "source": [ "bt", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bmean", 0 ],
                    "order": 2,
                    "source": [ "btimer", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bms", 0 ],
                    "order": 4,
                    "source": [ "btimer", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bpeak", 0 ],
                    "order": 0,
                    "source": [ "btimer", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btrough", 0 ],
                    "order": 1,
                    "source": [ "btimer", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bzls", 0 ],
                    "order": 3,
                    "source": [ "btimer", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bmetro", 0 ],
                    "source": [ "btog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bclr", 0 ],
                    "source": [ "btr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bhi", 0 ],
                    "source": [ "btr", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "blo", 0 ],
                    "source": [ "btr", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bmin", 0 ],
                    "source": [ "btrough", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bzls", 0 ],
                    "source": [ "bzlc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bmed", 0 ],
                    "source": [ "bzlm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bzlm", 0 ],
                    "source": [ "bzls", 0 ]
                }
            },
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
                    "destination": [ "node", 0 ],
                    "source": [ "disc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "strip", 1 ],
                    "source": [ "nin", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "strip", 0 ],
                    "source": [ "nin", 0 ]
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
                    "destination": [ "bmetro", 1 ],
                    "source": [ "obj-2", 0 ]
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
                    "destination": [ "s0", 0 ],
                    "source": [ "rcc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s1", 0 ],
                    "source": [ "rcc", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s2", 0 ],
                    "source": [ "rcc", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s3", 0 ],
                    "source": [ "rcc", 3 ]
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
                    "destination": [ "perr", 0 ],
                    "source": [ "route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pst", 0 ],
                    "source": [ "route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "source": [ "rsend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n0", 0 ],
                    "source": [ "s0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n1", 0 ],
                    "source": [ "s1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n2", 0 ],
                    "source": [ "s2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n3", 0 ],
                    "source": [ "s3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "order": 0,
                    "source": [ "sel", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad", 0 ],
                    "order": 1,
                    "source": [ "sel", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sa", 0 ],
                    "source": [ "sel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sb", 0 ],
                    "source": [ "sel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sel", 0 ],
                    "source": [ "strip", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}