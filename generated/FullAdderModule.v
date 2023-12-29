module FullAdderModule(
  input   clock,
  input   reset,
  input   io_a,
  input   io_b,
  input   io_cin,
  output  io_sum,
  output  io_cout
);
  assign io_sum = io_a ^ io_b ^ io_cin; // @[FullAdder.scala 17:25]
  assign io_cout = io_a & io_b | io_b & io_cin | io_a & io_cin; // @[FullAdder.scala 19:46]
endmodule
