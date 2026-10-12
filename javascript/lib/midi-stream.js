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
    // Set when bytes were dropped: data without a status byte, or a SysEx without its end byte.
    this.dropped = false;
  }

  write(byte) {
    if (!Number.isInteger(byte) || byte < 0 || byte > 255) return void (this.dropped = true);
    if (byte >= 0xf8) return this.onMessage([byte]);
    if (this.sysex) return this.writeSysex(byte);
    if (byte === SYSEX_START) {
      this.status = null;
      this.sysex = [byte];
      return;
    }
    if (byte >= 0x80) return this.start(byte);
    if (this.status === null) return void (this.dropped = true);
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
      this.dropped = true;
      return this.write(byte);
    }
    this.sysex.push(byte);
  }
}

// MIDI 1.0 defines no message for these status bytes, and F7 only ends a SysEx.
const UNDEFINED = new Set([0xf4, 0xf5, 0xf7, 0xf9, 0xfd]);

// A payload of complete MIDI messages -> the messages, or null if any byte is missing, stray or undefined.
// Running status and real-time bytes inside a payload are allowed, as on a MIDI cable.
function parseMessages(bytes) {
  if (bytes.length === 0 || bytes[0] < 0x80) return null;
  const messages = [];
  const stream = new MidiStream((message) => messages.push(message));
  for (const byte of bytes) stream.write(byte);
  if (stream.dropped || stream.data.length > 0 || stream.sysex !== null) return null;
  if (messages.some((m) => UNDEFINED.has(m[0]) && m.length === 1)) return null;
  return messages;
}

module.exports = { MidiStream, parseMessages };
