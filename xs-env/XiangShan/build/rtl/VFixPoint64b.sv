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

module VFixPoint64b(
  input  [5:0]  io_opcode_op,
  input  [1:0]  io_info_vxrm,
  input  [3:0]  io_sew_oneHot,
  input         io_isSub,
  input         io_isSigned,
  input         io_isNClip,
  input         io_fromAdder_cout_0,
  input         io_fromAdder_cout_1,
  input         io_fromAdder_cout_2,
  input         io_fromAdder_cout_3,
  input         io_fromAdder_cout_4,
  input         io_fromAdder_cout_5,
  input         io_fromAdder_cout_6,
  input         io_fromAdder_cout_7,
  input  [7:0]  io_fromAdder_vd_0,
  input  [7:0]  io_fromAdder_vd_1,
  input  [7:0]  io_fromAdder_vd_2,
  input  [7:0]  io_fromAdder_vd_3,
  input  [7:0]  io_fromAdder_vd_4,
  input  [7:0]  io_fromAdder_vd_5,
  input  [7:0]  io_fromAdder_vd_6,
  input  [7:0]  io_fromAdder_vd_7,
  input         io_fromAdder_vs2H_0,
  input         io_fromAdder_vs2H_1,
  input         io_fromAdder_vs2H_2,
  input         io_fromAdder_vs2H_3,
  input         io_fromAdder_vs2H_4,
  input         io_fromAdder_vs2H_5,
  input         io_fromAdder_vs2H_6,
  input         io_fromAdder_vs2H_7,
  input         io_fromAdder_vs1H_0,
  input         io_fromAdder_vs1H_1,
  input         io_fromAdder_vs1H_2,
  input         io_fromAdder_vs1H_3,
  input         io_fromAdder_vs1H_4,
  input         io_fromAdder_vs1H_5,
  input         io_fromAdder_vs1H_6,
  input         io_fromAdder_vs1H_7,
  input  [63:0] io_fromMisc_shiftOut,
  input  [7:0]  io_fromMisc_rnd_high,
  input  [7:0]  io_fromMisc_rnd_tail,
  output [63:0] io_vd,
  output [31:0] io_narrowVd,
  output [7:0]  io_vxsat
);

  wire [7:0] _adder_chain_rnd_io_dout_0;
  wire [7:0] _adder_chain_rnd_io_dout_1;
  wire [7:0] _adder_chain_rnd_io_dout_2;
  wire [7:0] _adder_chain_rnd_io_dout_3;
  wire [7:0] _adder_chain_rnd_io_dout_4;
  wire [7:0] _adder_chain_rnd_io_dout_5;
  wire [7:0] _adder_chain_rnd_io_dout_6;
  wire [7:0] _adder_chain_rnd_io_dout_7;
  wire       _adder_chain_rnd_io_cout_0;
  wire       _adder_chain_rnd_io_cout_1;
  wire       _adder_chain_rnd_io_cout_2;
  wire       _adder_chain_rnd_io_cout_3;
  wire       _adder_chain_rnd_io_cout_4;
  wire       _adder_chain_rnd_io_cout_5;
  wire       _adder_chain_rnd_io_cout_6;
  wire       _adder_chain_rnd_io_all_1s_1;
  wire       _adder_chain_rnd_io_all_1s_2;
  wire       _adder_chain_rnd_io_all_1s_3;
  wire       _adder_chain_rnd_io_all_1s_4;
  wire       _adder_chain_rnd_io_all_1s_5;
  wire       _adder_chain_rnd_io_all_1s_6;
  wire       _adder_chain_rnd_io_all_1s_7;
  wire       _adder_chain_rnd_io_all_0s_1;
  wire       _adder_chain_rnd_io_all_0s_2;
  wire       _adder_chain_rnd_io_all_0s_3;
  wire       _adder_chain_rnd_io_all_0s_4;
  wire       _adder_chain_rnd_io_all_0s_5;
  wire       _adder_chain_rnd_io_all_0s_6;
  wire       _adder_chain_rnd_io_all_0s_7;
  wire       sat_1 =
    io_isSigned
      ? (io_isSub
           ? io_fromAdder_vs2H_1 != io_fromAdder_vs1H_1
           : io_fromAdder_vs2H_1 == io_fromAdder_vs1H_1)
        & io_fromAdder_vs2H_1 != io_fromAdder_vd_1[7]
      : io_fromAdder_cout_1 ^ io_isSub;
  wire       sat_3 =
    io_isSigned
      ? (io_isSub
           ? io_fromAdder_vs2H_3 != io_fromAdder_vs1H_3
           : io_fromAdder_vs2H_3 == io_fromAdder_vs1H_3)
        & io_fromAdder_vs2H_3 != io_fromAdder_vd_3[7]
      : io_fromAdder_cout_3 ^ io_isSub;
  wire       sat_5 =
    io_isSigned
      ? (io_isSub
           ? io_fromAdder_vs2H_5 != io_fromAdder_vs1H_5
           : io_fromAdder_vs2H_5 == io_fromAdder_vs1H_5)
        & io_fromAdder_vs2H_5 != io_fromAdder_vd_5[7]
      : io_fromAdder_cout_5 ^ io_isSub;
  wire       sat_7 =
    io_isSigned
      ? (io_isSub
           ? io_fromAdder_vs2H_7 != io_fromAdder_vs1H_7
           : io_fromAdder_vs2H_7 == io_fromAdder_vs1H_7)
        & io_fromAdder_vs2H_7 != io_fromAdder_vd_7[7]
      : io_fromAdder_cout_7 ^ io_isSub;
  wire [7:0] saturate =
    (io_sew_oneHot[0]
       ? {sat_7,
          io_isSigned
            ? (io_isSub
                 ? io_fromAdder_vs2H_6 != io_fromAdder_vs1H_6
                 : io_fromAdder_vs2H_6 == io_fromAdder_vs1H_6)
              & io_fromAdder_vs2H_6 != io_fromAdder_vd_6[7]
            : io_fromAdder_cout_6 ^ io_isSub,
          sat_5,
          io_isSigned
            ? (io_isSub
                 ? io_fromAdder_vs2H_4 != io_fromAdder_vs1H_4
                 : io_fromAdder_vs2H_4 == io_fromAdder_vs1H_4)
              & io_fromAdder_vs2H_4 != io_fromAdder_vd_4[7]
            : io_fromAdder_cout_4 ^ io_isSub,
          sat_3,
          io_isSigned
            ? (io_isSub
                 ? io_fromAdder_vs2H_2 != io_fromAdder_vs1H_2
                 : io_fromAdder_vs2H_2 == io_fromAdder_vs1H_2)
              & io_fromAdder_vs2H_2 != io_fromAdder_vd_2[7]
            : io_fromAdder_cout_2 ^ io_isSub,
          sat_1,
          io_isSigned
            ? (io_isSub
                 ? io_fromAdder_vs2H_0 != io_fromAdder_vs1H_0
                 : io_fromAdder_vs2H_0 == io_fromAdder_vs1H_0)
              & io_fromAdder_vs2H_0 != io_fromAdder_vd_0[7]
            : io_fromAdder_cout_0 ^ io_isSub}
       : 8'h0)
    | (io_sew_oneHot[1] ? {{2{sat_7}}, {2{sat_5}}, {2{sat_3}}, {2{sat_1}}} : 8'h0)
    | (io_sew_oneHot[2] ? {{4{sat_7}}, {4{sat_3}}} : 8'h0)
    | {8{io_sew_oneHot[3] & sat_7}};
  wire       highestBits_1 = io_sew_oneHot[0] | io_sew_oneHot[1];
  wire       highestBits_3 = io_sew_oneHot[0] | io_sew_oneHot[1] | io_sew_oneHot[2];
  wire       highestBits_5 = io_sew_oneHot[0] | io_sew_oneHot[1];
  wire       highBitAvg_1 =
    io_fromAdder_cout_1 ^ io_isSub ^ io_isSigned
    & (io_fromAdder_vs1H_1 ^ io_fromAdder_vs2H_1);
  wire       highBitAvg_3 =
    io_fromAdder_cout_3 ^ io_isSub ^ io_isSigned
    & (io_fromAdder_vs1H_3 ^ io_fromAdder_vs2H_3);
  wire       highBitAvg_5 =
    io_fromAdder_cout_5 ^ io_isSub ^ io_isSigned
    & (io_fromAdder_vs1H_5 ^ io_fromAdder_vs2H_5);
  wire       highBitAvg_7 =
    io_fromAdder_cout_7 ^ io_isSub ^ io_isSigned
    & (io_fromAdder_vs1H_7 ^ io_fromAdder_vs2H_7);
  wire       _shiftRndInc_7_T = io_info_vxrm == 2'h0;
  wire       _shiftRndInc_7_T_2 = io_info_vxrm == 2'h1;
  wire       _rndInc_T_21 = io_opcode_op == 6'h1F;
  wire       _rndInc_T_22 = io_opcode_op == 6'h20;
  wire       _nclipResult32_T_5 =
    _adder_chain_rnd_io_all_0s_4 & _adder_chain_rnd_io_all_0s_5
    & _adder_chain_rnd_io_all_0s_6 & _adder_chain_rnd_io_all_0s_7;
  wire       _nclipResult32_T_16 =
    _nclipResult32_T_5 & ~_adder_chain_rnd_io_cout_3 & ~(_adder_chain_rnd_io_dout_3[7])
    | _adder_chain_rnd_io_all_1s_4 & _adder_chain_rnd_io_all_1s_5
    & _adder_chain_rnd_io_all_1s_6 & _adder_chain_rnd_io_all_1s_7
    & (_adder_chain_rnd_io_cout_3 | ~_adder_chain_rnd_io_cout_3
       & _adder_chain_rnd_io_dout_3[7]);
  wire       _nclipResult32_T_18 = _nclipResult32_T_5 & ~_adder_chain_rnd_io_cout_3;
  wire       _nclipResult16_T_3 =
    _adder_chain_rnd_io_all_0s_2 & _adder_chain_rnd_io_all_0s_3;
  wire       _nclipResult16_T_14 =
    _nclipResult16_T_3 & ~_adder_chain_rnd_io_cout_1 & ~(_adder_chain_rnd_io_dout_1[7])
    | _adder_chain_rnd_io_all_1s_2 & _adder_chain_rnd_io_all_1s_3
    & (_adder_chain_rnd_io_cout_1 | ~_adder_chain_rnd_io_cout_1
       & _adder_chain_rnd_io_dout_1[7]);
  wire       _nclipResult16_T_16 = _nclipResult16_T_3 & ~_adder_chain_rnd_io_cout_1;
  wire       _nclipResult16_T_18 =
    _adder_chain_rnd_io_all_0s_6 & _adder_chain_rnd_io_all_0s_7;
  wire       _nclipResult16_T_29 =
    _nclipResult16_T_18 & ~_adder_chain_rnd_io_cout_5 & ~(_adder_chain_rnd_io_dout_5[7])
    | _adder_chain_rnd_io_all_1s_6 & _adder_chain_rnd_io_all_1s_7
    & (_adder_chain_rnd_io_cout_5 | ~_adder_chain_rnd_io_cout_5
       & _adder_chain_rnd_io_dout_5[7]);
  wire       _nclipResult16_T_31 = _nclipResult16_T_18 & ~_adder_chain_rnd_io_cout_5;
  wire       _nclipResult8_T_14 =
    _adder_chain_rnd_io_all_0s_1 & ~_adder_chain_rnd_io_cout_0
    & ~(_adder_chain_rnd_io_dout_0[7]) | _adder_chain_rnd_io_all_1s_1
    & (_adder_chain_rnd_io_cout_0 | ~_adder_chain_rnd_io_cout_0
       & _adder_chain_rnd_io_dout_0[7]);
  wire       _nclipResult8_T_16 =
    _adder_chain_rnd_io_all_0s_1 & ~_adder_chain_rnd_io_cout_0;
  wire       _nclipResult8_T_27 =
    _adder_chain_rnd_io_all_0s_3 & ~_adder_chain_rnd_io_cout_2
    & ~(_adder_chain_rnd_io_dout_2[7]) | _adder_chain_rnd_io_all_1s_3
    & (_adder_chain_rnd_io_cout_2 | ~_adder_chain_rnd_io_cout_2
       & _adder_chain_rnd_io_dout_2[7]);
  wire       _nclipResult8_T_29 =
    _adder_chain_rnd_io_all_0s_3 & ~_adder_chain_rnd_io_cout_2;
  wire       _nclipResult8_T_40 =
    _adder_chain_rnd_io_all_0s_5 & ~_adder_chain_rnd_io_cout_4
    & ~(_adder_chain_rnd_io_dout_4[7]) | _adder_chain_rnd_io_all_1s_5
    & (_adder_chain_rnd_io_cout_4 | ~_adder_chain_rnd_io_cout_4
       & _adder_chain_rnd_io_dout_4[7]);
  wire       _nclipResult8_T_42 =
    _adder_chain_rnd_io_all_0s_5 & ~_adder_chain_rnd_io_cout_4;
  wire       _nclipResult8_T_53 =
    _adder_chain_rnd_io_all_0s_7 & ~_adder_chain_rnd_io_cout_6
    & ~(_adder_chain_rnd_io_dout_6[7]) | _adder_chain_rnd_io_all_1s_7
    & (_adder_chain_rnd_io_cout_6 | ~_adder_chain_rnd_io_cout_6
       & _adder_chain_rnd_io_dout_6[7]);
  wire       _nclipResult8_T_55 =
    _adder_chain_rnd_io_all_0s_7 & ~_adder_chain_rnd_io_cout_6;
  wire       _io_vd_T = io_opcode_op == 6'h1B;
  wire       _io_vd_T_1 = io_opcode_op == 6'h1C;
  Adder_chain_rnd adder_chain_rnd (
    .io_din_0
      (_rndInc_T_21 | _rndInc_T_22
         ? io_fromMisc_shiftOut[7:0]
         : {io_sew_oneHot[0]
              & (io_fromAdder_cout_0 ^ io_isSub ^ io_isSigned
                 & (io_fromAdder_vs1H_0 ^ io_fromAdder_vs2H_0)) | io_sew_oneHot[1]
              & io_fromAdder_vd_1[0] | io_sew_oneHot[2] & io_fromAdder_vd_1[0]
              | io_sew_oneHot[3] & io_fromAdder_vd_1[0],
            io_fromAdder_vd_0[7:1]}),
    .io_din_1
      (_rndInc_T_21 | _rndInc_T_22
         ? io_fromMisc_shiftOut[15:8]
         : {io_sew_oneHot[0] & highBitAvg_1 | io_sew_oneHot[1] & highBitAvg_1
              | io_sew_oneHot[2] & io_fromAdder_vd_2[0] | io_sew_oneHot[3]
              & io_fromAdder_vd_2[0],
            io_fromAdder_vd_1[7:1]}),
    .io_din_2
      (_rndInc_T_21 | _rndInc_T_22
         ? io_fromMisc_shiftOut[23:16]
         : {io_sew_oneHot[0]
              & (io_fromAdder_cout_2 ^ io_isSub ^ io_isSigned
                 & (io_fromAdder_vs1H_2 ^ io_fromAdder_vs2H_2)) | io_sew_oneHot[1]
              & io_fromAdder_vd_3[0] | io_sew_oneHot[2] & io_fromAdder_vd_3[0]
              | io_sew_oneHot[3] & io_fromAdder_vd_3[0],
            io_fromAdder_vd_2[7:1]}),
    .io_din_3
      (_rndInc_T_21 | _rndInc_T_22
         ? io_fromMisc_shiftOut[31:24]
         : {io_sew_oneHot[0] & highBitAvg_3 | io_sew_oneHot[1] & highBitAvg_3
              | io_sew_oneHot[2] & highBitAvg_3 | io_sew_oneHot[3] & io_fromAdder_vd_4[0],
            io_fromAdder_vd_3[7:1]}),
    .io_din_4
      (_rndInc_T_21 | _rndInc_T_22
         ? io_fromMisc_shiftOut[39:32]
         : {io_sew_oneHot[0]
              & (io_fromAdder_cout_4 ^ io_isSub ^ io_isSigned
                 & (io_fromAdder_vs1H_4 ^ io_fromAdder_vs2H_4)) | io_sew_oneHot[1]
              & io_fromAdder_vd_5[0] | io_sew_oneHot[2] & io_fromAdder_vd_5[0]
              | io_sew_oneHot[3] & io_fromAdder_vd_5[0],
            io_fromAdder_vd_4[7:1]}),
    .io_din_5
      (_rndInc_T_21 | _rndInc_T_22
         ? io_fromMisc_shiftOut[47:40]
         : {io_sew_oneHot[0] & highBitAvg_5 | io_sew_oneHot[1] & highBitAvg_5
              | io_sew_oneHot[2] & io_fromAdder_vd_6[0] | io_sew_oneHot[3]
              & io_fromAdder_vd_6[0],
            io_fromAdder_vd_5[7:1]}),
    .io_din_6
      (_rndInc_T_21 | _rndInc_T_22
         ? io_fromMisc_shiftOut[55:48]
         : {io_sew_oneHot[0]
              & (io_fromAdder_cout_6 ^ io_isSub ^ io_isSigned
                 & (io_fromAdder_vs1H_6 ^ io_fromAdder_vs2H_6)) | io_sew_oneHot[1]
              & io_fromAdder_vd_7[0] | io_sew_oneHot[2] & io_fromAdder_vd_7[0]
              | io_sew_oneHot[3] & io_fromAdder_vd_7[0],
            io_fromAdder_vd_6[7:1]}),
    .io_din_7
      (_rndInc_T_21 | _rndInc_T_22
         ? io_fromMisc_shiftOut[63:56]
         : {io_sew_oneHot[0] & highBitAvg_7 | io_sew_oneHot[1] & highBitAvg_7
              | io_sew_oneHot[2] & highBitAvg_7 | io_sew_oneHot[3] & highBitAvg_7,
            io_fromAdder_vd_7[7:1]}),
    .io_rndInc_0
      (_rndInc_T_21 | _rndInc_T_22
         ? _shiftRndInc_7_T & io_fromMisc_rnd_high[0] | _shiftRndInc_7_T_2
           & io_fromMisc_rnd_high[0]
           & (~(io_fromMisc_rnd_tail[0]) | io_fromMisc_shiftOut[0]) | (&io_info_vxrm)
           & ~(io_fromMisc_shiftOut[0])
           & (io_fromMisc_rnd_high[0] | ~(io_fromMisc_rnd_tail[0]))
         : _shiftRndInc_7_T & io_fromAdder_vd_0[0] | _shiftRndInc_7_T_2
           & io_fromAdder_vd_0[0] & io_fromAdder_vd_0[1] | (&io_info_vxrm)
           & ~(io_fromAdder_vd_0[1]) & io_fromAdder_vd_0[0]),
    .io_rndInc_1
      (_rndInc_T_21 | _rndInc_T_22
         ? _shiftRndInc_7_T & io_fromMisc_rnd_high[1] | _shiftRndInc_7_T_2
           & io_fromMisc_rnd_high[1]
           & (~(io_fromMisc_rnd_tail[1]) | io_fromMisc_shiftOut[8]) | (&io_info_vxrm)
           & ~(io_fromMisc_shiftOut[8])
           & (io_fromMisc_rnd_high[1] | ~(io_fromMisc_rnd_tail[1]))
         : _shiftRndInc_7_T & io_fromAdder_vd_1[0] | _shiftRndInc_7_T_2
           & io_fromAdder_vd_1[0] & io_fromAdder_vd_1[1] | (&io_info_vxrm)
           & ~(io_fromAdder_vd_1[1]) & io_fromAdder_vd_1[0]),
    .io_rndInc_2
      (_rndInc_T_21 | _rndInc_T_22
         ? _shiftRndInc_7_T & io_fromMisc_rnd_high[2] | _shiftRndInc_7_T_2
           & io_fromMisc_rnd_high[2]
           & (~(io_fromMisc_rnd_tail[2]) | io_fromMisc_shiftOut[16]) | (&io_info_vxrm)
           & ~(io_fromMisc_shiftOut[16])
           & (io_fromMisc_rnd_high[2] | ~(io_fromMisc_rnd_tail[2]))
         : _shiftRndInc_7_T & io_fromAdder_vd_2[0] | _shiftRndInc_7_T_2
           & io_fromAdder_vd_2[0] & io_fromAdder_vd_2[1] | (&io_info_vxrm)
           & ~(io_fromAdder_vd_2[1]) & io_fromAdder_vd_2[0]),
    .io_rndInc_3
      (_rndInc_T_21 | _rndInc_T_22
         ? _shiftRndInc_7_T & io_fromMisc_rnd_high[3] | _shiftRndInc_7_T_2
           & io_fromMisc_rnd_high[3]
           & (~(io_fromMisc_rnd_tail[3]) | io_fromMisc_shiftOut[24]) | (&io_info_vxrm)
           & ~(io_fromMisc_shiftOut[24])
           & (io_fromMisc_rnd_high[3] | ~(io_fromMisc_rnd_tail[3]))
         : _shiftRndInc_7_T & io_fromAdder_vd_3[0] | _shiftRndInc_7_T_2
           & io_fromAdder_vd_3[0] & io_fromAdder_vd_3[1] | (&io_info_vxrm)
           & ~(io_fromAdder_vd_3[1]) & io_fromAdder_vd_3[0]),
    .io_rndInc_4
      (_rndInc_T_21 | _rndInc_T_22
         ? _shiftRndInc_7_T & io_fromMisc_rnd_high[4] | _shiftRndInc_7_T_2
           & io_fromMisc_rnd_high[4]
           & (~(io_fromMisc_rnd_tail[4]) | io_fromMisc_shiftOut[32]) | (&io_info_vxrm)
           & ~(io_fromMisc_shiftOut[32])
           & (io_fromMisc_rnd_high[4] | ~(io_fromMisc_rnd_tail[4]))
         : _shiftRndInc_7_T & io_fromAdder_vd_4[0] | _shiftRndInc_7_T_2
           & io_fromAdder_vd_4[0] & io_fromAdder_vd_4[1] | (&io_info_vxrm)
           & ~(io_fromAdder_vd_4[1]) & io_fromAdder_vd_4[0]),
    .io_rndInc_5
      (_rndInc_T_21 | _rndInc_T_22
         ? _shiftRndInc_7_T & io_fromMisc_rnd_high[5] | _shiftRndInc_7_T_2
           & io_fromMisc_rnd_high[5]
           & (~(io_fromMisc_rnd_tail[5]) | io_fromMisc_shiftOut[40]) | (&io_info_vxrm)
           & ~(io_fromMisc_shiftOut[40])
           & (io_fromMisc_rnd_high[5] | ~(io_fromMisc_rnd_tail[5]))
         : _shiftRndInc_7_T & io_fromAdder_vd_5[0] | _shiftRndInc_7_T_2
           & io_fromAdder_vd_5[0] & io_fromAdder_vd_5[1] | (&io_info_vxrm)
           & ~(io_fromAdder_vd_5[1]) & io_fromAdder_vd_5[0]),
    .io_rndInc_6
      (_rndInc_T_21 | _rndInc_T_22
         ? _shiftRndInc_7_T & io_fromMisc_rnd_high[6] | _shiftRndInc_7_T_2
           & io_fromMisc_rnd_high[6]
           & (~(io_fromMisc_rnd_tail[6]) | io_fromMisc_shiftOut[48]) | (&io_info_vxrm)
           & ~(io_fromMisc_shiftOut[48])
           & (io_fromMisc_rnd_high[6] | ~(io_fromMisc_rnd_tail[6]))
         : _shiftRndInc_7_T & io_fromAdder_vd_6[0] | _shiftRndInc_7_T_2
           & io_fromAdder_vd_6[0] & io_fromAdder_vd_6[1] | (&io_info_vxrm)
           & ~(io_fromAdder_vd_6[1]) & io_fromAdder_vd_6[0]),
    .io_rndInc_7
      (_rndInc_T_21 | _rndInc_T_22
         ? _shiftRndInc_7_T & io_fromMisc_rnd_high[7] | _shiftRndInc_7_T_2
           & io_fromMisc_rnd_high[7]
           & (~(io_fromMisc_rnd_tail[7]) | io_fromMisc_shiftOut[56]) | (&io_info_vxrm)
           & ~(io_fromMisc_shiftOut[56])
           & (io_fromMisc_rnd_high[7] | ~(io_fromMisc_rnd_tail[7]))
         : _shiftRndInc_7_T & io_fromAdder_vd_7[0] | _shiftRndInc_7_T_2
           & io_fromAdder_vd_7[0] & io_fromAdder_vd_7[1] | (&io_info_vxrm)
           & ~(io_fromAdder_vd_7[1]) & io_fromAdder_vd_7[0]),
    .io_isNClip    (io_isNClip),
    .io_sew_oneHot (io_sew_oneHot),
    .io_dout_0     (_adder_chain_rnd_io_dout_0),
    .io_dout_1     (_adder_chain_rnd_io_dout_1),
    .io_dout_2     (_adder_chain_rnd_io_dout_2),
    .io_dout_3     (_adder_chain_rnd_io_dout_3),
    .io_dout_4     (_adder_chain_rnd_io_dout_4),
    .io_dout_5     (_adder_chain_rnd_io_dout_5),
    .io_dout_6     (_adder_chain_rnd_io_dout_6),
    .io_dout_7     (_adder_chain_rnd_io_dout_7),
    .io_cout_0     (_adder_chain_rnd_io_cout_0),
    .io_cout_1     (_adder_chain_rnd_io_cout_1),
    .io_cout_2     (_adder_chain_rnd_io_cout_2),
    .io_cout_3     (_adder_chain_rnd_io_cout_3),
    .io_cout_4     (_adder_chain_rnd_io_cout_4),
    .io_cout_5     (_adder_chain_rnd_io_cout_5),
    .io_cout_6     (_adder_chain_rnd_io_cout_6),
    .io_all_1s_1   (_adder_chain_rnd_io_all_1s_1),
    .io_all_1s_2   (_adder_chain_rnd_io_all_1s_2),
    .io_all_1s_3   (_adder_chain_rnd_io_all_1s_3),
    .io_all_1s_4   (_adder_chain_rnd_io_all_1s_4),
    .io_all_1s_5   (_adder_chain_rnd_io_all_1s_5),
    .io_all_1s_6   (_adder_chain_rnd_io_all_1s_6),
    .io_all_1s_7   (_adder_chain_rnd_io_all_1s_7),
    .io_all_0s_1   (_adder_chain_rnd_io_all_0s_1),
    .io_all_0s_2   (_adder_chain_rnd_io_all_0s_2),
    .io_all_0s_3   (_adder_chain_rnd_io_all_0s_3),
    .io_all_0s_4   (_adder_chain_rnd_io_all_0s_4),
    .io_all_0s_5   (_adder_chain_rnd_io_all_0s_5),
    .io_all_0s_6   (_adder_chain_rnd_io_all_0s_6),
    .io_all_0s_7   (_adder_chain_rnd_io_all_0s_7)
  );
  assign io_vd =
    _io_vd_T | _io_vd_T_1
      ? {saturate[7]
           ? (io_isSigned
                ? (io_sew_oneHot[0] & io_fromAdder_vs2H_7 | io_sew_oneHot[1]
                   & io_fromAdder_vs2H_7 | io_sew_oneHot[2] & io_fromAdder_vs2H_7
                   | io_sew_oneHot[3] & io_fromAdder_vs2H_7
                     ? {|io_sew_oneHot, 7'h0}
                     : {~(|io_sew_oneHot), 7'h7F})
                : {8{io_sew_oneHot[0] & io_fromAdder_cout_7 | io_sew_oneHot[1]
                       & io_fromAdder_cout_7 | io_sew_oneHot[2] & io_fromAdder_cout_7
                       | io_sew_oneHot[3] & io_fromAdder_cout_7}})
           : io_fromAdder_vd_7,
         saturate[6]
           ? (io_isSigned
                ? (io_sew_oneHot[0] & io_fromAdder_vs2H_6 | io_sew_oneHot[1]
                   & io_fromAdder_vs2H_7 | io_sew_oneHot[2] & io_fromAdder_vs2H_7
                   | io_sew_oneHot[3] & io_fromAdder_vs2H_7
                     ? {io_sew_oneHot[0], 7'h0}
                     : {~(io_sew_oneHot[0]), 7'h7F})
                : {8{io_sew_oneHot[0] & io_fromAdder_cout_6 | io_sew_oneHot[1]
                       & io_fromAdder_cout_7 | io_sew_oneHot[2] & io_fromAdder_cout_7
                       | io_sew_oneHot[3] & io_fromAdder_cout_7}})
           : io_fromAdder_vd_6,
         saturate[5]
           ? (io_isSigned
                ? (io_sew_oneHot[0] & io_fromAdder_vs2H_5 | io_sew_oneHot[1]
                   & io_fromAdder_vs2H_5 | io_sew_oneHot[2] & io_fromAdder_vs2H_7
                   | io_sew_oneHot[3] & io_fromAdder_vs2H_7
                     ? {highestBits_5, 7'h0}
                     : {~highestBits_5, 7'h7F})
                : {8{io_sew_oneHot[0] & io_fromAdder_cout_5 | io_sew_oneHot[1]
                       & io_fromAdder_cout_5 | io_sew_oneHot[2] & io_fromAdder_cout_7
                       | io_sew_oneHot[3] & io_fromAdder_cout_7}})
           : io_fromAdder_vd_5,
         saturate[4]
           ? (io_isSigned
                ? (io_sew_oneHot[0] & io_fromAdder_vs2H_4 | io_sew_oneHot[1]
                   & io_fromAdder_vs2H_5 | io_sew_oneHot[2] & io_fromAdder_vs2H_7
                   | io_sew_oneHot[3] & io_fromAdder_vs2H_7
                     ? {io_sew_oneHot[0], 7'h0}
                     : {~(io_sew_oneHot[0]), 7'h7F})
                : {8{io_sew_oneHot[0] & io_fromAdder_cout_4 | io_sew_oneHot[1]
                       & io_fromAdder_cout_5 | io_sew_oneHot[2] & io_fromAdder_cout_7
                       | io_sew_oneHot[3] & io_fromAdder_cout_7}})
           : io_fromAdder_vd_4,
         saturate[3]
           ? (io_isSigned
                ? (io_sew_oneHot[0] & io_fromAdder_vs2H_3 | io_sew_oneHot[1]
                   & io_fromAdder_vs2H_3 | io_sew_oneHot[2] & io_fromAdder_vs2H_3
                   | io_sew_oneHot[3] & io_fromAdder_vs2H_7
                     ? {highestBits_3, 7'h0}
                     : {~highestBits_3, 7'h7F})
                : {8{io_sew_oneHot[0] & io_fromAdder_cout_3 | io_sew_oneHot[1]
                       & io_fromAdder_cout_3 | io_sew_oneHot[2] & io_fromAdder_cout_3
                       | io_sew_oneHot[3] & io_fromAdder_cout_7}})
           : io_fromAdder_vd_3,
         saturate[2]
           ? (io_isSigned
                ? (io_sew_oneHot[0] & io_fromAdder_vs2H_2 | io_sew_oneHot[1]
                   & io_fromAdder_vs2H_3 | io_sew_oneHot[2] & io_fromAdder_vs2H_3
                   | io_sew_oneHot[3] & io_fromAdder_vs2H_7
                     ? {io_sew_oneHot[0], 7'h0}
                     : {~(io_sew_oneHot[0]), 7'h7F})
                : {8{io_sew_oneHot[0] & io_fromAdder_cout_2 | io_sew_oneHot[1]
                       & io_fromAdder_cout_3 | io_sew_oneHot[2] & io_fromAdder_cout_3
                       | io_sew_oneHot[3] & io_fromAdder_cout_7}})
           : io_fromAdder_vd_2,
         saturate[1]
           ? (io_isSigned
                ? (io_sew_oneHot[0] & io_fromAdder_vs2H_1 | io_sew_oneHot[1]
                   & io_fromAdder_vs2H_1 | io_sew_oneHot[2] & io_fromAdder_vs2H_3
                   | io_sew_oneHot[3] & io_fromAdder_vs2H_7
                     ? {highestBits_1, 7'h0}
                     : {~highestBits_1, 7'h7F})
                : {8{io_sew_oneHot[0] & io_fromAdder_cout_1 | io_sew_oneHot[1]
                       & io_fromAdder_cout_1 | io_sew_oneHot[2] & io_fromAdder_cout_3
                       | io_sew_oneHot[3] & io_fromAdder_cout_7}})
           : io_fromAdder_vd_1,
         saturate[0]
           ? (io_isSigned
                ? (io_sew_oneHot[0] & io_fromAdder_vs2H_0 | io_sew_oneHot[1]
                   & io_fromAdder_vs2H_1 | io_sew_oneHot[2] & io_fromAdder_vs2H_3
                   | io_sew_oneHot[3] & io_fromAdder_vs2H_7
                     ? {io_sew_oneHot[0], 7'h0}
                     : {~(io_sew_oneHot[0]), 7'h7F})
                : {8{io_sew_oneHot[0] & io_fromAdder_cout_0 | io_sew_oneHot[1]
                       & io_fromAdder_cout_1 | io_sew_oneHot[2] & io_fromAdder_cout_3
                       | io_sew_oneHot[3] & io_fromAdder_cout_7}})
           : io_fromAdder_vd_0}
      : {_adder_chain_rnd_io_dout_7,
         _adder_chain_rnd_io_dout_6,
         _adder_chain_rnd_io_dout_5,
         _adder_chain_rnd_io_dout_4,
         _adder_chain_rnd_io_dout_3,
         _adder_chain_rnd_io_dout_2,
         _adder_chain_rnd_io_dout_1,
         _adder_chain_rnd_io_dout_0};
  assign io_narrowVd =
    (io_sew_oneHot[2]
       ? (io_isSigned
            ? (_nclipResult32_T_16
                 ? {_adder_chain_rnd_io_dout_3,
                    _adder_chain_rnd_io_dout_2,
                    _adder_chain_rnd_io_dout_1,
                    _adder_chain_rnd_io_dout_0}
                 : {_adder_chain_rnd_io_dout_7[7],
                    {31{~(_adder_chain_rnd_io_dout_7[7])}}})
            : _nclipResult32_T_18
                ? {_adder_chain_rnd_io_dout_3,
                   _adder_chain_rnd_io_dout_2,
                   _adder_chain_rnd_io_dout_1,
                   _adder_chain_rnd_io_dout_0}
                : 32'hFFFFFFFF)
       : 32'h0)
    | (io_sew_oneHot[1]
         ? {io_isSigned
              ? (_nclipResult16_T_29
                   ? {_adder_chain_rnd_io_dout_5, _adder_chain_rnd_io_dout_4}
                   : {_adder_chain_rnd_io_dout_7[7],
                      {15{~(_adder_chain_rnd_io_dout_7[7])}}})
              : _nclipResult16_T_31
                  ? {_adder_chain_rnd_io_dout_5, _adder_chain_rnd_io_dout_4}
                  : 16'hFFFF,
            io_isSigned
              ? (_nclipResult16_T_14
                   ? {_adder_chain_rnd_io_dout_1, _adder_chain_rnd_io_dout_0}
                   : {_adder_chain_rnd_io_dout_3[7],
                      {15{~(_adder_chain_rnd_io_dout_3[7])}}})
              : _nclipResult16_T_16
                  ? {_adder_chain_rnd_io_dout_1, _adder_chain_rnd_io_dout_0}
                  : 16'hFFFF}
         : 32'h0)
    | (io_sew_oneHot[0]
         ? {io_isSigned
              ? (_nclipResult8_T_53
                   ? _adder_chain_rnd_io_dout_6
                   : {_adder_chain_rnd_io_dout_7[7],
                      {7{~(_adder_chain_rnd_io_dout_7[7])}}})
              : _nclipResult8_T_55 ? _adder_chain_rnd_io_dout_6 : 8'hFF,
            io_isSigned
              ? (_nclipResult8_T_40
                   ? _adder_chain_rnd_io_dout_4
                   : {_adder_chain_rnd_io_dout_5[7],
                      {7{~(_adder_chain_rnd_io_dout_5[7])}}})
              : _nclipResult8_T_42 ? _adder_chain_rnd_io_dout_4 : 8'hFF,
            io_isSigned
              ? (_nclipResult8_T_27
                   ? _adder_chain_rnd_io_dout_2
                   : {_adder_chain_rnd_io_dout_3[7],
                      {7{~(_adder_chain_rnd_io_dout_3[7])}}})
              : _nclipResult8_T_29 ? _adder_chain_rnd_io_dout_2 : 8'hFF,
            io_isSigned
              ? (_nclipResult8_T_14
                   ? _adder_chain_rnd_io_dout_0
                   : {_adder_chain_rnd_io_dout_1[7],
                      {7{~(_adder_chain_rnd_io_dout_1[7])}}})
              : _nclipResult8_T_16 ? _adder_chain_rnd_io_dout_0 : 8'hFF}
         : 32'h0);
  assign io_vxsat =
    io_isNClip
      ? {4'h0,
         {4{io_sew_oneHot[2]
              & (io_isSigned ? ~_nclipResult32_T_16 : ~_nclipResult32_T_18)}}
           | (io_sew_oneHot[1]
                ? {{2{io_isSigned ? ~_nclipResult16_T_29 : ~_nclipResult16_T_31}},
                   {2{io_isSigned ? ~_nclipResult16_T_14 : ~_nclipResult16_T_16}}}
                : 4'h0)
           | (io_sew_oneHot[0]
                ? {io_isSigned ? ~_nclipResult8_T_53 : ~_nclipResult8_T_55,
                   io_isSigned ? ~_nclipResult8_T_40 : ~_nclipResult8_T_42,
                   io_isSigned ? ~_nclipResult8_T_27 : ~_nclipResult8_T_29,
                   io_isSigned ? ~_nclipResult8_T_14 : ~_nclipResult8_T_16}
                : 4'h0)}
      : _io_vd_T | _io_vd_T_1 ? saturate : 8'h0;
endmodule

