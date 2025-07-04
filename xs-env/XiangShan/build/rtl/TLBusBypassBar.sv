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

module TLBusBypassBar(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [3:0]  auto_in_a_bits_opcode,
  input  [8:0]  auto_in_a_bits_address,
  input  [31:0] auto_in_a_bits_data,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output        auto_in_d_bits_denied,
  output [31:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_1_a_ready,
  output        auto_out_1_a_valid,
  output [3:0]  auto_out_1_a_bits_opcode,
  output [8:0]  auto_out_1_a_bits_address,
  output [31:0] auto_out_1_a_bits_data,
  output        auto_out_1_d_ready,
  input         auto_out_1_d_valid,
  input  [3:0]  auto_out_1_d_bits_opcode,
  input         auto_out_1_d_bits_denied,
  input  [31:0] auto_out_1_d_bits_data,
  input         auto_out_1_d_bits_corrupt,
  input         auto_out_0_a_ready,
  output        auto_out_0_a_valid,
  output [3:0]  auto_out_0_a_bits_opcode,
  output        auto_out_0_d_ready,
  input         auto_out_0_d_valid,
  input  [3:0]  auto_out_0_d_bits_opcode,
  input         auto_out_0_d_bits_denied,
  input         auto_out_0_d_bits_corrupt,
  input         io_bypass
);

  wire [1:0] nodeIn_d_bits_opcode;
  wire       nodeIn_d_valid;
  wire       nodeIn_a_ready;
  reg        in_reset;
  reg        bypass_reg;
  wire       bypass = in_reset ? io_bypass : bypass_reg;
  reg  [1:0] flight;
  wire       r_3 = nodeIn_a_ready & auto_in_a_valid;
  reg        r_counter;
  wire       d_dec = auto_in_d_ready & nodeIn_d_valid;
  reg        r_counter_3;
  wire [1:0] _next_flight_T_10 =
    2'(2'(flight
          + 2'({1'h0,
                d_dec & ~r_counter_3 & nodeIn_d_bits_opcode[1]
                  & ~(nodeIn_d_bits_opcode[0])} + {1'h0, r_3 & ~r_counter}))
       - {1'h0, d_dec});
  reg        stall_counter;
  wire       stall = bypass != io_bypass & ~stall_counter;
  assign nodeIn_a_ready = ~stall & (bypass ? auto_out_0_a_ready : auto_out_1_a_ready);
  assign nodeIn_d_valid = bypass ? auto_out_0_d_valid : auto_out_1_d_valid;
  assign nodeIn_d_bits_opcode =
    bypass ? auto_out_0_d_bits_opcode[2:1] : auto_out_1_d_bits_opcode[2:1];
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      in_reset <= 1'h1;
      flight <= 2'h0;
      r_counter <= 1'h0;
      r_counter_3 <= 1'h0;
      stall_counter <= 1'h0;
    end
    else begin
      in_reset <= 1'h0;
      flight <= _next_flight_T_10;
      r_counter <= (~r_3 | 1'(r_counter - 1'h1)) & r_counter;
      r_counter_3 <= (~d_dec | 1'(r_counter_3 - 1'h1)) & r_counter_3;
      stall_counter <= (~r_3 | 1'(stall_counter - 1'h1)) & stall_counter;
    end
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (in_reset | _next_flight_T_10 == 2'h0)
      bypass_reg <= io_bypass;
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:0];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM[/*Zero width*/ 1'b0] = `RANDOM;
        in_reset = _RANDOM[/*Zero width*/ 1'b0][0];
        bypass_reg = _RANDOM[/*Zero width*/ 1'b0][1];
        flight = _RANDOM[/*Zero width*/ 1'b0][3:2];
        r_counter = _RANDOM[/*Zero width*/ 1'b0][4];
        r_counter_3 = _RANDOM[/*Zero width*/ 1'b0][7];
        stall_counter = _RANDOM[/*Zero width*/ 1'b0][9];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        in_reset = 1'h1;
        flight = 2'h0;
        r_counter = 1'h0;
        r_counter_3 = 1'h0;
        stall_counter = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign auto_in_a_ready = nodeIn_a_ready;
  assign auto_in_d_valid = nodeIn_d_valid;
  assign auto_in_d_bits_denied =
    bypass ? auto_out_0_d_bits_denied : auto_out_1_d_bits_denied;
  assign auto_in_d_bits_data = bypass ? 32'h0 : auto_out_1_d_bits_data;
  assign auto_in_d_bits_corrupt =
    bypass ? auto_out_0_d_bits_corrupt : auto_out_1_d_bits_corrupt;
  assign auto_out_1_a_valid = ~stall & auto_in_a_valid & ~bypass;
  assign auto_out_1_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_1_a_bits_address = auto_in_a_bits_address;
  assign auto_out_1_a_bits_data = auto_in_a_bits_data;
  assign auto_out_1_d_ready = auto_in_d_ready & ~bypass;
  assign auto_out_0_a_valid = ~stall & auto_in_a_valid & bypass;
  assign auto_out_0_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_0_d_ready = auto_in_d_ready & bypass;
endmodule

