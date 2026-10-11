// A virtual MIDI port pair through RtMidi (@julusian/midi). Other apps send to it and read from it
// like a hardware port. RtMidi creates virtual ports on macOS and Linux, not on Windows.

const midi = require("@julusian/midi");

class MidiPort {
  // onMessage(bytes) receives every complete message sent to the port: channel, real-time and SysEx.
  constructor(name, onMessage) {
    this.output = new midi.Output();
    this.output.openVirtualPort(name);
    this.input = new midi.Input();
    this.input.ignoreTypes(false, false, true);
    this.input.on("message", (deltaTime, bytes) => onMessage(bytes));
    this.input.openVirtualPort(name);
  }

  send(bytes) {
    this.output.sendMessage(bytes);
  }

  close() {
    this.input.closePort();
    this.output.closePort();
  }
}

module.exports = { MidiPort };
