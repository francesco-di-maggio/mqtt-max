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
        "rect": [ -209.0, -988.0, 1493.0, 526.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-63",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 123.0, 231.0, 139.0, 20.0 ],
                    "text": "only first time installation"
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1305.0, 211.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1305.0, 159.0, 53.0, 22.0 ],
                    "text": "route 60"
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1417.0, 213.0, 20.0, 140.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-55",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1395.0, 213.0, 20.0, 140.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1373.0, 213.0, 20.0, 140.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 1373.0, 159.0, 85.0, 22.0 ],
                    "text": "route 1 2 3"
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 8,
                    "outlettype": [ "", "", "", "int", "int", "", "int", "" ],
                    "patching_rect": [ 1352.0, 110.0, 92.5, 22.0 ],
                    "text": "midiparse"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-51",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 1352.0, 79.5, 76.0, 22.0 ],
                    "text": "midiin midge"
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 525.0, 433.0, 700.0, 20.0 ],
                    "text": "Other message types use the same layout: program/<ch> (1 byte), pitchbend/<ch> (2 bytes: LSB, MSB), and noteoff/<ch>/<note>."
                }
            },
            {
                "box": {
                    "id": "obj-48",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 754.0, 280.5, 138.0, 21.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 754.0, 380.0, 93.0, 22.0 ],
                    "text": "ctlout midge 4 1"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-35",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 751.0, 169.5, 53.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-36",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 722.0, 195.5, 53.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-37",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 693.0, 79.5, 77.0, 22.0 ],
                    "text": "ctlin midge"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-38",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 693.0, 221.5, 53.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-39",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 806.0, 169.5, 82.0, 20.0 ],
                    "text": "MIDI Channel"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-40",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 748.0, 221.5, 38.0, 20.0 ],
                    "presentation_linecount": 2,
                    "text": "Value"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-41",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 777.0, 196.5, 51.0, 20.0 ],
                    "presentation_linecount": 2,
                    "text": "Number"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 271.0, 80.5, 138.0, 21.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 271.0, 140.0, 181.0, 22.0 ],
                    "text": "publishbytes remote/in/cc/1/7 $1"
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 471.0, 495.0, 33.0 ],
                    "text": "phone/ESP  --publish remote/in/...-->  Midge  --MIDI-->  Max/DAW (notein/ctlin midge)\nphone/ESP  <--subscribe remote/out/#--  Midge  <--MIDI--  Max/DAW (noteout/ctlout midge)"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 433.0, 448.0, 33.0 ],
                    "text": "- remote/in/... = MQTT going into Midge. Midge turns it into MIDI on the midge port.\n- remote/out/... = MIDI that arrived on the midge port goes out of Midge as MQTT."
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "linecount": 28,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 948.0, 24.0, 347.0, 382.0 ],
                    "text": "MQTT <-> MIDI test patch\n\nSETUP (once per session)\n1. Open ragazzi (MQTT broker, localhost:1883)\n2. Open Midge: host 127.0.0.1, port 1883, prefix remote,\n   no user/pass -> Connect. MIDI: Create virtual port -> Listen\n3. Here: click \"connect\", then a \"subscribe\"\n   (first time on a new machine: \"script npm install\")\n\nTOPICS\ntest/...             your own playground, plain text\nremote/in/...    Max -> Midge -> MIDI out on port \"midge\"\nremote/out/...  MIDI into port \"midge\" -> Midge -> Max\n\nSEND\npublish           = text   (e.g. publish test/hello 1 2 3)\npublishbytes  = raw bytes, the MIDI format\n                (publishbytes remote/in/noteon/<ch>/<note> <vel>)\n\nRECEIVE\nsubscribe <topic>   # = everything below\nformat text   for test/...\nformat bytes  for remote/out/...  (MIDI values are single bytes)\n\nTESTS\ntoggle         -> MQTT -> Midge -> notein midge (numbers move)\nnumber box     -> noteout midge -> Midge -> MQTT -> console\n                  (needs subscribe remote/out/# + format bytes)"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 620.0, 280.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 620.0, 380.0, 85.0, 22.0 ],
                    "text": "noteout midge"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "float", "float" ],
                    "patching_rect": [ 620.0, 330.0, 108.0, 22.0 ],
                    "text": "makenote 100 500"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-13",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 528.0, 170.0, 53.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-14",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 499.0, 195.75, 53.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-15",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 470.0, 79.5, 77.0, 22.0 ],
                    "text": "notein midge"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-16",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 470.0, 221.5, 53.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-28",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 583.0, 170.0, 82.0, 20.0 ],
                    "text": "MIDI Channel"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-29",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 525.0, 221.5, 35.0, 20.0 ],
                    "text": "Pitch"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-30",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 554.0, 196.75, 50.0, 20.0 ],
                    "text": "Velocity"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 195.0, 110.0, 37.0, 22.0 ],
                    "text": "* 100"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 195.0, 79.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "m0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 20.0, 165.0, 22.0 ],
                    "text": "connect mqtt://localhost:1883"
                }
            },
            {
                "box": {
                    "id": "m1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 50.0, 66.0, 22.0 ],
                    "text": "disconnect"
                }
            },
            {
                "box": {
                    "id": "m2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 80.0, 131.0, 22.0 ],
                    "text": "subscribe remote/out/#"
                }
            },
            {
                "box": {
                    "id": "m3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 110.0, 128.0, 22.0 ],
                    "text": "publish test/hello 1 2 3"
                }
            },
            {
                "box": {
                    "id": "m4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 140.0, 212.0, 22.0 ],
                    "text": "publishbytes remote/in/noteon/1/60 $1"
                }
            },
            {
                "box": {
                    "id": "m5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 170.0, 65.0, 22.0 ],
                    "text": "format text"
                }
            },
            {
                "box": {
                    "id": "m6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 200.0, 75.0, 22.0 ],
                    "text": "format bytes"
                }
            },
            {
                "box": {
                    "id": "m7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 230.0, 98.0, 22.0 ],
                    "text": "script npm install"
                }
            },
            {
                "box": {
                    "id": "node",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 280.0, 267.0, 22.0 ],
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
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 20.0, 330.0, 152.0, 22.0 ],
                    "text": "route message status error"
                }
            },
            {
                "box": {
                    "id": "p0",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 380.0, 111.0, 22.0 ],
                    "text": "print mqtt-message"
                }
            },
            {
                "box": {
                    "id": "p1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 145.0, 380.0, 95.0, 22.0 ],
                    "text": "print mqtt-status"
                }
            },
            {
                "box": {
                    "id": "p2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 260.0, 380.0, 88.0, 22.0 ],
                    "text": "print mqtt-error"
                }
            },
            {
                "box": {
                    "id": "p3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 268.0, 330.0, 95.0, 22.0 ],
                    "text": "print node-script"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "midpoints": [ 29.5, 45.0, 6.0, 45.0, 6.0, 267.0, 29.5, 267.0 ],
                    "source": [ "m0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "midpoints": [ 29.5, 75.0, 6.0, 75.0, 6.0, 267.0, 29.5, 267.0 ],
                    "source": [ "m1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "midpoints": [ 29.5, 105.0, 6.0, 105.0, 6.0, 267.0, 29.5, 267.0 ],
                    "source": [ "m2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "midpoints": [ 29.5, 135.0, 6.0, 135.0, 6.0, 267.0, 29.5, 267.0 ],
                    "source": [ "m3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "midpoints": [ 29.5, 165.0, 6.0, 165.0, 6.0, 267.0, 29.5, 267.0 ],
                    "source": [ "m4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "midpoints": [ 29.5, 195.0, 6.0, 195.0, 6.0, 267.0, 29.5, 267.0 ],
                    "source": [ "m5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "midpoints": [ 29.5, 225.0, 6.0, 225.0, 6.0, 267.0, 29.5, 267.0 ],
                    "source": [ "m6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "midpoints": [ 29.5, 255.0, 29.5, 255.0 ],
                    "source": [ "m7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "p3", 0 ],
                    "midpoints": [ 277.5, 303.0, 277.5, 303.0 ],
                    "source": [ "node", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "route", 0 ],
                    "midpoints": [ 29.5, 303.0, 29.5, 303.0 ],
                    "source": [ "node", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "midpoints": [ 537.5, 102.0, 537.5, 102.0 ],
                    "source": [ "obj-15", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "midpoints": [ 508.5, 102.0, 508.5, 102.0 ],
                    "source": [ "obj-15", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "midpoints": [ 479.5, 102.0, 479.5, 102.0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 1 ],
                    "midpoints": [ 718.5, 366.0, 662.5, 366.0 ],
                    "source": [ "obj-17", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "midpoints": [ 629.5, 354.0, 629.5, 354.0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "midpoints": [ 629.5, 303.0, 629.5, 303.0 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "midpoints": [ 280.5, 267.0, 29.5, 267.0 ],
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "midpoints": [ 280.5, 102.0, 280.5, 102.0 ],
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-35", 0 ],
                    "midpoints": [ 760.5, 102.0, 760.5, 102.0 ],
                    "source": [ "obj-37", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "midpoints": [ 731.5, 102.0, 731.5, 102.0 ],
                    "source": [ "obj-37", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "midpoints": [ 702.5, 102.0, 702.5, 102.0 ],
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "midpoints": [ 763.5, 303.0, 763.5, 303.0 ],
                    "source": [ "obj-48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "midpoints": [ 1361.5, 102.0, 1361.5, 102.0 ],
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "midpoints": [ 1382.5, 135.0, 1382.5, 135.0 ],
                    "source": [ "obj-52", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 0 ],
                    "midpoints": [ 1361.5, 144.0, 1314.5, 144.0 ],
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "midpoints": [ 1382.5, 183.0, 1382.5, 183.0 ],
                    "source": [ "obj-53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "midpoints": [ 1404.5, 183.0, 1404.5, 183.0 ],
                    "source": [ "obj-53", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "midpoints": [ 1426.5, 183.0, 1426.5, 183.0 ],
                    "source": [ "obj-53", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "midpoints": [ 1314.5, 183.0, 1314.5, 183.0 ],
                    "source": [ "obj-57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "midpoints": [ 204.5, 105.0, 204.5, 105.0 ],
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m4", 0 ],
                    "midpoints": [ 204.5, 135.0, 29.5, 135.0 ],
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "p0", 0 ],
                    "midpoints": [ 29.5, 354.0, 29.5, 354.0 ],
                    "source": [ "route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "p1", 0 ],
                    "midpoints": [ 73.83333333333334, 366.0, 154.5, 366.0 ],
                    "source": [ "route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "p2", 0 ],
                    "midpoints": [ 118.16666666666667, 366.0, 269.5, 366.0 ],
                    "source": [ "route", 2 ]
                }
            }
        ],
        "autosave": 0
    }
}