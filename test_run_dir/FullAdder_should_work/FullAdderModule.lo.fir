FIRRTL version 1.1.0
circuit FullAdderModule :
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
