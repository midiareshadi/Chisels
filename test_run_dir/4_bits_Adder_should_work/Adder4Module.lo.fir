FIRRTL version 1.1.0
circuit Adder4Module :
  module FullAdderModule :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<1>
    input io_b : UInt<1>
    input io_cin : UInt<1>
    output io_sum : UInt<1>
    output io_cout : UInt<1>

    node _io_sum_T = xor(io_a, io_b) @[FullAdder.scala 17:18]
    node _io_sum_T_1 = xor(_io_sum_T, io_cin) @[FullAdder.scala 17:25]
    node _io_cout_T = and(io_a, io_b) @[FullAdder.scala 19:20]
    node _io_cout_T_1 = and(io_b, io_cin) @[FullAdder.scala 19:36]
    node _io_cout_T_2 = or(_io_cout_T, _io_cout_T_1) @[FullAdder.scala 19:28]
    node _io_cout_T_3 = and(io_a, io_cin) @[FullAdder.scala 19:54]
    node _io_cout_T_4 = or(_io_cout_T_2, _io_cout_T_3) @[FullAdder.scala 19:46]
    io_sum <= _io_sum_T_1 @[FullAdder.scala 17:10]
    io_cout <= _io_cout_T_4 @[FullAdder.scala 19:11]

  module Adder4Module :
    input clock : Clock
    input reset : UInt<1>
    input io_A : UInt<4>
    input io_B : UInt<4>
    input io_Cin : UInt<1>
    output io_Sum : UInt<4>
    output io_Cout : UInt<1>

    inst Adder0 of FullAdderModule @[Adder4Bits.scala 15:22]
    inst Adder1 of FullAdderModule @[Adder4Bits.scala 21:22]
    inst Adder2 of FullAdderModule @[Adder4Bits.scala 27:22]
    inst Adder3 of FullAdderModule @[Adder4Bits.scala 33:22]
    node _Adder0_io_a_T = bits(io_A, 0, 0) @[Adder4Bits.scala 16:22]
    node _Adder0_io_b_T = bits(io_B, 0, 0) @[Adder4Bits.scala 17:22]
    node _Adder1_io_a_T = bits(io_A, 1, 1) @[Adder4Bits.scala 22:22]
    node _Adder1_io_b_T = bits(io_B, 1, 1) @[Adder4Bits.scala 23:22]
    node s1 = cat(Adder1.io_sum, Adder0.io_sum) @[Cat.scala 33:92]
    node _Adder2_io_a_T = bits(io_A, 2, 2) @[Adder4Bits.scala 28:22]
    node _Adder2_io_b_T = bits(io_B, 2, 2) @[Adder4Bits.scala 29:22]
    node s2 = cat(Adder2.io_sum, s1) @[Cat.scala 33:92]
    node _Adder3_io_a_T = bits(io_A, 3, 3) @[Adder4Bits.scala 34:22]
    node _Adder3_io_b_T = bits(io_B, 3, 3) @[Adder4Bits.scala 35:22]
    node _io_Sum_T = cat(Adder3.io_sum, s2) @[Cat.scala 33:92]
    io_Sum <= _io_Sum_T @[Adder4Bits.scala 37:10]
    io_Cout <= Adder3.io_cout @[Adder4Bits.scala 38:11]
    Adder0.clock <= clock
    Adder0.reset <= reset
    Adder0.io_a <= _Adder0_io_a_T @[Adder4Bits.scala 16:15]
    Adder0.io_b <= _Adder0_io_b_T @[Adder4Bits.scala 17:15]
    Adder0.io_cin <= io_Cin @[Adder4Bits.scala 18:17]
    Adder1.clock <= clock
    Adder1.reset <= reset
    Adder1.io_a <= _Adder1_io_a_T @[Adder4Bits.scala 22:15]
    Adder1.io_b <= _Adder1_io_b_T @[Adder4Bits.scala 23:15]
    Adder1.io_cin <= Adder0.io_cout @[Adder4Bits.scala 24:17]
    Adder2.clock <= clock
    Adder2.reset <= reset
    Adder2.io_a <= _Adder2_io_a_T @[Adder4Bits.scala 28:15]
    Adder2.io_b <= _Adder2_io_b_T @[Adder4Bits.scala 29:15]
    Adder2.io_cin <= Adder1.io_cout @[Adder4Bits.scala 30:17]
    Adder3.clock <= clock
    Adder3.reset <= reset
    Adder3.io_a <= _Adder3_io_a_T @[Adder4Bits.scala 34:15]
    Adder3.io_b <= _Adder3_io_b_T @[Adder4Bits.scala 35:15]
    Adder3.io_cin <= Adder2.io_cout @[Adder4Bits.scala 36:17]
