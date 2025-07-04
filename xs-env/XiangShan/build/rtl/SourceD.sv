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

module SourceD(
  input          clock,
  input          reset,
  input          io_d_ready,
  output         io_d_valid,
  output [3:0]   io_d_bits_opcode,
  output [1:0]   io_d_bits_param,
  output [2:0]   io_d_bits_size,
  output [10:0]  io_d_bits_source,
  output [3:0]   io_d_bits_sink,
  output         io_d_bits_denied,
  output         io_d_bits_echo_blockisdirty,
  output [255:0] io_d_bits_data,
  output         io_d_bits_corrupt,
  output         io_task_ready,
  input          io_task_valid,
  input  [10:0]  io_task_bits_sourceId,
  input  [10:0]  io_task_bits_set,
  input  [30:0]  io_task_bits_tag,
  input  [2:0]   io_task_bits_channel,
  input  [2:0]   io_task_bits_opcode,
  input  [2:0]   io_task_bits_param,
  input  [2:0]   io_task_bits_size,
  input  [2:0]   io_task_bits_way,
  input  [5:0]   io_task_bits_off,
  input          io_task_bits_useBypass,
  input  [3:0]   io_task_bits_bufIdx,
  input          io_task_bits_denied,
  input  [3:0]   io_task_bits_sinkId,
  input          io_task_bits_bypassPut,
  input          io_task_bits_dirty,
  input          io_task_bits_isHit,
  input          io_bs_raddr_ready,
  output         io_bs_raddr_valid,
  output [2:0]   io_bs_raddr_bits_way,
  output [10:0]  io_bs_raddr_bits_set,
  output         io_bs_raddr_bits_beat,
  input  [255:0] io_bs_rdata_data,
  input          io_bs_rdata_corrupt,
  output         io_bypass_read_valid,
  output         io_bypass_read_beat,
  output [3:0]   io_bypass_read_id,
  input          io_bypass_read_ready,
  input  [255:0] io_bypass_read_buffer_data_data,
  input          io_bypass_read_buffer_data_corrupt,
  output         io_bypass_read_last,
  input          io_bs_waddr_ready,
  output         io_bs_waddr_valid,
  output [2:0]   io_bs_waddr_bits_way,
  output [10:0]  io_bs_waddr_bits_set,
  output         io_bs_waddr_bits_beat,
  output [255:0] io_bs_wdata_data,
  output         io_sourceD_r_hazard_valid,
  output [2:0]   io_sourceD_r_hazard_bits_way,
  output [10:0]  io_sourceD_r_hazard_bits_set,
  input          io_pb_pop_ready,
  output         io_pb_pop_valid,
  output [3:0]   io_pb_pop_bits_bufIdx,
  output         io_pb_pop_bits_count,
  output         io_pb_pop_bits_last,
  input  [255:0] io_pb_beat_data,
  input  [31:0]  io_pb_beat_mask,
  input          io_pb_beat_corrupt,
  output         io_resp_valid,
  output [3:0]   io_resp_bits_sink
);

  wire         s2_d_ready;
  wire         s3_d_ready;
  wire         s4_ready;
  wire         s3_valid;
  wire         s2_ready;
  wire         _s1_valid_T_5;
  wire         _s1_valid_T_2;
  wire         io_bypass_read_valid_0;
  wire [255:0] _s3_queue_io_deq_bits_data;
  wire         _s3_queue_io_deq_bits_corrupt;
  wire         _pipe_io_in_ready;
  wire         _pipe_io_out_valid;
  wire         _pipe_io_out_bits_counter;
  wire         _pipe_io_out_bits_beat;
  wire         _pipe_io_out_bits_last;
  wire         _pipe_io_out_bits_needPb;
  wire         _pipe_io_out_bits_isReleaseAck;
  wire [10:0]  _pipe_io_out_bits_req_sourceId;
  wire [10:0]  _pipe_io_out_bits_req_set;
  wire [2:0]   _pipe_io_out_bits_req_opcode;
  wire [2:0]   _pipe_io_out_bits_req_param;
  wire [2:0]   _pipe_io_out_bits_req_size;
  wire [2:0]   _pipe_io_out_bits_req_way;
  wire         _pipe_io_out_bits_req_denied;
  wire [3:0]   _pipe_io_out_bits_req_sinkId;
  wire         _pipe_io_out_bits_req_dirty;
  wire [255:0] _pbQueue_io_deq_bits_data;
  wire [31:0]  _pbQueue_io_deq_bits_mask;
  wire         _s1_queue_io_deq_valid;
  wire [255:0] _s1_queue_io_deq_bits_data;
  reg          busy;
  reg          s1_block_r;
  wire         _s1_req_reg_T = ~busy & io_task_valid;
  reg  [10:0]  s1_req_reg_sourceId;
  reg  [10:0]  s1_req_reg_set;
  reg  [30:0]  s1_req_reg_tag;
  reg  [2:0]   s1_req_reg_channel;
  reg  [2:0]   s1_req_reg_opcode;
  reg  [2:0]   s1_req_reg_param;
  reg  [2:0]   s1_req_reg_size;
  reg  [2:0]   s1_req_reg_way;
  reg  [5:0]   s1_req_reg_off;
  reg          s1_req_reg_useBypass;
  reg  [3:0]   s1_req_reg_bufIdx;
  reg          s1_req_reg_denied;
  reg  [3:0]   s1_req_reg_sinkId;
  reg          s1_req_reg_bypassPut;
  reg          s1_req_reg_dirty;
  reg          s1_req_reg_isHit;
  wire [10:0]  s1_req_set = busy ? s1_req_reg_set : io_task_bits_set;
  wire [2:0]   s1_req_channel = busy ? s1_req_reg_channel : io_task_bits_channel;
  wire [2:0]   s1_req_opcode = busy ? s1_req_reg_opcode : io_task_bits_opcode;
  wire [2:0]   s1_req_size = busy ? s1_req_reg_size : io_task_bits_size;
  wire [2:0]   s1_req_way = busy ? s1_req_reg_way : io_task_bits_way;
  wire [5:0]   s1_req_off = busy ? s1_req_reg_off : io_task_bits_off;
  wire         s1_req_useBypass = busy ? s1_req_reg_useBypass : io_task_bits_useBypass;
  wire [3:0]   s1_req_bufIdx = busy ? s1_req_reg_bufIdx : io_task_bits_bufIdx;
  wire         s1_req_bypassPut = busy ? s1_req_reg_bypassPut : io_task_bits_bypassPut;
  wire         _s1_need_pb_T_1 = s1_req_opcode == 3'h0;
  wire         s1_needData =
    s1_req_channel[0]
    & (s1_req_opcode == 3'h5 | s1_req_opcode == 3'h1 | _s1_need_pb_T_1
       & ~s1_req_bypassPut);
  wire         s1_need_pb = s1_req_channel[0] & _s1_need_pb_T_1 & ~s1_req_bypassPut;
  reg          s1_counter;
  wire [12:0]  _s1_total_beats_T = 13'h3F << s1_req_size;
  wire         s1_beat = s1_req_off[5] | s1_counter;
  wire         _s1_valid_T = io_task_bits_opcode != 3'h1;
  wire         s1_valid_r =
    (busy | io_task_valid & _s1_valid_T) & s1_needData & ~s1_block_r;
  wire         s1_last = s1_counter == (s1_needData & ~(_s1_total_beats_T[5]));
  wire         s1_bypass_hit = io_bypass_read_valid_0 & io_bypass_read_ready;
  wire         io_bs_raddr_valid_0 = s1_valid_r & ~s1_req_useBypass;
  assign io_bypass_read_valid_0 = s1_valid_r & s1_req_useBypass;
  wire         s2_latch = _s1_valid_T_2 & _s1_valid_T_5 & s2_ready;
  assign _s1_valid_T_2 = busy | io_task_valid & _s1_valid_T;
  assign _s1_valid_T_5 =
    ~s1_valid_r | (s1_req_useBypass ? s1_bypass_hit : io_bs_raddr_ready);
  reg  [10:0]  s2_req_sourceId;
  reg  [10:0]  s2_req_set;
  reg  [30:0]  s2_req_tag;
  reg  [2:0]   s2_req_channel;
  reg  [2:0]   s2_req_opcode;
  reg  [2:0]   s2_req_param;
  reg  [2:0]   s2_req_size;
  reg  [2:0]   s2_req_way;
  reg  [5:0]   s2_req_off;
  reg          s2_req_useBypass;
  reg  [3:0]   s2_req_bufIdx;
  reg          s2_req_denied;
  reg  [3:0]   s2_req_sinkId;
  reg          s2_req_bypassPut;
  reg          s2_req_dirty;
  reg          s2_req_isHit;
  reg          s2_needData;
  reg          s2_beat;
  reg          s2_last;
  reg          s2_counter;
  reg          s2_full;
  wire         s2_releaseAck = s2_req_opcode == 3'h6;
  reg          s2_need_pb;
  reg          s2_need_d;
  reg          s2_valid_pb;
  wire         io_pb_pop_valid_0 = s2_valid_pb & s2_req_channel[0];
  wire         s2_d_valid =
    s2_full & (_s1_queue_io_deq_valid & s2_req_useBypass & s2_needData | ~s2_needData);
  wire         s2_can_go =
    s2_d_valid ? s2_d_ready : _pipe_io_in_ready & (~s2_valid_pb | io_pb_pop_ready);
  assign s2_ready = ~s2_full | s2_can_go;
  reg          pbQueue_io_enq_valid_REG;
  wire         winner_0 =
    _pipe_io_out_valid
    & (~_pipe_io_out_bits_needPb | s4_ready & ~_pipe_io_out_bits_counter);
  reg          s3_queue_io_enq_valid_REG;
  reg          s3_queue_io_enq_valid_REG_1;
  reg          s3_queue_io_enq_valid_REG_2;
  wire         _pipe_io_out_ready_T_3 =
    _pipe_io_out_bits_needPb
      ? s4_ready & (_pipe_io_out_bits_counter | s3_d_ready)
      : s3_d_ready;
  assign s3_valid = _pipe_io_out_ready_T_3 & _pipe_io_out_valid;
  wire         s4_latch = s3_valid & s4_ready;
  reg  [10:0]  s4_req_set;
  reg  [2:0]   s4_req_way;
  reg  [3:0]   s4_req_sinkId;
  reg  [255:0] s4_rdata;
  reg  [255:0] s4_pbdata_data;
  reg  [31:0]  s4_pbdata_mask;
  reg          s4_need_pb;
  reg          s4_beat;
  reg          s4_last;
  reg          s4_full;
  wire         io_bs_waddr_valid_0 = s4_full & s4_need_pb;
  assign s4_ready = ~s4_full | io_bs_waddr_ready | ~s4_need_pb;
  reg          beatsLeft;
  wire         winner_1 = ~winner_0 & s2_d_valid;
  reg          state_0;
  reg          state_1;
  wire         muxState_0 = beatsLeft ? state_0 : winner_0;
  wire         muxState_1 = beatsLeft ? state_1 : winner_1;
  assign s3_d_ready = io_d_ready & (~beatsLeft | state_0);
  assign s2_d_ready = io_d_ready & (beatsLeft ? state_1 : ~winner_0);
  wire         io_d_valid_0 =
    beatsLeft ? state_0 & winner_0 | state_1 & s2_d_valid : winner_0 | s2_d_valid;
  wire [12:0]  _decode_T_3 = 13'h3F << s2_req_size;
  wire [12:0]  _decode_T = 13'h3F << _pipe_io_out_bits_req_size;
  wire         _s3_queue_io_enq_valid_T = io_bs_raddr_ready & io_bs_raddr_valid_0;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      busy <= 1'h0;
      s1_block_r <= 1'h0;
      s1_counter <= 1'h0;
      s2_full <= 1'h0;
      s2_valid_pb <= 1'h0;
      pbQueue_io_enq_valid_REG <= 1'h0;
      s3_queue_io_enq_valid_REG <= 1'h0;
      s3_queue_io_enq_valid_REG_1 <= 1'h0;
      s3_queue_io_enq_valid_REG_2 <= 1'h0;
      s4_full <= 1'h0;
      beatsLeft <= 1'h0;
      state_0 <= 1'h0;
      state_1 <= 1'h0;
    end
    else begin
      busy <= ~(s2_latch & s1_last) & (_s1_req_reg_T | busy);
      s1_block_r <=
        ~s2_latch
        & ((s1_req_useBypass ? s1_bypass_hit : _s3_queue_io_enq_valid_T) | s1_block_r);
      if (s2_latch) begin
        s1_counter <= ~s1_last & 1'(s1_counter - 1'h1);
        s2_valid_pb <= s1_need_pb;
      end
      else
        s2_valid_pb <= ~io_pb_pop_ready & s2_valid_pb;
      s2_full <= s2_latch | ~(s2_full & s2_can_go) & s2_full;
      pbQueue_io_enq_valid_REG <= io_pb_pop_ready & io_pb_pop_valid_0;
      s3_queue_io_enq_valid_REG <= _s3_queue_io_enq_valid_T;
      s3_queue_io_enq_valid_REG_1 <= s3_queue_io_enq_valid_REG;
      s3_queue_io_enq_valid_REG_2 <= s3_queue_io_enq_valid_REG_1;
      s4_full <= s4_latch | ~(io_bs_waddr_ready | ~s4_need_pb) & s4_full;
      if (~beatsLeft & io_d_ready)
        beatsLeft <=
          winner_0 & _pipe_io_out_bits_req_opcode[0] & ~(_decode_T[5]) | winner_1
          & s2_req_opcode[0] & ~(_decode_T_3[5]);
      else
        beatsLeft <= 1'(beatsLeft - (io_d_ready & io_d_valid_0));
      if (beatsLeft) begin
      end
      else begin
        state_0 <= winner_0;
        state_1 <= winner_1;
      end
    end
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (_s1_req_reg_T) begin
      s1_req_reg_sourceId <= io_task_bits_sourceId;
      s1_req_reg_set <= io_task_bits_set;
      s1_req_reg_tag <= io_task_bits_tag;
      s1_req_reg_channel <= io_task_bits_channel;
      s1_req_reg_opcode <= io_task_bits_opcode;
      s1_req_reg_param <= io_task_bits_param;
      s1_req_reg_size <= io_task_bits_size;
      s1_req_reg_way <= io_task_bits_way;
      s1_req_reg_off <= io_task_bits_off;
      s1_req_reg_useBypass <= io_task_bits_useBypass;
      s1_req_reg_bufIdx <= io_task_bits_bufIdx;
      s1_req_reg_denied <= io_task_bits_denied;
      s1_req_reg_sinkId <= io_task_bits_sinkId;
      s1_req_reg_bypassPut <= io_task_bits_bypassPut;
      s1_req_reg_dirty <= io_task_bits_dirty;
      s1_req_reg_isHit <= io_task_bits_isHit;
    end
    if (s2_latch) begin
      s2_req_sourceId <= busy ? s1_req_reg_sourceId : io_task_bits_sourceId;
      s2_req_set <= s1_req_set;
      s2_req_tag <= busy ? s1_req_reg_tag : io_task_bits_tag;
      s2_req_channel <= s1_req_channel;
      s2_req_opcode <= s1_req_opcode;
      s2_req_param <= busy ? s1_req_reg_param : io_task_bits_param;
      s2_req_size <= s1_req_size;
      s2_req_way <= s1_req_way;
      s2_req_off <= s1_req_off;
      s2_req_useBypass <= s1_req_useBypass;
      s2_req_bufIdx <= s1_req_bufIdx;
      s2_req_denied <= busy ? s1_req_reg_denied : io_task_bits_denied;
      s2_req_sinkId <= busy ? s1_req_reg_sinkId : io_task_bits_sinkId;
      s2_req_bypassPut <= s1_req_bypassPut;
      s2_req_dirty <= busy ? s1_req_reg_dirty : io_task_bits_dirty;
      s2_req_isHit <= busy ? s1_req_reg_isHit : io_task_bits_isHit;
      s2_needData <= s1_needData;
      s2_beat <= s1_beat;
      s2_last <= s1_last;
      s2_counter <= s1_counter;
      s2_need_pb <= s1_need_pb;
      s2_need_d <= ~s1_need_pb | ~s1_counter;
    end
    if (s4_latch) begin
      s4_req_set <= _pipe_io_out_bits_req_set;
      s4_req_way <= _pipe_io_out_bits_req_way;
      s4_req_sinkId <= _pipe_io_out_bits_req_sinkId;
      s4_rdata <= _s3_queue_io_deq_bits_data;
      s4_pbdata_data <= _pbQueue_io_deq_bits_data;
      s4_pbdata_mask <= _pbQueue_io_deq_bits_mask;
      s4_need_pb <= _pipe_io_out_bits_needPb;
      s4_beat <= _pipe_io_out_bits_beat;
      s4_last <= _pipe_io_out_bits_last;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:25];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [4:0] i = 5'h0; i < 5'h1A; i += 5'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        busy = _RANDOM[5'h0][0];
        s1_block_r = _RANDOM[5'h0][1];
        s1_req_reg_sourceId = _RANDOM[5'h0][12:2];
        s1_req_reg_set = _RANDOM[5'h0][23:13];
        s1_req_reg_tag = {_RANDOM[5'h0][31:24], _RANDOM[5'h1][22:0]};
        s1_req_reg_channel = _RANDOM[5'h1][25:23];
        s1_req_reg_opcode = _RANDOM[5'h1][28:26];
        s1_req_reg_param = _RANDOM[5'h1][31:29];
        s1_req_reg_size = _RANDOM[5'h2][2:0];
        s1_req_reg_way = _RANDOM[5'h2][5:3];
        s1_req_reg_off = _RANDOM[5'h2][11:6];
        s1_req_reg_useBypass = _RANDOM[5'h2][12];
        s1_req_reg_bufIdx = _RANDOM[5'h2][16:13];
        s1_req_reg_denied = _RANDOM[5'h2][17];
        s1_req_reg_sinkId = _RANDOM[5'h2][21:18];
        s1_req_reg_bypassPut = _RANDOM[5'h2][22];
        s1_req_reg_dirty = _RANDOM[5'h2][23];
        s1_req_reg_isHit = _RANDOM[5'h2][24];
        s1_counter = _RANDOM[5'h2][25];
        s2_req_sourceId = {_RANDOM[5'h2][31:26], _RANDOM[5'h3][4:0]};
        s2_req_set = _RANDOM[5'h3][15:5];
        s2_req_tag = {_RANDOM[5'h3][31:16], _RANDOM[5'h4][14:0]};
        s2_req_channel = _RANDOM[5'h4][17:15];
        s2_req_opcode = _RANDOM[5'h4][20:18];
        s2_req_param = _RANDOM[5'h4][23:21];
        s2_req_size = _RANDOM[5'h4][26:24];
        s2_req_way = _RANDOM[5'h4][29:27];
        s2_req_off = {_RANDOM[5'h4][31:30], _RANDOM[5'h5][3:0]};
        s2_req_useBypass = _RANDOM[5'h5][4];
        s2_req_bufIdx = _RANDOM[5'h5][8:5];
        s2_req_denied = _RANDOM[5'h5][9];
        s2_req_sinkId = _RANDOM[5'h5][13:10];
        s2_req_bypassPut = _RANDOM[5'h5][14];
        s2_req_dirty = _RANDOM[5'h5][15];
        s2_req_isHit = _RANDOM[5'h5][16];
        s2_needData = _RANDOM[5'h5][17];
        s2_beat = _RANDOM[5'h5][18];
        s2_last = _RANDOM[5'h5][19];
        s2_counter = _RANDOM[5'h5][20];
        s2_full = _RANDOM[5'h5][21];
        s2_need_pb = _RANDOM[5'h5][22];
        s2_need_d = _RANDOM[5'h5][23];
        s2_valid_pb = _RANDOM[5'h5][24];
        pbQueue_io_enq_valid_REG = _RANDOM[5'h5][25];
        s3_queue_io_enq_valid_REG = _RANDOM[5'h5][26];
        s3_queue_io_enq_valid_REG_1 = _RANDOM[5'h5][27];
        s3_queue_io_enq_valid_REG_2 = _RANDOM[5'h5][28];
        s4_req_set = _RANDOM[5'h6][18:8];
        s4_req_way = {_RANDOM[5'h7][31:30], _RANDOM[5'h8][0]};
        s4_req_sinkId = _RANDOM[5'h8][16:13];
        s4_rdata =
          {_RANDOM[5'h8][31:20],
           _RANDOM[5'h9],
           _RANDOM[5'hA],
           _RANDOM[5'hB],
           _RANDOM[5'hC],
           _RANDOM[5'hD],
           _RANDOM[5'hE],
           _RANDOM[5'hF],
           _RANDOM[5'h10][19:0]};
        s4_pbdata_data =
          {_RANDOM[5'h10][31:20],
           _RANDOM[5'h11],
           _RANDOM[5'h12],
           _RANDOM[5'h13],
           _RANDOM[5'h14],
           _RANDOM[5'h15],
           _RANDOM[5'h16],
           _RANDOM[5'h17],
           _RANDOM[5'h18][19:0]};
        s4_pbdata_mask = {_RANDOM[5'h18][31:20], _RANDOM[5'h19][19:0]};
        s4_need_pb = _RANDOM[5'h19][21];
        s4_beat = _RANDOM[5'h19][22];
        s4_last = _RANDOM[5'h19][23];
        s4_full = _RANDOM[5'h19][24];
        beatsLeft = _RANDOM[5'h19][25];
        state_0 = _RANDOM[5'h19][26];
        state_1 = _RANDOM[5'h19][27];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        busy = 1'h0;
        s1_block_r = 1'h0;
        s1_counter = 1'h0;
        s2_full = 1'h0;
        s2_valid_pb = 1'h0;
        pbQueue_io_enq_valid_REG = 1'h0;
        s3_queue_io_enq_valid_REG = 1'h0;
        s3_queue_io_enq_valid_REG_1 = 1'h0;
        s3_queue_io_enq_valid_REG_2 = 1'h0;
        s4_full = 1'h0;
        beatsLeft = 1'h0;
        state_0 = 1'h0;
        state_1 = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  Queue2_DSData s1_queue (
    .clock               (clock),
    .reset               (reset),
    .io_enq_valid        (s1_bypass_hit),
    .io_enq_bits_data    (io_bypass_read_buffer_data_data),
    .io_enq_bits_corrupt (io_bypass_read_buffer_data_corrupt),
    .io_deq_ready        (s2_full & s2_req_useBypass & s2_needData & s2_d_ready),
    .io_deq_valid        (_s1_queue_io_deq_valid),
    .io_deq_bits_data    (_s1_queue_io_deq_bits_data)
  );
  Queue6_PutBufferBeatEntry pbQueue (
    .clock               (clock),
    .reset               (reset),
    .io_enq_valid        (pbQueue_io_enq_valid_REG),
    .io_enq_bits_data    (io_pb_beat_data),
    .io_enq_bits_mask    (io_pb_beat_mask),
    .io_enq_bits_corrupt (io_pb_beat_corrupt),
    .io_deq_ready        (s3_valid & _pipe_io_out_bits_needPb & s4_ready),
    .io_deq_bits_data    (_pbQueue_io_deq_bits_data),
    .io_deq_bits_mask    (_pbQueue_io_deq_bits_mask)
  );
  Pipeline_13 pipe (
    .clock                    (clock),
    .reset                    (reset),
    .io_in_ready              (_pipe_io_in_ready),
    .io_in_valid              (s2_full & ~s2_d_valid & (~s2_valid_pb | io_pb_pop_ready)),
    .io_in_bits_counter       (s2_counter),
    .io_in_bits_beat          (s2_beat),
    .io_in_bits_last          (s2_last),
    .io_in_bits_needPb        (s2_need_pb),
    .io_in_bits_need_d        (s2_need_d),
    .io_in_bits_isReleaseAck  (s2_releaseAck),
    .io_in_bits_req_sourceId  (s2_req_sourceId),
    .io_in_bits_req_set       (s2_req_set),
    .io_in_bits_req_tag       (s2_req_tag),
    .io_in_bits_req_channel   (s2_req_channel),
    .io_in_bits_req_opcode    (s2_req_opcode),
    .io_in_bits_req_param     (s2_req_param),
    .io_in_bits_req_size      (s2_req_size),
    .io_in_bits_req_way       (s2_req_way),
    .io_in_bits_req_off       (s2_req_off),
    .io_in_bits_req_useBypass (s2_req_useBypass),
    .io_in_bits_req_bufIdx    (s2_req_bufIdx),
    .io_in_bits_req_denied    (s2_req_denied),
    .io_in_bits_req_sinkId    (s2_req_sinkId),
    .io_in_bits_req_bypassPut (s2_req_bypassPut),
    .io_in_bits_req_dirty     (s2_req_dirty),
    .io_in_bits_req_isHit     (s2_req_isHit),
    .io_out_ready             (_pipe_io_out_ready_T_3),
    .io_out_valid             (_pipe_io_out_valid),
    .io_out_bits_counter      (_pipe_io_out_bits_counter),
    .io_out_bits_beat         (_pipe_io_out_bits_beat),
    .io_out_bits_last         (_pipe_io_out_bits_last),
    .io_out_bits_needPb       (_pipe_io_out_bits_needPb),
    .io_out_bits_isReleaseAck (_pipe_io_out_bits_isReleaseAck),
    .io_out_bits_req_sourceId (_pipe_io_out_bits_req_sourceId),
    .io_out_bits_req_set      (_pipe_io_out_bits_req_set),
    .io_out_bits_req_opcode   (_pipe_io_out_bits_req_opcode),
    .io_out_bits_req_param    (_pipe_io_out_bits_req_param),
    .io_out_bits_req_size     (_pipe_io_out_bits_req_size),
    .io_out_bits_req_way      (_pipe_io_out_bits_req_way),
    .io_out_bits_req_denied   (_pipe_io_out_bits_req_denied),
    .io_out_bits_req_sinkId   (_pipe_io_out_bits_req_sinkId),
    .io_out_bits_req_dirty    (_pipe_io_out_bits_req_dirty)
  );
  Queue4_DSData s3_queue (
    .clock               (clock),
    .reset               (reset),
    .io_enq_valid        (s3_queue_io_enq_valid_REG_2),
    .io_enq_bits_data    (io_bs_rdata_data),
    .io_enq_bits_corrupt (io_bs_rdata_corrupt),
    .io_deq_ready
      ((_pipe_io_out_bits_needPb
          ? s4_ready & (_pipe_io_out_bits_counter | s3_d_ready)
          : s3_d_ready) & s3_valid),
    .io_deq_bits_data    (_s3_queue_io_deq_bits_data),
    .io_deq_bits_corrupt (_s3_queue_io_deq_bits_corrupt)
  );
  assign io_d_valid = io_d_valid_0;
  assign io_d_bits_opcode =
    (muxState_0 ? {1'h0, _pipe_io_out_bits_req_opcode} : 4'h0)
    | (muxState_1 ? {1'h0, s2_req_opcode} : 4'h0);
  assign io_d_bits_param =
    (~muxState_0 | _pipe_io_out_bits_isReleaseAck
       ? 2'h0
       : _pipe_io_out_bits_req_param[1:0])
    | (~muxState_1 | s2_releaseAck ? 2'h0 : s2_req_param[1:0]);
  assign io_d_bits_size =
    (muxState_0 ? _pipe_io_out_bits_req_size : 3'h0) | (muxState_1 ? s2_req_size : 3'h0);
  assign io_d_bits_source =
    (muxState_0 ? _pipe_io_out_bits_req_sourceId : 11'h0)
    | (muxState_1 ? s2_req_sourceId : 11'h0);
  assign io_d_bits_sink =
    (muxState_0 ? _pipe_io_out_bits_req_sinkId : 4'h0)
    | (muxState_1 ? s2_req_sinkId : 4'h0);
  assign io_d_bits_denied =
    muxState_0 & _pipe_io_out_bits_req_denied | muxState_1 & s2_req_denied;
  assign io_d_bits_echo_blockisdirty =
    muxState_0 & _pipe_io_out_bits_req_dirty | muxState_1 & s2_req_dirty;
  assign io_d_bits_data =
    (muxState_0 ? _s3_queue_io_deq_bits_data : 256'h0)
    | (muxState_1 ? _s1_queue_io_deq_bits_data : 256'h0);
  assign io_d_bits_corrupt =
    muxState_0
    & (_pipe_io_out_bits_req_denied | (|_pipe_io_out_bits_req_opcode)
       & _pipe_io_out_bits_req_opcode != 3'h4 & _s3_queue_io_deq_bits_corrupt)
    | muxState_1 & s2_req_denied;
  assign io_task_ready = ~busy;
  assign io_bs_raddr_valid = io_bs_raddr_valid_0;
  assign io_bs_raddr_bits_way = s1_req_way;
  assign io_bs_raddr_bits_set = s1_req_set;
  assign io_bs_raddr_bits_beat = s1_beat;
  assign io_bypass_read_valid = io_bypass_read_valid_0;
  assign io_bypass_read_beat = s1_beat;
  assign io_bypass_read_id = s1_req_bufIdx;
  assign io_bypass_read_last = s1_last;
  assign io_bs_waddr_valid = io_bs_waddr_valid_0;
  assign io_bs_waddr_bits_way = s4_req_way;
  assign io_bs_waddr_bits_set = s4_req_set;
  assign io_bs_waddr_bits_beat = s4_beat;
  assign io_bs_wdata_data =
    {s4_pbdata_mask[31] ? s4_pbdata_data[255:248] : s4_rdata[255:248],
     s4_pbdata_mask[30] ? s4_pbdata_data[247:240] : s4_rdata[247:240],
     s4_pbdata_mask[29] ? s4_pbdata_data[239:232] : s4_rdata[239:232],
     s4_pbdata_mask[28] ? s4_pbdata_data[231:224] : s4_rdata[231:224],
     s4_pbdata_mask[27] ? s4_pbdata_data[223:216] : s4_rdata[223:216],
     s4_pbdata_mask[26] ? s4_pbdata_data[215:208] : s4_rdata[215:208],
     s4_pbdata_mask[25] ? s4_pbdata_data[207:200] : s4_rdata[207:200],
     s4_pbdata_mask[24] ? s4_pbdata_data[199:192] : s4_rdata[199:192],
     s4_pbdata_mask[23] ? s4_pbdata_data[191:184] : s4_rdata[191:184],
     s4_pbdata_mask[22] ? s4_pbdata_data[183:176] : s4_rdata[183:176],
     s4_pbdata_mask[21] ? s4_pbdata_data[175:168] : s4_rdata[175:168],
     s4_pbdata_mask[20] ? s4_pbdata_data[167:160] : s4_rdata[167:160],
     s4_pbdata_mask[19] ? s4_pbdata_data[159:152] : s4_rdata[159:152],
     s4_pbdata_mask[18] ? s4_pbdata_data[151:144] : s4_rdata[151:144],
     s4_pbdata_mask[17] ? s4_pbdata_data[143:136] : s4_rdata[143:136],
     s4_pbdata_mask[16] ? s4_pbdata_data[135:128] : s4_rdata[135:128],
     s4_pbdata_mask[15] ? s4_pbdata_data[127:120] : s4_rdata[127:120],
     s4_pbdata_mask[14] ? s4_pbdata_data[119:112] : s4_rdata[119:112],
     s4_pbdata_mask[13] ? s4_pbdata_data[111:104] : s4_rdata[111:104],
     s4_pbdata_mask[12] ? s4_pbdata_data[103:96] : s4_rdata[103:96],
     s4_pbdata_mask[11] ? s4_pbdata_data[95:88] : s4_rdata[95:88],
     s4_pbdata_mask[10] ? s4_pbdata_data[87:80] : s4_rdata[87:80],
     s4_pbdata_mask[9] ? s4_pbdata_data[79:72] : s4_rdata[79:72],
     s4_pbdata_mask[8] ? s4_pbdata_data[71:64] : s4_rdata[71:64],
     s4_pbdata_mask[7] ? s4_pbdata_data[63:56] : s4_rdata[63:56],
     s4_pbdata_mask[6] ? s4_pbdata_data[55:48] : s4_rdata[55:48],
     s4_pbdata_mask[5] ? s4_pbdata_data[47:40] : s4_rdata[47:40],
     s4_pbdata_mask[4] ? s4_pbdata_data[39:32] : s4_rdata[39:32],
     s4_pbdata_mask[3] ? s4_pbdata_data[31:24] : s4_rdata[31:24],
     s4_pbdata_mask[2] ? s4_pbdata_data[23:16] : s4_rdata[23:16],
     s4_pbdata_mask[1] ? s4_pbdata_data[15:8] : s4_rdata[15:8],
     s4_pbdata_mask[0] ? s4_pbdata_data[7:0] : s4_rdata[7:0]};
  assign io_sourceD_r_hazard_valid = busy & s1_needData;
  assign io_sourceD_r_hazard_bits_way = s1_req_reg_way;
  assign io_sourceD_r_hazard_bits_set = s1_req_reg_set;
  assign io_pb_pop_valid = io_pb_pop_valid_0;
  assign io_pb_pop_bits_bufIdx = s2_req_bufIdx;
  assign io_pb_pop_bits_count = s2_counter;
  assign io_pb_pop_bits_last = s2_last;
  assign io_resp_valid = io_bs_waddr_ready & io_bs_waddr_valid_0 & s4_last;
  assign io_resp_bits_sink = s4_req_sinkId;
endmodule

