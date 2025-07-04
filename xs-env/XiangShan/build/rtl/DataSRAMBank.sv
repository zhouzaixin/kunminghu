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

module DataSRAMBank(
  input         clock,
  input         io_w_en,
  input  [7:0]  io_w_addr,
  input  [3:0]  io_w_way_en,
  input  [71:0] io_w_data,
  input         io_r_en,
  input  [7:0]  io_r_addr,
  output [71:0] io_r_data_0,
  output [71:0] io_r_data_1,
  output [71:0] io_r_data_2,
  output [71:0] io_r_data_3
);

  SRAMTemplate_66 data_bank_0 (
    .clock                (clock),
    .io_r_req_valid       (io_r_en),
    .io_r_req_bits_setIdx (io_r_addr),
    .io_r_resp_data_0     (io_r_data_0),
    .io_w_req_valid       (io_w_en & io_w_way_en[0]),
    .io_w_req_bits_setIdx (io_w_addr),
    .io_w_req_bits_data_0 (io_w_data)
  );
  SRAMTemplate_66 data_bank_1 (
    .clock                (clock),
    .io_r_req_valid       (io_r_en),
    .io_r_req_bits_setIdx (io_r_addr),
    .io_r_resp_data_0     (io_r_data_1),
    .io_w_req_valid       (io_w_en & io_w_way_en[1]),
    .io_w_req_bits_setIdx (io_w_addr),
    .io_w_req_bits_data_0 (io_w_data)
  );
  SRAMTemplate_66 data_bank_2 (
    .clock                (clock),
    .io_r_req_valid       (io_r_en),
    .io_r_req_bits_setIdx (io_r_addr),
    .io_r_resp_data_0     (io_r_data_2),
    .io_w_req_valid       (io_w_en & io_w_way_en[2]),
    .io_w_req_bits_setIdx (io_w_addr),
    .io_w_req_bits_data_0 (io_w_data)
  );
  SRAMTemplate_66 data_bank_3 (
    .clock                (clock),
    .io_r_req_valid       (io_r_en),
    .io_r_req_bits_setIdx (io_r_addr),
    .io_r_resp_data_0     (io_r_data_3),
    .io_w_req_valid       (io_w_en & io_w_way_en[3]),
    .io_w_req_bits_setIdx (io_w_addr),
    .io_w_req_bits_data_0 (io_w_data)
  );
endmodule

