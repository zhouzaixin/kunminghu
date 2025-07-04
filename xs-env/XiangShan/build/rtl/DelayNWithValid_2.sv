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

module DelayNWithValid_2(
  input         clock,
  input         reset,
  input  [47:0] io_in_bits_paddr,
  input         io_in_bits_report_to_beu,
  input         io_in_valid,
  output [47:0] io_out_bits_paddr,
  output        io_out_bits_report_to_beu,
  output        io_out_valid
);

  reg        valid_REG;
  reg [47:0] data_paddr;
  reg        data_report_to_beu;
  reg        valid_REG_1;
  reg [47:0] res_bits_paddr;
  reg        res_bits_report_to_beu;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      valid_REG <= 1'h0;
      valid_REG_1 <= 1'h0;
    end
    else begin
      valid_REG <= io_in_valid;
      valid_REG_1 <= valid_REG;
    end
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (io_in_valid) begin
      data_paddr <= io_in_bits_paddr;
      data_report_to_beu <= io_in_bits_report_to_beu;
    end
    if (valid_REG) begin
      res_bits_paddr <= data_paddr;
      res_bits_report_to_beu <= data_report_to_beu;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:3];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [2:0] i = 3'h0; i < 3'h4; i += 3'h1) begin
          _RANDOM[i[1:0]] = `RANDOM;
        end
        valid_REG = _RANDOM[2'h0][0];
        data_paddr = {_RANDOM[2'h0][31:10], _RANDOM[2'h1][25:0]};
        data_report_to_beu = _RANDOM[2'h1][26];
        valid_REG_1 = _RANDOM[2'h1][27];
        res_bits_paddr = {_RANDOM[2'h2][31:5], _RANDOM[2'h3][20:0]};
        res_bits_report_to_beu = _RANDOM[2'h3][21];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        valid_REG = 1'h0;
        valid_REG_1 = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_out_bits_paddr = res_bits_paddr;
  assign io_out_bits_report_to_beu = res_bits_report_to_beu;
  assign io_out_valid = valid_REG_1;
endmodule

