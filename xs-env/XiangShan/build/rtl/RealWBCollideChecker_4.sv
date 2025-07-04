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

module RealWBCollideChecker_4(
  input        io_in_3_valid,
  input        io_in_3_bits_vlWen,
  input  [4:0] io_in_3_bits_pdest,
  input  [7:0] io_in_3_bits_data,
  input        io_in_2_valid,
  input        io_in_2_bits_vlWen,
  input  [4:0] io_in_2_bits_pdest,
  input  [7:0] io_in_2_bits_data,
  input        io_in_1_valid,
  input        io_in_1_bits_vlWen,
  input  [4:0] io_in_1_bits_pdest,
  input  [7:0] io_in_1_bits_data,
  input        io_in_0_valid,
  input        io_in_0_bits_vlWen,
  input  [4:0] io_in_0_bits_pdest,
  input  [7:0] io_in_0_bits_data,
  output       io_out_3_valid,
  output       io_out_3_bits_vlWen,
  output [4:0] io_out_3_bits_pdest,
  output [7:0] io_out_3_bits_data,
  output       io_out_2_valid,
  output       io_out_2_bits_vlWen,
  output [4:0] io_out_2_bits_pdest,
  output [7:0] io_out_2_bits_data,
  output       io_out_1_valid,
  output       io_out_1_bits_vlWen,
  output [4:0] io_out_1_bits_pdest,
  output [7:0] io_out_1_bits_data,
  output       io_out_0_valid,
  output       io_out_0_bits_vlWen,
  output [4:0] io_out_0_bits_pdest,
  output [7:0] io_out_0_bits_data
);

  RealWBArbiter_26 arbiters_0 (
    .io_in_0_valid      (io_in_0_valid),
    .io_in_0_bits_vlWen (io_in_0_bits_vlWen),
    .io_in_0_bits_pdest (io_in_0_bits_pdest),
    .io_in_0_bits_data  (io_in_0_bits_data),
    .io_out_valid       (io_out_0_valid),
    .io_out_bits_vlWen  (io_out_0_bits_vlWen),
    .io_out_bits_pdest  (io_out_0_bits_pdest),
    .io_out_bits_data   (io_out_0_bits_data)
  );
  RealWBArbiter_26 arbiters_1 (
    .io_in_0_valid      (io_in_1_valid),
    .io_in_0_bits_vlWen (io_in_1_bits_vlWen),
    .io_in_0_bits_pdest (io_in_1_bits_pdest),
    .io_in_0_bits_data  (io_in_1_bits_data),
    .io_out_valid       (io_out_1_valid),
    .io_out_bits_vlWen  (io_out_1_bits_vlWen),
    .io_out_bits_pdest  (io_out_1_bits_pdest),
    .io_out_bits_data   (io_out_1_bits_data)
  );
  RealWBArbiter_26 arbiters_2 (
    .io_in_0_valid      (io_in_2_valid),
    .io_in_0_bits_vlWen (io_in_2_bits_vlWen),
    .io_in_0_bits_pdest (io_in_2_bits_pdest),
    .io_in_0_bits_data  (io_in_2_bits_data),
    .io_out_valid       (io_out_2_valid),
    .io_out_bits_vlWen  (io_out_2_bits_vlWen),
    .io_out_bits_pdest  (io_out_2_bits_pdest),
    .io_out_bits_data   (io_out_2_bits_data)
  );
  RealWBArbiter_26 arbiters_3 (
    .io_in_0_valid      (io_in_3_valid),
    .io_in_0_bits_vlWen (io_in_3_bits_vlWen),
    .io_in_0_bits_pdest (io_in_3_bits_pdest),
    .io_in_0_bits_data  (io_in_3_bits_data),
    .io_out_valid       (io_out_3_valid),
    .io_out_bits_vlWen  (io_out_3_bits_vlWen),
    .io_out_bits_pdest  (io_out_3_bits_pdest),
    .io_out_bits_data   (io_out_3_bits_data)
  );
endmodule

