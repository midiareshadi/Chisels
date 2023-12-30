circuit MovingAverage3 :
  module MovingAverage3 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<4>, out : UInt<4>}

    reg z1 : UInt, clock with :
      reset => (UInt<1>("h0"), z1) @[FIR.scala 12:19]
    z1 <= io.in @[FIR.scala 12:19]
    reg z2 : UInt, clock with :
      reset => (UInt<1>("h0"), z2) @[FIR.scala 13:19]
    z2 <= z1 @[FIR.scala 13:19]
    node _io_out_T = mul(io.in, UInt<1>("h1")) @[FIR.scala 15:20]
    node _io_out_T_1 = mul(z1, UInt<1>("h1")) @[FIR.scala 15:33]
    node _io_out_T_2 = add(_io_out_T, _io_out_T_1) @[FIR.scala 15:27]
    node _io_out_T_3 = tail(_io_out_T_2, 1) @[FIR.scala 15:27]
    node _io_out_T_4 = mul(z2, UInt<1>("h1")) @[FIR.scala 15:46]
    node _io_out_T_5 = add(_io_out_T_3, _io_out_T_4) @[FIR.scala 15:40]
    node _io_out_T_6 = tail(_io_out_T_5, 1) @[FIR.scala 15:40]
    io.out <= _io_out_T_6 @[FIR.scala 15:10]

