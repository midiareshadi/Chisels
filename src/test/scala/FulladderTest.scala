// package package_name

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class FullAdderTests extends AnyFlatSpec with ChiselScalatestTester {

"FullAdder" should "work" in {
    test(new FullAdderModule).withAnnotations(Seq(WriteVcdAnnotation)) {
     dut =>
        for (a <- 0 until 2) {
            for (b <- 0 until 2) {
                for (cin <- 0 until 2) {
                    dut.io.a.poke(a.B)
                    dut.io.b.poke(b.B)
                    dut.io.cin.poke(cin.B)
                    dut.clock.step()
                    // dut.io.cout.expect(dut.io.cout.peekInt())
                    println("a=" + dut.io.a.peekInt() + "," + " b=" 
                    + dut.io.b.peekInt() + "," + " cin=" + dut.io.cin.peekInt()+
                     "," + " cout=" + dut.io.cout.peekInt() +
                     "," + " sum=" + dut.io.sum.peekInt())
                }
            }
        }
    }
  }
}