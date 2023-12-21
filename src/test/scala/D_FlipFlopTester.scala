
// package package_name

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class D_FlipFlopTests extends AnyFlatSpec with ChiselScalatestTester {

"D_FlipFlop" should "Works" in {
    test(new DFlipFlopModule).withAnnotations(Seq(WriteVcdAnnotation)) {
     dut =>
        for (d <- 0 until 2) {
            dut.io.d.poke(d.B)
            dut.clock.step()
            println("d=" + dut.io.d.peekInt() + "," + " q=" 
            + dut.io.q.peekInt())
        }
    }
  }
}