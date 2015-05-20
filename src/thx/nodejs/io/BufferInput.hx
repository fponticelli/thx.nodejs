package thx.nodejs.io;

import js.node.Buffer;

class BufferInput extends haxe.io.Input {
  var buffer : Buffer;
  var pos : Int;
  public function new(buffer : Buffer) {
    this.buffer = buffer;
    reset();
  }

  public function reset() pos = 0;

  override function readByte() {
    if(pos >= buffer.length)
      throw new haxe.io.Eof();
    return buffer[pos++];
  }
}
