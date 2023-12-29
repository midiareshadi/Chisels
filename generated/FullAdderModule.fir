circuit FullAdderModule :
  module FullAdderModule :
    input clock : Clock
    input reset : UInt<1>
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

