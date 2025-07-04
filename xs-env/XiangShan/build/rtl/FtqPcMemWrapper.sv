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

module FtqPcMemWrapper(
  input         clock,
  input         reset,
  input  [5:0]  io_ifuPtr_w_value,
  input  [5:0]  io_ifuPtrPlus1_w_value,
  input  [5:0]  io_ifuPtrPlus2_w_value,
  input  [5:0]  io_pfPtr_w_value,
  input  [5:0]  io_pfPtrPlus1_w_value,
  input  [5:0]  io_commPtr_w_value,
  input  [5:0]  io_commPtrPlus1_w_value,
  output [49:0] io_ifuPtr_rdata_startAddr,
  output [49:0] io_ifuPtr_rdata_nextLineAddr,
  output        io_ifuPtr_rdata_fallThruError,
  output [49:0] io_ifuPtrPlus1_rdata_startAddr,
  output [49:0] io_ifuPtrPlus1_rdata_nextLineAddr,
  output        io_ifuPtrPlus1_rdata_fallThruError,
  output [49:0] io_ifuPtrPlus2_rdata_startAddr,
  output [49:0] io_pfPtr_rdata_startAddr,
  output [49:0] io_pfPtr_rdata_nextLineAddr,
  output [49:0] io_pfPtrPlus1_rdata_startAddr,
  output [49:0] io_pfPtrPlus1_rdata_nextLineAddr,
  output [49:0] io_commPtr_rdata_startAddr,
  output [49:0] io_commPtrPlus1_rdata_startAddr,
  input         io_wen,
  input  [5:0]  io_waddr,
  input  [49:0] io_wdata_startAddr,
  input  [49:0] io_wdata_nextLineAddr,
  input         io_wdata_fallThruError
);

  SyncDataModuleTemplate_FtqPC_64entry mem (
    .clock                    (clock),
    .reset                    (reset),
    .io_raddr_0               (io_ifuPtr_w_value),
    .io_raddr_1               (io_ifuPtrPlus1_w_value),
    .io_raddr_2               (io_ifuPtrPlus2_w_value),
    .io_raddr_3               (io_pfPtr_w_value),
    .io_raddr_4               (io_pfPtrPlus1_w_value),
    .io_raddr_5               (io_commPtrPlus1_w_value),
    .io_raddr_6               (io_commPtr_w_value),
    .io_rdata_0_startAddr     (io_ifuPtr_rdata_startAddr),
    .io_rdata_0_nextLineAddr  (io_ifuPtr_rdata_nextLineAddr),
    .io_rdata_0_fallThruError (io_ifuPtr_rdata_fallThruError),
    .io_rdata_1_startAddr     (io_ifuPtrPlus1_rdata_startAddr),
    .io_rdata_1_nextLineAddr  (io_ifuPtrPlus1_rdata_nextLineAddr),
    .io_rdata_1_fallThruError (io_ifuPtrPlus1_rdata_fallThruError),
    .io_rdata_2_startAddr     (io_ifuPtrPlus2_rdata_startAddr),
    .io_rdata_3_startAddr     (io_pfPtr_rdata_startAddr),
    .io_rdata_3_nextLineAddr  (io_pfPtr_rdata_nextLineAddr),
    .io_rdata_4_startAddr     (io_pfPtrPlus1_rdata_startAddr),
    .io_rdata_4_nextLineAddr  (io_pfPtrPlus1_rdata_nextLineAddr),
    .io_rdata_5_startAddr     (io_commPtrPlus1_rdata_startAddr),
    .io_rdata_6_startAddr     (io_commPtr_rdata_startAddr),
    .io_wen_0                 (io_wen),
    .io_waddr_0               (io_waddr),
    .io_wdata_0_startAddr     (io_wdata_startAddr),
    .io_wdata_0_nextLineAddr  (io_wdata_nextLineAddr),
    .io_wdata_0_fallThruError (io_wdata_fallThruError)
  );
endmodule

