package thx.nodejs.io;

import js.node.Buffer;
import haxe.io.Bytes;

class Buffers {
  public static function toBytes(buffer : Buffer) : Bytes {
    return Bytes.ofData(toArrayBuffer(buffer));
  }

  public static function toArrayBuffer(buffer : Buffer) : js.html.ArrayBuffer {
    var arrayBuffer = new js.html.ArrayBuffer(buffer.length);
    var b = new js.html.Uint8Array(arrayBuffer);

    if(untyped __js__("'undefined' != typeof smalloc")) {
      untyped __js__("smalloc").copyOnto(buffer, 0, b, 0, buffer.length);
    } else {
      for(i in 0...buffer.length)
        b[i] = buffer[i];
    }

    return arrayBuffer;
  }
}
