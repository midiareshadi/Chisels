
// package package_name

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class Adder4BitsTests extends AnyFlatSpec with ChiselScalatestTester {

"4 bits Adder" should "work" in {
    test(new Adder4Module).withAnnotations(Seq(WriteVcdAnnotation)) {
     dut =>
        dut.io.Cin.poke(0.B)
          for (a <- 0 until 16) {
              for (b <- 0 until 16) {
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