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

module ClosePathF32WidenF16MixedPipeline(
  input         clock,
  input         io_fire,
  input  [31:0] io_fp_a,
  input  [31:0] io_fp_b,
  output [31:0] io_fp_c,
  input  [2:0]  io_round_mode,
  output [4:0]  io_fflags,
  input         io_res_is_f32,
  output [24:0] io_CS1
);

  reg         NX_reg_r;
  wire [24:0] _U_Lshift_io_result;
  wire [24:0] _U_CS4_io_result;
  wire [24:0] _U_CS3_io_result;
  wire [24:0] _U_CS2_io_result;
  wire [24:0] _U_CS1_io_result;
  wire [24:0] _U_CS0_io_result;
  wire [23:0] significand_fp_a = {|(io_fp_a[30:23]), io_fp_a[22:0]};
  wire [23:0] significand_fp_b = {|(io_fp_b[30:23]), io_fp_b[22:0]};
  reg  [7:0]  EA_reg;
  wire [23:0] _U_CS3_io_adder_op1_T = {1'h1, io_fp_a[22:0]};
  wire [23:0] _U_CS3_io_adder_op0_T = {1'h1, io_fp_b[22:0]};
  reg  [23:0] U_CS4_io_adder_op0_r;
  reg  [23:0] U_CS4_io_adder_op1_r;
  reg  [4:0]  lzd_0123_reg;
  reg  [24:0] U_Lshift_io_src_r;
  reg         close_fraction_result_reg_r;
  reg         lshift_result_head_is_one_reg_r;
  reg         lshift_result_head_is_one_reg_r_1;
  reg         EA_sub_value_reg_r;
  reg  [7:0]  EA_sub_value_reg_r_1;
  reg         close_sign_result_reg_r;
  wire        RNE = io_round_mode == 3'h0;
  wire        RDN = io_round_mode == 3'h2;
  wire        RUP = io_round_mode == 3'h3;
  wire        RMM = io_round_mode == 3'h4;
  wire        Efp_b_is_greater =
    (io_fp_b[23] ^ io_fp_a[23]) & (io_fp_a[24] ^ io_fp_b[24] ^ ~(io_fp_a[23]));
  wire        exp_is_equal =
    io_fp_a[23] ^ ~(io_fp_b[23]) | (|(io_fp_a[30:23])) ^ (|(io_fp_b[30:23]));
  wire        _mask_Efp_a_onehot_T_2 = io_fp_a[30:23] == 8'h0 | io_fp_a[30:23] == 8'h1;
  wire        _mask_Efp_a_onehot_T_3 = io_fp_a[30:23] == 8'h2;
  wire        _mask_Efp_a_onehot_T_4 = io_fp_a[30:23] == 8'h3;
  wire        _mask_Efp_a_onehot_T_5 = io_fp_a[30:23] == 8'h4;
  wire        _mask_Efp_a_onehot_T_6 = io_fp_a[30:23] == 8'h5;
  wire        _mask_Efp_a_onehot_T_7 = io_fp_a[30:23] == 8'h6;
  wire        _mask_Efp_a_onehot_T_8 = io_fp_a[30:23] == 8'h7;
  wire        _mask_Efp_a_onehot_T_9 = io_fp_a[30:23] == 8'h8;
  wire        _mask_Efp_a_onehot_T_10 = io_fp_a[30:23] == 8'h9;
  wire        _mask_Efp_a_onehot_T_11 = io_fp_a[30:23] == 8'hA;
  wire        _mask_Efp_a_onehot_T_12 = io_fp_a[30:23] == 8'hB;
  wire        _mask_Efp_a_onehot_T_13 = io_fp_a[30:23] == 8'hC;
  wire        _mask_Efp_a_onehot_T_14 = io_fp_a[30:23] == 8'hD;
  wire        _mask_Efp_a_onehot_T_15 = io_fp_a[30:23] == 8'hE;
  wire        _mask_Efp_a_onehot_T_16 = io_fp_a[30:23] == 8'hF;
  wire        _mask_Efp_a_onehot_T_17 = io_fp_a[30:23] == 8'h10;
  wire        _mask_Efp_a_onehot_T_18 = io_fp_a[30:23] == 8'h11;
  wire        _mask_Efp_a_onehot_T_19 = io_fp_a[30:23] == 8'h12;
  wire        _mask_Efp_a_onehot_T_20 = io_fp_a[30:23] == 8'h13;
  wire        _mask_Efp_a_onehot_T_21 = io_fp_a[30:23] == 8'h14;
  wire        _mask_Efp_a_onehot_T_22 = io_fp_a[30:23] == 8'h15;
  wire        _mask_Efp_a_onehot_T_23 = io_fp_a[30:23] == 8'h16;
  wire        _mask_Efp_a_onehot_T_24 = io_fp_a[30:23] == 8'h17;
  wire        _mask_Efp_a_onehot_T_25 = io_fp_a[30:23] == 8'h18;
  wire        _mask_Efp_b_onehot_T_2 = io_fp_b[30:23] == 8'h0 | io_fp_b[30:23] == 8'h1;
  wire        _mask_Efp_b_onehot_T_3 = io_fp_b[30:23] == 8'h2;
  wire        _mask_Efp_b_onehot_T_4 = io_fp_b[30:23] == 8'h3;
  wire        _mask_Efp_b_onehot_T_5 = io_fp_b[30:23] == 8'h4;
  wire        _mask_Efp_b_onehot_T_6 = io_fp_b[30:23] == 8'h5;
  wire        _mask_Efp_b_onehot_T_7 = io_fp_b[30:23] == 8'h6;
  wire        _mask_Efp_b_onehot_T_8 = io_fp_b[30:23] == 8'h7;
  wire        _mask_Efp_b_onehot_T_9 = io_fp_b[30:23] == 8'h8;
  wire        _mask_Efp_b_onehot_T_10 = io_fp_b[30:23] == 8'h9;
  wire        _mask_Efp_b_onehot_T_11 = io_fp_b[30:23] == 8'hA;
  wire        _mask_Efp_b_onehot_T_12 = io_fp_b[30:23] == 8'hB;
  wire        _mask_Efp_b_onehot_T_13 = io_fp_b[30:23] == 8'hC;
  wire        _mask_Efp_b_onehot_T_14 = io_fp_b[30:23] == 8'hD;
  wire        _mask_Efp_b_onehot_T_15 = io_fp_b[30:23] == 8'hE;
  wire        _mask_Efp_b_onehot_T_16 = io_fp_b[30:23] == 8'hF;
  wire        _mask_Efp_b_onehot_T_17 = io_fp_b[30:23] == 8'h10;
  wire        _mask_Efp_b_onehot_T_18 = io_fp_b[30:23] == 8'h11;
  wire        _mask_Efp_b_onehot_T_19 = io_fp_b[30:23] == 8'h12;
  wire        _mask_Efp_b_onehot_T_20 = io_fp_b[30:23] == 8'h13;
  wire        _mask_Efp_b_onehot_T_21 = io_fp_b[30:23] == 8'h14;
  wire        _mask_Efp_b_onehot_T_22 = io_fp_b[30:23] == 8'h15;
  wire        _mask_Efp_b_onehot_T_23 = io_fp_b[30:23] == 8'h16;
  wire        _mask_Efp_b_onehot_T_24 = io_fp_b[30:23] == 8'h17;
  wire        _mask_Efp_b_onehot_T_25 = io_fp_b[30:23] == 8'h18;
  wire        CS2_round_up =
    (io_res_is_f32 ? io_fp_b[0] : io_fp_b[13])
    & (RUP & ~(io_fp_a[31]) | RDN & io_fp_a[31] | RNE
       & (io_res_is_f32 ? _U_CS2_io_result[1] : _U_CS2_io_result[14])
       & (io_res_is_f32 ? _U_CS2_io_result[0] : _U_CS2_io_result[13]) | RMM);
  wire        CS3_round_up =
    (io_res_is_f32 ? io_fp_a[0] : io_fp_a[13])
    & (RUP & io_fp_a[31] | RDN & ~(io_fp_a[31]) | RNE
       & (io_res_is_f32 ? _U_CS3_io_result[1] : _U_CS3_io_result[14])
       & (io_res_is_f32 ? _U_CS3_io_result[0] : _U_CS3_io_result[13]) | RMM);
  wire        sel_CS0 = exp_is_equal & ~(_U_CS0_io_result[24]);
  wire        sel_CS1 = exp_is_equal & _U_CS0_io_result[24];
  wire        sel_CS2 =
    ~exp_is_equal & ~Efp_b_is_greater
    & (~(_U_CS2_io_result[24])
       | (io_res_is_f32 ? ~(_U_CS2_io_result[0]) : ~(_U_CS2_io_result[13]))
       | ~CS2_round_up);
  wire        sel_CS3 =
    ~exp_is_equal & Efp_b_is_greater
    & (~(_U_CS3_io_result[24])
       | (io_res_is_f32 ? ~(_U_CS3_io_result[0]) : ~(_U_CS3_io_result[13]))
       | ~CS3_round_up);
  wire        sel_CS4 =
    ~exp_is_equal
    & (~Efp_b_is_greater & _U_CS2_io_result[24]
       & (io_res_is_f32 ? _U_CS2_io_result[0] : _U_CS2_io_result[13]) & CS2_round_up
       | Efp_b_is_greater & _U_CS3_io_result[24]
       & (io_res_is_f32 ? _U_CS3_io_result[0] : _U_CS3_io_result[13]) & CS3_round_up);
  wire [24:0] CS_0123_result =
    (sel_CS0 ? {_U_CS0_io_result[23:0], 1'h0} : 25'h0)
    | (sel_CS1 ? {_U_CS1_io_result[23:0], 1'h0} : 25'h0)
    | (sel_CS2 ? _U_CS2_io_result : 25'h0) | (sel_CS3 ? _U_CS3_io_result : 25'h0);
  wire [24:0] mask_onehot =
    (sel_CS0
       ? {_mask_Efp_a_onehot_T_2,
          _mask_Efp_a_onehot_T_3,
          _mask_Efp_a_onehot_T_4,
          _mask_Efp_a_onehot_T_5,
          _mask_Efp_a_onehot_T_6,
          _mask_Efp_a_onehot_T_7,
          _mask_Efp_a_onehot_T_8,
          _mask_Efp_a_onehot_T_9,
          _mask_Efp_a_onehot_T_10,
          _mask_Efp_a_onehot_T_11,
          _mask_Efp_a_onehot_T_12,
          _mask_Efp_a_onehot_T_13,
          _mask_Efp_a_onehot_T_14,
          _mask_Efp_a_onehot_T_15,
          _mask_Efp_a_onehot_T_16,
          _mask_Efp_a_onehot_T_17,
          _mask_Efp_a_onehot_T_18,
          _mask_Efp_a_onehot_T_19,
          _mask_Efp_a_onehot_T_20,
          _mask_Efp_a_onehot_T_21,
          _mask_Efp_a_onehot_T_22,
          _mask_Efp_a_onehot_T_23,
          _mask_Efp_a_onehot_T_24,
          _mask_Efp_a_onehot_T_25,
          1'h1}
       : 25'h0)
    | (sel_CS1
         ? {_mask_Efp_b_onehot_T_2,
            _mask_Efp_b_onehot_T_3,
            _mask_Efp_b_onehot_T_4,
            _mask_Efp_b_onehot_T_5,
            _mask_Efp_b_onehot_T_6,
            _mask_Efp_b_onehot_T_7,
            _mask_Efp_b_onehot_T_8,
            _mask_Efp_b_onehot_T_9,
            _mask_Efp_b_onehot_T_10,
            _mask_Efp_b_onehot_T_11,
            _mask_Efp_b_onehot_T_12,
            _mask_Efp_b_onehot_T_13,
            _mask_Efp_b_onehot_T_14,
            _mask_Efp_b_onehot_T_15,
            _mask_Efp_b_onehot_T_16,
            _mask_Efp_b_onehot_T_17,
            _mask_Efp_b_onehot_T_18,
            _mask_Efp_b_onehot_T_19,
            _mask_Efp_b_onehot_T_20,
            _mask_Efp_b_onehot_T_21,
            _mask_Efp_b_onehot_T_22,
            _mask_Efp_b_onehot_T_23,
            _mask_Efp_b_onehot_T_24,
            _mask_Efp_b_onehot_T_25,
            1'h1}
         : 25'h0)
    | (sel_CS2
         ? {_mask_Efp_a_onehot_T_2,
            _mask_Efp_a_onehot_T_3,
            _mask_Efp_a_onehot_T_4,
            _mask_Efp_a_onehot_T_5,
            _mask_Efp_a_onehot_T_6,
            _mask_Efp_a_onehot_T_7,
            _mask_Efp_a_onehot_T_8,
            _mask_Efp_a_onehot_T_9,
            _mask_Efp_a_onehot_T_10,
            _mask_Efp_a_onehot_T_11,
            _mask_Efp_a_onehot_T_12,
            _mask_Efp_a_onehot_T_13,
            _mask_Efp_a_onehot_T_14,
            _mask_Efp_a_onehot_T_15,
            _mask_Efp_a_onehot_T_16,
            _mask_Efp_a_onehot_T_17,
            _mask_Efp_a_onehot_T_18,
            _mask_Efp_a_onehot_T_19,
            _mask_Efp_a_onehot_T_20,
            _mask_Efp_a_onehot_T_21,
            _mask_Efp_a_onehot_T_22,
            _mask_Efp_a_onehot_T_23,
            _mask_Efp_a_onehot_T_24,
            _mask_Efp_a_onehot_T_25,
            io_fp_a[30:23] == 8'h19}
         : 25'h0)
    | (sel_CS3
         ? {_mask_Efp_b_onehot_T_2,
            _mask_Efp_b_onehot_T_3,
            _mask_Efp_b_onehot_T_4,
            _mask_Efp_b_onehot_T_5,
            _mask_Efp_b_onehot_T_6,
            _mask_Efp_b_onehot_T_7,
            _mask_Efp_b_onehot_T_8,
            _mask_Efp_b_onehot_T_9,
            _mask_Efp_b_onehot_T_10,
            _mask_Efp_b_onehot_T_11,
            _mask_Efp_b_onehot_T_12,
            _mask_Efp_b_onehot_T_13,
            _mask_Efp_b_onehot_T_14,
            _mask_Efp_b_onehot_T_15,
            _mask_Efp_b_onehot_T_16,
            _mask_Efp_b_onehot_T_17,
            _mask_Efp_b_onehot_T_18,
            _mask_Efp_b_onehot_T_19,
            _mask_Efp_b_onehot_T_20,
            _mask_Efp_b_onehot_T_21,
            _mask_Efp_b_onehot_T_22,
            _mask_Efp_b_onehot_T_23,
            _mask_Efp_b_onehot_T_24,
            _mask_Efp_b_onehot_T_25,
            io_fp_b[30:23] == 8'h19}
         : 25'h0);
  wire [24:0] priority_mask = CS_0123_result | mask_onehot;
  wire [4:0]  lzd_0123 =
    priority_mask[24]
      ? 5'h0
      : priority_mask[23]
          ? 5'h1
          : priority_mask[22]
              ? 5'h2
              : priority_mask[21]
                  ? 5'h3
                  : priority_mask[20]
                      ? 5'h4
                      : priority_mask[19]
                          ? 5'h5
                          : priority_mask[18]
                              ? 5'h6
                              : priority_mask[17]
                                  ? 5'h7
                                  : priority_mask[16]
                                      ? 5'h8
                                      : priority_mask[15]
                                          ? 5'h9
                                          : priority_mask[14]
                                              ? 5'hA
                                              : priority_mask[13]
                                                  ? 5'hB
                                                  : priority_mask[12]
                                                      ? 5'hC
                                                      : priority_mask[11]
                                                          ? 5'hD
                                                          : priority_mask[10]
                                                              ? 5'hE
                                                              : priority_mask[9]
                                                                  ? 5'hF
                                                                  : priority_mask[8]
                                                                      ? 5'h10
                                                                      : priority_mask[7]
                                                                          ? 5'h11
                                                                          : priority_mask[6]
                                                                              ? 5'h12
                                                                              : priority_mask[5]
                                                                                  ? 5'h13
                                                                                  : priority_mask[4]
                                                                                      ? 5'h14
                                                                                      : priority_mask[3]
                                                                                          ? 5'h15
                                                                                          : priority_mask[2]
                                                                                              ? 5'h16
                                                                                              : priority_mask[1]
                                                                                                  ? 5'h17
                                                                                                  : {4'hC,
                                                                                                     ~(priority_mask[0])};
  always @(posedge clock) begin
    if (io_fire) begin
      EA_reg <= Efp_b_is_greater ? io_fp_b[30:23] : io_fp_a[30:23];
      U_CS4_io_adder_op0_r <= Efp_b_is_greater ? significand_fp_b : significand_fp_a;
      U_CS4_io_adder_op1_r <=
        {1'h0,
         Efp_b_is_greater
           ? {|(io_fp_a[30:23]), io_res_is_f32 ? io_fp_a[22:1] : {io_fp_a[22:14], 13'h0}}
           : {|(io_fp_b[30:23]),
              io_res_is_f32 ? io_fp_b[22:1] : {io_fp_b[22:14], 13'h0}}};
      lzd_0123_reg <= lzd_0123;
      U_Lshift_io_src_r <= CS_0123_result;
      NX_reg_r <=
        (sel_CS2 & _U_CS2_io_result[24]
         & (io_res_is_f32 ? _U_CS2_io_result[0] : _U_CS2_io_result[13]) & ~CS2_round_up
         | sel_CS3 & _U_CS3_io_result[24]
         & (io_res_is_f32 ? _U_CS3_io_result[0] : _U_CS3_io_result[13]) & ~CS3_round_up
         | sel_CS4)
        & (Efp_b_is_greater
             ? (|(io_fp_a[30:23])) & (io_res_is_f32 ? io_fp_a[0] : io_fp_a[13])
             : (|(io_fp_b[30:23])) & (io_res_is_f32 ? io_fp_b[0] : io_fp_b[13]));
      close_fraction_result_reg_r <= sel_CS4;
      lshift_result_head_is_one_reg_r <= |CS_0123_result;
      lshift_result_head_is_one_reg_r_1 <= |(mask_onehot & CS_0123_result);
      EA_sub_value_reg_r <= sel_CS4;
      EA_sub_value_reg_r_1 <= {3'h0, lzd_0123};
      close_sign_result_reg_r <=
        sel_CS0 & exp_is_equal & (_U_CS0_io_result[24] | _U_CS1_io_result[24])
        & io_fp_a[31] | sel_CS0 & exp_is_equal & ~(_U_CS0_io_result[24])
        & ~(_U_CS1_io_result[24]) & RDN | sel_CS1 & ~(io_fp_a[31]) | sel_CS2 & io_fp_a[31]
        | sel_CS3 & ~(io_fp_a[31]) | sel_CS4 & (Efp_b_is_greater ^ io_fp_a[31]);
    end
  end // always @(posedge)
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
        EA_reg = _RANDOM[2'h0][7:0];
        U_CS4_io_adder_op0_r = _RANDOM[2'h0][31:8];
        U_CS4_io_adder_op1_r = _RANDOM[2'h1][23:0];
        lzd_0123_reg = _RANDOM[2'h1][28:24];
        U_Lshift_io_src_r = {_RANDOM[2'h1][31:29], _RANDOM[2'h2][21:0]};
        NX_reg_r = _RANDOM[2'h2][22];
        close_fraction_result_reg_r = _RANDOM[2'h2][23];
        lshift_result_head_is_one_reg_r = _RANDOM[2'h2][24];
        lshift_result_head_is_one_reg_r_1 = _RANDOM[2'h2][25];
        EA_sub_value_reg_r = _RANDOM[2'h2][26];
        EA_sub_value_reg_r_1 = {_RANDOM[2'h2][31:27], _RANDOM[2'h3][2:0]};
        close_sign_result_reg_r = _RANDOM[2'h3][3];
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  ClosePathF32WidenF16MixedPipelineAdder U_CS0 (
    .io_adder_op0 (significand_fp_a),
    .io_adder_op1 (significand_fp_b),
    .io_result    (_U_CS0_io_result)
  );
  ClosePathF32WidenF16MixedPipelineAdder U_CS1 (
    .io_adder_op0 (significand_fp_b),
    .io_adder_op1 (significand_fp_a),
    .io_result    (_U_CS1_io_result)
  );
  ClosePathF32WidenF16MixedPipelineAdder_2 U_CS2 (
    .io_adder_op0 (_U_CS3_io_adder_op1_T),
    .io_adder_op1 (_U_CS3_io_adder_op0_T),
    .io_result    (_U_CS2_io_result)
  );
  ClosePathF32WidenF16MixedPipelineAdder_2 U_CS3 (
    .io_adder_op0 (_U_CS3_io_adder_op0_T),
    .io_adder_op1 (_U_CS3_io_adder_op1_T),
    .io_result    (_U_CS3_io_result)
  );
  ClosePathF32WidenF16MixedPipelineAdder U_CS4 (
    .io_adder_op0 (U_CS4_io_adder_op0_r),
    .io_adder_op1 (U_CS4_io_adder_op1_r),
    .io_result    (_U_CS4_io_result)
  );
  CloseShiftLeftWithMux_1 U_Lshift (
    .io_src        (U_Lshift_io_src_r),
    .io_shiftValue (lzd_0123_reg),
    .io_result     (_U_Lshift_io_result)
  );
  assign io_fp_c =
    {close_sign_result_reg_r,
     8'(EA_reg
        - (EA_sub_value_reg_r
             ? 8'h0
             : 8'(EA_reg - 8'h1) > {3'h0, lzd_0123_reg} & lshift_result_head_is_one_reg_r
               | lshift_result_head_is_one_reg_r_1
                 ? EA_sub_value_reg_r_1
                 : EA_reg)),
     close_fraction_result_reg_r ? _U_CS4_io_result[22:0] : _U_Lshift_io_result[23:1]};
  assign io_fflags = {4'h0, NX_reg_r};
  assign io_CS1 = _U_CS1_io_result;
endmodule

