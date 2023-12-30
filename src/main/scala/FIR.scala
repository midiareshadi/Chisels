import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.experimental._

// 3-point moving average implemented in the style of a FIR filter
class MovingAverage3(bitWidth: Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(bitWidth.W))
    val out = Output(UInt(bitWidth.W))
  })

  val z1 = RegNext(io.in) // Create a register whose input is connected to the argument io.in
  val z2 = RegNext(z1)    // Create a register whose input is connected to the argument z1

  io.out := (io.in * 1.U) + (z1 * 1.U) + (z2 * 1.U) // `1.U` is an unsigned literal with value 1

}

visualize(() => new MovingAverage3(8))


object FIR extends App {
  println("Generating the FIR hardware")
  (new chisel3.stage.ChiselStage).emitVerilog(new MovingAverage3(4), Array("--target-dir", "generated"))
}