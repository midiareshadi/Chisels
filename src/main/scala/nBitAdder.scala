
// package name

import chisel3._

class AddernBitModule(val n:Int) extends Module {
  val io = IO(new Bundle {
    val A    = Input(UInt(n.W))
    val B    = Input(UInt(n.W))
    val Cin  = Input(UInt(1.W))
    val Sum  = Output(UInt(n.W))
    val Cout = Output(UInt(1.W))
  })
 
  val FAs   = Array.fill(n)(Module(new FullAdderModule()).io)
  val carry = Wire(Vec(n+1, UInt(1.W)))
  val sum   = Wire(Vec(n, Bool()))

  carry(0) := io.Cin

  for (i <- 0 until n) {
    FAs(i).a := io.A(i)
    FAs(i).b := io.B(i)
    FAs(i).cin := carry(i)
    carry(i+1) := FAs(i).cout
    sum(i) := FAs(i).sum.asBool
  }
  io.Sum := sum.asUInt
  io.Cout := carry(n)
}

object Adder3Bits extends App {
  println("Generating the 3 bits Adder logic")
  (new chisel3.stage.ChiselStage).emitVerilog(new AddernBitModule(3), Array("--target-dir", "generated"))
}