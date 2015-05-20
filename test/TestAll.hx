import utest.*;
import utest.ui.Report;

class TestAll {
  static function main() {
    var runner = new Runner();

    // add tests
    runner.addCase(new TestAll());

    // run it good
    Report.create(runner);
    runner.run();
  }

  public function new() {}

  public function testBufferInput() {
    var buffer = new js.node.Buffer("sample"),
        input  = new thx.nodejs.stream.BufferInput(buffer);

    Assert.same("s".charCodeAt(0), input.readByte());
    Assert.same("a".charCodeAt(0), input.readByte());
    Assert.same("m".charCodeAt(0), input.readByte());
    Assert.same("p".charCodeAt(0), input.readByte());
    Assert.same("l".charCodeAt(0), input.readByte());
    Assert.same("e".charCodeAt(0), input.readByte());
    Assert.raises(function() input.readByte(), haxe.io.Eof);
  }
}
