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
        "rect": [ 95.0, 91.0, 980.0, 807.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 91.0, 20.0 ],
                    "text": "ROUND TRIPS"
                }
            },
            {
                "box": {
                    "id": "setup",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 589.0, 47.0 ],
                    "text": "A: Max → broker → Max, a message on a topic of its own.\nB: Remote → broker → Remote, the Remote's Latency input. Remote: prefix remote, Round trip on, Connect.\nA + B ≈ Max → broker → remote → broker → Max."
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
                    "patching_rect": [ 20.0, 125.0, 124.0, 22.0 ],
                    "text": "mqtt.client round-trips"
                }
            },
            {
                "box": {
                    "id": "rstatus",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 199.0, 125.0, 71.0, 22.0 ],
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
                    "fontface": 1,
                    "id": "ca",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 200.0, 177.0, 20.0 ],
                    "text": "A  ·  MAX → BROKER → MAX"
                }
            },
            {
                "box": {
                    "id": "arand",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 255.0, 99.0, 22.0 ],
                    "text": "random 1000000"
                }
            },
            {
                "box": {
                    "id": "asub",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 285.0, 283.0, 22.0 ],
                    "text": "sprintf subscribe mqtt-max-example/round-trips/%ld"
                }
            },
            {
                "box": {
                    "id": "atopic",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 285.0, 315.0, 22.0 ],
                    "text": "sprintf set publish mqtt-max-example/round-trips/%ld ping"
                }
            },
            {
                "box": {
                    "id": "apub",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 315.0, 279.0, 22.0 ],
                    "text": "publish mqtt-max-example/round-trips/617618 ping"
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
                    "patching_rect": [ 840.0, 225.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "cauto",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 870.0, 225.0, 80.0, 20.0 ],
                    "text": "every second"
                }
            },
            {
                "box": {
                    "id": "ametro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 840.0, 255.0, 69.0, 22.0 ],
                    "text": "metro 1000"
                }
            },
            {
                "box": {
                    "id": "at",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 840.0, 285.0, 32.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "aslice",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 350.0, 55.0, 22.0 ],
                    "text": "zl.slice 1"
                }
            },
            {
                "box": {
                    "id": "aroute",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 380.0, 62.0, 22.0 ],
                    "text": "route ping"
                }
            },
            {
                "box": {
                    "id": "aatimer",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "float", "" ],
                    "patching_rect": [ 20.0, 415.0, 35.0, 22.0 ],
                    "text": "timer"
                }
            },
            {
                "box": {
                    "id": "aat",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "float", "float", "float", "float", "float" ],
                    "patching_rect": [ 20.0, 445.0, 61.0, 22.0 ],
                    "text": "t f f f f f"
                }
            },
            {
                "box": {
                    "id": "aamean",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "int" ],
                    "patching_rect": [ 80.0, 475.0, 39.0, 22.0 ],
                    "text": "mean"
                }
            },
            {
                "box": {
                    "id": "aamin",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 140.0, 475.0, 43.0, 22.0 ],
                    "text": "trough"
                }
            },
            {
                "box": {
                    "id": "aamax",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 200.0, 475.0, 40.0, 22.0 ],
                    "text": "peak"
                }
            },
            {
                "box": {
                    "id": "aazl",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 260.0, 475.0, 74.0, 22.0 ],
                    "text": "zl.stream 20"
                }
            },
            {
                "box": {
                    "id": "aamed",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 260.0, 505.0, 60.0, 22.0 ],
                    "text": "zl.median"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "aan0",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 540.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "aal0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 565.0, 27.0, 20.0 ],
                    "text": "last"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "aan1",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 80.0, 540.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "aal1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 80.0, 565.0, 39.0, 20.0 ],
                    "text": "mean"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "aan2",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 140.0, 540.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "aal2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 140.0, 565.0, 28.0, 20.0 ],
                    "text": "min"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "aan3",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 200.0, 540.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "aal3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 565.0, 31.0, 20.0 ],
                    "text": "max"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "aan4",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 260.0, 540.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "aal4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 260.0, 565.0, 48.0, 20.0 ],
                    "text": "median"
                }
            },
            {
                "box": {
                    "id": "aams",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 320.0, 540.0, 24.0, 20.0 ],
                    "text": "ms"
                }
            },
            {
                "box": {
                    "id": "aaload",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 420.0, 415.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "aaresetb",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 490.0, 415.0, 35.0, 22.0 ],
                    "text": "reset"
                }
            },
            {
                "box": {
                    "id": "aareset",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "bang", "bang", "bang", "bang" ],
                    "patching_rect": [ 420.0, 445.0, 52.0, 22.0 ],
                    "text": "t b b b b"
                }
            },
            {
                "box": {
                    "id": "aaclear",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 420.0, 475.0, 35.0, 22.0 ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "id": "aabig",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 465.0, 475.0, 49.0, 22.0 ],
                    "text": "100000"
                }
            },
            {
                "box": {
                    "id": "aazero",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 520.0, 475.0, 29.5, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "aazlc",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 550.0, 475.0, 43.0, 22.0 ],
                    "text": "zlclear"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "cb",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 610.0, 227.0, 20.0 ],
                    "text": "B  ·  REMOTE → BROKER → REMOTE"
                }
            },
            {
                "box": {
                    "id": "bbt",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "float", "float", "float", "float", "float" ],
                    "patching_rect": [ 20.0, 765.0, 61.0, 22.0 ],
                    "text": "t f f f f f"
                }
            },
            {
                "box": {
                    "id": "bbmean",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "int" ],
                    "patching_rect": [ 80.0, 795.0, 39.0, 22.0 ],
                    "text": "mean"
                }
            },
            {
                "box": {
                    "id": "bbmin",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 140.0, 795.0, 43.0, 22.0 ],
                    "text": "trough"
                }
            },
            {
                "box": {
                    "id": "bbmax",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 200.0, 795.0, 40.0, 22.0 ],
                    "text": "peak"
                }
            },
            {
                "box": {
                    "id": "bbzl",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 260.0, 795.0, 74.0, 22.0 ],
                    "text": "zl.stream 20"
                }
            },
            {
                "box": {
                    "id": "bbmed",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 260.0, 825.0, 60.0, 22.0 ],
                    "text": "zl.median"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "bbn0",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 860.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "bbl0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 885.0, 27.0, 20.0 ],
                    "text": "last"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "bbn1",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 80.0, 860.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "bbl1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 80.0, 885.0, 39.0, 20.0 ],
                    "text": "mean"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "bbn2",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 140.0, 860.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "bbl2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 140.0, 885.0, 28.0, 20.0 ],
                    "text": "min"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "bbn3",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 200.0, 860.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "bbl3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 885.0, 31.0, 20.0 ],
                    "text": "max"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "bbn4",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 260.0, 860.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "bbl4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 260.0, 885.0, 48.0, 20.0 ],
                    "text": "median"
                }
            },
            {
                "box": {
                    "id": "bbms",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 320.0, 860.0, 24.0, 20.0 ],
                    "text": "ms"
                }
            },
            {
                "box": {
                    "id": "bbload",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 420.0, 735.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "bbresetb",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 490.0, 735.0, 35.0, 22.0 ],
                    "text": "reset"
                }
            },
            {
                "box": {
                    "id": "bbreset",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "bang", "bang", "bang", "bang" ],
                    "patching_rect": [ 420.0, 765.0, 52.0, 22.0 ],
                    "text": "t b b b b"
                }
            },
            {
                "box": {
                    "id": "bbclear",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 420.0, 795.0, 35.0, 22.0 ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "id": "bbbig",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 465.0, 795.0, 49.0, 22.0 ],
                    "text": "100000"
                }
            },
            {
                "box": {
                    "id": "bbzero",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 520.0, 795.0, 29.5, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "bbzlc",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 550.0, 795.0, 43.0, 22.0 ],
                    "text": "zlclear"
                }
            },
            {
                "box": {
                    "id": "bctl",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 20.0, 640.0, 277.0, 22.0 ],
                    "text": "mqtt.homie.controller round-trips @domain remote"
                }
            },
            {
                "box": {
                    "id": "bslice",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 675.0, 55.0, 22.0 ],
                    "text": "zl.slice 1"
                }
            },
            {
                "box": {
                    "id": "bnode",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 705.0, 91.0, 22.0 ],
                    "text": "route round-trip"
                }
            },
            {
                "box": {
                    "id": "brtt",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 735.0, 62.0, 22.0 ],
                    "text": "route time"
                }
            },
            {
                "box": {
                    "id": "cbctl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 364.0, 640.0, 337.0, 20.0 ],
                    "text": "values from every Remote: [route <id>] after zl.slice picks one"
                }
            },
            {
                "box": {
                    "id": "cc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 930.0, 334.0, 20.0 ],
                    "text": "A + B  ·  MAX → BROKER → REMOTE → BROKER → MAX"
                }
            },
            {
                "box": {
                    "id": "csum",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 20.0, 960.0, 29.5, 22.0 ],
                    "text": "+ 0."
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "csumn",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 990.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cms",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 80.0, 990.0, 184.0, 20.0 ],
                    "text": "ms, from the last A and the last B"
                }
            },
            {
                "box": {
                    "id": "aload",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 20.0, 225.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "aamin", 1 ],
                    "source": [ "aabig", 0 ]
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
                    "destination": [ "aareset", 0 ],
                    "source": [ "aaload", 0 ]
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
                    "destination": [ "aan1", 0 ],
                    "source": [ "aamean", 0 ]
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
                    "destination": [ "aan2", 0 ],
                    "source": [ "aamin", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "csum", 1 ],
                    "source": [ "aan0", 0 ]
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
                    "destination": [ "aaclear", 0 ],
                    "source": [ "aareset", 3 ]
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
                    "destination": [ "aareset", 0 ],
                    "source": [ "aaresetb", 0 ]
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
                    "destination": [ "aan0", 0 ],
                    "source": [ "aat", 4 ]
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
                    "destination": [ "aat", 0 ],
                    "source": [ "aatimer", 0 ]
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
                    "destination": [ "aamed", 0 ],
                    "source": [ "aazl", 0 ]
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
                    "destination": [ "arand", 0 ],
                    "source": [ "aload", 0 ]
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
                    "destination": [ "client", 0 ],
                    "source": [ "apub", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "asub", 0 ],
                    "order": 1,
                    "source": [ "arand", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "atopic", 0 ],
                    "order": 0,
                    "source": [ "arand", 0 ]
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
                    "destination": [ "aroute", 0 ],
                    "source": [ "aslice", 1 ]
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
                    "destination": [ "ametro", 0 ],
                    "source": [ "atog", 0 ]
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
                    "destination": [ "bbmin", 1 ],
                    "source": [ "bbbig", 0 ]
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
                    "destination": [ "bbreset", 0 ],
                    "source": [ "bbload", 0 ]
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
                    "destination": [ "bbn1", 0 ],
                    "source": [ "bbmean", 0 ]
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
                    "destination": [ "bbn2", 0 ],
                    "source": [ "bbmin", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "csum", 0 ],
                    "source": [ "bbn0", 0 ]
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
                    "destination": [ "bbclear", 0 ],
                    "source": [ "bbreset", 3 ]
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
                    "destination": [ "bbreset", 0 ],
                    "source": [ "bbresetb", 0 ]
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
                    "destination": [ "bbn0", 0 ],
                    "source": [ "bbt", 4 ]
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
                    "destination": [ "bbmax", 1 ],
                    "source": [ "bbzero", 0 ]
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
                    "destination": [ "bbzl", 0 ],
                    "source": [ "bbzlc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bslice", 0 ],
                    "source": [ "bctl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "brtt", 0 ],
                    "source": [ "bnode", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bbt", 0 ],
                    "source": [ "brtt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bnode", 0 ],
                    "source": [ "bslice", 1 ]
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
                    "destination": [ "csumn", 0 ],
                    "source": [ "csum", 0 ]
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
                    "destination": [ "status", 0 ],
                    "source": [ "pstatus", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pstatus", 0 ],
                    "source": [ "rstatus", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}