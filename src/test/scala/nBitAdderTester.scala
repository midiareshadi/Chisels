
// package package_name

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class AddernModuleTests extends AnyFlatSpec with ChiselScalatestTester {

"3 bits Adder" should "work" in {
    test(new AddernBitModule(3)).withAnnotations(Seq(WriteVcdAnnotation)) {
     dut =>
        dut.io.Cin.poke(0.B)
          for (a <- 0 until 8) {
              for (b <- 0 until 8) {
                dut.io.A.poke(a.U)
                dut.io.B.poke(b.U)
                dut.clock.step()
                  println("A=" + dut.io.A.peekInt() + "," + " B=" 
                  + dut.io.B.peekInt() + "," + " Cout=" + dut.io.Cout.peekInt() +
                    "," + " Sum=" + dut.io.Sum.peekInt())
                }
            }
        }
    }
}