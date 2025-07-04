// Generated by CIRCT firtool-1.62.1
// Standard header to adapt well known macros for register randomization.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

// Include register initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS

// Include rmemory initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_MEM_
    `define ENABLE_INITIAL_MEM_
  `endif // not def ENABLE_INITIAL_MEM_
`endif // not def SYNTHESIS

module ShiftLeftPriorityWithLZDResult_8(
  input  [10:0] io_src,
  input  [10:0] io_priority_shiftValue,
  output [10:0] io_lshift_result,
  output [3:0]  io_lzd_result
);

  wire [14:0] lshift_result_lzd =
    io_priority_shiftValue[10]
      ? {io_src, 4'h0}
      : io_priority_shiftValue[9]
          ? {io_src[9:0], 5'h1}
          : io_priority_shiftValue[8]
              ? {io_src[8:0], 6'h2}
              : io_priority_shiftValue[7]
                  ? {io_src[7:0], 7'h3}
                  : io_priority_shiftValue[6]
                      ? {io_src[6:0], 8'h4}
                      : io_priority_shiftValue[5]
                          ? {io_src[5:0], 9'h5}
                          : io_priority_shiftValue[4]
                              ? {io_src[4:0], 10'h6}
                              : io_priority_shiftValue[3]
                                  ? {io_src[3:0], 11'h7}
                                  : io_priority_shiftValue[2]
                                      ? {io_src[2:0], 12'h8}
                                      : io_priority_shiftValue[1]
                                          ? {io_src[1:0], 13'h9}
                                          : {io_priority_shiftValue[0]
                                               ? {io_src[0], 10'h0}
                                               : 11'h0,
                                             3'h5,
                                             ~(io_priority_shiftValue[0])};
  assign io_lshift_result = lshift_result_lzd[14:4];
  assign io_lzd_result = lshift_result_lzd[3:0];
endmodule

