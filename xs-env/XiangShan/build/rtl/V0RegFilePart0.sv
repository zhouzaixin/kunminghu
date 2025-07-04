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

module V0RegFilePart0(
  input         clock,
  input  [4:0]  io_readPorts_0_addr,
  output [63:0] io_readPorts_0_data,
  input  [4:0]  io_readPorts_1_addr,
  output [63:0] io_readPorts_1_data,
  input  [4:0]  io_readPorts_2_addr,
  output [63:0] io_readPorts_2_data,
  input  [4:0]  io_readPorts_3_addr,
  output [63:0] io_readPorts_3_data,
  input         io_writePorts_0_wen,
  input  [4:0]  io_writePorts_0_addr,
  input  [63:0] io_writePorts_0_data,
  input         io_writePorts_1_wen,
  input  [4:0]  io_writePorts_1_addr,
  input  [63:0] io_writePorts_1_data,
  input         io_writePorts_2_wen,
  input  [4:0]  io_writePorts_2_addr,
  input  [63:0] io_writePorts_2_data,
  input         io_writePorts_3_wen,
  input  [4:0]  io_writePorts_3_addr,
  input  [63:0] io_writePorts_3_data,
  input         io_writePorts_4_wen,
  input  [4:0]  io_writePorts_4_addr,
  input  [63:0] io_writePorts_4_data,
  input         io_writePorts_5_wen,
  input  [4:0]  io_writePorts_5_addr,
  input  [63:0] io_writePorts_5_data
);

  reg  [63:0]       mem_0;
  reg  [63:0]       mem_1;
  reg  [63:0]       mem_2;
  reg  [63:0]       mem_3;
  reg  [63:0]       mem_4;
  reg  [63:0]       mem_5;
  reg  [63:0]       mem_6;
  reg  [63:0]       mem_7;
  reg  [63:0]       mem_8;
  reg  [63:0]       mem_9;
  reg  [63:0]       mem_10;
  reg  [63:0]       mem_11;
  reg  [63:0]       mem_12;
  reg  [63:0]       mem_13;
  reg  [63:0]       mem_14;
  reg  [63:0]       mem_15;
  reg  [63:0]       mem_16;
  reg  [63:0]       mem_17;
  reg  [63:0]       mem_18;
  reg  [63:0]       mem_19;
  reg  [63:0]       mem_20;
  reg  [63:0]       mem_21;
  reg  [4:0]        io_readPorts_0_data_REG;
  wire [31:0][63:0] _GEN =
    {{mem_0},
     {mem_0},
     {mem_0},
     {mem_0},
     {mem_0},
     {mem_0},
     {mem_0},
     {mem_0},
     {mem_0},
     {mem_0},
     {mem_21},
     {mem_20},
     {mem_19},
     {mem_18},
     {mem_17},
     {mem_16},
     {mem_15},
     {mem_14},
     {mem_13},
     {mem_12},
     {mem_11},
     {mem_10},
     {mem_9},
     {mem_8},
     {mem_7},
     {mem_6},
     {mem_5},
     {mem_4},
     {mem_3},
     {mem_2},
     {mem_1},
     {mem_0}};
  reg  [4:0]        io_readPorts_1_data_REG;
  reg  [4:0]        io_readPorts_2_data_REG;
  reg  [4:0]        io_readPorts_3_data_REG;
  wire              wenOH_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'h0;
  wire              wenOH_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'h0;
  wire              wenOH_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'h0;
  wire              wenOH_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'h0;
  wire              wenOH_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'h0;
  wire              wenOH_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'h0;
  wire              wenOH_1_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'h1;
  wire              wenOH_1_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'h1;
  wire              wenOH_1_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'h1;
  wire              wenOH_1_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'h1;
  wire              wenOH_1_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'h1;
  wire              wenOH_1_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'h1;
  wire              wenOH_2_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'h2;
  wire              wenOH_2_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'h2;
  wire              wenOH_2_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'h2;
  wire              wenOH_2_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'h2;
  wire              wenOH_2_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'h2;
  wire              wenOH_2_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'h2;
  wire              wenOH_3_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'h3;
  wire              wenOH_3_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'h3;
  wire              wenOH_3_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'h3;
  wire              wenOH_3_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'h3;
  wire              wenOH_3_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'h3;
  wire              wenOH_3_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'h3;
  wire              wenOH_4_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'h4;
  wire              wenOH_4_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'h4;
  wire              wenOH_4_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'h4;
  wire              wenOH_4_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'h4;
  wire              wenOH_4_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'h4;
  wire              wenOH_4_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'h4;
  wire              wenOH_5_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'h5;
  wire              wenOH_5_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'h5;
  wire              wenOH_5_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'h5;
  wire              wenOH_5_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'h5;
  wire              wenOH_5_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'h5;
  wire              wenOH_5_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'h5;
  wire              wenOH_6_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'h6;
  wire              wenOH_6_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'h6;
  wire              wenOH_6_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'h6;
  wire              wenOH_6_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'h6;
  wire              wenOH_6_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'h6;
  wire              wenOH_6_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'h6;
  wire              wenOH_7_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'h7;
  wire              wenOH_7_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'h7;
  wire              wenOH_7_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'h7;
  wire              wenOH_7_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'h7;
  wire              wenOH_7_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'h7;
  wire              wenOH_7_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'h7;
  wire              wenOH_8_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'h8;
  wire              wenOH_8_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'h8;
  wire              wenOH_8_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'h8;
  wire              wenOH_8_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'h8;
  wire              wenOH_8_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'h8;
  wire              wenOH_8_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'h8;
  wire              wenOH_9_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'h9;
  wire              wenOH_9_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'h9;
  wire              wenOH_9_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'h9;
  wire              wenOH_9_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'h9;
  wire              wenOH_9_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'h9;
  wire              wenOH_9_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'h9;
  wire              wenOH_10_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'hA;
  wire              wenOH_10_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'hA;
  wire              wenOH_10_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'hA;
  wire              wenOH_10_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'hA;
  wire              wenOH_10_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'hA;
  wire              wenOH_10_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'hA;
  wire              wenOH_11_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'hB;
  wire              wenOH_11_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'hB;
  wire              wenOH_11_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'hB;
  wire              wenOH_11_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'hB;
  wire              wenOH_11_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'hB;
  wire              wenOH_11_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'hB;
  wire              wenOH_12_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'hC;
  wire              wenOH_12_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'hC;
  wire              wenOH_12_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'hC;
  wire              wenOH_12_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'hC;
  wire              wenOH_12_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'hC;
  wire              wenOH_12_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'hC;
  wire              wenOH_13_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'hD;
  wire              wenOH_13_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'hD;
  wire              wenOH_13_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'hD;
  wire              wenOH_13_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'hD;
  wire              wenOH_13_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'hD;
  wire              wenOH_13_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'hD;
  wire              wenOH_14_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'hE;
  wire              wenOH_14_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'hE;
  wire              wenOH_14_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'hE;
  wire              wenOH_14_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'hE;
  wire              wenOH_14_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'hE;
  wire              wenOH_14_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'hE;
  wire              wenOH_15_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'hF;
  wire              wenOH_15_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'hF;
  wire              wenOH_15_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'hF;
  wire              wenOH_15_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'hF;
  wire              wenOH_15_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'hF;
  wire              wenOH_15_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'hF;
  wire              wenOH_16_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'h10;
  wire              wenOH_16_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'h10;
  wire              wenOH_16_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'h10;
  wire              wenOH_16_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'h10;
  wire              wenOH_16_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'h10;
  wire              wenOH_16_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'h10;
  wire              wenOH_17_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'h11;
  wire              wenOH_17_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'h11;
  wire              wenOH_17_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'h11;
  wire              wenOH_17_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'h11;
  wire              wenOH_17_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'h11;
  wire              wenOH_17_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'h11;
  wire              wenOH_18_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'h12;
  wire              wenOH_18_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'h12;
  wire              wenOH_18_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'h12;
  wire              wenOH_18_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'h12;
  wire              wenOH_18_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'h12;
  wire              wenOH_18_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'h12;
  wire              wenOH_19_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'h13;
  wire              wenOH_19_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'h13;
  wire              wenOH_19_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'h13;
  wire              wenOH_19_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'h13;
  wire              wenOH_19_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'h13;
  wire              wenOH_19_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'h13;
  wire              wenOH_20_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'h14;
  wire              wenOH_20_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'h14;
  wire              wenOH_20_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'h14;
  wire              wenOH_20_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'h14;
  wire              wenOH_20_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'h14;
  wire              wenOH_20_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'h14;
  wire              wenOH_21_0 = io_writePorts_0_wen & io_writePorts_0_addr == 5'h15;
  wire              wenOH_21_1 = io_writePorts_1_wen & io_writePorts_1_addr == 5'h15;
  wire              wenOH_21_2 = io_writePorts_2_wen & io_writePorts_2_addr == 5'h15;
  wire              wenOH_21_3 = io_writePorts_3_wen & io_writePorts_3_addr == 5'h15;
  wire              wenOH_21_4 = io_writePorts_4_wen & io_writePorts_4_addr == 5'h15;
  wire              wenOH_21_5 = io_writePorts_5_wen & io_writePorts_5_addr == 5'h15;
  always @(posedge clock) begin
    if (|{wenOH_5, wenOH_4, wenOH_3, wenOH_2, wenOH_1, wenOH_0})
      mem_0 <=
        (wenOH_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_1_5, wenOH_1_4, wenOH_1_3, wenOH_1_2, wenOH_1_1, wenOH_1_0})
      mem_1 <=
        (wenOH_1_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_1_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_1_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_1_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_1_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_1_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_2_5, wenOH_2_4, wenOH_2_3, wenOH_2_2, wenOH_2_1, wenOH_2_0})
      mem_2 <=
        (wenOH_2_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_2_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_2_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_2_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_2_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_2_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_3_5, wenOH_3_4, wenOH_3_3, wenOH_3_2, wenOH_3_1, wenOH_3_0})
      mem_3 <=
        (wenOH_3_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_3_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_3_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_3_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_3_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_3_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_4_5, wenOH_4_4, wenOH_4_3, wenOH_4_2, wenOH_4_1, wenOH_4_0})
      mem_4 <=
        (wenOH_4_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_4_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_4_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_4_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_4_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_4_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_5_5, wenOH_5_4, wenOH_5_3, wenOH_5_2, wenOH_5_1, wenOH_5_0})
      mem_5 <=
        (wenOH_5_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_5_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_5_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_5_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_5_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_5_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_6_5, wenOH_6_4, wenOH_6_3, wenOH_6_2, wenOH_6_1, wenOH_6_0})
      mem_6 <=
        (wenOH_6_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_6_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_6_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_6_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_6_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_6_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_7_5, wenOH_7_4, wenOH_7_3, wenOH_7_2, wenOH_7_1, wenOH_7_0})
      mem_7 <=
        (wenOH_7_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_7_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_7_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_7_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_7_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_7_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_8_5, wenOH_8_4, wenOH_8_3, wenOH_8_2, wenOH_8_1, wenOH_8_0})
      mem_8 <=
        (wenOH_8_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_8_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_8_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_8_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_8_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_8_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_9_5, wenOH_9_4, wenOH_9_3, wenOH_9_2, wenOH_9_1, wenOH_9_0})
      mem_9 <=
        (wenOH_9_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_9_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_9_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_9_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_9_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_9_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_10_5, wenOH_10_4, wenOH_10_3, wenOH_10_2, wenOH_10_1, wenOH_10_0})
      mem_10 <=
        (wenOH_10_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_10_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_10_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_10_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_10_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_10_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_11_5, wenOH_11_4, wenOH_11_3, wenOH_11_2, wenOH_11_1, wenOH_11_0})
      mem_11 <=
        (wenOH_11_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_11_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_11_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_11_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_11_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_11_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_12_5, wenOH_12_4, wenOH_12_3, wenOH_12_2, wenOH_12_1, wenOH_12_0})
      mem_12 <=
        (wenOH_12_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_12_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_12_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_12_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_12_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_12_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_13_5, wenOH_13_4, wenOH_13_3, wenOH_13_2, wenOH_13_1, wenOH_13_0})
      mem_13 <=
        (wenOH_13_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_13_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_13_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_13_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_13_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_13_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_14_5, wenOH_14_4, wenOH_14_3, wenOH_14_2, wenOH_14_1, wenOH_14_0})
      mem_14 <=
        (wenOH_14_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_14_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_14_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_14_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_14_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_14_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_15_5, wenOH_15_4, wenOH_15_3, wenOH_15_2, wenOH_15_1, wenOH_15_0})
      mem_15 <=
        (wenOH_15_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_15_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_15_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_15_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_15_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_15_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_16_5, wenOH_16_4, wenOH_16_3, wenOH_16_2, wenOH_16_1, wenOH_16_0})
      mem_16 <=
        (wenOH_16_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_16_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_16_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_16_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_16_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_16_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_17_5, wenOH_17_4, wenOH_17_3, wenOH_17_2, wenOH_17_1, wenOH_17_0})
      mem_17 <=
        (wenOH_17_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_17_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_17_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_17_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_17_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_17_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_18_5, wenOH_18_4, wenOH_18_3, wenOH_18_2, wenOH_18_1, wenOH_18_0})
      mem_18 <=
        (wenOH_18_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_18_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_18_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_18_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_18_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_18_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_19_5, wenOH_19_4, wenOH_19_3, wenOH_19_2, wenOH_19_1, wenOH_19_0})
      mem_19 <=
        (wenOH_19_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_19_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_19_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_19_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_19_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_19_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_20_5, wenOH_20_4, wenOH_20_3, wenOH_20_2, wenOH_20_1, wenOH_20_0})
      mem_20 <=
        (wenOH_20_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_20_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_20_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_20_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_20_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_20_5 ? io_writePorts_5_data : 64'h0);
    if (|{wenOH_21_5, wenOH_21_4, wenOH_21_3, wenOH_21_2, wenOH_21_1, wenOH_21_0})
      mem_21 <=
        (wenOH_21_0 ? io_writePorts_0_data : 64'h0)
        | (wenOH_21_1 ? io_writePorts_1_data : 64'h0)
        | (wenOH_21_2 ? io_writePorts_2_data : 64'h0)
        | (wenOH_21_3 ? io_writePorts_3_data : 64'h0)
        | (wenOH_21_4 ? io_writePorts_4_data : 64'h0)
        | (wenOH_21_5 ? io_writePorts_5_data : 64'h0);
    io_readPorts_0_data_REG <= io_readPorts_0_addr;
    io_readPorts_1_data_REG <= io_readPorts_1_addr;
    io_readPorts_2_data_REG <= io_readPorts_2_addr;
    io_readPorts_3_data_REG <= io_readPorts_3_addr;
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:46];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [5:0] i = 6'h0; i < 6'h2F; i += 6'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        mem_0 = {_RANDOM[6'h0], _RANDOM[6'h1]};
        mem_1 = {_RANDOM[6'h4], _RANDOM[6'h5]};
        mem_2 = {_RANDOM[6'h6], _RANDOM[6'h7]};
        mem_3 = {_RANDOM[6'h8], _RANDOM[6'h9]};
        mem_4 = {_RANDOM[6'hA], _RANDOM[6'hB]};
        mem_5 = {_RANDOM[6'hC], _RANDOM[6'hD]};
        mem_6 = {_RANDOM[6'hE], _RANDOM[6'hF]};
        mem_7 = {_RANDOM[6'h10], _RANDOM[6'h11]};
        mem_8 = {_RANDOM[6'h12], _RANDOM[6'h13]};
        mem_9 = {_RANDOM[6'h14], _RANDOM[6'h15]};
        mem_10 = {_RANDOM[6'h16], _RANDOM[6'h17]};
        mem_11 = {_RANDOM[6'h18], _RANDOM[6'h19]};
        mem_12 = {_RANDOM[6'h1A], _RANDOM[6'h1B]};
        mem_13 = {_RANDOM[6'h1C], _RANDOM[6'h1D]};
        mem_14 = {_RANDOM[6'h1E], _RANDOM[6'h1F]};
        mem_15 = {_RANDOM[6'h20], _RANDOM[6'h21]};
        mem_16 = {_RANDOM[6'h22], _RANDOM[6'h23]};
        mem_17 = {_RANDOM[6'h24], _RANDOM[6'h25]};
        mem_18 = {_RANDOM[6'h26], _RANDOM[6'h27]};
        mem_19 = {_RANDOM[6'h28], _RANDOM[6'h29]};
        mem_20 = {_RANDOM[6'h2A], _RANDOM[6'h2B]};
        mem_21 = {_RANDOM[6'h2C], _RANDOM[6'h2D]};
        io_readPorts_0_data_REG = _RANDOM[6'h2E][4:0];
        io_readPorts_1_data_REG = _RANDOM[6'h2E][9:5];
        io_readPorts_2_data_REG = _RANDOM[6'h2E][14:10];
        io_readPorts_3_data_REG = _RANDOM[6'h2E][19:15];
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_readPorts_0_data = _GEN[io_readPorts_0_data_REG];
  assign io_readPorts_1_data = _GEN[io_readPorts_1_data_REG];
  assign io_readPorts_2_data = _GEN[io_readPorts_2_data_REG];
  assign io_readPorts_3_data = _GEN[io_readPorts_3_data_REG];
endmodule

