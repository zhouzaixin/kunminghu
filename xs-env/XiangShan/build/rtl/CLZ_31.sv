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

module CLZ_31(
  input  [23:0] io_in,
  output [4:0]  io_out
);

  assign io_out =
    io_in[23]
      ? 5'h0
      : io_in[22]
          ? 5'h1
          : io_in[21]
              ? 5'h2
              : io_in[20]
                  ? 5'h3
                  : io_in[19]
                      ? 5'h4
                      : io_in[18]
                          ? 5'h5
                          : io_in[17]
                              ? 5'h6
                              : io_in[16]
                                  ? 5'h7
                                  : io_in[15]
                                      ? 5'h8
                                      : io_in[14]
                                          ? 5'h9
                                          : io_in[13]
                                              ? 5'hA
                                              : io_in[12]
                                                  ? 5'hB
                                                  : io_in[11]
                                                      ? 5'hC
                                                      : io_in[10]
                                                          ? 5'hD
                                                          : io_in[9]
                                                              ? 5'hE
                                                              : io_in[8]
                                                                  ? 5'hF
                                                                  : io_in[7]
                                                                      ? 5'h10
                                                                      : io_in[6]
                                                                          ? 5'h11
                                                                          : io_in[5]
                                                                              ? 5'h12
                                                                              : io_in[4]
                                                                                  ? 5'h13
                                                                                  : io_in[3]
                                                                                      ? 5'h14
                                                                                      : io_in[2]
                                                                                          ? 5'h15
                                                                                          : io_in[1]
                                                                                              ? 5'h16
                                                                                              : io_in[0]
                                                                                                  ? 5'h17
                                                                                                  : 5'h18;
endmodule

