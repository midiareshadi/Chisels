module MovingAverage3(
  input        clock,
  input        reset,
  input  [3:0] io_in,
  output [3:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] z1; // @[FIR.scala 12:19]
  reg [3:0] z2; // @[FIR.scala 13:19]
  wire [4:0] _io_out_T = io_in * 1'h1; // @[FIR.scala 15:20]
  wire [4:0] _io_out_T_1 = z1 * 1'h1; // @[FIR.scala 15:33]
  wire [4:0] _io_out_T_3 = _io_out_T + _io_out_T_1; // @[FIR.scala 15:27]
  wire [4:0] _io_out_T_4 = z2 * 1'h1; // @[FIR.scala 15:46]
  wire [4:0] _io_out_T_6 = _io_out_T_3 + _io_out_T_4; // @[FIR.scala 15:40]
  assign io_out = _io_out_T_6[3:0]; // @[FIR.scala 15:10]
  always @(posedge clock) begin
    z1 <= io_in; // @[FIR.scala 12:19]
    z2 <= z1; // @[FIR.scala 13:19]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  z1 = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  z2 = _RAND_1[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
