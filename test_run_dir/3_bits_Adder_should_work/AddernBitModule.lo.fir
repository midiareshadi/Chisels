FIRRTL version 1.1.0
circuit AddernBitModule :
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

  module AddernBitModule :
    input clock : Clock
    input reset : UInt<1>
    input io_A : UInt<3>
    input io_B : UInt<3>
    input io_Cin : UInt<1>
    output io_Sum : UInt<3>
    output io_Cout : UInt<1>

    inst FullAdderModule of FullAdderModule @[nBitAdder.scala 15:35]
    inst FullAdderModule_1 of FullAdderModule @[nBitAdder.scala 15:35]
    inst FullAdderModule_2 of FullAdderModule @[nBitAdder.scala 15:35]
    node _T = bits(io_A, 0, 0) @[nBitAdder.scala 22:21]
    node _T_1 = bits(io_B, 0, 0) @[nBitAdder.scala 23:21]
    node _sum_0_T = bits(FullAdderModule.io_sum, 0, 0) @[nBitAdder.scala 26:26]
    node _T_2 = bits(io_A, 1, 1) @[nBitAdder.scala 22:21]
    node _T_3 = bits(io_B, 1, 1) @[nBitAdder.scala 23:21]
    node _sum_1_T = bits(FullAdderModule_1.io_sum, 0, 0) @[nBitAdder.scala 26:26]
    node _T_4 = bits(io_A, 2, 2) @[nBitAdder.scala 22:21]
    node _T_5 = bits(io_B, 2, 2) @[nBitAdder.scala 23:21]
    node _sum_2_T = bits(FullAdderModule_2.io_sum, 0, 0) @[nBitAdder.scala 26:26]
    node sum_2 = _sum_2_T @[nBitAdder.scala 17:19 26:12]
    node sum_1 = _sum_1_T @[nBitAdder.scala 17:19 26:12]
    node io_Sum_hi = cat(sum_2, sum_1) @[nBitAdder.scala 28:17]
    node sum_0 = _sum_0_T @[nBitAdder.scala 17:19 26:12]
    node _io_Sum_T = cat(io_Sum_hi, sum_0) @[nBitAdder.scala 28:17]
    node carry_0 = io_Cin @[nBitAdder.scala 16:19 19:12]
    node carry_1 = FullAdderModule.io_cout @[nBitAdder.scala 16:19 25:16]
    node carry_2 = FullAdderModule_1.io_cout @[nBitAdder.scala 16:19 25:16]
    node carry_3 = FullAdderModule_2.io_cout @[nBitAdder.scala 16:19 25:16]
    io_Sum <= _io_Sum_T @[nBitAdder.scala 28:10]
    io_Cout <= carry_3 @[nBitAdder.scala 29:11]
    FullAdderModule.clock <= clock
    FullAdderModule.reset <= reset
    FullAdderModule.io_a <= _T @[nBitAdder.scala 22:14]
    FullAdderModule.io_b <= _T_1 @[nBitAdder.scala 23:14]
    FullAdderModule.io_cin <= carry_0 @[nBitAdder.scala 24:16]
    FullAdderModule_1.clock <= clock
    FullAdderModule_1.reset <= reset
    FullAdderModule_1.io_a <= _T_2 @[nBitAdder.scala 22:14]
    FullAdderModule_1.io_b <= _T_3 @[nBitAdder.scala 23:14]
    FullAdderModule_1.io_cin <= carry_1 @[nBitAdder.scala 24:16]
    FullAdderModule_2.clock <= clock
    FullAdderModule_2.reset <= reset
    FullAdderModule_2.io_a <= _T_4 @[nBitAdder.scala 22:14]
    FullAdderModule_2.io_b <= _T_5 @[nBitAdder.scala 23:14]
    FullAdderModule_2.io_cin <= carry_2 @[nBitAdder.scala 24:16]
