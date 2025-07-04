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

module CVT16(
  input         clock,
  input         reset,
  input         io_fire,
  input  [15:0] io_src,
  input  [7:0]  io_opType,
  input  [1:0]  io_sew,
  input  [2:0]  io_rm,
  output [15:0] io_result,
  output [4:0]  io_fflags
);

  wire [6:0]  _vfrec7Table_out;
  wire [6:0]  _vfrsqrt7Table_out;
  wire        _rounder_io_inexact;
  wire        _rounder_io_r_up;
  wire [3:0]  _out_exp_clz_io_out;
  wire [3:0]  _clz_sig_clz_io_out;
  wire [3:0]  _zero_minus_lzc_clz_io_out;
  wire [4:0]  _int2fp_clz_clz_io_out;
  wire [11:0] _shiftRightJam_io_out;
  wire        _shiftRightJam_io_sticky;
  reg         fireReg_last_r;
  wire        is_sew_8 = io_sew == 2'h0;
  wire        is_sew_16 = io_sew == 2'h1;
  wire        is_single = io_opType[4:3] == 2'h0;
  wire        is_widen = io_opType[4:3] == 2'h1;
  wire        is_narrow = io_opType[4:3] == 2'h2;
  reg         is_single_reg0;
  reg         is_widen_reg0;
  reg         is_narrow_reg0;
  wire        is_vfr = io_opType[5] & is_sew_16;
  wire        _is_int2fp_T_3 = is_sew_16 & is_single;
  wire        is_fp2int =
    io_opType[7:6] == 2'h2 & (_is_int2fp_T_3 | is_sew_8 & is_narrow);
  wire        is_int2fp = io_opType[7:6] == 2'h1 & (is_sew_8 & is_widen | _is_int2fp_T_3);
  reg         is_vfr_reg0;
  reg         is_fp2int_reg0;
  reg         is_int2fp_reg0;
  wire        is_vfrsqrt7 = is_vfr & ~(io_opType[0]);
  wire        is_vfrec7 = is_vfr & io_opType[0];
  reg         is_vfrsqrt7_reg0;
  reg         is_vfrec7_reg0;
  reg         is_signed_int_reg0;
  reg  [15:0] result0_reg1;
  reg  [15:0] fflags0_reg1;
  reg  [10:0] round_in_reg0;
  reg         round_roundIn_reg0;
  reg         round_stickyIn_reg0;
  reg         round_signIn_reg0;
  reg  [2:0]  rm_reg0;
  reg         is_normal_reg0;
  reg         is_inf_reg0;
  reg         is_nan_reg0;
  reg         is_neginf_reg0;
  reg         is_neginf_negzero_reg0;
  reg         is_negzero_reg0;
  reg         is_poszero_reg0;
  reg         is_snan_reg0;
  reg         is_neg2_bplus1_b_reg0;
  reg         is_neg2_b_bminus1_reg0;
  reg         is_neg2_negbminus1_negzero_reg0;
  reg         is_pos2_poszero_negbminus1_reg0;
  reg         is_pos2_bminus1_b_reg0;
  reg         is_pos2_b_bplus1_reg0;
  wire        _in_sext_T_8 = is_int2fp & io_opType[0];
  wire [16:0] _in_T = {1'h0, io_src};
  wire [16:0] _in_sext_T_26 =
    (is_int2fp & ~(io_opType[0]) & is_widen ? {9'h0, io_src[7:0]} : 17'h0)
    | (_in_sext_T_8 & is_widen ? {{9{io_src[7]}}, io_src[7:0]} : 17'h0)
    | (is_int2fp & ~(io_opType[0]) & is_single ? _in_T : 17'h0)
    | (_in_sext_T_8 & is_single ? {io_src[15], io_src} : 17'h0);
  reg         in_orR_reg0;
  reg  [16:0] in_reg0;
  wire [16:0] _in_T_5 =
    (is_fp2int
       ? {io_src[15:11], io_src[10] | ~(|(io_src[14:10])), |(io_src[14:10]), io_src[9:0]}
       : 17'h0) | (is_int2fp ? _in_sext_T_26 : 17'h0) | (is_vfr ? _in_T : 17'h0);
  reg         sign_reg0;
  wire        _sign_T_8 = (is_fp2int | is_int2fp) & _in_T_5[16] | is_vfr & _in_T_5[15];
  wire [4:0]  exp =
    (is_fp2int ? _in_T_5[15:11] : 5'h0) | (is_vfr ? _in_T_5[14:10] : 5'h0);
  wire [10:0] _sig_T_2 = is_fp2int ? _in_T_5[10:0] : 11'h0;
  wire [9:0]  _out_exp_T_8 = _sig_T_2[9:0] | (is_vfr ? _in_T_5[9:0] : 10'h0);
  wire        _min_int_T = is_fp2int & is_single;
  wire        _min_int_T_1 = is_fp2int & is_narrow;
  wire [4:0]  max_int_exp = (_min_int_T ? 5'h1E : 5'h0) | (_min_int_T_1 ? 5'h16 : 5'h0);
  reg         exp_of_reg0;
  reg  [15:0] lpath_sig_shifted_reg0;
  reg         lpath_iv_reg0;
  reg         lpath_of_reg0;
  reg  [11:0] rpath_sig_shifted_reg0;
  wire [16:0] in_abs =
    (is_int2fp & _sign_T_8 ? 17'(~_in_T_5 + 17'h1) : 17'h0)
    | (is_int2fp & ~_sign_T_8 ? _in_T_5 : 17'h0);
  reg  [4:0]  exp_raw_reg0;
  reg         sel_lpath_reg0;
  reg  [15:0] max_min_int_reg0;
  wire        is_normal = (|exp) & ~(&exp);
  wire [3:0]  zero_minus_lzc = is_vfr ? 4'(4'h0 - _zero_minus_lzc_clz_io_out) : 4'h0;
  reg  [4:0]  exp_normalized_reg0;
  wire        _out_sign_T =
    is_vfrsqrt7 & ~_sign_T_8 & (is_normal | ~(|exp) & (|_out_exp_T_8));
  wire        _sig_normalized_T_2 = is_vfrec7 & is_normal;
  wire        _sig_normalized_T_6 = is_vfrec7 & ~(|exp);
  wire [4:0]  _exp_normalized_T_12 =
    (_out_sign_T & is_normal | _sig_normalized_T_2 ? exp : 5'h0)
    | (_out_sign_T & ~(|exp) | _sig_normalized_T_6
         ? {zero_minus_lzc[3], zero_minus_lzc}
         : 5'h0);
  reg  [10:0] sig_normalized_reg0;
  wire [10:0] _sig_normalized_T_14 =
    (_out_sign_T & is_normal | _sig_normalized_T_2 ? {1'h0, _out_exp_T_8} : 11'h0)
    | (_out_sign_T & ~(|exp) | _sig_normalized_T_6 ? {_out_exp_T_8, 1'h0} : 11'h0);
  reg  [3:0]  clz_sig_reg0;
  wire [4:0]  _out_exp_normalized_T = 5'(5'h1D - _exp_normalized_T_12);
  wire [4:0]  out_exp_normalized = is_vfrec7 ? _out_exp_normalized_T : 5'h0;
  reg         out_exp_zero_negone_reg0;
  wire        out_exp_zero_negone =
    is_vfrec7 & out_exp_normalized == 5'h0 | (&out_exp_normalized);
  reg  [4:0]  out_exp_reg0;
  reg         out_sign_reg0;
  wire [10:0] out_reg0 = _rounder_io_r_up ? 11'(round_in_reg0 + 11'h1) : round_in_reg0;
  wire        _int_reg0_T = is_fp2int_reg0 & is_narrow_reg0;
  wire        _int_reg0_T_1 = is_fp2int_reg0 & is_single_reg0;
  wire        cout_reg0 =
    _rounder_io_r_up
    & (_int_reg0_T & (&(round_in_reg0[6:0])) | _int_reg0_T_1 & (&round_in_reg0)
       | is_int2fp_reg0 & (&(round_in_reg0[9:0])));
  wire [4:0]  exp_reg0 =
    is_int2fp_reg0 & in_orR_reg0 ? 5'(exp_raw_reg0 + {4'h0, cout_reg0}) : 5'h0;
  wire [15:0] _sig_reg0_T_7 =
    (_int_reg0_T_1 ? {4'h0, cout_reg0, out_reg0} : 16'h0)
    | (_int_reg0_T ? {5'h0, out_reg0} : 16'h0);
  wire [10:0] _GEN = _sig_reg0_T_7[10:0] | (is_int2fp_reg0 ? out_reg0 : 11'h0);
  wire [15:0] sig_reg0 = {_sig_reg0_T_7[15:11], _GEN};
  wire        _sig_out7_reg0_T = is_vfr_reg0 & is_vfrsqrt7_reg0;
  wire        _sig_out7_reg0_T_1 = is_vfr_reg0 & is_vfrec7_reg0;
  wire [25:0] _GEN_0 = {15'h0, sig_normalized_reg0};
  wire [25:0] _GEN_1 = {22'h0, is_normal_reg0 ? 4'h0 : clz_sig_reg0};
  wire [25:0] _sig_in7_T_4 = _GEN_0 << _GEN_1;
  wire [25:0] _sig_in7_T_8 = _GEN_0 << _GEN_1;
  wire [6:0]  sig_in7 =
    (_sig_out7_reg0_T ? {exp_normalized_reg0[0], _sig_in7_T_4[9:4]} : 7'h0)
    | (_sig_out7_reg0_T_1 ? _sig_in7_T_8[9:3] : 7'h0);
  wire        of_reg0 =
    is_fp2int_reg0
    & (exp_of_reg0 | sel_lpath_reg0 & lpath_of_reg0 | ~sel_lpath_reg0
       & (_int_reg0_T
          & (is_fp2int_reg0 & ~(in_reg0[16]) & is_signed_int_reg0
             & (in_reg0[15:11] == 5'h16 | in_reg0[15:11] == 5'h15 & cout_reg0)
             | is_fp2int_reg0 & ~(in_reg0[16]) & ~is_signed_int_reg0
             & in_reg0[15:11] == 5'h16 & cout_reg0 | is_fp2int_reg0 & in_reg0[16]
             & in_reg0[15:11] == 5'h16 & ((|(round_in_reg0[6:0])) | _rounder_io_r_up))
          | _int_reg0_T_1 & cout_reg0)) | is_int2fp_reg0 & (&exp_reg0);
  wire        iv_reg0 =
    is_fp2int_reg0
    & (of_reg0 | sel_lpath_reg0 & lpath_iv_reg0 | ~sel_lpath_reg0 & is_fp2int_reg0
       & ~is_signed_int_reg0 & in_reg0[16] & (|sig_reg0));
  wire        _fflags0_T_9 = is_nan_reg0 | is_neginf_negzero_reg0;
  wire        _fflags0_T_23 = is_vfrec7_reg0 & is_nan_reg0;
  wire        _fflags0_T_6 = is_negzero_reg0 | is_poszero_reg0;
  wire        _GEN_2 = is_vfrsqrt7_reg0 & is_inf_reg0 & is_neginf_reg0;
  wire        _GEN_3 = is_vfrec7_reg0 & is_inf_reg0 & is_neginf_reg0;
  wire [4:0]  int2fp_clz = is_int2fp ? _int2fp_clz_clz_io_out : 5'h0;
  wire [47:0] _in_shift_T = {31'h0, in_abs} << int2fp_clz;
  wire [14:0] in_shift = is_int2fp ? _in_shift_T[14:0] : 15'h0;
  wire        _round_stickyIn_T_2 = is_int2fp & is_widen;
  wire        _round_stickyIn_T_3 = is_int2fp & is_single;
  wire [10:0] _round_in_T_8 = _min_int_T ? _shiftRightJam_io_out[11:1] : 11'h0;
  wire [15:0] _max_int_T_8 = _min_int_T ? {~(io_opType[0]), 15'h7FFF} : 16'h0;
  wire [15:0] _min_int_T_4 = _min_int_T ? {io_opType[0], 15'h0} : 16'h0;
  wire        is_inf = (&exp) & _out_exp_T_8 == 10'h0;
  wire        is_nan = (&exp) & (|_out_exp_T_8);
  wire        _is_pos2_b_bplus1_T_1 = exp == 5'h1E;
  wire        _is_pos2_bminus1_b_T_1 = exp == 5'h1D;
  wire [41:0] _lpath_sig_shifted_T_2 =
    {31'h0, _sig_T_2[10], _out_exp_T_8} << (_min_int_T ? 5'(exp + 5'h7) : 5'h0);
  wire [5:0]  _out_exp_T_9 = 6'({2'h0, _out_exp_clz_io_out} - 6'h14);
  wire [5:0]  _out_exp_T_5 = 6'(6'h2C - {1'h0, exp});
  wire [6:0]  _sig_out7_reg0_T_4 =
    (_sig_out7_reg0_T ? _vfrsqrt7Table_out : 7'h0)
    | (_sig_out7_reg0_T_1 ? _vfrec7Table_out : 7'h0);
  wire        _out_sig_reg0_T_6 = is_vfrec7_reg0 & out_exp_zero_negone_reg0;
  wire        _out_sig_reg0_T_7 = is_neg2_bplus1_b_reg0 | is_pos2_b_bplus1_reg0;
  wire [9:0]  _out_sig_reg0_T_23 =
    (_out_sig_reg0_T_6 & _out_sig_reg0_T_7 ? {2'h1, _sig_out7_reg0_T_4, 1'h0} : 10'h0)
    | (_out_sig_reg0_T_6 & (is_neg2_b_bminus1_reg0 | is_pos2_bminus1_b_reg0)
         ? {1'h1, _sig_out7_reg0_T_4, 2'h0}
         : 10'h0);
  wire [15:0] int_abs_reg0 =
    (is_fp2int_reg0 & sel_lpath_reg0 ? lpath_sig_shifted_reg0 : 16'h0)
    | (is_fp2int_reg0 & ~sel_lpath_reg0 ? sig_reg0 : 16'h0);
  wire        _result0_T_51 = rm_reg0 == 3'h1;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      fireReg_last_r <= 1'h0;
      is_single_reg0 <= 1'h0;
      is_widen_reg0 <= 1'h0;
      is_narrow_reg0 <= 1'h0;
      is_vfr_reg0 <= 1'h0;
      is_fp2int_reg0 <= 1'h0;
      is_int2fp_reg0 <= 1'h0;
      is_vfrsqrt7_reg0 <= 1'h0;
      is_vfrec7_reg0 <= 1'h0;
      is_signed_int_reg0 <= 1'h0;
      result0_reg1 <= 16'h0;
      round_in_reg0 <= 11'h0;
      round_roundIn_reg0 <= 1'h0;
      round_stickyIn_reg0 <= 1'h0;
      round_signIn_reg0 <= 1'h0;
      is_normal_reg0 <= 1'h0;
      is_inf_reg0 <= 1'h0;
      is_nan_reg0 <= 1'h0;
      is_neginf_reg0 <= 1'h0;
      is_neginf_negzero_reg0 <= 1'h0;
      is_negzero_reg0 <= 1'h0;
      is_poszero_reg0 <= 1'h0;
      is_snan_reg0 <= 1'h0;
      is_neg2_bplus1_b_reg0 <= 1'h0;
      is_neg2_b_bminus1_reg0 <= 1'h0;
      is_neg2_negbminus1_negzero_reg0 <= 1'h0;
      is_pos2_poszero_negbminus1_reg0 <= 1'h0;
      is_pos2_bminus1_b_reg0 <= 1'h0;
      is_pos2_b_bplus1_reg0 <= 1'h0;
      in_orR_reg0 <= 1'h0;
      in_reg0 <= 17'h0;
      sign_reg0 <= 1'h0;
      exp_of_reg0 <= 1'h0;
      lpath_sig_shifted_reg0 <= 16'h0;
      lpath_iv_reg0 <= 1'h0;
      rpath_sig_shifted_reg0 <= 12'h0;
      exp_raw_reg0 <= 5'h0;
      max_min_int_reg0 <= 16'h0;
      out_exp_reg0 <= 5'h0;
    end
    else begin
      if (io_fire | fireReg_last_r)
        fireReg_last_r <= io_fire;
      if (io_fire) begin
        is_single_reg0 <= is_single;
        is_widen_reg0 <= is_widen;
        is_narrow_reg0 <= is_narrow;
        is_vfr_reg0 <= is_vfr;
        is_fp2int_reg0 <= is_fp2int;
        is_int2fp_reg0 <= is_int2fp;
        is_vfrsqrt7_reg0 <= is_vfrsqrt7;
        is_vfrec7_reg0 <= is_vfrec7;
        is_signed_int_reg0 <= io_opType[0];
        round_in_reg0 <=
          {_round_in_T_8[10],
           {_round_in_T_8[9:8],
            _round_in_T_8[7:0] | (_min_int_T_1 ? _shiftRightJam_io_out[11:4] : 8'h0)
              | (_round_stickyIn_T_2 ? in_shift[14:7] : 8'h0)}
             | (_round_stickyIn_T_3 ? in_shift[14:5] : 10'h0)};
        round_roundIn_reg0 <=
          _min_int_T & _shiftRightJam_io_out[0] | _min_int_T_1 & _shiftRightJam_io_out[3]
          | _round_stickyIn_T_2 & in_shift[6] | _round_stickyIn_T_3 & in_shift[4];
        round_stickyIn_reg0 <=
          _min_int_T & _shiftRightJam_io_sticky | _min_int_T_1
          & (_shiftRightJam_io_sticky | (|(_shiftRightJam_io_out[2:0])))
          | _round_stickyIn_T_2 & (|(in_shift[5:0])) | _round_stickyIn_T_3
          & (|(in_shift[3:0]));
        round_signIn_reg0 <= _sign_T_8;
        is_normal_reg0 <= is_normal;
        is_inf_reg0 <= is_inf;
        is_nan_reg0 <= is_nan;
        is_neginf_reg0 <= _sign_T_8 & is_inf;
        is_neginf_negzero_reg0 <= _sign_T_8 & (is_normal | ~(|exp) & (|_out_exp_T_8));
        is_negzero_reg0 <= _sign_T_8 & ~(|exp) & _out_exp_T_8 == 10'h0;
        is_poszero_reg0 <= ~_sign_T_8 & ~(|exp) & _out_exp_T_8 == 10'h0;
        is_snan_reg0 <= ~(_out_exp_T_8[9]) & is_nan;
        is_neg2_bplus1_b_reg0 <= _sign_T_8 & _is_pos2_b_bplus1_T_1;
        is_neg2_b_bminus1_reg0 <= _sign_T_8 & _is_pos2_bminus1_b_T_1;
        is_neg2_negbminus1_negzero_reg0 <=
          _sign_T_8 & _out_exp_T_8[9:8] == 2'h0 & ~(|exp) & (|_out_exp_T_8);
        is_pos2_poszero_negbminus1_reg0 <=
          ~_sign_T_8 & _out_exp_T_8[9:8] == 2'h0 & ~(|exp) & (|_out_exp_T_8);
        is_pos2_bminus1_b_reg0 <= ~_sign_T_8 & _is_pos2_bminus1_b_T_1;
        is_pos2_b_bplus1_reg0 <= ~_sign_T_8 & _is_pos2_b_bplus1_T_1;
        in_orR_reg0 <= |_in_sext_T_26;
        in_reg0 <= _in_T_5;
        sign_reg0 <= _sign_T_8;
        exp_of_reg0 <= is_fp2int & exp > max_int_exp;
        lpath_sig_shifted_reg0 <= _min_int_T ? _lpath_sig_shifted_T_2[15:0] : 16'h0;
        lpath_iv_reg0 <= _min_int_T & ~(io_opType[0]) & _sign_T_8;
        rpath_sig_shifted_reg0 <= _shiftRightJam_io_out;
        exp_raw_reg0 <= is_int2fp ? 5'(5'h1E - int2fp_clz) : 5'h0;
        max_min_int_reg0 <=
          (&exp) & (|_out_exp_T_8) | ~_sign_T_8
            ? {_max_int_T_8[15:8],
               _max_int_T_8[7:0] | (_min_int_T_1 ? {~(io_opType[0]), 7'h7F} : 8'h0)}
            : {_min_int_T_4[15:8],
               _min_int_T_4[7:0] | (_min_int_T_1 ? {io_opType[0], 7'h0} : 8'h0)};
        out_exp_reg0 <=
          (is_vfrsqrt7 & is_normal ? _out_exp_T_5[5:1] : 5'h0)
          | (is_vfrsqrt7 & ~(|exp) ? _out_exp_T_9[5:1] : 5'h0)
          | (is_vfrec7 & ~out_exp_zero_negone ? _out_exp_normalized_T : 5'h0);
      end
      if (fireReg_last_r)
        result0_reg1 <=
          (is_fp2int_reg0
             ? (iv_reg0
                  ? max_min_int_reg0
                  : {8'h0,
                     _int_reg0_T
                       ? (in_reg0[16] & is_signed_int_reg0
                            ? 8'(8'h0 - int_abs_reg0[7:0])
                            : int_abs_reg0[7:0])
                       : 8'h0}
                    | (_int_reg0_T_1
                         ? (in_reg0[16] & is_signed_int_reg0
                              ? 16'(16'h0 - int_abs_reg0)
                              : int_abs_reg0)
                         : 16'h0))
             : 16'h0)
          | (is_int2fp_reg0
               ? {is_signed_int_reg0 & sign_reg0,
                  exp_reg0,
                  is_widen_reg0 ? {_GEN[7:0], 2'h0} : _GEN[9:0]}
               : 16'h0)
          | (is_vfrsqrt7_reg0 & _fflags0_T_9 | _fflags0_T_23 ? 16'h7E00 : 16'h0)
          | (_GEN_2 ? 16'h7E00 : 16'h0)
          | (is_vfrsqrt7_reg0 & _fflags0_T_6 ? {is_negzero_reg0, 15'h7C00} : 16'h0)
          | (is_vfrsqrt7_reg0
             & ~(_fflags0_T_9 | is_inf_reg0 | is_negzero_reg0 | is_poszero_reg0)
             | is_vfrec7_reg0
             & ~(is_nan_reg0 | is_inf_reg0 | is_negzero_reg0 | is_poszero_reg0
                 | is_neg2_negbminus1_negzero_reg0 | is_pos2_poszero_negbminus1_reg0)
               ? (is_vfrsqrt7_reg0
                    ? {out_sign_reg0, out_exp_reg0, _sig_out7_reg0_T_4, 3'h0}
                    : 16'h0)
                 | (is_vfrec7_reg0
                      ? {sign_reg0,
                         out_exp_reg0,
                         {_out_sig_reg0_T_23[9],
                          _out_sig_reg0_T_23[8:0]
                            | (_out_sig_reg0_T_6
                               & ~(_out_sig_reg0_T_7 | is_neg2_b_bminus1_reg0
                                   | is_pos2_bminus1_b_reg0)
                                 ? {1'h1, _sig_out7_reg0_T_4, 1'h0}
                                 : 9'h0)}
                           | (is_vfrec7_reg0 & ~out_exp_zero_negone_reg0
                                ? {_sig_out7_reg0_T_4, 3'h0}
                                : 10'h0)}
                      : 16'h0)
               : 16'h0) | {_GEN_3, 15'h0}
          | (is_vfrec7_reg0 & _fflags0_T_6 ? {is_negzero_reg0, 15'h7C00} : 16'h0)
          | (is_vfrec7_reg0 & is_neg2_negbminus1_negzero_reg0
               ? (rm_reg0 == 3'h3 | _result0_T_51 ? 16'hFBFF : 16'hFC00)
               : 16'h0)
          | (is_vfrec7_reg0 & is_pos2_poszero_negbminus1_reg0
               ? (rm_reg0 == 3'h2 | _result0_T_51 ? 16'h7BFF : 16'h7C00)
               : 16'h0);
    end
  end // always @(posedge, posedge)
  wire        ix_reg0 =
    is_fp2int_reg0 & ~iv_reg0 & ~sel_lpath_reg0
    & (_int_reg0_T_1 & _rounder_io_inexact | _int_reg0_T
       & (_rounder_io_inexact | (|(rpath_sig_shifted_reg0[3:0])))) | is_int2fp_reg0
    & _rounder_io_inexact;
  wire [4:0]  _fflags0_T_46 =
    (is_fp2int_reg0 ? {iv_reg0, 3'h0, ix_reg0} : 5'h0)
    | (is_int2fp_reg0 ? {2'h0, of_reg0, 1'h0, ix_reg0} : 5'h0)
    | {is_vfrsqrt7_reg0 & _fflags0_T_9 & (is_snan_reg0 | is_neginf_negzero_reg0) | _GEN_2,
       4'h0};
  wire [3:0]  _GEN_4 =
    _fflags0_T_46[3:0]
    | {is_vfrsqrt7_reg0 & _fflags0_T_6 | is_vfrec7_reg0 & _fflags0_T_6, 3'h0};
  always @(posedge clock) begin
    if (fireReg_last_r)
      fflags0_reg1 <=
        {_GEN_3,
         10'h0,
         _fflags0_T_46[4] | _fflags0_T_23 & is_snan_reg0,
         _GEN_4[3],
         _GEN_4[2:0]
           | (is_vfrec7_reg0
              & (is_neg2_negbminus1_negzero_reg0 | is_pos2_poszero_negbminus1_reg0)
                ? 3'h5
                : 3'h0)};
    if (io_fire) begin
      rm_reg0 <= io_rm;
      lpath_of_reg0 <=
        _min_int_T & io_opType[0] & exp == max_int_exp
        & (~_sign_T_8 | _sign_T_8 & (|(_in_T_5[9:0])));
      sel_lpath_reg0 <= exp > 5'h18;
      exp_normalized_reg0 <= _exp_normalized_T_12;
      sig_normalized_reg0 <= _sig_normalized_T_14;
      clz_sig_reg0 <= _clz_sig_clz_io_out;
      out_exp_zero_negone_reg0 <= out_exp_zero_negone;
      out_sign_reg0 <= _out_sign_T & _sign_T_8;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:5];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [2:0] i = 3'h0; i < 3'h6; i += 3'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        fireReg_last_r = _RANDOM[3'h0][0];
        is_single_reg0 = _RANDOM[3'h0][1];
        is_widen_reg0 = _RANDOM[3'h0][2];
        is_narrow_reg0 = _RANDOM[3'h0][3];
        is_vfr_reg0 = _RANDOM[3'h0][4];
        is_fp2int_reg0 = _RANDOM[3'h0][5];
        is_int2fp_reg0 = _RANDOM[3'h0][6];
        is_vfrsqrt7_reg0 = _RANDOM[3'h0][7];
        is_vfrec7_reg0 = _RANDOM[3'h0][8];
        is_signed_int_reg0 = _RANDOM[3'h0][9];
        result0_reg1 = _RANDOM[3'h0][25:10];
        fflags0_reg1 = {_RANDOM[3'h0][31:26], _RANDOM[3'h1][9:0]};
        round_in_reg0 = _RANDOM[3'h1][20:10];
        round_roundIn_reg0 = _RANDOM[3'h1][21];
        round_stickyIn_reg0 = _RANDOM[3'h1][22];
        round_signIn_reg0 = _RANDOM[3'h1][23];
        rm_reg0 = _RANDOM[3'h1][26:24];
        is_normal_reg0 = _RANDOM[3'h1][27];
        is_inf_reg0 = _RANDOM[3'h1][28];
        is_nan_reg0 = _RANDOM[3'h1][29];
        is_neginf_reg0 = _RANDOM[3'h1][30];
        is_neginf_negzero_reg0 = _RANDOM[3'h1][31];
        is_negzero_reg0 = _RANDOM[3'h2][0];
        is_poszero_reg0 = _RANDOM[3'h2][1];
        is_snan_reg0 = _RANDOM[3'h2][2];
        is_neg2_bplus1_b_reg0 = _RANDOM[3'h2][3];
        is_neg2_b_bminus1_reg0 = _RANDOM[3'h2][4];
        is_neg2_negbminus1_negzero_reg0 = _RANDOM[3'h2][5];
        is_pos2_poszero_negbminus1_reg0 = _RANDOM[3'h2][6];
        is_pos2_bminus1_b_reg0 = _RANDOM[3'h2][7];
        is_pos2_b_bplus1_reg0 = _RANDOM[3'h2][8];
        in_orR_reg0 = _RANDOM[3'h2][9];
        in_reg0 = _RANDOM[3'h2][26:10];
        sign_reg0 = _RANDOM[3'h2][27];
        exp_of_reg0 = _RANDOM[3'h2][28];
        lpath_sig_shifted_reg0 = {_RANDOM[3'h2][31:29], _RANDOM[3'h3][12:0]};
        lpath_iv_reg0 = _RANDOM[3'h3][13];
        lpath_of_reg0 = _RANDOM[3'h3][14];
        rpath_sig_shifted_reg0 = _RANDOM[3'h3][26:15];
        exp_raw_reg0 = _RANDOM[3'h3][31:27];
        sel_lpath_reg0 = _RANDOM[3'h4][0];
        max_min_int_reg0 = _RANDOM[3'h4][16:1];
        exp_normalized_reg0 = _RANDOM[3'h4][21:17];
        sig_normalized_reg0 = {_RANDOM[3'h4][31:22], _RANDOM[3'h5][0]};
        clz_sig_reg0 = _RANDOM[3'h5][4:1];
        out_exp_zero_negone_reg0 = _RANDOM[3'h5][5];
        out_exp_reg0 = _RANDOM[3'h5][10:6];
        out_sign_reg0 = _RANDOM[3'h5][11];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        fireReg_last_r = 1'h0;
        is_single_reg0 = 1'h0;
        is_widen_reg0 = 1'h0;
        is_narrow_reg0 = 1'h0;
        is_vfr_reg0 = 1'h0;
        is_fp2int_reg0 = 1'h0;
        is_int2fp_reg0 = 1'h0;
        is_vfrsqrt7_reg0 = 1'h0;
        is_vfrec7_reg0 = 1'h0;
        is_signed_int_reg0 = 1'h0;
        result0_reg1 = 16'h0;
        round_in_reg0 = 11'h0;
        round_roundIn_reg0 = 1'h0;
        round_stickyIn_reg0 = 1'h0;
        round_signIn_reg0 = 1'h0;
        is_normal_reg0 = 1'h0;
        is_inf_reg0 = 1'h0;
        is_nan_reg0 = 1'h0;
        is_neginf_reg0 = 1'h0;
        is_neginf_negzero_reg0 = 1'h0;
        is_negzero_reg0 = 1'h0;
        is_poszero_reg0 = 1'h0;
        is_snan_reg0 = 1'h0;
        is_neg2_bplus1_b_reg0 = 1'h0;
        is_neg2_b_bminus1_reg0 = 1'h0;
        is_neg2_negbminus1_negzero_reg0 = 1'h0;
        is_pos2_poszero_negbminus1_reg0 = 1'h0;
        is_pos2_bminus1_b_reg0 = 1'h0;
        is_pos2_b_bplus1_reg0 = 1'h0;
        in_orR_reg0 = 1'h0;
        in_reg0 = 17'h0;
        sign_reg0 = 1'h0;
        exp_of_reg0 = 1'h0;
        lpath_sig_shifted_reg0 = 16'h0;
        lpath_iv_reg0 = 1'h0;
        rpath_sig_shifted_reg0 = 12'h0;
        exp_raw_reg0 = 5'h0;
        max_min_int_reg0 = 16'h0;
        out_exp_reg0 = 5'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  ShiftRightJam_4 shiftRightJam (
    .io_in     ({_sig_T_2[10], _out_exp_T_8, 1'h0}),
    .io_shamt
      ((_min_int_T ? 5'(5'h19 - exp) : 5'h0) | (_min_int_T_1 ? 5'(5'h16 - exp) : 5'h0)),
    .io_out    (_shiftRightJam_io_out),
    .io_sticky (_shiftRightJam_io_sticky)
  );
  CLZ_7 int2fp_clz_clz (
    .io_in  (in_abs[15:0]),
    .io_out (_int2fp_clz_clz_io_out)
  );
  CLZ_28 zero_minus_lzc_clz (
    .io_in  (_out_exp_T_8),
    .io_out (_zero_minus_lzc_clz_io_out)
  );
  CLZ_30 clz_sig_clz (
    .io_in  (_sig_normalized_T_14),
    .io_out (_clz_sig_clz_io_out)
  );
  CLZ_28 out_exp_clz (
    .io_in  (_out_exp_T_8),
    .io_out (_out_exp_clz_io_out)
  );
  RoundingUnit_11 rounder (
    .io_in       (round_in_reg0),
    .io_roundIn  (round_roundIn_reg0),
    .io_stickyIn (round_stickyIn_reg0),
    .io_signIn   (round_signIn_reg0),
    .io_rm       (rm_reg0),
    .io_inexact  (_rounder_io_inexact),
    .io_r_up     (_rounder_io_r_up)
  );
  Rsqrt7Table vfrsqrt7Table (
    .src (sig_in7),
    .out (_vfrsqrt7Table_out)
  );
  Rec7Table vfrec7Table (
    .src (sig_in7),
    .out (_vfrec7Table_out)
  );
  assign io_result = result0_reg1;
  assign io_fflags = fflags0_reg1[4:0];
endmodule

