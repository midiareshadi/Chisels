// package package_name

import chisel3._
import chisel3.util._

class DFlipFlopModule extends Module {
  val io = IO(new Bundle {
    val d = Input(Bool()) 
    val q = Output(Bool()) 
  })

  val reg = RegNext(io.d, init = false.B)

  io.q := reg
}

object DFlipFlop extends App {
  println("Generating the D Flip Flop logic")
  (new chisel3.stage.ChiselStage).emitVerilog(new DFlipFlopModule(), Array("--target-dir", "generated"))
}