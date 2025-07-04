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

module NewPipelineConnectPipe_14(
  input          clock,
  input          reset,
  input          io_in_valid,
  input  [34:0]  io_in_bits_fuType,
  input  [8:0]   io_in_bits_fuOpType,
  input  [127:0] io_in_bits_src_0,
  input  [127:0] io_in_bits_src_1,
  input  [127:0] io_in_bits_src_2,
  input  [127:0] io_in_bits_src_3,
  input  [127:0] io_in_bits_src_4,
  input          io_in_bits_robIdx_flag,
  input  [7:0]   io_in_bits_robIdx_value,
  input  [7:0]   io_in_bits_pdest,
  input          io_in_bits_rfWen,
  input          io_in_bits_fpWen,
  input          io_in_bits_vecWen,
  input          io_in_bits_v0Wen,
  input          io_in_bits_vlWen,
  input          io_in_bits_fpu_wflags,
  input          io_in_bits_vpu_vma,
  input          io_in_bits_vpu_vta,
  input  [1:0]   io_in_bits_vpu_vsew,
  input  [2:0]   io_in_bits_vpu_vlmul,
  input          io_in_bits_vpu_vm,
  input  [7:0]   io_in_bits_vpu_vstart,
  input          io_in_bits_vpu_fpu_isFoldTo1_2,
  input          io_in_bits_vpu_fpu_isFoldTo1_4,
  input          io_in_bits_vpu_fpu_isFoldTo1_8,
  input  [6:0]   io_in_bits_vpu_vuopIdx,
  input          io_in_bits_vpu_lastUop,
  input          io_in_bits_vpu_isNarrow,
  input          io_in_bits_vpu_isDstMask,
  output         io_out_valid,
  output [34:0]  io_out_bits_fuType,
  output [8:0]   io_out_bits_fuOpType,
  output [127:0] io_out_bits_src_0,
  output [127:0] io_out_bits_src_1,
  output [127:0] io_out_bits_src_2,
  output [127:0] io_out_bits_src_3,
  output [127:0] io_out_bits_src_4,
  output         io_out_bits_robIdx_flag,
  output [7:0]   io_out_bits_robIdx_value,
  output [7:0]   io_out_bits_pdest,
  output         io_out_bits_rfWen,
  output         io_out_bits_fpWen,
  output         io_out_bits_vecWen,
  output         io_out_bits_v0Wen,
  output         io_out_bits_vlWen,
  output         io_out_bits_fpu_wflags,
  output         io_out_bits_vpu_vma,
  output         io_out_bits_vpu_vta,
  output [1:0]   io_out_bits_vpu_vsew,
  output [2:0]   io_out_bits_vpu_vlmul,
  output         io_out_bits_vpu_vm,
  output [7:0]   io_out_bits_vpu_vstart,
  output         io_out_bits_vpu_fpu_isFoldTo1_2,
  output         io_out_bits_vpu_fpu_isFoldTo1_4,
  output         io_out_bits_vpu_fpu_isFoldTo1_8,
  output [6:0]   io_out_bits_vpu_vuopIdx,
  output         io_out_bits_vpu_lastUop,
  output         io_out_bits_vpu_isNarrow,
  output         io_out_bits_vpu_isDstMask,
  input          io_rightOutFire,
  input          io_isFlush
);

  reg         valid;
  reg [34:0]  data_fuType;
  reg [8:0]   data_fuOpType;
  reg [127:0] data_src_0;
  reg [127:0] data_src_1;
  reg [127:0] data_src_2;
  reg [127:0] data_src_3;
  reg [127:0] data_src_4;
  reg         data_robIdx_flag;
  reg [7:0]   data_robIdx_value;
  reg [7:0]   data_pdest;
  reg         data_rfWen;
  reg         data_fpWen;
  reg         data_vecWen;
  reg         data_v0Wen;
  reg         data_vlWen;
  reg         data_fpu_wflags;
  reg         data_vpu_vma;
  reg         data_vpu_vta;
  reg [1:0]   data_vpu_vsew;
  reg [2:0]   data_vpu_vlmul;
  reg         data_vpu_vm;
  reg [7:0]   data_vpu_vstart;
  reg         data_vpu_fpu_isFoldTo1_2;
  reg         data_vpu_fpu_isFoldTo1_4;
  reg         data_vpu_fpu_isFoldTo1_8;
  reg [6:0]   data_vpu_vuopIdx;
  reg         data_vpu_lastUop;
  reg         data_vpu_isNarrow;
  reg         data_vpu_isDstMask;
  always @(posedge clock or posedge reset) begin
    if (reset)
      valid <= 1'h0;
    else
      valid <= ~io_isFlush & (io_in_valid | ~io_rightOutFire & valid);
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (io_in_valid) begin
      data_fuType <= io_in_bits_fuType;
      data_fuOpType <= io_in_bits_fuOpType;
      data_src_0 <= io_in_bits_src_0;
      data_src_1 <= io_in_bits_src_1;
      data_src_2 <= io_in_bits_src_2;
      data_src_3 <= io_in_bits_src_3;
      data_src_4 <= io_in_bits_src_4;
      data_robIdx_flag <= io_in_bits_robIdx_flag;
      data_robIdx_value <= io_in_bits_robIdx_value;
      data_pdest <= io_in_bits_pdest;
      data_rfWen <= io_in_bits_rfWen;
      data_fpWen <= io_in_bits_fpWen;
      data_vecWen <= io_in_bits_vecWen;
      data_v0Wen <= io_in_bits_v0Wen;
      data_vlWen <= io_in_bits_vlWen;
      data_fpu_wflags <= io_in_bits_fpu_wflags;
      data_vpu_vma <= io_in_bits_vpu_vma;
      data_vpu_vta <= io_in_bits_vpu_vta;
      data_vpu_vsew <= io_in_bits_vpu_vsew;
      data_vpu_vlmul <= io_in_bits_vpu_vlmul;
      data_vpu_vm <= io_in_bits_vpu_vm;
      data_vpu_vstart <= io_in_bits_vpu_vstart;
      data_vpu_fpu_isFoldTo1_2 <= io_in_bits_vpu_fpu_isFoldTo1_2;
      data_vpu_fpu_isFoldTo1_4 <= io_in_bits_vpu_fpu_isFoldTo1_4;
      data_vpu_fpu_isFoldTo1_8 <= io_in_bits_vpu_fpu_isFoldTo1_8;
      data_vpu_vuopIdx <= io_in_bits_vpu_vuopIdx;
      data_vpu_lastUop <= io_in_bits_vpu_lastUop;
      data_vpu_isNarrow <= io_in_bits_vpu_isNarrow;
      data_vpu_isDstMask <= io_in_bits_vpu_isDstMask;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:30];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [4:0] i = 5'h0; i < 5'h1F; i += 5'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        valid = _RANDOM[5'h0][0];
        data_fuType = {_RANDOM[5'h0][31:1], _RANDOM[5'h1][3:0]};
        data_fuOpType = _RANDOM[5'h1][12:4];
        data_src_0 =
          {_RANDOM[5'h1][31:13],
           _RANDOM[5'h2],
           _RANDOM[5'h3],
           _RANDOM[5'h4],
           _RANDOM[5'h5][12:0]};
        data_src_1 =
          {_RANDOM[5'h5][31:13],
           _RANDOM[5'h6],
           _RANDOM[5'h7],
           _RANDOM[5'h8],
           _RANDOM[5'h9][12:0]};
        data_src_2 =
          {_RANDOM[5'h9][31:13],
           _RANDOM[5'hA],
           _RANDOM[5'hB],
           _RANDOM[5'hC],
           _RANDOM[5'hD][12:0]};
        data_src_3 =
          {_RANDOM[5'hD][31:13],
           _RANDOM[5'hE],
           _RANDOM[5'hF],
           _RANDOM[5'h10],
           _RANDOM[5'h11][12:0]};
        data_src_4 =
          {_RANDOM[5'h11][31:13],
           _RANDOM[5'h12],
           _RANDOM[5'h13],
           _RANDOM[5'h14],
           _RANDOM[5'h15][12:0]};
        data_robIdx_flag = _RANDOM[5'h17][13];
        data_robIdx_value = _RANDOM[5'h17][21:14];
        data_pdest = {_RANDOM[5'h17][31:27], _RANDOM[5'h18][2:0]};
        data_rfWen = _RANDOM[5'h18][3];
        data_fpWen = _RANDOM[5'h18][4];
        data_vecWen = _RANDOM[5'h18][5];
        data_v0Wen = _RANDOM[5'h18][6];
        data_vlWen = _RANDOM[5'h18][7];
        data_fpu_wflags = _RANDOM[5'h18][10];
        data_vpu_vma = _RANDOM[5'h18][19];
        data_vpu_vta = _RANDOM[5'h18][20];
        data_vpu_vsew = _RANDOM[5'h18][22:21];
        data_vpu_vlmul = _RANDOM[5'h18][25:23];
        data_vpu_vm = _RANDOM[5'h19][2];
        data_vpu_vstart = _RANDOM[5'h19][10:3];
        data_vpu_fpu_isFoldTo1_2 = _RANDOM[5'h19][18];
        data_vpu_fpu_isFoldTo1_4 = _RANDOM[5'h19][19];
        data_vpu_fpu_isFoldTo1_8 = _RANDOM[5'h19][20];
        data_vpu_vuopIdx = _RANDOM[5'h19][29:23];
        data_vpu_lastUop = _RANDOM[5'h19][30];
        data_vpu_isNarrow = _RANDOM[5'h1E][14];
        data_vpu_isDstMask = _RANDOM[5'h1E][15];
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        valid = 1'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_out_valid = valid;
  assign io_out_bits_fuType = data_fuType;
  assign io_out_bits_fuOpType = data_fuOpType;
  assign io_out_bits_src_0 = data_src_0;
  assign io_out_bits_src_1 = data_src_1;
  assign io_out_bits_src_2 = data_src_2;
  assign io_out_bits_src_3 = data_src_3;
  assign io_out_bits_src_4 = data_src_4;
  assign io_out_bits_robIdx_flag = data_robIdx_flag;
  assign io_out_bits_robIdx_value = data_robIdx_value;
  assign io_out_bits_pdest = data_pdest;
  assign io_out_bits_rfWen = data_rfWen;
  assign io_out_bits_fpWen = data_fpWen;
  assign io_out_bits_vecWen = data_vecWen;
  assign io_out_bits_v0Wen = data_v0Wen;
  assign io_out_bits_vlWen = data_vlWen;
  assign io_out_bits_fpu_wflags = data_fpu_wflags;
  assign io_out_bits_vpu_vma = data_vpu_vma;
  assign io_out_bits_vpu_vta = data_vpu_vta;
  assign io_out_bits_vpu_vsew = data_vpu_vsew;
  assign io_out_bits_vpu_vlmul = data_vpu_vlmul;
  assign io_out_bits_vpu_vm = data_vpu_vm;
  assign io_out_bits_vpu_vstart = data_vpu_vstart;
  assign io_out_bits_vpu_fpu_isFoldTo1_2 = data_vpu_fpu_isFoldTo1_2;
  assign io_out_bits_vpu_fpu_isFoldTo1_4 = data_vpu_fpu_isFoldTo1_4;
  assign io_out_bits_vpu_fpu_isFoldTo1_8 = data_vpu_fpu_isFoldTo1_8;
  assign io_out_bits_vpu_vuopIdx = data_vpu_vuopIdx;
  assign io_out_bits_vpu_lastUop = data_vpu_lastUop;
  assign io_out_bits_vpu_isNarrow = data_vpu_isNarrow;
  assign io_out_bits_vpu_isDstMask = data_vpu_isDstMask;
endmodule

