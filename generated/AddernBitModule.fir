circuit AddernBitModule :
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

  module AddernBitModule :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip A : UInt<3>, flip B : UInt<3>, flip Cin : UInt<1>, Sum : UInt<3>, Cout : UInt<1>}

    inst FullAdderModule of FullAdderModule @[nBitAdder.scala 15:35]
    FullAdderModule.clock <= clock
    FullAdderModule.reset <= reset
    inst FullAdderModule_1 of FullAdderModule_1 @[nBitAdder.scala 15:35]
    FullAdderModule_1.clock <= clock
    FullAdderModule_1.reset <= reset
    inst FullAdderModule_2 of FullAdderModule_2 @[nBitAdder.scala 15:35]
    FullAdderModule_2.clock <= clock
    FullAdderModule_2.reset <= reset
    wire carry : UInt<1>[4] @[nBitAdder.scala 16:19]
    wire sum : UInt<1>[3] @[nBitAdder.scala 17:19]
    carry[0] <= io.Cin @[nBitAdder.scala 19:12]
    node _T = bits(io.A, 0, 0) @[nBitAdder.scala 22:21]
    FullAdderModule.io.a <= _T @[nBitAdder.scala 22:14]
    node _T_1 = bits(io.B, 0, 0) @[nBitAdder.scala 23:21]
    FullAdderModule.io.b <= _T_1 @[nBitAdder.scala 23:14]
    FullAdderModule.io.cin <= carry[0] @[nBitAdder.scala 24:16]
    carry[1] <= FullAdderModule.io.cout @[nBitAdder.scala 25:16]
    node _sum_0_T = bits(FullAdderModule.io.sum, 0, 0) @[nBitAdder.scala 26:26]
    sum[0] <= _sum_0_T @[nBitAdder.scala 26:12]
    node _T_2 = bits(io.A, 1, 1) @[nBitAdder.scala 22:21]
    FullAdderModule_1.io.a <= _T_2 @[nBitAdder.scala 22:14]
    node _T_3 = bits(io.B, 1, 1) @[nBitAdder.scala 23:21]
    FullAdderModule_1.io.b <= _T_3 @[nBitAdder.scala 23:14]
    FullAdderModule_1.io.cin <= carry[1] @[nBitAdder.scala 24:16]
    carry[2] <= FullAdderModule_1.io.cout @[nBitAdder.scala 25:16]
    node _sum_1_T = bits(FullAdderModule_1.io.sum, 0, 0) @[nBitAdder.scala 26:26]
    sum[1] <= _sum_1_T @[nBitAdder.scala 26:12]
    node _T_4 = bits(io.A, 2, 2) @[nBitAdder.scala 22:21]
    FullAdderModule_2.io.a <= _T_4 @[nBitAdder.scala 22:14]
    node _T_5 = bits(io.B, 2, 2) @[nBitAdder.scala 23:21]
    FullAdderModule_2.io.b <= _T_5 @[nBitAdder.scala 23:14]
    FullAdderModule_2.io.cin <= carry[2] @[nBitAdder.scala 24:16]
    carry[3] <= FullAdderModule_2.io.cout @[nBitAdder.scala 25:16]
    node _sum_2_T = bits(FullAdderModule_2.io.sum, 0, 0) @[nBitAdder.scala 26:26]
    sum[2] <= _sum_2_T @[nBitAdder.scala 26:12]
    node io_Sum_hi = cat(sum[2], sum[1]) @[nBitAdder.scala 28:17]
    node _io_Sum_T = cat(io_Sum_hi, sum[0]) @[nBitAdder.scala 28:17]
    io.Sum <= _io_Sum_T @[nBitAdder.scala 28:10]
    io.Cout <= carry[3] @[nBitAdder.scala 29:11]

