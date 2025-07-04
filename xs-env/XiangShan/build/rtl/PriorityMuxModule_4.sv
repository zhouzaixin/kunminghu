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

module PriorityMuxModule_4(
  input         s2_FGH_sel,
  input  [10:0] s2_FGH_src_hist_17_folded_hist,
  input  [10:0] s2_FGH_src_hist_16_folded_hist,
  input  [6:0]  s2_FGH_src_hist_15_folded_hist,
  input  [7:0]  s2_FGH_src_hist_14_folded_hist,
  input  [8:0]  s2_FGH_src_hist_13_folded_hist,
  input  [3:0]  s2_FGH_src_hist_12_folded_hist,
  input  [7:0]  s2_FGH_src_hist_11_folded_hist,
  input  [8:0]  s2_FGH_src_hist_10_folded_hist,
  input  [6:0]  s2_FGH_src_hist_9_folded_hist,
  input  [7:0]  s2_FGH_src_hist_8_folded_hist,
  input  [6:0]  s2_FGH_src_hist_7_folded_hist,
  input  [8:0]  s2_FGH_src_hist_6_folded_hist,
  input  [6:0]  s2_FGH_src_hist_5_folded_hist,
  input  [7:0]  s2_FGH_src_hist_4_folded_hist,
  input  [7:0]  s2_FGH_src_hist_3_folded_hist,
  input  [7:0]  s2_FGH_src_hist_2_folded_hist,
  input  [10:0] s2_FGH_src_hist_1_folded_hist,
  input         s1_FGH_sel,
  input  [10:0] s1_FGH_src_hist_17_folded_hist,
  input  [10:0] s1_FGH_src_hist_16_folded_hist,
  input  [6:0]  s1_FGH_src_hist_15_folded_hist,
  input  [7:0]  s1_FGH_src_hist_14_folded_hist,
  input  [8:0]  s1_FGH_src_hist_13_folded_hist,
  input  [3:0]  s1_FGH_src_hist_12_folded_hist,
  input  [7:0]  s1_FGH_src_hist_11_folded_hist,
  input  [8:0]  s1_FGH_src_hist_10_folded_hist,
  input  [6:0]  s1_FGH_src_hist_9_folded_hist,
  input  [7:0]  s1_FGH_src_hist_8_folded_hist,
  input  [6:0]  s1_FGH_src_hist_7_folded_hist,
  input  [8:0]  s1_FGH_src_hist_6_folded_hist,
  input  [6:0]  s1_FGH_src_hist_5_folded_hist,
  input  [7:0]  s1_FGH_src_hist_4_folded_hist,
  input  [7:0]  s1_FGH_src_hist_3_folded_hist,
  input  [7:0]  s1_FGH_src_hist_2_folded_hist,
  input  [10:0] s1_FGH_src_hist_1_folded_hist,
  input         s3_FGH_sel,
  input  [10:0] s3_FGH_src_hist_17_folded_hist,
  input  [10:0] s3_FGH_src_hist_16_folded_hist,
  input  [6:0]  s3_FGH_src_hist_15_folded_hist,
  input  [7:0]  s3_FGH_src_hist_14_folded_hist,
  input  [8:0]  s3_FGH_src_hist_13_folded_hist,
  input  [3:0]  s3_FGH_src_hist_12_folded_hist,
  input  [7:0]  s3_FGH_src_hist_11_folded_hist,
  input  [8:0]  s3_FGH_src_hist_10_folded_hist,
  input  [6:0]  s3_FGH_src_hist_9_folded_hist,
  input  [7:0]  s3_FGH_src_hist_8_folded_hist,
  input  [6:0]  s3_FGH_src_hist_7_folded_hist,
  input  [8:0]  s3_FGH_src_hist_6_folded_hist,
  input  [6:0]  s3_FGH_src_hist_5_folded_hist,
  input  [7:0]  s3_FGH_src_hist_4_folded_hist,
  input  [7:0]  s3_FGH_src_hist_3_folded_hist,
  input  [7:0]  s3_FGH_src_hist_2_folded_hist,
  input  [10:0] s3_FGH_src_hist_1_folded_hist,
  input         redirect_FGHT_sel,
  input  [10:0] redirect_FGHT_src_hist_17_folded_hist,
  input  [10:0] redirect_FGHT_src_hist_16_folded_hist,
  input  [6:0]  redirect_FGHT_src_hist_15_folded_hist,
  input  [7:0]  redirect_FGHT_src_hist_14_folded_hist,
  input  [8:0]  redirect_FGHT_src_hist_13_folded_hist,
  input  [3:0]  redirect_FGHT_src_hist_12_folded_hist,
  input  [7:0]  redirect_FGHT_src_hist_11_folded_hist,
  input  [8:0]  redirect_FGHT_src_hist_10_folded_hist,
  input  [6:0]  redirect_FGHT_src_hist_9_folded_hist,
  input  [7:0]  redirect_FGHT_src_hist_8_folded_hist,
  input  [6:0]  redirect_FGHT_src_hist_7_folded_hist,
  input  [8:0]  redirect_FGHT_src_hist_6_folded_hist,
  input  [6:0]  redirect_FGHT_src_hist_5_folded_hist,
  input  [7:0]  redirect_FGHT_src_hist_4_folded_hist,
  input  [7:0]  redirect_FGHT_src_hist_3_folded_hist,
  input  [7:0]  redirect_FGHT_src_hist_2_folded_hist,
  input  [10:0] redirect_FGHT_src_hist_1_folded_hist,
  input  [10:0] stallFGH_src_hist_17_folded_hist,
  input  [10:0] stallFGH_src_hist_16_folded_hist,
  input  [6:0]  stallFGH_src_hist_15_folded_hist,
  input  [7:0]  stallFGH_src_hist_14_folded_hist,
  input  [8:0]  stallFGH_src_hist_13_folded_hist,
  input  [3:0]  stallFGH_src_hist_12_folded_hist,
  input  [7:0]  stallFGH_src_hist_11_folded_hist,
  input  [8:0]  stallFGH_src_hist_10_folded_hist,
  input  [6:0]  stallFGH_src_hist_9_folded_hist,
  input  [7:0]  stallFGH_src_hist_8_folded_hist,
  input  [6:0]  stallFGH_src_hist_7_folded_hist,
  input  [8:0]  stallFGH_src_hist_6_folded_hist,
  input  [6:0]  stallFGH_src_hist_5_folded_hist,
  input  [7:0]  stallFGH_src_hist_4_folded_hist,
  input  [7:0]  stallFGH_src_hist_3_folded_hist,
  input  [7:0]  stallFGH_src_hist_2_folded_hist,
  input  [10:0] stallFGH_src_hist_1_folded_hist,
  output [10:0] out_res_hist_17_folded_hist,
  output [10:0] out_res_hist_16_folded_hist,
  output [6:0]  out_res_hist_15_folded_hist,
  output [7:0]  out_res_hist_14_folded_hist,
  output [8:0]  out_res_hist_13_folded_hist,
  output [3:0]  out_res_hist_12_folded_hist,
  output [7:0]  out_res_hist_11_folded_hist,
  output [8:0]  out_res_hist_10_folded_hist,
  output [6:0]  out_res_hist_9_folded_hist,
  output [7:0]  out_res_hist_8_folded_hist,
  output [6:0]  out_res_hist_7_folded_hist,
  output [8:0]  out_res_hist_6_folded_hist,
  output [6:0]  out_res_hist_5_folded_hist,
  output [7:0]  out_res_hist_4_folded_hist,
  output [7:0]  out_res_hist_3_folded_hist,
  output [7:0]  out_res_hist_2_folded_hist,
  output [10:0] out_res_hist_1_folded_hist
);

  assign out_res_hist_17_folded_hist =
    s2_FGH_sel
      ? s2_FGH_src_hist_17_folded_hist
      : s1_FGH_sel
          ? s1_FGH_src_hist_17_folded_hist
          : s3_FGH_sel
              ? s3_FGH_src_hist_17_folded_hist
              : redirect_FGHT_sel
                  ? redirect_FGHT_src_hist_17_folded_hist
                  : stallFGH_src_hist_17_folded_hist;
  assign out_res_hist_16_folded_hist =
    s2_FGH_sel
      ? s2_FGH_src_hist_16_folded_hist
      : s1_FGH_sel
          ? s1_FGH_src_hist_16_folded_hist
          : s3_FGH_sel
              ? s3_FGH_src_hist_16_folded_hist
              : redirect_FGHT_sel
                  ? redirect_FGHT_src_hist_16_folded_hist
                  : stallFGH_src_hist_16_folded_hist;
  assign out_res_hist_15_folded_hist =
    s2_FGH_sel
      ? s2_FGH_src_hist_15_folded_hist
      : s1_FGH_sel
          ? s1_FGH_src_hist_15_folded_hist
          : s3_FGH_sel
              ? s3_FGH_src_hist_15_folded_hist
              : redirect_FGHT_sel
                  ? redirect_FGHT_src_hist_15_folded_hist
                  : stallFGH_src_hist_15_folded_hist;
  assign out_res_hist_14_folded_hist =
    s2_FGH_sel
      ? s2_FGH_src_hist_14_folded_hist
      : s1_FGH_sel
          ? s1_FGH_src_hist_14_folded_hist
          : s3_FGH_sel
              ? s3_FGH_src_hist_14_folded_hist
              : redirect_FGHT_sel
                  ? redirect_FGHT_src_hist_14_folded_hist
                  : stallFGH_src_hist_14_folded_hist;
  assign out_res_hist_13_folded_hist =
    s2_FGH_sel
      ? s2_FGH_src_hist_13_folded_hist
      : s1_FGH_sel
          ? s1_FGH_src_hist_13_folded_hist
          : s3_FGH_sel
              ? s3_FGH_src_hist_13_folded_hist
              : redirect_FGHT_sel
                  ? redirect_FGHT_src_hist_13_folded_hist
                  : stallFGH_src_hist_13_folded_hist;
  assign out_res_hist_12_folded_hist =
    s2_FGH_sel
      ? s2_FGH_src_hist_12_folded_hist
      : s1_FGH_sel
          ? s1_FGH_src_hist_12_folded_hist
          : s3_FGH_sel
              ? s3_FGH_src_hist_12_folded_hist
              : redirect_FGHT_sel
                  ? redirect_FGHT_src_hist_12_folded_hist
                  : stallFGH_src_hist_12_folded_hist;
  assign out_res_hist_11_folded_hist =
    s2_FGH_sel
      ? s2_FGH_src_hist_11_folded_hist
      : s1_FGH_sel
          ? s1_FGH_src_hist_11_folded_hist
          : s3_FGH_sel
              ? s3_FGH_src_hist_11_folded_hist
              : redirect_FGHT_sel
                  ? redirect_FGHT_src_hist_11_folded_hist
                  : stallFGH_src_hist_11_folded_hist;
  assign out_res_hist_10_folded_hist =
    s2_FGH_sel
      ? s2_FGH_src_hist_10_folded_hist
      : s1_FGH_sel
          ? s1_FGH_src_hist_10_folded_hist
          : s3_FGH_sel
              ? s3_FGH_src_hist_10_folded_hist
              : redirect_FGHT_sel
                  ? redirect_FGHT_src_hist_10_folded_hist
                  : stallFGH_src_hist_10_folded_hist;
  assign out_res_hist_9_folded_hist =
    s2_FGH_sel
      ? s2_FGH_src_hist_9_folded_hist
      : s1_FGH_sel
          ? s1_FGH_src_hist_9_folded_hist
          : s3_FGH_sel
              ? s3_FGH_src_hist_9_folded_hist
              : redirect_FGHT_sel
                  ? redirect_FGHT_src_hist_9_folded_hist
                  : stallFGH_src_hist_9_folded_hist;
  assign out_res_hist_8_folded_hist =
    s2_FGH_sel
      ? s2_FGH_src_hist_8_folded_hist
      : s1_FGH_sel
          ? s1_FGH_src_hist_8_folded_hist
          : s3_FGH_sel
              ? s3_FGH_src_hist_8_folded_hist
              : redirect_FGHT_sel
                  ? redirect_FGHT_src_hist_8_folded_hist
                  : stallFGH_src_hist_8_folded_hist;
  assign out_res_hist_7_folded_hist =
    s2_FGH_sel
      ? s2_FGH_src_hist_7_folded_hist
      : s1_FGH_sel
          ? s1_FGH_src_hist_7_folded_hist
          : s3_FGH_sel
              ? s3_FGH_src_hist_7_folded_hist
              : redirect_FGHT_sel
                  ? redirect_FGHT_src_hist_7_folded_hist
                  : stallFGH_src_hist_7_folded_hist;
  assign out_res_hist_6_folded_hist =
    s2_FGH_sel
      ? s2_FGH_src_hist_6_folded_hist
      : s1_FGH_sel
          ? s1_FGH_src_hist_6_folded_hist
          : s3_FGH_sel
              ? s3_FGH_src_hist_6_folded_hist
              : redirect_FGHT_sel
                  ? redirect_FGHT_src_hist_6_folded_hist
                  : stallFGH_src_hist_6_folded_hist;
  assign out_res_hist_5_folded_hist =
    s2_FGH_sel
      ? s2_FGH_src_hist_5_folded_hist
      : s1_FGH_sel
          ? s1_FGH_src_hist_5_folded_hist
          : s3_FGH_sel
              ? s3_FGH_src_hist_5_folded_hist
              : redirect_FGHT_sel
                  ? redirect_FGHT_src_hist_5_folded_hist
                  : stallFGH_src_hist_5_folded_hist;
  assign out_res_hist_4_folded_hist =
    s2_FGH_sel
      ? s2_FGH_src_hist_4_folded_hist
      : s1_FGH_sel
          ? s1_FGH_src_hist_4_folded_hist
          : s3_FGH_sel
              ? s3_FGH_src_hist_4_folded_hist
              : redirect_FGHT_sel
                  ? redirect_FGHT_src_hist_4_folded_hist
                  : stallFGH_src_hist_4_folded_hist;
  assign out_res_hist_3_folded_hist =
    s2_FGH_sel
      ? s2_FGH_src_hist_3_folded_hist
      : s1_FGH_sel
          ? s1_FGH_src_hist_3_folded_hist
          : s3_FGH_sel
              ? s3_FGH_src_hist_3_folded_hist
              : redirect_FGHT_sel
                  ? redirect_FGHT_src_hist_3_folded_hist
                  : stallFGH_src_hist_3_folded_hist;
  assign out_res_hist_2_folded_hist =
    s2_FGH_sel
      ? s2_FGH_src_hist_2_folded_hist
      : s1_FGH_sel
          ? s1_FGH_src_hist_2_folded_hist
          : s3_FGH_sel
              ? s3_FGH_src_hist_2_folded_hist
              : redirect_FGHT_sel
                  ? redirect_FGHT_src_hist_2_folded_hist
                  : stallFGH_src_hist_2_folded_hist;
  assign out_res_hist_1_folded_hist =
    s2_FGH_sel
      ? s2_FGH_src_hist_1_folded_hist
      : s1_FGH_sel
          ? s1_FGH_src_hist_1_folded_hist
          : s3_FGH_sel
              ? s3_FGH_src_hist_1_folded_hist
              : redirect_FGHT_sel
                  ? redirect_FGHT_src_hist_1_folded_hist
                  : stallFGH_src_hist_1_folded_hist;
endmodule

