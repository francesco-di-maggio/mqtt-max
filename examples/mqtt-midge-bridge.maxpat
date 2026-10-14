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
        "rect": [ 488.0, 259.0, 903.0, 586.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 98.0, 20.0 ],
                    "text": "MIDGE BRIDGE"
                }
            },
            {
                "box": {
                    "id": "setup",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 782.0, 33.0 ],
                    "text": "MIDI with midge and mqtt-midi (Grantler Instruments): one topic per value, a raw byte as payload. midge connects them to a DAW or MIDI device.\nmidge: the same broker, prefix remote. Channels 1-16 in the topic. Note off is note on with velocity 0. Not yet tested with midge."
                }
            },
            {
                "box": {
                    "id": "conn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 78.0, 261.0, 22.0 ],
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
                    "patching_rect": [ 391.0, 78.0, 66.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 113.0, 137.0, 22.0 ],
                    "text": "mqtt.client midge-bridge"
                }
            },
            {
                "box": {
                    "id": "rstatus",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 217.0, 113.0, 71.0, 22.0 ],
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
                    "patching_rect": [ 217.0, 143.0, 72.0, 22.0 ],
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
                    "patching_rect": [ 316.0, 143.0, 79.0, 22.0 ],
                    "text": ""
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "ca",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 188.0, 203.0, 20.0 ],
                    "text": "A  ·  MAX → MIDGE  (remote/in/…)"
                }
            },
            {
                "box": {
                    "id": "cc",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 218.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "ccc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 75.0, 218.0, 132.0, 20.0 ],
                    "text": "CC 7, channel 1: 0-127"
                }
            },
            {
                "box": {
                    "id": "ccsend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 248.0, 305.0, 22.0 ],
                    "text": "mqtt.send midge-bridge remote/in/cc/1/7 @format bytes"
                }
            },
            {
                "box": {
                    "id": "keys",
                    "maxclass": "kslider",
                    "mode": 2,
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 293.0, 336.0, 53.0 ]
                }
            },
            {
                "box": {
                    "id": "pk",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 358.0, 54.0, 22.0 ],
                    "text": "pack 0 0"
                }
            },
            {
                "box": {
                    "id": "tl",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 388.0, 29.5, 22.0 ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "pitch",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 120.0, 418.0, 47.0, 22.0 ],
                    "text": "zl.nth 1"
                }
            },
            {
                "box": {
                    "id": "ptopic",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 120.0, 448.0, 197.0, 22.0 ],
                    "text": "sprintf topic remote/in/noteon/1/%ld"
                }
            },
            {
                "box": {
                    "id": "vel",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 478.0, 47.0, 22.0 ],
                    "text": "zl.nth 2"
                }
            },
            {
                "box": {
                    "id": "nsend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 508.0, 216.0, 22.0 ],
                    "text": "mqtt.send midge-bridge @format bytes"
                }
            },
            {
                "box": {
                    "id": "perr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 538.0, 105.0, 22.0 ],
                    "text": "print midge-bridge"
                }
            },
            {
                "box": {
                    "id": "cnote",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 246.0, 509.0, 170.0, 20.0 ],
                    "text": "the topic first, then the velocity"
                }
            },
            {
                "box": {
                    "id": "ckeys",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 271.0, 247.0, 20.0 ],
                    "text": "keys: click for note on, click again for note off"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "cb",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 480.0, 188.0, 211.0, 20.0 ],
                    "text": "B  ·  MIDGE → MAX  (remote/out/…)"
                }
            },
            {
                "box": {
                    "id": "recv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 480.0, 218.0, 299.0, 22.0 ],
                    "text": "mqtt.receive midge-bridge remote/out/# @format bytes"
                }
            },
            {
                "box": {
                    "id": "slice",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 480.0, 248.0, 55.0, 22.0 ],
                    "text": "zl.slice 1"
                }
            },
            {
                "box": {
                    "id": "split",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 480.0, 278.0, 143.0, 22.0 ],
                    "text": "fromsymbol @separator /"
                }
            },
            {
                "box": {
                    "id": "ptop",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 480.0, 308.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "top",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 480.0, 338.0, 260.0, 22.0 ],
                    "text": ""
                }
            },
            {
                "box": {
                    "id": "ctop",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 750.0, 338.0, 127.0, 20.0 ],
                    "text": "type, channel, number"
                }
            },
            {
                "box": {
                    "id": "pval",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 660.0, 278.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "val",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 660.0, 308.0, 80.0, 22.0 ],
                    "text": ""
                }
            },
            {
                "box": {
                    "id": "cval",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 750.0, 308.0, 37.0, 20.0 ],
                    "text": "value"
                }
            },
            {
                "box": {
                    "id": "cdaw",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 480.0, 378.0, 284.0, 20.0 ],
                    "text": "In the DAW: a MIDI track that sends to midge's port."
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "ccsend", 0 ],
                    "source": [ "cc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "perr", 0 ],
                    "source": [ "ccsend", 0 ]
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
                    "destination": [ "client", 0 ],
                    "source": [ "disc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk", 1 ],
                    "source": [ "keys", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk", 0 ],
                    "source": [ "keys", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "perr", 0 ],
                    "source": [ "nsend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ptopic", 0 ],
                    "source": [ "pitch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tl", 0 ],
                    "source": [ "pk", 0 ]
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
                    "destination": [ "top", 0 ],
                    "source": [ "ptop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "nsend", 0 ],
                    "source": [ "ptopic", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "val", 0 ],
                    "source": [ "pval", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "slice", 0 ],
                    "source": [ "recv", 0 ]
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
                    "destination": [ "pval", 0 ],
                    "source": [ "slice", 1 ]
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
                    "destination": [ "ptop", 0 ],
                    "source": [ "split", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pitch", 0 ],
                    "source": [ "tl", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "vel", 0 ],
                    "source": [ "tl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "nsend", 0 ],
                    "source": [ "vel", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}