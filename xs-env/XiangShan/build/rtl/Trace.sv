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

module Trace(
  input        clock,
  input        reset,
  input        io_in_fromEncoder_enable,
  input        io_in_fromEncoder_stall,
  input        io_in_fromRob_blocks_0_valid,
  input  [5:0] io_in_fromRob_blocks_0_bits_ftqIdx_value,
  input  [3:0] io_in_fromRob_blocks_0_bits_ftqOffset,
  input  [3:0] io_in_fromRob_blocks_0_bits_tracePipe_itype,
  input  [3:0] io_in_fromRob_blocks_0_bits_tracePipe_iretire,
  input        io_in_fromRob_blocks_0_bits_tracePipe_ilastsize,
  input        io_in_fromRob_blocks_1_valid,
  input  [5:0] io_in_fromRob_blocks_1_bits_ftqIdx_value,
  input  [3:0] io_in_fromRob_blocks_1_bits_ftqOffset,
  input  [3:0] io_in_fromRob_blocks_1_bits_tracePipe_itype,
  input  [3:0] io_in_fromRob_blocks_1_bits_tracePipe_iretire,
  input        io_in_fromRob_blocks_1_bits_tracePipe_ilastsize,
  input        io_in_fromRob_blocks_2_valid,
  input  [5:0] io_in_fromRob_blocks_2_bits_ftqIdx_value,
  input  [3:0] io_in_fromRob_blocks_2_bits_ftqOffset,
  input  [3:0] io_in_fromRob_blocks_2_bits_tracePipe_itype,
  input  [3:0] io_in_fromRob_blocks_2_bits_tracePipe_iretire,
  input        io_in_fromRob_blocks_2_bits_tracePipe_ilastsize,
  input        io_in_fromRob_blocks_3_valid,
  input  [5:0] io_in_fromRob_blocks_3_bits_ftqIdx_value,
  input  [3:0] io_in_fromRob_blocks_3_bits_ftqOffset,
  input  [3:0] io_in_fromRob_blocks_3_bits_tracePipe_itype,
  input  [3:0] io_in_fromRob_blocks_3_bits_tracePipe_iretire,
  input        io_in_fromRob_blocks_3_bits_tracePipe_ilastsize,
  input        io_in_fromRob_blocks_4_valid,
  input  [5:0] io_in_fromRob_blocks_4_bits_ftqIdx_value,
  input  [3:0] io_in_fromRob_blocks_4_bits_ftqOffset,
  input  [3:0] io_in_fromRob_blocks_4_bits_tracePipe_itype,
  input  [3:0] io_in_fromRob_blocks_4_bits_tracePipe_iretire,
  input        io_in_fromRob_blocks_4_bits_tracePipe_ilastsize,
  input        io_in_fromRob_blocks_5_valid,
  input  [5:0] io_in_fromRob_blocks_5_bits_ftqIdx_value,
  input  [3:0] io_in_fromRob_blocks_5_bits_ftqOffset,
  input  [3:0] io_in_fromRob_blocks_5_bits_tracePipe_itype,
  input  [3:0] io_in_fromRob_blocks_5_bits_tracePipe_iretire,
  input        io_in_fromRob_blocks_5_bits_tracePipe_ilastsize,
  input        io_in_fromRob_blocks_6_valid,
  input  [5:0] io_in_fromRob_blocks_6_bits_ftqIdx_value,
  input  [3:0] io_in_fromRob_blocks_6_bits_ftqOffset,
  input  [3:0] io_in_fromRob_blocks_6_bits_tracePipe_itype,
  input  [3:0] io_in_fromRob_blocks_6_bits_tracePipe_iretire,
  input        io_in_fromRob_blocks_6_bits_tracePipe_ilastsize,
  input        io_in_fromRob_blocks_7_valid,
  input  [5:0] io_in_fromRob_blocks_7_bits_ftqIdx_value,
  input  [3:0] io_in_fromRob_blocks_7_bits_ftqOffset,
  input  [3:0] io_in_fromRob_blocks_7_bits_tracePipe_itype,
  input  [3:0] io_in_fromRob_blocks_7_bits_tracePipe_iretire,
  input        io_in_fromRob_blocks_7_bits_tracePipe_ilastsize,
  output       io_out_toPcMem_blocks_0_valid,
  output [5:0] io_out_toPcMem_blocks_0_bits_ftqIdx_value,
  output       io_out_toPcMem_blocks_1_valid,
  output [5:0] io_out_toPcMem_blocks_1_bits_ftqIdx_value,
  output       io_out_toPcMem_blocks_2_valid,
  output [5:0] io_out_toPcMem_blocks_2_bits_ftqIdx_value,
  output       io_out_toEncoder_blocks_0_valid,
  output [3:0] io_out_toEncoder_blocks_0_bits_ftqOffset,
  output [3:0] io_out_toEncoder_blocks_0_bits_tracePipe_itype,
  output [6:0] io_out_toEncoder_blocks_0_bits_tracePipe_iretire,
  output       io_out_toEncoder_blocks_0_bits_tracePipe_ilastsize,
  output       io_out_toEncoder_blocks_1_valid,
  output [3:0] io_out_toEncoder_blocks_1_bits_ftqOffset,
  output [3:0] io_out_toEncoder_blocks_1_bits_tracePipe_itype,
  output [6:0] io_out_toEncoder_blocks_1_bits_tracePipe_iretire,
  output       io_out_toEncoder_blocks_1_bits_tracePipe_ilastsize,
  output       io_out_toEncoder_blocks_2_valid,
  output [3:0] io_out_toEncoder_blocks_2_bits_ftqOffset,
  output [3:0] io_out_toEncoder_blocks_2_bits_tracePipe_itype,
  output [6:0] io_out_toEncoder_blocks_2_bits_tracePipe_iretire,
  output       io_out_toEncoder_blocks_2_bits_tracePipe_ilastsize,
  output       io_out_blockRobCommit
);

  wire       _traceBuffer_io_out_blockCommit;
  wire       _traceBuffer_io_out_groups_blocks_0_valid;
  wire [3:0] _traceBuffer_io_out_groups_blocks_0_bits_ftqOffset;
  wire [3:0] _traceBuffer_io_out_groups_blocks_0_bits_tracePipe_itype;
  wire [6:0] _traceBuffer_io_out_groups_blocks_0_bits_tracePipe_iretire;
  wire       _traceBuffer_io_out_groups_blocks_0_bits_tracePipe_ilastsize;
  wire       _traceBuffer_io_out_groups_blocks_1_valid;
  wire [3:0] _traceBuffer_io_out_groups_blocks_1_bits_ftqOffset;
  wire [3:0] _traceBuffer_io_out_groups_blocks_1_bits_tracePipe_itype;
  wire [6:0] _traceBuffer_io_out_groups_blocks_1_bits_tracePipe_iretire;
  wire       _traceBuffer_io_out_groups_blocks_1_bits_tracePipe_ilastsize;
  wire       _traceBuffer_io_out_groups_blocks_2_valid;
  wire [3:0] _traceBuffer_io_out_groups_blocks_2_bits_ftqOffset;
  wire [3:0] _traceBuffer_io_out_groups_blocks_2_bits_tracePipe_itype;
  wire [6:0] _traceBuffer_io_out_groups_blocks_2_bits_tracePipe_iretire;
  wire       _traceBuffer_io_out_groups_blocks_2_bits_tracePipe_ilastsize;
  reg        s1_out_blocks_0_valid_r;
  reg  [5:0] s1_out_blocks_0_bits_r_ftqIdx_value;
  reg  [3:0] s1_out_blocks_0_bits_r_ftqOffset;
  reg  [3:0] s1_out_blocks_0_bits_r_tracePipe_itype;
  reg  [3:0] s1_out_blocks_0_bits_r_tracePipe_iretire;
  reg        s1_out_blocks_0_bits_r_tracePipe_ilastsize;
  reg        s1_out_blocks_1_valid_r;
  reg  [5:0] s1_out_blocks_1_bits_r_ftqIdx_value;
  reg  [3:0] s1_out_blocks_1_bits_r_ftqOffset;
  reg  [3:0] s1_out_blocks_1_bits_r_tracePipe_itype;
  reg  [3:0] s1_out_blocks_1_bits_r_tracePipe_iretire;
  reg        s1_out_blocks_1_bits_r_tracePipe_ilastsize;
  reg        s1_out_blocks_2_valid_r;
  reg  [5:0] s1_out_blocks_2_bits_r_ftqIdx_value;
  reg  [3:0] s1_out_blocks_2_bits_r_ftqOffset;
  reg  [3:0] s1_out_blocks_2_bits_r_tracePipe_itype;
  reg  [3:0] s1_out_blocks_2_bits_r_tracePipe_iretire;
  reg        s1_out_blocks_2_bits_r_tracePipe_ilastsize;
  reg        s1_out_blocks_3_valid_r;
  reg  [5:0] s1_out_blocks_3_bits_r_ftqIdx_value;
  reg  [3:0] s1_out_blocks_3_bits_r_ftqOffset;
  reg  [3:0] s1_out_blocks_3_bits_r_tracePipe_itype;
  reg  [3:0] s1_out_blocks_3_bits_r_tracePipe_iretire;
  reg        s1_out_blocks_3_bits_r_tracePipe_ilastsize;
  reg        s1_out_blocks_4_valid_r;
  reg  [5:0] s1_out_blocks_4_bits_r_ftqIdx_value;
  reg  [3:0] s1_out_blocks_4_bits_r_ftqOffset;
  reg  [3:0] s1_out_blocks_4_bits_r_tracePipe_itype;
  reg  [3:0] s1_out_blocks_4_bits_r_tracePipe_iretire;
  reg        s1_out_blocks_4_bits_r_tracePipe_ilastsize;
  reg        s1_out_blocks_5_valid_r;
  reg  [5:0] s1_out_blocks_5_bits_r_ftqIdx_value;
  reg  [3:0] s1_out_blocks_5_bits_r_ftqOffset;
  reg  [3:0] s1_out_blocks_5_bits_r_tracePipe_itype;
  reg  [3:0] s1_out_blocks_5_bits_r_tracePipe_iretire;
  reg        s1_out_blocks_5_bits_r_tracePipe_ilastsize;
  reg        s1_out_blocks_6_valid_r;
  reg  [5:0] s1_out_blocks_6_bits_r_ftqIdx_value;
  reg  [3:0] s1_out_blocks_6_bits_r_ftqOffset;
  reg  [3:0] s1_out_blocks_6_bits_r_tracePipe_itype;
  reg  [3:0] s1_out_blocks_6_bits_r_tracePipe_iretire;
  reg        s1_out_blocks_6_bits_r_tracePipe_ilastsize;
  reg        s1_out_blocks_7_valid_r;
  reg  [5:0] s1_out_blocks_7_bits_r_ftqIdx_value;
  reg  [3:0] s1_out_blocks_7_bits_r_ftqOffset;
  reg  [3:0] s1_out_blocks_7_bits_r_tracePipe_itype;
  reg  [3:0] s1_out_blocks_7_bits_r_tracePipe_iretire;
  reg        s1_out_blocks_7_bits_r_tracePipe_ilastsize;
  reg        s3_out_groups_blocks_0_valid;
  reg  [3:0] s3_out_groups_blocks_0_bits_ftqOffset;
  reg  [3:0] s3_out_groups_blocks_0_bits_tracePipe_itype;
  reg  [6:0] s3_out_groups_blocks_0_bits_tracePipe_iretire;
  reg        s3_out_groups_blocks_0_bits_tracePipe_ilastsize;
  reg        s3_out_groups_blocks_1_valid;
  reg  [3:0] s3_out_groups_blocks_1_bits_ftqOffset;
  reg  [3:0] s3_out_groups_blocks_1_bits_tracePipe_itype;
  reg  [6:0] s3_out_groups_blocks_1_bits_tracePipe_iretire;
  reg        s3_out_groups_blocks_1_bits_tracePipe_ilastsize;
  reg        s3_out_groups_blocks_2_valid;
  reg  [3:0] s3_out_groups_blocks_2_bits_ftqOffset;
  reg  [3:0] s3_out_groups_blocks_2_bits_tracePipe_itype;
  reg  [6:0] s3_out_groups_blocks_2_bits_tracePipe_iretire;
  reg        s3_out_groups_blocks_2_bits_tracePipe_ilastsize;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      s1_out_blocks_0_valid_r <= 1'h0;
      s1_out_blocks_0_bits_r_ftqIdx_value <= 6'h0;
      s1_out_blocks_0_bits_r_ftqOffset <= 4'h0;
      s1_out_blocks_0_bits_r_tracePipe_itype <= 4'h0;
      s1_out_blocks_0_bits_r_tracePipe_iretire <= 4'h0;
      s1_out_blocks_0_bits_r_tracePipe_ilastsize <= 1'h0;
      s1_out_blocks_1_valid_r <= 1'h0;
      s1_out_blocks_1_bits_r_ftqIdx_value <= 6'h0;
      s1_out_blocks_1_bits_r_ftqOffset <= 4'h0;
      s1_out_blocks_1_bits_r_tracePipe_itype <= 4'h0;
      s1_out_blocks_1_bits_r_tracePipe_iretire <= 4'h0;
      s1_out_blocks_1_bits_r_tracePipe_ilastsize <= 1'h0;
      s1_out_blocks_2_valid_r <= 1'h0;
      s1_out_blocks_2_bits_r_ftqIdx_value <= 6'h0;
      s1_out_blocks_2_bits_r_ftqOffset <= 4'h0;
      s1_out_blocks_2_bits_r_tracePipe_itype <= 4'h0;
      s1_out_blocks_2_bits_r_tracePipe_iretire <= 4'h0;
      s1_out_blocks_2_bits_r_tracePipe_ilastsize <= 1'h0;
      s1_out_blocks_3_valid_r <= 1'h0;
      s1_out_blocks_3_bits_r_ftqIdx_value <= 6'h0;
      s1_out_blocks_3_bits_r_ftqOffset <= 4'h0;
      s1_out_blocks_3_bits_r_tracePipe_itype <= 4'h0;
      s1_out_blocks_3_bits_r_tracePipe_iretire <= 4'h0;
      s1_out_blocks_3_bits_r_tracePipe_ilastsize <= 1'h0;
      s1_out_blocks_4_valid_r <= 1'h0;
      s1_out_blocks_4_bits_r_ftqIdx_value <= 6'h0;
      s1_out_blocks_4_bits_r_ftqOffset <= 4'h0;
      s1_out_blocks_4_bits_r_tracePipe_itype <= 4'h0;
      s1_out_blocks_4_bits_r_tracePipe_iretire <= 4'h0;
      s1_out_blocks_4_bits_r_tracePipe_ilastsize <= 1'h0;
      s1_out_blocks_5_valid_r <= 1'h0;
      s1_out_blocks_5_bits_r_ftqIdx_value <= 6'h0;
      s1_out_blocks_5_bits_r_ftqOffset <= 4'h0;
      s1_out_blocks_5_bits_r_tracePipe_itype <= 4'h0;
      s1_out_blocks_5_bits_r_tracePipe_iretire <= 4'h0;
      s1_out_blocks_5_bits_r_tracePipe_ilastsize <= 1'h0;
      s1_out_blocks_6_valid_r <= 1'h0;
      s1_out_blocks_6_bits_r_ftqIdx_value <= 6'h0;
      s1_out_blocks_6_bits_r_ftqOffset <= 4'h0;
      s1_out_blocks_6_bits_r_tracePipe_itype <= 4'h0;
      s1_out_blocks_6_bits_r_tracePipe_iretire <= 4'h0;
      s1_out_blocks_6_bits_r_tracePipe_ilastsize <= 1'h0;
      s1_out_blocks_7_valid_r <= 1'h0;
      s1_out_blocks_7_bits_r_ftqIdx_value <= 6'h0;
      s1_out_blocks_7_bits_r_ftqOffset <= 4'h0;
      s1_out_blocks_7_bits_r_tracePipe_itype <= 4'h0;
      s1_out_blocks_7_bits_r_tracePipe_iretire <= 4'h0;
      s1_out_blocks_7_bits_r_tracePipe_ilastsize <= 1'h0;
    end
    else begin
      if (_traceBuffer_io_out_blockCommit) begin
      end
      else begin
        s1_out_blocks_0_valid_r <= io_in_fromRob_blocks_0_valid;
        s1_out_blocks_1_valid_r <= io_in_fromRob_blocks_1_valid;
        s1_out_blocks_2_valid_r <= io_in_fromRob_blocks_2_valid;
        s1_out_blocks_3_valid_r <= io_in_fromRob_blocks_3_valid;
        s1_out_blocks_4_valid_r <= io_in_fromRob_blocks_4_valid;
        s1_out_blocks_5_valid_r <= io_in_fromRob_blocks_5_valid;
        s1_out_blocks_6_valid_r <= io_in_fromRob_blocks_6_valid;
        s1_out_blocks_7_valid_r <= io_in_fromRob_blocks_7_valid;
      end
      if (io_in_fromRob_blocks_0_valid) begin
        s1_out_blocks_0_bits_r_ftqIdx_value <= io_in_fromRob_blocks_0_bits_ftqIdx_value;
        s1_out_blocks_0_bits_r_ftqOffset <= io_in_fromRob_blocks_0_bits_ftqOffset;
        s1_out_blocks_0_bits_r_tracePipe_itype <=
          io_in_fromRob_blocks_0_bits_tracePipe_itype;
        s1_out_blocks_0_bits_r_tracePipe_iretire <=
          io_in_fromRob_blocks_0_bits_tracePipe_iretire;
        s1_out_blocks_0_bits_r_tracePipe_ilastsize <=
          io_in_fromRob_blocks_0_bits_tracePipe_ilastsize;
      end
      if (io_in_fromRob_blocks_1_valid) begin
        s1_out_blocks_1_bits_r_ftqIdx_value <= io_in_fromRob_blocks_1_bits_ftqIdx_value;
        s1_out_blocks_1_bits_r_ftqOffset <= io_in_fromRob_blocks_1_bits_ftqOffset;
        s1_out_blocks_1_bits_r_tracePipe_itype <=
          io_in_fromRob_blocks_1_bits_tracePipe_itype;
        s1_out_blocks_1_bits_r_tracePipe_iretire <=
          io_in_fromRob_blocks_1_bits_tracePipe_iretire;
        s1_out_blocks_1_bits_r_tracePipe_ilastsize <=
          io_in_fromRob_blocks_1_bits_tracePipe_ilastsize;
      end
      if (io_in_fromRob_blocks_2_valid) begin
        s1_out_blocks_2_bits_r_ftqIdx_value <= io_in_fromRob_blocks_2_bits_ftqIdx_value;
        s1_out_blocks_2_bits_r_ftqOffset <= io_in_fromRob_blocks_2_bits_ftqOffset;
        s1_out_blocks_2_bits_r_tracePipe_itype <=
          io_in_fromRob_blocks_2_bits_tracePipe_itype;
        s1_out_blocks_2_bits_r_tracePipe_iretire <=
          io_in_fromRob_blocks_2_bits_tracePipe_iretire;
        s1_out_blocks_2_bits_r_tracePipe_ilastsize <=
          io_in_fromRob_blocks_2_bits_tracePipe_ilastsize;
      end
      if (io_in_fromRob_blocks_3_valid) begin
        s1_out_blocks_3_bits_r_ftqIdx_value <= io_in_fromRob_blocks_3_bits_ftqIdx_value;
        s1_out_blocks_3_bits_r_ftqOffset <= io_in_fromRob_blocks_3_bits_ftqOffset;
        s1_out_blocks_3_bits_r_tracePipe_itype <=
          io_in_fromRob_blocks_3_bits_tracePipe_itype;
        s1_out_blocks_3_bits_r_tracePipe_iretire <=
          io_in_fromRob_blocks_3_bits_tracePipe_iretire;
        s1_out_blocks_3_bits_r_tracePipe_ilastsize <=
          io_in_fromRob_blocks_3_bits_tracePipe_ilastsize;
      end
      if (io_in_fromRob_blocks_4_valid) begin
        s1_out_blocks_4_bits_r_ftqIdx_value <= io_in_fromRob_blocks_4_bits_ftqIdx_value;
        s1_out_blocks_4_bits_r_ftqOffset <= io_in_fromRob_blocks_4_bits_ftqOffset;
        s1_out_blocks_4_bits_r_tracePipe_itype <=
          io_in_fromRob_blocks_4_bits_tracePipe_itype;
        s1_out_blocks_4_bits_r_tracePipe_iretire <=
          io_in_fromRob_blocks_4_bits_tracePipe_iretire;
        s1_out_blocks_4_bits_r_tracePipe_ilastsize <=
          io_in_fromRob_blocks_4_bits_tracePipe_ilastsize;
      end
      if (io_in_fromRob_blocks_5_valid) begin
        s1_out_blocks_5_bits_r_ftqIdx_value <= io_in_fromRob_blocks_5_bits_ftqIdx_value;
        s1_out_blocks_5_bits_r_ftqOffset <= io_in_fromRob_blocks_5_bits_ftqOffset;
        s1_out_blocks_5_bits_r_tracePipe_itype <=
          io_in_fromRob_blocks_5_bits_tracePipe_itype;
        s1_out_blocks_5_bits_r_tracePipe_iretire <=
          io_in_fromRob_blocks_5_bits_tracePipe_iretire;
        s1_out_blocks_5_bits_r_tracePipe_ilastsize <=
          io_in_fromRob_blocks_5_bits_tracePipe_ilastsize;
      end
      if (io_in_fromRob_blocks_6_valid) begin
        s1_out_blocks_6_bits_r_ftqIdx_value <= io_in_fromRob_blocks_6_bits_ftqIdx_value;
        s1_out_blocks_6_bits_r_ftqOffset <= io_in_fromRob_blocks_6_bits_ftqOffset;
        s1_out_blocks_6_bits_r_tracePipe_itype <=
          io_in_fromRob_blocks_6_bits_tracePipe_itype;
        s1_out_blocks_6_bits_r_tracePipe_iretire <=
          io_in_fromRob_blocks_6_bits_tracePipe_iretire;
        s1_out_blocks_6_bits_r_tracePipe_ilastsize <=
          io_in_fromRob_blocks_6_bits_tracePipe_ilastsize;
      end
      if (io_in_fromRob_blocks_7_valid) begin
        s1_out_blocks_7_bits_r_ftqIdx_value <= io_in_fromRob_blocks_7_bits_ftqIdx_value;
        s1_out_blocks_7_bits_r_ftqOffset <= io_in_fromRob_blocks_7_bits_ftqOffset;
        s1_out_blocks_7_bits_r_tracePipe_itype <=
          io_in_fromRob_blocks_7_bits_tracePipe_itype;
        s1_out_blocks_7_bits_r_tracePipe_iretire <=
          io_in_fromRob_blocks_7_bits_tracePipe_iretire;
        s1_out_blocks_7_bits_r_tracePipe_ilastsize <=
          io_in_fromRob_blocks_7_bits_tracePipe_ilastsize;
      end
    end
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    s3_out_groups_blocks_0_valid <= _traceBuffer_io_out_groups_blocks_0_valid;
    s3_out_groups_blocks_0_bits_ftqOffset <=
      _traceBuffer_io_out_groups_blocks_0_bits_ftqOffset;
    s3_out_groups_blocks_0_bits_tracePipe_itype <=
      _traceBuffer_io_out_groups_blocks_0_bits_tracePipe_itype;
    s3_out_groups_blocks_0_bits_tracePipe_iretire <=
      _traceBuffer_io_out_groups_blocks_0_bits_tracePipe_iretire;
    s3_out_groups_blocks_0_bits_tracePipe_ilastsize <=
      _traceBuffer_io_out_groups_blocks_0_bits_tracePipe_ilastsize;
    s3_out_groups_blocks_1_valid <= _traceBuffer_io_out_groups_blocks_1_valid;
    s3_out_groups_blocks_1_bits_ftqOffset <=
      _traceBuffer_io_out_groups_blocks_1_bits_ftqOffset;
    s3_out_groups_blocks_1_bits_tracePipe_itype <=
      _traceBuffer_io_out_groups_blocks_1_bits_tracePipe_itype;
    s3_out_groups_blocks_1_bits_tracePipe_iretire <=
      _traceBuffer_io_out_groups_blocks_1_bits_tracePipe_iretire;
    s3_out_groups_blocks_1_bits_tracePipe_ilastsize <=
      _traceBuffer_io_out_groups_blocks_1_bits_tracePipe_ilastsize;
    s3_out_groups_blocks_2_valid <= _traceBuffer_io_out_groups_blocks_2_valid;
    s3_out_groups_blocks_2_bits_ftqOffset <=
      _traceBuffer_io_out_groups_blocks_2_bits_ftqOffset;
    s3_out_groups_blocks_2_bits_tracePipe_itype <=
      _traceBuffer_io_out_groups_blocks_2_bits_tracePipe_itype;
    s3_out_groups_blocks_2_bits_tracePipe_iretire <=
      _traceBuffer_io_out_groups_blocks_2_bits_tracePipe_iretire;
    s3_out_groups_blocks_2_bits_tracePipe_ilastsize <=
      _traceBuffer_io_out_groups_blocks_2_bits_tracePipe_ilastsize;
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:7];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [3:0] i = 4'h0; i < 4'h8; i += 4'h1) begin
          _RANDOM[i[2:0]] = `RANDOM;
        end
        s1_out_blocks_0_valid_r = _RANDOM[3'h0][0];
        s1_out_blocks_0_bits_r_ftqIdx_value = _RANDOM[3'h0][7:2];
        s1_out_blocks_0_bits_r_ftqOffset = _RANDOM[3'h0][11:8];
        s1_out_blocks_0_bits_r_tracePipe_itype = _RANDOM[3'h0][15:12];
        s1_out_blocks_0_bits_r_tracePipe_iretire = _RANDOM[3'h0][19:16];
        s1_out_blocks_0_bits_r_tracePipe_ilastsize = _RANDOM[3'h0][20];
        s1_out_blocks_1_valid_r = _RANDOM[3'h0][21];
        s1_out_blocks_1_bits_r_ftqIdx_value = _RANDOM[3'h0][28:23];
        s1_out_blocks_1_bits_r_ftqOffset = {_RANDOM[3'h0][31:29], _RANDOM[3'h1][0]};
        s1_out_blocks_1_bits_r_tracePipe_itype = _RANDOM[3'h1][4:1];
        s1_out_blocks_1_bits_r_tracePipe_iretire = _RANDOM[3'h1][8:5];
        s1_out_blocks_1_bits_r_tracePipe_ilastsize = _RANDOM[3'h1][9];
        s1_out_blocks_2_valid_r = _RANDOM[3'h1][10];
        s1_out_blocks_2_bits_r_ftqIdx_value = _RANDOM[3'h1][17:12];
        s1_out_blocks_2_bits_r_ftqOffset = _RANDOM[3'h1][21:18];
        s1_out_blocks_2_bits_r_tracePipe_itype = _RANDOM[3'h1][25:22];
        s1_out_blocks_2_bits_r_tracePipe_iretire = _RANDOM[3'h1][29:26];
        s1_out_blocks_2_bits_r_tracePipe_ilastsize = _RANDOM[3'h1][30];
        s1_out_blocks_3_valid_r = _RANDOM[3'h1][31];
        s1_out_blocks_3_bits_r_ftqIdx_value = _RANDOM[3'h2][6:1];
        s1_out_blocks_3_bits_r_ftqOffset = _RANDOM[3'h2][10:7];
        s1_out_blocks_3_bits_r_tracePipe_itype = _RANDOM[3'h2][14:11];
        s1_out_blocks_3_bits_r_tracePipe_iretire = _RANDOM[3'h2][18:15];
        s1_out_blocks_3_bits_r_tracePipe_ilastsize = _RANDOM[3'h2][19];
        s1_out_blocks_4_valid_r = _RANDOM[3'h2][20];
        s1_out_blocks_4_bits_r_ftqIdx_value = _RANDOM[3'h2][27:22];
        s1_out_blocks_4_bits_r_ftqOffset = _RANDOM[3'h2][31:28];
        s1_out_blocks_4_bits_r_tracePipe_itype = _RANDOM[3'h3][3:0];
        s1_out_blocks_4_bits_r_tracePipe_iretire = _RANDOM[3'h3][7:4];
        s1_out_blocks_4_bits_r_tracePipe_ilastsize = _RANDOM[3'h3][8];
        s1_out_blocks_5_valid_r = _RANDOM[3'h3][9];
        s1_out_blocks_5_bits_r_ftqIdx_value = _RANDOM[3'h3][16:11];
        s1_out_blocks_5_bits_r_ftqOffset = _RANDOM[3'h3][20:17];
        s1_out_blocks_5_bits_r_tracePipe_itype = _RANDOM[3'h3][24:21];
        s1_out_blocks_5_bits_r_tracePipe_iretire = _RANDOM[3'h3][28:25];
        s1_out_blocks_5_bits_r_tracePipe_ilastsize = _RANDOM[3'h3][29];
        s1_out_blocks_6_valid_r = _RANDOM[3'h3][30];
        s1_out_blocks_6_bits_r_ftqIdx_value = _RANDOM[3'h4][5:0];
        s1_out_blocks_6_bits_r_ftqOffset = _RANDOM[3'h4][9:6];
        s1_out_blocks_6_bits_r_tracePipe_itype = _RANDOM[3'h4][13:10];
        s1_out_blocks_6_bits_r_tracePipe_iretire = _RANDOM[3'h4][17:14];
        s1_out_blocks_6_bits_r_tracePipe_ilastsize = _RANDOM[3'h4][18];
        s1_out_blocks_7_valid_r = _RANDOM[3'h4][19];
        s1_out_blocks_7_bits_r_ftqIdx_value = _RANDOM[3'h4][26:21];
        s1_out_blocks_7_bits_r_ftqOffset = _RANDOM[3'h4][30:27];
        s1_out_blocks_7_bits_r_tracePipe_itype = {_RANDOM[3'h4][31], _RANDOM[3'h5][2:0]};
        s1_out_blocks_7_bits_r_tracePipe_iretire = _RANDOM[3'h5][6:3];
        s1_out_blocks_7_bits_r_tracePipe_ilastsize = _RANDOM[3'h5][7];
        s3_out_groups_blocks_0_valid = _RANDOM[3'h5][8];
        s3_out_groups_blocks_0_bits_ftqOffset = _RANDOM[3'h5][19:16];
        s3_out_groups_blocks_0_bits_tracePipe_itype = _RANDOM[3'h5][23:20];
        s3_out_groups_blocks_0_bits_tracePipe_iretire = _RANDOM[3'h5][30:24];
        s3_out_groups_blocks_0_bits_tracePipe_ilastsize = _RANDOM[3'h5][31];
        s3_out_groups_blocks_1_valid = _RANDOM[3'h6][0];
        s3_out_groups_blocks_1_bits_ftqOffset = _RANDOM[3'h6][11:8];
        s3_out_groups_blocks_1_bits_tracePipe_itype = _RANDOM[3'h6][15:12];
        s3_out_groups_blocks_1_bits_tracePipe_iretire = _RANDOM[3'h6][22:16];
        s3_out_groups_blocks_1_bits_tracePipe_ilastsize = _RANDOM[3'h6][23];
        s3_out_groups_blocks_2_valid = _RANDOM[3'h6][24];
        s3_out_groups_blocks_2_bits_ftqOffset = _RANDOM[3'h7][3:0];
        s3_out_groups_blocks_2_bits_tracePipe_itype = _RANDOM[3'h7][7:4];
        s3_out_groups_blocks_2_bits_tracePipe_iretire = _RANDOM[3'h7][14:8];
        s3_out_groups_blocks_2_bits_tracePipe_ilastsize = _RANDOM[3'h7][15];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        s1_out_blocks_0_valid_r = 1'h0;
        s1_out_blocks_0_bits_r_ftqIdx_value = 6'h0;
        s1_out_blocks_0_bits_r_ftqOffset = 4'h0;
        s1_out_blocks_0_bits_r_tracePipe_itype = 4'h0;
        s1_out_blocks_0_bits_r_tracePipe_iretire = 4'h0;
        s1_out_blocks_0_bits_r_tracePipe_ilastsize = 1'h0;
        s1_out_blocks_1_valid_r = 1'h0;
        s1_out_blocks_1_bits_r_ftqIdx_value = 6'h0;
        s1_out_blocks_1_bits_r_ftqOffset = 4'h0;
        s1_out_blocks_1_bits_r_tracePipe_itype = 4'h0;
        s1_out_blocks_1_bits_r_tracePipe_iretire = 4'h0;
        s1_out_blocks_1_bits_r_tracePipe_ilastsize = 1'h0;
        s1_out_blocks_2_valid_r = 1'h0;
        s1_out_blocks_2_bits_r_ftqIdx_value = 6'h0;
        s1_out_blocks_2_bits_r_ftqOffset = 4'h0;
        s1_out_blocks_2_bits_r_tracePipe_itype = 4'h0;
        s1_out_blocks_2_bits_r_tracePipe_iretire = 4'h0;
        s1_out_blocks_2_bits_r_tracePipe_ilastsize = 1'h0;
        s1_out_blocks_3_valid_r = 1'h0;
        s1_out_blocks_3_bits_r_ftqIdx_value = 6'h0;
        s1_out_blocks_3_bits_r_ftqOffset = 4'h0;
        s1_out_blocks_3_bits_r_tracePipe_itype = 4'h0;
        s1_out_blocks_3_bits_r_tracePipe_iretire = 4'h0;
        s1_out_blocks_3_bits_r_tracePipe_ilastsize = 1'h0;
        s1_out_blocks_4_valid_r = 1'h0;
        s1_out_blocks_4_bits_r_ftqIdx_value = 6'h0;
        s1_out_blocks_4_bits_r_ftqOffset = 4'h0;
        s1_out_blocks_4_bits_r_tracePipe_itype = 4'h0;
        s1_out_blocks_4_bits_r_tracePipe_iretire = 4'h0;
        s1_out_blocks_4_bits_r_tracePipe_ilastsize = 1'h0;
        s1_out_blocks_5_valid_r = 1'h0;
        s1_out_blocks_5_bits_r_ftqIdx_value = 6'h0;
        s1_out_blocks_5_bits_r_ftqOffset = 4'h0;
        s1_out_blocks_5_bits_r_tracePipe_itype = 4'h0;
        s1_out_blocks_5_bits_r_tracePipe_iretire = 4'h0;
        s1_out_blocks_5_bits_r_tracePipe_ilastsize = 1'h0;
        s1_out_blocks_6_valid_r = 1'h0;
        s1_out_blocks_6_bits_r_ftqIdx_value = 6'h0;
        s1_out_blocks_6_bits_r_ftqOffset = 4'h0;
        s1_out_blocks_6_bits_r_tracePipe_itype = 4'h0;
        s1_out_blocks_6_bits_r_tracePipe_iretire = 4'h0;
        s1_out_blocks_6_bits_r_tracePipe_ilastsize = 1'h0;
        s1_out_blocks_7_valid_r = 1'h0;
        s1_out_blocks_7_bits_r_ftqIdx_value = 6'h0;
        s1_out_blocks_7_bits_r_ftqOffset = 4'h0;
        s1_out_blocks_7_bits_r_tracePipe_itype = 4'h0;
        s1_out_blocks_7_bits_r_tracePipe_iretire = 4'h0;
        s1_out_blocks_7_bits_r_tracePipe_ilastsize = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  TraceBuffer traceBuffer (
    .clock                                           (clock),
    .reset                                           (reset),
    .io_in_fromEncoder_enable                        (io_in_fromEncoder_enable),
    .io_in_fromEncoder_stall                         (io_in_fromEncoder_stall),
    .io_in_fromRob_blocks_0_valid                    (s1_out_blocks_0_valid_r),
    .io_in_fromRob_blocks_0_bits_ftqIdx_value
      (s1_out_blocks_0_bits_r_ftqIdx_value),
    .io_in_fromRob_blocks_0_bits_ftqOffset           (s1_out_blocks_0_bits_r_ftqOffset),
    .io_in_fromRob_blocks_0_bits_tracePipe_itype
      (s1_out_blocks_0_bits_r_tracePipe_itype),
    .io_in_fromRob_blocks_0_bits_tracePipe_iretire
      ({3'h0, s1_out_blocks_0_bits_r_tracePipe_iretire}),
    .io_in_fromRob_blocks_0_bits_tracePipe_ilastsize
      (s1_out_blocks_0_bits_r_tracePipe_ilastsize),
    .io_in_fromRob_blocks_1_valid                    (s1_out_blocks_1_valid_r),
    .io_in_fromRob_blocks_1_bits_ftqIdx_value
      (s1_out_blocks_1_bits_r_ftqIdx_value),
    .io_in_fromRob_blocks_1_bits_ftqOffset           (s1_out_blocks_1_bits_r_ftqOffset),
    .io_in_fromRob_blocks_1_bits_tracePipe_itype
      (s1_out_blocks_1_bits_r_tracePipe_itype),
    .io_in_fromRob_blocks_1_bits_tracePipe_iretire
      ({3'h0, s1_out_blocks_1_bits_r_tracePipe_iretire}),
    .io_in_fromRob_blocks_1_bits_tracePipe_ilastsize
      (s1_out_blocks_1_bits_r_tracePipe_ilastsize),
    .io_in_fromRob_blocks_2_valid                    (s1_out_blocks_2_valid_r),
    .io_in_fromRob_blocks_2_bits_ftqIdx_value
      (s1_out_blocks_2_bits_r_ftqIdx_value),
    .io_in_fromRob_blocks_2_bits_ftqOffset           (s1_out_blocks_2_bits_r_ftqOffset),
    .io_in_fromRob_blocks_2_bits_tracePipe_itype
      (s1_out_blocks_2_bits_r_tracePipe_itype),
    .io_in_fromRob_blocks_2_bits_tracePipe_iretire
      ({3'h0, s1_out_blocks_2_bits_r_tracePipe_iretire}),
    .io_in_fromRob_blocks_2_bits_tracePipe_ilastsize
      (s1_out_blocks_2_bits_r_tracePipe_ilastsize),
    .io_in_fromRob_blocks_3_valid                    (s1_out_blocks_3_valid_r),
    .io_in_fromRob_blocks_3_bits_ftqIdx_value
      (s1_out_blocks_3_bits_r_ftqIdx_value),
    .io_in_fromRob_blocks_3_bits_ftqOffset           (s1_out_blocks_3_bits_r_ftqOffset),
    .io_in_fromRob_blocks_3_bits_tracePipe_itype
      (s1_out_blocks_3_bits_r_tracePipe_itype),
    .io_in_fromRob_blocks_3_bits_tracePipe_iretire
      ({3'h0, s1_out_blocks_3_bits_r_tracePipe_iretire}),
    .io_in_fromRob_blocks_3_bits_tracePipe_ilastsize
      (s1_out_blocks_3_bits_r_tracePipe_ilastsize),
    .io_in_fromRob_blocks_4_valid                    (s1_out_blocks_4_valid_r),
    .io_in_fromRob_blocks_4_bits_ftqIdx_value
      (s1_out_blocks_4_bits_r_ftqIdx_value),
    .io_in_fromRob_blocks_4_bits_ftqOffset           (s1_out_blocks_4_bits_r_ftqOffset),
    .io_in_fromRob_blocks_4_bits_tracePipe_itype
      (s1_out_blocks_4_bits_r_tracePipe_itype),
    .io_in_fromRob_blocks_4_bits_tracePipe_iretire
      ({3'h0, s1_out_blocks_4_bits_r_tracePipe_iretire}),
    .io_in_fromRob_blocks_4_bits_tracePipe_ilastsize
      (s1_out_blocks_4_bits_r_tracePipe_ilastsize),
    .io_in_fromRob_blocks_5_valid                    (s1_out_blocks_5_valid_r),
    .io_in_fromRob_blocks_5_bits_ftqIdx_value
      (s1_out_blocks_5_bits_r_ftqIdx_value),
    .io_in_fromRob_blocks_5_bits_ftqOffset           (s1_out_blocks_5_bits_r_ftqOffset),
    .io_in_fromRob_blocks_5_bits_tracePipe_itype
      (s1_out_blocks_5_bits_r_tracePipe_itype),
    .io_in_fromRob_blocks_5_bits_tracePipe_iretire
      ({3'h0, s1_out_blocks_5_bits_r_tracePipe_iretire}),
    .io_in_fromRob_blocks_5_bits_tracePipe_ilastsize
      (s1_out_blocks_5_bits_r_tracePipe_ilastsize),
    .io_in_fromRob_blocks_6_valid                    (s1_out_blocks_6_valid_r),
    .io_in_fromRob_blocks_6_bits_ftqIdx_value
      (s1_out_blocks_6_bits_r_ftqIdx_value),
    .io_in_fromRob_blocks_6_bits_ftqOffset           (s1_out_blocks_6_bits_r_ftqOffset),
    .io_in_fromRob_blocks_6_bits_tracePipe_itype
      (s1_out_blocks_6_bits_r_tracePipe_itype),
    .io_in_fromRob_blocks_6_bits_tracePipe_iretire
      ({3'h0, s1_out_blocks_6_bits_r_tracePipe_iretire}),
    .io_in_fromRob_blocks_6_bits_tracePipe_ilastsize
      (s1_out_blocks_6_bits_r_tracePipe_ilastsize),
    .io_in_fromRob_blocks_7_valid                    (s1_out_blocks_7_valid_r),
    .io_in_fromRob_blocks_7_bits_ftqIdx_value
      (s1_out_blocks_7_bits_r_ftqIdx_value),
    .io_in_fromRob_blocks_7_bits_ftqOffset           (s1_out_blocks_7_bits_r_ftqOffset),
    .io_in_fromRob_blocks_7_bits_tracePipe_itype
      (s1_out_blocks_7_bits_r_tracePipe_itype),
    .io_in_fromRob_blocks_7_bits_tracePipe_iretire
      ({3'h0, s1_out_blocks_7_bits_r_tracePipe_iretire}),
    .io_in_fromRob_blocks_7_bits_tracePipe_ilastsize
      (s1_out_blocks_7_bits_r_tracePipe_ilastsize),
    .io_out_blockCommit                              (_traceBuffer_io_out_blockCommit),
    .io_out_groups_blocks_0_valid
      (_traceBuffer_io_out_groups_blocks_0_valid),
    .io_out_groups_blocks_0_bits_ftqIdx_value
      (io_out_toPcMem_blocks_0_bits_ftqIdx_value),
    .io_out_groups_blocks_0_bits_ftqOffset
      (_traceBuffer_io_out_groups_blocks_0_bits_ftqOffset),
    .io_out_groups_blocks_0_bits_tracePipe_itype
      (_traceBuffer_io_out_groups_blocks_0_bits_tracePipe_itype),
    .io_out_groups_blocks_0_bits_tracePipe_iretire
      (_traceBuffer_io_out_groups_blocks_0_bits_tracePipe_iretire),
    .io_out_groups_blocks_0_bits_tracePipe_ilastsize
      (_traceBuffer_io_out_groups_blocks_0_bits_tracePipe_ilastsize),
    .io_out_groups_blocks_1_valid
      (_traceBuffer_io_out_groups_blocks_1_valid),
    .io_out_groups_blocks_1_bits_ftqIdx_value
      (io_out_toPcMem_blocks_1_bits_ftqIdx_value),
    .io_out_groups_blocks_1_bits_ftqOffset
      (_traceBuffer_io_out_groups_blocks_1_bits_ftqOffset),
    .io_out_groups_blocks_1_bits_tracePipe_itype
      (_traceBuffer_io_out_groups_blocks_1_bits_tracePipe_itype),
    .io_out_groups_blocks_1_bits_tracePipe_iretire
      (_traceBuffer_io_out_groups_blocks_1_bits_tracePipe_iretire),
    .io_out_groups_blocks_1_bits_tracePipe_ilastsize
      (_traceBuffer_io_out_groups_blocks_1_bits_tracePipe_ilastsize),
    .io_out_groups_blocks_2_valid
      (_traceBuffer_io_out_groups_blocks_2_valid),
    .io_out_groups_blocks_2_bits_ftqIdx_value
      (io_out_toPcMem_blocks_2_bits_ftqIdx_value),
    .io_out_groups_blocks_2_bits_ftqOffset
      (_traceBuffer_io_out_groups_blocks_2_bits_ftqOffset),
    .io_out_groups_blocks_2_bits_tracePipe_itype
      (_traceBuffer_io_out_groups_blocks_2_bits_tracePipe_itype),
    .io_out_groups_blocks_2_bits_tracePipe_iretire
      (_traceBuffer_io_out_groups_blocks_2_bits_tracePipe_iretire),
    .io_out_groups_blocks_2_bits_tracePipe_ilastsize
      (_traceBuffer_io_out_groups_blocks_2_bits_tracePipe_ilastsize)
  );
  assign io_out_toPcMem_blocks_0_valid = _traceBuffer_io_out_groups_blocks_0_valid;
  assign io_out_toPcMem_blocks_1_valid = _traceBuffer_io_out_groups_blocks_1_valid;
  assign io_out_toPcMem_blocks_2_valid = _traceBuffer_io_out_groups_blocks_2_valid;
  assign io_out_toEncoder_blocks_0_valid = s3_out_groups_blocks_0_valid;
  assign io_out_toEncoder_blocks_0_bits_ftqOffset = s3_out_groups_blocks_0_bits_ftqOffset;
  assign io_out_toEncoder_blocks_0_bits_tracePipe_itype =
    s3_out_groups_blocks_0_bits_tracePipe_itype;
  assign io_out_toEncoder_blocks_0_bits_tracePipe_iretire =
    s3_out_groups_blocks_0_bits_tracePipe_iretire;
  assign io_out_toEncoder_blocks_0_bits_tracePipe_ilastsize =
    s3_out_groups_blocks_0_bits_tracePipe_ilastsize;
  assign io_out_toEncoder_blocks_1_valid = s3_out_groups_blocks_1_valid;
  assign io_out_toEncoder_blocks_1_bits_ftqOffset = s3_out_groups_blocks_1_bits_ftqOffset;
  assign io_out_toEncoder_blocks_1_bits_tracePipe_itype =
    s3_out_groups_blocks_1_bits_tracePipe_itype;
  assign io_out_toEncoder_blocks_1_bits_tracePipe_iretire =
    s3_out_groups_blocks_1_bits_tracePipe_iretire;
  assign io_out_toEncoder_blocks_1_bits_tracePipe_ilastsize =
    s3_out_groups_blocks_1_bits_tracePipe_ilastsize;
  assign io_out_toEncoder_blocks_2_valid = s3_out_groups_blocks_2_valid;
  assign io_out_toEncoder_blocks_2_bits_ftqOffset = s3_out_groups_blocks_2_bits_ftqOffset;
  assign io_out_toEncoder_blocks_2_bits_tracePipe_itype =
    s3_out_groups_blocks_2_bits_tracePipe_itype;
  assign io_out_toEncoder_blocks_2_bits_tracePipe_iretire =
    s3_out_groups_blocks_2_bits_tracePipe_iretire;
  assign io_out_toEncoder_blocks_2_bits_tracePipe_ilastsize =
    s3_out_groups_blocks_2_bits_tracePipe_ilastsize;
  assign io_out_blockRobCommit = _traceBuffer_io_out_blockCommit;
endmodule

