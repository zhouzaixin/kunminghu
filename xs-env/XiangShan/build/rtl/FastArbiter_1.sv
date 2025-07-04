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

module FastArbiter_1(
  input         clock,
  input         reset,
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [34:0] io_in_0_bits_tag,
  input  [6:0]  io_in_0_bits_set,
  input         io_in_0_bits_needT,
  input  [6:0]  io_in_0_bits_source,
  input  [43:0] io_in_0_bits_vaddr,
  input  [3:0]  io_in_0_bits_reqsource,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [34:0] io_in_1_bits_tag,
  input  [6:0]  io_in_1_bits_set,
  input         io_in_1_bits_needT,
  input  [6:0]  io_in_1_bits_source,
  input  [43:0] io_in_1_bits_vaddr,
  input  [3:0]  io_in_1_bits_reqsource,
  output        io_in_2_ready,
  input         io_in_2_valid,
  input  [34:0] io_in_2_bits_tag,
  input  [6:0]  io_in_2_bits_set,
  input         io_in_2_bits_needT,
  input  [6:0]  io_in_2_bits_source,
  input  [43:0] io_in_2_bits_vaddr,
  input  [3:0]  io_in_2_bits_reqsource,
  output        io_in_3_ready,
  input         io_in_3_valid,
  input  [34:0] io_in_3_bits_tag,
  input  [6:0]  io_in_3_bits_set,
  input         io_in_3_bits_needT,
  input  [6:0]  io_in_3_bits_source,
  input  [43:0] io_in_3_bits_vaddr,
  input  [3:0]  io_in_3_bits_reqsource,
  input         io_out_ready,
  output        io_out_valid,
  output [34:0] io_out_bits_tag,
  output [6:0]  io_out_bits_set,
  output        io_out_bits_needT,
  output [6:0]  io_out_bits_source,
  output [43:0] io_out_bits_vaddr,
  output [3:0]  io_out_bits_reqsource
);

  wire [3:0] chosenOH;
  wire [3:0] valids = {io_in_3_valid, io_in_2_valid, io_in_1_valid, io_in_0_valid};
  reg  [3:0] pendingMask;
  reg  [3:0] rrGrantMask;
  wire       _rrSelOH_T_5 = rrGrantMask[0] & pendingMask[0];
  wire       _rrSelOH_T_2 = rrGrantMask[1] & pendingMask[1];
  wire       _rrSelOH_T_3 = rrGrantMask[2] & pendingMask[2];
  wire [3:0] rrSelOH =
    {rrGrantMask[3] & pendingMask[3] & {_rrSelOH_T_5, _rrSelOH_T_2, _rrSelOH_T_3} == 3'h0,
     _rrSelOH_T_3 & {_rrSelOH_T_5, _rrSelOH_T_2} == 2'h0,
     _rrSelOH_T_2 & ~_rrSelOH_T_5,
     _rrSelOH_T_5};
  assign chosenOH =
    (|(rrSelOH & valids))
      ? rrSelOH
      : {io_in_3_valid & {io_in_0_valid, io_in_1_valid, io_in_2_valid} == 3'h0,
         io_in_2_valid & {io_in_0_valid, io_in_1_valid} == 2'h0,
         io_in_1_valid & ~io_in_0_valid,
         io_in_0_valid};
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      pendingMask <= 4'h0;
      rrGrantMask <= 4'h0;
    end
    else if (io_out_ready & (|valids)) begin
      pendingMask <= valids & ~chosenOH;
      rrGrantMask <= {|(chosenOH[2:0]), |(chosenOH[1:0]), chosenOH[0], 1'h0};
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
        pendingMask = _RANDOM[/*Zero width*/ 1'b0][3:0];
        rrGrantMask = _RANDOM[/*Zero width*/ 1'b0][7:4];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        pendingMask = 4'h0;
        rrGrantMask = 4'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_in_0_ready = chosenOH[0] & io_out_ready;
  assign io_in_1_ready = chosenOH[1] & io_out_ready;
  assign io_in_2_ready = chosenOH[2] & io_out_ready;
  assign io_in_3_ready = chosenOH[3] & io_out_ready;
  assign io_out_valid = |valids;
  assign io_out_bits_tag =
    (chosenOH[0] ? io_in_0_bits_tag : 35'h0) | (chosenOH[1] ? io_in_1_bits_tag : 35'h0)
    | (chosenOH[2] ? io_in_2_bits_tag : 35'h0) | (chosenOH[3] ? io_in_3_bits_tag : 35'h0);
  assign io_out_bits_set =
    (chosenOH[0] ? io_in_0_bits_set : 7'h0) | (chosenOH[1] ? io_in_1_bits_set : 7'h0)
    | (chosenOH[2] ? io_in_2_bits_set : 7'h0) | (chosenOH[3] ? io_in_3_bits_set : 7'h0);
  assign io_out_bits_needT =
    chosenOH[0] & io_in_0_bits_needT | chosenOH[1] & io_in_1_bits_needT | chosenOH[2]
    & io_in_2_bits_needT | chosenOH[3] & io_in_3_bits_needT;
  assign io_out_bits_source =
    (chosenOH[0] ? io_in_0_bits_source : 7'h0)
    | (chosenOH[1] ? io_in_1_bits_source : 7'h0)
    | (chosenOH[2] ? io_in_2_bits_source : 7'h0)
    | (chosenOH[3] ? io_in_3_bits_source : 7'h0);
  assign io_out_bits_vaddr =
    (chosenOH[0] ? io_in_0_bits_vaddr : 44'h0)
    | (chosenOH[1] ? io_in_1_bits_vaddr : 44'h0)
    | (chosenOH[2] ? io_in_2_bits_vaddr : 44'h0)
    | (chosenOH[3] ? io_in_3_bits_vaddr : 44'h0);
  assign io_out_bits_reqsource =
    (chosenOH[0] ? io_in_0_bits_reqsource : 4'h0)
    | (chosenOH[1] ? io_in_1_bits_reqsource : 4'h0)
    | (chosenOH[2] ? io_in_2_bits_reqsource : 4'h0)
    | (chosenOH[3] ? io_in_3_bits_reqsource : 4'h0);
endmodule

