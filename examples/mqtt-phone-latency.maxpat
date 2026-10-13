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
        "rect": [ 120.0, 120.0, 760.0, 680.0 ],
        "boxes": [
            {
                "box": {
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 400.0, 20.0 ],
                    "text": "ROUND TRIPS",
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
                    "text": "A: Max → broker → Max, a message on a topic of its own.\nB: Max → broker → phone → broker → Max. Phone app: Send MIDI, prefix remote, Echo notes on, then Connect."
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
                    "text": "mqtt.client latency"
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
                    "id": "ca",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 200.0, 300.0, 20.0 ],
                    "text": "A  ·  MAX → BROKER → MAX",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "aload",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 225.0, 60.0, 22.0 ],
                    "outlettype": [ "bang" ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "arand",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 255.0, 95.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "random 1000000"
                }
            },
            {
                "box": {
                    "id": "asub",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 20.0, 285.0, 230.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "sprintf subscribe mqtt-max-latency/%ld"
                }
            },
            {
                "box": {
                    "id": "atopic",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 260.0, 285.0, 255.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "sprintf set publish mqtt-max-latency/%ld ping"
                }
            },
            {
                "box": {
                    "id": "apub",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 260.0, 315.0, 230.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": ""
                }
            },
            {
                "box": {
                    "id": "atog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 540.0, 225.0, 22.0, 22.0 ],
                    "outlettype": [ "int" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "cauto",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 570.0, 225.0, 90.0, 20.0 ],
                    "text": "every second"
                }
            },
            {
                "box": {
                    "id": "ametro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 540.0, 255.0, 70.0, 22.0 ],
                    "outlettype": [ "bang" ],
                    "text": "metro 1000"
                }
            },
            {
                "box": {
                    "id": "at",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 540.0, 285.0, 40.0, 22.0 ],
                    "outlettype": [ "bang", "bang" ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "aslice",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 350.0, 60.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "zl.slice 1"
                }
            },
            {
                "box": {
                    "id": "aroute",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 380.0, 65.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route ping"
                }
            },
            {
                "box": {
                    "id": "aatimer",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 415.0, 45.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "timer"
                }
            },
            {
                "box": {
                    "id": "aat",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [ 20.0, 445.0, 90.0, 22.0 ],
                    "outlettype": [ "", "", "", "", "" ],
                    "text": "t f f f f f"
                }
            },
            {
                "box": {
                    "id": "aamean",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 80.0, 475.0, 40.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "mean"
                }
            },
            {
                "box": {
                    "id": "aamin",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "patching_rect": [ 140.0, 475.0, 45.0, 22.0 ],
                    "outlettype": [ "", "", "" ],
                    "text": "trough"
                }
            },
            {
                "box": {
                    "id": "aamax",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "patching_rect": [ 200.0, 475.0, 40.0, 22.0 ],
                    "outlettype": [ "", "", "" ],
                    "text": "peak"
                }
            },
            {
                "box": {
                    "id": "aazl",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 260.0, 475.0, 75.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "zl.stream 20"
                }
            },
            {
                "box": {
                    "id": "aamed",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 260.0, 505.0, 60.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "zl.median"
                }
            },
            {
                "box": {
                    "id": "aan0",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 540.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "aal0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 565.0, 55.0, 20.0 ],
                    "text": "last"
                }
            },
            {
                "box": {
                    "id": "aan1",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 80.0, 540.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "aal1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 80.0, 565.0, 55.0, 20.0 ],
                    "text": "mean"
                }
            },
            {
                "box": {
                    "id": "aan2",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 140.0, 540.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "aal2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 140.0, 565.0, 55.0, 20.0 ],
                    "text": "min"
                }
            },
            {
                "box": {
                    "id": "aan3",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 200.0, 540.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "aal3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 565.0, 55.0, 20.0 ],
                    "text": "max"
                }
            },
            {
                "box": {
                    "id": "aan4",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 260.0, 540.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "aal4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 260.0, 565.0, 55.0, 20.0 ],
                    "text": "median"
                }
            },
            {
                "box": {
                    "id": "aams",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 320.0, 540.0, 30.0, 20.0 ],
                    "text": "ms"
                }
            },
            {
                "box": {
                    "id": "aaload",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 420.0, 415.0, 60.0, 22.0 ],
                    "outlettype": [ "bang" ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "aaresetb",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 490.0, 415.0, 40.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "reset"
                }
            },
            {
                "box": {
                    "id": "aareset",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "patching_rect": [ 420.0, 445.0, 65.0, 22.0 ],
                    "outlettype": [ "bang", "bang", "bang", "bang" ],
                    "text": "t b b b b"
                }
            },
            {
                "box": {
                    "id": "aaclear",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 420.0, 475.0, 40.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "id": "aabig",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 465.0, 475.0, 50.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "100000"
                }
            },
            {
                "box": {
                    "id": "aazero",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 520.0, 475.0, 25.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "aazlc",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 550.0, 475.0, 50.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "zlclear"
                }
            },
            {
                "box": {
                    "id": "cb",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 610.0, 300.0, 20.0 ],
                    "text": "B  ·  MAX → PHONE → MAX  (note 61)",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "btog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 540.0, 610.0, 22.0, 22.0 ],
                    "outlettype": [ "int" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "cbauto",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 570.0, 610.0, 90.0, 20.0 ],
                    "text": "every second"
                }
            },
            {
                "box": {
                    "id": "bmetro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 540.0, 640.0, 70.0, 22.0 ],
                    "outlettype": [ "bang" ],
                    "text": "metro 1000"
                }
            },
            {
                "box": {
                    "id": "bt",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 540.0, 670.0, 40.0, 22.0 ],
                    "outlettype": [ "bang", "bang" ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "bnote",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 380.0, 700.0, 115.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "144 61 100 128 61 0"
                }
            },
            {
                "box": {
                    "id": "bmidi",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [ 20.0, 640.0, 230.0, 22.0 ],
                    "outlettype": [ "", "", "" ],
                    "text": "mqtt.midi latency @receive remote/+/midi"
                }
            },
            {
                "box": {
                    "id": "bsend",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 270.0, 640.0, 185.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "send remote/phone-xxxx/midi/in"
                }
            },
            {
                "box": {
                    "id": "cbsend",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 270.0, 665.0, 240.0, 20.0 ],
                    "text": "use the ID in the phone app, then click"
                }
            },
            {
                "box": {
                    "id": "bparse",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 8,
                    "patching_rect": [ 20.0, 670.0, 65.0, 22.0 ],
                    "outlettype": [ "", "", "", "", "", "", "", "" ],
                    "text": "midiparse"
                }
            },
            {
                "box": {
                    "id": "broute",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 700.0, 55.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "route 61"
                }
            },
            {
                "box": {
                    "id": "bsel",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 730.0, 40.0, 22.0 ],
                    "outlettype": [ "bang", "" ],
                    "text": "sel 0"
                }
            },
            {
                "box": {
                    "id": "bstop",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 60.0, 760.0, 30.0, 22.0 ],
                    "outlettype": [ "bang" ],
                    "text": "t b"
                }
            },
            {
                "box": {
                    "id": "bbtimer",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 795.0, 45.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "timer"
                }
            },
            {
                "box": {
                    "id": "bbt",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [ 20.0, 825.0, 90.0, 22.0 ],
                    "outlettype": [ "", "", "", "", "" ],
                    "text": "t f f f f f"
                }
            },
            {
                "box": {
                    "id": "bbmean",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 80.0, 855.0, 40.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "mean"
                }
            },
            {
                "box": {
                    "id": "bbmin",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "patching_rect": [ 140.0, 855.0, 45.0, 22.0 ],
                    "outlettype": [ "", "", "" ],
                    "text": "trough"
                }
            },
            {
                "box": {
                    "id": "bbmax",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "patching_rect": [ 200.0, 855.0, 40.0, 22.0 ],
                    "outlettype": [ "", "", "" ],
                    "text": "peak"
                }
            },
            {
                "box": {
                    "id": "bbzl",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 260.0, 855.0, 75.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "zl.stream 20"
                }
            },
            {
                "box": {
                    "id": "bbmed",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 260.0, 885.0, 60.0, 22.0 ],
                    "outlettype": [ "", "" ],
                    "text": "zl.median"
                }
            },
            {
                "box": {
                    "id": "bbn0",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 20.0, 920.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "bbl0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 945.0, 55.0, 20.0 ],
                    "text": "last"
                }
            },
            {
                "box": {
                    "id": "bbn1",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 80.0, 920.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "bbl1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 80.0, 945.0, 55.0, 20.0 ],
                    "text": "mean"
                }
            },
            {
                "box": {
                    "id": "bbn2",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 140.0, 920.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "bbl2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 140.0, 945.0, 55.0, 20.0 ],
                    "text": "min"
                }
            },
            {
                "box": {
                    "id": "bbn3",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 200.0, 920.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "bbl3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 945.0, 55.0, 20.0 ],
                    "text": "max"
                }
            },
            {
                "box": {
                    "id": "bbn4",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 260.0, 920.0, 50.0, 22.0 ],
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "bbl4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 260.0, 945.0, 55.0, 20.0 ],
                    "text": "median"
                }
            },
            {
                "box": {
                    "id": "bbms",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 320.0, 920.0, 30.0, 20.0 ],
                    "text": "ms"
                }
            },
            {
                "box": {
                    "id": "bbload",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 420.0, 795.0, 60.0, 22.0 ],
                    "outlettype": [ "bang" ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "bbresetb",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 490.0, 795.0, 40.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "reset"
                }
            },
            {
                "box": {
                    "id": "bbreset",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "patching_rect": [ 420.0, 825.0, 65.0, 22.0 ],
                    "outlettype": [ "bang", "bang", "bang", "bang" ],
                    "text": "t b b b b"
                }
            },
            {
                "box": {
                    "id": "bbclear",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 420.0, 855.0, 40.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "id": "bbbig",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 465.0, 855.0, 50.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "100000"
                }
            },
            {
                "box": {
                    "id": "bbzero",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 520.0, 855.0, 25.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "bbzlc",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 550.0, 855.0, 50.0, 22.0 ],
                    "outlettype": [ "" ],
                    "text": "zlclear"
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
                    "destination": [ "arand", 0 ],
                    "source": [ "aload", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "asub", 0 ],
                    "source": [ "arand", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "atopic", 0 ],
                    "source": [ "arand", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "client", 0 ],
                    "source": [ "asub", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "apub", 0 ],
                    "source": [ "atopic", 0 ]
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
                    "destination": [ "at", 0 ],
                    "source": [ "ametro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aatimer", 0 ],
                    "source": [ "at", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "apub", 0 ],
                    "source": [ "at", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "client", 0 ],
                    "source": [ "apub", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aslice", 0 ],
                    "source": [ "client", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aroute", 0 ],
                    "source": [ "aslice", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aatimer", 1 ],
                    "source": [ "aroute", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aat", 0 ],
                    "source": [ "aatimer", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aan0", 0 ],
                    "source": [ "aat", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aamean", 0 ],
                    "source": [ "aat", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aamin", 0 ],
                    "source": [ "aat", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aamax", 0 ],
                    "source": [ "aat", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aazl", 0 ],
                    "source": [ "aat", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aan1", 0 ],
                    "source": [ "aamean", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aan2", 0 ],
                    "source": [ "aamin", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aan3", 0 ],
                    "source": [ "aamax", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aamed", 0 ],
                    "source": [ "aazl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aan4", 0 ],
                    "source": [ "aamed", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aareset", 0 ],
                    "source": [ "aaload", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aareset", 0 ],
                    "source": [ "aaresetb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aaclear", 0 ],
                    "source": [ "aareset", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aabig", 0 ],
                    "source": [ "aareset", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aazero", 0 ],
                    "source": [ "aareset", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aazlc", 0 ],
                    "source": [ "aareset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aamean", 0 ],
                    "source": [ "aaclear", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aamin", 1 ],
                    "source": [ "aabig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aamax", 1 ],
                    "source": [ "aazero", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "aazl", 0 ],
                    "source": [ "aazlc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bmidi", 0 ],
                    "source": [ "bsend", 0 ]
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
                    "destination": [ "bt", 0 ],
                    "source": [ "bmetro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbtimer", 0 ],
                    "source": [ "bt", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bnote", 0 ],
                    "source": [ "bt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bmidi", 0 ],
                    "source": [ "bnote", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bparse", 0 ],
                    "source": [ "bmidi", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "broute", 0 ],
                    "source": [ "bparse", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bsel", 0 ],
                    "source": [ "broute", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bstop", 0 ],
                    "source": [ "bsel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbtimer", 1 ],
                    "source": [ "bstop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbt", 0 ],
                    "source": [ "bbtimer", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbn0", 0 ],
                    "source": [ "bbt", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbmean", 0 ],
                    "source": [ "bbt", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbmin", 0 ],
                    "source": [ "bbt", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbmax", 0 ],
                    "source": [ "bbt", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbzl", 0 ],
                    "source": [ "bbt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbn1", 0 ],
                    "source": [ "bbmean", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbn2", 0 ],
                    "source": [ "bbmin", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbn3", 0 ],
                    "source": [ "bbmax", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbmed", 0 ],
                    "source": [ "bbzl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbn4", 0 ],
                    "source": [ "bbmed", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbreset", 0 ],
                    "source": [ "bbload", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbreset", 0 ],
                    "source": [ "bbresetb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbclear", 0 ],
                    "source": [ "bbreset", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbbig", 0 ],
                    "source": [ "bbreset", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbzero", 0 ],
                    "source": [ "bbreset", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbzlc", 0 ],
                    "source": [ "bbreset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbmean", 0 ],
                    "source": [ "bbclear", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbmin", 1 ],
                    "source": [ "bbbig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbmax", 1 ],
                    "source": [ "bbzero", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbzl", 0 ],
                    "source": [ "bbzlc", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}