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

module HstateenModule(
  input         clock,
  input         reset,
  input         w_wen,
  input  [63:0] w_wdata,
  output [63:0] rdata,
  output        regOut_JVT,
  output        regOut_FCSR,
  output        regOut_C,
  output        regOut_SE0,
  output        regOut_ENVCFG,
  output        regOut_CSRIND,
  output        regOut_AIA,
  output        regOut_IMSIC,
  output        regOut_CONTEXT,
  input         fromMstateen0_C,
  input         fromMstateen0_SE0,
  input         fromMstateen0_ENVCFG,
  input         fromMstateen0_AIA,
  input         fromMstateen0_IMSIC
);

  wire _regOut_C_T;
  wire _regOut_SE0_T;
  wire _regOut_ENVCFG_T;
  wire _regOut_AIA_T;
  wire _regOut_IMSIC_T;
  reg  reg_C;
  reg  reg_SE0;
  reg  reg_ENVCFG;
  reg  reg_AIA;
  reg  reg_IMSIC;
  assign _regOut_IMSIC_T = reg_IMSIC & fromMstateen0_IMSIC;
  assign _regOut_AIA_T = reg_AIA & fromMstateen0_AIA;
  assign _regOut_ENVCFG_T = reg_ENVCFG & fromMstateen0_ENVCFG;
  assign _regOut_SE0_T = reg_SE0 & fromMstateen0_SE0;
  assign _regOut_C_T = reg_C & fromMstateen0_C;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      reg_C <= 1'h1;
      reg_SE0 <= 1'h1;
      reg_ENVCFG <= 1'h1;
      reg_AIA <= 1'h1;
      reg_IMSIC <= 1'h1;
    end
    else if (w_wen) begin
      reg_C <= w_wdata[0];
      reg_SE0 <= w_wdata[63];
      reg_ENVCFG <= w_wdata[62];
      reg_AIA <= w_wdata[59];
      reg_IMSIC <= w_wdata[58];
    end
  end // always @(posedge, posedge)
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
        reg_C = _RANDOM[/*Zero width*/ 1'b0][2];
        reg_SE0 = _RANDOM[/*Zero width*/ 1'b0][3];
        reg_ENVCFG = _RANDOM[/*Zero width*/ 1'b0][4];
        reg_AIA = _RANDOM[/*Zero width*/ 1'b0][6];
        reg_IMSIC = _RANDOM[/*Zero width*/ 1'b0][7];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        reg_C = 1'h1;
        reg_SE0 = 1'h1;
        reg_ENVCFG = 1'h1;
        reg_AIA = 1'h1;
        reg_IMSIC = 1'h1;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign rdata =
    {_regOut_SE0_T,
     _regOut_ENVCFG_T,
     2'h1,
     _regOut_AIA_T,
     _regOut_IMSIC_T,
     57'h0,
     _regOut_C_T};
  assign regOut_JVT = 1'h0;
  assign regOut_FCSR = 1'h0;
  assign regOut_C = _regOut_C_T;
  assign regOut_SE0 = _regOut_SE0_T;
  assign regOut_ENVCFG = _regOut_ENVCFG_T;
  assign regOut_CSRIND = 1'h1;
  assign regOut_AIA = _regOut_AIA_T;
  assign regOut_IMSIC = _regOut_IMSIC_T;
  assign regOut_CONTEXT = 1'h0;
endmodule

