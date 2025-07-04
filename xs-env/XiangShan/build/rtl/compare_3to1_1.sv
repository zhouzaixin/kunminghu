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

module compare_3to1_1(
  input  [31:0] io_a,
  input  [31:0] io_b,
  input  [31:0] io_c,
  input         io_max,
  input         io_signed,
  output [31:0] io_d
);

  wire        _adder_xb_2_io_cout;
  wire        _adder_xb_1_io_cout;
  wire        _adder_xb_io_cout;
  wire [95:0] vs_lo_inv = ~{io_b, {2{io_c}}};
  wire        less_0 =
    io_signed ? io_b[31] ^ vs_lo_inv[31] ^ _adder_xb_io_cout : ~_adder_xb_io_cout;
  wire        less_1 =
    io_signed ? io_a[31] ^ vs_lo_inv[63] ^ _adder_xb_1_io_cout : ~_adder_xb_1_io_cout;
  wire        less_2 =
    io_signed ? io_a[31] ^ vs_lo_inv[95] ^ _adder_xb_2_io_cout : ~_adder_xb_2_io_cout;
  Adder_xb_3 adder_xb (
    .io_in1  (vs_lo_inv[31:0]),
    .io_in2  (io_b),
    .io_cout (_adder_xb_io_cout)
  );
  Adder_xb_3 adder_xb_1 (
    .io_in1  (vs_lo_inv[63:32]),
    .io_in2  (io_a),
    .io_cout (_adder_xb_1_io_cout)
  );
  Adder_xb_3 adder_xb_2 (
    .io_in1  (vs_lo_inv[95:64]),
    .io_in2  (io_a),
    .io_cout (_adder_xb_2_io_cout)
  );
  assign io_d =
    less_2 & less_1 & ~io_max | ~less_2 & ~less_1 & io_max
      ? io_a
      : ~less_2 & less_0 & ~io_max | less_2 & ~less_0 & io_max
          ? io_b
          : ~less_1 & ~less_0 & ~io_max | less_1 & less_0 & io_max ? io_c : 32'h0;
endmodule

