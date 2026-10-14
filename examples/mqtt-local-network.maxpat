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
        "rect": [ 134.0, 163.0, 830.0, 700.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 115.0, 20.0 ],
                    "text": "LOCAL NETWORK"
                }
            },
            {
                "box": {
                    "id": "setup",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 40.0, 611.0, 47.0 ],
                    "text": "A broker on this computer: devices on the same network connect without internet.\nMicrocontrollers and other computers: mqtt://<address>:1883. Web pages served over http: ws://<address>:9001.\nPages served over https, such as the online Remote, need wss:// with a certificate the browser trusts."
                }
            },
            {
                "box": {
                    "id": "broker",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 142.0, 216.0, 22.0 ],
                    "text": "mqtt.broker @port 1883 @wsport 9001"
                }
            },
            {
                "box": {
                    "id": "rb",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 20.0, 177.0, 146.0, 22.0 ],
                    "text": "route status address error"
                }
            },
            {
                "box": {
                    "id": "pb0",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 207.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "mb0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 237.0, 157.0, 22.0 ],
                    "text": ""
                }
            },
            {
                "box": {
                    "id": "cb0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 185.0, 237.0, 41.0, 20.0 ],
                    "text": "status"
                }
            },
            {
                "box": {
                    "id": "pb1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 272.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "mb1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 302.0, 140.0, 22.0 ],
                    "text": ""
                }
            },
            {
                "box": {
                    "id": "cb1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 170.0, 302.0, 156.0, 20.0 ],
                    "text": "addresses for other devices"
                }
            },
            {
                "box": {
                    "id": "perr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 380.0, 207.0, 97.0, 22.0 ],
                    "text": "print mqtt-broker"
                }
            },
            {
                "box": {
                    "id": "pcl",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 380.0, 177.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "mcl",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 380.0, 237.0, 300.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "ccl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 690.0, 237.0, 75.0, 20.0 ],
                    "text": "client events"
                }
            },
            {
                "box": {
                    "id": "cfw",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 337.0, 329.0, 20.0 ],
                    "text": "macOS firewall on: allow incoming connections when asked."
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "cmax",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 387.0, 177.0, 20.0 ],
                    "text": "MAX ON THE SAME BROKER"
                }
            },
            {
                "box": {
                    "id": "conn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 417.0, 165.0, 22.0 ],
                    "text": "connect mqtt://localhost:1883"
                }
            },
            {
                "box": {
                    "id": "client",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 452.0, 137.0, 22.0 ],
                    "text": "mqtt.client local-network"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "v",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 497.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 527.0, 344.0, 22.0 ],
                    "text": "mqtt.send local-network mqtt-max-example/local-network/value"
                }
            },
            {
                "box": {
                    "id": "recv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 562.0, 335.0, 22.0 ],
                    "text": "mqtt.receive local-network mqtt-max-example/local-network/#"
                }
            },
            {
                "box": {
                    "id": "prv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 592.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "mrv",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 622.0, 360.0, 22.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "pcl", 0 ],
                    "source": [ "broker", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rb", 0 ],
                    "source": [ "broker", 1 ]
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
                    "destination": [ "mb0", 0 ],
                    "source": [ "pb0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mb1", 0 ],
                    "source": [ "pb1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mcl", 0 ],
                    "source": [ "pcl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mrv", 0 ],
                    "source": [ "prv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pb0", 0 ],
                    "source": [ "rb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pb1", 0 ],
                    "source": [ "rb", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "perr", 0 ],
                    "source": [ "rb", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "prv", 0 ],
                    "source": [ "recv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "send", 0 ],
                    "source": [ "v", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}