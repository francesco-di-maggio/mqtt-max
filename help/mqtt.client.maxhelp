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
                    "jsarguments": [ "mqtt.client" ],
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
                    "text": "js helpstarter.js mqtt.client"
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
                                    "jsarguments": [ "mqtt.client" ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 500.0, 20.0 ],
                                    "text": "Connect, subscribe, then publish: the message comes back from the broker."
                                }
                            },
                            {
                                "box": {
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 20.0, 220.0, 86.0, 22.0 ],
                                    "outlettype": [ "", "" ],
                                    "text": "mqtt.client"
                                }
                            },
                            {
                                "box": {
                                    "id": "conn",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 150.0, 261.0, 22.0 ],
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
                                    "patching_rect": [ 300.0, 150.0, 66.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "disconnect"
                                }
                            },
                            {
                                "box": {
                                    "id": "m1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 185.0, 150.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "subscribe mqtt-max-help/#"
                                }
                            },
                            {
                                "box": {
                                    "id": "m2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 190.0, 185.0, 230.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "publish mqtt-max-help/hello 1 2.5 three"
                                }
                            },
                            {
                                "box": {
                                    "id": "pre3",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 260.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "disp4",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 290.0, 300.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "c5",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 330.0, 290.0, 200.0, 20.0 ],
                                    "text": "incoming: <topic> <payload>"
                                }
                            },
                            {
                                "box": {
                                    "id": "rstatus",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [ 20.0, 330.0, 110.0, 22.0 ],
                                    "outlettype": [ "", "", "" ],
                                    "text": "route status error"
                                }
                            },
                            {
                                "box": {
                                    "id": "pre6",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 360.0, 72.0, 22.0 ],
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
                                    "patching_rect": [ 20.0, 390.0, 110.0, 22.0 ],
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
                                    "patching_rect": [ 140.0, 390.0, 200.0, 20.0 ],
                                    "text": "status"
                                }
                            },
                            {
                                "box": {
                                    "id": "perror",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 140.0, 360.0, 95.0, 22.0 ],
                                    "text": "print mqtt-error"
                                }
                            },
                            {
                                "box": {
                                    "id": "cnpm",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 430.0, 420.0, 20.0 ],
                                    "text": "Once on a new computer, if the Max Console shows \"Cannot find module\":"
                                }
                            },
                            {
                                "box": {
                                    "id": "m9",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 455.0, 110.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "script npm install"
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
                                    "destination": [ "client", 0 ],
                                    "source": [ "m1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "m2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pre3", 0 ],
                                    "source": [ "client", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "disp4", 0 ],
                                    "source": [ "pre3", 0 ]
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
                                    "destination": [ "pre6", 0 ],
                                    "source": [ "rstatus", 0 ]
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
                                    "destination": [ "perror", 0 ],
                                    "source": [ "rstatus", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "m9", 0 ]
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
                                    "jsarguments": [ "mqtt.client" ],
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
                                    "text": "Payloads are bytes. format sets how incoming payloads come out: text, bytes or JSON as a dictionary (here @format json)."
                                }
                            },
                            {
                                "box": {
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 20.0, 220.0, 177.0, 22.0 ],
                                    "outlettype": [ "", "" ],
                                    "text": "mqtt.client @format json"
                                }
                            },
                            {
                                "box": {
                                    "id": "conn",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 150.0, 261.0, 22.0 ],
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
                                    "patching_rect": [ 300.0, 150.0, 66.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "disconnect"
                                }
                            },
                            {
                                "box": {
                                    "id": "m1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 150.0, 190.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "subscribe mqtt-max-help/payload/#"
                                }
                            },
                            {
                                "box": {
                                    "id": "m2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 185.0, 80.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "format text"
                                }
                            },
                            {
                                "box": {
                                    "id": "m3",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 110.0, 185.0, 80.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "format bytes"
                                }
                            },
                            {
                                "box": {
                                    "id": "m4",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 200.0, 185.0, 80.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "format json"
                                }
                            },
                            {
                                "box": {
                                    "id": "m5",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 260.0, 250.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "publish mqtt-max-help/payload/text hello 1 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "m6",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 290.0, 290.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "publishbytes mqtt-max-help/payload/bytes 0 127 255"
                                }
                            },
                            {
                                "box": {
                                    "id": "cj",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 260.0, 200.0, 20.0 ],
                                    "text": "a dictionary is published as JSON"
                                }
                            },
                            {
                                "box": {
                                    "id": "jn",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 380.0, 285.0, 50.0, 22.0 ],
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "jpack",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 315.0, 95.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "dict.pack temp:"
                                }
                            },
                            {
                                "box": {
                                    "id": "jpub",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 345.0, 245.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend publish mqtt-max-help/payload/json"
                                }
                            },
                            {
                                "box": {
                                    "id": "pre7",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 330.0, 72.0, 22.0 ],
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
                                    "patching_rect": [ 20.0, 360.0, 330.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "cr",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 390.0, 240.0, 20.0 ],
                                    "text": "a JSON object comes out as a dictionary"
                                }
                            },
                            {
                                "box": {
                                    "id": "jroute",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 380.0, 415.0, 190.0, 22.0 ],
                                    "outlettype": [ "", "" ],
                                    "text": "route mqtt-max-help/payload/json"
                                }
                            },
                            {
                                "box": {
                                    "id": "junpack",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 380.0, 445.0, 105.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "dict.unpack temp:"
                                }
                            },
                            {
                                "box": {
                                    "id": "jout",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 380.0, 475.0, 50.0, 22.0 ],
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0
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
                                    "destination": [ "client", 0 ],
                                    "source": [ "m1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "m2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "m3", 0 ]
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
                                    "destination": [ "client", 0 ],
                                    "source": [ "m6", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "jpack", 0 ],
                                    "source": [ "jn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "jpub", 0 ],
                                    "source": [ "jpack", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "jpub", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pre7", 0 ],
                                    "source": [ "client", 0 ]
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
                                    "destination": [ "jroute", 0 ],
                                    "source": [ "client", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "junpack", 0 ],
                                    "source": [ "jroute", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "jout", 0 ],
                                    "source": [ "junpack", 0 ]
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
                    "text": "p payloads",
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
                                    "jsarguments": [ "mqtt.client" ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 600.0, 20.0 ],
                                    "text": "qos and retain apply to publish from now on. A subscription has its own QoS: subscribe <topic> <qos>."
                                }
                            },
                            {
                                "box": {
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 20.0, 220.0, 86.0, 22.0 ],
                                    "outlettype": [ "", "" ],
                                    "text": "mqtt.client"
                                }
                            },
                            {
                                "box": {
                                    "id": "conn",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 150.0, 261.0, 22.0 ],
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
                                    "patching_rect": [ 300.0, 150.0, 66.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "disconnect"
                                }
                            },
                            {
                                "box": {
                                    "id": "m1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 185.0, 60.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "qos 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "m2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 90.0, 185.0, 60.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "qos 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "m3",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 160.0, 185.0, 60.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "qos 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "m4",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 230.0, 185.0, 60.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "retain 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "m5",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 300.0, 185.0, 60.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "retain 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "m6",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 260.0, 215.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "publish mqtt-max-help/retained hello"
                                }
                            },
                            {
                                "box": {
                                    "id": "m7",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 250.0, 260.0, 180.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "publish mqtt-max-help/retained"
                                }
                            },
                            {
                                "box": {
                                    "id": "cdel",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 440.0, 255.0, 230.0, 33.0 ],
                                    "text": "with retain 1 and no payload: deletes the retained message"
                                }
                            },
                            {
                                "box": {
                                    "id": "m8",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 300.0, 200.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "subscribe mqtt-max-help/retained 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "m9",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 230.0, 300.0, 205.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "unsubscribe mqtt-max-help/retained"
                                }
                            },
                            {
                                "box": {
                                    "id": "cret",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 330.0, 520.0, 33.0 ],
                                    "text": "With retain 1, publish, then unsubscribe and subscribe again: the broker sends the retained message to the new subscription."
                                }
                            },
                            {
                                "box": {
                                    "id": "pre10",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 375.0, 72.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "disp11",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 405.0, 300.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": ""
                                }
                            },
                            {
                                "box": {
                                    "id": "c12",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 330.0, 405.0, 200.0, 20.0 ],
                                    "text": "incoming"
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
                                    "destination": [ "client", 0 ],
                                    "source": [ "m1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "m2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "m3", 0 ]
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
                                    "destination": [ "client", 0 ],
                                    "source": [ "m6", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "m7", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "m8", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "m9", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pre10", 0 ],
                                    "source": [ "client", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "disp11", 0 ],
                                    "source": [ "pre10", 0 ]
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
                    "text": "p qos & retain",
                    "varname": "basic_tab[2]"
                }
            },
            {
                "box": {
                    "id": "tab-basic_tab[3]",
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
                                    "jsarguments": [ "mqtt.client" ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "c0",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 120.0, 620.0, 20.0 ],
                                    "text": "Attributes set the connection; connect uses them. mqtt:// and mqtts:// (TLS), ws:// and wss:// (WebSocket)."
                                }
                            },
                            {
                                "box": {
                                    "id": "client",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [ 20.0, 260.0, 470.0, 22.0 ],
                                    "outlettype": [ "", "" ],
                                    "text": "mqtt.client @url mqtt://public.cloud.shiftr.io @username public @password public"
                                }
                            },
                            {
                                "box": {
                                    "id": "m1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 150.0, 50.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "connect"
                                }
                            },
                            {
                                "box": {
                                    "id": "m2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 80.0, 150.0, 66.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "disconnect"
                                }
                            },
                            {
                                "box": {
                                    "id": "m3",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 185.0, 145.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "url mqtt://localhost:1883"
                                }
                            },
                            {
                                "box": {
                                    "id": "m4",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 175.0, 185.0, 115.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "clientid max-studio"
                                }
                            },
                            {
                                "box": {
                                    "id": "m5",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 300.0, 185.0, 75.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "keepalive 30"
                                }
                            },
                            {
                                "box": {
                                    "id": "m6",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [ 385.0, 185.0, 50.0, 22.0 ],
                                    "outlettype": [ "" ],
                                    "text": "clean 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "cl",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 215.0, 330.0, 20.0 ],
                                    "text": "localhost needs a broker on this computer, e.g. Mosquitto"
                                }
                            },
                            {
                                "box": {
                                    "id": "rstatus",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [ 20.0, 300.0, 110.0, 22.0 ],
                                    "outlettype": [ "", "", "" ],
                                    "text": "route status error"
                                }
                            },
                            {
                                "box": {
                                    "id": "pre7",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [ 20.0, 330.0, 72.0, 22.0 ],
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
                                    "patching_rect": [ 20.0, 360.0, 110.0, 22.0 ],
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
                                    "patching_rect": [ 140.0, 360.0, 200.0, 20.0 ],
                                    "text": "status"
                                }
                            },
                            {
                                "box": {
                                    "id": "perror",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 140.0, 330.0, 95.0, 22.0 ],
                                    "text": "print mqtt-error"
                                }
                            },
                            {
                                "box": {
                                    "id": "cn",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 400.0, 600.0, 48.0 ],
                                    "text": "keepalive (s): a dropped client is noticed after 1.5 x keepalive. clientid: two clients with the same one disconnect each other. A password typed in the box is saved in the patch."
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "m1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "m2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "client", 0 ],
                                    "source": [ "m3", 0 ]
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
                                    "destination": [ "client", 0 ],
                                    "source": [ "m6", 0 ]
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
                                    "destination": [ "pre7", 0 ],
                                    "source": [ "rstatus", 0 ]
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
                                    "destination": [ "perror", 0 ],
                                    "source": [ "rstatus", 1 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 200.0, 120.0, 22.0 ],
                    "saved_object_attributes": {
                        "description": "",
                        "digest": "",
                        "globalpatchername": "",
                        "tags": ""
                    },
                    "text": "p connection",
                    "varname": "basic_tab[3]"
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
                    "patching_rect": [ 10.0, 230.0, 120.0, 22.0 ],
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