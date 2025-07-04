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

module SyncDataModuleTemplate__64entry(
  input         clock,
  input         reset,
  input         io_ren_0,
  input         io_ren_1,
  input         io_ren_2,
  input  [5:0]  io_raddr_0,
  input  [5:0]  io_raddr_1,
  input  [5:0]  io_raddr_2,
  output        io_rdata_0_histPtr_flag,
  output [7:0]  io_rdata_0_histPtr_value,
  output [3:0]  io_rdata_0_ssp,
  output [2:0]  io_rdata_0_sctr,
  output        io_rdata_0_TOSW_flag,
  output [4:0]  io_rdata_0_TOSW_value,
  output        io_rdata_0_TOSR_flag,
  output [4:0]  io_rdata_0_TOSR_value,
  output        io_rdata_0_NOS_flag,
  output [4:0]  io_rdata_0_NOS_value,
  output [49:0] io_rdata_0_topAddr,
  output        io_rdata_1_histPtr_flag,
  output [7:0]  io_rdata_1_histPtr_value,
  output [3:0]  io_rdata_1_ssp,
  output [2:0]  io_rdata_1_sctr,
  output        io_rdata_1_TOSW_flag,
  output [4:0]  io_rdata_1_TOSW_value,
  output        io_rdata_1_TOSR_flag,
  output [4:0]  io_rdata_1_TOSR_value,
  output        io_rdata_1_NOS_flag,
  output [4:0]  io_rdata_1_NOS_value,
  output [7:0]  io_rdata_2_histPtr_value,
  input         io_wen_0,
  input  [5:0]  io_waddr_0,
  input         io_wdata_0_histPtr_flag,
  input  [7:0]  io_wdata_0_histPtr_value,
  input  [3:0]  io_wdata_0_ssp,
  input  [2:0]  io_wdata_0_sctr,
  input         io_wdata_0_TOSW_flag,
  input  [4:0]  io_wdata_0_TOSW_value,
  input         io_wdata_0_TOSR_flag,
  input  [4:0]  io_wdata_0_TOSR_value,
  input         io_wdata_0_NOS_flag,
  input  [4:0]  io_wdata_0_NOS_value,
  input  [49:0] io_wdata_0_topAddr
);

  wire        _dataBanks_3_io_rdata_0_histPtr_flag;
  wire [7:0]  _dataBanks_3_io_rdata_0_histPtr_value;
  wire [3:0]  _dataBanks_3_io_rdata_0_ssp;
  wire [2:0]  _dataBanks_3_io_rdata_0_sctr;
  wire        _dataBanks_3_io_rdata_0_TOSW_flag;
  wire [4:0]  _dataBanks_3_io_rdata_0_TOSW_value;
  wire        _dataBanks_3_io_rdata_0_TOSR_flag;
  wire [4:0]  _dataBanks_3_io_rdata_0_TOSR_value;
  wire        _dataBanks_3_io_rdata_0_NOS_flag;
  wire [4:0]  _dataBanks_3_io_rdata_0_NOS_value;
  wire [49:0] _dataBanks_3_io_rdata_0_topAddr;
  wire        _dataBanks_3_io_rdata_1_histPtr_flag;
  wire [7:0]  _dataBanks_3_io_rdata_1_histPtr_value;
  wire [3:0]  _dataBanks_3_io_rdata_1_ssp;
  wire [2:0]  _dataBanks_3_io_rdata_1_sctr;
  wire        _dataBanks_3_io_rdata_1_TOSW_flag;
  wire [4:0]  _dataBanks_3_io_rdata_1_TOSW_value;
  wire        _dataBanks_3_io_rdata_1_TOSR_flag;
  wire [4:0]  _dataBanks_3_io_rdata_1_TOSR_value;
  wire        _dataBanks_3_io_rdata_1_NOS_flag;
  wire [4:0]  _dataBanks_3_io_rdata_1_NOS_value;
  wire [7:0]  _dataBanks_3_io_rdata_2_histPtr_value;
  wire        _dataBanks_2_io_rdata_0_histPtr_flag;
  wire [7:0]  _dataBanks_2_io_rdata_0_histPtr_value;
  wire [3:0]  _dataBanks_2_io_rdata_0_ssp;
  wire [2:0]  _dataBanks_2_io_rdata_0_sctr;
  wire        _dataBanks_2_io_rdata_0_TOSW_flag;
  wire [4:0]  _dataBanks_2_io_rdata_0_TOSW_value;
  wire        _dataBanks_2_io_rdata_0_TOSR_flag;
  wire [4:0]  _dataBanks_2_io_rdata_0_TOSR_value;
  wire        _dataBanks_2_io_rdata_0_NOS_flag;
  wire [4:0]  _dataBanks_2_io_rdata_0_NOS_value;
  wire [49:0] _dataBanks_2_io_rdata_0_topAddr;
  wire        _dataBanks_2_io_rdata_1_histPtr_flag;
  wire [7:0]  _dataBanks_2_io_rdata_1_histPtr_value;
  wire [3:0]  _dataBanks_2_io_rdata_1_ssp;
  wire [2:0]  _dataBanks_2_io_rdata_1_sctr;
  wire        _dataBanks_2_io_rdata_1_TOSW_flag;
  wire [4:0]  _dataBanks_2_io_rdata_1_TOSW_value;
  wire        _dataBanks_2_io_rdata_1_TOSR_flag;
  wire [4:0]  _dataBanks_2_io_rdata_1_TOSR_value;
  wire        _dataBanks_2_io_rdata_1_NOS_flag;
  wire [4:0]  _dataBanks_2_io_rdata_1_NOS_value;
  wire [7:0]  _dataBanks_2_io_rdata_2_histPtr_value;
  wire        _dataBanks_1_io_rdata_0_histPtr_flag;
  wire [7:0]  _dataBanks_1_io_rdata_0_histPtr_value;
  wire [3:0]  _dataBanks_1_io_rdata_0_ssp;
  wire [2:0]  _dataBanks_1_io_rdata_0_sctr;
  wire        _dataBanks_1_io_rdata_0_TOSW_flag;
  wire [4:0]  _dataBanks_1_io_rdata_0_TOSW_value;
  wire        _dataBanks_1_io_rdata_0_TOSR_flag;
  wire [4:0]  _dataBanks_1_io_rdata_0_TOSR_value;
  wire        _dataBanks_1_io_rdata_0_NOS_flag;
  wire [4:0]  _dataBanks_1_io_rdata_0_NOS_value;
  wire [49:0] _dataBanks_1_io_rdata_0_topAddr;
  wire        _dataBanks_1_io_rdata_1_histPtr_flag;
  wire [7:0]  _dataBanks_1_io_rdata_1_histPtr_value;
  wire [3:0]  _dataBanks_1_io_rdata_1_ssp;
  wire [2:0]  _dataBanks_1_io_rdata_1_sctr;
  wire        _dataBanks_1_io_rdata_1_TOSW_flag;
  wire [4:0]  _dataBanks_1_io_rdata_1_TOSW_value;
  wire        _dataBanks_1_io_rdata_1_TOSR_flag;
  wire [4:0]  _dataBanks_1_io_rdata_1_TOSR_value;
  wire        _dataBanks_1_io_rdata_1_NOS_flag;
  wire [4:0]  _dataBanks_1_io_rdata_1_NOS_value;
  wire [7:0]  _dataBanks_1_io_rdata_2_histPtr_value;
  wire        _dataBanks_0_io_rdata_0_histPtr_flag;
  wire [7:0]  _dataBanks_0_io_rdata_0_histPtr_value;
  wire [3:0]  _dataBanks_0_io_rdata_0_ssp;
  wire [2:0]  _dataBanks_0_io_rdata_0_sctr;
  wire        _dataBanks_0_io_rdata_0_TOSW_flag;
  wire [4:0]  _dataBanks_0_io_rdata_0_TOSW_value;
  wire        _dataBanks_0_io_rdata_0_TOSR_flag;
  wire [4:0]  _dataBanks_0_io_rdata_0_TOSR_value;
  wire        _dataBanks_0_io_rdata_0_NOS_flag;
  wire [4:0]  _dataBanks_0_io_rdata_0_NOS_value;
  wire [49:0] _dataBanks_0_io_rdata_0_topAddr;
  wire        _dataBanks_0_io_rdata_1_histPtr_flag;
  wire [7:0]  _dataBanks_0_io_rdata_1_histPtr_value;
  wire [3:0]  _dataBanks_0_io_rdata_1_ssp;
  wire [2:0]  _dataBanks_0_io_rdata_1_sctr;
  wire        _dataBanks_0_io_rdata_1_TOSW_flag;
  wire [4:0]  _dataBanks_0_io_rdata_1_TOSW_value;
  wire        _dataBanks_0_io_rdata_1_TOSR_flag;
  wire [4:0]  _dataBanks_0_io_rdata_1_TOSR_value;
  wire        _dataBanks_0_io_rdata_1_NOS_flag;
  wire [4:0]  _dataBanks_0_io_rdata_1_NOS_value;
  wire [7:0]  _dataBanks_0_io_rdata_2_histPtr_value;
  reg  [5:0]  raddr_dup_0;
  reg  [5:0]  raddr_dup_1;
  reg  [5:0]  raddr_dup_2;
  reg         wen_dup_last_REG;
  reg  [5:0]  waddr_dup_0;
  reg         r_histPtr_flag;
  reg  [7:0]  r_histPtr_value;
  reg  [3:0]  r_ssp;
  reg  [2:0]  r_sctr;
  reg         r_TOSW_flag;
  reg  [4:0]  r_TOSW_value;
  reg         r_TOSR_flag;
  reg  [4:0]  r_TOSR_value;
  reg         r_NOS_flag;
  reg  [4:0]  r_NOS_value;
  reg  [49:0] r_topAddr;
  reg  [5:0]  raddr_dup_0_1;
  reg  [5:0]  raddr_dup_1_1;
  reg  [5:0]  raddr_dup_2_1;
  reg         wen_dup_last_REG_1;
  reg  [5:0]  waddr_dup_0_1;
  reg         r_1_histPtr_flag;
  reg  [7:0]  r_1_histPtr_value;
  reg  [3:0]  r_1_ssp;
  reg  [2:0]  r_1_sctr;
  reg         r_1_TOSW_flag;
  reg  [4:0]  r_1_TOSW_value;
  reg         r_1_TOSR_flag;
  reg  [4:0]  r_1_TOSR_value;
  reg         r_1_NOS_flag;
  reg  [4:0]  r_1_NOS_value;
  reg  [49:0] r_1_topAddr;
  reg  [5:0]  raddr_dup_0_2;
  reg  [5:0]  raddr_dup_1_2;
  reg  [5:0]  raddr_dup_2_2;
  reg         wen_dup_last_REG_2;
  reg  [5:0]  waddr_dup_0_2;
  reg         r_2_histPtr_flag;
  reg  [7:0]  r_2_histPtr_value;
  reg  [3:0]  r_2_ssp;
  reg  [2:0]  r_2_sctr;
  reg         r_2_TOSW_flag;
  reg  [4:0]  r_2_TOSW_value;
  reg         r_2_TOSR_flag;
  reg  [4:0]  r_2_TOSR_value;
  reg         r_2_NOS_flag;
  reg  [4:0]  r_2_NOS_value;
  reg  [49:0] r_2_topAddr;
  reg  [5:0]  raddr_dup_0_3;
  reg  [5:0]  raddr_dup_1_3;
  reg  [5:0]  raddr_dup_2_3;
  reg         wen_dup_last_REG_3;
  reg  [5:0]  waddr_dup_0_3;
  reg         r_3_histPtr_flag;
  reg  [7:0]  r_3_histPtr_value;
  reg  [3:0]  r_3_ssp;
  reg  [2:0]  r_3_sctr;
  reg         r_3_TOSW_flag;
  reg  [4:0]  r_3_TOSW_value;
  reg         r_3_TOSR_flag;
  reg  [4:0]  r_3_TOSR_value;
  reg         r_3_NOS_flag;
  reg  [4:0]  r_3_NOS_value;
  reg  [49:0] r_3_topAddr;
  reg  [5:0]  raddr_dup;
  wire        _io_rdata_0_T = raddr_dup[5:4] == 2'h0;
  wire        _io_rdata_0_T_1 = raddr_dup[5:4] == 2'h1;
  wire        _io_rdata_0_T_2 = raddr_dup[5:4] == 2'h2;
  reg  [5:0]  raddr_dup_3;
  wire        _io_rdata_1_T = raddr_dup_3[5:4] == 2'h0;
  wire        _io_rdata_1_T_1 = raddr_dup_3[5:4] == 2'h1;
  wire        _io_rdata_1_T_2 = raddr_dup_3[5:4] == 2'h2;
  reg  [5:0]  raddr_dup_4;
  always @(posedge clock) begin
    if (io_ren_0) begin
      raddr_dup_0 <= io_raddr_0;
      raddr_dup_0_1 <= io_raddr_0;
      raddr_dup_0_2 <= io_raddr_0;
      raddr_dup_0_3 <= io_raddr_0;
      raddr_dup <= io_raddr_0;
    end
    if (io_ren_1) begin
      raddr_dup_1 <= io_raddr_1;
      raddr_dup_1_1 <= io_raddr_1;
      raddr_dup_1_2 <= io_raddr_1;
      raddr_dup_1_3 <= io_raddr_1;
      raddr_dup_3 <= io_raddr_1;
    end
    if (io_ren_2) begin
      raddr_dup_2 <= io_raddr_2;
      raddr_dup_2_1 <= io_raddr_2;
      raddr_dup_2_2 <= io_raddr_2;
      raddr_dup_2_3 <= io_raddr_2;
      raddr_dup_4 <= io_raddr_2;
    end
    if (io_wen_0) begin
      waddr_dup_0 <= io_waddr_0;
      r_histPtr_flag <= io_wdata_0_histPtr_flag;
      r_histPtr_value <= io_wdata_0_histPtr_value;
      r_ssp <= io_wdata_0_ssp;
      r_sctr <= io_wdata_0_sctr;
      r_TOSW_flag <= io_wdata_0_TOSW_flag;
      r_TOSW_value <= io_wdata_0_TOSW_value;
      r_TOSR_flag <= io_wdata_0_TOSR_flag;
      r_TOSR_value <= io_wdata_0_TOSR_value;
      r_NOS_flag <= io_wdata_0_NOS_flag;
      r_NOS_value <= io_wdata_0_NOS_value;
      r_topAddr <= io_wdata_0_topAddr;
      waddr_dup_0_1 <= io_waddr_0;
      r_1_histPtr_flag <= io_wdata_0_histPtr_flag;
      r_1_histPtr_value <= io_wdata_0_histPtr_value;
      r_1_ssp <= io_wdata_0_ssp;
      r_1_sctr <= io_wdata_0_sctr;
      r_1_TOSW_flag <= io_wdata_0_TOSW_flag;
      r_1_TOSW_value <= io_wdata_0_TOSW_value;
      r_1_TOSR_flag <= io_wdata_0_TOSR_flag;
      r_1_TOSR_value <= io_wdata_0_TOSR_value;
      r_1_NOS_flag <= io_wdata_0_NOS_flag;
      r_1_NOS_value <= io_wdata_0_NOS_value;
      r_1_topAddr <= io_wdata_0_topAddr;
      waddr_dup_0_2 <= io_waddr_0;
      r_2_histPtr_flag <= io_wdata_0_histPtr_flag;
      r_2_histPtr_value <= io_wdata_0_histPtr_value;
      r_2_ssp <= io_wdata_0_ssp;
      r_2_sctr <= io_wdata_0_sctr;
      r_2_TOSW_flag <= io_wdata_0_TOSW_flag;
      r_2_TOSW_value <= io_wdata_0_TOSW_value;
      r_2_TOSR_flag <= io_wdata_0_TOSR_flag;
      r_2_TOSR_value <= io_wdata_0_TOSR_value;
      r_2_NOS_flag <= io_wdata_0_NOS_flag;
      r_2_NOS_value <= io_wdata_0_NOS_value;
      r_2_topAddr <= io_wdata_0_topAddr;
      waddr_dup_0_3 <= io_waddr_0;
      r_3_histPtr_flag <= io_wdata_0_histPtr_flag;
      r_3_histPtr_value <= io_wdata_0_histPtr_value;
      r_3_ssp <= io_wdata_0_ssp;
      r_3_sctr <= io_wdata_0_sctr;
      r_3_TOSW_flag <= io_wdata_0_TOSW_flag;
      r_3_TOSW_value <= io_wdata_0_TOSW_value;
      r_3_TOSR_flag <= io_wdata_0_TOSR_flag;
      r_3_TOSR_value <= io_wdata_0_TOSR_value;
      r_3_NOS_flag <= io_wdata_0_NOS_flag;
      r_3_NOS_value <= io_wdata_0_NOS_value;
      r_3_topAddr <= io_wdata_0_topAddr;
    end
  end // always @(posedge)
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wen_dup_last_REG <= 1'h0;
      wen_dup_last_REG_1 <= 1'h0;
      wen_dup_last_REG_2 <= 1'h0;
      wen_dup_last_REG_3 <= 1'h0;
    end
    else begin
      wen_dup_last_REG <= io_wen_0;
      wen_dup_last_REG_1 <= io_wen_0;
      wen_dup_last_REG_2 <= io_wen_0;
      wen_dup_last_REG_3 <= io_wen_0;
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:14];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [3:0] i = 4'h0; i < 4'hF; i += 4'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        raddr_dup_0 = _RANDOM[4'h0][5:0];
        raddr_dup_1 = _RANDOM[4'h0][11:6];
        raddr_dup_2 = _RANDOM[4'h0][17:12];
        wen_dup_last_REG = _RANDOM[4'h0][18];
        waddr_dup_0 = _RANDOM[4'h0][24:19];
        r_histPtr_flag = _RANDOM[4'h0][25];
        r_histPtr_value = {_RANDOM[4'h0][31:26], _RANDOM[4'h1][1:0]};
        r_ssp = _RANDOM[4'h1][5:2];
        r_sctr = _RANDOM[4'h1][8:6];
        r_TOSW_flag = _RANDOM[4'h1][9];
        r_TOSW_value = _RANDOM[4'h1][14:10];
        r_TOSR_flag = _RANDOM[4'h1][15];
        r_TOSR_value = _RANDOM[4'h1][20:16];
        r_NOS_flag = _RANDOM[4'h1][21];
        r_NOS_value = _RANDOM[4'h1][26:22];
        r_topAddr = {_RANDOM[4'h1][31:27], _RANDOM[4'h2], _RANDOM[4'h3][12:0]};
        raddr_dup_0_1 = _RANDOM[4'h3][18:13];
        raddr_dup_1_1 = _RANDOM[4'h3][24:19];
        raddr_dup_2_1 = _RANDOM[4'h3][30:25];
        wen_dup_last_REG_1 = _RANDOM[4'h3][31];
        waddr_dup_0_1 = _RANDOM[4'h4][5:0];
        r_1_histPtr_flag = _RANDOM[4'h4][6];
        r_1_histPtr_value = _RANDOM[4'h4][14:7];
        r_1_ssp = _RANDOM[4'h4][18:15];
        r_1_sctr = _RANDOM[4'h4][21:19];
        r_1_TOSW_flag = _RANDOM[4'h4][22];
        r_1_TOSW_value = _RANDOM[4'h4][27:23];
        r_1_TOSR_flag = _RANDOM[4'h4][28];
        r_1_TOSR_value = {_RANDOM[4'h4][31:29], _RANDOM[4'h5][1:0]};
        r_1_NOS_flag = _RANDOM[4'h5][2];
        r_1_NOS_value = _RANDOM[4'h5][7:3];
        r_1_topAddr = {_RANDOM[4'h5][31:8], _RANDOM[4'h6][25:0]};
        raddr_dup_0_2 = _RANDOM[4'h6][31:26];
        raddr_dup_1_2 = _RANDOM[4'h7][5:0];
        raddr_dup_2_2 = _RANDOM[4'h7][11:6];
        wen_dup_last_REG_2 = _RANDOM[4'h7][12];
        waddr_dup_0_2 = _RANDOM[4'h7][18:13];
        r_2_histPtr_flag = _RANDOM[4'h7][19];
        r_2_histPtr_value = _RANDOM[4'h7][27:20];
        r_2_ssp = _RANDOM[4'h7][31:28];
        r_2_sctr = _RANDOM[4'h8][2:0];
        r_2_TOSW_flag = _RANDOM[4'h8][3];
        r_2_TOSW_value = _RANDOM[4'h8][8:4];
        r_2_TOSR_flag = _RANDOM[4'h8][9];
        r_2_TOSR_value = _RANDOM[4'h8][14:10];
        r_2_NOS_flag = _RANDOM[4'h8][15];
        r_2_NOS_value = _RANDOM[4'h8][20:16];
        r_2_topAddr = {_RANDOM[4'h8][31:21], _RANDOM[4'h9], _RANDOM[4'hA][6:0]};
        raddr_dup_0_3 = _RANDOM[4'hA][12:7];
        raddr_dup_1_3 = _RANDOM[4'hA][18:13];
        raddr_dup_2_3 = _RANDOM[4'hA][24:19];
        wen_dup_last_REG_3 = _RANDOM[4'hA][25];
        waddr_dup_0_3 = _RANDOM[4'hA][31:26];
        r_3_histPtr_flag = _RANDOM[4'hB][0];
        r_3_histPtr_value = _RANDOM[4'hB][8:1];
        r_3_ssp = _RANDOM[4'hB][12:9];
        r_3_sctr = _RANDOM[4'hB][15:13];
        r_3_TOSW_flag = _RANDOM[4'hB][16];
        r_3_TOSW_value = _RANDOM[4'hB][21:17];
        r_3_TOSR_flag = _RANDOM[4'hB][22];
        r_3_TOSR_value = _RANDOM[4'hB][27:23];
        r_3_NOS_flag = _RANDOM[4'hB][28];
        r_3_NOS_value = {_RANDOM[4'hB][31:29], _RANDOM[4'hC][1:0]};
        r_3_topAddr = {_RANDOM[4'hC][31:2], _RANDOM[4'hD][19:0]};
        raddr_dup = _RANDOM[4'hD][25:20];
        raddr_dup_3 = _RANDOM[4'hD][31:26];
        raddr_dup_4 = _RANDOM[4'hE][5:0];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        wen_dup_last_REG = 1'h0;
        wen_dup_last_REG_1 = 1'h0;
        wen_dup_last_REG_2 = 1'h0;
        wen_dup_last_REG_3 = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  DataModule__16entry dataBanks_0 (
    .clock                    (clock),
    .io_raddr_0               (raddr_dup_0[3:0]),
    .io_raddr_1               (raddr_dup_1[3:0]),
    .io_raddr_2               (raddr_dup_2[3:0]),
    .io_rdata_0_histPtr_flag  (_dataBanks_0_io_rdata_0_histPtr_flag),
    .io_rdata_0_histPtr_value (_dataBanks_0_io_rdata_0_histPtr_value),
    .io_rdata_0_ssp           (_dataBanks_0_io_rdata_0_ssp),
    .io_rdata_0_sctr          (_dataBanks_0_io_rdata_0_sctr),
    .io_rdata_0_TOSW_flag     (_dataBanks_0_io_rdata_0_TOSW_flag),
    .io_rdata_0_TOSW_value    (_dataBanks_0_io_rdata_0_TOSW_value),
    .io_rdata_0_TOSR_flag     (_dataBanks_0_io_rdata_0_TOSR_flag),
    .io_rdata_0_TOSR_value    (_dataBanks_0_io_rdata_0_TOSR_value),
    .io_rdata_0_NOS_flag      (_dataBanks_0_io_rdata_0_NOS_flag),
    .io_rdata_0_NOS_value     (_dataBanks_0_io_rdata_0_NOS_value),
    .io_rdata_0_topAddr       (_dataBanks_0_io_rdata_0_topAddr),
    .io_rdata_1_histPtr_flag  (_dataBanks_0_io_rdata_1_histPtr_flag),
    .io_rdata_1_histPtr_value (_dataBanks_0_io_rdata_1_histPtr_value),
    .io_rdata_1_ssp           (_dataBanks_0_io_rdata_1_ssp),
    .io_rdata_1_sctr          (_dataBanks_0_io_rdata_1_sctr),
    .io_rdata_1_TOSW_flag     (_dataBanks_0_io_rdata_1_TOSW_flag),
    .io_rdata_1_TOSW_value    (_dataBanks_0_io_rdata_1_TOSW_value),
    .io_rdata_1_TOSR_flag     (_dataBanks_0_io_rdata_1_TOSR_flag),
    .io_rdata_1_TOSR_value    (_dataBanks_0_io_rdata_1_TOSR_value),
    .io_rdata_1_NOS_flag      (_dataBanks_0_io_rdata_1_NOS_flag),
    .io_rdata_1_NOS_value     (_dataBanks_0_io_rdata_1_NOS_value),
    .io_rdata_2_histPtr_value (_dataBanks_0_io_rdata_2_histPtr_value),
    .io_wen_0                 (wen_dup_last_REG & waddr_dup_0[5:4] == 2'h0),
    .io_waddr_0               (waddr_dup_0[3:0]),
    .io_wdata_0_histPtr_flag  (r_histPtr_flag),
    .io_wdata_0_histPtr_value (r_histPtr_value),
    .io_wdata_0_ssp           (r_ssp),
    .io_wdata_0_sctr          (r_sctr),
    .io_wdata_0_TOSW_flag     (r_TOSW_flag),
    .io_wdata_0_TOSW_value    (r_TOSW_value),
    .io_wdata_0_TOSR_flag     (r_TOSR_flag),
    .io_wdata_0_TOSR_value    (r_TOSR_value),
    .io_wdata_0_NOS_flag      (r_NOS_flag),
    .io_wdata_0_NOS_value     (r_NOS_value),
    .io_wdata_0_topAddr       (r_topAddr)
  );
  DataModule__16entry dataBanks_1 (
    .clock                    (clock),
    .io_raddr_0               (raddr_dup_0_1[3:0]),
    .io_raddr_1               (raddr_dup_1_1[3:0]),
    .io_raddr_2               (raddr_dup_2_1[3:0]),
    .io_rdata_0_histPtr_flag  (_dataBanks_1_io_rdata_0_histPtr_flag),
    .io_rdata_0_histPtr_value (_dataBanks_1_io_rdata_0_histPtr_value),
    .io_rdata_0_ssp           (_dataBanks_1_io_rdata_0_ssp),
    .io_rdata_0_sctr          (_dataBanks_1_io_rdata_0_sctr),
    .io_rdata_0_TOSW_flag     (_dataBanks_1_io_rdata_0_TOSW_flag),
    .io_rdata_0_TOSW_value    (_dataBanks_1_io_rdata_0_TOSW_value),
    .io_rdata_0_TOSR_flag     (_dataBanks_1_io_rdata_0_TOSR_flag),
    .io_rdata_0_TOSR_value    (_dataBanks_1_io_rdata_0_TOSR_value),
    .io_rdata_0_NOS_flag      (_dataBanks_1_io_rdata_0_NOS_flag),
    .io_rdata_0_NOS_value     (_dataBanks_1_io_rdata_0_NOS_value),
    .io_rdata_0_topAddr       (_dataBanks_1_io_rdata_0_topAddr),
    .io_rdata_1_histPtr_flag  (_dataBanks_1_io_rdata_1_histPtr_flag),
    .io_rdata_1_histPtr_value (_dataBanks_1_io_rdata_1_histPtr_value),
    .io_rdata_1_ssp           (_dataBanks_1_io_rdata_1_ssp),
    .io_rdata_1_sctr          (_dataBanks_1_io_rdata_1_sctr),
    .io_rdata_1_TOSW_flag     (_dataBanks_1_io_rdata_1_TOSW_flag),
    .io_rdata_1_TOSW_value    (_dataBanks_1_io_rdata_1_TOSW_value),
    .io_rdata_1_TOSR_flag     (_dataBanks_1_io_rdata_1_TOSR_flag),
    .io_rdata_1_TOSR_value    (_dataBanks_1_io_rdata_1_TOSR_value),
    .io_rdata_1_NOS_flag      (_dataBanks_1_io_rdata_1_NOS_flag),
    .io_rdata_1_NOS_value     (_dataBanks_1_io_rdata_1_NOS_value),
    .io_rdata_2_histPtr_value (_dataBanks_1_io_rdata_2_histPtr_value),
    .io_wen_0                 (wen_dup_last_REG_1 & waddr_dup_0_1[5:4] == 2'h1),
    .io_waddr_0               (waddr_dup_0_1[3:0]),
    .io_wdata_0_histPtr_flag  (r_1_histPtr_flag),
    .io_wdata_0_histPtr_value (r_1_histPtr_value),
    .io_wdata_0_ssp           (r_1_ssp),
    .io_wdata_0_sctr          (r_1_sctr),
    .io_wdata_0_TOSW_flag     (r_1_TOSW_flag),
    .io_wdata_0_TOSW_value    (r_1_TOSW_value),
    .io_wdata_0_TOSR_flag     (r_1_TOSR_flag),
    .io_wdata_0_TOSR_value    (r_1_TOSR_value),
    .io_wdata_0_NOS_flag      (r_1_NOS_flag),
    .io_wdata_0_NOS_value     (r_1_NOS_value),
    .io_wdata_0_topAddr       (r_1_topAddr)
  );
  DataModule__16entry dataBanks_2 (
    .clock                    (clock),
    .io_raddr_0               (raddr_dup_0_2[3:0]),
    .io_raddr_1               (raddr_dup_1_2[3:0]),
    .io_raddr_2               (raddr_dup_2_2[3:0]),
    .io_rdata_0_histPtr_flag  (_dataBanks_2_io_rdata_0_histPtr_flag),
    .io_rdata_0_histPtr_value (_dataBanks_2_io_rdata_0_histPtr_value),
    .io_rdata_0_ssp           (_dataBanks_2_io_rdata_0_ssp),
    .io_rdata_0_sctr          (_dataBanks_2_io_rdata_0_sctr),
    .io_rdata_0_TOSW_flag     (_dataBanks_2_io_rdata_0_TOSW_flag),
    .io_rdata_0_TOSW_value    (_dataBanks_2_io_rdata_0_TOSW_value),
    .io_rdata_0_TOSR_flag     (_dataBanks_2_io_rdata_0_TOSR_flag),
    .io_rdata_0_TOSR_value    (_dataBanks_2_io_rdata_0_TOSR_value),
    .io_rdata_0_NOS_flag      (_dataBanks_2_io_rdata_0_NOS_flag),
    .io_rdata_0_NOS_value     (_dataBanks_2_io_rdata_0_NOS_value),
    .io_rdata_0_topAddr       (_dataBanks_2_io_rdata_0_topAddr),
    .io_rdata_1_histPtr_flag  (_dataBanks_2_io_rdata_1_histPtr_flag),
    .io_rdata_1_histPtr_value (_dataBanks_2_io_rdata_1_histPtr_value),
    .io_rdata_1_ssp           (_dataBanks_2_io_rdata_1_ssp),
    .io_rdata_1_sctr          (_dataBanks_2_io_rdata_1_sctr),
    .io_rdata_1_TOSW_flag     (_dataBanks_2_io_rdata_1_TOSW_flag),
    .io_rdata_1_TOSW_value    (_dataBanks_2_io_rdata_1_TOSW_value),
    .io_rdata_1_TOSR_flag     (_dataBanks_2_io_rdata_1_TOSR_flag),
    .io_rdata_1_TOSR_value    (_dataBanks_2_io_rdata_1_TOSR_value),
    .io_rdata_1_NOS_flag      (_dataBanks_2_io_rdata_1_NOS_flag),
    .io_rdata_1_NOS_value     (_dataBanks_2_io_rdata_1_NOS_value),
    .io_rdata_2_histPtr_value (_dataBanks_2_io_rdata_2_histPtr_value),
    .io_wen_0                 (wen_dup_last_REG_2 & waddr_dup_0_2[5:4] == 2'h2),
    .io_waddr_0               (waddr_dup_0_2[3:0]),
    .io_wdata_0_histPtr_flag  (r_2_histPtr_flag),
    .io_wdata_0_histPtr_value (r_2_histPtr_value),
    .io_wdata_0_ssp           (r_2_ssp),
    .io_wdata_0_sctr          (r_2_sctr),
    .io_wdata_0_TOSW_flag     (r_2_TOSW_flag),
    .io_wdata_0_TOSW_value    (r_2_TOSW_value),
    .io_wdata_0_TOSR_flag     (r_2_TOSR_flag),
    .io_wdata_0_TOSR_value    (r_2_TOSR_value),
    .io_wdata_0_NOS_flag      (r_2_NOS_flag),
    .io_wdata_0_NOS_value     (r_2_NOS_value),
    .io_wdata_0_topAddr       (r_2_topAddr)
  );
  DataModule__16entry dataBanks_3 (
    .clock                    (clock),
    .io_raddr_0               (raddr_dup_0_3[3:0]),
    .io_raddr_1               (raddr_dup_1_3[3:0]),
    .io_raddr_2               (raddr_dup_2_3[3:0]),
    .io_rdata_0_histPtr_flag  (_dataBanks_3_io_rdata_0_histPtr_flag),
    .io_rdata_0_histPtr_value (_dataBanks_3_io_rdata_0_histPtr_value),
    .io_rdata_0_ssp           (_dataBanks_3_io_rdata_0_ssp),
    .io_rdata_0_sctr          (_dataBanks_3_io_rdata_0_sctr),
    .io_rdata_0_TOSW_flag     (_dataBanks_3_io_rdata_0_TOSW_flag),
    .io_rdata_0_TOSW_value    (_dataBanks_3_io_rdata_0_TOSW_value),
    .io_rdata_0_TOSR_flag     (_dataBanks_3_io_rdata_0_TOSR_flag),
    .io_rdata_0_TOSR_value    (_dataBanks_3_io_rdata_0_TOSR_value),
    .io_rdata_0_NOS_flag      (_dataBanks_3_io_rdata_0_NOS_flag),
    .io_rdata_0_NOS_value     (_dataBanks_3_io_rdata_0_NOS_value),
    .io_rdata_0_topAddr       (_dataBanks_3_io_rdata_0_topAddr),
    .io_rdata_1_histPtr_flag  (_dataBanks_3_io_rdata_1_histPtr_flag),
    .io_rdata_1_histPtr_value (_dataBanks_3_io_rdata_1_histPtr_value),
    .io_rdata_1_ssp           (_dataBanks_3_io_rdata_1_ssp),
    .io_rdata_1_sctr          (_dataBanks_3_io_rdata_1_sctr),
    .io_rdata_1_TOSW_flag     (_dataBanks_3_io_rdata_1_TOSW_flag),
    .io_rdata_1_TOSW_value    (_dataBanks_3_io_rdata_1_TOSW_value),
    .io_rdata_1_TOSR_flag     (_dataBanks_3_io_rdata_1_TOSR_flag),
    .io_rdata_1_TOSR_value    (_dataBanks_3_io_rdata_1_TOSR_value),
    .io_rdata_1_NOS_flag      (_dataBanks_3_io_rdata_1_NOS_flag),
    .io_rdata_1_NOS_value     (_dataBanks_3_io_rdata_1_NOS_value),
    .io_rdata_2_histPtr_value (_dataBanks_3_io_rdata_2_histPtr_value),
    .io_wen_0                 (wen_dup_last_REG_3 & (&(waddr_dup_0_3[5:4]))),
    .io_waddr_0               (waddr_dup_0_3[3:0]),
    .io_wdata_0_histPtr_flag  (r_3_histPtr_flag),
    .io_wdata_0_histPtr_value (r_3_histPtr_value),
    .io_wdata_0_ssp           (r_3_ssp),
    .io_wdata_0_sctr          (r_3_sctr),
    .io_wdata_0_TOSW_flag     (r_3_TOSW_flag),
    .io_wdata_0_TOSW_value    (r_3_TOSW_value),
    .io_wdata_0_TOSR_flag     (r_3_TOSR_flag),
    .io_wdata_0_TOSR_value    (r_3_TOSR_value),
    .io_wdata_0_NOS_flag      (r_3_NOS_flag),
    .io_wdata_0_NOS_value     (r_3_NOS_value),
    .io_wdata_0_topAddr       (r_3_topAddr)
  );
  assign io_rdata_0_histPtr_flag =
    _io_rdata_0_T & _dataBanks_0_io_rdata_0_histPtr_flag | _io_rdata_0_T_1
    & _dataBanks_1_io_rdata_0_histPtr_flag | _io_rdata_0_T_2
    & _dataBanks_2_io_rdata_0_histPtr_flag | (&(raddr_dup[5:4]))
    & _dataBanks_3_io_rdata_0_histPtr_flag;
  assign io_rdata_0_histPtr_value =
    (_io_rdata_0_T ? _dataBanks_0_io_rdata_0_histPtr_value : 8'h0)
    | (_io_rdata_0_T_1 ? _dataBanks_1_io_rdata_0_histPtr_value : 8'h0)
    | (_io_rdata_0_T_2 ? _dataBanks_2_io_rdata_0_histPtr_value : 8'h0)
    | ((&(raddr_dup[5:4])) ? _dataBanks_3_io_rdata_0_histPtr_value : 8'h0);
  assign io_rdata_0_ssp =
    (_io_rdata_0_T ? _dataBanks_0_io_rdata_0_ssp : 4'h0)
    | (_io_rdata_0_T_1 ? _dataBanks_1_io_rdata_0_ssp : 4'h0)
    | (_io_rdata_0_T_2 ? _dataBanks_2_io_rdata_0_ssp : 4'h0)
    | ((&(raddr_dup[5:4])) ? _dataBanks_3_io_rdata_0_ssp : 4'h0);
  assign io_rdata_0_sctr =
    (_io_rdata_0_T ? _dataBanks_0_io_rdata_0_sctr : 3'h0)
    | (_io_rdata_0_T_1 ? _dataBanks_1_io_rdata_0_sctr : 3'h0)
    | (_io_rdata_0_T_2 ? _dataBanks_2_io_rdata_0_sctr : 3'h0)
    | ((&(raddr_dup[5:4])) ? _dataBanks_3_io_rdata_0_sctr : 3'h0);
  assign io_rdata_0_TOSW_flag =
    _io_rdata_0_T & _dataBanks_0_io_rdata_0_TOSW_flag | _io_rdata_0_T_1
    & _dataBanks_1_io_rdata_0_TOSW_flag | _io_rdata_0_T_2
    & _dataBanks_2_io_rdata_0_TOSW_flag | (&(raddr_dup[5:4]))
    & _dataBanks_3_io_rdata_0_TOSW_flag;
  assign io_rdata_0_TOSW_value =
    (_io_rdata_0_T ? _dataBanks_0_io_rdata_0_TOSW_value : 5'h0)
    | (_io_rdata_0_T_1 ? _dataBanks_1_io_rdata_0_TOSW_value : 5'h0)
    | (_io_rdata_0_T_2 ? _dataBanks_2_io_rdata_0_TOSW_value : 5'h0)
    | ((&(raddr_dup[5:4])) ? _dataBanks_3_io_rdata_0_TOSW_value : 5'h0);
  assign io_rdata_0_TOSR_flag =
    _io_rdata_0_T & _dataBanks_0_io_rdata_0_TOSR_flag | _io_rdata_0_T_1
    & _dataBanks_1_io_rdata_0_TOSR_flag | _io_rdata_0_T_2
    & _dataBanks_2_io_rdata_0_TOSR_flag | (&(raddr_dup[5:4]))
    & _dataBanks_3_io_rdata_0_TOSR_flag;
  assign io_rdata_0_TOSR_value =
    (_io_rdata_0_T ? _dataBanks_0_io_rdata_0_TOSR_value : 5'h0)
    | (_io_rdata_0_T_1 ? _dataBanks_1_io_rdata_0_TOSR_value : 5'h0)
    | (_io_rdata_0_T_2 ? _dataBanks_2_io_rdata_0_TOSR_value : 5'h0)
    | ((&(raddr_dup[5:4])) ? _dataBanks_3_io_rdata_0_TOSR_value : 5'h0);
  assign io_rdata_0_NOS_flag =
    _io_rdata_0_T & _dataBanks_0_io_rdata_0_NOS_flag | _io_rdata_0_T_1
    & _dataBanks_1_io_rdata_0_NOS_flag | _io_rdata_0_T_2
    & _dataBanks_2_io_rdata_0_NOS_flag | (&(raddr_dup[5:4]))
    & _dataBanks_3_io_rdata_0_NOS_flag;
  assign io_rdata_0_NOS_value =
    (_io_rdata_0_T ? _dataBanks_0_io_rdata_0_NOS_value : 5'h0)
    | (_io_rdata_0_T_1 ? _dataBanks_1_io_rdata_0_NOS_value : 5'h0)
    | (_io_rdata_0_T_2 ? _dataBanks_2_io_rdata_0_NOS_value : 5'h0)
    | ((&(raddr_dup[5:4])) ? _dataBanks_3_io_rdata_0_NOS_value : 5'h0);
  assign io_rdata_0_topAddr =
    (_io_rdata_0_T ? _dataBanks_0_io_rdata_0_topAddr : 50'h0)
    | (_io_rdata_0_T_1 ? _dataBanks_1_io_rdata_0_topAddr : 50'h0)
    | (_io_rdata_0_T_2 ? _dataBanks_2_io_rdata_0_topAddr : 50'h0)
    | ((&(raddr_dup[5:4])) ? _dataBanks_3_io_rdata_0_topAddr : 50'h0);
  assign io_rdata_1_histPtr_flag =
    _io_rdata_1_T & _dataBanks_0_io_rdata_1_histPtr_flag | _io_rdata_1_T_1
    & _dataBanks_1_io_rdata_1_histPtr_flag | _io_rdata_1_T_2
    & _dataBanks_2_io_rdata_1_histPtr_flag | (&(raddr_dup_3[5:4]))
    & _dataBanks_3_io_rdata_1_histPtr_flag;
  assign io_rdata_1_histPtr_value =
    (_io_rdata_1_T ? _dataBanks_0_io_rdata_1_histPtr_value : 8'h0)
    | (_io_rdata_1_T_1 ? _dataBanks_1_io_rdata_1_histPtr_value : 8'h0)
    | (_io_rdata_1_T_2 ? _dataBanks_2_io_rdata_1_histPtr_value : 8'h0)
    | ((&(raddr_dup_3[5:4])) ? _dataBanks_3_io_rdata_1_histPtr_value : 8'h0);
  assign io_rdata_1_ssp =
    (_io_rdata_1_T ? _dataBanks_0_io_rdata_1_ssp : 4'h0)
    | (_io_rdata_1_T_1 ? _dataBanks_1_io_rdata_1_ssp : 4'h0)
    | (_io_rdata_1_T_2 ? _dataBanks_2_io_rdata_1_ssp : 4'h0)
    | ((&(raddr_dup_3[5:4])) ? _dataBanks_3_io_rdata_1_ssp : 4'h0);
  assign io_rdata_1_sctr =
    (_io_rdata_1_T ? _dataBanks_0_io_rdata_1_sctr : 3'h0)
    | (_io_rdata_1_T_1 ? _dataBanks_1_io_rdata_1_sctr : 3'h0)
    | (_io_rdata_1_T_2 ? _dataBanks_2_io_rdata_1_sctr : 3'h0)
    | ((&(raddr_dup_3[5:4])) ? _dataBanks_3_io_rdata_1_sctr : 3'h0);
  assign io_rdata_1_TOSW_flag =
    _io_rdata_1_T & _dataBanks_0_io_rdata_1_TOSW_flag | _io_rdata_1_T_1
    & _dataBanks_1_io_rdata_1_TOSW_flag | _io_rdata_1_T_2
    & _dataBanks_2_io_rdata_1_TOSW_flag | (&(raddr_dup_3[5:4]))
    & _dataBanks_3_io_rdata_1_TOSW_flag;
  assign io_rdata_1_TOSW_value =
    (_io_rdata_1_T ? _dataBanks_0_io_rdata_1_TOSW_value : 5'h0)
    | (_io_rdata_1_T_1 ? _dataBanks_1_io_rdata_1_TOSW_value : 5'h0)
    | (_io_rdata_1_T_2 ? _dataBanks_2_io_rdata_1_TOSW_value : 5'h0)
    | ((&(raddr_dup_3[5:4])) ? _dataBanks_3_io_rdata_1_TOSW_value : 5'h0);
  assign io_rdata_1_TOSR_flag =
    _io_rdata_1_T & _dataBanks_0_io_rdata_1_TOSR_flag | _io_rdata_1_T_1
    & _dataBanks_1_io_rdata_1_TOSR_flag | _io_rdata_1_T_2
    & _dataBanks_2_io_rdata_1_TOSR_flag | (&(raddr_dup_3[5:4]))
    & _dataBanks_3_io_rdata_1_TOSR_flag;
  assign io_rdata_1_TOSR_value =
    (_io_rdata_1_T ? _dataBanks_0_io_rdata_1_TOSR_value : 5'h0)
    | (_io_rdata_1_T_1 ? _dataBanks_1_io_rdata_1_TOSR_value : 5'h0)
    | (_io_rdata_1_T_2 ? _dataBanks_2_io_rdata_1_TOSR_value : 5'h0)
    | ((&(raddr_dup_3[5:4])) ? _dataBanks_3_io_rdata_1_TOSR_value : 5'h0);
  assign io_rdata_1_NOS_flag =
    _io_rdata_1_T & _dataBanks_0_io_rdata_1_NOS_flag | _io_rdata_1_T_1
    & _dataBanks_1_io_rdata_1_NOS_flag | _io_rdata_1_T_2
    & _dataBanks_2_io_rdata_1_NOS_flag | (&(raddr_dup_3[5:4]))
    & _dataBanks_3_io_rdata_1_NOS_flag;
  assign io_rdata_1_NOS_value =
    (_io_rdata_1_T ? _dataBanks_0_io_rdata_1_NOS_value : 5'h0)
    | (_io_rdata_1_T_1 ? _dataBanks_1_io_rdata_1_NOS_value : 5'h0)
    | (_io_rdata_1_T_2 ? _dataBanks_2_io_rdata_1_NOS_value : 5'h0)
    | ((&(raddr_dup_3[5:4])) ? _dataBanks_3_io_rdata_1_NOS_value : 5'h0);
  assign io_rdata_2_histPtr_value =
    (raddr_dup_4[5:4] == 2'h0 ? _dataBanks_0_io_rdata_2_histPtr_value : 8'h0)
    | (raddr_dup_4[5:4] == 2'h1 ? _dataBanks_1_io_rdata_2_histPtr_value : 8'h0)
    | (raddr_dup_4[5:4] == 2'h2 ? _dataBanks_2_io_rdata_2_histPtr_value : 8'h0)
    | ((&(raddr_dup_4[5:4])) ? _dataBanks_3_io_rdata_2_histPtr_value : 8'h0);
endmodule

