// Raw MIDI bytes, as [midiout] takes them, -> complete messages. Handles running status,
// real-time bytes between the bytes of another message, and SysEx up to its end byte.

const SYSEX_START = 0xf0;
const SYSEX_END = 0xf7;

function dataLength(status) {
  if (status >= 0x80 && status < 0xf0) return (status & 0xf0) === 0xc0 || (status & 0xf0) === 0xd0 ? 1 : 2;
  return { 0xf1: 1, 0xf2: 2, 0xf3: 1, 0xf6: 0 }[status] ?? 0;
}

class MidiStream {
  constructor(onMessage) {
    this.onMessage = onMessage;
    this.status = null;
    this.data = [];
    this.sysex = null;
  }

  write(byte) {
    if (!Number.isInteger(byte) || byte < 0 || byte > 255) return;
    if (byte >= 0xf8) return this.onMessage([byte]);
    if (this.sysex) return this.writeSysex(byte);
    if (byte === SYSEX_START) {
      this.status = null;
      this.sysex = [byte];
      return;
    }
    if (byte >= 0x80) return this.start(byte);
    if (this.status === null) return;
    this.data.push(byte);
    if (this.data.length < dataLength(this.status)) return;
    this.onMessage([this.status, ...this.data]);
    this.data = [];
    // Running status applies to channel messages only.
    if (this.status >= 0xf0) this.status = null;
  }

  start(status) {
    this.status = status;
    this.data = [];
    if (dataLength(status) > 0) return;
    this.onMessage([status]);
    this.status = null;
  }

  writeSysex(byte) {
    if (byte === SYSEX_END) {
      this.onMessage([...this.sysex, byte]);
      this.sysex = null;
      return;
    }
    // Any other status byte ends an unterminated SysEx and starts a new message.
    if (byte >= 0x80) {
      this.sysex = null;
      return this.write(byte);
    }
    this.sysex.push(byte);
  }
}

module.exports = { MidiStream };
