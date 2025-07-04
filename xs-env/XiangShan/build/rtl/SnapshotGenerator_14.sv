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

module SnapshotGenerator_14(
  input        clock,
  input        reset,
  input        io_enq,
  input        io_enqData_robIdx_0_flag,
  input  [7:0] io_enqData_robIdx_0_value,
  input        io_enqData_robIdx_1_flag,
  input  [7:0] io_enqData_robIdx_1_value,
  input        io_enqData_robIdx_2_flag,
  input  [7:0] io_enqData_robIdx_2_value,
  input        io_enqData_robIdx_3_flag,
  input  [7:0] io_enqData_robIdx_3_value,
  input        io_enqData_robIdx_4_flag,
  input  [7:0] io_enqData_robIdx_4_value,
  input        io_enqData_robIdx_5_flag,
  input  [7:0] io_enqData_robIdx_5_value,
  input        io_enqData_isCFI_0,
  input        io_enqData_isCFI_1,
  input        io_enqData_isCFI_2,
  input        io_enqData_isCFI_3,
  input        io_enqData_isCFI_4,
  input        io_enqData_isCFI_5,
  input        io_deq,
  input        io_redirect,
  input        io_flushVec_0,
  input        io_flushVec_1,
  input        io_flushVec_2,
  input        io_flushVec_3,
  output       io_snapshots_0_robIdx_0_flag,
  output [7:0] io_snapshots_0_robIdx_0_value,
  output       io_snapshots_0_robIdx_1_flag,
  output [7:0] io_snapshots_0_robIdx_1_value,
  output       io_snapshots_0_robIdx_2_flag,
  output [7:0] io_snapshots_0_robIdx_2_value,
  output       io_snapshots_0_robIdx_3_flag,
  output [7:0] io_snapshots_0_robIdx_3_value,
  output       io_snapshots_0_robIdx_4_flag,
  output [7:0] io_snapshots_0_robIdx_4_value,
  output       io_snapshots_0_robIdx_5_flag,
  output [7:0] io_snapshots_0_robIdx_5_value,
  output       io_snapshots_0_isCFI_0,
  output       io_snapshots_0_isCFI_1,
  output       io_snapshots_0_isCFI_2,
  output       io_snapshots_0_isCFI_3,
  output       io_snapshots_0_isCFI_4,
  output       io_snapshots_0_isCFI_5,
  output       io_snapshots_1_robIdx_0_flag,
  output [7:0] io_snapshots_1_robIdx_0_value,
  output       io_snapshots_1_robIdx_1_flag,
  output [7:0] io_snapshots_1_robIdx_1_value,
  output       io_snapshots_1_robIdx_2_flag,
  output [7:0] io_snapshots_1_robIdx_2_value,
  output       io_snapshots_1_robIdx_3_flag,
  output [7:0] io_snapshots_1_robIdx_3_value,
  output       io_snapshots_1_robIdx_4_flag,
  output [7:0] io_snapshots_1_robIdx_4_value,
  output       io_snapshots_1_robIdx_5_flag,
  output [7:0] io_snapshots_1_robIdx_5_value,
  output       io_snapshots_1_isCFI_0,
  output       io_snapshots_1_isCFI_1,
  output       io_snapshots_1_isCFI_2,
  output       io_snapshots_1_isCFI_3,
  output       io_snapshots_1_isCFI_4,
  output       io_snapshots_1_isCFI_5,
  output       io_snapshots_2_robIdx_0_flag,
  output [7:0] io_snapshots_2_robIdx_0_value,
  output       io_snapshots_2_robIdx_1_flag,
  output [7:0] io_snapshots_2_robIdx_1_value,
  output       io_snapshots_2_robIdx_2_flag,
  output [7:0] io_snapshots_2_robIdx_2_value,
  output       io_snapshots_2_robIdx_3_flag,
  output [7:0] io_snapshots_2_robIdx_3_value,
  output       io_snapshots_2_robIdx_4_flag,
  output [7:0] io_snapshots_2_robIdx_4_value,
  output       io_snapshots_2_robIdx_5_flag,
  output [7:0] io_snapshots_2_robIdx_5_value,
  output       io_snapshots_2_isCFI_0,
  output       io_snapshots_2_isCFI_1,
  output       io_snapshots_2_isCFI_2,
  output       io_snapshots_2_isCFI_3,
  output       io_snapshots_2_isCFI_4,
  output       io_snapshots_2_isCFI_5,
  output       io_snapshots_3_robIdx_0_flag,
  output [7:0] io_snapshots_3_robIdx_0_value,
  output       io_snapshots_3_robIdx_1_flag,
  output [7:0] io_snapshots_3_robIdx_1_value,
  output       io_snapshots_3_robIdx_2_flag,
  output [7:0] io_snapshots_3_robIdx_2_value,
  output       io_snapshots_3_robIdx_3_flag,
  output [7:0] io_snapshots_3_robIdx_3_value,
  output       io_snapshots_3_robIdx_4_flag,
  output [7:0] io_snapshots_3_robIdx_4_value,
  output       io_snapshots_3_robIdx_5_flag,
  output [7:0] io_snapshots_3_robIdx_5_value,
  output       io_snapshots_3_isCFI_0,
  output       io_snapshots_3_isCFI_1,
  output       io_snapshots_3_isCFI_2,
  output       io_snapshots_3_isCFI_3,
  output       io_snapshots_3_isCFI_4,
  output       io_snapshots_3_isCFI_5,
  output       io_enqPtr_flag,
  output [1:0] io_enqPtr_value,
  output       io_deqPtr_flag,
  output [1:0] io_deqPtr_value,
  output       io_valids_0,
  output       io_valids_1,
  output       io_valids_2,
  output       io_valids_3
);

  reg        snapshots_0_robIdx_0_flag;
  reg  [7:0] snapshots_0_robIdx_0_value;
  reg        snapshots_0_robIdx_1_flag;
  reg  [7:0] snapshots_0_robIdx_1_value;
  reg        snapshots_0_robIdx_2_flag;
  reg  [7:0] snapshots_0_robIdx_2_value;
  reg        snapshots_0_robIdx_3_flag;
  reg  [7:0] snapshots_0_robIdx_3_value;
  reg        snapshots_0_robIdx_4_flag;
  reg  [7:0] snapshots_0_robIdx_4_value;
  reg        snapshots_0_robIdx_5_flag;
  reg  [7:0] snapshots_0_robIdx_5_value;
  reg        snapshots_0_isCFI_0;
  reg        snapshots_0_isCFI_1;
  reg        snapshots_0_isCFI_2;
  reg        snapshots_0_isCFI_3;
  reg        snapshots_0_isCFI_4;
  reg        snapshots_0_isCFI_5;
  reg        snapshots_1_robIdx_0_flag;
  reg  [7:0] snapshots_1_robIdx_0_value;
  reg        snapshots_1_robIdx_1_flag;
  reg  [7:0] snapshots_1_robIdx_1_value;
  reg        snapshots_1_robIdx_2_flag;
  reg  [7:0] snapshots_1_robIdx_2_value;
  reg        snapshots_1_robIdx_3_flag;
  reg  [7:0] snapshots_1_robIdx_3_value;
  reg        snapshots_1_robIdx_4_flag;
  reg  [7:0] snapshots_1_robIdx_4_value;
  reg        snapshots_1_robIdx_5_flag;
  reg  [7:0] snapshots_1_robIdx_5_value;
  reg        snapshots_1_isCFI_0;
  reg        snapshots_1_isCFI_1;
  reg        snapshots_1_isCFI_2;
  reg        snapshots_1_isCFI_3;
  reg        snapshots_1_isCFI_4;
  reg        snapshots_1_isCFI_5;
  reg        snapshots_2_robIdx_0_flag;
  reg  [7:0] snapshots_2_robIdx_0_value;
  reg        snapshots_2_robIdx_1_flag;
  reg  [7:0] snapshots_2_robIdx_1_value;
  reg        snapshots_2_robIdx_2_flag;
  reg  [7:0] snapshots_2_robIdx_2_value;
  reg        snapshots_2_robIdx_3_flag;
  reg  [7:0] snapshots_2_robIdx_3_value;
  reg        snapshots_2_robIdx_4_flag;
  reg  [7:0] snapshots_2_robIdx_4_value;
  reg        snapshots_2_robIdx_5_flag;
  reg  [7:0] snapshots_2_robIdx_5_value;
  reg        snapshots_2_isCFI_0;
  reg        snapshots_2_isCFI_1;
  reg        snapshots_2_isCFI_2;
  reg        snapshots_2_isCFI_3;
  reg        snapshots_2_isCFI_4;
  reg        snapshots_2_isCFI_5;
  reg        snapshots_3_robIdx_0_flag;
  reg  [7:0] snapshots_3_robIdx_0_value;
  reg        snapshots_3_robIdx_1_flag;
  reg  [7:0] snapshots_3_robIdx_1_value;
  reg        snapshots_3_robIdx_2_flag;
  reg  [7:0] snapshots_3_robIdx_2_value;
  reg        snapshots_3_robIdx_3_flag;
  reg  [7:0] snapshots_3_robIdx_3_value;
  reg        snapshots_3_robIdx_4_flag;
  reg  [7:0] snapshots_3_robIdx_4_value;
  reg        snapshots_3_robIdx_5_flag;
  reg  [7:0] snapshots_3_robIdx_5_value;
  reg        snapshots_3_isCFI_0;
  reg        snapshots_3_isCFI_1;
  reg        snapshots_3_isCFI_2;
  reg        snapshots_3_isCFI_3;
  reg        snapshots_3_isCFI_4;
  reg        snapshots_3_isCFI_5;
  reg        snptEnqPtr_flag;
  reg  [1:0] snptEnqPtr_value;
  reg        snptDeqPtr_flag;
  reg  [1:0] snptDeqPtr_value;
  reg        snptValids_0;
  reg        snptValids_1;
  reg        snptValids_2;
  reg        snptValids_3;
  wire       _GEN =
    ~io_redirect
    & ~(snptEnqPtr_flag != snptDeqPtr_flag & snptEnqPtr_value == snptDeqPtr_value)
    & io_enq;
  wire       _GEN_0 = _GEN & snptEnqPtr_value == 2'h0;
  wire       _GEN_1 = _GEN & snptEnqPtr_value == 2'h1;
  wire       _GEN_2 = _GEN & snptEnqPtr_value == 2'h2;
  wire       _GEN_3 = _GEN & (&snptEnqPtr_value);
  always @(posedge clock) begin
    if (_GEN_0) begin
      snapshots_0_robIdx_0_flag <= io_enqData_robIdx_0_flag;
      snapshots_0_robIdx_0_value <= io_enqData_robIdx_0_value;
      snapshots_0_robIdx_1_flag <= io_enqData_robIdx_1_flag;
      snapshots_0_robIdx_1_value <= io_enqData_robIdx_1_value;
      snapshots_0_robIdx_2_flag <= io_enqData_robIdx_2_flag;
      snapshots_0_robIdx_2_value <= io_enqData_robIdx_2_value;
      snapshots_0_robIdx_3_flag <= io_enqData_robIdx_3_flag;
      snapshots_0_robIdx_3_value <= io_enqData_robIdx_3_value;
      snapshots_0_robIdx_4_flag <= io_enqData_robIdx_4_flag;
      snapshots_0_robIdx_4_value <= io_enqData_robIdx_4_value;
      snapshots_0_robIdx_5_flag <= io_enqData_robIdx_5_flag;
      snapshots_0_robIdx_5_value <= io_enqData_robIdx_5_value;
      snapshots_0_isCFI_0 <= io_enqData_isCFI_0;
      snapshots_0_isCFI_1 <= io_enqData_isCFI_1;
      snapshots_0_isCFI_2 <= io_enqData_isCFI_2;
      snapshots_0_isCFI_3 <= io_enqData_isCFI_3;
      snapshots_0_isCFI_4 <= io_enqData_isCFI_4;
      snapshots_0_isCFI_5 <= io_enqData_isCFI_5;
    end
    if (_GEN_1) begin
      snapshots_1_robIdx_0_flag <= io_enqData_robIdx_0_flag;
      snapshots_1_robIdx_0_value <= io_enqData_robIdx_0_value;
      snapshots_1_robIdx_1_flag <= io_enqData_robIdx_1_flag;
      snapshots_1_robIdx_1_value <= io_enqData_robIdx_1_value;
      snapshots_1_robIdx_2_flag <= io_enqData_robIdx_2_flag;
      snapshots_1_robIdx_2_value <= io_enqData_robIdx_2_value;
      snapshots_1_robIdx_3_flag <= io_enqData_robIdx_3_flag;
      snapshots_1_robIdx_3_value <= io_enqData_robIdx_3_value;
      snapshots_1_robIdx_4_flag <= io_enqData_robIdx_4_flag;
      snapshots_1_robIdx_4_value <= io_enqData_robIdx_4_value;
      snapshots_1_robIdx_5_flag <= io_enqData_robIdx_5_flag;
      snapshots_1_robIdx_5_value <= io_enqData_robIdx_5_value;
      snapshots_1_isCFI_0 <= io_enqData_isCFI_0;
      snapshots_1_isCFI_1 <= io_enqData_isCFI_1;
      snapshots_1_isCFI_2 <= io_enqData_isCFI_2;
      snapshots_1_isCFI_3 <= io_enqData_isCFI_3;
      snapshots_1_isCFI_4 <= io_enqData_isCFI_4;
      snapshots_1_isCFI_5 <= io_enqData_isCFI_5;
    end
    if (_GEN_2) begin
      snapshots_2_robIdx_0_flag <= io_enqData_robIdx_0_flag;
      snapshots_2_robIdx_0_value <= io_enqData_robIdx_0_value;
      snapshots_2_robIdx_1_flag <= io_enqData_robIdx_1_flag;
      snapshots_2_robIdx_1_value <= io_enqData_robIdx_1_value;
      snapshots_2_robIdx_2_flag <= io_enqData_robIdx_2_flag;
      snapshots_2_robIdx_2_value <= io_enqData_robIdx_2_value;
      snapshots_2_robIdx_3_flag <= io_enqData_robIdx_3_flag;
      snapshots_2_robIdx_3_value <= io_enqData_robIdx_3_value;
      snapshots_2_robIdx_4_flag <= io_enqData_robIdx_4_flag;
      snapshots_2_robIdx_4_value <= io_enqData_robIdx_4_value;
      snapshots_2_robIdx_5_flag <= io_enqData_robIdx_5_flag;
      snapshots_2_robIdx_5_value <= io_enqData_robIdx_5_value;
      snapshots_2_isCFI_0 <= io_enqData_isCFI_0;
      snapshots_2_isCFI_1 <= io_enqData_isCFI_1;
      snapshots_2_isCFI_2 <= io_enqData_isCFI_2;
      snapshots_2_isCFI_3 <= io_enqData_isCFI_3;
      snapshots_2_isCFI_4 <= io_enqData_isCFI_4;
      snapshots_2_isCFI_5 <= io_enqData_isCFI_5;
    end
    if (_GEN_3) begin
      snapshots_3_robIdx_0_flag <= io_enqData_robIdx_0_flag;
      snapshots_3_robIdx_0_value <= io_enqData_robIdx_0_value;
      snapshots_3_robIdx_1_flag <= io_enqData_robIdx_1_flag;
      snapshots_3_robIdx_1_value <= io_enqData_robIdx_1_value;
      snapshots_3_robIdx_2_flag <= io_enqData_robIdx_2_flag;
      snapshots_3_robIdx_2_value <= io_enqData_robIdx_2_value;
      snapshots_3_robIdx_3_flag <= io_enqData_robIdx_3_flag;
      snapshots_3_robIdx_3_value <= io_enqData_robIdx_3_value;
      snapshots_3_robIdx_4_flag <= io_enqData_robIdx_4_flag;
      snapshots_3_robIdx_4_value <= io_enqData_robIdx_4_value;
      snapshots_3_robIdx_5_flag <= io_enqData_robIdx_5_flag;
      snapshots_3_robIdx_5_value <= io_enqData_robIdx_5_value;
      snapshots_3_isCFI_0 <= io_enqData_isCFI_0;
      snapshots_3_isCFI_1 <= io_enqData_isCFI_1;
      snapshots_3_isCFI_2 <= io_enqData_isCFI_2;
      snapshots_3_isCFI_3 <= io_enqData_isCFI_3;
      snapshots_3_isCFI_4 <= io_enqData_isCFI_4;
      snapshots_3_isCFI_5 <= io_enqData_isCFI_5;
    end
  end // always @(posedge)
  wire [3:0] _GEN_4 = {{snptValids_3}, {snptValids_2}, {snptValids_1}, {snptValids_0}};
  wire [3:0] _GEN_5 =
    {{io_flushVec_3}, {io_flushVec_2}, {io_flushVec_1}, {io_flushVec_0}};
  wire       newEnqPtrQualified_0 = ~_GEN_4[snptDeqPtr_value] | _GEN_5[snptDeqPtr_value];
  wire [2:0] _snptEnqPtr_new_ptr_T_1 = 3'({snptEnqPtr_flag, snptEnqPtr_value} + 3'h1);
  wire       _GEN_6 = ~io_redirect & io_deq;
  wire [2:0] _GEN_7 = {snptDeqPtr_flag, snptDeqPtr_value};
  wire [2:0] _newEnqPtrCandidate_new_ptr_T_6 = 3'(_GEN_7 + 3'h1);
  wire [2:0] _newEnqPtrCandidate_new_ptr_T_11 = 3'(_GEN_7 + 3'h2);
  wire [2:0] _newEnqPtrCandidate_new_ptr_T_16 = 3'(_GEN_7 + 3'h3);
  wire       _GEN_8 = _GEN_4[_newEnqPtrCandidate_new_ptr_T_6[1:0]];
  wire       newEnqPtrQualified_1 =
    _GEN_8 & (~_GEN_8 | _GEN_5[_newEnqPtrCandidate_new_ptr_T_6[1:0]]);
  wire       _GEN_9 = _GEN_4[_newEnqPtrCandidate_new_ptr_T_11[1:0]];
  wire       newEnqPtrQualified_2 =
    _GEN_9 & (~_GEN_9 | _GEN_5[_newEnqPtrCandidate_new_ptr_T_11[1:0]]);
  wire [2:0] _snptDeqPtr_new_ptr_T_1 = 3'(_GEN_7 + 3'h1);
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      snptEnqPtr_flag <= 1'h0;
      snptEnqPtr_value <= 2'h0;
      snptDeqPtr_flag <= 1'h0;
      snptDeqPtr_value <= 2'h0;
      snptValids_0 <= 1'h0;
      snptValids_1 <= 1'h0;
      snptValids_2 <= 1'h0;
      snptValids_3 <= 1'h0;
    end
    else begin
      if (|({io_flushVec_0, io_flushVec_1, io_flushVec_2, io_flushVec_3}
            & {snptValids_0, snptValids_1, snptValids_2, snptValids_3})) begin
        snptEnqPtr_flag <=
          newEnqPtrQualified_0
            ? snptDeqPtr_flag
            : newEnqPtrQualified_1
                ? _newEnqPtrCandidate_new_ptr_T_6[2]
                : newEnqPtrQualified_2
                    ? _newEnqPtrCandidate_new_ptr_T_11[2]
                    : _newEnqPtrCandidate_new_ptr_T_16[2];
        snptEnqPtr_value <=
          newEnqPtrQualified_0
            ? snptDeqPtr_value
            : newEnqPtrQualified_1
                ? _newEnqPtrCandidate_new_ptr_T_6[1:0]
                : newEnqPtrQualified_2
                    ? _newEnqPtrCandidate_new_ptr_T_11[1:0]
                    : _newEnqPtrCandidate_new_ptr_T_16[1:0];
      end
      else if (_GEN) begin
        snptEnqPtr_flag <= _snptEnqPtr_new_ptr_T_1[2];
        snptEnqPtr_value <= _snptEnqPtr_new_ptr_T_1[1:0];
      end
      if (_GEN_6) begin
        snptDeqPtr_flag <= _snptDeqPtr_new_ptr_T_1[2];
        snptDeqPtr_value <= _snptDeqPtr_new_ptr_T_1[1:0];
      end
      snptValids_0 <=
        ~(io_flushVec_0 | _GEN_6 & snptDeqPtr_value == 2'h0) & (_GEN_0 | snptValids_0);
      snptValids_1 <=
        ~(io_flushVec_1 | _GEN_6 & snptDeqPtr_value == 2'h1) & (_GEN_1 | snptValids_1);
      snptValids_2 <=
        ~(io_flushVec_2 | _GEN_6 & snptDeqPtr_value == 2'h2) & (_GEN_2 | snptValids_2);
      snptValids_3 <=
        ~(io_flushVec_3 | _GEN_6 & (&snptDeqPtr_value)) & (_GEN_3 | snptValids_3);
    end
  end // always @(posedge, posedge)
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
        snapshots_0_robIdx_0_flag = _RANDOM[3'h0][0];
        snapshots_0_robIdx_0_value = _RANDOM[3'h0][8:1];
        snapshots_0_robIdx_1_flag = _RANDOM[3'h0][9];
        snapshots_0_robIdx_1_value = _RANDOM[3'h0][17:10];
        snapshots_0_robIdx_2_flag = _RANDOM[3'h0][18];
        snapshots_0_robIdx_2_value = _RANDOM[3'h0][26:19];
        snapshots_0_robIdx_3_flag = _RANDOM[3'h0][27];
        snapshots_0_robIdx_3_value = {_RANDOM[3'h0][31:28], _RANDOM[3'h1][3:0]};
        snapshots_0_robIdx_4_flag = _RANDOM[3'h1][4];
        snapshots_0_robIdx_4_value = _RANDOM[3'h1][12:5];
        snapshots_0_robIdx_5_flag = _RANDOM[3'h1][13];
        snapshots_0_robIdx_5_value = _RANDOM[3'h1][21:14];
        snapshots_0_isCFI_0 = _RANDOM[3'h1][22];
        snapshots_0_isCFI_1 = _RANDOM[3'h1][23];
        snapshots_0_isCFI_2 = _RANDOM[3'h1][24];
        snapshots_0_isCFI_3 = _RANDOM[3'h1][25];
        snapshots_0_isCFI_4 = _RANDOM[3'h1][26];
        snapshots_0_isCFI_5 = _RANDOM[3'h1][27];
        snapshots_1_robIdx_0_flag = _RANDOM[3'h1][28];
        snapshots_1_robIdx_0_value = {_RANDOM[3'h1][31:29], _RANDOM[3'h2][4:0]};
        snapshots_1_robIdx_1_flag = _RANDOM[3'h2][5];
        snapshots_1_robIdx_1_value = _RANDOM[3'h2][13:6];
        snapshots_1_robIdx_2_flag = _RANDOM[3'h2][14];
        snapshots_1_robIdx_2_value = _RANDOM[3'h2][22:15];
        snapshots_1_robIdx_3_flag = _RANDOM[3'h2][23];
        snapshots_1_robIdx_3_value = _RANDOM[3'h2][31:24];
        snapshots_1_robIdx_4_flag = _RANDOM[3'h3][0];
        snapshots_1_robIdx_4_value = _RANDOM[3'h3][8:1];
        snapshots_1_robIdx_5_flag = _RANDOM[3'h3][9];
        snapshots_1_robIdx_5_value = _RANDOM[3'h3][17:10];
        snapshots_1_isCFI_0 = _RANDOM[3'h3][18];
        snapshots_1_isCFI_1 = _RANDOM[3'h3][19];
        snapshots_1_isCFI_2 = _RANDOM[3'h3][20];
        snapshots_1_isCFI_3 = _RANDOM[3'h3][21];
        snapshots_1_isCFI_4 = _RANDOM[3'h3][22];
        snapshots_1_isCFI_5 = _RANDOM[3'h3][23];
        snapshots_2_robIdx_0_flag = _RANDOM[3'h3][24];
        snapshots_2_robIdx_0_value = {_RANDOM[3'h3][31:25], _RANDOM[3'h4][0]};
        snapshots_2_robIdx_1_flag = _RANDOM[3'h4][1];
        snapshots_2_robIdx_1_value = _RANDOM[3'h4][9:2];
        snapshots_2_robIdx_2_flag = _RANDOM[3'h4][10];
        snapshots_2_robIdx_2_value = _RANDOM[3'h4][18:11];
        snapshots_2_robIdx_3_flag = _RANDOM[3'h4][19];
        snapshots_2_robIdx_3_value = _RANDOM[3'h4][27:20];
        snapshots_2_robIdx_4_flag = _RANDOM[3'h4][28];
        snapshots_2_robIdx_4_value = {_RANDOM[3'h4][31:29], _RANDOM[3'h5][4:0]};
        snapshots_2_robIdx_5_flag = _RANDOM[3'h5][5];
        snapshots_2_robIdx_5_value = _RANDOM[3'h5][13:6];
        snapshots_2_isCFI_0 = _RANDOM[3'h5][14];
        snapshots_2_isCFI_1 = _RANDOM[3'h5][15];
        snapshots_2_isCFI_2 = _RANDOM[3'h5][16];
        snapshots_2_isCFI_3 = _RANDOM[3'h5][17];
        snapshots_2_isCFI_4 = _RANDOM[3'h5][18];
        snapshots_2_isCFI_5 = _RANDOM[3'h5][19];
        snapshots_3_robIdx_0_flag = _RANDOM[3'h5][20];
        snapshots_3_robIdx_0_value = _RANDOM[3'h5][28:21];
        snapshots_3_robIdx_1_flag = _RANDOM[3'h5][29];
        snapshots_3_robIdx_1_value = {_RANDOM[3'h5][31:30], _RANDOM[3'h6][5:0]};
        snapshots_3_robIdx_2_flag = _RANDOM[3'h6][6];
        snapshots_3_robIdx_2_value = _RANDOM[3'h6][14:7];
        snapshots_3_robIdx_3_flag = _RANDOM[3'h6][15];
        snapshots_3_robIdx_3_value = _RANDOM[3'h6][23:16];
        snapshots_3_robIdx_4_flag = _RANDOM[3'h6][24];
        snapshots_3_robIdx_4_value = {_RANDOM[3'h6][31:25], _RANDOM[3'h7][0]};
        snapshots_3_robIdx_5_flag = _RANDOM[3'h7][1];
        snapshots_3_robIdx_5_value = _RANDOM[3'h7][9:2];
        snapshots_3_isCFI_0 = _RANDOM[3'h7][10];
        snapshots_3_isCFI_1 = _RANDOM[3'h7][11];
        snapshots_3_isCFI_2 = _RANDOM[3'h7][12];
        snapshots_3_isCFI_3 = _RANDOM[3'h7][13];
        snapshots_3_isCFI_4 = _RANDOM[3'h7][14];
        snapshots_3_isCFI_5 = _RANDOM[3'h7][15];
        snptEnqPtr_flag = _RANDOM[3'h7][16];
        snptEnqPtr_value = _RANDOM[3'h7][18:17];
        snptDeqPtr_flag = _RANDOM[3'h7][19];
        snptDeqPtr_value = _RANDOM[3'h7][21:20];
        snptValids_0 = _RANDOM[3'h7][22];
        snptValids_1 = _RANDOM[3'h7][23];
        snptValids_2 = _RANDOM[3'h7][24];
        snptValids_3 = _RANDOM[3'h7][25];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        snptEnqPtr_flag = 1'h0;
        snptEnqPtr_value = 2'h0;
        snptDeqPtr_flag = 1'h0;
        snptDeqPtr_value = 2'h0;
        snptValids_0 = 1'h0;
        snptValids_1 = 1'h0;
        snptValids_2 = 1'h0;
        snptValids_3 = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_snapshots_0_robIdx_0_flag = snapshots_0_robIdx_0_flag;
  assign io_snapshots_0_robIdx_0_value = snapshots_0_robIdx_0_value;
  assign io_snapshots_0_robIdx_1_flag = snapshots_0_robIdx_1_flag;
  assign io_snapshots_0_robIdx_1_value = snapshots_0_robIdx_1_value;
  assign io_snapshots_0_robIdx_2_flag = snapshots_0_robIdx_2_flag;
  assign io_snapshots_0_robIdx_2_value = snapshots_0_robIdx_2_value;
  assign io_snapshots_0_robIdx_3_flag = snapshots_0_robIdx_3_flag;
  assign io_snapshots_0_robIdx_3_value = snapshots_0_robIdx_3_value;
  assign io_snapshots_0_robIdx_4_flag = snapshots_0_robIdx_4_flag;
  assign io_snapshots_0_robIdx_4_value = snapshots_0_robIdx_4_value;
  assign io_snapshots_0_robIdx_5_flag = snapshots_0_robIdx_5_flag;
  assign io_snapshots_0_robIdx_5_value = snapshots_0_robIdx_5_value;
  assign io_snapshots_0_isCFI_0 = snapshots_0_isCFI_0;
  assign io_snapshots_0_isCFI_1 = snapshots_0_isCFI_1;
  assign io_snapshots_0_isCFI_2 = snapshots_0_isCFI_2;
  assign io_snapshots_0_isCFI_3 = snapshots_0_isCFI_3;
  assign io_snapshots_0_isCFI_4 = snapshots_0_isCFI_4;
  assign io_snapshots_0_isCFI_5 = snapshots_0_isCFI_5;
  assign io_snapshots_1_robIdx_0_flag = snapshots_1_robIdx_0_flag;
  assign io_snapshots_1_robIdx_0_value = snapshots_1_robIdx_0_value;
  assign io_snapshots_1_robIdx_1_flag = snapshots_1_robIdx_1_flag;
  assign io_snapshots_1_robIdx_1_value = snapshots_1_robIdx_1_value;
  assign io_snapshots_1_robIdx_2_flag = snapshots_1_robIdx_2_flag;
  assign io_snapshots_1_robIdx_2_value = snapshots_1_robIdx_2_value;
  assign io_snapshots_1_robIdx_3_flag = snapshots_1_robIdx_3_flag;
  assign io_snapshots_1_robIdx_3_value = snapshots_1_robIdx_3_value;
  assign io_snapshots_1_robIdx_4_flag = snapshots_1_robIdx_4_flag;
  assign io_snapshots_1_robIdx_4_value = snapshots_1_robIdx_4_value;
  assign io_snapshots_1_robIdx_5_flag = snapshots_1_robIdx_5_flag;
  assign io_snapshots_1_robIdx_5_value = snapshots_1_robIdx_5_value;
  assign io_snapshots_1_isCFI_0 = snapshots_1_isCFI_0;
  assign io_snapshots_1_isCFI_1 = snapshots_1_isCFI_1;
  assign io_snapshots_1_isCFI_2 = snapshots_1_isCFI_2;
  assign io_snapshots_1_isCFI_3 = snapshots_1_isCFI_3;
  assign io_snapshots_1_isCFI_4 = snapshots_1_isCFI_4;
  assign io_snapshots_1_isCFI_5 = snapshots_1_isCFI_5;
  assign io_snapshots_2_robIdx_0_flag = snapshots_2_robIdx_0_flag;
  assign io_snapshots_2_robIdx_0_value = snapshots_2_robIdx_0_value;
  assign io_snapshots_2_robIdx_1_flag = snapshots_2_robIdx_1_flag;
  assign io_snapshots_2_robIdx_1_value = snapshots_2_robIdx_1_value;
  assign io_snapshots_2_robIdx_2_flag = snapshots_2_robIdx_2_flag;
  assign io_snapshots_2_robIdx_2_value = snapshots_2_robIdx_2_value;
  assign io_snapshots_2_robIdx_3_flag = snapshots_2_robIdx_3_flag;
  assign io_snapshots_2_robIdx_3_value = snapshots_2_robIdx_3_value;
  assign io_snapshots_2_robIdx_4_flag = snapshots_2_robIdx_4_flag;
  assign io_snapshots_2_robIdx_4_value = snapshots_2_robIdx_4_value;
  assign io_snapshots_2_robIdx_5_flag = snapshots_2_robIdx_5_flag;
  assign io_snapshots_2_robIdx_5_value = snapshots_2_robIdx_5_value;
  assign io_snapshots_2_isCFI_0 = snapshots_2_isCFI_0;
  assign io_snapshots_2_isCFI_1 = snapshots_2_isCFI_1;
  assign io_snapshots_2_isCFI_2 = snapshots_2_isCFI_2;
  assign io_snapshots_2_isCFI_3 = snapshots_2_isCFI_3;
  assign io_snapshots_2_isCFI_4 = snapshots_2_isCFI_4;
  assign io_snapshots_2_isCFI_5 = snapshots_2_isCFI_5;
  assign io_snapshots_3_robIdx_0_flag = snapshots_3_robIdx_0_flag;
  assign io_snapshots_3_robIdx_0_value = snapshots_3_robIdx_0_value;
  assign io_snapshots_3_robIdx_1_flag = snapshots_3_robIdx_1_flag;
  assign io_snapshots_3_robIdx_1_value = snapshots_3_robIdx_1_value;
  assign io_snapshots_3_robIdx_2_flag = snapshots_3_robIdx_2_flag;
  assign io_snapshots_3_robIdx_2_value = snapshots_3_robIdx_2_value;
  assign io_snapshots_3_robIdx_3_flag = snapshots_3_robIdx_3_flag;
  assign io_snapshots_3_robIdx_3_value = snapshots_3_robIdx_3_value;
  assign io_snapshots_3_robIdx_4_flag = snapshots_3_robIdx_4_flag;
  assign io_snapshots_3_robIdx_4_value = snapshots_3_robIdx_4_value;
  assign io_snapshots_3_robIdx_5_flag = snapshots_3_robIdx_5_flag;
  assign io_snapshots_3_robIdx_5_value = snapshots_3_robIdx_5_value;
  assign io_snapshots_3_isCFI_0 = snapshots_3_isCFI_0;
  assign io_snapshots_3_isCFI_1 = snapshots_3_isCFI_1;
  assign io_snapshots_3_isCFI_2 = snapshots_3_isCFI_2;
  assign io_snapshots_3_isCFI_3 = snapshots_3_isCFI_3;
  assign io_snapshots_3_isCFI_4 = snapshots_3_isCFI_4;
  assign io_snapshots_3_isCFI_5 = snapshots_3_isCFI_5;
  assign io_enqPtr_flag = snptEnqPtr_flag;
  assign io_enqPtr_value = snptEnqPtr_value;
  assign io_deqPtr_flag = snptDeqPtr_flag;
  assign io_deqPtr_value = snptDeqPtr_value;
  assign io_valids_0 = snptValids_0;
  assign io_valids_1 = snptValids_1;
  assign io_valids_2 = snptValids_2;
  assign io_valids_3 = snptValids_3;
endmodule

