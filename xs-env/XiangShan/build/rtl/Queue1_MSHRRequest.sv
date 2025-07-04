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

module Queue1_MSHRRequest(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [2:0]  io_enq_bits_channel,
  input  [2:0]  io_enq_bits_opcode,
  input  [2:0]  io_enq_bits_param,
  input  [2:0]  io_enq_bits_size,
  input  [10:0] io_enq_bits_source,
  input  [10:0] io_enq_bits_set,
  input  [30:0] io_enq_bits_tag,
  input  [5:0]  io_enq_bits_off,
  input  [31:0] io_enq_bits_mask,
  input  [3:0]  io_enq_bits_bufIdx,
  input         io_enq_bits_needHint,
  input         io_enq_bits_isPrefetch,
  input         io_enq_bits_isBop,
  input         io_enq_bits_preferCache,
  input         io_enq_bits_dirty,
  input         io_enq_bits_isHit,
  input         io_enq_bits_fromProbeHelper,
  input         io_enq_bits_fromCmoHelper,
  input         io_enq_bits_needProbeAckData,
  input  [3:0]  io_enq_bits_reqSource,
  input         io_deq_ready,
  output        io_deq_valid,
  output [2:0]  io_deq_bits_channel,
  output [2:0]  io_deq_bits_opcode,
  output [2:0]  io_deq_bits_param,
  output [2:0]  io_deq_bits_size,
  output [10:0] io_deq_bits_source,
  output [10:0] io_deq_bits_set,
  output [30:0] io_deq_bits_tag,
  output [5:0]  io_deq_bits_off,
  output [31:0] io_deq_bits_mask,
  output [3:0]  io_deq_bits_bufIdx,
  output        io_deq_bits_needHint,
  output        io_deq_bits_isPrefetch,
  output        io_deq_bits_isBop,
  output        io_deq_bits_preferCache,
  output        io_deq_bits_dirty,
  output        io_deq_bits_fromProbeHelper,
  output        io_deq_bits_fromCmoHelper,
  output        io_deq_bits_needProbeAckData,
  output [3:0]  io_deq_bits_reqSource
);

  wire         io_enq_ready_0;
  reg  [119:0] ram;
  reg          full;
  wire         do_enq = io_enq_ready_0 & io_enq_valid;
  assign io_enq_ready_0 = io_deq_ready | ~full;
  always @(posedge clock) begin
    if (do_enq)
      ram <=
        {io_enq_bits_reqSource,
         io_enq_bits_needProbeAckData,
         io_enq_bits_fromCmoHelper,
         io_enq_bits_fromProbeHelper,
         io_enq_bits_isHit,
         io_enq_bits_dirty,
         io_enq_bits_preferCache,
         io_enq_bits_isBop,
         io_enq_bits_isPrefetch,
         io_enq_bits_needHint,
         io_enq_bits_bufIdx,
         io_enq_bits_mask,
         io_enq_bits_off,
         io_enq_bits_tag,
         io_enq_bits_set,
         io_enq_bits_source,
         io_enq_bits_size,
         io_enq_bits_param,
         io_enq_bits_opcode,
         io_enq_bits_channel};
  end // always @(posedge)
  always @(posedge clock or posedge reset) begin
    if (reset)
      full <= 1'h0;
    else if (~(do_enq == (io_deq_ready & full)))
      full <= do_enq;
  end // always @(posedge, posedge)
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
        ram = {_RANDOM[2'h0][31:1], _RANDOM[2'h1], _RANDOM[2'h2], _RANDOM[2'h3][24:0]};
        full = _RANDOM[2'h0][0];
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        full = 1'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_enq_ready = io_enq_ready_0;
  assign io_deq_valid = full;
  assign io_deq_bits_channel = ram[2:0];
  assign io_deq_bits_opcode = ram[5:3];
  assign io_deq_bits_param = ram[8:6];
  assign io_deq_bits_size = ram[11:9];
  assign io_deq_bits_source = ram[22:12];
  assign io_deq_bits_set = ram[33:23];
  assign io_deq_bits_tag = ram[64:34];
  assign io_deq_bits_off = ram[70:65];
  assign io_deq_bits_mask = ram[102:71];
  assign io_deq_bits_bufIdx = ram[106:103];
  assign io_deq_bits_needHint = ram[107];
  assign io_deq_bits_isPrefetch = ram[108];
  assign io_deq_bits_isBop = ram[109];
  assign io_deq_bits_preferCache = ram[110];
  assign io_deq_bits_dirty = ram[111];
  assign io_deq_bits_fromProbeHelper = ram[113];
  assign io_deq_bits_fromCmoHelper = ram[114];
  assign io_deq_bits_needProbeAckData = ram[115];
  assign io_deq_bits_reqSource = ram[119:116];
endmodule

