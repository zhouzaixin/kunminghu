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

module VSstatusModule(
  input         clock,
  input         reset,
  input         w_wen,
  input  [63:0] w_wdata,
  output [63:0] rdata,
  output        regOut_SIE,
  output        regOut_SPIE,
  output        regOut_SPP,
  output [1:0]  regOut_VS,
  output [1:0]  regOut_FS,
  output        regOut_SUM,
  output        regOut_MXR,
  output        regOut_SDT,
  input         retFromS_vsstatus_valid,
  input         retFromS_vsstatus_bits_SIE,
  input         retFromS_vsstatus_bits_SPIE,
  input         retFromS_vsstatus_bits_SPP,
  input         retFromS_vsstatus_bits_SDT,
  input         retFromM_vsstatus_valid,
  input         retFromM_vsstatus_bits_SDT,
  input         retFromMN_vsstatus_valid,
  input         retFromMN_vsstatus_bits_SDT,
  input         retFromD_vsstatus_valid,
  input         retFromD_vsstatus_bits_SDT,
  input         trapToVS_vsstatus_valid,
  input         trapToVS_vsstatus_bits_SIE,
  input         trapToVS_vsstatus_bits_SPIE,
  input         trapToVS_vsstatus_bits_SPP,
  input         trapToVS_vsstatus_bits_SDT,
  input         robCommit_fsDirty,
  input         robCommit_vsDirty,
  input         writeFCSR,
  input         writeVCSR,
  input         isVirtMode,
  input         menvcfg_DTE,
  input         henvcfg_DTE
);

  wire       _regOut_SDT_output;
  reg        reg_SIE;
  reg        reg_SPIE;
  reg        reg_SPP;
  reg  [1:0] reg_VS;
  reg  [1:0] reg_FS;
  reg        reg_SUM;
  reg        reg_MXR;
  reg        reg_SDT;
  assign _regOut_SDT_output = menvcfg_DTE & henvcfg_DTE & reg_SDT;
  wire       _GEN = w_wen | retFromS_vsstatus_valid | trapToVS_vsstatus_valid;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      reg_SIE <= 1'h0;
      reg_SPIE <= 1'h0;
      reg_SPP <= 1'h0;
      reg_VS <= 2'h0;
      reg_FS <= 2'h0;
      reg_SUM <= 1'h0;
      reg_MXR <= 1'h0;
      reg_SDT <= 1'h0;
    end
    else begin
      reg_SIE <=
        ~(menvcfg_DTE & henvcfg_DTE & w_wdata[24] & w_wen)
        & (_GEN
             ? retFromS_vsstatus_valid & retFromS_vsstatus_bits_SIE
               | trapToVS_vsstatus_valid & trapToVS_vsstatus_bits_SIE | w_wen & w_wdata[1]
             : reg_SIE);
      if (_GEN) begin
        reg_SPIE <=
          retFromS_vsstatus_valid & retFromS_vsstatus_bits_SPIE | trapToVS_vsstatus_valid
          & trapToVS_vsstatus_bits_SPIE | w_wen & w_wdata[5];
        reg_SPP <=
          retFromS_vsstatus_valid & retFromS_vsstatus_bits_SPP | trapToVS_vsstatus_valid
          & trapToVS_vsstatus_bits_SPP | w_wen & w_wdata[8];
      end
      if ((robCommit_vsDirty | writeVCSR) & isVirtMode)
        reg_VS <= 2'h3;
      else if (w_wen)
        reg_VS <= w_wdata[10:9];
      if ((robCommit_fsDirty | writeFCSR) & isVirtMode)
        reg_FS <= 2'h3;
      else if (w_wen)
        reg_FS <= w_wdata[14:13];
      if (w_wen) begin
        reg_SUM <= w_wdata[18];
        reg_MXR <= w_wdata[19];
      end
      if (w_wen | retFromS_vsstatus_valid | retFromM_vsstatus_valid
          | retFromMN_vsstatus_valid | retFromD_vsstatus_valid | trapToVS_vsstatus_valid)
        reg_SDT <=
          retFromS_vsstatus_valid & retFromS_vsstatus_bits_SDT | retFromM_vsstatus_valid
          & retFromM_vsstatus_bits_SDT | retFromMN_vsstatus_valid
          & retFromMN_vsstatus_bits_SDT | retFromD_vsstatus_valid
          & retFromD_vsstatus_bits_SDT | trapToVS_vsstatus_valid
          & trapToVS_vsstatus_bits_SDT | w_wen & w_wdata[24];
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:0];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM[/*Zero width*/ 1'b0] = `RANDOM;
        reg_SIE = _RANDOM[/*Zero width*/ 1'b0][0];
        reg_SPIE = _RANDOM[/*Zero width*/ 1'b0][1];
        reg_SPP = _RANDOM[/*Zero width*/ 1'b0][3];
        reg_VS = _RANDOM[/*Zero width*/ 1'b0][5:4];
        reg_FS = _RANDOM[/*Zero width*/ 1'b0][7:6];
        reg_SUM = _RANDOM[/*Zero width*/ 1'b0][10];
        reg_MXR = _RANDOM[/*Zero width*/ 1'b0][11];
        reg_SDT = _RANDOM[/*Zero width*/ 1'b0][12];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        reg_SIE = 1'h0;
        reg_SPIE = 1'h0;
        reg_SPP = 1'h0;
        reg_VS = 2'h0;
        reg_FS = 2'h0;
        reg_SUM = 1'h0;
        reg_MXR = 1'h0;
        reg_SDT = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign rdata =
    {(&reg_FS) | (&reg_VS),
     38'h100,
     _regOut_SDT_output,
     4'h0,
     reg_MXR,
     reg_SUM,
     3'h0,
     reg_FS,
     2'h0,
     reg_VS,
     reg_SPP,
     2'h0,
     reg_SPIE,
     3'h0,
     reg_SIE,
     1'h0};
  assign regOut_SIE = reg_SIE;
  assign regOut_SPIE = reg_SPIE;
  assign regOut_SPP = reg_SPP;
  assign regOut_VS = reg_VS;
  assign regOut_FS = reg_FS;
  assign regOut_SUM = reg_SUM;
  assign regOut_MXR = reg_MXR;
  assign regOut_SDT = _regOut_SDT_output;
endmodule

