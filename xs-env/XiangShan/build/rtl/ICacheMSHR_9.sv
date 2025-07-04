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

module ICacheMSHR_9(
  input         clock,
  input         reset,
  input         io_fencei,
  input         io_flush,
  input         io_invalid,
  output        io_req_ready,
  input         io_req_valid,
  input  [41:0] io_req_bits_blkPaddr,
  input  [7:0]  io_req_bits_vSetIdx,
  input         io_acquire_ready,
  output        io_acquire_valid,
  output [47:0] io_acquire_bits_acquire_address,
  output [7:0]  io_acquire_bits_vSetIdx,
  input  [41:0] io_lookUps_0_info_bits_blkPaddr,
  input  [7:0]  io_lookUps_0_info_bits_vSetIdx,
  output        io_lookUps_0_hit,
  input  [41:0] io_lookUps_1_info_bits_blkPaddr,
  input  [7:0]  io_lookUps_1_info_bits_vSetIdx,
  output        io_lookUps_1_hit,
  output        io_resp_valid,
  output [41:0] io_resp_bits_blkPaddr,
  output [7:0]  io_resp_bits_vSetIdx,
  output [1:0]  io_resp_bits_way,
  input  [1:0]  io_victimWay
);

  reg         valid;
  reg         flush;
  reg         fencei;
  reg         issue;
  reg  [41:0] blkPaddr;
  reg  [7:0]  vSetIdx;
  reg  [1:0]  way;
  wire        io_req_ready_0 = ~valid & ~io_flush & ~io_fencei;
  wire        io_acquire_valid_0 = valid & ~issue & ~io_flush & ~io_fencei;
  wire        _GEN = io_fencei | io_flush;
  wire        _GEN_0 = io_req_ready_0 & io_req_valid;
  wire        _GEN_1 = io_acquire_ready & io_acquire_valid_0;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      valid <= 1'h0;
      flush <= 1'h0;
      fencei <= 1'h0;
      issue <= 1'h0;
      blkPaddr <= 42'h0;
      vSetIdx <= 8'h0;
      way <= 2'h0;
    end
    else begin
      valid <= ~io_invalid & (_GEN_0 | ~(_GEN & ~issue) & valid);
      flush <= ~_GEN_0 & (_GEN | flush);
      fencei <= ~_GEN_0 & (_GEN | fencei);
      issue <= _GEN_1 | ~_GEN_0 & issue;
      if (_GEN_0) begin
        blkPaddr <= io_req_bits_blkPaddr;
        vSetIdx <= io_req_bits_vSetIdx;
      end
      if (_GEN_1)
        way <= io_victimWay;
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:1];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [1:0] i = 2'h0; i < 2'h2; i += 2'h1) begin
          _RANDOM[i[0]] = `RANDOM;
        end
        valid = _RANDOM[1'h0][0];
        flush = _RANDOM[1'h0][1];
        fencei = _RANDOM[1'h0][2];
        issue = _RANDOM[1'h0][3];
        blkPaddr = {_RANDOM[1'h0][31:4], _RANDOM[1'h1][13:0]};
        vSetIdx = _RANDOM[1'h1][21:14];
        way = _RANDOM[1'h1][23:22];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        valid = 1'h0;
        flush = 1'h0;
        fencei = 1'h0;
        issue = 1'h0;
        blkPaddr = 42'h0;
        vSetIdx = 8'h0;
        way = 2'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_req_ready = io_req_ready_0;
  assign io_acquire_valid = io_acquire_valid_0;
  assign io_acquire_bits_acquire_address = {blkPaddr, 6'h0};
  assign io_acquire_bits_vSetIdx = vSetIdx;
  assign io_lookUps_0_hit =
    valid & ~fencei & ~flush & io_lookUps_0_info_bits_vSetIdx == vSetIdx
    & io_lookUps_0_info_bits_blkPaddr == blkPaddr;
  assign io_lookUps_1_hit =
    valid & ~fencei & ~flush & io_lookUps_1_info_bits_vSetIdx == vSetIdx
    & io_lookUps_1_info_bits_blkPaddr == blkPaddr;
  assign io_resp_valid = valid & ~flush & ~fencei;
  assign io_resp_bits_blkPaddr = blkPaddr;
  assign io_resp_bits_vSetIdx = vSetIdx;
  assign io_resp_bits_way = way;
endmodule

