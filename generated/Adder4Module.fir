circuit Adder4Module :
  module FullAdderModule :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip cin : UInt<1>, sum : UInt<1>, cout : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[FullAdder.scala 17:18]
    node _io_sum_T_1 = xor(_io_sum_T, io.cin) @[FullAdder.scala 17:25]
    io.sum <= _io_sum_T_1 @[FullAdder.scala 17:10]
    node _io_cout_T = and(io.a, io.b) @[FullAdder.scala 19:20]
    node _io_cout_T_1 = and(io.b, io.cin) @[FullAdder.scala 19:36]
    node _io_cout_T_2 = or(_io_cout_T, _io_cout_T_1) @[FullAdder.scala 19:28]
    node _io_cout_T_3 = and(io.a, io.cin) @[FullAdder.scala 19:54]
    node _io_cout_T_4 = or(_io_cout_T_2, _io_cout_T_3) @[FullAdder.scala 19:46]
    io.cout <= _io_cout_T_4 @[FullAdder.scala 19:11]

  module FullAdderModule_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip cin : UInt<1>, sum : UInt<1>, cout : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[FullAdder.scala 17:18]
    node _io_sum_T_1 = xor(_io_sum_T, io.cin) @[FullAdder.scala 17:25]
    io.sum <= _io_sum_T_1 @[FullAdder.scala 17:10]
    node _io_cout_T = and(io.a, io.b) @[FullAdder.scala 19:20]
    node _io_cout_T_1 = and(io.b, io.cin) @[FullAdder.scala 19:36]
    node _io_cout_T_2 = or(_io_cout_T, _io_cout_T_1) @[FullAdder.scala 19:28]
    node _io_cout_T_3 = and(io.a, io.cin) @[FullAdder.scala 19:54]
    node _io_cout_T_4 = or(_io_cout_T_2, _io_cout_T_3) @[FullAdder.scala 19:46]
    io.cout <= _io_cout_T_4 @[FullAdder.scala 19:11]

  module FullAdderModule_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip cin : UInt<1>, sum : UInt<1>, cout : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[FullAdder.scala 17:18]
    node _io_sum_T_1 = xor(_io_sum_T, io.cin) @[FullAdder.scala 17:25]
    io.sum <= _io_sum_T_1 @[FullAdder.scala 17:10]
    node _io_cout_T = and(io.a, io.b) @[FullAdder.scala 19:20]
    node _io_cout_T_1 = and(io.b, io.cin) @[FullAdder.scala 19:36]
    node _io_cout_T_2 = or(_io_cout_T, _io_cout_T_1) @[FullAdder.scala 19:28]
    node _io_cout_T_3 = and(io.a, io.cin) @[FullAdder.scala 19:54]
    node _io_cout_T_4 = or(_io_cout_T_2, _io_cout_T_3) @[FullAdder.scala 19:46]
    io.cout <= _io_cout_T_4 @[FullAdder.scala 19:11]

  module FullAdderModule_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip cin : UInt<1>, sum : UInt<1>, cout : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[FullAdder.scala 17:18]
    node _io_sum_T_1 = xor(_io_sum_T, io.cin) @[FullAdder.scala 17:25]
    io.sum <= _io_sum_T_1 @[FullAdder.scala 17:10]
    node _io_cout_T = and(io.a, io.b) @[FullAdder.scala 19:20]
    node _io_cout_T_1 = and(io.b, io.cin) @[FullAdder.scala 19:36]
    node _io_cout_T_2 = or(_io_cout_T, _io_cout_T_1) @[FullAdder.scala 19:28]
    node _io_cout_T_3 = and(io.a, io.cin) @[FullAdder.scala 19:54]
    node _io_cout_T_4 = or(_io_cout_T_2, _io_cout_T_3) @[FullAdder.scala 19:46]
    io.cout <= _io_cout_T_4 @[FullAdder.scala 19:11]

  module Adder4Module :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip A : UInt<4>, flip B : UInt<4>, flip Cin : UInt<1>, Sum : UInt<4>, Cout : UInt<1>}

    inst Adder0 of FullAdderModule @[Adder4Bits.scala 14:22]
    Adder0.clock <= clock
    Adder0.reset <= reset
    node _Adder0_io_a_T = bits(io.A, 0, 0) @[Adder4Bits.scala 15:22]
    Adder0.io.a <= _Adder0_io_a_T @[Adder4Bits.scala 15:15]
    node _Adder0_io_b_T = bits(io.B, 0, 0) @[Adder4Bits.scala 16:22]
    Adder0.io.b <= _Adder0_io_b_T @[Adder4Bits.scala 16:15]
    Adder0.io.cin <= io.Cin @[Adder4Bits.scala 17:17]
    inst Adder1 of FullAdderModule_1 @[Adder4Bits.scala 20:22]
    Adder1.clock <= clock
    Adder1.reset <= reset
    node _Adder1_io_a_T = bits(io.A, 1, 1) @[Adder4Bits.scala 21:22]
    Adder1.io.a <= _Adder1_io_a_T @[Adder4Bits.scala 21:15]
    node _Adder1_io_b_T = bits(io.B, 1, 1) @[Adder4Bits.scala 22:22]
    Adder1.io.b <= _Adder1_io_b_T @[Adder4Bits.scala 22:15]
    Adder1.io.cin <= Adder0.io.cout @[Adder4Bits.scala 23:17]
    node s1 = cat(Adder1.io.sum, Adder0.io.sum) @[Cat.scala 33:92]
    inst Adder2 of FullAdderModule_2 @[Adder4Bits.scala 26:22]
    Adder2.clock <= clock
    Adder2.reset <= reset
    node _Adder2_io_a_T = bits(io.A, 2, 2) @[Adder4Bits.scala 27:22]
    Adder2.io.a <= _Adder2_io_a_T @[Adder4Bits.scala 27:15]
    node _Adder2_io_b_T = bits(io.B, 2, 2) @[Adder4Bits.scala 28:22]
    Adder2.io.b <= _Adder2_io_b_T @[Adder4Bits.scala 28:15]
    Adder2.io.cin <= Adder1.io.cout @[Adder4Bits.scala 29:17]
    node s2 = cat(Adder2.io.sum, s1) @[Cat.scala 33:92]
    inst Adder3 of FullAdderModule_3 @[Adder4Bits.scala 32:22]
    Adder3.clock <= clock
    Adder3.reset <= reset
    node _Adder3_io_a_T = bits(io.A, 3, 3) @[Adder4Bits.scala 33:22]
    Adder3.io.a <= _Adder3_io_a_T @[Adder4Bits.scala 33:15]
    node _Adder3_io_b_T = bits(io.B, 3, 3) @[Adder4Bits.scala 34:22]
    Adder3.io.b <= _Adder3_io_b_T @[Adder4Bits.scala 34:15]
    Adder3.io.cin <= Adder2.io.cout @[Adder4Bits.scala 35:17]
    node _io_Sum_T = cat(Adder3.io.sum, s2) @[Cat.scala 33:92]
    io.Sum <= _io_Sum_T @[Adder4Bits.scala 36:10]
    io.Cout <= Adder3.io.cout @[Adder4Bits.scala 37:11]

