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
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 500.0, 20.0 ],
                    "text": "MIDI TEST  (phone <-> MQTT <-> MIDI port)",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "info",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 540.0, 33.0 ],
                    "text": "Needs a bridge: mqtt-bridge.maxpat (port mqtt-max) or Midge (port midge).\nPhone: francesco-di-maggio.github.io/mqtt-max/phone/ -> prefix remote -> Connect.",
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "cport",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 85.0, 100.0, 20.0 ],
                    "text": "input/output port:"
                }
            },
            {
                "box": {
                    "id": "pmax",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 125.0, 85.0, 95.0, 22.0 ],
                    "text": "port mqtt-max"
                }
            },
            {
                "box": {
                    "id": "pmidge",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 230.0, 85.0, 80.0, 22.0 ],
                    "text": "port midge"
                }
            },
            {
                "box": {
                    "id": "c1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 130.0, 250.0, 20.0 ],
                    "text": "IN  (phone tilt / slider / pad)",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "ctl",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 20.0, 155.0, 95.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 215.0, 55.0, 20.0 ],
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
                    "patching_rect": [ 75.0, 215.0, 55.0, 20.0 ],
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
                    "patching_rect": [ 130.0, 215.0, 55.0, 20.0 ],
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
                    "patching_rect": [ 300.0, 155.0, 105.0, 22.0 ],
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
                    "patching_rect": [ 300.0, 215.0, 55.0, 20.0 ],
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
                    "patching_rect": [ 355.0, 215.0, 55.0, 20.0 ],
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
                    "patching_rect": [ 410.0, 215.0, 55.0, 20.0 ],
                    "text": "channel"
                }
            },
            {
                "box": {
                    "id": "c2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 260.0, 250.0, 20.0 ],
                    "text": "OUT  (-> remote/out/...)",
                    "fontface": 1
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
                    "outlettype": [],
                    "patching_rect": [ 20.0, 320.0, 130.0, 22.0 ],
                    "text": "ctlout mqtt-max 7 1"
                }
            },
            {
                "box": {
                    "id": "ccto",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 170.0, 285.0, 110.0, 20.0 ],
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
                    "patching_rect": [ 330.0, 285.0, 30.0, 22.0 ],
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
                    "patching_rect": [ 300.0, 320.0, 110.0, 22.0 ],
                    "text": "makenote 100 200"
                }
            },
            {
                "box": {
                    "id": "ono",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [ 300.0, 355.0, 120.0, 22.0 ],
                    "text": "noteout mqtt-max 1"
                }
            },
            {
                "box": {
                    "id": "cono",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 370.0, 285.0, 190.0, 33.0 ],
                    "text": "note 60; with Echo notes on,\nthe phone sends it back to IN",
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "cloop",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 400.0, 540.0, 20.0 ],
                    "text": "Never patch an IN object straight to an OUT object on the same port: endless loop over MQTT."
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": [ "ctl", 0 ],
                    "destination": [ "cv0", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "ctl", 1 ],
                    "destination": [ "cv1", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "ctl", 2 ],
                    "destination": [ "cv2", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "nin", 0 ],
                    "destination": [ "nv0", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "nin", 1 ],
                    "destination": [ "nv1", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "nin", 2 ],
                    "destination": [ "nv2", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "pmax", 0 ],
                    "destination": [ "ctl", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "pmidge", 0 ],
                    "destination": [ "ctl", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "pmax", 0 ],
                    "destination": [ "nin", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "pmidge", 0 ],
                    "destination": [ "nin", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "pmax", 0 ],
                    "destination": [ "cto", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "pmidge", 0 ],
                    "destination": [ "cto", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "pmax", 0 ],
                    "destination": [ "ono", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "pmidge", 0 ],
                    "destination": [ "ono", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "osl", 0 ],
                    "destination": [ "cto", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "obtn", 0 ],
                    "destination": [ "onote", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "onote", 0 ],
                    "destination": [ "omk", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "omk", 0 ],
                    "destination": [ "ono", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "omk", 1 ],
                    "destination": [ "ono", 1 ]
                }
            }
        ]
    }
}