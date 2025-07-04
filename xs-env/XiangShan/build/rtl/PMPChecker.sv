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

module PMPChecker(
  input  [1:0]  io_check_env_mode,
  input         io_check_env_pmp_0_cfg_l,
  input  [1:0]  io_check_env_pmp_0_cfg_a,
  input         io_check_env_pmp_0_cfg_x,
  input         io_check_env_pmp_0_cfg_w,
  input         io_check_env_pmp_0_cfg_r,
  input  [45:0] io_check_env_pmp_0_addr,
  input  [47:0] io_check_env_pmp_0_mask,
  input         io_check_env_pmp_1_cfg_l,
  input  [1:0]  io_check_env_pmp_1_cfg_a,
  input         io_check_env_pmp_1_cfg_x,
  input         io_check_env_pmp_1_cfg_w,
  input         io_check_env_pmp_1_cfg_r,
  input  [45:0] io_check_env_pmp_1_addr,
  input  [47:0] io_check_env_pmp_1_mask,
  input         io_check_env_pmp_2_cfg_l,
  input  [1:0]  io_check_env_pmp_2_cfg_a,
  input         io_check_env_pmp_2_cfg_x,
  input         io_check_env_pmp_2_cfg_w,
  input         io_check_env_pmp_2_cfg_r,
  input  [45:0] io_check_env_pmp_2_addr,
  input  [47:0] io_check_env_pmp_2_mask,
  input         io_check_env_pmp_3_cfg_l,
  input  [1:0]  io_check_env_pmp_3_cfg_a,
  input         io_check_env_pmp_3_cfg_x,
  input         io_check_env_pmp_3_cfg_w,
  input         io_check_env_pmp_3_cfg_r,
  input  [45:0] io_check_env_pmp_3_addr,
  input  [47:0] io_check_env_pmp_3_mask,
  input         io_check_env_pmp_4_cfg_l,
  input  [1:0]  io_check_env_pmp_4_cfg_a,
  input         io_check_env_pmp_4_cfg_x,
  input         io_check_env_pmp_4_cfg_w,
  input         io_check_env_pmp_4_cfg_r,
  input  [45:0] io_check_env_pmp_4_addr,
  input  [47:0] io_check_env_pmp_4_mask,
  input         io_check_env_pmp_5_cfg_l,
  input  [1:0]  io_check_env_pmp_5_cfg_a,
  input         io_check_env_pmp_5_cfg_x,
  input         io_check_env_pmp_5_cfg_w,
  input         io_check_env_pmp_5_cfg_r,
  input  [45:0] io_check_env_pmp_5_addr,
  input  [47:0] io_check_env_pmp_5_mask,
  input         io_check_env_pmp_6_cfg_l,
  input  [1:0]  io_check_env_pmp_6_cfg_a,
  input         io_check_env_pmp_6_cfg_x,
  input         io_check_env_pmp_6_cfg_w,
  input         io_check_env_pmp_6_cfg_r,
  input  [45:0] io_check_env_pmp_6_addr,
  input  [47:0] io_check_env_pmp_6_mask,
  input         io_check_env_pmp_7_cfg_l,
  input  [1:0]  io_check_env_pmp_7_cfg_a,
  input         io_check_env_pmp_7_cfg_x,
  input         io_check_env_pmp_7_cfg_w,
  input         io_check_env_pmp_7_cfg_r,
  input  [45:0] io_check_env_pmp_7_addr,
  input  [47:0] io_check_env_pmp_7_mask,
  input         io_check_env_pmp_8_cfg_l,
  input  [1:0]  io_check_env_pmp_8_cfg_a,
  input         io_check_env_pmp_8_cfg_x,
  input         io_check_env_pmp_8_cfg_w,
  input         io_check_env_pmp_8_cfg_r,
  input  [45:0] io_check_env_pmp_8_addr,
  input  [47:0] io_check_env_pmp_8_mask,
  input         io_check_env_pmp_9_cfg_l,
  input  [1:0]  io_check_env_pmp_9_cfg_a,
  input         io_check_env_pmp_9_cfg_x,
  input         io_check_env_pmp_9_cfg_w,
  input         io_check_env_pmp_9_cfg_r,
  input  [45:0] io_check_env_pmp_9_addr,
  input  [47:0] io_check_env_pmp_9_mask,
  input         io_check_env_pmp_10_cfg_l,
  input  [1:0]  io_check_env_pmp_10_cfg_a,
  input         io_check_env_pmp_10_cfg_x,
  input         io_check_env_pmp_10_cfg_w,
  input         io_check_env_pmp_10_cfg_r,
  input  [45:0] io_check_env_pmp_10_addr,
  input  [47:0] io_check_env_pmp_10_mask,
  input         io_check_env_pmp_11_cfg_l,
  input  [1:0]  io_check_env_pmp_11_cfg_a,
  input         io_check_env_pmp_11_cfg_x,
  input         io_check_env_pmp_11_cfg_w,
  input         io_check_env_pmp_11_cfg_r,
  input  [45:0] io_check_env_pmp_11_addr,
  input  [47:0] io_check_env_pmp_11_mask,
  input         io_check_env_pmp_12_cfg_l,
  input  [1:0]  io_check_env_pmp_12_cfg_a,
  input         io_check_env_pmp_12_cfg_x,
  input         io_check_env_pmp_12_cfg_w,
  input         io_check_env_pmp_12_cfg_r,
  input  [45:0] io_check_env_pmp_12_addr,
  input  [47:0] io_check_env_pmp_12_mask,
  input         io_check_env_pmp_13_cfg_l,
  input  [1:0]  io_check_env_pmp_13_cfg_a,
  input         io_check_env_pmp_13_cfg_x,
  input         io_check_env_pmp_13_cfg_w,
  input         io_check_env_pmp_13_cfg_r,
  input  [45:0] io_check_env_pmp_13_addr,
  input  [47:0] io_check_env_pmp_13_mask,
  input         io_check_env_pmp_14_cfg_l,
  input  [1:0]  io_check_env_pmp_14_cfg_a,
  input         io_check_env_pmp_14_cfg_x,
  input         io_check_env_pmp_14_cfg_w,
  input         io_check_env_pmp_14_cfg_r,
  input  [45:0] io_check_env_pmp_14_addr,
  input  [47:0] io_check_env_pmp_14_mask,
  input         io_check_env_pmp_15_cfg_l,
  input  [1:0]  io_check_env_pmp_15_cfg_a,
  input         io_check_env_pmp_15_cfg_x,
  input         io_check_env_pmp_15_cfg_w,
  input         io_check_env_pmp_15_cfg_r,
  input  [45:0] io_check_env_pmp_15_addr,
  input  [47:0] io_check_env_pmp_15_mask,
  input         io_check_env_pma_0_cfg_c,
  input         io_check_env_pma_0_cfg_atomic,
  input  [1:0]  io_check_env_pma_0_cfg_a,
  input         io_check_env_pma_0_cfg_x,
  input         io_check_env_pma_0_cfg_w,
  input         io_check_env_pma_0_cfg_r,
  input  [45:0] io_check_env_pma_0_addr,
  input  [47:0] io_check_env_pma_0_mask,
  input         io_check_env_pma_1_cfg_c,
  input         io_check_env_pma_1_cfg_atomic,
  input  [1:0]  io_check_env_pma_1_cfg_a,
  input         io_check_env_pma_1_cfg_x,
  input         io_check_env_pma_1_cfg_w,
  input         io_check_env_pma_1_cfg_r,
  input  [45:0] io_check_env_pma_1_addr,
  input  [47:0] io_check_env_pma_1_mask,
  input         io_check_env_pma_2_cfg_c,
  input         io_check_env_pma_2_cfg_atomic,
  input  [1:0]  io_check_env_pma_2_cfg_a,
  input         io_check_env_pma_2_cfg_x,
  input         io_check_env_pma_2_cfg_w,
  input         io_check_env_pma_2_cfg_r,
  input  [45:0] io_check_env_pma_2_addr,
  input  [47:0] io_check_env_pma_2_mask,
  input         io_check_env_pma_3_cfg_c,
  input         io_check_env_pma_3_cfg_atomic,
  input  [1:0]  io_check_env_pma_3_cfg_a,
  input         io_check_env_pma_3_cfg_x,
  input         io_check_env_pma_3_cfg_w,
  input         io_check_env_pma_3_cfg_r,
  input  [45:0] io_check_env_pma_3_addr,
  input  [47:0] io_check_env_pma_3_mask,
  input         io_check_env_pma_4_cfg_c,
  input         io_check_env_pma_4_cfg_atomic,
  input  [1:0]  io_check_env_pma_4_cfg_a,
  input         io_check_env_pma_4_cfg_x,
  input         io_check_env_pma_4_cfg_w,
  input         io_check_env_pma_4_cfg_r,
  input  [45:0] io_check_env_pma_4_addr,
  input  [47:0] io_check_env_pma_4_mask,
  input         io_check_env_pma_5_cfg_c,
  input         io_check_env_pma_5_cfg_atomic,
  input  [1:0]  io_check_env_pma_5_cfg_a,
  input         io_check_env_pma_5_cfg_x,
  input         io_check_env_pma_5_cfg_w,
  input         io_check_env_pma_5_cfg_r,
  input  [45:0] io_check_env_pma_5_addr,
  input  [47:0] io_check_env_pma_5_mask,
  input         io_check_env_pma_6_cfg_c,
  input         io_check_env_pma_6_cfg_atomic,
  input  [1:0]  io_check_env_pma_6_cfg_a,
  input         io_check_env_pma_6_cfg_x,
  input         io_check_env_pma_6_cfg_w,
  input         io_check_env_pma_6_cfg_r,
  input  [45:0] io_check_env_pma_6_addr,
  input  [47:0] io_check_env_pma_6_mask,
  input         io_check_env_pma_7_cfg_c,
  input         io_check_env_pma_7_cfg_atomic,
  input  [1:0]  io_check_env_pma_7_cfg_a,
  input         io_check_env_pma_7_cfg_x,
  input         io_check_env_pma_7_cfg_w,
  input         io_check_env_pma_7_cfg_r,
  input  [45:0] io_check_env_pma_7_addr,
  input  [47:0] io_check_env_pma_7_mask,
  input         io_check_env_pma_8_cfg_c,
  input         io_check_env_pma_8_cfg_atomic,
  input  [1:0]  io_check_env_pma_8_cfg_a,
  input         io_check_env_pma_8_cfg_x,
  input         io_check_env_pma_8_cfg_w,
  input         io_check_env_pma_8_cfg_r,
  input  [45:0] io_check_env_pma_8_addr,
  input  [47:0] io_check_env_pma_8_mask,
  input         io_check_env_pma_9_cfg_c,
  input         io_check_env_pma_9_cfg_atomic,
  input  [1:0]  io_check_env_pma_9_cfg_a,
  input         io_check_env_pma_9_cfg_x,
  input         io_check_env_pma_9_cfg_w,
  input         io_check_env_pma_9_cfg_r,
  input  [45:0] io_check_env_pma_9_addr,
  input  [47:0] io_check_env_pma_9_mask,
  input         io_check_env_pma_10_cfg_c,
  input         io_check_env_pma_10_cfg_atomic,
  input  [1:0]  io_check_env_pma_10_cfg_a,
  input         io_check_env_pma_10_cfg_x,
  input         io_check_env_pma_10_cfg_w,
  input         io_check_env_pma_10_cfg_r,
  input  [45:0] io_check_env_pma_10_addr,
  input  [47:0] io_check_env_pma_10_mask,
  input         io_check_env_pma_11_cfg_c,
  input         io_check_env_pma_11_cfg_atomic,
  input  [1:0]  io_check_env_pma_11_cfg_a,
  input         io_check_env_pma_11_cfg_x,
  input         io_check_env_pma_11_cfg_w,
  input         io_check_env_pma_11_cfg_r,
  input  [45:0] io_check_env_pma_11_addr,
  input  [47:0] io_check_env_pma_11_mask,
  input         io_check_env_pma_12_cfg_c,
  input         io_check_env_pma_12_cfg_atomic,
  input  [1:0]  io_check_env_pma_12_cfg_a,
  input         io_check_env_pma_12_cfg_x,
  input         io_check_env_pma_12_cfg_w,
  input         io_check_env_pma_12_cfg_r,
  input  [45:0] io_check_env_pma_12_addr,
  input  [47:0] io_check_env_pma_12_mask,
  input         io_check_env_pma_13_cfg_c,
  input         io_check_env_pma_13_cfg_atomic,
  input  [1:0]  io_check_env_pma_13_cfg_a,
  input         io_check_env_pma_13_cfg_x,
  input         io_check_env_pma_13_cfg_w,
  input         io_check_env_pma_13_cfg_r,
  input  [45:0] io_check_env_pma_13_addr,
  input  [47:0] io_check_env_pma_13_mask,
  input         io_check_env_pma_14_cfg_c,
  input         io_check_env_pma_14_cfg_atomic,
  input  [1:0]  io_check_env_pma_14_cfg_a,
  input         io_check_env_pma_14_cfg_x,
  input         io_check_env_pma_14_cfg_w,
  input         io_check_env_pma_14_cfg_r,
  input  [45:0] io_check_env_pma_14_addr,
  input  [47:0] io_check_env_pma_14_mask,
  input         io_check_env_pma_15_cfg_c,
  input         io_check_env_pma_15_cfg_atomic,
  input  [1:0]  io_check_env_pma_15_cfg_a,
  input         io_check_env_pma_15_cfg_x,
  input         io_check_env_pma_15_cfg_w,
  input         io_check_env_pma_15_cfg_r,
  input  [45:0] io_check_env_pma_15_addr,
  input  [47:0] io_check_env_pma_15_mask,
  input  [47:0] io_req_bits_addr,
  input  [2:0]  io_req_bits_cmd,
  output        io_resp_ld,
  output        io_resp_st,
  output        io_resp_instr,
  output        io_resp_mmio,
  output        io_resp_atomic
);

  wire [45:0] _GEN = io_check_env_pmp_0_addr & 46'h3FFFFFFFFC00;
  wire        res_pmp_is_match =
    io_check_env_pmp_0_cfg_a[1]
      ? (io_req_bits_addr
         & ~io_check_env_pmp_0_mask) == ({_GEN, 2'h0} & ~io_check_env_pmp_0_mask)
      : io_check_env_pmp_0_cfg_a == 2'h1 & io_req_bits_addr < {_GEN, 2'h0};
  wire        res_pmp_ignore = io_check_env_mode[1] & ~io_check_env_pmp_0_cfg_l;
  wire [45:0] _GEN_0 = io_check_env_pmp_1_addr & 46'h3FFFFFFFFC00;
  wire        res_pmp_ignore_1 = io_check_env_mode[1] & ~io_check_env_pmp_1_cfg_l;
  wire [45:0] _GEN_1 = io_check_env_pmp_2_addr & 46'h3FFFFFFFFC00;
  wire        res_pmp_is_match_2 =
    io_check_env_pmp_2_cfg_a[1]
      ? (io_req_bits_addr
         & ~io_check_env_pmp_2_mask) == ({_GEN_1, 2'h0} & ~io_check_env_pmp_2_mask)
      : io_check_env_pmp_2_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_0, 2'h0}
        & io_req_bits_addr < {_GEN_1, 2'h0};
  wire        res_pmp_ignore_2 = io_check_env_mode[1] & ~io_check_env_pmp_2_cfg_l;
  wire [45:0] _GEN_2 = io_check_env_pmp_3_addr & 46'h3FFFFFFFFC00;
  wire        res_pmp_ignore_3 = io_check_env_mode[1] & ~io_check_env_pmp_3_cfg_l;
  wire [45:0] _GEN_3 = io_check_env_pmp_4_addr & 46'h3FFFFFFFFC00;
  wire        res_pmp_is_match_4 =
    io_check_env_pmp_4_cfg_a[1]
      ? (io_req_bits_addr
         & ~io_check_env_pmp_4_mask) == ({_GEN_3, 2'h0} & ~io_check_env_pmp_4_mask)
      : io_check_env_pmp_4_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_2, 2'h0}
        & io_req_bits_addr < {_GEN_3, 2'h0};
  wire        res_pmp_ignore_4 = io_check_env_mode[1] & ~io_check_env_pmp_4_cfg_l;
  wire [45:0] _GEN_4 = io_check_env_pmp_5_addr & 46'h3FFFFFFFFC00;
  wire        res_pmp_ignore_5 = io_check_env_mode[1] & ~io_check_env_pmp_5_cfg_l;
  wire [45:0] _GEN_5 = io_check_env_pmp_6_addr & 46'h3FFFFFFFFC00;
  wire        res_pmp_is_match_6 =
    io_check_env_pmp_6_cfg_a[1]
      ? (io_req_bits_addr
         & ~io_check_env_pmp_6_mask) == ({_GEN_5, 2'h0} & ~io_check_env_pmp_6_mask)
      : io_check_env_pmp_6_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_4, 2'h0}
        & io_req_bits_addr < {_GEN_5, 2'h0};
  wire        res_pmp_ignore_6 = io_check_env_mode[1] & ~io_check_env_pmp_6_cfg_l;
  wire [45:0] _GEN_6 = io_check_env_pmp_7_addr & 46'h3FFFFFFFFC00;
  wire        res_pmp_ignore_7 = io_check_env_mode[1] & ~io_check_env_pmp_7_cfg_l;
  wire [45:0] _GEN_7 = io_check_env_pmp_8_addr & 46'h3FFFFFFFFC00;
  wire        res_pmp_is_match_8 =
    io_check_env_pmp_8_cfg_a[1]
      ? (io_req_bits_addr
         & ~io_check_env_pmp_8_mask) == ({_GEN_7, 2'h0} & ~io_check_env_pmp_8_mask)
      : io_check_env_pmp_8_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_6, 2'h0}
        & io_req_bits_addr < {_GEN_7, 2'h0};
  wire        res_pmp_ignore_8 = io_check_env_mode[1] & ~io_check_env_pmp_8_cfg_l;
  wire [45:0] _GEN_8 = io_check_env_pmp_9_addr & 46'h3FFFFFFFFC00;
  wire        res_pmp_ignore_9 = io_check_env_mode[1] & ~io_check_env_pmp_9_cfg_l;
  wire [45:0] _GEN_9 = io_check_env_pmp_10_addr & 46'h3FFFFFFFFC00;
  wire        res_pmp_is_match_10 =
    io_check_env_pmp_10_cfg_a[1]
      ? (io_req_bits_addr
         & ~io_check_env_pmp_10_mask) == ({_GEN_9, 2'h0} & ~io_check_env_pmp_10_mask)
      : io_check_env_pmp_10_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_8, 2'h0}
        & io_req_bits_addr < {_GEN_9, 2'h0};
  wire        res_pmp_ignore_10 = io_check_env_mode[1] & ~io_check_env_pmp_10_cfg_l;
  wire [45:0] _GEN_10 = io_check_env_pmp_11_addr & 46'h3FFFFFFFFC00;
  wire        res_pmp_ignore_11 = io_check_env_mode[1] & ~io_check_env_pmp_11_cfg_l;
  wire [45:0] _GEN_11 = io_check_env_pmp_12_addr & 46'h3FFFFFFFFC00;
  wire        res_pmp_is_match_12 =
    io_check_env_pmp_12_cfg_a[1]
      ? (io_req_bits_addr
         & ~io_check_env_pmp_12_mask) == ({_GEN_11, 2'h0} & ~io_check_env_pmp_12_mask)
      : io_check_env_pmp_12_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_10, 2'h0}
        & io_req_bits_addr < {_GEN_11, 2'h0};
  wire        res_pmp_ignore_12 = io_check_env_mode[1] & ~io_check_env_pmp_12_cfg_l;
  wire [45:0] _GEN_12 = io_check_env_pmp_13_addr & 46'h3FFFFFFFFC00;
  wire        res_pmp_ignore_13 = io_check_env_mode[1] & ~io_check_env_pmp_13_cfg_l;
  wire [45:0] _GEN_13 = io_check_env_pmp_14_addr & 46'h3FFFFFFFFC00;
  wire        res_pmp_is_match_14 =
    io_check_env_pmp_14_cfg_a[1]
      ? (io_req_bits_addr
         & ~io_check_env_pmp_14_mask) == ({_GEN_13, 2'h0} & ~io_check_env_pmp_14_mask)
      : io_check_env_pmp_14_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_12, 2'h0}
        & io_req_bits_addr < {_GEN_13, 2'h0};
  wire        res_pmp_ignore_14 = io_check_env_mode[1] & ~io_check_env_pmp_14_cfg_l;
  wire [45:0] _GEN_14 = io_check_env_pmp_15_addr & 46'h3FFFFFFFFC00;
  wire        res_pmp_is_match_15 =
    io_check_env_pmp_15_cfg_a[1]
      ? (io_req_bits_addr
         & ~io_check_env_pmp_15_mask) == ({_GEN_14, 2'h0} & ~io_check_env_pmp_15_mask)
      : io_check_env_pmp_15_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_13, 2'h0}
        & io_req_bits_addr < {_GEN_14, 2'h0};
  wire        res_pmp_ignore_15 = io_check_env_mode[1] & ~io_check_env_pmp_15_cfg_l;
  wire        _res_pmp_T =
    res_pmp_is_match
    | (io_check_env_pmp_1_cfg_a[1]
         ? (io_req_bits_addr
            & ~io_check_env_pmp_1_mask) == ({_GEN_0, 2'h0} & ~io_check_env_pmp_1_mask)
         : io_check_env_pmp_1_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN, 2'h0}
           & io_req_bits_addr < {_GEN_0, 2'h0});
  wire        _res_pmp_T_4 =
    _res_pmp_T | res_pmp_is_match_2
    | (io_check_env_pmp_3_cfg_a[1]
         ? (io_req_bits_addr
            & ~io_check_env_pmp_3_mask) == ({_GEN_2, 2'h0} & ~io_check_env_pmp_3_mask)
         : io_check_env_pmp_3_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_1, 2'h0}
           & io_req_bits_addr < {_GEN_2, 2'h0});
  wire        _res_pmp_T_6 =
    res_pmp_is_match_4
    | (io_check_env_pmp_5_cfg_a[1]
         ? (io_req_bits_addr
            & ~io_check_env_pmp_5_mask) == ({_GEN_4, 2'h0} & ~io_check_env_pmp_5_mask)
         : io_check_env_pmp_5_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_3, 2'h0}
           & io_req_bits_addr < {_GEN_4, 2'h0});
  wire        _res_pmp_T_12 =
    _res_pmp_T_4 | _res_pmp_T_6 | res_pmp_is_match_6
    | (io_check_env_pmp_7_cfg_a[1]
         ? (io_req_bits_addr
            & ~io_check_env_pmp_7_mask) == ({_GEN_6, 2'h0} & ~io_check_env_pmp_7_mask)
         : io_check_env_pmp_7_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_5, 2'h0}
           & io_req_bits_addr < {_GEN_6, 2'h0});
  wire        _res_pmp_T_14 =
    res_pmp_is_match_8
    | (io_check_env_pmp_9_cfg_a[1]
         ? (io_req_bits_addr
            & ~io_check_env_pmp_9_mask) == ({_GEN_8, 2'h0} & ~io_check_env_pmp_9_mask)
         : io_check_env_pmp_9_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_7, 2'h0}
           & io_req_bits_addr < {_GEN_8, 2'h0});
  wire        _res_pmp_T_18 =
    _res_pmp_T_14 | res_pmp_is_match_10
    | (io_check_env_pmp_11_cfg_a[1]
         ? (io_req_bits_addr
            & ~io_check_env_pmp_11_mask) == ({_GEN_10, 2'h0} & ~io_check_env_pmp_11_mask)
         : io_check_env_pmp_11_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_9, 2'h0}
           & io_req_bits_addr < {_GEN_10, 2'h0});
  wire        _res_pmp_T_20 =
    res_pmp_is_match_12
    | (io_check_env_pmp_13_cfg_a[1]
         ? (io_req_bits_addr
            & ~io_check_env_pmp_13_mask) == ({_GEN_12, 2'h0} & ~io_check_env_pmp_13_mask)
         : io_check_env_pmp_13_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_11, 2'h0}
           & io_req_bits_addr < {_GEN_12, 2'h0});
  wire [45:0] _GEN_15 = io_check_env_pma_0_addr & 46'h3FFFFFFFFC00;
  wire        res_pma_is_match =
    io_check_env_pma_0_cfg_a[1]
      ? (io_req_bits_addr
         & ~io_check_env_pma_0_mask) == ({_GEN_15, 2'h0} & ~io_check_env_pma_0_mask)
      : io_check_env_pma_0_cfg_a == 2'h1 & io_req_bits_addr < {_GEN_15, 2'h0};
  wire [45:0] _GEN_16 = io_check_env_pma_1_addr & 46'h3FFFFFFFFC00;
  wire [45:0] _GEN_17 = io_check_env_pma_2_addr & 46'h3FFFFFFFFC00;
  wire        res_pma_is_match_2 =
    io_check_env_pma_2_cfg_a[1]
      ? (io_req_bits_addr
         & ~io_check_env_pma_2_mask) == ({_GEN_17, 2'h0} & ~io_check_env_pma_2_mask)
      : io_check_env_pma_2_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_16, 2'h0}
        & io_req_bits_addr < {_GEN_17, 2'h0};
  wire [45:0] _GEN_18 = io_check_env_pma_3_addr & 46'h3FFFFFFFFC00;
  wire [45:0] _GEN_19 = io_check_env_pma_4_addr & 46'h3FFFFFFFFC00;
  wire        res_pma_is_match_4 =
    io_check_env_pma_4_cfg_a[1]
      ? (io_req_bits_addr
         & ~io_check_env_pma_4_mask) == ({_GEN_19, 2'h0} & ~io_check_env_pma_4_mask)
      : io_check_env_pma_4_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_18, 2'h0}
        & io_req_bits_addr < {_GEN_19, 2'h0};
  wire [45:0] _GEN_20 = io_check_env_pma_5_addr & 46'h3FFFFFFFFC00;
  wire [45:0] _GEN_21 = io_check_env_pma_6_addr & 46'h3FFFFFFFFC00;
  wire        res_pma_is_match_6 =
    io_check_env_pma_6_cfg_a[1]
      ? (io_req_bits_addr
         & ~io_check_env_pma_6_mask) == ({_GEN_21, 2'h0} & ~io_check_env_pma_6_mask)
      : io_check_env_pma_6_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_20, 2'h0}
        & io_req_bits_addr < {_GEN_21, 2'h0};
  wire [45:0] _GEN_22 = io_check_env_pma_7_addr & 46'h3FFFFFFFFC00;
  wire [45:0] _GEN_23 = io_check_env_pma_8_addr & 46'h3FFFFFFFFC00;
  wire        res_pma_is_match_8 =
    io_check_env_pma_8_cfg_a[1]
      ? (io_req_bits_addr
         & ~io_check_env_pma_8_mask) == ({_GEN_23, 2'h0} & ~io_check_env_pma_8_mask)
      : io_check_env_pma_8_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_22, 2'h0}
        & io_req_bits_addr < {_GEN_23, 2'h0};
  wire [45:0] _GEN_24 = io_check_env_pma_9_addr & 46'h3FFFFFFFFC00;
  wire [45:0] _GEN_25 = io_check_env_pma_10_addr & 46'h3FFFFFFFFC00;
  wire        res_pma_is_match_10 =
    io_check_env_pma_10_cfg_a[1]
      ? (io_req_bits_addr
         & ~io_check_env_pma_10_mask) == ({_GEN_25, 2'h0} & ~io_check_env_pma_10_mask)
      : io_check_env_pma_10_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_24, 2'h0}
        & io_req_bits_addr < {_GEN_25, 2'h0};
  wire [45:0] _GEN_26 = io_check_env_pma_11_addr & 46'h3FFFFFFFFC00;
  wire [45:0] _GEN_27 = io_check_env_pma_12_addr & 46'h3FFFFFFFFC00;
  wire        res_pma_is_match_12 =
    io_check_env_pma_12_cfg_a[1]
      ? (io_req_bits_addr
         & ~io_check_env_pma_12_mask) == ({_GEN_27, 2'h0} & ~io_check_env_pma_12_mask)
      : io_check_env_pma_12_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_26, 2'h0}
        & io_req_bits_addr < {_GEN_27, 2'h0};
  wire [45:0] _GEN_28 = io_check_env_pma_13_addr & 46'h3FFFFFFFFC00;
  wire [45:0] _GEN_29 = io_check_env_pma_14_addr & 46'h3FFFFFFFFC00;
  wire        res_pma_is_match_14 =
    io_check_env_pma_14_cfg_a[1]
      ? (io_req_bits_addr
         & ~io_check_env_pma_14_mask) == ({_GEN_29, 2'h0} & ~io_check_env_pma_14_mask)
      : io_check_env_pma_14_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_28, 2'h0}
        & io_req_bits_addr < {_GEN_29, 2'h0};
  wire [45:0] _GEN_30 = io_check_env_pma_15_addr & 46'h3FFFFFFFFC00;
  wire        res_pma_is_match_15 =
    io_check_env_pma_15_cfg_a[1]
      ? (io_req_bits_addr
         & ~io_check_env_pma_15_mask) == ({_GEN_30, 2'h0} & ~io_check_env_pma_15_mask)
      : io_check_env_pma_15_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_29, 2'h0}
        & io_req_bits_addr < {_GEN_30, 2'h0};
  wire        _res_pma_T =
    res_pma_is_match
    | (io_check_env_pma_1_cfg_a[1]
         ? (io_req_bits_addr
            & ~io_check_env_pma_1_mask) == ({_GEN_16, 2'h0} & ~io_check_env_pma_1_mask)
         : io_check_env_pma_1_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_15, 2'h0}
           & io_req_bits_addr < {_GEN_16, 2'h0});
  wire        _res_pma_T_4 =
    _res_pma_T | res_pma_is_match_2
    | (io_check_env_pma_3_cfg_a[1]
         ? (io_req_bits_addr
            & ~io_check_env_pma_3_mask) == ({_GEN_18, 2'h0} & ~io_check_env_pma_3_mask)
         : io_check_env_pma_3_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_17, 2'h0}
           & io_req_bits_addr < {_GEN_18, 2'h0});
  wire        _res_pma_T_6 =
    res_pma_is_match_4
    | (io_check_env_pma_5_cfg_a[1]
         ? (io_req_bits_addr
            & ~io_check_env_pma_5_mask) == ({_GEN_20, 2'h0} & ~io_check_env_pma_5_mask)
         : io_check_env_pma_5_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_19, 2'h0}
           & io_req_bits_addr < {_GEN_20, 2'h0});
  wire        _res_pma_T_12 =
    _res_pma_T_4 | _res_pma_T_6 | res_pma_is_match_6
    | (io_check_env_pma_7_cfg_a[1]
         ? (io_req_bits_addr
            & ~io_check_env_pma_7_mask) == ({_GEN_22, 2'h0} & ~io_check_env_pma_7_mask)
         : io_check_env_pma_7_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_21, 2'h0}
           & io_req_bits_addr < {_GEN_22, 2'h0});
  wire        _res_pma_T_14 =
    res_pma_is_match_8
    | (io_check_env_pma_9_cfg_a[1]
         ? (io_req_bits_addr
            & ~io_check_env_pma_9_mask) == ({_GEN_24, 2'h0} & ~io_check_env_pma_9_mask)
         : io_check_env_pma_9_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_23, 2'h0}
           & io_req_bits_addr < {_GEN_24, 2'h0});
  wire        _res_pma_T_18 =
    _res_pma_T_14 | res_pma_is_match_10
    | (io_check_env_pma_11_cfg_a[1]
         ? (io_req_bits_addr
            & ~io_check_env_pma_11_mask) == ({_GEN_26, 2'h0} & ~io_check_env_pma_11_mask)
         : io_check_env_pma_11_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_25, 2'h0}
           & io_req_bits_addr < {_GEN_26, 2'h0});
  wire        _res_pma_T_20 =
    res_pma_is_match_12
    | (io_check_env_pma_13_cfg_a[1]
         ? (io_req_bits_addr
            & ~io_check_env_pma_13_mask) == ({_GEN_28, 2'h0} & ~io_check_env_pma_13_mask)
         : io_check_env_pma_13_cfg_a == 2'h1 & io_req_bits_addr >= {_GEN_27, 2'h0}
           & io_req_bits_addr < {_GEN_28, 2'h0});
  wire        resp_atomic =
    _res_pma_T_12
      ? (_res_pma_T_4
           ? (_res_pma_T
                ? (res_pma_is_match
                     ? io_check_env_pma_0_cfg_atomic
                     : io_check_env_pma_1_cfg_atomic)
                : res_pma_is_match_2
                    ? io_check_env_pma_2_cfg_atomic
                    : io_check_env_pma_3_cfg_atomic)
           : _res_pma_T_6
               ? (res_pma_is_match_4
                    ? io_check_env_pma_4_cfg_atomic
                    : io_check_env_pma_5_cfg_atomic)
               : res_pma_is_match_6
                   ? io_check_env_pma_6_cfg_atomic
                   : io_check_env_pma_7_cfg_atomic)
      : _res_pma_T_18
          ? (_res_pma_T_14
               ? (res_pma_is_match_8
                    ? io_check_env_pma_8_cfg_atomic
                    : io_check_env_pma_9_cfg_atomic)
               : res_pma_is_match_10
                   ? io_check_env_pma_10_cfg_atomic
                   : io_check_env_pma_11_cfg_atomic)
          : _res_pma_T_20
              ? (res_pma_is_match_12
                   ? io_check_env_pma_12_cfg_atomic
                   : io_check_env_pma_13_cfg_atomic)
              : res_pma_is_match_14
                  ? io_check_env_pma_14_cfg_atomic
                  : res_pma_is_match_15 & io_check_env_pma_15_cfg_atomic;
  wire        res_pma_cfg_x =
    _res_pma_T_12
      ? (_res_pma_T_4
           ? (_res_pma_T
                ? (res_pma_is_match ? io_check_env_pma_0_cfg_x : io_check_env_pma_1_cfg_x)
                : res_pma_is_match_2
                    ? io_check_env_pma_2_cfg_x
                    : io_check_env_pma_3_cfg_x)
           : _res_pma_T_6
               ? (res_pma_is_match_4
                    ? io_check_env_pma_4_cfg_x
                    : io_check_env_pma_5_cfg_x)
               : res_pma_is_match_6 ? io_check_env_pma_6_cfg_x : io_check_env_pma_7_cfg_x)
      : _res_pma_T_18
          ? (_res_pma_T_14
               ? (res_pma_is_match_8
                    ? io_check_env_pma_8_cfg_x
                    : io_check_env_pma_9_cfg_x)
               : res_pma_is_match_10
                   ? io_check_env_pma_10_cfg_x
                   : io_check_env_pma_11_cfg_x)
          : _res_pma_T_20
              ? (res_pma_is_match_12
                   ? io_check_env_pma_12_cfg_x
                   : io_check_env_pma_13_cfg_x)
              : res_pma_is_match_14
                  ? io_check_env_pma_14_cfg_x
                  : res_pma_is_match_15 & io_check_env_pma_15_cfg_x;
  wire        res_pma_cfg_w =
    _res_pma_T_12
      ? (_res_pma_T_4
           ? (_res_pma_T
                ? (res_pma_is_match ? io_check_env_pma_0_cfg_w : io_check_env_pma_1_cfg_w)
                : res_pma_is_match_2
                    ? io_check_env_pma_2_cfg_w
                    : io_check_env_pma_3_cfg_w)
           : _res_pma_T_6
               ? (res_pma_is_match_4
                    ? io_check_env_pma_4_cfg_w
                    : io_check_env_pma_5_cfg_w)
               : res_pma_is_match_6 ? io_check_env_pma_6_cfg_w : io_check_env_pma_7_cfg_w)
      : _res_pma_T_18
          ? (_res_pma_T_14
               ? (res_pma_is_match_8
                    ? io_check_env_pma_8_cfg_w
                    : io_check_env_pma_9_cfg_w)
               : res_pma_is_match_10
                   ? io_check_env_pma_10_cfg_w
                   : io_check_env_pma_11_cfg_w)
          : _res_pma_T_20
              ? (res_pma_is_match_12
                   ? io_check_env_pma_12_cfg_w
                   : io_check_env_pma_13_cfg_w)
              : res_pma_is_match_14
                  ? io_check_env_pma_14_cfg_w
                  : res_pma_is_match_15 & io_check_env_pma_15_cfg_w;
  wire        res_pma_cfg_r =
    _res_pma_T_12
      ? (_res_pma_T_4
           ? (_res_pma_T
                ? (res_pma_is_match ? io_check_env_pma_0_cfg_r : io_check_env_pma_1_cfg_r)
                : res_pma_is_match_2
                    ? io_check_env_pma_2_cfg_r
                    : io_check_env_pma_3_cfg_r)
           : _res_pma_T_6
               ? (res_pma_is_match_4
                    ? io_check_env_pma_4_cfg_r
                    : io_check_env_pma_5_cfg_r)
               : res_pma_is_match_6 ? io_check_env_pma_6_cfg_r : io_check_env_pma_7_cfg_r)
      : _res_pma_T_18
          ? (_res_pma_T_14
               ? (res_pma_is_match_8
                    ? io_check_env_pma_8_cfg_r
                    : io_check_env_pma_9_cfg_r)
               : res_pma_is_match_10
                   ? io_check_env_pma_10_cfg_r
                   : io_check_env_pma_11_cfg_r)
          : _res_pma_T_20
              ? (res_pma_is_match_12
                   ? io_check_env_pma_12_cfg_r
                   : io_check_env_pma_13_cfg_r)
              : res_pma_is_match_14
                  ? io_check_env_pma_14_cfg_r
                  : res_pma_is_match_15 & io_check_env_pma_15_cfg_r;
  wire        _resp_pma_resp_mmio_T_6 = io_req_bits_cmd == 3'h5;
  assign io_resp_ld =
    ~(|(io_req_bits_cmd[1:0])) & ~_resp_pma_resp_mmio_T_6
    & ~(_res_pmp_T_12
          ? (_res_pmp_T_4
               ? (_res_pmp_T
                    ? (res_pmp_is_match
                         ? io_check_env_pmp_0_cfg_r | res_pmp_ignore
                         : io_check_env_pmp_1_cfg_r | res_pmp_ignore_1)
                    : res_pmp_is_match_2
                        ? io_check_env_pmp_2_cfg_r | res_pmp_ignore_2
                        : io_check_env_pmp_3_cfg_r | res_pmp_ignore_3)
               : _res_pmp_T_6
                   ? (res_pmp_is_match_4
                        ? io_check_env_pmp_4_cfg_r | res_pmp_ignore_4
                        : io_check_env_pmp_5_cfg_r | res_pmp_ignore_5)
                   : res_pmp_is_match_6
                       ? io_check_env_pmp_6_cfg_r | res_pmp_ignore_6
                       : io_check_env_pmp_7_cfg_r | res_pmp_ignore_7)
          : _res_pmp_T_18
              ? (_res_pmp_T_14
                   ? (res_pmp_is_match_8
                        ? io_check_env_pmp_8_cfg_r | res_pmp_ignore_8
                        : io_check_env_pmp_9_cfg_r | res_pmp_ignore_9)
                   : res_pmp_is_match_10
                       ? io_check_env_pmp_10_cfg_r | res_pmp_ignore_10
                       : io_check_env_pmp_11_cfg_r | res_pmp_ignore_11)
              : _res_pmp_T_20
                  ? (res_pmp_is_match_12
                       ? io_check_env_pmp_12_cfg_r | res_pmp_ignore_12
                       : io_check_env_pmp_13_cfg_r | res_pmp_ignore_13)
                  : res_pmp_is_match_14
                      ? io_check_env_pmp_14_cfg_r | res_pmp_ignore_14
                      : res_pmp_is_match_15
                          ? io_check_env_pmp_15_cfg_r | res_pmp_ignore_15
                          : io_check_env_mode[1]) | ~(|(io_req_bits_cmd[1:0]))
    & ~_resp_pma_resp_mmio_T_6 & ~res_pma_cfg_r;
  assign io_resp_st =
    (io_req_bits_cmd[1:0] == 2'h1 | _resp_pma_resp_mmio_T_6)
    & ~(_res_pmp_T_12
          ? (_res_pmp_T_4
               ? (_res_pmp_T
                    ? (res_pmp_is_match
                         ? io_check_env_pmp_0_cfg_w | res_pmp_ignore
                         : io_check_env_pmp_1_cfg_w | res_pmp_ignore_1)
                    : res_pmp_is_match_2
                        ? io_check_env_pmp_2_cfg_w | res_pmp_ignore_2
                        : io_check_env_pmp_3_cfg_w | res_pmp_ignore_3)
               : _res_pmp_T_6
                   ? (res_pmp_is_match_4
                        ? io_check_env_pmp_4_cfg_w | res_pmp_ignore_4
                        : io_check_env_pmp_5_cfg_w | res_pmp_ignore_5)
                   : res_pmp_is_match_6
                       ? io_check_env_pmp_6_cfg_w | res_pmp_ignore_6
                       : io_check_env_pmp_7_cfg_w | res_pmp_ignore_7)
          : _res_pmp_T_18
              ? (_res_pmp_T_14
                   ? (res_pmp_is_match_8
                        ? io_check_env_pmp_8_cfg_w | res_pmp_ignore_8
                        : io_check_env_pmp_9_cfg_w | res_pmp_ignore_9)
                   : res_pmp_is_match_10
                       ? io_check_env_pmp_10_cfg_w | res_pmp_ignore_10
                       : io_check_env_pmp_11_cfg_w | res_pmp_ignore_11)
              : _res_pmp_T_20
                  ? (res_pmp_is_match_12
                       ? io_check_env_pmp_12_cfg_w | res_pmp_ignore_12
                       : io_check_env_pmp_13_cfg_w | res_pmp_ignore_13)
                  : res_pmp_is_match_14
                      ? io_check_env_pmp_14_cfg_w | res_pmp_ignore_14
                      : res_pmp_is_match_15
                          ? io_check_env_pmp_15_cfg_w | res_pmp_ignore_15
                          : io_check_env_mode[1])
    | (io_req_bits_cmd[1:0] == 2'h1 | _resp_pma_resp_mmio_T_6 & resp_atomic)
    & ~res_pma_cfg_w;
  assign io_resp_instr =
    io_req_bits_cmd[1:0] == 2'h2
    & ~(_res_pmp_T_12
          ? (_res_pmp_T_4
               ? (_res_pmp_T
                    ? (res_pmp_is_match
                         ? io_check_env_pmp_0_cfg_x | res_pmp_ignore
                         : io_check_env_pmp_1_cfg_x | res_pmp_ignore_1)
                    : res_pmp_is_match_2
                        ? io_check_env_pmp_2_cfg_x | res_pmp_ignore_2
                        : io_check_env_pmp_3_cfg_x | res_pmp_ignore_3)
               : _res_pmp_T_6
                   ? (res_pmp_is_match_4
                        ? io_check_env_pmp_4_cfg_x | res_pmp_ignore_4
                        : io_check_env_pmp_5_cfg_x | res_pmp_ignore_5)
                   : res_pmp_is_match_6
                       ? io_check_env_pmp_6_cfg_x | res_pmp_ignore_6
                       : io_check_env_pmp_7_cfg_x | res_pmp_ignore_7)
          : _res_pmp_T_18
              ? (_res_pmp_T_14
                   ? (res_pmp_is_match_8
                        ? io_check_env_pmp_8_cfg_x | res_pmp_ignore_8
                        : io_check_env_pmp_9_cfg_x | res_pmp_ignore_9)
                   : res_pmp_is_match_10
                       ? io_check_env_pmp_10_cfg_x | res_pmp_ignore_10
                       : io_check_env_pmp_11_cfg_x | res_pmp_ignore_11)
              : _res_pmp_T_20
                  ? (res_pmp_is_match_12
                       ? io_check_env_pmp_12_cfg_x | res_pmp_ignore_12
                       : io_check_env_pmp_13_cfg_x | res_pmp_ignore_13)
                  : res_pmp_is_match_14
                      ? io_check_env_pmp_14_cfg_x | res_pmp_ignore_14
                      : res_pmp_is_match_15
                          ? io_check_env_pmp_15_cfg_x | res_pmp_ignore_15
                          : io_check_env_mode[1]) | io_req_bits_cmd[1:0] == 2'h2
    & ~res_pma_cfg_x;
  assign io_resp_mmio =
    ~(_res_pma_T_12
        ? (_res_pma_T_4
             ? (_res_pma_T
                  ? (res_pma_is_match
                       ? io_check_env_pma_0_cfg_c
                       : io_check_env_pma_1_cfg_c)
                  : res_pma_is_match_2
                      ? io_check_env_pma_2_cfg_c
                      : io_check_env_pma_3_cfg_c)
             : _res_pma_T_6
                 ? (res_pma_is_match_4
                      ? io_check_env_pma_4_cfg_c
                      : io_check_env_pma_5_cfg_c)
                 : res_pma_is_match_6
                     ? io_check_env_pma_6_cfg_c
                     : io_check_env_pma_7_cfg_c)
        : _res_pma_T_18
            ? (_res_pma_T_14
                 ? (res_pma_is_match_8
                      ? io_check_env_pma_8_cfg_c
                      : io_check_env_pma_9_cfg_c)
                 : res_pma_is_match_10
                     ? io_check_env_pma_10_cfg_c
                     : io_check_env_pma_11_cfg_c)
            : _res_pma_T_20
                ? (res_pma_is_match_12
                     ? io_check_env_pma_12_cfg_c
                     : io_check_env_pma_13_cfg_c)
                : res_pma_is_match_14
                    ? io_check_env_pma_14_cfg_c
                    : res_pma_is_match_15 & io_check_env_pma_15_cfg_c)
    & (~(|(io_req_bits_cmd[1:0])) & res_pma_cfg_r
       | (io_req_bits_cmd[1:0] == 2'h1 | _resp_pma_resp_mmio_T_6 & resp_atomic)
       & res_pma_cfg_w | io_req_bits_cmd[1:0] == 2'h2 & res_pma_cfg_x);
  assign io_resp_atomic = resp_atomic;
endmodule

