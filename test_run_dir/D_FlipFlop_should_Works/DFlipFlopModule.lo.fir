FIRRTL version 1.1.0
circuit DFlipFlopModule :
  module DFlipFlopModule :
    input clock : Clock
    input reset : UInt<1>
    input io_d : UInt<1>
    output io_q : UInt<1>

    reg reg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg) @[D_Flip_Flop.scala 12:20]
    io_q <= reg @[D_Flip_Flop.scala 14:8]
    reg <= mux(reset, UInt<1>("h0"), io_d) @[D_Flip_Flop.scala 12:{20,20,20}]
