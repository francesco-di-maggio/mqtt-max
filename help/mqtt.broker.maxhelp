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
        "rect": [ 100.0, 100.0, 720.0, 626.0 ],
        "autosave": 0,
        "showrootpatcherontab": 0,
        "showontab": 0,
        "boxes": [
            {
                "box": {
                    "id": "helpname",
                    "maxclass": "jsui",
                    "filename": "helpname.js",
                    "jsarguments": [ "mqtt.broker" ],
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
                        "rect": [ 0.0, 26.0, 720.0, 600.0 ],
                        "autosave": 0,
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "details",
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 10.0, 10.0, 640.0, 100.0 ],
                                    "outlettype": [ "" ],
                                    "filename": "helpdetails.js",
                                    "jsarguments": [ "mqtt.broker" ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 640.0, 33.0 ],
                                    "text": "A broker on this computer, listening on port 1883. Devices on the network connect to one of its addresses; a client in Max connects to localhost."
                                }
                            },
                            {
                                "box": {
                                    "id": "broker",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 20.0, 165.0, 140.0, 22.0 ],
                                    "outlettype": [ "", "" ],
                                    "text": "mqtt.broker @port 1883"
                                }
                            },
                            {
                                "box": {
                                    "id": "pre1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 200.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "disp2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 230.0, 230.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "c3",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 260.0, 230.0, 200.0, 20.0 ],
                                    "text": "client events"
                                }
                            },
                            {
                                "box": {
                                    "id": "rb",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 5,
                                    "patching_rect": [ 20.0, 270.0, 200.0, 22.0 ],
                                    "outlettype": [ "", "", "", "", "" ],
                                    "text": "route status address clients error"
                                }
                            },
                            {
                                "box": {
                                    "id": "pb0",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 300.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "mb0",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 325.0, 210.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "cb0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 240.0, 325.0, 60.0, 20.0 ],
                                    "text": "status"
                                }
                            },
                            {
                                "box": {
                                    "id": "pb1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 355.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "mb1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 380.0, 210.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "cb1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 240.0, 380.0, 60.0, 20.0 ],
                                    "text": "address"
                                }
                            },
                            {
                                "box": {
                                    "id": "pb2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 410.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "mb2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 435.0, 60.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "cb2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 90.0, 435.0, 60.0, 20.0 ],
                                    "text": "clients"
                                }
                            },
                            {
                                "box": {
                                    "id": "pberr",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 230.0, 270.0, 105.0, 22.0 ],
                                    "text": "print mqtt-broker"
                                }
                            },
                            {
                                "box": {
                                    "id": "conn",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 165.0, 175.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "connect mqtt://localhost:1883"
                                }
                            },
                            {
                                "box": {
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 380.0, 235.0, 75.0, 22.0 ],
                                    "outlettype": [ "", "" ],
                                    "text": "mqtt.client"
                                }
                            },
                            {
                                "box": {
                                    "id": "m4",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 195.0, 100.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "subscribe test/#"
                                }
                            },
                            {
                                "box": {
                                    "id": "m5",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 490.0, 195.0, 140.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "publish test/hello 1 2 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "pre6",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 270.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "disp7",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 300.0, 230.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "c8",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 620.0, 300.0, 200.0, 20.0 ],
                                    "text": "received"
                                }
                            },
                            {
                                "box": {
                                    "id": "m9",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 480.0, 35.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "stop"
                                }
                            },
                            {
                                "box": {
                                    "id": "m10",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 65.0, 480.0, 40.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "start"
                                }
                            },
                            {
                                "box": {
                                    "id": "cfw",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 515.0, 560.0, 20.0 ],
                                    "text": "macOS asks once whether to accept incoming connections: allow it for devices on the network."
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
                                    "destination": [ "disp2", 0 ],
                                    "source": [ "pre1", 0 ]
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
                                    "destination": [ "pb0", 0 ],
                                    "source": [ "rb", 0 ]
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
                                    "destination": [ "pb1", 0 ],
                                    "source": [ "rb", 1 ]
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
                                    "destination": [ "pb2", 0 ],
                                    "source": [ "rb", 2 ]
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
                                    "destination": [ "pberr", 0 ],
                                    "source": [ "rb", 3 ]
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
                                    "destination": [ "pre6", 0 ],
                                    "source": [ "client", 0 ]
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
                                    "destination": [ "broker", 0 ],
                                    "source": [ "m9", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "broker", 0 ],
                                    "source": [ "m10", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 110.0, 120.0, 22.0 ],
                    "saved_object_attributes": {
                        "description": "",
                        "digest": "",
                        "globalpatchername": "",
                        "tags": ""
                    },
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
                        "rect": [ 0.0, 26.0, 720.0, 600.0 ],
                        "autosave": 0,
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "details",
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 10.0, 10.0, 640.0, 100.0 ],
                                    "outlettype": [ "" ],
                                    "filename": "helpdetails.js",
                                    "jsarguments": [ "mqtt.broker" ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 640.0, 33.0 ],
                                    "text": "Each listener has its own port; 0 is off. ws:// serves web pages on the local network. mqtts:// and wss:// need a key and a certificate."
                                }
                            },
                            {
                                "box": {
                                    "id": "broker",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 20.0, 165.0, 195.0, 22.0 ],
                                    "outlettype": [ "", "" ],
                                    "text": "mqtt.broker @port 0 @wsport 9001"
                                }
                            },
                            {
                                "box": {
                                    "id": "rb",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 5,
                                    "patching_rect": [ 20.0, 200.0, 200.0, 22.0 ],
                                    "outlettype": [ "", "", "", "", "" ],
                                    "text": "route status address clients error"
                                }
                            },
                            {
                                "box": {
                                    "id": "pb0",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 230.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "mb0",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 255.0, 210.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "cb0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 240.0, 255.0, 60.0, 20.0 ],
                                    "text": "status"
                                }
                            },
                            {
                                "box": {
                                    "id": "pb1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 285.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "mb1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 310.0, 210.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "cb1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 240.0, 310.0, 60.0, 20.0 ],
                                    "text": "address"
                                }
                            },
                            {
                                "box": {
                                    "id": "pb2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 340.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "mb2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 365.0, 60.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "cb2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 90.0, 365.0, 60.0, 20.0 ],
                                    "text": "clients"
                                }
                            },
                            {
                                "box": {
                                    "id": "pberr",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 230.0, 200.0, 105.0, 22.0 ],
                                    "text": "print mqtt-broker"
                                }
                            },
                            {
                                "box": {
                                    "id": "ctls",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 165.0, 300.0, 33.0 ],
                                    "text": "TLS: create a test key and certificate in Terminal, then set the paths"
                                }
                            },
                            {
                                "box": {
                                    "id": "cssl",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 200.0, 300.0, 48.0 ],
                                    "text": "openssl req -x509 -newkey rsa:2048 -nodes -keyout key.pem -out cert.pem -days 365 -subj /CN=localhost"
                                }
                            },
                            {
                                "box": {
                                    "id": "m1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 255.0, 140.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "key /path/to/key.pem"
                                }
                            },
                            {
                                "box": {
                                    "id": "m2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 285.0, 140.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "cert /path/to/cert.pem"
                                }
                            },
                            {
                                "box": {
                                    "id": "m3",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 315.0, 80.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "tlsport 8883"
                                }
                            },
                            {
                                "box": {
                                    "id": "m4",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 470.0, 315.0, 80.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "wssport 9002"
                                }
                            },
                            {
                                "box": {
                                    "id": "cself",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 345.0, 300.0, 33.0 ],
                                    "text": "Clients must accept the self-signed certificate. Browsers only accept certificates they trust."
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
                                    "destination": [ "pb0", 0 ],
                                    "source": [ "rb", 0 ]
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
                                    "destination": [ "pb1", 0 ],
                                    "source": [ "rb", 1 ]
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
                                    "destination": [ "pb2", 0 ],
                                    "source": [ "rb", 2 ]
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
                                    "destination": [ "pberr", 0 ],
                                    "source": [ "rb", 3 ]
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
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 140.0, 120.0, 22.0 ],
                    "saved_object_attributes": {
                        "description": "",
                        "digest": "",
                        "globalpatchername": "",
                        "tags": ""
                    },
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
                        "rect": [ 0.0, 26.0, 720.0, 600.0 ],
                        "autosave": 0,
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "details",
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 10.0, 10.0, 640.0, 100.0 ],
                                    "outlettype": [ "" ],
                                    "filename": "helpdetails.js",
                                    "jsarguments": [ "mqtt.broker" ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 640.0, 20.0 ],
                                    "text": "With a username, clients must log in. A wrong user name or password is refused with return code 4."
                                }
                            },
                            {
                                "box": {
                                    "id": "broker",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 20.0, 150.0, 300.0, 22.0 ],
                                    "outlettype": [ "", "" ],
                                    "text": "mqtt.broker @port 1884 @username max @password secret"
                                }
                            },
                            {
                                "box": {
                                    "id": "pre1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 185.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "disp2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 215.0, 230.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "c3",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 260.0, 215.0, 200.0, 20.0 ],
                                    "text": "client events"
                                }
                            },
                            {
                                "box": {
                                    "id": "rb",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 5,
                                    "patching_rect": [ 20.0, 255.0, 200.0, 22.0 ],
                                    "outlettype": [ "", "", "", "", "" ],
                                    "text": "route status address clients error"
                                }
                            },
                            {
                                "box": {
                                    "id": "pb0",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 285.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "mb0",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 310.0, 210.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "cb0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 240.0, 310.0, 60.0, 20.0 ],
                                    "text": "status"
                                }
                            },
                            {
                                "box": {
                                    "id": "pb1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 340.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "mb1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 365.0, 210.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "cb1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 240.0, 365.0, 60.0, 20.0 ],
                                    "text": "address"
                                }
                            },
                            {
                                "box": {
                                    "id": "pb2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 395.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "mb2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 420.0, 60.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "cb2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 90.0, 420.0, 60.0, 20.0 ],
                                    "text": "clients"
                                }
                            },
                            {
                                "box": {
                                    "id": "pberr",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 230.0, 255.0, 105.0, 22.0 ],
                                    "text": "print mqtt-broker"
                                }
                            },
                            {
                                "box": {
                                    "id": "bad",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 150.0, 235.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "connect mqtt://localhost:1884 max wrong"
                                }
                            },
                            {
                                "box": {
                                    "id": "good",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 180.0, 235.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "connect mqtt://localhost:1884 max secret"
                                }
                            },
                            {
                                "box": {
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 380.0, 215.0, 75.0, 22.0 ],
                                    "outlettype": [ "", "" ],
                                    "text": "mqtt.client"
                                }
                            },
                            {
                                "box": {
                                    "id": "rc",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [ 380.0, 250.0, 110.0, 22.0 ],
                                    "outlettype": [ "", "", "" ],
                                    "text": "route status error"
                                }
                            },
                            {
                                "box": {
                                    "id": "pre4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 280.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "disp5",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 310.0, 120.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "c6",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 510.0, 310.0, 200.0, 20.0 ],
                                    "text": "client status"
                                }
                            },
                            {
                                "box": {
                                    "id": "pre7",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 350.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "disp8",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 380.0, 230.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "c9",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 620.0, 380.0, 200.0, 20.0 ],
                                    "text": "client error"
                                }
                            },
                            {
                                "box": {
                                    "id": "m10",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 480.0, 50.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "clients"
                                }
                            },
                            {
                                "box": {
                                    "id": "ccl",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 80.0, 480.0, 300.0, 20.0 ],
                                    "text": "clients: their number and identifiers, on the dumpout"
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
                                    "destination": [ "disp2", 0 ],
                                    "source": [ "pre1", 0 ]
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
                                    "destination": [ "pb0", 0 ],
                                    "source": [ "rb", 0 ]
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
                                    "destination": [ "pb1", 0 ],
                                    "source": [ "rb", 1 ]
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
                                    "destination": [ "pb2", 0 ],
                                    "source": [ "rb", 2 ]
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
                                    "destination": [ "pberr", 0 ],
                                    "source": [ "rb", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "bad", 0 ]
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
                                    "destination": [ "rc", 0 ],
                                    "source": [ "client", 1 ]
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
                                    "destination": [ "disp5", 0 ],
                                    "source": [ "pre4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pre7", 0 ],
                                    "source": [ "rc", 1 ]
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
                                    "destination": [ "broker", 0 ],
                                    "source": [ "m10", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 170.0, 120.0, 22.0 ],
                    "saved_object_attributes": {
                        "description": "",
                        "digest": "",
                        "globalpatchername": "",
                        "tags": ""
                    },
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
                        "rect": [ 0.0, 26.0, 720.0, 600.0 ],
                        "autosave": 0,
                        "showontab": 1,
                        "boxes": [],
                        "lines": []
                    },
                    "patching_rect": [ 10.0, 200.0, 120.0, 22.0 ],
                    "saved_object_attributes": {
                        "description": "",
                        "digest": "",
                        "globalpatchername": "",
                        "tags": ""
                    },
                    "text": "p ?",
                    "varname": "q_tab"
                }
            }
        ],
        "lines": []
    }
}