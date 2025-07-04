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

module IntToFP_prenorm(
  input  [63:0] io_in_int,
  input         io_in_sign,
  input         io_in_long,
  output [62:0] io_out_norm_int,
  output [5:0]  io_out_lzc,
  output        io_out_is_zero,
  output        io_out_sign
);

  wire [5:0]   _neg_lzc_clz_io_out;
  wire [5:0]   _pos_lzc_clz_io_out;
  wire [63:0]  _lza_io_f;
  wire         in_sign = io_in_sign & (io_in_long ? io_in_int[63] : io_in_int[31]);
  wire [63:0]  in_raw =
    io_in_sign & ~io_in_long ? {{32{io_in_int[31]}}, io_in_int[31:0]} : io_in_int;
  wire [63:0]  in_abs = in_sign ? 64'(~in_raw + 64'h1) : in_raw;
  wire [5:0]   lzc = in_sign ? _neg_lzc_clz_io_out : _pos_lzc_clz_io_out;
  wire         lzc_error =
    in_sign
    & (in_abs
       & {_lza_io_f[63],
          _lza_io_f[62] & ~(_lza_io_f[63]),
          _lza_io_f[61] & _lza_io_f[63:62] == 2'h0,
          _lza_io_f[60] & _lza_io_f[63:61] == 3'h0,
          _lza_io_f[59] & _lza_io_f[63:60] == 4'h0,
          _lza_io_f[58] & _lza_io_f[63:59] == 5'h0,
          _lza_io_f[57] & _lza_io_f[63:58] == 6'h0,
          _lza_io_f[56] & _lza_io_f[63:57] == 7'h0,
          _lza_io_f[55] & _lza_io_f[63:56] == 8'h0,
          _lza_io_f[54] & _lza_io_f[63:55] == 9'h0,
          _lza_io_f[53] & _lza_io_f[63:54] == 10'h0,
          _lza_io_f[52] & _lza_io_f[63:53] == 11'h0,
          _lza_io_f[51] & _lza_io_f[63:52] == 12'h0,
          _lza_io_f[50] & _lza_io_f[63:51] == 13'h0,
          _lza_io_f[49] & _lza_io_f[63:50] == 14'h0,
          _lza_io_f[48] & _lza_io_f[63:49] == 15'h0,
          _lza_io_f[47] & _lza_io_f[63:48] == 16'h0,
          _lza_io_f[46] & _lza_io_f[63:47] == 17'h0,
          _lza_io_f[45] & _lza_io_f[63:46] == 18'h0,
          _lza_io_f[44] & _lza_io_f[63:45] == 19'h0,
          _lza_io_f[43] & _lza_io_f[63:44] == 20'h0,
          _lza_io_f[42] & _lza_io_f[63:43] == 21'h0,
          _lza_io_f[41] & _lza_io_f[63:42] == 22'h0,
          _lza_io_f[40] & _lza_io_f[63:41] == 23'h0,
          _lza_io_f[39] & _lza_io_f[63:40] == 24'h0,
          _lza_io_f[38] & _lza_io_f[63:39] == 25'h0,
          _lza_io_f[37] & _lza_io_f[63:38] == 26'h0,
          _lza_io_f[36] & _lza_io_f[63:37] == 27'h0,
          _lza_io_f[35] & _lza_io_f[63:36] == 28'h0,
          _lza_io_f[34] & _lza_io_f[63:35] == 29'h0,
          _lza_io_f[33] & _lza_io_f[63:34] == 30'h0,
          _lza_io_f[32] & _lza_io_f[63:33] == 31'h0,
          _lza_io_f[31] & _lza_io_f[63:32] == 32'h0,
          _lza_io_f[30] & _lza_io_f[63:31] == 33'h0,
          _lza_io_f[29] & _lza_io_f[63:30] == 34'h0,
          _lza_io_f[28] & _lza_io_f[63:29] == 35'h0,
          _lza_io_f[27] & _lza_io_f[63:28] == 36'h0,
          _lza_io_f[26] & _lza_io_f[63:27] == 37'h0,
          _lza_io_f[25] & _lza_io_f[63:26] == 38'h0,
          _lza_io_f[24] & _lza_io_f[63:25] == 39'h0,
          _lza_io_f[23] & _lza_io_f[63:24] == 40'h0,
          _lza_io_f[22] & _lza_io_f[63:23] == 41'h0,
          _lza_io_f[21] & _lza_io_f[63:22] == 42'h0,
          _lza_io_f[20] & _lza_io_f[63:21] == 43'h0,
          _lza_io_f[19] & _lza_io_f[63:20] == 44'h0,
          _lza_io_f[18] & _lza_io_f[63:19] == 45'h0,
          _lza_io_f[17] & _lza_io_f[63:18] == 46'h0,
          _lza_io_f[16] & _lza_io_f[63:17] == 47'h0,
          _lza_io_f[15] & _lza_io_f[63:16] == 48'h0,
          _lza_io_f[14] & _lza_io_f[63:15] == 49'h0,
          _lza_io_f[13] & _lza_io_f[63:14] == 50'h0,
          _lza_io_f[12] & _lza_io_f[63:13] == 51'h0,
          _lza_io_f[11] & _lza_io_f[63:12] == 52'h0,
          _lza_io_f[10] & _lza_io_f[63:11] == 53'h0,
          _lza_io_f[9] & _lza_io_f[63:10] == 54'h0,
          _lza_io_f[8] & _lza_io_f[63:9] == 55'h0,
          _lza_io_f[7] & _lza_io_f[63:8] == 56'h0,
          _lza_io_f[6] & _lza_io_f[63:7] == 57'h0,
          _lza_io_f[5] & _lza_io_f[63:6] == 58'h0,
          _lza_io_f[4] & _lza_io_f[63:5] == 59'h0,
          _lza_io_f[3] & _lza_io_f[63:4] == 60'h0,
          _lza_io_f[2] & _lza_io_f[63:3] == 61'h0,
          _lza_io_f[1] & _lza_io_f[63:2] == 62'h0,
          _lza_io_f[63:1] == 63'h0}) == 64'h0;
  wire [126:0] _in_shift_s1_T = {63'h0, in_abs} << lzc;
  LZA lza (
    .io_b (~in_raw),
    .io_f (_lza_io_f)
  );
  CLZ pos_lzc_clz (
    .io_in  (io_in_int),
    .io_out (_pos_lzc_clz_io_out)
  );
  CLZ neg_lzc_clz (
    .io_in  (_lza_io_f),
    .io_out (_neg_lzc_clz_io_out)
  );
  assign io_out_norm_int =
    lzc_error ? {_in_shift_s1_T[61:0], 1'h0} : _in_shift_s1_T[62:0];
  assign io_out_lzc = 6'(lzc + {5'h0, lzc_error});
  assign io_out_is_zero = io_in_int == 64'h0;
  assign io_out_sign = in_sign;
endmodule

