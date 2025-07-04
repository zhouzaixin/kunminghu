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

module SRAMTemplate_196(
  input         clock,
  input         io_r_req_valid,
  input  [7:0]  io_r_req_bits_setIdx,
  output [33:0] io_r_resp_data_0,
  output [33:0] io_r_resp_data_1,
  output [33:0] io_r_resp_data_2,
  output [33:0] io_r_resp_data_3,
  output [33:0] io_r_resp_data_4,
  output [33:0] io_r_resp_data_5,
  output [33:0] io_r_resp_data_6,
  output [33:0] io_r_resp_data_7,
  output [33:0] io_r_resp_data_8,
  output [33:0] io_r_resp_data_9,
  input         io_w_req_valid,
  input  [7:0]  io_w_req_bits_setIdx,
  input  [33:0] io_w_req_bits_data_0,
  input  [33:0] io_w_req_bits_data_1,
  input  [33:0] io_w_req_bits_data_2,
  input  [33:0] io_w_req_bits_data_3,
  input  [33:0] io_w_req_bits_data_4,
  input  [33:0] io_w_req_bits_data_5,
  input  [33:0] io_w_req_bits_data_6,
  input  [33:0] io_w_req_bits_data_7,
  input  [33:0] io_w_req_bits_data_8,
  input  [33:0] io_w_req_bits_data_9,
  input  [9:0]  io_w_req_bits_waymask
);

  wire         realRen;
  wire [339:0] _array_RW0_rdata;
  assign realRen = io_r_req_valid & ~io_w_req_valid;
  array_18 array (
    .RW0_addr  (io_w_req_valid ? io_w_req_bits_setIdx : io_r_req_bits_setIdx),
    .RW0_en    (realRen | io_w_req_valid),
    .RW0_clk   (clock),
    .RW0_wmode (io_w_req_valid),
    .RW0_wdata
      ({io_w_req_bits_data_9,
        io_w_req_bits_data_8,
        io_w_req_bits_data_7,
        io_w_req_bits_data_6,
        io_w_req_bits_data_5,
        io_w_req_bits_data_4,
        io_w_req_bits_data_3,
        io_w_req_bits_data_2,
        io_w_req_bits_data_1,
        io_w_req_bits_data_0}),
    .RW0_rdata (_array_RW0_rdata),
    .RW0_wmask (io_w_req_bits_waymask)
  );
  assign io_r_resp_data_0 = _array_RW0_rdata[33:0];
  assign io_r_resp_data_1 = _array_RW0_rdata[67:34];
  assign io_r_resp_data_2 = _array_RW0_rdata[101:68];
  assign io_r_resp_data_3 = _array_RW0_rdata[135:102];
  assign io_r_resp_data_4 = _array_RW0_rdata[169:136];
  assign io_r_resp_data_5 = _array_RW0_rdata[203:170];
  assign io_r_resp_data_6 = _array_RW0_rdata[237:204];
  assign io_r_resp_data_7 = _array_RW0_rdata[271:238];
  assign io_r_resp_data_8 = _array_RW0_rdata[305:272];
  assign io_r_resp_data_9 = _array_RW0_rdata[339:306];
endmodule

