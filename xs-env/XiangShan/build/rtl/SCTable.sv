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

module SCTable(
  input         clock,
  input         reset,
  input         io_req_valid,
  input  [49:0] io_req_bits_pc,
  output [5:0]  io_resp_ctrs_0_0,
  output [5:0]  io_resp_ctrs_0_1,
  output [5:0]  io_resp_ctrs_1_0,
  output [5:0]  io_resp_ctrs_1_1,
  input  [49:0] io_update_pc,
  input         io_update_mask_0,
  input         io_update_mask_1,
  input  [5:0]  io_update_oldCtrs_0,
  input  [5:0]  io_update_oldCtrs_1,
  input         io_update_tagePreds_0,
  input         io_update_tagePreds_1,
  input         io_update_takens_0,
  input         io_update_takens_1
);

  wire [5:0]  update_wdata_1;
  wire [5:0]  update_wdata_0;
  wire        _wrbypasses_1_io_hit;
  wire        _wrbypasses_1_io_hit_data_0_valid;
  wire [5:0]  _wrbypasses_1_io_hit_data_0_bits;
  wire        _wrbypasses_1_io_hit_data_1_valid;
  wire [5:0]  _wrbypasses_1_io_hit_data_1_bits;
  wire        _wrbypasses_0_io_hit;
  wire        _wrbypasses_0_io_hit_data_0_valid;
  wire [5:0]  _wrbypasses_0_io_hit_data_0_bits;
  wire        _wrbypasses_0_io_hit_data_1_valid;
  wire [5:0]  _wrbypasses_0_io_hit_data_1_bits;
  wire [5:0]  _table_io_r_resp_data_0;
  wire [5:0]  _table_io_r_resp_data_1;
  wire [5:0]  _table_io_r_resp_data_2;
  wire [5:0]  _table_io_r_resp_data_3;
  reg  [7:0]  s1_idx;
  reg  [49:0] s1_pc;
  wire        updateWayMask_0 =
    io_update_mask_0 & ~(io_update_pc[1]) & ~io_update_tagePreds_0 | io_update_mask_1
    & io_update_pc[1] & ~io_update_tagePreds_1;
  wire        updateWayMask_1 =
    io_update_mask_0 & ~(io_update_pc[1]) & io_update_tagePreds_0 | io_update_mask_1
    & io_update_pc[1] & io_update_tagePreds_1;
  wire        updateWayMask_2 =
    io_update_mask_0 & io_update_pc[1] & ~io_update_tagePreds_0 | io_update_mask_1
    & ~(io_update_pc[1]) & ~io_update_tagePreds_1;
  wire        updateWayMask_3 =
    io_update_mask_0 & io_update_pc[1] & io_update_tagePreds_0 | io_update_mask_1
    & ~(io_update_pc[1]) & io_update_tagePreds_1;
  reg         conflict_buffer_valid;
  reg  [5:0]  conflict_buffer_data_0;
  reg  [5:0]  conflict_buffer_data_1;
  reg  [5:0]  conflict_buffer_data_2;
  reg  [5:0]  conflict_buffer_data_3;
  reg  [7:0]  conflict_buffer_idx;
  reg         conflict_buffer_waymask_0;
  reg         conflict_buffer_waymask_1;
  reg         conflict_buffer_waymask_2;
  reg         conflict_buffer_waymask_3;
  wire        _write_conflict_T_1 = io_update_mask_0 | io_update_mask_1;
  wire        write_conflict =
    io_update_pc[8:1] == io_req_bits_pc[8:1] & _write_conflict_T_1 & io_req_valid;
  wire        can_write =
    (conflict_buffer_idx != io_req_bits_pc[8:1] | ~io_req_valid) & conflict_buffer_valid;
  wire        use_conflict_data = conflict_buffer_valid & conflict_buffer_idx == s1_idx;
  wire        ctrPos =
    ~(io_update_pc[1]) & io_update_tagePreds_0 | io_update_pc[1] & io_update_tagePreds_1;
  wire [5:0]  oldCtr =
    (~(io_update_pc[1]) & _wrbypasses_0_io_hit | io_update_pc[1] & _wrbypasses_1_io_hit)
    & (ctrPos
         ? ~(io_update_pc[1]) & _wrbypasses_0_io_hit_data_1_valid | io_update_pc[1]
           & _wrbypasses_1_io_hit_data_1_valid
         : ~(io_update_pc[1]) & _wrbypasses_0_io_hit_data_0_valid | io_update_pc[1]
           & _wrbypasses_1_io_hit_data_0_valid)
      ? (ctrPos
           ? (io_update_pc[1] ? 6'h0 : _wrbypasses_0_io_hit_data_1_bits)
             | (io_update_pc[1] ? _wrbypasses_1_io_hit_data_1_bits : 6'h0)
           : (io_update_pc[1] ? 6'h0 : _wrbypasses_0_io_hit_data_0_bits)
             | (io_update_pc[1] ? _wrbypasses_1_io_hit_data_0_bits : 6'h0))
      : (io_update_pc[1] ? 6'h0 : io_update_oldCtrs_0)
        | (io_update_pc[1] ? io_update_oldCtrs_1 : 6'h0);
  wire        taken =
    ~(io_update_pc[1]) & io_update_takens_0 | io_update_pc[1] & io_update_takens_1;
  assign update_wdata_0 =
    oldCtr == 6'h1F & taken
      ? 6'h1F
      : oldCtr == 6'h20 & ~taken ? 6'h20 : taken ? 6'(oldCtr + 6'h1) : 6'(oldCtr - 6'h1);
  wire        ctrPos_1 =
    io_update_pc[1] & io_update_tagePreds_0 | ~(io_update_pc[1]) & io_update_tagePreds_1;
  wire [5:0]  oldCtr_1 =
    (io_update_pc[1] & _wrbypasses_0_io_hit | ~(io_update_pc[1]) & _wrbypasses_1_io_hit)
    & (ctrPos_1
         ? io_update_pc[1] & _wrbypasses_0_io_hit_data_1_valid | ~(io_update_pc[1])
           & _wrbypasses_1_io_hit_data_1_valid
         : io_update_pc[1] & _wrbypasses_0_io_hit_data_0_valid | ~(io_update_pc[1])
           & _wrbypasses_1_io_hit_data_0_valid)
      ? (ctrPos_1
           ? (io_update_pc[1] ? _wrbypasses_0_io_hit_data_1_bits : 6'h0)
             | (io_update_pc[1] ? 6'h0 : _wrbypasses_1_io_hit_data_1_bits)
           : (io_update_pc[1] ? _wrbypasses_0_io_hit_data_0_bits : 6'h0)
             | (io_update_pc[1] ? 6'h0 : _wrbypasses_1_io_hit_data_0_bits))
      : (io_update_pc[1] ? io_update_oldCtrs_0 : 6'h0)
        | (io_update_pc[1] ? 6'h0 : io_update_oldCtrs_1);
  wire        taken_1 =
    io_update_pc[1] & io_update_takens_0 | ~(io_update_pc[1]) & io_update_takens_1;
  assign update_wdata_1 =
    oldCtr_1 == 6'h1F & taken_1
      ? 6'h1F
      : oldCtr_1 == 6'h20 & ~taken_1
          ? 6'h20
          : taken_1 ? 6'(oldCtr_1 + 6'h1) : 6'(oldCtr_1 - 6'h1);
  wire [5:0]  _GEN = io_update_pc[1] ? 6'h0 : update_wdata_0;
  wire [5:0]  _GEN_0 = io_update_pc[1] ? update_wdata_1 : 6'h0;
  wire [5:0]  _GEN_1 = io_update_pc[1] ? update_wdata_0 : 6'h0;
  wire [5:0]  _GEN_2 = io_update_pc[1] ? 6'h0 : update_wdata_1;
  always @(posedge clock) begin
    if (io_req_valid) begin
      s1_idx <= io_req_bits_pc[8:1];
      s1_pc <= io_req_bits_pc;
    end
  end // always @(posedge)
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      conflict_buffer_valid <= 1'h0;
      conflict_buffer_data_0 <= 6'h0;
      conflict_buffer_data_1 <= 6'h0;
      conflict_buffer_data_2 <= 6'h0;
      conflict_buffer_data_3 <= 6'h0;
      conflict_buffer_idx <= 8'h0;
      conflict_buffer_waymask_0 <= 1'h0;
      conflict_buffer_waymask_1 <= 1'h0;
      conflict_buffer_waymask_2 <= 1'h0;
      conflict_buffer_waymask_3 <= 1'h0;
    end
    else begin
      conflict_buffer_valid <= ~can_write & (write_conflict | conflict_buffer_valid);
      if (write_conflict) begin
        conflict_buffer_data_0 <= update_wdata_0;
        conflict_buffer_data_1 <= update_wdata_0;
        conflict_buffer_data_2 <= update_wdata_1;
        conflict_buffer_data_3 <= update_wdata_1;
        conflict_buffer_idx <= io_update_pc[8:1];
        conflict_buffer_waymask_0 <= updateWayMask_0;
        conflict_buffer_waymask_1 <= updateWayMask_1;
        conflict_buffer_waymask_2 <= updateWayMask_2;
        conflict_buffer_waymask_3 <= updateWayMask_3;
      end
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:2];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [1:0] i = 2'h0; i < 2'h3; i += 2'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        s1_idx = _RANDOM[2'h0][7:0];
        s1_pc = {_RANDOM[2'h0][31:8], _RANDOM[2'h1][25:0]};
        conflict_buffer_valid = _RANDOM[2'h1][26];
        conflict_buffer_data_0 = {_RANDOM[2'h1][31:27], _RANDOM[2'h2][0]};
        conflict_buffer_data_1 = _RANDOM[2'h2][6:1];
        conflict_buffer_data_2 = _RANDOM[2'h2][12:7];
        conflict_buffer_data_3 = _RANDOM[2'h2][18:13];
        conflict_buffer_idx = _RANDOM[2'h2][26:19];
        conflict_buffer_waymask_0 = _RANDOM[2'h2][27];
        conflict_buffer_waymask_1 = _RANDOM[2'h2][28];
        conflict_buffer_waymask_2 = _RANDOM[2'h2][29];
        conflict_buffer_waymask_3 = _RANDOM[2'h2][30];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        conflict_buffer_valid = 1'h0;
        conflict_buffer_data_0 = 6'h0;
        conflict_buffer_data_1 = 6'h0;
        conflict_buffer_data_2 = 6'h0;
        conflict_buffer_data_3 = 6'h0;
        conflict_buffer_idx = 8'h0;
        conflict_buffer_waymask_0 = 1'h0;
        conflict_buffer_waymask_1 = 1'h0;
        conflict_buffer_waymask_2 = 1'h0;
        conflict_buffer_waymask_3 = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  SRAMTemplate_56 table_0 (
    .clock                 (clock),
    .reset                 (reset),
    .io_r_req_valid        (io_req_valid),
    .io_r_req_bits_setIdx  (io_req_bits_pc[8:1]),
    .io_r_resp_data_0      (_table_io_r_resp_data_0),
    .io_r_resp_data_1      (_table_io_r_resp_data_1),
    .io_r_resp_data_2      (_table_io_r_resp_data_2),
    .io_r_resp_data_3      (_table_io_r_resp_data_3),
    .io_w_req_valid        (_write_conflict_T_1 & ~write_conflict | can_write),
    .io_w_req_bits_setIdx  (can_write ? conflict_buffer_idx : io_update_pc[8:1]),
    .io_w_req_bits_data_0  (can_write ? conflict_buffer_data_0 : update_wdata_0),
    .io_w_req_bits_data_1  (can_write ? conflict_buffer_data_1 : update_wdata_0),
    .io_w_req_bits_data_2  (can_write ? conflict_buffer_data_2 : update_wdata_1),
    .io_w_req_bits_data_3  (can_write ? conflict_buffer_data_3 : update_wdata_1),
    .io_w_req_bits_waymask
      (can_write
         ? {conflict_buffer_waymask_3,
            conflict_buffer_waymask_2,
            conflict_buffer_waymask_1,
            conflict_buffer_waymask_0}
         : {updateWayMask_3, updateWayMask_2, updateWayMask_1, updateWayMask_0})
  );
  WrBypass_33 wrbypasses_0 (
    .clock               (clock),
    .reset               (reset),
    .io_wen              (io_update_mask_0),
    .io_write_idx        (io_update_pc[8:1]),
    .io_write_data_0     (_GEN | _GEN_0),
    .io_write_data_1     (_GEN | _GEN_0),
    .io_write_way_mask_0
      (~(io_update_pc[1]) & updateWayMask_0 | io_update_pc[1] & updateWayMask_2),
    .io_write_way_mask_1
      (~(io_update_pc[1]) & updateWayMask_1 | io_update_pc[1] & updateWayMask_3),
    .io_hit              (_wrbypasses_0_io_hit),
    .io_hit_data_0_valid (_wrbypasses_0_io_hit_data_0_valid),
    .io_hit_data_0_bits  (_wrbypasses_0_io_hit_data_0_bits),
    .io_hit_data_1_valid (_wrbypasses_0_io_hit_data_1_valid),
    .io_hit_data_1_bits  (_wrbypasses_0_io_hit_data_1_bits)
  );
  WrBypass_33 wrbypasses_1 (
    .clock               (clock),
    .reset               (reset),
    .io_wen              (io_update_mask_1),
    .io_write_idx        (io_update_pc[8:1]),
    .io_write_data_0     (_GEN_1 | _GEN_2),
    .io_write_data_1     (_GEN_1 | _GEN_2),
    .io_write_way_mask_0
      (io_update_pc[1] & updateWayMask_0 | ~(io_update_pc[1]) & updateWayMask_2),
    .io_write_way_mask_1
      (io_update_pc[1] & updateWayMask_1 | ~(io_update_pc[1]) & updateWayMask_3),
    .io_hit              (_wrbypasses_1_io_hit),
    .io_hit_data_0_valid (_wrbypasses_1_io_hit_data_0_valid),
    .io_hit_data_0_bits  (_wrbypasses_1_io_hit_data_0_bits),
    .io_hit_data_1_valid (_wrbypasses_1_io_hit_data_1_valid),
    .io_hit_data_1_bits  (_wrbypasses_1_io_hit_data_1_bits)
  );
  assign io_resp_ctrs_0_0 =
    use_conflict_data
      ? (s1_pc[1] | ~conflict_buffer_waymask_0 ? 6'h0 : conflict_buffer_data_0)
        | (s1_pc[1] & conflict_buffer_waymask_2 ? conflict_buffer_data_2 : 6'h0)
      : (s1_pc[1] ? 6'h0 : _table_io_r_resp_data_0)
        | (s1_pc[1] ? _table_io_r_resp_data_2 : 6'h0);
  assign io_resp_ctrs_0_1 =
    use_conflict_data
      ? (s1_pc[1] | ~conflict_buffer_waymask_1 ? 6'h0 : conflict_buffer_data_1)
        | (s1_pc[1] & conflict_buffer_waymask_3 ? conflict_buffer_data_3 : 6'h0)
      : (s1_pc[1] ? 6'h0 : _table_io_r_resp_data_1)
        | (s1_pc[1] ? _table_io_r_resp_data_3 : 6'h0);
  assign io_resp_ctrs_1_0 =
    use_conflict_data
      ? (s1_pc[1] & conflict_buffer_waymask_0 ? conflict_buffer_data_0 : 6'h0)
        | (s1_pc[1] | ~conflict_buffer_waymask_2 ? 6'h0 : conflict_buffer_data_2)
      : (s1_pc[1] ? _table_io_r_resp_data_0 : 6'h0)
        | (s1_pc[1] ? 6'h0 : _table_io_r_resp_data_2);
  assign io_resp_ctrs_1_1 =
    use_conflict_data
      ? (s1_pc[1] & conflict_buffer_waymask_1 ? conflict_buffer_data_1 : 6'h0)
        | (s1_pc[1] | ~conflict_buffer_waymask_3 ? 6'h0 : conflict_buffer_data_3)
      : (s1_pc[1] ? _table_io_r_resp_data_1 : 6'h0)
        | (s1_pc[1] ? 6'h0 : _table_io_r_resp_data_3);
endmodule

