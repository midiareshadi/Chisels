
// package package_name

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class FullAdderTests extends AnyFlatSpec with ChiselScalatestTester {

"FullAdder" should "work" in {
    test(new FullAdderModule).withAnnotations(Seq(WriteVcdAnnotation)) {
     dut =>
    //  val myBool = io.mySignal.peekBoolean()
        for (a <- 0 until 2) {
            for (b <- 0 until 2) {
                for (cin <- 0 until 2) {
                    dut.io.a.poke(a.U)
                    dut.io.b.poke(b.U)
                    dut.io.cin.poke(cin.U)
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