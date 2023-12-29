circuit DFlipFlopModule :
  module DFlipFlopModule :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip d : UInt<1>, q : UInt<1>}

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[D_Flip_Flop.scala 12:20]
    reg <= io.d @[D_Flip_Flop.scala 12:20]
    io.q <= reg @[D_Flip_Flop.scala 14:8]

