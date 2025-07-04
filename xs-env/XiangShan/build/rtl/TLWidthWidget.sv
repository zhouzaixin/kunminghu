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

module TLWidthWidget(
  input          clock,
  input          reset,
  output         auto_in_a_ready,
  input          auto_in_a_valid,
  input  [3:0]   auto_in_a_bits_opcode,
  input  [2:0]   auto_in_a_bits_param,
  input  [2:0]   auto_in_a_bits_size,
  input  [2:0]   auto_in_a_bits_source,
  input  [47:0]  auto_in_a_bits_address,
  input  [7:0]   auto_in_a_bits_mask,
  input  [63:0]  auto_in_a_bits_data,
  input          auto_in_a_bits_corrupt,
  input          auto_in_d_ready,
  output         auto_in_d_valid,
  output [3:0]   auto_in_d_bits_opcode,
  output [1:0]   auto_in_d_bits_param,
  output [2:0]   auto_in_d_bits_size,
  output [2:0]   auto_in_d_bits_source,
  output         auto_in_d_bits_sink,
  output         auto_in_d_bits_denied,
  output [63:0]  auto_in_d_bits_data,
  output         auto_in_d_bits_corrupt,
  input          auto_out_a_ready,
  output         auto_out_a_valid,
  output [3:0]   auto_out_a_bits_opcode,
  output [2:0]   auto_out_a_bits_param,
  output [2:0]   auto_out_a_bits_size,
  output [2:0]   auto_out_a_bits_source,
  output [47:0]  auto_out_a_bits_address,
  output [31:0]  auto_out_a_bits_mask,
  output [255:0] auto_out_a_bits_data,
  output         auto_out_a_bits_corrupt,
  output         auto_out_d_ready,
  input          auto_out_d_valid,
  input  [3:0]   auto_out_d_bits_opcode,
  input  [1:0]   auto_out_d_bits_param,
  input  [2:0]   auto_out_d_bits_size,
  input  [2:0]   auto_out_d_bits_source,
  input          auto_out_d_bits_sink,
  input          auto_out_d_bits_denied,
  input  [255:0] auto_out_d_bits_data,
  input          auto_out_d_bits_corrupt
);

  wire             nodeIn_a_ready;
  wire             _repeated_repeater_io_deq_valid;
  wire [3:0]       _repeated_repeater_io_deq_bits_opcode;
  wire [2:0]       _repeated_repeater_io_deq_bits_size;
  wire [2:0]       _repeated_repeater_io_deq_bits_source;
  wire [255:0]     _repeated_repeater_io_deq_bits_data;
  wire [11:0]      _limit_T = 12'h1F << auto_in_a_bits_size;
  reg  [1:0]       count;
  wire             last = count == ~(_limit_T[4:3]) | auto_in_a_bits_opcode[2];
  wire             enable_0 = (count & ~(_limit_T[4:3])) == 2'h0;
  wire             enable_1 = ({count[1], ~(count[0])} & ~(_limit_T[4:3])) == 2'h0;
  wire             enable_2 = ((count ^ 2'h2) & ~(_limit_T[4:3])) == 2'h0;
  reg              corrupt_reg;
  wire             corrupt_out = auto_in_a_bits_corrupt | corrupt_reg;
  wire             _repeat_sel_sel_T = nodeIn_a_ready & auto_in_a_valid;
  assign nodeIn_a_ready = auto_out_a_ready | ~last;
  reg              nodeOut_a_bits_data_rdata_written_once;
  wire             nodeOut_a_bits_data_masked_enable_0 =
    enable_0 | ~nodeOut_a_bits_data_rdata_written_once;
  wire             nodeOut_a_bits_data_masked_enable_1 =
    enable_1 | ~nodeOut_a_bits_data_rdata_written_once;
  wire             nodeOut_a_bits_data_masked_enable_2 =
    enable_2 | ~nodeOut_a_bits_data_rdata_written_once;
  reg  [63:0]      nodeOut_a_bits_data_rdata_0;
  reg  [63:0]      nodeOut_a_bits_data_rdata_1;
  reg  [63:0]      nodeOut_a_bits_data_rdata_2;
  wire             _nodeOut_a_bits_data_T_2 = _repeat_sel_sel_T & ~last;
  wire             nodeOut_a_bits_mask_sub_sub_sub_sub_sub_0_1 =
    auto_in_a_bits_size > 3'h4;
  wire             nodeOut_a_bits_mask_sub_sub_sub_sub_size = auto_in_a_bits_size == 3'h4;
  wire             nodeOut_a_bits_mask_sub_sub_sub_sub_0_1 =
    nodeOut_a_bits_mask_sub_sub_sub_sub_sub_0_1 | nodeOut_a_bits_mask_sub_sub_sub_sub_size
    & ~(auto_in_a_bits_address[4]);
  wire             nodeOut_a_bits_mask_sub_sub_sub_sub_1_1 =
    nodeOut_a_bits_mask_sub_sub_sub_sub_sub_0_1 | nodeOut_a_bits_mask_sub_sub_sub_sub_size
    & auto_in_a_bits_address[4];
  wire             nodeOut_a_bits_mask_sub_sub_sub_size = auto_in_a_bits_size == 3'h3;
  wire             nodeOut_a_bits_mask_sub_sub_sub_0_2 =
    ~(auto_in_a_bits_address[4]) & ~(auto_in_a_bits_address[3]);
  wire             nodeOut_a_bits_mask_sub_sub_sub_0_1 =
    nodeOut_a_bits_mask_sub_sub_sub_sub_0_1 | nodeOut_a_bits_mask_sub_sub_sub_size
    & nodeOut_a_bits_mask_sub_sub_sub_0_2;
  wire             nodeOut_a_bits_mask_sub_sub_sub_1_2 =
    ~(auto_in_a_bits_address[4]) & auto_in_a_bits_address[3];
  wire             nodeOut_a_bits_mask_sub_sub_sub_1_1 =
    nodeOut_a_bits_mask_sub_sub_sub_sub_0_1 | nodeOut_a_bits_mask_sub_sub_sub_size
    & nodeOut_a_bits_mask_sub_sub_sub_1_2;
  wire             nodeOut_a_bits_mask_sub_sub_sub_2_2 =
    auto_in_a_bits_address[4] & ~(auto_in_a_bits_address[3]);
  wire             nodeOut_a_bits_mask_sub_sub_sub_2_1 =
    nodeOut_a_bits_mask_sub_sub_sub_sub_1_1 | nodeOut_a_bits_mask_sub_sub_sub_size
    & nodeOut_a_bits_mask_sub_sub_sub_2_2;
  wire             nodeOut_a_bits_mask_sub_sub_sub_3_2 =
    auto_in_a_bits_address[4] & auto_in_a_bits_address[3];
  wire             nodeOut_a_bits_mask_sub_sub_sub_3_1 =
    nodeOut_a_bits_mask_sub_sub_sub_sub_1_1 | nodeOut_a_bits_mask_sub_sub_sub_size
    & nodeOut_a_bits_mask_sub_sub_sub_3_2;
  wire             nodeOut_a_bits_mask_sub_sub_size = auto_in_a_bits_size == 3'h2;
  wire             nodeOut_a_bits_mask_sub_sub_0_2 =
    nodeOut_a_bits_mask_sub_sub_sub_0_2 & ~(auto_in_a_bits_address[2]);
  wire             nodeOut_a_bits_mask_sub_sub_0_1 =
    nodeOut_a_bits_mask_sub_sub_sub_0_1 | nodeOut_a_bits_mask_sub_sub_size
    & nodeOut_a_bits_mask_sub_sub_0_2;
  wire             nodeOut_a_bits_mask_sub_sub_1_2 =
    nodeOut_a_bits_mask_sub_sub_sub_0_2 & auto_in_a_bits_address[2];
  wire             nodeOut_a_bits_mask_sub_sub_1_1 =
    nodeOut_a_bits_mask_sub_sub_sub_0_1 | nodeOut_a_bits_mask_sub_sub_size
    & nodeOut_a_bits_mask_sub_sub_1_2;
  wire             nodeOut_a_bits_mask_sub_sub_2_2 =
    nodeOut_a_bits_mask_sub_sub_sub_1_2 & ~(auto_in_a_bits_address[2]);
  wire             nodeOut_a_bits_mask_sub_sub_2_1 =
    nodeOut_a_bits_mask_sub_sub_sub_1_1 | nodeOut_a_bits_mask_sub_sub_size
    & nodeOut_a_bits_mask_sub_sub_2_2;
  wire             nodeOut_a_bits_mask_sub_sub_3_2 =
    nodeOut_a_bits_mask_sub_sub_sub_1_2 & auto_in_a_bits_address[2];
  wire             nodeOut_a_bits_mask_sub_sub_3_1 =
    nodeOut_a_bits_mask_sub_sub_sub_1_1 | nodeOut_a_bits_mask_sub_sub_size
    & nodeOut_a_bits_mask_sub_sub_3_2;
  wire             nodeOut_a_bits_mask_sub_sub_4_2 =
    nodeOut_a_bits_mask_sub_sub_sub_2_2 & ~(auto_in_a_bits_address[2]);
  wire             nodeOut_a_bits_mask_sub_sub_4_1 =
    nodeOut_a_bits_mask_sub_sub_sub_2_1 | nodeOut_a_bits_mask_sub_sub_size
    & nodeOut_a_bits_mask_sub_sub_4_2;
  wire             nodeOut_a_bits_mask_sub_sub_5_2 =
    nodeOut_a_bits_mask_sub_sub_sub_2_2 & auto_in_a_bits_address[2];
  wire             nodeOut_a_bits_mask_sub_sub_5_1 =
    nodeOut_a_bits_mask_sub_sub_sub_2_1 | nodeOut_a_bits_mask_sub_sub_size
    & nodeOut_a_bits_mask_sub_sub_5_2;
  wire             nodeOut_a_bits_mask_sub_sub_6_2 =
    nodeOut_a_bits_mask_sub_sub_sub_3_2 & ~(auto_in_a_bits_address[2]);
  wire             nodeOut_a_bits_mask_sub_sub_6_1 =
    nodeOut_a_bits_mask_sub_sub_sub_3_1 | nodeOut_a_bits_mask_sub_sub_size
    & nodeOut_a_bits_mask_sub_sub_6_2;
  wire             nodeOut_a_bits_mask_sub_sub_7_2 =
    nodeOut_a_bits_mask_sub_sub_sub_3_2 & auto_in_a_bits_address[2];
  wire             nodeOut_a_bits_mask_sub_sub_7_1 =
    nodeOut_a_bits_mask_sub_sub_sub_3_1 | nodeOut_a_bits_mask_sub_sub_size
    & nodeOut_a_bits_mask_sub_sub_7_2;
  wire             nodeOut_a_bits_mask_sub_size = auto_in_a_bits_size == 3'h1;
  wire             nodeOut_a_bits_mask_sub_0_2 =
    nodeOut_a_bits_mask_sub_sub_0_2 & ~(auto_in_a_bits_address[1]);
  wire             nodeOut_a_bits_mask_sub_0_1 =
    nodeOut_a_bits_mask_sub_sub_0_1 | nodeOut_a_bits_mask_sub_size
    & nodeOut_a_bits_mask_sub_0_2;
  wire             nodeOut_a_bits_mask_sub_1_2 =
    nodeOut_a_bits_mask_sub_sub_0_2 & auto_in_a_bits_address[1];
  wire             nodeOut_a_bits_mask_sub_1_1 =
    nodeOut_a_bits_mask_sub_sub_0_1 | nodeOut_a_bits_mask_sub_size
    & nodeOut_a_bits_mask_sub_1_2;
  wire             nodeOut_a_bits_mask_sub_2_2 =
    nodeOut_a_bits_mask_sub_sub_1_2 & ~(auto_in_a_bits_address[1]);
  wire             nodeOut_a_bits_mask_sub_2_1 =
    nodeOut_a_bits_mask_sub_sub_1_1 | nodeOut_a_bits_mask_sub_size
    & nodeOut_a_bits_mask_sub_2_2;
  wire             nodeOut_a_bits_mask_sub_3_2 =
    nodeOut_a_bits_mask_sub_sub_1_2 & auto_in_a_bits_address[1];
  wire             nodeOut_a_bits_mask_sub_3_1 =
    nodeOut_a_bits_mask_sub_sub_1_1 | nodeOut_a_bits_mask_sub_size
    & nodeOut_a_bits_mask_sub_3_2;
  wire             nodeOut_a_bits_mask_sub_4_2 =
    nodeOut_a_bits_mask_sub_sub_2_2 & ~(auto_in_a_bits_address[1]);
  wire             nodeOut_a_bits_mask_sub_4_1 =
    nodeOut_a_bits_mask_sub_sub_2_1 | nodeOut_a_bits_mask_sub_size
    & nodeOut_a_bits_mask_sub_4_2;
  wire             nodeOut_a_bits_mask_sub_5_2 =
    nodeOut_a_bits_mask_sub_sub_2_2 & auto_in_a_bits_address[1];
  wire             nodeOut_a_bits_mask_sub_5_1 =
    nodeOut_a_bits_mask_sub_sub_2_1 | nodeOut_a_bits_mask_sub_size
    & nodeOut_a_bits_mask_sub_5_2;
  wire             nodeOut_a_bits_mask_sub_6_2 =
    nodeOut_a_bits_mask_sub_sub_3_2 & ~(auto_in_a_bits_address[1]);
  wire             nodeOut_a_bits_mask_sub_6_1 =
    nodeOut_a_bits_mask_sub_sub_3_1 | nodeOut_a_bits_mask_sub_size
    & nodeOut_a_bits_mask_sub_6_2;
  wire             nodeOut_a_bits_mask_sub_7_2 =
    nodeOut_a_bits_mask_sub_sub_3_2 & auto_in_a_bits_address[1];
  wire             nodeOut_a_bits_mask_sub_7_1 =
    nodeOut_a_bits_mask_sub_sub_3_1 | nodeOut_a_bits_mask_sub_size
    & nodeOut_a_bits_mask_sub_7_2;
  wire             nodeOut_a_bits_mask_sub_8_2 =
    nodeOut_a_bits_mask_sub_sub_4_2 & ~(auto_in_a_bits_address[1]);
  wire             nodeOut_a_bits_mask_sub_8_1 =
    nodeOut_a_bits_mask_sub_sub_4_1 | nodeOut_a_bits_mask_sub_size
    & nodeOut_a_bits_mask_sub_8_2;
  wire             nodeOut_a_bits_mask_sub_9_2 =
    nodeOut_a_bits_mask_sub_sub_4_2 & auto_in_a_bits_address[1];
  wire             nodeOut_a_bits_mask_sub_9_1 =
    nodeOut_a_bits_mask_sub_sub_4_1 | nodeOut_a_bits_mask_sub_size
    & nodeOut_a_bits_mask_sub_9_2;
  wire             nodeOut_a_bits_mask_sub_10_2 =
    nodeOut_a_bits_mask_sub_sub_5_2 & ~(auto_in_a_bits_address[1]);
  wire             nodeOut_a_bits_mask_sub_10_1 =
    nodeOut_a_bits_mask_sub_sub_5_1 | nodeOut_a_bits_mask_sub_size
    & nodeOut_a_bits_mask_sub_10_2;
  wire             nodeOut_a_bits_mask_sub_11_2 =
    nodeOut_a_bits_mask_sub_sub_5_2 & auto_in_a_bits_address[1];
  wire             nodeOut_a_bits_mask_sub_11_1 =
    nodeOut_a_bits_mask_sub_sub_5_1 | nodeOut_a_bits_mask_sub_size
    & nodeOut_a_bits_mask_sub_11_2;
  wire             nodeOut_a_bits_mask_sub_12_2 =
    nodeOut_a_bits_mask_sub_sub_6_2 & ~(auto_in_a_bits_address[1]);
  wire             nodeOut_a_bits_mask_sub_12_1 =
    nodeOut_a_bits_mask_sub_sub_6_1 | nodeOut_a_bits_mask_sub_size
    & nodeOut_a_bits_mask_sub_12_2;
  wire             nodeOut_a_bits_mask_sub_13_2 =
    nodeOut_a_bits_mask_sub_sub_6_2 & auto_in_a_bits_address[1];
  wire             nodeOut_a_bits_mask_sub_13_1 =
    nodeOut_a_bits_mask_sub_sub_6_1 | nodeOut_a_bits_mask_sub_size
    & nodeOut_a_bits_mask_sub_13_2;
  wire             nodeOut_a_bits_mask_sub_14_2 =
    nodeOut_a_bits_mask_sub_sub_7_2 & ~(auto_in_a_bits_address[1]);
  wire             nodeOut_a_bits_mask_sub_14_1 =
    nodeOut_a_bits_mask_sub_sub_7_1 | nodeOut_a_bits_mask_sub_size
    & nodeOut_a_bits_mask_sub_14_2;
  wire             nodeOut_a_bits_mask_sub_15_2 =
    nodeOut_a_bits_mask_sub_sub_7_2 & auto_in_a_bits_address[1];
  wire             nodeOut_a_bits_mask_sub_15_1 =
    nodeOut_a_bits_mask_sub_sub_7_1 | nodeOut_a_bits_mask_sub_size
    & nodeOut_a_bits_mask_sub_15_2;
  reg              nodeOut_a_bits_mask_rdata_written_once;
  wire             nodeOut_a_bits_mask_masked_enable_0 =
    enable_0 | ~nodeOut_a_bits_mask_rdata_written_once;
  wire             nodeOut_a_bits_mask_masked_enable_1 =
    enable_1 | ~nodeOut_a_bits_mask_rdata_written_once;
  wire             nodeOut_a_bits_mask_masked_enable_2 =
    enable_2 | ~nodeOut_a_bits_mask_rdata_written_once;
  reg  [7:0]       nodeOut_a_bits_mask_rdata_0;
  reg  [7:0]       nodeOut_a_bits_mask_rdata_1;
  reg  [7:0]       nodeOut_a_bits_mask_rdata_2;
  wire             _nodeOut_a_bits_mask_T_3 = _repeat_sel_sel_T & ~last;
  wire [11:0]      _repeat_limit_T = 12'h1F << _repeated_repeater_io_deq_bits_size;
  reg  [1:0]       repeat_count;
  wire             repeat_first = repeat_count == 2'h0;
  wire             repeat_last =
    repeat_count == ~(_repeat_limit_T[4:3]) | ~(_repeated_repeater_io_deq_bits_opcode[0]);
  reg  [1:0]       repeat_sel_sel_sources_0;
  reg  [1:0]       repeat_sel_sel_sources_1;
  reg  [1:0]       repeat_sel_sel_sources_2;
  reg  [1:0]       repeat_sel_sel_sources_3;
  reg  [1:0]       repeat_sel_sel_sources_4;
  reg  [1:0]       repeat_sel_hold_r;
  wire [7:0][1:0]  _GEN =
    {{repeat_sel_sel_sources_0},
     {repeat_sel_sel_sources_0},
     {repeat_sel_sel_sources_0},
     {repeat_sel_sel_sources_4},
     {repeat_sel_sel_sources_3},
     {repeat_sel_sel_sources_2},
     {repeat_sel_sel_sources_1},
     {repeat_sel_sel_sources_0}};
  wire [1:0]       _GEN_0 = _GEN[_repeated_repeater_io_deq_bits_source];
  wire [3:0][63:0] _GEN_1 =
    {{_repeated_repeater_io_deq_bits_data[255:192]},
     {_repeated_repeater_io_deq_bits_data[191:128]},
     {_repeated_repeater_io_deq_bits_data[127:64]},
     {auto_out_d_bits_data[63:0]}};
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      count <= 2'h0;
      corrupt_reg <= 1'h0;
      nodeOut_a_bits_data_rdata_written_once <= 1'h0;
      nodeOut_a_bits_mask_rdata_written_once <= 1'h0;
      repeat_count <= 2'h0;
    end
    else begin
      if (_repeat_sel_sel_T) begin
        if (last)
          count <= 2'h0;
        else
          count <= 2'(count + 2'h1);
        corrupt_reg <= ~last & corrupt_out;
      end
      nodeOut_a_bits_data_rdata_written_once <=
        _nodeOut_a_bits_data_T_2 | nodeOut_a_bits_data_rdata_written_once;
      nodeOut_a_bits_mask_rdata_written_once <=
        _nodeOut_a_bits_mask_T_3 | nodeOut_a_bits_mask_rdata_written_once;
      if (auto_in_d_ready & _repeated_repeater_io_deq_valid) begin
        if (repeat_last)
          repeat_count <= 2'h0;
        else
          repeat_count <= 2'(repeat_count + 2'h1);
      end
    end
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (_nodeOut_a_bits_data_T_2 & nodeOut_a_bits_data_masked_enable_0)
      nodeOut_a_bits_data_rdata_0 <= auto_in_a_bits_data;
    if (_nodeOut_a_bits_data_T_2 & nodeOut_a_bits_data_masked_enable_1)
      nodeOut_a_bits_data_rdata_1 <= auto_in_a_bits_data;
    if (_nodeOut_a_bits_data_T_2 & nodeOut_a_bits_data_masked_enable_2)
      nodeOut_a_bits_data_rdata_2 <= auto_in_a_bits_data;
    if (_nodeOut_a_bits_mask_T_3 & nodeOut_a_bits_mask_masked_enable_0)
      nodeOut_a_bits_mask_rdata_0 <= auto_in_a_bits_mask;
    if (_nodeOut_a_bits_mask_T_3 & nodeOut_a_bits_mask_masked_enable_1)
      nodeOut_a_bits_mask_rdata_1 <= auto_in_a_bits_mask;
    if (_nodeOut_a_bits_mask_T_3 & nodeOut_a_bits_mask_masked_enable_2)
      nodeOut_a_bits_mask_rdata_2 <= auto_in_a_bits_mask;
    if (_repeat_sel_sel_T & auto_in_a_bits_source == 3'h0)
      repeat_sel_sel_sources_0 <= auto_in_a_bits_address[4:3];
    if (_repeat_sel_sel_T & auto_in_a_bits_source == 3'h1)
      repeat_sel_sel_sources_1 <= auto_in_a_bits_address[4:3];
    if (_repeat_sel_sel_T & auto_in_a_bits_source == 3'h2)
      repeat_sel_sel_sources_2 <= auto_in_a_bits_address[4:3];
    if (_repeat_sel_sel_T & auto_in_a_bits_source == 3'h3)
      repeat_sel_sel_sources_3 <= auto_in_a_bits_address[4:3];
    if (_repeat_sel_sel_T & auto_in_a_bits_source == 3'h4)
      repeat_sel_sel_sources_4 <= auto_in_a_bits_address[4:3];
    if (repeat_first)
      repeat_sel_hold_r <= _GEN_0;
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:7];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [3:0] i = 4'h0; i < 4'h8; i += 4'h1) begin
          _RANDOM[i[2:0]] = `RANDOM;
        end
        count = _RANDOM[3'h0][1:0];
        corrupt_reg = _RANDOM[3'h0][2];
        nodeOut_a_bits_data_rdata_written_once = _RANDOM[3'h0][3];
        nodeOut_a_bits_data_rdata_0 =
          {_RANDOM[3'h0][31:4], _RANDOM[3'h1], _RANDOM[3'h2][3:0]};
        nodeOut_a_bits_data_rdata_1 =
          {_RANDOM[3'h2][31:4], _RANDOM[3'h3], _RANDOM[3'h4][3:0]};
        nodeOut_a_bits_data_rdata_2 =
          {_RANDOM[3'h4][31:4], _RANDOM[3'h5], _RANDOM[3'h6][3:0]};
        nodeOut_a_bits_mask_rdata_written_once = _RANDOM[3'h6][4];
        nodeOut_a_bits_mask_rdata_0 = _RANDOM[3'h6][12:5];
        nodeOut_a_bits_mask_rdata_1 = _RANDOM[3'h6][20:13];
        nodeOut_a_bits_mask_rdata_2 = _RANDOM[3'h6][28:21];
        repeat_count = _RANDOM[3'h6][30:29];
        repeat_sel_sel_sources_0 = {_RANDOM[3'h6][31], _RANDOM[3'h7][0]};
        repeat_sel_sel_sources_1 = _RANDOM[3'h7][2:1];
        repeat_sel_sel_sources_2 = _RANDOM[3'h7][4:3];
        repeat_sel_sel_sources_3 = _RANDOM[3'h7][6:5];
        repeat_sel_sel_sources_4 = _RANDOM[3'h7][8:7];
        repeat_sel_hold_r = _RANDOM[3'h7][10:9];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        count = 2'h0;
        corrupt_reg = 1'h0;
        nodeOut_a_bits_data_rdata_written_once = 1'h0;
        nodeOut_a_bits_mask_rdata_written_once = 1'h0;
        repeat_count = 2'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  Repeater repeated_repeater (
    .clock               (clock),
    .reset               (reset),
    .io_repeat           (~repeat_last),
    .io_enq_ready        (auto_out_d_ready),
    .io_enq_valid        (auto_out_d_valid),
    .io_enq_bits_opcode  (auto_out_d_bits_opcode),
    .io_enq_bits_param   (auto_out_d_bits_param),
    .io_enq_bits_size    (auto_out_d_bits_size),
    .io_enq_bits_source  (auto_out_d_bits_source),
    .io_enq_bits_sink    (auto_out_d_bits_sink),
    .io_enq_bits_denied  (auto_out_d_bits_denied),
    .io_enq_bits_data    (auto_out_d_bits_data),
    .io_enq_bits_corrupt (auto_out_d_bits_corrupt),
    .io_deq_ready        (auto_in_d_ready),
    .io_deq_valid        (_repeated_repeater_io_deq_valid),
    .io_deq_bits_opcode  (_repeated_repeater_io_deq_bits_opcode),
    .io_deq_bits_param   (auto_in_d_bits_param),
    .io_deq_bits_size    (_repeated_repeater_io_deq_bits_size),
    .io_deq_bits_source  (_repeated_repeater_io_deq_bits_source),
    .io_deq_bits_sink    (auto_in_d_bits_sink),
    .io_deq_bits_denied  (auto_in_d_bits_denied),
    .io_deq_bits_data    (_repeated_repeater_io_deq_bits_data),
    .io_deq_bits_corrupt (auto_in_d_bits_corrupt)
  );
  assign auto_in_a_ready = nodeIn_a_ready;
  assign auto_in_d_valid = _repeated_repeater_io_deq_valid;
  assign auto_in_d_bits_opcode = _repeated_repeater_io_deq_bits_opcode;
  assign auto_in_d_bits_size = _repeated_repeater_io_deq_bits_size;
  assign auto_in_d_bits_source = _repeated_repeater_io_deq_bits_source;
  assign auto_in_d_bits_data =
    _GEN_1[(repeat_first ? _GEN_0 : repeat_sel_hold_r) & _repeat_limit_T[4:3]
    | repeat_count];
  assign auto_out_a_valid = auto_in_a_valid & last;
  assign auto_out_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_a_bits_param = auto_in_a_bits_param;
  assign auto_out_a_bits_size = auto_in_a_bits_size;
  assign auto_out_a_bits_source = auto_in_a_bits_source;
  assign auto_out_a_bits_address = auto_in_a_bits_address;
  assign auto_out_a_bits_mask =
    {nodeOut_a_bits_mask_sub_15_1 | nodeOut_a_bits_mask_sub_15_2
       & auto_in_a_bits_address[0],
     nodeOut_a_bits_mask_sub_15_1 | nodeOut_a_bits_mask_sub_15_2
       & ~(auto_in_a_bits_address[0]),
     nodeOut_a_bits_mask_sub_14_1 | nodeOut_a_bits_mask_sub_14_2
       & auto_in_a_bits_address[0],
     nodeOut_a_bits_mask_sub_14_1 | nodeOut_a_bits_mask_sub_14_2
       & ~(auto_in_a_bits_address[0]),
     nodeOut_a_bits_mask_sub_13_1 | nodeOut_a_bits_mask_sub_13_2
       & auto_in_a_bits_address[0],
     nodeOut_a_bits_mask_sub_13_1 | nodeOut_a_bits_mask_sub_13_2
       & ~(auto_in_a_bits_address[0]),
     nodeOut_a_bits_mask_sub_12_1 | nodeOut_a_bits_mask_sub_12_2
       & auto_in_a_bits_address[0],
     nodeOut_a_bits_mask_sub_12_1 | nodeOut_a_bits_mask_sub_12_2
       & ~(auto_in_a_bits_address[0]),
     nodeOut_a_bits_mask_sub_11_1 | nodeOut_a_bits_mask_sub_11_2
       & auto_in_a_bits_address[0],
     nodeOut_a_bits_mask_sub_11_1 | nodeOut_a_bits_mask_sub_11_2
       & ~(auto_in_a_bits_address[0]),
     nodeOut_a_bits_mask_sub_10_1 | nodeOut_a_bits_mask_sub_10_2
       & auto_in_a_bits_address[0],
     nodeOut_a_bits_mask_sub_10_1 | nodeOut_a_bits_mask_sub_10_2
       & ~(auto_in_a_bits_address[0]),
     nodeOut_a_bits_mask_sub_9_1 | nodeOut_a_bits_mask_sub_9_2
       & auto_in_a_bits_address[0],
     nodeOut_a_bits_mask_sub_9_1 | nodeOut_a_bits_mask_sub_9_2
       & ~(auto_in_a_bits_address[0]),
     nodeOut_a_bits_mask_sub_8_1 | nodeOut_a_bits_mask_sub_8_2
       & auto_in_a_bits_address[0],
     nodeOut_a_bits_mask_sub_8_1 | nodeOut_a_bits_mask_sub_8_2
       & ~(auto_in_a_bits_address[0]),
     nodeOut_a_bits_mask_sub_7_1 | nodeOut_a_bits_mask_sub_7_2
       & auto_in_a_bits_address[0],
     nodeOut_a_bits_mask_sub_7_1 | nodeOut_a_bits_mask_sub_7_2
       & ~(auto_in_a_bits_address[0]),
     nodeOut_a_bits_mask_sub_6_1 | nodeOut_a_bits_mask_sub_6_2
       & auto_in_a_bits_address[0],
     nodeOut_a_bits_mask_sub_6_1 | nodeOut_a_bits_mask_sub_6_2
       & ~(auto_in_a_bits_address[0]),
     nodeOut_a_bits_mask_sub_5_1 | nodeOut_a_bits_mask_sub_5_2
       & auto_in_a_bits_address[0],
     nodeOut_a_bits_mask_sub_5_1 | nodeOut_a_bits_mask_sub_5_2
       & ~(auto_in_a_bits_address[0]),
     nodeOut_a_bits_mask_sub_4_1 | nodeOut_a_bits_mask_sub_4_2
       & auto_in_a_bits_address[0],
     nodeOut_a_bits_mask_sub_4_1 | nodeOut_a_bits_mask_sub_4_2
       & ~(auto_in_a_bits_address[0]),
     nodeOut_a_bits_mask_sub_3_1 | nodeOut_a_bits_mask_sub_3_2
       & auto_in_a_bits_address[0],
     nodeOut_a_bits_mask_sub_3_1 | nodeOut_a_bits_mask_sub_3_2
       & ~(auto_in_a_bits_address[0]),
     nodeOut_a_bits_mask_sub_2_1 | nodeOut_a_bits_mask_sub_2_2
       & auto_in_a_bits_address[0],
     nodeOut_a_bits_mask_sub_2_1 | nodeOut_a_bits_mask_sub_2_2
       & ~(auto_in_a_bits_address[0]),
     nodeOut_a_bits_mask_sub_1_1 | nodeOut_a_bits_mask_sub_1_2
       & auto_in_a_bits_address[0],
     nodeOut_a_bits_mask_sub_1_1 | nodeOut_a_bits_mask_sub_1_2
       & ~(auto_in_a_bits_address[0]),
     nodeOut_a_bits_mask_sub_0_1 | nodeOut_a_bits_mask_sub_0_2
       & auto_in_a_bits_address[0],
     nodeOut_a_bits_mask_sub_0_1 | nodeOut_a_bits_mask_sub_0_2
       & ~(auto_in_a_bits_address[0])}
    & (auto_in_a_bits_opcode[2]
         ? 32'hFFFFFFFF
         : {auto_in_a_bits_mask,
            nodeOut_a_bits_mask_masked_enable_2
              ? auto_in_a_bits_mask
              : nodeOut_a_bits_mask_rdata_2,
            nodeOut_a_bits_mask_masked_enable_1
              ? auto_in_a_bits_mask
              : nodeOut_a_bits_mask_rdata_1,
            nodeOut_a_bits_mask_masked_enable_0
              ? auto_in_a_bits_mask
              : nodeOut_a_bits_mask_rdata_0});
  assign auto_out_a_bits_data =
    {auto_in_a_bits_data,
     nodeOut_a_bits_data_masked_enable_2
       ? auto_in_a_bits_data
       : nodeOut_a_bits_data_rdata_2,
     nodeOut_a_bits_data_masked_enable_1
       ? auto_in_a_bits_data
       : nodeOut_a_bits_data_rdata_1,
     nodeOut_a_bits_data_masked_enable_0
       ? auto_in_a_bits_data
       : nodeOut_a_bits_data_rdata_0};
  assign auto_out_a_bits_corrupt = corrupt_out;
endmodule

