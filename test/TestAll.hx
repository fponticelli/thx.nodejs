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

  public function testBase() {

  }
}
