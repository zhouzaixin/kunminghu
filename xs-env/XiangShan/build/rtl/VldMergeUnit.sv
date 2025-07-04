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

module VldMergeUnit(
  input          clock,
  input          io_flush_valid,
  input          io_flush_bits_robIdx_flag,
  input  [7:0]   io_flush_bits_robIdx_value,
  input          io_flush_bits_level,
  input          io_writeback_valid,
  input  [127:0] io_writeback_bits_data_0,
  input  [6:0]   io_writeback_bits_pdest,
  input          io_writeback_bits_robIdx_flag,
  input  [7:0]   io_writeback_bits_robIdx_value,
  input          io_writeback_bits_vecWen,
  input          io_writeback_bits_v0Wen,
  input          io_writeback_bits_vlWen,
  input          io_writeback_bits_vls_vpu_vma,
  input          io_writeback_bits_vls_vpu_vta,
  input  [1:0]   io_writeback_bits_vls_vpu_vsew,
  input          io_writeback_bits_vls_vpu_vm,
  input  [7:0]   io_writeback_bits_vls_vpu_vstart,
  input  [127:0] io_writeback_bits_vls_vpu_vmask,
  input  [7:0]   io_writeback_bits_vls_vpu_vl,
  input  [1:0]   io_writeback_bits_vls_vpu_veew,
  input  [2:0]   io_writeback_bits_vls_vdIdxInField,
  input          io_writeback_bits_vls_isIndexed,
  input          io_writeback_bits_vls_isMasked,
  output         io_writebackAfterMerge_valid,
  output [127:0] io_writebackAfterMerge_bits_data_0,
  output [6:0]   io_writebackAfterMerge_bits_pdest,
  output         io_writebackAfterMerge_bits_vecWen,
  output         io_writebackAfterMerge_bits_v0Wen,
  output         io_writebackAfterMerge_bits_vlWen
);

  wire [127:0] _mgu_io_out_vd;
  reg          wbReg_valid;
  reg  [127:0] wbReg_bits_data_0;
  reg  [6:0]   wbReg_bits_pdest;
  reg          wbReg_bits_vecWen;
  reg          wbReg_bits_v0Wen;
  reg          wbReg_bits_vlWen;
  reg          wbReg_bits_vls_vpu_vma;
  reg          wbReg_bits_vls_vpu_vta;
  reg  [1:0]   wbReg_bits_vls_vpu_vsew;
  reg          wbReg_bits_vls_vpu_vm;
  reg  [7:0]   wbReg_bits_vls_vpu_vstart;
  reg  [127:0] wbReg_bits_vls_vpu_vmask;
  reg  [7:0]   wbReg_bits_vls_vpu_vl;
  reg  [1:0]   wbReg_bits_vls_vpu_veew;
  reg  [2:0]   wbReg_bits_vls_vdIdxInField;
  reg          wbReg_bits_vls_isIndexed;
  reg          wbReg_bits_vls_isMasked;
  always @(posedge clock) begin
    wbReg_valid <=
      ~(io_flush_valid
        & (io_flush_bits_level
           & {io_writeback_bits_robIdx_flag,
              io_writeback_bits_robIdx_value} == {io_flush_bits_robIdx_flag,
                                                  io_flush_bits_robIdx_value}
           | io_writeback_bits_robIdx_flag ^ io_flush_bits_robIdx_flag
           ^ io_writeback_bits_robIdx_value > io_flush_bits_robIdx_value))
      & io_writeback_valid;
    if (io_writeback_valid) begin
      wbReg_bits_data_0 <= io_writeback_bits_data_0;
      wbReg_bits_pdest <= io_writeback_bits_pdest;
      wbReg_bits_vecWen <= io_writeback_bits_vecWen;
      wbReg_bits_v0Wen <= io_writeback_bits_v0Wen;
      wbReg_bits_vlWen <= io_writeback_bits_vlWen;
      wbReg_bits_vls_vpu_vma <= io_writeback_bits_vls_vpu_vma;
      wbReg_bits_vls_vpu_vta <= io_writeback_bits_vls_vpu_vta;
      wbReg_bits_vls_vpu_vsew <= io_writeback_bits_vls_vpu_vsew;
      wbReg_bits_vls_vpu_vm <= io_writeback_bits_vls_vpu_vm;
      wbReg_bits_vls_vpu_vstart <= io_writeback_bits_vls_vpu_vstart;
      wbReg_bits_vls_vpu_vmask <= io_writeback_bits_vls_vpu_vmask;
      wbReg_bits_vls_vpu_vl <= io_writeback_bits_vls_vpu_vl;
      wbReg_bits_vls_vpu_veew <= io_writeback_bits_vls_vpu_veew;
      wbReg_bits_vls_vdIdxInField <= io_writeback_bits_vls_vdIdxInField;
      wbReg_bits_vls_isIndexed <= io_writeback_bits_vls_isIndexed;
      wbReg_bits_vls_isMasked <= io_writeback_bits_vls_isMasked;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:12];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [3:0] i = 4'h0; i < 4'hD; i += 4'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        wbReg_valid = _RANDOM[4'h0][0];
        wbReg_bits_data_0 =
          {_RANDOM[4'h0][31:1],
           _RANDOM[4'h1],
           _RANDOM[4'h2],
           _RANDOM[4'h3],
           _RANDOM[4'h4][0]};
        wbReg_bits_pdest = _RANDOM[4'h4][7:1];
        wbReg_bits_vecWen = _RANDOM[4'h4][17];
        wbReg_bits_v0Wen = _RANDOM[4'h4][18];
        wbReg_bits_vlWen = _RANDOM[4'h4][19];
        wbReg_bits_vls_vpu_vma = _RANDOM[4'h5][19];
        wbReg_bits_vls_vpu_vta = _RANDOM[4'h5][20];
        wbReg_bits_vls_vpu_vsew = _RANDOM[4'h5][22:21];
        wbReg_bits_vls_vpu_vm = _RANDOM[4'h6][2];
        wbReg_bits_vls_vpu_vstart = _RANDOM[4'h6][10:3];
        wbReg_bits_vls_vpu_vmask =
          {_RANDOM[4'h6][31],
           _RANDOM[4'h7],
           _RANDOM[4'h8],
           _RANDOM[4'h9],
           _RANDOM[4'hA][30:0]};
        wbReg_bits_vls_vpu_vl = {_RANDOM[4'hA][31], _RANDOM[4'hB][6:0]};
        wbReg_bits_vls_vpu_veew = _RANDOM[4'hB][11:10];
        wbReg_bits_vls_vdIdxInField = _RANDOM[4'hC][2:0];
        wbReg_bits_vls_isIndexed = _RANDOM[4'hC][3];
        wbReg_bits_vls_isMasked = _RANDOM[4'hC][4];
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  VldMgu mgu (
    .io_in_vd           (wbReg_bits_data_0),
    .io_in_oldVd        (wbReg_bits_data_0),
    .io_in_mask
      (wbReg_bits_vls_vpu_vm
         ? 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
         : wbReg_bits_vls_vpu_vmask),
    .io_in_info_ta      (wbReg_bits_vls_isMasked | wbReg_bits_vls_vpu_vta),
    .io_in_info_ma      (wbReg_bits_vls_vpu_vma),
    .io_in_info_vl      (wbReg_bits_vls_vpu_vl),
    .io_in_info_vstart  (wbReg_bits_vls_vpu_vstart),
    .io_in_info_eew     (wbReg_bits_vls_vpu_veew),
    .io_in_info_vsew    (wbReg_bits_vls_vpu_vsew),
    .io_in_info_vdIdx   (wbReg_bits_vls_vdIdxInField),
    .io_in_isIndexedVls (wbReg_bits_vls_isIndexed),
    .io_out_vd          (_mgu_io_out_vd)
  );
  assign io_writebackAfterMerge_valid = wbReg_valid;
  assign io_writebackAfterMerge_bits_data_0 =
    wbReg_bits_vlWen ? wbReg_bits_data_0 : _mgu_io_out_vd;
  assign io_writebackAfterMerge_bits_pdest = wbReg_bits_pdest;
  assign io_writebackAfterMerge_bits_vecWen = wbReg_bits_vecWen;
  assign io_writebackAfterMerge_bits_v0Wen = wbReg_bits_v0Wen;
  assign io_writebackAfterMerge_bits_vlWen = wbReg_bits_vlWen;
endmodule

