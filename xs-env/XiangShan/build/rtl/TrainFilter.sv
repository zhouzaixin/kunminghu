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

module TrainFilter(
  input         clock,
  input         reset,
  input         io_ld_in_0_valid,
  input  [49:0] io_ld_in_0_bits_uop_pc,
  input         io_ld_in_0_bits_uop_robIdx_flag,
  input  [7:0]  io_ld_in_0_bits_uop_robIdx_value,
  input  [49:0] io_ld_in_0_bits_vaddr,
  input         io_ld_in_1_valid,
  input  [49:0] io_ld_in_1_bits_uop_pc,
  input         io_ld_in_1_bits_uop_robIdx_flag,
  input  [7:0]  io_ld_in_1_bits_uop_robIdx_value,
  input  [49:0] io_ld_in_1_bits_vaddr,
  input         io_ld_in_2_valid,
  input  [49:0] io_ld_in_2_bits_uop_pc,
  input         io_ld_in_2_bits_uop_robIdx_flag,
  input  [7:0]  io_ld_in_2_bits_uop_robIdx_value,
  input  [49:0] io_ld_in_2_bits_vaddr,
  input         io_train_req_ready,
  output        io_train_req_valid,
  output [49:0] io_train_req_bits_vaddr,
  output [49:0] io_train_req_bits_pc
);

  reg  [49:0]      entries_0_vaddr;
  reg  [49:0]      entries_0_pc;
  reg  [49:0]      entries_1_vaddr;
  reg  [49:0]      entries_1_pc;
  reg  [49:0]      entries_2_vaddr;
  reg  [49:0]      entries_2_pc;
  reg  [49:0]      entries_3_vaddr;
  reg  [49:0]      entries_3_pc;
  reg  [49:0]      entries_4_vaddr;
  reg  [49:0]      entries_4_pc;
  reg  [49:0]      entries_5_vaddr;
  reg  [49:0]      entries_5_pc;
  reg              valids_0;
  reg              valids_1;
  reg              valids_2;
  reg              valids_3;
  reg              valids_4;
  reg              valids_5;
  reg              enqPtrExt_0_flag;
  reg  [2:0]       enqPtrExt_0_value;
  reg              enqPtrExt_1_flag;
  reg  [2:0]       enqPtrExt_1_value;
  reg              enqPtrExt_2_flag;
  reg  [2:0]       enqPtrExt_2_value;
  reg              deqPtrExt_flag;
  reg  [2:0]       deqPtrExt_value;
  reg              ld_in_reordered_res_0_1_0_valid;
  reg  [49:0]      ld_in_reordered_res_0_1_0_bits_uop_pc;
  reg              ld_in_reordered_res_0_1_0_bits_uop_robIdx_flag;
  reg  [7:0]       ld_in_reordered_res_0_1_0_bits_uop_robIdx_value;
  reg  [49:0]      ld_in_reordered_res_0_1_0_bits_vaddr;
  reg              ld_in_reordered_res_0_1_1_valid;
  reg  [49:0]      ld_in_reordered_res_0_1_1_bits_uop_pc;
  reg              ld_in_reordered_res_0_1_1_bits_uop_robIdx_flag;
  reg  [7:0]       ld_in_reordered_res_0_1_1_bits_uop_robIdx_value;
  reg  [49:0]      ld_in_reordered_res_0_1_1_bits_vaddr;
  reg              ld_in_reordered_res_0_1_2_valid;
  reg  [49:0]      ld_in_reordered_res_0_1_2_bits_uop_pc;
  reg              ld_in_reordered_res_0_1_2_bits_uop_robIdx_flag;
  reg  [7:0]       ld_in_reordered_res_0_1_2_bits_uop_robIdx_value;
  reg  [49:0]      ld_in_reordered_res_0_1_2_bits_vaddr;
  reg              ld_in_reordered_res_1_2_0_valid;
  reg  [49:0]      ld_in_reordered_res_1_2_0_bits_uop_pc;
  reg              ld_in_reordered_res_1_2_0_bits_uop_robIdx_flag;
  reg  [7:0]       ld_in_reordered_res_1_2_0_bits_uop_robIdx_value;
  reg  [49:0]      ld_in_reordered_res_1_2_0_bits_vaddr;
  reg              ld_in_reordered_res_1_2_1_valid;
  reg  [49:0]      ld_in_reordered_res_1_2_1_bits_uop_pc;
  reg              ld_in_reordered_res_1_2_1_bits_uop_robIdx_flag;
  reg  [7:0]       ld_in_reordered_res_1_2_1_bits_uop_robIdx_value;
  reg  [49:0]      ld_in_reordered_res_1_2_1_bits_vaddr;
  reg              ld_in_reordered_res_1_2_2_valid;
  reg  [49:0]      ld_in_reordered_res_1_2_2_bits_uop_pc;
  reg  [49:0]      ld_in_reordered_res_1_2_2_bits_vaddr;
  reg              ld_in_reordered_0_valid;
  reg  [49:0]      ld_in_reordered_0_bits_uop_pc;
  reg  [49:0]      ld_in_reordered_0_bits_vaddr;
  reg              ld_in_reordered_1_valid;
  reg  [49:0]      ld_in_reordered_1_bits_uop_pc;
  reg  [49:0]      ld_in_reordered_1_bits_vaddr;
  reg              ld_in_reordered_2_valid;
  reg  [49:0]      ld_in_reordered_2_bits_uop_pc;
  reg  [49:0]      ld_in_reordered_2_bits_vaddr;
  wire             needAlloc_0 =
    ld_in_reordered_0_valid
    & {valids_0
         & {entries_0_vaddr[20:16] ^ entries_0_vaddr[25:21] ^ entries_0_vaddr[30:26],
            entries_0_vaddr[15:6]} == {ld_in_reordered_0_bits_vaddr[20:16]
                                         ^ ld_in_reordered_0_bits_vaddr[25:21]
                                         ^ ld_in_reordered_0_bits_vaddr[30:26],
                                       ld_in_reordered_0_bits_vaddr[15:6]},
       valids_1
         & {entries_1_vaddr[20:16] ^ entries_1_vaddr[25:21] ^ entries_1_vaddr[30:26],
            entries_1_vaddr[15:6]} == {ld_in_reordered_0_bits_vaddr[20:16]
                                         ^ ld_in_reordered_0_bits_vaddr[25:21]
                                         ^ ld_in_reordered_0_bits_vaddr[30:26],
                                       ld_in_reordered_0_bits_vaddr[15:6]},
       valids_2
         & {entries_2_vaddr[20:16] ^ entries_2_vaddr[25:21] ^ entries_2_vaddr[30:26],
            entries_2_vaddr[15:6]} == {ld_in_reordered_0_bits_vaddr[20:16]
                                         ^ ld_in_reordered_0_bits_vaddr[25:21]
                                         ^ ld_in_reordered_0_bits_vaddr[30:26],
                                       ld_in_reordered_0_bits_vaddr[15:6]},
       valids_3
         & {entries_3_vaddr[20:16] ^ entries_3_vaddr[25:21] ^ entries_3_vaddr[30:26],
            entries_3_vaddr[15:6]} == {ld_in_reordered_0_bits_vaddr[20:16]
                                         ^ ld_in_reordered_0_bits_vaddr[25:21]
                                         ^ ld_in_reordered_0_bits_vaddr[30:26],
                                       ld_in_reordered_0_bits_vaddr[15:6]},
       valids_4
         & {entries_4_vaddr[20:16] ^ entries_4_vaddr[25:21] ^ entries_4_vaddr[30:26],
            entries_4_vaddr[15:6]} == {ld_in_reordered_0_bits_vaddr[20:16]
                                         ^ ld_in_reordered_0_bits_vaddr[25:21]
                                         ^ ld_in_reordered_0_bits_vaddr[30:26],
                                       ld_in_reordered_0_bits_vaddr[15:6]},
       valids_5
         & {entries_5_vaddr[20:16] ^ entries_5_vaddr[25:21] ^ entries_5_vaddr[30:26],
            entries_5_vaddr[15:6]} == {ld_in_reordered_0_bits_vaddr[20:16]
                                         ^ ld_in_reordered_0_bits_vaddr[25:21]
                                         ^ ld_in_reordered_0_bits_vaddr[30:26],
                                       ld_in_reordered_0_bits_vaddr[15:6]}} == 6'h0;
  wire             canAlloc_0 =
    needAlloc_0
    & (enqPtrExt_0_flag ^ deqPtrExt_flag ^ enqPtrExt_0_value >= deqPtrExt_value);
  wire             _GEN = canAlloc_0 & enqPtrExt_0_value == 3'h0;
  wire             _GEN_0 = canAlloc_0 & enqPtrExt_0_value == 3'h1;
  wire             _GEN_1 = canAlloc_0 & enqPtrExt_0_value == 3'h2;
  wire             _GEN_2 = canAlloc_0 & enqPtrExt_0_value == 3'h3;
  wire             _GEN_3 = canAlloc_0 & enqPtrExt_0_value == 3'h4;
  wire             _GEN_4 = canAlloc_0 & enqPtrExt_0_value == 3'h5;
  wire             needAlloc_1 =
    ld_in_reordered_1_valid
    & {valids_0
         & {entries_0_vaddr[20:16] ^ entries_0_vaddr[25:21] ^ entries_0_vaddr[30:26],
            entries_0_vaddr[15:6]} == {ld_in_reordered_1_bits_vaddr[20:16]
                                         ^ ld_in_reordered_1_bits_vaddr[25:21]
                                         ^ ld_in_reordered_1_bits_vaddr[30:26],
                                       ld_in_reordered_1_bits_vaddr[15:6]},
       valids_1
         & {entries_1_vaddr[20:16] ^ entries_1_vaddr[25:21] ^ entries_1_vaddr[30:26],
            entries_1_vaddr[15:6]} == {ld_in_reordered_1_bits_vaddr[20:16]
                                         ^ ld_in_reordered_1_bits_vaddr[25:21]
                                         ^ ld_in_reordered_1_bits_vaddr[30:26],
                                       ld_in_reordered_1_bits_vaddr[15:6]},
       valids_2
         & {entries_2_vaddr[20:16] ^ entries_2_vaddr[25:21] ^ entries_2_vaddr[30:26],
            entries_2_vaddr[15:6]} == {ld_in_reordered_1_bits_vaddr[20:16]
                                         ^ ld_in_reordered_1_bits_vaddr[25:21]
                                         ^ ld_in_reordered_1_bits_vaddr[30:26],
                                       ld_in_reordered_1_bits_vaddr[15:6]},
       valids_3
         & {entries_3_vaddr[20:16] ^ entries_3_vaddr[25:21] ^ entries_3_vaddr[30:26],
            entries_3_vaddr[15:6]} == {ld_in_reordered_1_bits_vaddr[20:16]
                                         ^ ld_in_reordered_1_bits_vaddr[25:21]
                                         ^ ld_in_reordered_1_bits_vaddr[30:26],
                                       ld_in_reordered_1_bits_vaddr[15:6]},
       valids_4
         & {entries_4_vaddr[20:16] ^ entries_4_vaddr[25:21] ^ entries_4_vaddr[30:26],
            entries_4_vaddr[15:6]} == {ld_in_reordered_1_bits_vaddr[20:16]
                                         ^ ld_in_reordered_1_bits_vaddr[25:21]
                                         ^ ld_in_reordered_1_bits_vaddr[30:26],
                                       ld_in_reordered_1_bits_vaddr[15:6]},
       valids_5
         & {entries_5_vaddr[20:16] ^ entries_5_vaddr[25:21] ^ entries_5_vaddr[30:26],
            entries_5_vaddr[15:6]} == {ld_in_reordered_1_bits_vaddr[20:16]
                                         ^ ld_in_reordered_1_bits_vaddr[25:21]
                                         ^ ld_in_reordered_1_bits_vaddr[30:26],
                                       ld_in_reordered_1_bits_vaddr[15:6]}} == 6'h0
    & ~(ld_in_reordered_0_valid
        & {ld_in_reordered_0_bits_vaddr[20:16] ^ ld_in_reordered_0_bits_vaddr[25:21]
             ^ ld_in_reordered_0_bits_vaddr[30:26],
           ld_in_reordered_0_bits_vaddr[15:6]} == {ld_in_reordered_1_bits_vaddr[20:16]
                                                     ^ ld_in_reordered_1_bits_vaddr[25:21]
                                                     ^ ld_in_reordered_1_bits_vaddr[30:26],
                                                   ld_in_reordered_1_bits_vaddr[15:6]});
  wire [1:0]       _GEN_5 = {1'h0, needAlloc_0};
  wire [3:0]       _GEN_6 =
    {{enqPtrExt_0_flag}, {enqPtrExt_2_flag}, {enqPtrExt_1_flag}, {enqPtrExt_0_flag}};
  wire [3:0][2:0]  _GEN_7 =
    {{enqPtrExt_0_value}, {enqPtrExt_2_value}, {enqPtrExt_1_value}, {enqPtrExt_0_value}};
  wire             canAlloc_1 =
    needAlloc_1 & (_GEN_6[_GEN_5] ^ deqPtrExt_flag ^ _GEN_7[_GEN_5] >= deqPtrExt_value);
  wire             _GEN_8 = _GEN_7[_GEN_5] == 3'h0;
  wire             _GEN_9 = _GEN_7[_GEN_5] == 3'h1;
  wire             _GEN_10 = _GEN_7[_GEN_5] == 3'h2;
  wire             _GEN_11 = _GEN_7[_GEN_5] == 3'h3;
  wire             _GEN_12 = _GEN_7[_GEN_5] == 3'h4;
  wire             _GEN_13 = _GEN_7[_GEN_5] == 3'h5;
  wire [1:0]       index = 2'(_GEN_5 + {1'h0, needAlloc_1});
  wire             canAlloc_2 =
    ld_in_reordered_2_valid
    & {valids_0
         & {entries_0_vaddr[20:16] ^ entries_0_vaddr[25:21] ^ entries_0_vaddr[30:26],
            entries_0_vaddr[15:6]} == {ld_in_reordered_2_bits_vaddr[20:16]
                                         ^ ld_in_reordered_2_bits_vaddr[25:21]
                                         ^ ld_in_reordered_2_bits_vaddr[30:26],
                                       ld_in_reordered_2_bits_vaddr[15:6]},
       valids_1
         & {entries_1_vaddr[20:16] ^ entries_1_vaddr[25:21] ^ entries_1_vaddr[30:26],
            entries_1_vaddr[15:6]} == {ld_in_reordered_2_bits_vaddr[20:16]
                                         ^ ld_in_reordered_2_bits_vaddr[25:21]
                                         ^ ld_in_reordered_2_bits_vaddr[30:26],
                                       ld_in_reordered_2_bits_vaddr[15:6]},
       valids_2
         & {entries_2_vaddr[20:16] ^ entries_2_vaddr[25:21] ^ entries_2_vaddr[30:26],
            entries_2_vaddr[15:6]} == {ld_in_reordered_2_bits_vaddr[20:16]
                                         ^ ld_in_reordered_2_bits_vaddr[25:21]
                                         ^ ld_in_reordered_2_bits_vaddr[30:26],
                                       ld_in_reordered_2_bits_vaddr[15:6]},
       valids_3
         & {entries_3_vaddr[20:16] ^ entries_3_vaddr[25:21] ^ entries_3_vaddr[30:26],
            entries_3_vaddr[15:6]} == {ld_in_reordered_2_bits_vaddr[20:16]
                                         ^ ld_in_reordered_2_bits_vaddr[25:21]
                                         ^ ld_in_reordered_2_bits_vaddr[30:26],
                                       ld_in_reordered_2_bits_vaddr[15:6]},
       valids_4
         & {entries_4_vaddr[20:16] ^ entries_4_vaddr[25:21] ^ entries_4_vaddr[30:26],
            entries_4_vaddr[15:6]} == {ld_in_reordered_2_bits_vaddr[20:16]
                                         ^ ld_in_reordered_2_bits_vaddr[25:21]
                                         ^ ld_in_reordered_2_bits_vaddr[30:26],
                                       ld_in_reordered_2_bits_vaddr[15:6]},
       valids_5
         & {entries_5_vaddr[20:16] ^ entries_5_vaddr[25:21] ^ entries_5_vaddr[30:26],
            entries_5_vaddr[15:6]} == {ld_in_reordered_2_bits_vaddr[20:16]
                                         ^ ld_in_reordered_2_bits_vaddr[25:21]
                                         ^ ld_in_reordered_2_bits_vaddr[30:26],
                                       ld_in_reordered_2_bits_vaddr[15:6]}} == 6'h0
    & {ld_in_reordered_0_valid
         & {ld_in_reordered_0_bits_vaddr[20:16] ^ ld_in_reordered_0_bits_vaddr[25:21]
              ^ ld_in_reordered_0_bits_vaddr[30:26],
            ld_in_reordered_0_bits_vaddr[15:6]} == {ld_in_reordered_2_bits_vaddr[20:16]
                                                      ^ ld_in_reordered_2_bits_vaddr[25:21]
                                                      ^ ld_in_reordered_2_bits_vaddr[30:26],
                                                    ld_in_reordered_2_bits_vaddr[15:6]},
       ld_in_reordered_1_valid
         & {ld_in_reordered_1_bits_vaddr[20:16] ^ ld_in_reordered_1_bits_vaddr[25:21]
              ^ ld_in_reordered_1_bits_vaddr[30:26],
            ld_in_reordered_1_bits_vaddr[15:6]} == {ld_in_reordered_2_bits_vaddr[20:16]
                                                      ^ ld_in_reordered_2_bits_vaddr[25:21]
                                                      ^ ld_in_reordered_2_bits_vaddr[30:26],
                                                    ld_in_reordered_2_bits_vaddr[15:6]}} == 2'h0
    & (_GEN_6[index] ^ deqPtrExt_flag ^ _GEN_7[index] >= deqPtrExt_value);
  wire             _GEN_14 = canAlloc_2 & _GEN_7[index] == 3'h0;
  wire             _GEN_15 = canAlloc_2 & _GEN_7[index] == 3'h1;
  wire             _GEN_16 = canAlloc_2 & _GEN_7[index] == 3'h2;
  wire             _GEN_17 = canAlloc_2 & _GEN_7[index] == 3'h3;
  wire             _GEN_18 = canAlloc_2 & _GEN_7[index] == 3'h4;
  wire             _GEN_19 = canAlloc_2 & _GEN_7[index] == 3'h5;
  wire             _GEN_20 = deqPtrExt_value == 3'h0;
  wire             _GEN_21 = _GEN_20 & valids_0;
  wire [7:0]       _GEN_22 =
    {{_GEN_21},
     {_GEN_21},
     {valids_5},
     {valids_4},
     {valids_3},
     {valids_2},
     {valids_1},
     {_GEN_21}};
  wire             io_train_req_valid_0 = _GEN_22[deqPtrExt_value];
  wire [7:0][49:0] _GEN_23 =
    {{entries_0_vaddr},
     {entries_0_vaddr},
     {entries_5_vaddr},
     {entries_4_vaddr},
     {entries_3_vaddr},
     {entries_2_vaddr},
     {entries_1_vaddr},
     {entries_0_vaddr}};
  wire [7:0][49:0] _GEN_24 =
    {{entries_0_pc},
     {entries_0_pc},
     {entries_5_pc},
     {entries_4_pc},
     {entries_3_pc},
     {entries_2_pc},
     {entries_1_pc},
     {entries_0_pc}};
  reg              REG;
  wire             ld_in_reordered_tmp_source_1_older =
    (&{io_ld_in_0_valid, io_ld_in_1_valid})
    & (io_ld_in_1_bits_uop_robIdx_flag ^ io_ld_in_0_bits_uop_robIdx_flag
       ^ io_ld_in_1_bits_uop_robIdx_value < io_ld_in_0_bits_uop_robIdx_value);
  wire             ld_in_reordered_tmp_1_source_1_older =
    (&{ld_in_reordered_res_0_1_1_valid, ld_in_reordered_res_0_1_2_valid})
    & (ld_in_reordered_res_0_1_2_bits_uop_robIdx_flag
       ^ ld_in_reordered_res_0_1_1_bits_uop_robIdx_flag
       ^ ld_in_reordered_res_0_1_2_bits_uop_robIdx_value < ld_in_reordered_res_0_1_1_bits_uop_robIdx_value);
  wire             ld_in_reordered_tmp_2_source_1_older =
    (&{ld_in_reordered_res_1_2_0_valid, ld_in_reordered_res_1_2_1_valid})
    & (ld_in_reordered_res_1_2_1_bits_uop_robIdx_flag
       ^ ld_in_reordered_res_1_2_0_bits_uop_robIdx_flag
       ^ ld_in_reordered_res_1_2_1_bits_uop_robIdx_value < ld_in_reordered_res_1_2_0_bits_uop_robIdx_value);
  always @(posedge clock) begin
    if (_GEN_14) begin
      entries_0_vaddr <= ld_in_reordered_2_bits_vaddr;
      entries_0_pc <= ld_in_reordered_2_bits_uop_pc;
    end
    else if (canAlloc_1 & _GEN_8) begin
      entries_0_vaddr <= ld_in_reordered_1_bits_vaddr;
      entries_0_pc <= ld_in_reordered_1_bits_uop_pc;
    end
    else if (_GEN) begin
      entries_0_vaddr <= ld_in_reordered_0_bits_vaddr;
      entries_0_pc <= ld_in_reordered_0_bits_uop_pc;
    end
    if (_GEN_15) begin
      entries_1_vaddr <= ld_in_reordered_2_bits_vaddr;
      entries_1_pc <= ld_in_reordered_2_bits_uop_pc;
    end
    else if (canAlloc_1 & _GEN_9) begin
      entries_1_vaddr <= ld_in_reordered_1_bits_vaddr;
      entries_1_pc <= ld_in_reordered_1_bits_uop_pc;
    end
    else if (_GEN_0) begin
      entries_1_vaddr <= ld_in_reordered_0_bits_vaddr;
      entries_1_pc <= ld_in_reordered_0_bits_uop_pc;
    end
    if (_GEN_16) begin
      entries_2_vaddr <= ld_in_reordered_2_bits_vaddr;
      entries_2_pc <= ld_in_reordered_2_bits_uop_pc;
    end
    else if (canAlloc_1 & _GEN_10) begin
      entries_2_vaddr <= ld_in_reordered_1_bits_vaddr;
      entries_2_pc <= ld_in_reordered_1_bits_uop_pc;
    end
    else if (_GEN_1) begin
      entries_2_vaddr <= ld_in_reordered_0_bits_vaddr;
      entries_2_pc <= ld_in_reordered_0_bits_uop_pc;
    end
    if (_GEN_17) begin
      entries_3_vaddr <= ld_in_reordered_2_bits_vaddr;
      entries_3_pc <= ld_in_reordered_2_bits_uop_pc;
    end
    else if (canAlloc_1 & _GEN_11) begin
      entries_3_vaddr <= ld_in_reordered_1_bits_vaddr;
      entries_3_pc <= ld_in_reordered_1_bits_uop_pc;
    end
    else if (_GEN_2) begin
      entries_3_vaddr <= ld_in_reordered_0_bits_vaddr;
      entries_3_pc <= ld_in_reordered_0_bits_uop_pc;
    end
    if (_GEN_18) begin
      entries_4_vaddr <= ld_in_reordered_2_bits_vaddr;
      entries_4_pc <= ld_in_reordered_2_bits_uop_pc;
    end
    else if (canAlloc_1 & _GEN_12) begin
      entries_4_vaddr <= ld_in_reordered_1_bits_vaddr;
      entries_4_pc <= ld_in_reordered_1_bits_uop_pc;
    end
    else if (_GEN_3) begin
      entries_4_vaddr <= ld_in_reordered_0_bits_vaddr;
      entries_4_pc <= ld_in_reordered_0_bits_uop_pc;
    end
    if (_GEN_19) begin
      entries_5_vaddr <= ld_in_reordered_2_bits_vaddr;
      entries_5_pc <= ld_in_reordered_2_bits_uop_pc;
    end
    else if (canAlloc_1 & _GEN_13) begin
      entries_5_vaddr <= ld_in_reordered_1_bits_vaddr;
      entries_5_pc <= ld_in_reordered_1_bits_uop_pc;
    end
    else if (_GEN_4) begin
      entries_5_vaddr <= ld_in_reordered_0_bits_vaddr;
      entries_5_pc <= ld_in_reordered_0_bits_uop_pc;
    end
    ld_in_reordered_res_0_1_0_valid <=
      ld_in_reordered_tmp_source_1_older ? io_ld_in_1_valid : io_ld_in_0_valid;
    ld_in_reordered_res_0_1_0_bits_uop_pc <=
      ld_in_reordered_tmp_source_1_older
        ? io_ld_in_1_bits_uop_pc
        : io_ld_in_0_bits_uop_pc;
    ld_in_reordered_res_0_1_0_bits_uop_robIdx_flag <=
      ld_in_reordered_tmp_source_1_older
        ? io_ld_in_1_bits_uop_robIdx_flag
        : io_ld_in_0_bits_uop_robIdx_flag;
    ld_in_reordered_res_0_1_0_bits_uop_robIdx_value <=
      ld_in_reordered_tmp_source_1_older
        ? io_ld_in_1_bits_uop_robIdx_value
        : io_ld_in_0_bits_uop_robIdx_value;
    ld_in_reordered_res_0_1_0_bits_vaddr <=
      ld_in_reordered_tmp_source_1_older ? io_ld_in_1_bits_vaddr : io_ld_in_0_bits_vaddr;
    ld_in_reordered_res_0_1_1_valid <=
      ld_in_reordered_tmp_source_1_older ? io_ld_in_0_valid : io_ld_in_1_valid;
    ld_in_reordered_res_0_1_1_bits_uop_pc <=
      ld_in_reordered_tmp_source_1_older
        ? io_ld_in_0_bits_uop_pc
        : io_ld_in_1_bits_uop_pc;
    ld_in_reordered_res_0_1_1_bits_uop_robIdx_flag <=
      ld_in_reordered_tmp_source_1_older
        ? io_ld_in_0_bits_uop_robIdx_flag
        : io_ld_in_1_bits_uop_robIdx_flag;
    ld_in_reordered_res_0_1_1_bits_uop_robIdx_value <=
      ld_in_reordered_tmp_source_1_older
        ? io_ld_in_0_bits_uop_robIdx_value
        : io_ld_in_1_bits_uop_robIdx_value;
    ld_in_reordered_res_0_1_1_bits_vaddr <=
      ld_in_reordered_tmp_source_1_older ? io_ld_in_0_bits_vaddr : io_ld_in_1_bits_vaddr;
    ld_in_reordered_res_0_1_2_valid <= io_ld_in_2_valid;
    ld_in_reordered_res_0_1_2_bits_uop_pc <= io_ld_in_2_bits_uop_pc;
    ld_in_reordered_res_0_1_2_bits_uop_robIdx_flag <= io_ld_in_2_bits_uop_robIdx_flag;
    ld_in_reordered_res_0_1_2_bits_uop_robIdx_value <= io_ld_in_2_bits_uop_robIdx_value;
    ld_in_reordered_res_0_1_2_bits_vaddr <= io_ld_in_2_bits_vaddr;
    ld_in_reordered_res_1_2_0_valid <= ld_in_reordered_res_0_1_0_valid;
    ld_in_reordered_res_1_2_0_bits_uop_pc <= ld_in_reordered_res_0_1_0_bits_uop_pc;
    ld_in_reordered_res_1_2_0_bits_uop_robIdx_flag <=
      ld_in_reordered_res_0_1_0_bits_uop_robIdx_flag;
    ld_in_reordered_res_1_2_0_bits_uop_robIdx_value <=
      ld_in_reordered_res_0_1_0_bits_uop_robIdx_value;
    ld_in_reordered_res_1_2_0_bits_vaddr <= ld_in_reordered_res_0_1_0_bits_vaddr;
    ld_in_reordered_res_1_2_1_valid <=
      ld_in_reordered_tmp_1_source_1_older
        ? ld_in_reordered_res_0_1_2_valid
        : ld_in_reordered_res_0_1_1_valid;
    ld_in_reordered_res_1_2_1_bits_uop_pc <=
      ld_in_reordered_tmp_1_source_1_older
        ? ld_in_reordered_res_0_1_2_bits_uop_pc
        : ld_in_reordered_res_0_1_1_bits_uop_pc;
    ld_in_reordered_res_1_2_1_bits_uop_robIdx_flag <=
      ld_in_reordered_tmp_1_source_1_older
        ? ld_in_reordered_res_0_1_2_bits_uop_robIdx_flag
        : ld_in_reordered_res_0_1_1_bits_uop_robIdx_flag;
    ld_in_reordered_res_1_2_1_bits_uop_robIdx_value <=
      ld_in_reordered_tmp_1_source_1_older
        ? ld_in_reordered_res_0_1_2_bits_uop_robIdx_value
        : ld_in_reordered_res_0_1_1_bits_uop_robIdx_value;
    ld_in_reordered_res_1_2_1_bits_vaddr <=
      ld_in_reordered_tmp_1_source_1_older
        ? ld_in_reordered_res_0_1_2_bits_vaddr
        : ld_in_reordered_res_0_1_1_bits_vaddr;
    ld_in_reordered_res_1_2_2_valid <=
      ld_in_reordered_tmp_1_source_1_older
        ? ld_in_reordered_res_0_1_1_valid
        : ld_in_reordered_res_0_1_2_valid;
    ld_in_reordered_res_1_2_2_bits_uop_pc <=
      ld_in_reordered_tmp_1_source_1_older
        ? ld_in_reordered_res_0_1_1_bits_uop_pc
        : ld_in_reordered_res_0_1_2_bits_uop_pc;
    ld_in_reordered_res_1_2_2_bits_vaddr <=
      ld_in_reordered_tmp_1_source_1_older
        ? ld_in_reordered_res_0_1_1_bits_vaddr
        : ld_in_reordered_res_0_1_2_bits_vaddr;
    ld_in_reordered_0_valid <=
      ld_in_reordered_tmp_2_source_1_older
        ? ld_in_reordered_res_1_2_1_valid
        : ld_in_reordered_res_1_2_0_valid;
    ld_in_reordered_0_bits_uop_pc <=
      ld_in_reordered_tmp_2_source_1_older
        ? ld_in_reordered_res_1_2_1_bits_uop_pc
        : ld_in_reordered_res_1_2_0_bits_uop_pc;
    ld_in_reordered_0_bits_vaddr <=
      ld_in_reordered_tmp_2_source_1_older
        ? ld_in_reordered_res_1_2_1_bits_vaddr
        : ld_in_reordered_res_1_2_0_bits_vaddr;
    ld_in_reordered_1_valid <=
      ld_in_reordered_tmp_2_source_1_older
        ? ld_in_reordered_res_1_2_0_valid
        : ld_in_reordered_res_1_2_1_valid;
    ld_in_reordered_1_bits_uop_pc <=
      ld_in_reordered_tmp_2_source_1_older
        ? ld_in_reordered_res_1_2_0_bits_uop_pc
        : ld_in_reordered_res_1_2_1_bits_uop_pc;
    ld_in_reordered_1_bits_vaddr <=
      ld_in_reordered_tmp_2_source_1_older
        ? ld_in_reordered_res_1_2_0_bits_vaddr
        : ld_in_reordered_res_1_2_1_bits_vaddr;
    ld_in_reordered_2_valid <= ld_in_reordered_res_1_2_2_valid;
    ld_in_reordered_2_bits_uop_pc <= ld_in_reordered_res_1_2_2_bits_uop_pc;
    ld_in_reordered_2_bits_vaddr <= ld_in_reordered_res_1_2_2_bits_vaddr;
    REG <= 1'h0;
  end // always @(posedge)
  wire [2:0]       _GEN_25 = {canAlloc_2, canAlloc_1, canAlloc_0};
  wire [3:0]       _GEN_26 =
    {2'h0, 2'({1'h0, canAlloc_0} + 2'({1'h0, canAlloc_1} + {1'h0, canAlloc_2}))};
  wire [3:0]       enqPtrExt_0_new_value = 4'({1'h0, enqPtrExt_0_value} + _GEN_26);
  wire [4:0]       _enqPtrExt_0_diff_T_4 = 5'({1'h0, enqPtrExt_0_new_value} - 5'h6);
  wire             enqPtrExt_0_reverse_flag = $signed(_enqPtrExt_0_diff_T_4) > -5'sh1;
  wire [3:0]       enqPtrExt_1_new_value = 4'({1'h0, enqPtrExt_1_value} + _GEN_26);
  wire [4:0]       _enqPtrExt_1_diff_T_4 = 5'({1'h0, enqPtrExt_1_new_value} - 5'h6);
  wire             enqPtrExt_1_reverse_flag = $signed(_enqPtrExt_1_diff_T_4) > -5'sh1;
  wire [3:0]       enqPtrExt_2_new_value = 4'({1'h0, enqPtrExt_2_value} + _GEN_26);
  wire [4:0]       _enqPtrExt_2_diff_T_4 = 5'({1'h0, enqPtrExt_2_new_value} - 5'h6);
  wire             enqPtrExt_2_reverse_flag = $signed(_enqPtrExt_2_diff_T_4) > -5'sh1;
  wire             _GEN_27 = io_train_req_ready & io_train_req_valid_0;
  wire [3:0]       deqPtrExt_new_value = 4'({1'h0, deqPtrExt_value} + 4'h1);
  wire [4:0]       _deqPtrExt_diff_T_4 = 5'({1'h0, deqPtrExt_new_value} - 5'h6);
  wire             deqPtrExt_reverse_flag = $signed(_deqPtrExt_diff_T_4) > -5'sh1;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      valids_0 <= 1'h0;
      valids_1 <= 1'h0;
      valids_2 <= 1'h0;
      valids_3 <= 1'h0;
      valids_4 <= 1'h0;
      valids_5 <= 1'h0;
      enqPtrExt_0_flag <= 1'h0;
      enqPtrExt_0_value <= 3'h0;
      enqPtrExt_1_flag <= 1'h0;
      enqPtrExt_1_value <= 3'h1;
      enqPtrExt_2_flag <= 1'h0;
      enqPtrExt_2_value <= 3'h2;
      deqPtrExt_flag <= 1'h0;
      deqPtrExt_value <= 3'h0;
    end
    else begin
      valids_0 <=
        ~(REG | _GEN_27 & _GEN_20)
        & (_GEN_14 | (canAlloc_1 ? _GEN_8 | _GEN | valids_0 : _GEN | valids_0));
      valids_1 <=
        ~(REG | _GEN_27 & deqPtrExt_value == 3'h1)
        & (_GEN_15 | (canAlloc_1 ? _GEN_9 | _GEN_0 | valids_1 : _GEN_0 | valids_1));
      valids_2 <=
        ~(REG | _GEN_27 & deqPtrExt_value == 3'h2)
        & (_GEN_16 | (canAlloc_1 ? _GEN_10 | _GEN_1 | valids_2 : _GEN_1 | valids_2));
      valids_3 <=
        ~(REG | _GEN_27 & deqPtrExt_value == 3'h3)
        & (_GEN_17 | (canAlloc_1 ? _GEN_11 | _GEN_2 | valids_3 : _GEN_2 | valids_3));
      valids_4 <=
        ~(REG | _GEN_27 & deqPtrExt_value == 3'h4)
        & (_GEN_18 | (canAlloc_1 ? _GEN_12 | _GEN_3 | valids_4 : _GEN_3 | valids_4));
      valids_5 <=
        ~(REG | _GEN_27 & deqPtrExt_value == 3'h5)
        & (_GEN_19 | (canAlloc_1 ? _GEN_13 | _GEN_4 | valids_5 : _GEN_4 | valids_5));
      enqPtrExt_0_flag <=
        ~REG & ((|_GEN_25) & enqPtrExt_0_reverse_flag ^ enqPtrExt_0_flag);
      if (REG) begin
        enqPtrExt_0_value <= 3'h0;
        enqPtrExt_1_value <= 3'h1;
        enqPtrExt_2_value <= 3'h2;
        deqPtrExt_value <= 3'h0;
      end
      else begin
        if (|_GEN_25) begin
          enqPtrExt_0_value <=
            enqPtrExt_0_reverse_flag
              ? _enqPtrExt_0_diff_T_4[2:0]
              : enqPtrExt_0_new_value[2:0];
          enqPtrExt_1_value <=
            enqPtrExt_1_reverse_flag
              ? _enqPtrExt_1_diff_T_4[2:0]
              : enqPtrExt_1_new_value[2:0];
          enqPtrExt_2_value <=
            enqPtrExt_2_reverse_flag
              ? _enqPtrExt_2_diff_T_4[2:0]
              : enqPtrExt_2_new_value[2:0];
        end
        if (_GEN_27)
          deqPtrExt_value <=
            deqPtrExt_reverse_flag ? _deqPtrExt_diff_T_4[2:0] : deqPtrExt_new_value[2:0];
      end
      enqPtrExt_1_flag <=
        ~REG & ((|_GEN_25) & enqPtrExt_1_reverse_flag ^ enqPtrExt_1_flag);
      enqPtrExt_2_flag <=
        ~REG & ((|_GEN_25) & enqPtrExt_2_reverse_flag ^ enqPtrExt_2_flag);
      deqPtrExt_flag <= ~REG & (_GEN_27 & deqPtrExt_reverse_flag ^ deqPtrExt_flag);
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:578];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [9:0] i = 10'h0; i < 10'h243; i += 10'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        entries_0_vaddr = {_RANDOM[10'h0], _RANDOM[10'h1][17:0]};
        entries_0_pc = {_RANDOM[10'h3][31:2], _RANDOM[10'h4][19:0]};
        entries_1_vaddr = {_RANDOM[10'h4][31:22], _RANDOM[10'h5], _RANDOM[10'h6][7:0]};
        entries_1_pc = {_RANDOM[10'h7][31:24], _RANDOM[10'h8], _RANDOM[10'h9][9:0]};
        entries_2_vaddr = {_RANDOM[10'h9][31:12], _RANDOM[10'hA][29:0]};
        entries_2_pc = {_RANDOM[10'hC][31:14], _RANDOM[10'hD]};
        entries_3_vaddr = {_RANDOM[10'hE][31:2], _RANDOM[10'hF][19:0]};
        entries_3_pc = {_RANDOM[10'h11][31:4], _RANDOM[10'h12][21:0]};
        entries_4_vaddr = {_RANDOM[10'h12][31:24], _RANDOM[10'h13], _RANDOM[10'h14][9:0]};
        entries_4_pc = {_RANDOM[10'h15][31:26], _RANDOM[10'h16], _RANDOM[10'h17][11:0]};
        entries_5_vaddr = {_RANDOM[10'h17][31:14], _RANDOM[10'h18]};
        entries_5_pc = {_RANDOM[10'h1A][31:16], _RANDOM[10'h1B], _RANDOM[10'h1C][1:0]};
        valids_0 = _RANDOM[10'h1C][4];
        valids_1 = _RANDOM[10'h1C][5];
        valids_2 = _RANDOM[10'h1C][6];
        valids_3 = _RANDOM[10'h1C][7];
        valids_4 = _RANDOM[10'h1C][8];
        valids_5 = _RANDOM[10'h1C][9];
        enqPtrExt_0_flag = _RANDOM[10'h1C][10];
        enqPtrExt_0_value = _RANDOM[10'h1C][13:11];
        enqPtrExt_1_flag = _RANDOM[10'h1C][14];
        enqPtrExt_1_value = _RANDOM[10'h1C][17:15];
        enqPtrExt_2_flag = _RANDOM[10'h1C][18];
        enqPtrExt_2_value = _RANDOM[10'h1C][21:19];
        deqPtrExt_flag = _RANDOM[10'h1C][22];
        deqPtrExt_value = _RANDOM[10'h1C][25:23];
        ld_in_reordered_res_0_1_0_valid = _RANDOM[10'h1C][26];
        ld_in_reordered_res_0_1_0_bits_uop_pc =
          {_RANDOM[10'h1D][31:27], _RANDOM[10'h1E], _RANDOM[10'h1F][12:0]};
        ld_in_reordered_res_0_1_0_bits_uop_robIdx_flag = _RANDOM[10'h2F][7];
        ld_in_reordered_res_0_1_0_bits_uop_robIdx_value = _RANDOM[10'h2F][15:8];
        ld_in_reordered_res_0_1_0_bits_vaddr =
          {_RANDOM[10'h43][31:8], _RANDOM[10'h44][25:0]};
        ld_in_reordered_res_0_1_1_valid = _RANDOM[10'h59][27];
        ld_in_reordered_res_0_1_1_bits_uop_pc =
          {_RANDOM[10'h5A][31:28], _RANDOM[10'h5B], _RANDOM[10'h5C][13:0]};
        ld_in_reordered_res_0_1_1_bits_uop_robIdx_flag = _RANDOM[10'h6C][8];
        ld_in_reordered_res_0_1_1_bits_uop_robIdx_value = _RANDOM[10'h6C][16:9];
        ld_in_reordered_res_0_1_1_bits_vaddr =
          {_RANDOM[10'h80][31:9], _RANDOM[10'h81][26:0]};
        ld_in_reordered_res_0_1_2_valid = _RANDOM[10'h96][28];
        ld_in_reordered_res_0_1_2_bits_uop_pc =
          {_RANDOM[10'h97][31:29], _RANDOM[10'h98], _RANDOM[10'h99][14:0]};
        ld_in_reordered_res_0_1_2_bits_uop_robIdx_flag = _RANDOM[10'hA9][9];
        ld_in_reordered_res_0_1_2_bits_uop_robIdx_value = _RANDOM[10'hA9][17:10];
        ld_in_reordered_res_0_1_2_bits_vaddr =
          {_RANDOM[10'hBD][31:10], _RANDOM[10'hBE][27:0]};
        ld_in_reordered_res_1_2_0_valid = _RANDOM[10'hD3][29];
        ld_in_reordered_res_1_2_0_bits_uop_pc =
          {_RANDOM[10'hD4][31:30], _RANDOM[10'hD5], _RANDOM[10'hD6][15:0]};
        ld_in_reordered_res_1_2_0_bits_uop_robIdx_flag = _RANDOM[10'hE6][10];
        ld_in_reordered_res_1_2_0_bits_uop_robIdx_value = _RANDOM[10'hE6][18:11];
        ld_in_reordered_res_1_2_0_bits_vaddr =
          {_RANDOM[10'hFA][31:11], _RANDOM[10'hFB][28:0]};
        ld_in_reordered_res_1_2_1_valid = _RANDOM[10'h110][30];
        ld_in_reordered_res_1_2_1_bits_uop_pc =
          {_RANDOM[10'h111][31], _RANDOM[10'h112], _RANDOM[10'h113][16:0]};
        ld_in_reordered_res_1_2_1_bits_uop_robIdx_flag = _RANDOM[10'h123][11];
        ld_in_reordered_res_1_2_1_bits_uop_robIdx_value = _RANDOM[10'h123][19:12];
        ld_in_reordered_res_1_2_1_bits_vaddr =
          {_RANDOM[10'h137][31:12], _RANDOM[10'h138][29:0]};
        ld_in_reordered_res_1_2_2_valid = _RANDOM[10'h14D][31];
        ld_in_reordered_res_1_2_2_bits_uop_pc =
          {_RANDOM[10'h14F], _RANDOM[10'h150][17:0]};
        ld_in_reordered_res_1_2_2_bits_vaddr =
          {_RANDOM[10'h174][31:13], _RANDOM[10'h175][30:0]};
        ld_in_reordered_0_valid = _RANDOM[10'h18B][0];
        ld_in_reordered_0_bits_uop_pc = {_RANDOM[10'h18C][31:1], _RANDOM[10'h18D][18:0]};
        ld_in_reordered_0_bits_vaddr = {_RANDOM[10'h1B1][31:14], _RANDOM[10'h1B2]};
        ld_in_reordered_1_valid = _RANDOM[10'h1C8][1];
        ld_in_reordered_1_bits_uop_pc = {_RANDOM[10'h1C9][31:2], _RANDOM[10'h1CA][19:0]};
        ld_in_reordered_1_bits_vaddr =
          {_RANDOM[10'h1EE][31:15], _RANDOM[10'h1EF], _RANDOM[10'h1F0][0]};
        ld_in_reordered_2_valid = _RANDOM[10'h205][2];
        ld_in_reordered_2_bits_uop_pc = {_RANDOM[10'h206][31:3], _RANDOM[10'h207][20:0]};
        ld_in_reordered_2_bits_vaddr =
          {_RANDOM[10'h22B][31:16], _RANDOM[10'h22C], _RANDOM[10'h22D][1:0]};
        REG = _RANDOM[10'h242][3];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        valids_0 = 1'h0;
        valids_1 = 1'h0;
        valids_2 = 1'h0;
        valids_3 = 1'h0;
        valids_4 = 1'h0;
        valids_5 = 1'h0;
        enqPtrExt_0_flag = 1'h0;
        enqPtrExt_0_value = 3'h0;
        enqPtrExt_1_flag = 1'h0;
        enqPtrExt_1_value = 3'h1;
        enqPtrExt_2_flag = 1'h0;
        enqPtrExt_2_value = 3'h2;
        deqPtrExt_flag = 1'h0;
        deqPtrExt_value = 3'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_train_req_valid = io_train_req_valid_0;
  assign io_train_req_bits_vaddr = _GEN_23[deqPtrExt_value];
  assign io_train_req_bits_pc = _GEN_24[deqPtrExt_value];
endmodule

