
// package package_name

import chisel3._
import chisel3.util._

class FullAdderModule extends Module {
  val io = IO(new Bundle {
    val a    = Input(UInt(1.W))
    val b    = Input(UInt(1.W))
    val cin  = Input(UInt(1.W))
    val sum  = Output(UInt(1.W))
    val cout = Output(UInt(1.W))
  })

  // Calculating sum
  io.sum := io.a ^ io.b ^ io.cin
  // Generate the carry
  io.cout := (io.a & io.b) | (io.b & io.cin) | (io.a & io.cin)
}

object FullAdder extends App {
  println("Generating the Full Adder hardware")
  (new chisel3.stage.ChiselStage).emitVerilog(new FullAdderModule(), Array("--target-dir", "generated"))
}