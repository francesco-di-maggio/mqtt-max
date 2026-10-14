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
        "rect": [ 100.0, 100.0, 827.0, 576.0 ],
        "showrootpatcherontab": 0,
        "showontab": 0,
        "boxes": [
            {
                "box": {
                    "border": 0,
                    "filename": "helpname.js",
                    "id": "helpname",
                    "ignoreclick": 1,
                    "jsarguments": [ "mqtt.broker" ],
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 10.0, 10.0, 300.0, 58.0 ]
                }
            },
            {
                "box": {
                    "id": "starter",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 10.0, 75.0, 180.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "helpstarter.js",
                        "parameter_enable": 0
                    },
                    "text": "js helpstarter.js mqtt.broker"
                }
            },
            {
                "box": {
                    "id": "tab-basic_tab",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 100.0, 126.0, 827.0, 550.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-2",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 559.0, 195.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpdetails.js",
                                    "id": "details",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "mqtt.broker" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 779.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 769.0, 20.0 ],
                                    "text": "Broker on this computer, port 1883. Devices connect to one of its addresses, Max to localhost."
                                }
                            },
                            {
                                "box": {
                                    "id": "broker",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 20.0, 195.0, 135.0, 22.0 ],
                                    "text": "mqtt.broker @port 1883"
                                }
                            },
                            {
                                "box": {
                                    "id": "pre1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 230.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "dontreplace": 1,
                                    "id": "disp2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 260.0, 354, 22.0 ],
                                    "text": "subscribe mqttjs_54e489a0 mqtt-max-help/broker/# 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "c3",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 222.0, 261.0, 75.0, 20.0 ],
                                    "text": "client events"
                                }
                            },
                            {
                                "box": {
                                    "id": "rb",
                                    "maxclass": "newobj",
                                    "numinlets": 5,
                                    "numoutlets": 5,
                                    "outlettype": [ "", "", "", "", "" ],
                                    "patching_rect": [ 20.0, 300.0, 183.0, 22.0 ],
                                    "text": "route status address clients error"
                                }
                            },
                            {
                                "box": {
                                    "id": "pb0",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 330.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "dontreplace": 1,
                                    "id": "mb0",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 355.0, 109.0, 22.0 ],
                                    "text": "listening mqtt 1883"
                                }
                            },
                            {
                                "box": {
                                    "id": "cb0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 131.0, 356.0, 41.0, 20.0 ],
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
                                    "patching_rect": [ 20.0, 385.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "dontreplace": 1,
                                    "id": "mb1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 410.0, 155.0, 22.0 ],
                                    "text": "mqtt://192.168.178.71:1883"
                                }
                            },
                            {
                                "box": {
                                    "id": "cb1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 180.0, 411.0, 51.0, 20.0 ],
                                    "text": "address"
                                }
                            },
                            {
                                "box": {
                                    "id": "pb2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 440.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "dontreplace": 1,
                                    "id": "mb2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 465.0, 29.5, 22.0 ],
                                    "text": "1"
                                }
                            },
                            {
                                "box": {
                                    "id": "cb2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 49.0, 466.0, 43.0, 20.0 ],
                                    "text": "clients"
                                }
                            },
                            {
                                "box": {
                                    "id": "pberr",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 230.0, 300.0, 97.0, 22.0 ],
                                    "text": "print mqtt-broker"
                                }
                            },
                            {
                                "box": {
                                    "id": "conn",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 195.0, 165.0, 22.0 ],
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
                                    "patching_rect": [ 380.0, 265.0, 63.0, 22.0 ],
                                    "text": "mqtt.client"
                                }
                            },
                            {
                                "box": {
                                    "id": "m4",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 225.0, 232, 22.0 ],
                                    "text": "subscribe mqtt-max-help/broker/#"
                                }
                            },
                            {
                                "box": {
                                    "id": "m5",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 559.0, 225.0, 266, 22.0 ],
                                    "text": "publish mqtt-max-help/broker/hello $1"
                                }
                            },
                            {
                                "box": {
                                    "id": "pre6",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 300.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "dontreplace": 1,
                                    "id": "disp7",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 330.0, 232, 22.0 ],
                                    "text": "mqtt-max-help/broker/hello 0.053"
                                }
                            },
                            {
                                "box": {
                                    "id": "c8",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 497.0, 331.0, 54.0, 20.0 ],
                                    "text": "received"
                                }
                            },
                            {
                                "box": {
                                    "id": "m9",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 19.25, 165.0, 31.0, 22.0 ],
                                    "text": "stop"
                                }
                            },
                            {
                                "box": {
                                    "id": "m10",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 64.25, 165.0, 32.0, 22.0 ],
                                    "text": "start"
                                }
                            },
                            {
                                "box": {
                                    "id": "cfw",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 515.0, 625.0, 20.0 ],
                                    "text": "macOS firewall on: allow incoming connections when asked."
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "pre1", 0 ],
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
                                    "destination": [ "pre6", 0 ],
                                    "source": [ "client", 0 ]
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
                                    "destination": [ "broker", 0 ],
                                    "source": [ "m10", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "m4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "m5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "broker", 0 ],
                                    "source": [ "m9", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "m5", 0 ],
                                    "source": [ "obj-2", 0 ]
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
                                    "destination": [ "mb2", 0 ],
                                    "source": [ "pb2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "disp2", 0 ],
                                    "source": [ "pre1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "disp7", 0 ],
                                    "source": [ "pre6", 0 ]
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
                                    "destination": [ "pb2", 0 ],
                                    "source": [ "rb", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pberr", 0 ],
                                    "source": [ "rb", 3 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 110.0, 120.0, 22.0 ],
                    "text": "p basic",
                    "varname": "basic_tab"
                }
            },
            {
                "box": {
                    "id": "tab-basic_tab[1]",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 0.0, 26.0, 827.0, 550.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpdetails.js",
                                    "id": "details",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "mqtt.broker" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 779.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 705.0, 20.0 ],
                                    "text": "One port per listener, 0 = off. ws:// for web pages. mqtts:// and wss:// need a key and certificate."
                                }
                            },
                            {
                                "box": {
                                    "id": "broker",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 20.0, 165.0, 196.0, 22.0 ],
                                    "text": "mqtt.broker @port 0 @wsport 9001"
                                }
                            },
                            {
                                "box": {
                                    "id": "rb",
                                    "maxclass": "newobj",
                                    "numinlets": 5,
                                    "numoutlets": 5,
                                    "outlettype": [ "", "", "", "", "" ],
                                    "patching_rect": [ 20.0, 200.0, 183.0, 22.0 ],
                                    "text": "route status address clients error"
                                }
                            },
                            {
                                "box": {
                                    "id": "pb0",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 230.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "dontreplace": 1,
                                    "id": "mb0",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 255.0, 101.0, 22.0 ],
                                    "text": "listening ws 9001"
                                }
                            },
                            {
                                "box": {
                                    "id": "cb0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 240.0, 255.0, 41.0, 20.0 ],
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
                                    "patching_rect": [ 20.0, 285.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "dontreplace": 1,
                                    "id": "mb1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 310.0, 147.0, 22.0 ],
                                    "text": "ws://192.168.178.71:9001"
                                }
                            },
                            {
                                "box": {
                                    "id": "cb1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 240.0, 310.0, 51.0, 20.0 ],
                                    "text": "address"
                                }
                            },
                            {
                                "box": {
                                    "id": "pb2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 340.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "dontreplace": 1,
                                    "id": "mb2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 365.0, 29.5, 22.0 ],
                                    "text": "0"
                                }
                            },
                            {
                                "box": {
                                    "id": "cb2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 90.0, 365.0, 43.0, 20.0 ],
                                    "text": "clients"
                                }
                            },
                            {
                                "box": {
                                    "id": "pberr",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 230.0, 200.0, 97.0, 22.0 ],
                                    "text": "print mqtt-broker"
                                }
                            },
                            {
                                "box": {
                                    "id": "ctls",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 165.0, 366.0, 20.0 ],
                                    "text": "TLS test key and certificate, in Terminal:"
                                }
                            },
                            {
                                "box": {
                                    "id": "cssl",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 200.0, 442.0, 33.0 ],
                                    "text": "openssl req -x509 -newkey rsa:2048 -nodes -keyout key.pem -out cert.pem -days 365 -subj /CN=localhost"
                                }
                            },
                            {
                                "box": {
                                    "id": "m1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 255.0, 118.0, 22.0 ],
                                    "text": "key /path/to/key.pem"
                                }
                            },
                            {
                                "box": {
                                    "id": "m2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 285.0, 122.0, 22.0 ],
                                    "text": "cert /path/to/cert.pem"
                                }
                            },
                            {
                                "box": {
                                    "id": "m3",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 315.0, 71.0, 22.0 ],
                                    "text": "tlsport 8883"
                                }
                            },
                            {
                                "box": {
                                    "id": "m4",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 315.0, 80.0, 22.0 ],
                                    "text": "wssport 9002"
                                }
                            },
                            {
                                "box": {
                                    "id": "cself",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 345.0, 434.0, 33.0 ],
                                    "text": "Self-signed: clients must accept it. Browsers accept trusted certificates only."
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "rb", 0 ],
                                    "source": [ "broker", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "broker", 0 ],
                                    "source": [ "m1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "broker", 0 ],
                                    "source": [ "m2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "broker", 0 ],
                                    "source": [ "m3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "broker", 0 ],
                                    "source": [ "m4", 0 ]
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
                                    "destination": [ "mb2", 0 ],
                                    "source": [ "pb2", 0 ]
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
                                    "destination": [ "pb2", 0 ],
                                    "source": [ "rb", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pberr", 0 ],
                                    "source": [ "rb", 3 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 140.0, 120.0, 22.0 ],
                    "text": "p websocket & tls",
                    "varname": "basic_tab[1]"
                }
            },
            {
                "box": {
                    "id": "tab-basic_tab[2]",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 0.0, 26.0, 827.0, 550.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpdetails.js",
                                    "id": "details",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "mqtt.broker" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 779.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 537.0, 20.0 ],
                                    "text": "With a username, clients must log in. Wrong login: return code 4."
                                }
                            },
                            {
                                "box": {
                                    "id": "broker",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 20.0, 180.0, 333.0, 22.0 ],
                                    "text": "mqtt.broker @port 1884 @username max @password secret"
                                }
                            },
                            {
                                "box": {
                                    "id": "pre1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 215.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "dontreplace": 1,
                                    "id": "disp2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 245.0, 158.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "c3",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 260.0, 245.0, 75.0, 20.0 ],
                                    "text": "client events"
                                }
                            },
                            {
                                "box": {
                                    "id": "rb",
                                    "maxclass": "newobj",
                                    "numinlets": 5,
                                    "numoutlets": 5,
                                    "outlettype": [ "", "", "", "", "" ],
                                    "patching_rect": [ 20.0, 285.0, 183.0, 22.0 ],
                                    "text": "route status address clients error"
                                }
                            },
                            {
                                "box": {
                                    "id": "pb0",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 315.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "dontreplace": 1,
                                    "id": "mb0",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 340.0, 109.0, 22.0 ],
                                    "text": "listening mqtt 1884"
                                }
                            },
                            {
                                "box": {
                                    "id": "cb0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 140.0, 341.0, 41.0, 20.0 ],
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
                                    "patching_rect": [ 20.0, 370.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "dontreplace": 1,
                                    "id": "mb1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 395.0, 155.0, 22.0 ],
                                    "text": "mqtt://192.168.178.71:1884"
                                }
                            },
                            {
                                "box": {
                                    "id": "cb1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 240.0, 395.0, 51.0, 20.0 ],
                                    "text": "address"
                                }
                            },
                            {
                                "box": {
                                    "id": "pb2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 425.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "mb2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 450.0, 29.5, 22.0 ],
                                    "text": "0"
                                }
                            },
                            {
                                "box": {
                                    "id": "cb2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 58.0, 451.0, 43.0, 20.0 ],
                                    "text": "clients"
                                }
                            },
                            {
                                "box": {
                                    "id": "pberr",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 230.0, 285.0, 97.0, 22.0 ],
                                    "text": "print mqtt-broker"
                                }
                            },
                            {
                                "box": {
                                    "id": "bad",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 180.0, 227.0, 22.0 ],
                                    "text": "connect mqtt://localhost:1884 max wrong"
                                }
                            },
                            {
                                "box": {
                                    "id": "good",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 210.0, 227.0, 22.0 ],
                                    "text": "connect mqtt://localhost:1884 max secret"
                                }
                            },
                            {
                                "box": {
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 380.0, 245.0, 63.0, 22.0 ],
                                    "text": "mqtt.client"
                                }
                            },
                            {
                                "box": {
                                    "id": "rc",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 380.0, 280.0, 100.0, 22.0 ],
                                    "text": "route status error"
                                }
                            },
                            {
                                "box": {
                                    "id": "pre4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 310.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "dontreplace": 1,
                                    "id": "disp5",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 340.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "c6",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 510.0, 340.0, 72.0, 20.0 ],
                                    "text": "client status"
                                }
                            },
                            {
                                "box": {
                                    "id": "pre7",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 380.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "dontreplace": 1,
                                    "id": "disp8",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 410.0, 274.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "c9",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 666.0, 411.0, 65.0, 20.0 ],
                                    "text": "client error"
                                }
                            },
                            {
                                "box": {
                                    "id": "m10",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 150.0, 43.0, 22.0 ],
                                    "text": "clients"
                                }
                            },
                            {
                                "box": {
                                    "id": "ccl",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 80.0, 150.0, 285.0, 20.0 ],
                                    "text": "clients: count and IDs, on the dumpout"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "bad", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pre1", 0 ],
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
                                    "destination": [ "rc", 0 ],
                                    "source": [ "client", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "good", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "broker", 0 ],
                                    "source": [ "m10", 0 ]
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
                                    "destination": [ "mb2", 0 ],
                                    "source": [ "pb2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "disp2", 0 ],
                                    "source": [ "pre1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "disp5", 0 ],
                                    "source": [ "pre4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "disp8", 0 ],
                                    "source": [ "pre7", 0 ]
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
                                    "destination": [ "pb2", 0 ],
                                    "source": [ "rb", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pberr", 0 ],
                                    "source": [ "rb", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pre4", 0 ],
                                    "source": [ "rc", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pre7", 0 ],
                                    "source": [ "rc", 1 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 170.0, 120.0, 22.0 ],
                    "text": "p login & clients",
                    "varname": "basic_tab[2]"
                }
            },
            {
                "box": {
                    "id": "tab-q_tab",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 0.0, 26.0, 827.0, 550.0 ],
                        "showontab": 1,
                        "boxes": [  ],
                        "lines": [  ]
                    },
                    "patching_rect": [ 10.0, 200.0, 120.0, 22.0 ],
                    "text": "p ?",
                    "varname": "q_tab"
                }
            }
        ],
        "lines": [  ],
        "autosave": 0
    }
}