// package package_name

import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}


class Adder4Module extends Module {
  val io = IO(new Bundle {
    val A    = Input(UInt(4.W))
    val B    = Input(UInt(4.W))
    val Cin  = Input(UInt(1.W))
    val Sum  = Output(UInt(4.W))
    val Cout = Output(UInt(1.W))
  })

  val Adder0 = Module(new FullAdderModule())
  Adder0.io.a := io.A(0)
  Adder0.io.b := io.B(0)
  Adder0.io.cin := io.Cin
  val s0 = Adder0.io.sum

  val Adder1 = Module(new FullAdderModule())
  Adder1.io.a := io.A(1)
  Adder1.io.b := io.B(1)
  Adder1.io.cin := Adder0.io.cout
  val s1 = Cat(Adder1.io.sum, s0)

  val Adder2 = Module(new FullAdderModule())
  Adder2.io.a := io.A(2)
  Adder2.io.b := io.B(2)
  Adder2.io.cin := Adder1.io.cout
  val s2 = Cat(Adder2.io.sum, s1)

  val Adder3 = Module(new FullAdderModule())
  Adder3.io.a := io.A(3)
  Adder3.io.b := io.B(3)
  Adder3.io.cin := Adder2.io.cout
  io.Sum := Cat(Adder3.io.sum, s2).asUInt
  io.Cout := Adder3.io.cout
}

object Adder4Bits extends App {
  println("Generating the 4 bits Adder logic")
  (new chisel3.stage.ChiselStage).emitVerilog(new Adder4Module(), Array("--target-dir", "generated"))
}

// visualize(() => new Adder4Module())
