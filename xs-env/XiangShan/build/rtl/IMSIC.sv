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

module IMSIC(
  input         clock,
  input         reset,
  input         i_msiInfo_valid,
  input  [11:0] i_msiInfo_bits_info,
  input         i_hartId,
  input         i_csr_addr_valid,
  input  [11:0] i_csr_addr_bits_addr,
  input  [1:0]  i_csr_addr_bits_prvm,
  input         i_csr_addr_bits_v,
  input  [5:0]  i_csr_vgein,
  input         i_csr_mClaim,
  input         i_csr_sClaim,
  input         i_csr_vsClaim,
  input         i_csr_wdata_valid,
  input  [1:0]  i_csr_wdata_bits_op,
  input  [63:0] i_csr_wdata_bits_data,
  output        o_csr_rdata_valid,
  output [63:0] o_csr_rdata_bits_rdata,
  output        o_csr_rdata_bits_illegal,
  output        o_meip,
  output        o_seip,
  output [4:0]  o_vseip,
  output [31:0] o_mtopei,
  output [31:0] o_stopei,
  output [31:0] o_vstopei
);

  wire [6:0] _imsicTop_o_irq;
  imsic_csr_top #(
    .EID_VLD_DLY_NUM(0),
    .NR_HARTS(1),
    .NR_INTP_FILES(7),
    .NR_SRC(256),
    .XLEN(64)
  ) imsicTop (
    .csr_clk         (clock),
    .csr_rst         (reset),
    .hart_id         (i_hartId),
    .i_msi_info      (i_msiInfo_bits_info),
    .i_msi_info_vld  (i_msiInfo_valid),
    .i_csr_addr_vld  (i_csr_addr_valid),
    .i_csr_addr      (i_csr_addr_bits_addr),
    .i_csr_priv_lvl  (i_csr_addr_bits_prvm),
    .i_csr_v         (i_csr_addr_bits_v),
    .i_csr_vgein     (i_csr_vgein),
    .i_csr_claim     ({i_csr_vsClaim, i_csr_sClaim, i_csr_mClaim}),
    .i_csr_wdata_vld (i_csr_wdata_valid),
    .i_csr_wdata_op  (i_csr_wdata_bits_op),
    .i_csr_wdata     (i_csr_wdata_bits_data),
    .o_csr_rdata_vld (o_csr_rdata_valid),
    .o_csr_rdata     (o_csr_rdata_bits_rdata),
    .o_csr_illegal   (o_csr_rdata_bits_illegal),
    .o_irq           (_imsicTop_o_irq),
    .o_mtopei        (o_mtopei),
    .o_stopei        (o_stopei),
    .o_vstopei       (o_vstopei)
  );
  assign o_meip = _imsicTop_o_irq[0];
  assign o_seip = _imsicTop_o_irq[1];
  assign o_vseip = _imsicTop_o_irq[6:2];
endmodule

