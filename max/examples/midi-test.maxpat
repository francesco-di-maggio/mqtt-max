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
        "rect": [ 120.0, 120.0, 600.0, 470.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 254.0, 20.0 ],
                    "text": "MIDI TEST  (phone <-> MQTT <-> MIDI port)"
                }
            },
            {
                "box": {
                    "id": "info",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 454.0, 33.0 ],
                    "text": "Needs mqtt-bridge.maxpat open: it creates the MIDI port mqtt-max.\nPhone: francesco-di-maggio.github.io/mqtt-max/phone/ -> prefix remote -> Connect."
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "c1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 130.0, 163.0, 20.0 ],
                    "text": "IN  (phone tilt / slider / pad)"
                }
            },
            {
                "box": {
                    "id": "ctl",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 20.0, 155.0, 83.0, 22.0 ],
                    "text": "ctlin mqtt-max"
                }
            },
            {
                "box": {
                    "id": "cv0",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 190.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "ccv0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 215.0, 37.0, 20.0 ],
                    "text": "value"
                }
            },
            {
                "box": {
                    "id": "cv1",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 75.0, 190.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "ccv1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 75.0, 215.0, 26.0, 20.0 ],
                    "text": "CC"
                }
            },
            {
                "box": {
                    "id": "cv2",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 130.0, 190.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "ccv2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 130.0, 215.0, 51.0, 20.0 ],
                    "text": "channel"
                }
            },
            {
                "box": {
                    "id": "nin",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 300.0, 155.0, 95.0, 22.0 ],
                    "text": "notein mqtt-max"
                }
            },
            {
                "box": {
                    "id": "nv0",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 300.0, 190.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cnv0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 300.0, 215.0, 34.0, 20.0 ],
                    "text": "pitch"
                }
            },
            {
                "box": {
                    "id": "nv1",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 355.0, 190.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cnv1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 355.0, 215.0, 49.0, 20.0 ],
                    "text": "velocity"
                }
            },
            {
                "box": {
                    "id": "nv2",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 410.0, 190.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cnv2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 410.0, 215.0, 51.0, 20.0 ],
                    "text": "channel"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "c2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 260.0, 138.0, 20.0 ],
                    "text": "OUT  (-> remote/out/...)"
                }
            },
            {
                "box": {
                    "id": "osl",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 285.0, 140.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "cto",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 320.0, 111.0, 22.0 ],
                    "text": "ctlout mqtt-max 7 1"
                }
            },
            {
                "box": {
                    "id": "ccto",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 170.0, 285.0, 95.0, 20.0 ],
                    "text": "CC 7, channel 1"
                }
            },
            {
                "box": {
                    "id": "obtn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 300.0, 285.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "onote",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 330.0, 285.0, 29.5, 22.0 ],
                    "text": "60"
                }
            },
            {
                "box": {
                    "id": "omk",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "float", "float" ],
                    "patching_rect": [ 300.0, 320.0, 108.0, 22.0 ],
                    "text": "makenote 100 200"
                }
            },
            {
                "box": {
                    "id": "ono",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 300.0, 355.0, 112.0, 22.0 ],
                    "text": "noteout mqtt-max 1"
                }
            },
            {
                "box": {
                    "id": "cono",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 370.0, 285.0, 164.0, 33.0 ],
                    "text": "note 60; with Echo notes on,\nthe phone sends it back to IN"
                }
            },
            {
                "box": {
                    "id": "cloop",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 400.0, 511.0, 20.0 ],
                    "text": "Never patch an IN object straight to an OUT object on the same port: endless loop over MQTT."
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "cv0", 0 ],
                    "source": [ "ctl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "cv1", 0 ],
                    "source": [ "ctl", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "cv2", 0 ],
                    "source": [ "ctl", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "nv0", 0 ],
                    "source": [ "nin", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "nv1", 0 ],
                    "source": [ "nin", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "nv2", 0 ],
                    "source": [ "nin", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "onote", 0 ],
                    "source": [ "obtn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ono", 1 ],
                    "source": [ "omk", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ono", 0 ],
                    "source": [ "omk", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "omk", 0 ],
                    "source": [ "onote", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "cto", 0 ],
                    "source": [ "osl", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}