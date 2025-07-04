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

module TreeArbiter(
  input          io_in_0_valid,
  input  [3:0]   io_in_0_bits_source,
  input  [4:0]   io_in_0_bits_cmd,
  input  [47:0]  io_in_0_bits_addr,
  input  [49:0]  io_in_0_bits_vaddr,
  input          io_in_0_bits_full_overwrite,
  input  [2:0]   io_in_0_bits_word_idx,
  input  [127:0] io_in_0_bits_amo_data,
  input  [15:0]  io_in_0_bits_amo_mask,
  input  [1:0]   io_in_0_bits_req_coh_state,
  input  [5:0]   io_in_0_bits_id,
  input  [511:0] io_in_0_bits_store_data,
  input  [63:0]  io_in_0_bits_store_mask,
  input          io_in_1_valid,
  input  [3:0]   io_in_1_bits_source,
  input  [2:0]   io_in_1_bits_pf_source,
  input  [4:0]   io_in_1_bits_cmd,
  input  [47:0]  io_in_1_bits_addr,
  input  [49:0]  io_in_1_bits_vaddr,
  input  [1:0]   io_in_1_bits_req_coh_state,
  input          io_in_1_bits_cancel,
  input          io_in_2_valid,
  input  [3:0]   io_in_2_bits_source,
  input  [2:0]   io_in_2_bits_pf_source,
  input  [4:0]   io_in_2_bits_cmd,
  input  [47:0]  io_in_2_bits_addr,
  input  [49:0]  io_in_2_bits_vaddr,
  input  [1:0]   io_in_2_bits_req_coh_state,
  input          io_in_2_bits_cancel,
  input          io_in_3_valid,
  input  [3:0]   io_in_3_bits_source,
  input  [2:0]   io_in_3_bits_pf_source,
  input  [4:0]   io_in_3_bits_cmd,
  input  [47:0]  io_in_3_bits_addr,
  input  [49:0]  io_in_3_bits_vaddr,
  input  [1:0]   io_in_3_bits_req_coh_state,
  input          io_in_3_bits_cancel,
  output         io_out_valid,
  output [3:0]   io_out_bits_source,
  output [2:0]   io_out_bits_pf_source,
  output [4:0]   io_out_bits_cmd,
  output [47:0]  io_out_bits_addr,
  output [49:0]  io_out_bits_vaddr,
  output         io_out_bits_full_overwrite,
  output [2:0]   io_out_bits_word_idx,
  output [127:0] io_out_bits_amo_data,
  output [15:0]  io_out_bits_amo_mask,
  output [1:0]   io_out_bits_req_coh_state,
  output [5:0]   io_out_bits_id,
  output         io_out_bits_cancel,
  output [511:0] io_out_bits_store_data,
  output [63:0]  io_out_bits_store_mask
);

  wire leftValid = io_in_0_valid | io_in_1_valid;
  wire _GEN = leftValid & io_in_0_valid;
  assign io_out_valid = io_in_0_valid | io_in_1_valid | io_in_2_valid | io_in_3_valid;
  assign io_out_bits_source =
    leftValid
      ? (io_in_0_valid ? io_in_0_bits_source : io_in_1_bits_source)
      : io_in_2_valid ? io_in_2_bits_source : io_in_3_bits_source;
  assign io_out_bits_pf_source =
    leftValid
      ? (io_in_0_valid ? 3'h0 : io_in_1_bits_pf_source)
      : io_in_2_valid ? io_in_2_bits_pf_source : io_in_3_bits_pf_source;
  assign io_out_bits_cmd =
    leftValid
      ? (io_in_0_valid ? io_in_0_bits_cmd : io_in_1_bits_cmd)
      : io_in_2_valid ? io_in_2_bits_cmd : io_in_3_bits_cmd;
  assign io_out_bits_addr =
    leftValid
      ? (io_in_0_valid ? io_in_0_bits_addr : io_in_1_bits_addr)
      : io_in_2_valid ? io_in_2_bits_addr : io_in_3_bits_addr;
  assign io_out_bits_vaddr =
    leftValid
      ? (io_in_0_valid ? io_in_0_bits_vaddr : io_in_1_bits_vaddr)
      : io_in_2_valid ? io_in_2_bits_vaddr : io_in_3_bits_vaddr;
  assign io_out_bits_full_overwrite = _GEN & io_in_0_bits_full_overwrite;
  assign io_out_bits_word_idx = _GEN ? io_in_0_bits_word_idx : 3'h0;
  assign io_out_bits_amo_data = _GEN ? io_in_0_bits_amo_data : 128'h0;
  assign io_out_bits_amo_mask = _GEN ? io_in_0_bits_amo_mask : 16'h0;
  assign io_out_bits_req_coh_state =
    leftValid
      ? (io_in_0_valid ? io_in_0_bits_req_coh_state : io_in_1_bits_req_coh_state)
      : io_in_2_valid ? io_in_2_bits_req_coh_state : io_in_3_bits_req_coh_state;
  assign io_out_bits_id = _GEN ? io_in_0_bits_id : 6'h0;
  assign io_out_bits_cancel =
    leftValid
      ? ~io_in_0_valid & io_in_1_bits_cancel
      : io_in_2_valid ? io_in_2_bits_cancel : io_in_3_bits_cancel;
  assign io_out_bits_store_data = _GEN ? io_in_0_bits_store_data : 512'h0;
  assign io_out_bits_store_mask = _GEN ? io_in_0_bits_store_mask : 64'h0;
endmodule

