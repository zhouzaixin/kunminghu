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

module VSatpModule(
  input         clock,
  input         reset,
  input         w_wen,
  input  [63:0] w_wdata,
  output [63:0] rdata,
  output [3:0]  regOut_MODE,
  output [15:0] regOut_ASID,
  output [43:0] regOut_PPN,
  input         v,
  input  [3:0]  hgatp_MODE
);

  reg  [3:0]  reg_MODE;
  reg  [15:0] reg_ASID;
  reg  [43:0] reg_PPN;
  wire [2:0]  _GEN =
    {w_wdata[63:60] == 4'h9, w_wdata[63:60] == 4'h8, w_wdata[63:60] == 4'h0};
  wire        _GEN_0 = w_wen & (|_GEN);
  wire        _GEN_1 = w_wen & ~v & _GEN == 3'h0;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      reg_MODE <= 4'h0;
      reg_ASID <= 16'h0;
      reg_PPN <= 44'h0;
    end
    else begin
      if (_GEN_0 | _GEN_1 & w_wen & (|_GEN))
        reg_MODE <= w_wdata[63:60];
      if (_GEN_0 | _GEN_1)
        reg_ASID <= w_wdata[59:44];
      if (_GEN_0 | _GEN_1)
        reg_PPN <=
          w_wdata[43:0]
          & ((hgatp_MODE == 4'h0 ? 44'hFFFFFFFFF : 44'h0)
             | (hgatp_MODE == 4'h8 ? 44'h1FFFFFFF : 44'h0)
             | (hgatp_MODE == 4'h9 ? 44'h3FFFFFFFFF : 44'h0));
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:1];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [1:0] i = 2'h0; i < 2'h2; i += 2'h1) begin
          _RANDOM[i[0]] = `RANDOM;
        end
        reg_MODE = _RANDOM[1'h0][3:0];
        reg_ASID = _RANDOM[1'h0][19:4];
        reg_PPN = {_RANDOM[1'h0][31:20], _RANDOM[1'h1]};
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        reg_MODE = 4'h0;
        reg_ASID = 16'h0;
        reg_PPN = 44'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign rdata = {reg_MODE, reg_ASID, reg_PPN};
  assign regOut_MODE = reg_MODE;
  assign regOut_ASID = reg_ASID;
  assign regOut_PPN = reg_PPN;
endmodule

