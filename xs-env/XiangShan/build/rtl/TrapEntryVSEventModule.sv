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

module TrapEntryVSEventModule(
  input         valid,
  input         in_causeNO_Interrupt,
  input  [62:0] in_causeNO_ExceptionCode,
  input  [49:0] in_trapPc,
  input         in_trapInst_valid,
  input  [31:0] in_trapInst_bits,
  input  [63:0] in_fetchMalTval,
  input         in_isCrossPageIPF,
  input         in_isFetchMalAddr,
  input         in_isFetchBkpt,
  input  [1:0]  in_iMode_PRVM,
  input         in_iMode_V,
  input         in_dMode_V,
  input  [1:0]  in_privState_PRVM,
  input         in_vsstatus_SIE,
  input         in_henvcfg_DTE,
  input  [63:0] in_pcFromXtvec,
  input  [3:0]  in_satp_MODE,
  input  [3:0]  in_vsatp_MODE,
  input  [3:0]  in_hgatp_MODE,
  input  [63:0] in_memExceptionVAddr,
  input         in_virtualInterruptIsHvictlInject,
  input  [11:0] in_hvictlIID,
  output        out_privState_valid,
  output [1:0]  out_privState_bits_PRVM,
  output        out_privState_bits_V,
  output        out_vsstatus_valid,
  output        out_vsstatus_bits_SIE,
  output        out_vsstatus_bits_SPIE,
  output        out_vsstatus_bits_UBE,
  output        out_vsstatus_bits_SPP,
  output [1:0]  out_vsstatus_bits_VS,
  output [1:0]  out_vsstatus_bits_FS,
  output [1:0]  out_vsstatus_bits_XS,
  output        out_vsstatus_bits_SUM,
  output        out_vsstatus_bits_MXR,
  output        out_vsstatus_bits_SDT,
  output [1:0]  out_vsstatus_bits_UXL,
  output        out_vsstatus_bits_SD,
  output        out_vsepc_valid,
  output [62:0] out_vsepc_bits_epc,
  output        out_vscause_valid,
  output        out_vscause_bits_Interrupt,
  output [62:0] out_vscause_bits_ExceptionCode,
  output        out_vstval_valid,
  output [63:0] out_vstval_bits_ALL,
  output        out_targetPc_valid,
  output [63:0] out_targetPc_bits_pc,
  output        out_targetPc_bits_raiseIPF,
  output        out_targetPc_bits_raiseIAF,
  output        out_targetPc_bits_raiseIGPF
);

  wire [62:0] highPrioTrapNO =
    (in_causeNO_ExceptionCode == 63'h2 | in_causeNO_ExceptionCode == 63'h6
     | in_causeNO_ExceptionCode == 63'hA) & in_causeNO_Interrupt
      ? 63'(in_causeNO_ExceptionCode - 63'h1)
      : in_causeNO_ExceptionCode;
  wire        trapPC_isBare_v_PrvmIsM = &in_iMode_PRVM;
  wire        trapPC_isBare_isModeM = trapPC_isBare_v_PrvmIsM;
  wire        trapPC_isBare_PrvmIsU = in_iMode_PRVM == 2'h0;
  wire        trapPC_isBare_PrvmIsS = in_iMode_PRVM == 2'h1;
  wire        _trapPC_isSv48_T = trapPC_isBare_PrvmIsU | trapPC_isBare_PrvmIsS;
  wire        _instrAddrTransType_x5_T = in_vsatp_MODE == 4'h0;
  wire        _instrAddrTransType_x1_T_1 = in_hgatp_MODE == 4'h0;
  wire        instrAddrTransType_x2 = in_vsatp_MODE == 4'h8;
  wire        instrAddrTransType_x3 = in_vsatp_MODE == 4'h9;
  wire        _instrAddrTransType_x4_T_1 = in_hgatp_MODE == 4'h8;
  wire        _instrAddrTransType_x5_T_1 = in_hgatp_MODE == 4'h9;
  wire [63:0] trapPC =
    (trapPC_isBare_isModeM | _trapPC_isSv48_T & ~in_iMode_V & in_satp_MODE == 4'h0
     | in_iMode_V & _instrAddrTransType_x5_T & _instrAddrTransType_x1_T_1
       ? {16'h0, in_trapPc[47:0]}
       : 64'h0)
    | (_trapPC_isSv48_T & ~in_iMode_V & in_satp_MODE == 4'h8 | in_iMode_V
       & instrAddrTransType_x2
         ? {{25{in_trapPc[38]}}, in_trapPc[38:0]}
         : 64'h0)
    | (in_iMode_V & _instrAddrTransType_x5_T & _instrAddrTransType_x4_T_1
         ? {23'h0, in_trapPc[40:0]}
         : 64'h0)
    | (_trapPC_isSv48_T & ~in_iMode_V & in_satp_MODE == 4'h9 | in_iMode_V
       & instrAddrTransType_x3
         ? {{16{in_trapPc[47]}}, in_trapPc[47:0]}
         : 64'h0)
    | (in_iMode_V & _instrAddrTransType_x5_T & _instrAddrTransType_x5_T_1
         ? {14'h0, in_trapPc}
         : 64'h0);
  wire        isFetchExcp =
    ~in_causeNO_Interrupt & (highPrioTrapNO == 63'h1 | highPrioTrapNO == 63'hC);
  wire        isBpExcp = ~in_causeNO_Interrupt & highPrioTrapNO == 63'h3;
  wire        isFetchBkpt = isBpExcp & in_isFetchBkpt;
  wire        tvalFillMemVaddr =
    ~in_causeNO_Interrupt
    & (highPrioTrapNO == 63'h4 | highPrioTrapNO == 63'h5 | highPrioTrapNO == 63'h6
       | highPrioTrapNO == 63'h7 | highPrioTrapNO == 63'hD | highPrioTrapNO == 63'hF)
    | isBpExcp & ~in_isFetchBkpt;
  wire        tvalFillGVA =
    (isFetchExcp | isFetchBkpt) & in_iMode_V | tvalFillMemVaddr & in_dMode_V;
  wire [63:0] _tval_T_7 =
    (isFetchExcp & ~in_isCrossPageIPF | isFetchBkpt ? trapPC : 64'h0)
    | (isFetchExcp & in_isCrossPageIPF ? 64'(trapPC + 64'h2) : 64'h0)
    | (tvalFillMemVaddr ? in_memExceptionVAddr : 64'h0);
  assign out_privState_valid = valid;
  assign out_privState_bits_PRVM = 2'h1;
  assign out_privState_bits_V = 1'h1;
  assign out_vsstatus_valid = valid;
  assign out_vsstatus_bits_SIE = 1'h0;
  assign out_vsstatus_bits_SPIE = in_vsstatus_SIE;
  assign out_vsstatus_bits_UBE = 1'h0;
  assign out_vsstatus_bits_SPP = in_privState_PRVM[0];
  assign out_vsstatus_bits_VS = 2'h0;
  assign out_vsstatus_bits_FS = 2'h0;
  assign out_vsstatus_bits_XS = 2'h0;
  assign out_vsstatus_bits_SUM = 1'h0;
  assign out_vsstatus_bits_MXR = 1'h0;
  assign out_vsstatus_bits_SDT = in_henvcfg_DTE;
  assign out_vsstatus_bits_UXL = 2'h0;
  assign out_vsstatus_bits_SD = 1'h0;
  assign out_vsepc_valid = valid;
  assign out_vsepc_bits_epc = in_isFetchMalAddr ? in_fetchMalTval[63:1] : trapPC[63:1];
  assign out_vscause_valid = valid;
  assign out_vscause_bits_Interrupt = in_causeNO_Interrupt;
  assign out_vscause_bits_ExceptionCode =
    in_virtualInterruptIsHvictlInject ? {51'h0, in_hvictlIID} : highPrioTrapNO;
  assign out_vstval_valid = valid;
  assign out_vstval_bits_ALL =
    in_isFetchMalAddr
      ? in_fetchMalTval
      : {_tval_T_7[63:32],
         _tval_T_7[31:0]
           | (~in_causeNO_Interrupt & (highPrioTrapNO == 63'h2 | highPrioTrapNO == 63'h16)
              & in_trapInst_valid
                ? in_trapInst_bits
                : 32'h0)};
  assign out_targetPc_valid = valid;
  assign out_targetPc_bits_pc = in_pcFromXtvec;
  assign out_targetPc_bits_raiseIPF =
    instrAddrTransType_x2 & in_pcFromXtvec[63:39] != {25{in_pcFromXtvec[38]}}
    | instrAddrTransType_x3 & in_pcFromXtvec[63:48] != {16{in_pcFromXtvec[47]}};
  assign out_targetPc_bits_raiseIAF =
    _instrAddrTransType_x5_T & _instrAddrTransType_x1_T_1 & (|(in_pcFromXtvec[63:48]));
  assign out_targetPc_bits_raiseIGPF =
    _instrAddrTransType_x5_T & _instrAddrTransType_x4_T_1 & (|(in_pcFromXtvec[63:41]))
    | _instrAddrTransType_x5_T & _instrAddrTransType_x5_T_1 & (|(in_pcFromXtvec[63:50]));
endmodule

