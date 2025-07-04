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

module FTBEntryGen(
  input  [49:0] io_start_addr,
  input         io_old_entry_isCall,
  input         io_old_entry_isRet,
  input         io_old_entry_isJalr,
  input         io_old_entry_valid,
  input  [3:0]  io_old_entry_brSlots_0_offset,
  input         io_old_entry_brSlots_0_sharing,
  input         io_old_entry_brSlots_0_valid,
  input  [11:0] io_old_entry_brSlots_0_lower,
  input  [1:0]  io_old_entry_brSlots_0_tarStat,
  input  [3:0]  io_old_entry_tailSlot_offset,
  input         io_old_entry_tailSlot_sharing,
  input         io_old_entry_tailSlot_valid,
  input  [19:0] io_old_entry_tailSlot_lower,
  input  [1:0]  io_old_entry_tailSlot_tarStat,
  input  [3:0]  io_old_entry_pftAddr,
  input         io_old_entry_carry,
  input         io_old_entry_last_may_be_rvi_call,
  input         io_old_entry_strong_bias_0,
  input         io_old_entry_strong_bias_1,
  input         io_pd_brMask_0,
  input         io_pd_brMask_1,
  input         io_pd_brMask_2,
  input         io_pd_brMask_3,
  input         io_pd_brMask_4,
  input         io_pd_brMask_5,
  input         io_pd_brMask_6,
  input         io_pd_brMask_7,
  input         io_pd_brMask_8,
  input         io_pd_brMask_9,
  input         io_pd_brMask_10,
  input         io_pd_brMask_11,
  input         io_pd_brMask_12,
  input         io_pd_brMask_13,
  input         io_pd_brMask_14,
  input         io_pd_brMask_15,
  input         io_pd_jmpInfo_valid,
  input         io_pd_jmpInfo_bits_0,
  input         io_pd_jmpInfo_bits_1,
  input         io_pd_jmpInfo_bits_2,
  input  [3:0]  io_pd_jmpOffset,
  input  [49:0] io_pd_jalTarget,
  input         io_pd_rvcMask_0,
  input         io_pd_rvcMask_1,
  input         io_pd_rvcMask_2,
  input         io_pd_rvcMask_3,
  input         io_pd_rvcMask_4,
  input         io_pd_rvcMask_5,
  input         io_pd_rvcMask_6,
  input         io_pd_rvcMask_7,
  input         io_pd_rvcMask_8,
  input         io_pd_rvcMask_9,
  input         io_pd_rvcMask_10,
  input         io_pd_rvcMask_11,
  input         io_pd_rvcMask_12,
  input         io_pd_rvcMask_13,
  input         io_pd_rvcMask_14,
  input         io_pd_rvcMask_15,
  input         io_cfiIndex_valid,
  input  [3:0]  io_cfiIndex_bits,
  input  [49:0] io_target,
  input         io_hit,
  input         io_mispredict_vec_0,
  input         io_mispredict_vec_1,
  input         io_mispredict_vec_2,
  input         io_mispredict_vec_3,
  input         io_mispredict_vec_4,
  input         io_mispredict_vec_5,
  input         io_mispredict_vec_6,
  input         io_mispredict_vec_7,
  input         io_mispredict_vec_8,
  input         io_mispredict_vec_9,
  input         io_mispredict_vec_10,
  input         io_mispredict_vec_11,
  input         io_mispredict_vec_12,
  input         io_mispredict_vec_13,
  input         io_mispredict_vec_14,
  input         io_mispredict_vec_15,
  output        io_new_entry_isCall,
  output        io_new_entry_isRet,
  output        io_new_entry_isJalr,
  output        io_new_entry_valid,
  output [3:0]  io_new_entry_brSlots_0_offset,
  output        io_new_entry_brSlots_0_sharing,
  output        io_new_entry_brSlots_0_valid,
  output [11:0] io_new_entry_brSlots_0_lower,
  output [1:0]  io_new_entry_brSlots_0_tarStat,
  output [3:0]  io_new_entry_tailSlot_offset,
  output        io_new_entry_tailSlot_sharing,
  output        io_new_entry_tailSlot_valid,
  output [19:0] io_new_entry_tailSlot_lower,
  output [1:0]  io_new_entry_tailSlot_tarStat,
  output [3:0]  io_new_entry_pftAddr,
  output        io_new_entry_carry,
  output        io_new_entry_last_may_be_rvi_call,
  output        io_new_entry_strong_bias_0,
  output        io_new_entry_strong_bias_1,
  output        io_taken_mask_0,
  output        io_taken_mask_1,
  output        io_jmp_taken,
  output        io_mispred_mask_0,
  output        io_mispred_mask_1,
  output        io_mispred_mask_2,
  output        io_is_old_entry
);

  wire        old_entry_strong_bias_strong_bias_0;
  wire [15:0] _GEN =
    {{io_pd_brMask_15},
     {io_pd_brMask_14},
     {io_pd_brMask_13},
     {io_pd_brMask_12},
     {io_pd_brMask_11},
     {io_pd_brMask_10},
     {io_pd_brMask_9},
     {io_pd_brMask_8},
     {io_pd_brMask_7},
     {io_pd_brMask_6},
     {io_pd_brMask_5},
     {io_pd_brMask_4},
     {io_pd_brMask_3},
     {io_pd_brMask_2},
     {io_pd_brMask_1},
     {io_pd_brMask_0}};
  wire        cfi_is_br = _GEN[io_cfiIndex_bits] & io_cfiIndex_valid;
  wire        init_entry_isJalr =
    io_pd_jmpInfo_valid & io_pd_jmpInfo_bits_0 & io_cfiIndex_valid;
  wire        last_jmp_rvi = io_pd_jmpInfo_valid & (&io_pd_jmpOffset) & ~io_pd_rvcMask_15;
  wire        cfi_is_jalr = io_cfiIndex_bits == io_pd_jmpOffset & init_entry_isJalr;
  wire [48:0] _GEN_0 = cfi_is_jalr ? io_target[49:1] : io_pd_jalTarget[49:1];
  wire [4:0]  _GEN_1 = {1'h0, io_start_addr[4:1]};
  wire [15:0] _GEN_2 =
    {{io_pd_rvcMask_15},
     {io_pd_rvcMask_14},
     {io_pd_rvcMask_13},
     {io_pd_rvcMask_12},
     {io_pd_rvcMask_11},
     {io_pd_rvcMask_10},
     {io_pd_rvcMask_9},
     {io_pd_rvcMask_8},
     {io_pd_rvcMask_7},
     {io_pd_rvcMask_6},
     {io_pd_rvcMask_5},
     {io_pd_rvcMask_4},
     {io_pd_rvcMask_3},
     {io_pd_rvcMask_2},
     {io_pd_rvcMask_1},
     {io_pd_rvcMask_0}};
  wire [4:0]  jmpPft =
    5'(_GEN_1
       + 5'({1'h0, io_pd_jmpOffset} + {3'h0, _GEN_2[io_pd_jmpOffset] ? 2'h1 : 2'h2}));
  wire        br_recorded_vec_0 =
    io_old_entry_brSlots_0_valid & io_old_entry_brSlots_0_offset == io_cfiIndex_bits;
  wire        br_recorded_vec_1 =
    io_old_entry_tailSlot_valid & io_old_entry_tailSlot_offset == io_cfiIndex_bits
    & io_old_entry_tailSlot_sharing;
  wire        is_new_br = cfi_is_br & {br_recorded_vec_1, br_recorded_vec_0} == 2'h0;
  wire        new_br_insert_onehot_0 =
    ~io_old_entry_brSlots_0_valid | io_cfiIndex_bits < io_old_entry_brSlots_0_offset;
  wire        _new_br_insert_onehot_T_3 =
    io_cfiIndex_bits > io_old_entry_brSlots_0_offset;
  wire        new_br_insert_onehot_1 =
    io_old_entry_brSlots_0_valid & _new_br_insert_onehot_T_3
    & (~io_old_entry_tailSlot_valid | io_cfiIndex_bits < io_old_entry_tailSlot_offset);
  wire        _GEN_3 = io_cfiIndex_bits > io_old_entry_tailSlot_offset;
  wire        _GEN_4 = _GEN_3 | ~io_old_entry_brSlots_0_valid;
  wire        pft_need_to_change =
    is_new_br & io_old_entry_brSlots_0_valid & io_old_entry_tailSlot_valid;
  wire [3:0]  new_pft_offset =
    {new_br_insert_onehot_1, new_br_insert_onehot_0} == 2'h0
      ? io_cfiIndex_bits
      : io_old_entry_tailSlot_offset;
  wire [4:0]  _old_entry_modified_carry_T_1 = 5'(_GEN_1 + {1'h0, new_pft_offset});
  wire        _old_target_target_T_9 = io_old_entry_tailSlot_tarStat == 2'h1;
  wire        _old_target_target_T_10 = io_old_entry_tailSlot_tarStat == 2'h2;
  wire        _old_target_target_T_11 = io_old_entry_tailSlot_tarStat == 2'h0;
  wire        jalr_target_modified =
    cfi_is_jalr
    & {io_old_entry_tailSlot_sharing
         ? {(_old_target_target_T_9 ? 37'(io_start_addr[49:13] + 37'h1) : 37'h0)
              | (_old_target_target_T_10 ? 37'(io_start_addr[49:13] - 37'h1) : 37'h0)
              | (_old_target_target_T_11 ? io_start_addr[49:13] : 37'h0),
            io_old_entry_tailSlot_lower[11:0]}
         : {(_old_target_target_T_9 ? 29'(io_start_addr[49:21] + 29'h1) : 29'h0)
              | (_old_target_target_T_10 ? 29'(io_start_addr[49:21] - 29'h1) : 29'h0)
              | (_old_target_target_T_11 ? io_start_addr[49:21] : 29'h0),
            io_old_entry_tailSlot_lower},
       1'h0} != io_target & ~io_old_entry_tailSlot_sharing;
  wire        _strong_bias_modified_vec_1_T =
    io_old_entry_tailSlot_valid & io_old_entry_tailSlot_sharing;
  assign old_entry_strong_bias_strong_bias_0 =
    br_recorded_vec_0
      ? io_old_entry_strong_bias_0 & io_cfiIndex_valid & io_old_entry_brSlots_0_valid
        & io_cfiIndex_bits == io_old_entry_brSlots_0_offset
      : ~br_recorded_vec_1 & io_old_entry_strong_bias_0;
  wire        old_entry_strong_bias_strong_bias_1 =
    (br_recorded_vec_0 | ~br_recorded_vec_1 | io_cfiIndex_valid
     & _strong_bias_modified_vec_1_T & io_cfiIndex_bits == io_old_entry_tailSlot_offset)
    & io_old_entry_strong_bias_1;
  wire        _GEN_5 = ~is_new_br | ~pft_need_to_change;
  wire        _GEN_6 = is_new_br & new_br_insert_onehot_0;
  wire        _GEN_7 = is_new_br & pft_need_to_change;
  wire [3:0]  io_new_entry_brSlots_0_offset_0 =
    io_hit
      ? (_GEN_6 ? io_cfiIndex_bits : io_old_entry_brSlots_0_offset)
      : cfi_is_br ? io_cfiIndex_bits : 4'h0;
  wire        io_new_entry_brSlots_0_valid_0 =
    io_hit ? _GEN_6 | io_old_entry_brSlots_0_valid : cfi_is_br;
  wire [3:0]  io_new_entry_tailSlot_offset_0 =
    io_hit
      ? (is_new_br
           ? (new_br_insert_onehot_1
                ? io_cfiIndex_bits
                : _GEN_4 ? io_old_entry_tailSlot_offset : io_old_entry_brSlots_0_offset)
           : io_old_entry_tailSlot_offset)
      : io_pd_jmpInfo_valid ? io_pd_jmpOffset : 4'h0;
  wire        io_new_entry_tailSlot_sharing_0 =
    io_hit
    & (is_new_br
         ? new_br_insert_onehot_1 | ~_GEN_3 & io_old_entry_brSlots_0_valid
           | io_old_entry_tailSlot_sharing
         : ~jalr_target_modified & io_old_entry_tailSlot_sharing);
  wire        io_new_entry_tailSlot_valid_0 =
    io_hit
      ? (is_new_br
           ? new_br_insert_onehot_1
             | (_GEN_4 ? io_old_entry_tailSlot_valid : io_old_entry_brSlots_0_valid)
           : io_old_entry_tailSlot_valid)
      : io_pd_jmpInfo_valid
        & (io_pd_jmpInfo_valid & ~io_pd_jmpInfo_bits_0 & io_cfiIndex_valid
           | init_entry_isJalr);
  wire        _io_mispred_mask_1_T =
    io_new_entry_tailSlot_valid_0 & io_new_entry_tailSlot_sharing_0;
  wire [15:0] _GEN_8 =
    {{io_mispredict_vec_15},
     {io_mispredict_vec_14},
     {io_mispredict_vec_13},
     {io_mispredict_vec_12},
     {io_mispredict_vec_11},
     {io_mispredict_vec_10},
     {io_mispredict_vec_9},
     {io_mispredict_vec_8},
     {io_mispredict_vec_7},
     {io_mispredict_vec_6},
     {io_mispredict_vec_5},
     {io_mispredict_vec_4},
     {io_mispredict_vec_3},
     {io_mispredict_vec_2},
     {io_mispredict_vec_1},
     {io_mispredict_vec_0}};
  assign io_new_entry_isCall =
    io_hit
      ? _GEN_5 & io_old_entry_isCall
      : io_pd_jmpInfo_valid & io_pd_jmpInfo_bits_1 & io_cfiIndex_valid;
  assign io_new_entry_isRet =
    io_hit
      ? _GEN_5 & io_old_entry_isRet
      : io_pd_jmpInfo_valid & io_pd_jmpInfo_bits_2 & io_cfiIndex_valid;
  assign io_new_entry_isJalr = io_hit ? _GEN_5 & io_old_entry_isJalr : init_entry_isJalr;
  assign io_new_entry_valid = ~io_hit | io_old_entry_valid;
  assign io_new_entry_brSlots_0_offset = io_new_entry_brSlots_0_offset_0;
  assign io_new_entry_brSlots_0_sharing =
    io_hit & (~is_new_br | ~new_br_insert_onehot_0) & io_old_entry_brSlots_0_sharing;
  assign io_new_entry_brSlots_0_valid = io_new_entry_brSlots_0_valid_0;
  assign io_new_entry_brSlots_0_lower =
    io_hit
      ? (_GEN_6 ? io_target[12:1] : io_old_entry_brSlots_0_lower)
      : cfi_is_br ? io_target[12:1] : 12'h0;
  assign io_new_entry_brSlots_0_tarStat =
    io_hit
      ? (_GEN_6
           ? (io_target[49:13] > io_start_addr[49:13]
                ? 2'h1
                : {io_target[49:13] < io_start_addr[49:13], 1'h0})
           : io_old_entry_brSlots_0_tarStat)
      : cfi_is_br
          ? (io_target[49:13] > io_start_addr[49:13]
               ? 2'h1
               : {io_target[49:13] < io_start_addr[49:13], 1'h0})
          : 2'h0;
  assign io_new_entry_tailSlot_offset = io_new_entry_tailSlot_offset_0;
  assign io_new_entry_tailSlot_sharing = io_new_entry_tailSlot_sharing_0;
  assign io_new_entry_tailSlot_valid = io_new_entry_tailSlot_valid_0;
  assign io_new_entry_tailSlot_lower =
    io_hit
      ? (is_new_br
           ? (new_br_insert_onehot_1
                ? {8'h0, io_target[12:1]}
                : _GEN_4
                    ? io_old_entry_tailSlot_lower
                    : {8'h0, io_old_entry_brSlots_0_lower})
           : jalr_target_modified ? io_target[20:1] : io_old_entry_tailSlot_lower)
      : io_pd_jmpInfo_valid ? _GEN_0[19:0] : 20'h0;
  assign io_new_entry_tailSlot_tarStat =
    io_hit
      ? (is_new_br
           ? (new_br_insert_onehot_1
                ? (io_target[49:13] > io_start_addr[49:13]
                     ? 2'h1
                     : {io_target[49:13] < io_start_addr[49:13], 1'h0})
                : _GEN_4 ? io_old_entry_tailSlot_tarStat : io_old_entry_brSlots_0_tarStat)
           : jalr_target_modified
               ? (io_target[49:21] > io_start_addr[49:21]
                    ? 2'h1
                    : {io_target[49:21] < io_start_addr[49:21], 1'h0})
               : io_old_entry_tailSlot_tarStat)
      : io_pd_jmpInfo_valid
          ? (_GEN_0[48:20] > io_start_addr[49:21]
               ? 2'h1
               : {_GEN_0[48:20] < io_start_addr[49:21], 1'h0})
          : 2'h0;
  assign io_new_entry_pftAddr =
    io_hit
      ? (_GEN_7 ? 4'(io_start_addr[4:1] + new_pft_offset) : io_old_entry_pftAddr)
      : io_pd_jmpInfo_valid & ~last_jmp_rvi ? jmpPft[3:0] : io_start_addr[4:1];
  assign io_new_entry_carry =
    io_hit
      ? (_GEN_7 ? _old_entry_modified_carry_T_1[4] : io_old_entry_carry)
      : ~(io_pd_jmpInfo_valid & ~last_jmp_rvi) | jmpPft[4];
  assign io_new_entry_last_may_be_rvi_call =
    io_hit
      ? _GEN_5 & io_old_entry_last_may_be_rvi_call
      : (&io_pd_jmpOffset) & ~_GEN_2[io_pd_jmpOffset];
  assign io_new_entry_strong_bias_0 =
    io_hit
      ? (is_new_br
           ? new_br_insert_onehot_0 | ~_new_br_insert_onehot_T_3
             & io_old_entry_strong_bias_0
           : jalr_target_modified
               ? ~jalr_target_modified & io_old_entry_strong_bias_0
               : old_entry_strong_bias_strong_bias_0)
      : cfi_is_br;
  assign io_new_entry_strong_bias_1 =
    io_hit
      ? (is_new_br
           ? new_br_insert_onehot_1 | ~_GEN_3 & io_old_entry_strong_bias_1
           : jalr_target_modified
               ? ~jalr_target_modified & io_old_entry_strong_bias_1
               : old_entry_strong_bias_strong_bias_1)
      : io_pd_jmpInfo_valid & init_entry_isJalr;
  assign io_taken_mask_0 =
    io_cfiIndex_bits == io_new_entry_brSlots_0_offset_0 & io_cfiIndex_valid
    & io_new_entry_brSlots_0_valid_0;
  assign io_taken_mask_1 =
    io_cfiIndex_bits == io_new_entry_tailSlot_offset_0 & io_cfiIndex_valid
    & _io_mispred_mask_1_T;
  assign io_jmp_taken =
    io_new_entry_tailSlot_valid_0 & ~io_new_entry_tailSlot_sharing_0
    & io_new_entry_tailSlot_offset_0 == io_cfiIndex_bits;
  assign io_mispred_mask_0 =
    io_new_entry_brSlots_0_valid_0 & _GEN_8[io_new_entry_brSlots_0_offset_0];
  assign io_mispred_mask_1 =
    _io_mispred_mask_1_T & _GEN_8[io_new_entry_tailSlot_offset_0];
  assign io_mispred_mask_2 =
    io_new_entry_tailSlot_valid_0 & ~io_new_entry_tailSlot_sharing_0
    & _GEN_8[io_pd_jmpOffset];
  assign io_is_old_entry =
    io_hit & ~is_new_br & ~jalr_target_modified
    & ~(io_old_entry_strong_bias_0 & io_old_entry_brSlots_0_valid
        & ~old_entry_strong_bias_strong_bias_0 | io_old_entry_strong_bias_1
        & _strong_bias_modified_vec_1_T & ~old_entry_strong_bias_strong_bias_1);
endmodule

