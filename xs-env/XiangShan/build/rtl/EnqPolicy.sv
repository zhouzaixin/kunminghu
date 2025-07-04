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

module EnqPolicy(
  input  [21:0] io_canEnq,
  output        io_enqSelOHVec_0_valid,
  output [21:0] io_enqSelOHVec_0_bits,
  output        io_enqSelOHVec_1_valid,
  output [21:0] io_enqSelOHVec_1_bits
);

  assign io_enqSelOHVec_0_valid = |io_canEnq;
  assign io_enqSelOHVec_0_bits =
    {io_canEnq[21]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8],
          io_canEnq[9],
          io_canEnq[10],
          io_canEnq[11],
          io_canEnq[12],
          io_canEnq[13],
          io_canEnq[14],
          io_canEnq[15],
          io_canEnq[16],
          io_canEnq[17],
          io_canEnq[18],
          io_canEnq[19],
          io_canEnq[20]} == 21'h0,
     io_canEnq[20]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8],
          io_canEnq[9],
          io_canEnq[10],
          io_canEnq[11],
          io_canEnq[12],
          io_canEnq[13],
          io_canEnq[14],
          io_canEnq[15],
          io_canEnq[16],
          io_canEnq[17],
          io_canEnq[18],
          io_canEnq[19]} == 20'h0,
     io_canEnq[19]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8],
          io_canEnq[9],
          io_canEnq[10],
          io_canEnq[11],
          io_canEnq[12],
          io_canEnq[13],
          io_canEnq[14],
          io_canEnq[15],
          io_canEnq[16],
          io_canEnq[17],
          io_canEnq[18]} == 19'h0,
     io_canEnq[18]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8],
          io_canEnq[9],
          io_canEnq[10],
          io_canEnq[11],
          io_canEnq[12],
          io_canEnq[13],
          io_canEnq[14],
          io_canEnq[15],
          io_canEnq[16],
          io_canEnq[17]} == 18'h0,
     io_canEnq[17]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8],
          io_canEnq[9],
          io_canEnq[10],
          io_canEnq[11],
          io_canEnq[12],
          io_canEnq[13],
          io_canEnq[14],
          io_canEnq[15],
          io_canEnq[16]} == 17'h0,
     io_canEnq[16]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8],
          io_canEnq[9],
          io_canEnq[10],
          io_canEnq[11],
          io_canEnq[12],
          io_canEnq[13],
          io_canEnq[14],
          io_canEnq[15]} == 16'h0,
     io_canEnq[15]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8],
          io_canEnq[9],
          io_canEnq[10],
          io_canEnq[11],
          io_canEnq[12],
          io_canEnq[13],
          io_canEnq[14]} == 15'h0,
     io_canEnq[14]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8],
          io_canEnq[9],
          io_canEnq[10],
          io_canEnq[11],
          io_canEnq[12],
          io_canEnq[13]} == 14'h0,
     io_canEnq[13]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8],
          io_canEnq[9],
          io_canEnq[10],
          io_canEnq[11],
          io_canEnq[12]} == 13'h0,
     io_canEnq[12]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8],
          io_canEnq[9],
          io_canEnq[10],
          io_canEnq[11]} == 12'h0,
     io_canEnq[11]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8],
          io_canEnq[9],
          io_canEnq[10]} == 11'h0,
     io_canEnq[10]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8],
          io_canEnq[9]} == 10'h0,
     io_canEnq[9]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8]} == 9'h0,
     io_canEnq[8]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7]} == 8'h0,
     io_canEnq[7]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6]} == 7'h0,
     io_canEnq[6]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5]} == 6'h0,
     io_canEnq[5]
       & {io_canEnq[0], io_canEnq[1], io_canEnq[2], io_canEnq[3], io_canEnq[4]} == 5'h0,
     io_canEnq[4] & {io_canEnq[0], io_canEnq[1], io_canEnq[2], io_canEnq[3]} == 4'h0,
     io_canEnq[3] & {io_canEnq[0], io_canEnq[1], io_canEnq[2]} == 3'h0,
     io_canEnq[2] & {io_canEnq[0], io_canEnq[1]} == 2'h0,
     io_canEnq[1] & ~(io_canEnq[0]),
     io_canEnq[0]};
  assign io_enqSelOHVec_1_valid =
    io_canEnq[0] & (|(io_canEnq[21:1])) | io_canEnq[1] & (|(io_canEnq[21:2]))
    | io_canEnq[2] & (|(io_canEnq[21:3])) | io_canEnq[3] & (|(io_canEnq[21:4]))
    | io_canEnq[4] & (|(io_canEnq[21:5])) | io_canEnq[5] & (|(io_canEnq[21:6]))
    | io_canEnq[6] & (|(io_canEnq[21:7])) | io_canEnq[7] & (|(io_canEnq[21:8]))
    | io_canEnq[8] & (|(io_canEnq[21:9])) | io_canEnq[9] & (|(io_canEnq[21:10]))
    | io_canEnq[10] & (|(io_canEnq[21:11])) | io_canEnq[11] & (|(io_canEnq[21:12]))
    | io_canEnq[12] & (|(io_canEnq[21:13])) | io_canEnq[13] & (|(io_canEnq[21:14]))
    | io_canEnq[14] & (|(io_canEnq[21:15])) | io_canEnq[15] & (|(io_canEnq[21:16]))
    | io_canEnq[16] & (|(io_canEnq[21:17])) | io_canEnq[17] & (|(io_canEnq[21:18]))
    | io_canEnq[18] & (|(io_canEnq[21:19])) | io_canEnq[19] & (|(io_canEnq[21:20]))
    | io_canEnq[20] & io_canEnq[21];
  assign io_enqSelOHVec_1_bits =
    {io_canEnq[21],
     io_canEnq[20] & ~(io_canEnq[21]),
     io_canEnq[19] & io_canEnq[21:20] == 2'h0,
     io_canEnq[18] & io_canEnq[21:19] == 3'h0,
     io_canEnq[17] & io_canEnq[21:18] == 4'h0,
     io_canEnq[16] & io_canEnq[21:17] == 5'h0,
     io_canEnq[15] & io_canEnq[21:16] == 6'h0,
     io_canEnq[14] & io_canEnq[21:15] == 7'h0,
     io_canEnq[13] & io_canEnq[21:14] == 8'h0,
     io_canEnq[12] & io_canEnq[21:13] == 9'h0,
     io_canEnq[11] & io_canEnq[21:12] == 10'h0,
     io_canEnq[10] & io_canEnq[21:11] == 11'h0,
     io_canEnq[9] & io_canEnq[21:10] == 12'h0,
     io_canEnq[8] & io_canEnq[21:9] == 13'h0,
     io_canEnq[7] & io_canEnq[21:8] == 14'h0,
     io_canEnq[6] & io_canEnq[21:7] == 15'h0,
     io_canEnq[5] & io_canEnq[21:6] == 16'h0,
     io_canEnq[4] & io_canEnq[21:5] == 17'h0,
     io_canEnq[3] & io_canEnq[21:4] == 18'h0,
     io_canEnq[2] & io_canEnq[21:3] == 19'h0,
     io_canEnq[1] & io_canEnq[21:2] == 20'h0,
     io_canEnq[0] & io_canEnq[21:1] == 21'h0};
endmodule

