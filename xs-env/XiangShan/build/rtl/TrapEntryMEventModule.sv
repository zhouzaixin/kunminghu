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

module TrapEntryMEventModule(
  input         valid,
  input         in_causeNO_Interrupt,
  input  [62:0] in_causeNO_ExceptionCode,
  input  [49:0] in_trapPc,
  input  [55:0] in_trapPcGPA,
  input         in_trapInst_valid,
  input  [31:0] in_trapInst_bits,
  input  [63:0] in_fetchMalTval,
  input         in_isCrossPageIPF,
  input         in_isHls,
  input         in_isFetchMalAddr,
  input         in_isFetchBkpt,
  input         in_trapIsForVSnonLeafPTE,
  input         in_hasDTExcp,
  input  [1:0]  in_iMode_PRVM,
  input         in_iMode_V,
  input         in_dMode_V,
  input  [1:0]  in_privState_PRVM,
  input         in_privState_V,
  input         in_mstatus_MIE,
  input  [63:0] in_pcFromXtvec,
  input  [3:0]  in_satp_MODE,
  input  [3:0]  in_vsatp_MODE,
  input  [3:0]  in_hgatp_MODE,
  input  [63:0] in_memExceptionVAddr,
  input  [63:0] in_memExceptionGPAddr,
  input         in_memExceptionIsForVSnonLeafPTE,
  output        out_privState_valid,
  output [1:0]  out_privState_bits_PRVM,
  output        out_privState_bits_V,
  output        out_mstatus_valid,
  output        out_mstatus_bits_SIE,
  output        out_mstatus_bits_MIE,
  output        out_mstatus_bits_SPIE,
  output        out_mstatus_bits_UBE,
  output        out_mstatus_bits_MPIE,
  output        out_mstatus_bits_SPP,
  output [1:0]  out_mstatus_bits_VS,
  output [1:0]  out_mstatus_bits_MPP,
  output [1:0]  out_mstatus_bits_FS,
  output [1:0]  out_mstatus_bits_XS,
  output        out_mstatus_bits_MPRV,
  output        out_mstatus_bits_SUM,
  output        out_mstatus_bits_MXR,
  output        out_mstatus_bits_TVM,
  output        out_mstatus_bits_TW,
  output        out_mstatus_bits_TSR,
  output        out_mstatus_bits_SDT,
  output [1:0]  out_mstatus_bits_UXL,
  output [1:0]  out_mstatus_bits_SXL,
  output        out_mstatus_bits_SBE,
  output        out_mstatus_bits_MBE,
  output        out_mstatus_bits_GVA,
  output        out_mstatus_bits_MPV,
  output        out_mstatus_bits_MDT,
  output        out_mstatus_bits_SD,
  output        out_mepc_valid,
  output [62:0] out_mepc_bits_epc,
  output        out_mcause_valid,
  output        out_mcause_bits_Interrupt,
  output [62:0] out_mcause_bits_ExceptionCode,
  output        out_mtval_valid,
  output [63:0] out_mtval_bits_ALL,
  output        out_mtval2_valid,
  output [63:0] out_mtval2_bits_ALL,
  output        out_mtinst_valid,
  output [63:0] out_mtinst_bits_ALL,
  output        out_targetPc_valid,
  output [63:0] out_targetPc_bits_pc,
  output        out_targetPc_bits_raiseIPF,
  output        out_targetPc_bits_raiseIAF,
  output        out_targetPc_bits_raiseIGPF
);

  wire        trapPC_isBare_v_PrvmIsM = &in_iMode_PRVM;
  wire        trapPC_isBare_isModeM = trapPC_isBare_v_PrvmIsM;
  wire        trapPC_isBare_PrvmIsU = in_iMode_PRVM == 2'h0;
  wire        trapPC_isBare_PrvmIsS = in_iMode_PRVM == 2'h1;
  wire        _trapPC_isSv48_T = trapPC_isBare_PrvmIsU | trapPC_isBare_PrvmIsS;
  wire        _trapPC_isSv48x4_T_2 = in_vsatp_MODE == 4'h0;
  wire [63:0] trapPC =
    (trapPC_isBare_isModeM | _trapPC_isSv48_T & ~in_iMode_V & in_satp_MODE == 4'h0
     | in_iMode_V & _trapPC_isSv48x4_T_2 & in_hgatp_MODE == 4'h0
       ? {16'h0, in_trapPc[47:0]}
       : 64'h0)
    | (_trapPC_isSv48_T & ~in_iMode_V & in_satp_MODE == 4'h8 | in_iMode_V
       & in_vsatp_MODE == 4'h8
         ? {{25{in_trapPc[38]}}, in_trapPc[38:0]}
         : 64'h0)
    | (in_iMode_V & _trapPC_isSv48x4_T_2 & in_hgatp_MODE == 4'h8
         ? {23'h0, in_trapPc[40:0]}
         : 64'h0)
    | (_trapPC_isSv48_T & ~in_iMode_V & in_satp_MODE == 4'h9 | in_iMode_V
       & in_vsatp_MODE == 4'h9
         ? {{16{in_trapPc[47]}}, in_trapPc[47:0]}
         : 64'h0)
    | (in_iMode_V & _trapPC_isSv48x4_T_2 & in_hgatp_MODE == 4'h9
         ? {14'h0, in_trapPc}
         : 64'h0);
  wire        isFetchExcp =
    ~in_causeNO_Interrupt
    & (in_causeNO_ExceptionCode == 63'h0 | in_causeNO_ExceptionCode == 63'h1
       | in_causeNO_ExceptionCode == 63'hC);
  wire        isMemExcp =
    ~in_causeNO_Interrupt
    & (in_causeNO_ExceptionCode == 63'h4 | in_causeNO_ExceptionCode == 63'h5
       | in_causeNO_ExceptionCode == 63'hD | in_causeNO_ExceptionCode == 63'h6
       | in_causeNO_ExceptionCode == 63'h7 | in_causeNO_ExceptionCode == 63'hF);
  wire        isBpExcp = ~in_causeNO_Interrupt & in_causeNO_ExceptionCode == 63'h3;
  wire        isFetchBkpt = isBpExcp & in_isFetchBkpt;
  wire        isLSGuestExcp =
    ~in_causeNO_Interrupt
    & (in_causeNO_ExceptionCode == 63'h15 | in_causeNO_ExceptionCode == 63'h17);
  wire        isFetchGuestExcp =
    ~in_causeNO_Interrupt & in_causeNO_ExceptionCode == 63'h14;
  wire        _tvalFillPcPlus2_T = isFetchExcp | isFetchGuestExcp;
  wire        tvalFillMemVaddr = isMemExcp | isBpExcp & ~in_isFetchBkpt;
  wire        tvalFillGVA =
    ~in_causeNO_Interrupt & in_isHls & isMemExcp | isLSGuestExcp | isFetchGuestExcp
    | (isFetchExcp | isFetchBkpt) & in_iMode_V | tvalFillMemVaddr & in_dMode_V;
  wire [63:0] _tval_T_8 =
    (_tvalFillPcPlus2_T & ~in_isCrossPageIPF | isFetchBkpt ? trapPC : 64'h0)
    | (_tvalFillPcPlus2_T & in_isCrossPageIPF ? 64'(trapPC + 64'h2) : 64'h0)
    | (tvalFillMemVaddr | isLSGuestExcp ? in_memExceptionVAddr : 64'h0);
  wire [55:0] _tval2_T_8 = 56'(in_trapPcGPA + 56'h2);
  wire [61:0] _tval2_T_10 =
    isFetchGuestExcp & in_isFetchMalAddr ? in_fetchMalTval[63:2] : 62'h0;
  assign out_privState_valid = valid;
  assign out_privState_bits_PRVM = 2'h3;
  assign out_privState_bits_V = 1'h0;
  assign out_mstatus_valid = valid;
  assign out_mstatus_bits_SIE = 1'h0;
  assign out_mstatus_bits_MIE = 1'h0;
  assign out_mstatus_bits_SPIE = 1'h0;
  assign out_mstatus_bits_UBE = 1'h0;
  assign out_mstatus_bits_MPIE = in_mstatus_MIE;
  assign out_mstatus_bits_SPP = 1'h0;
  assign out_mstatus_bits_VS = 2'h0;
  assign out_mstatus_bits_MPP = in_privState_PRVM;
  assign out_mstatus_bits_FS = 2'h0;
  assign out_mstatus_bits_XS = 2'h0;
  assign out_mstatus_bits_MPRV = 1'h0;
  assign out_mstatus_bits_SUM = 1'h0;
  assign out_mstatus_bits_MXR = 1'h0;
  assign out_mstatus_bits_TVM = 1'h0;
  assign out_mstatus_bits_TW = 1'h0;
  assign out_mstatus_bits_TSR = 1'h0;
  assign out_mstatus_bits_SDT = 1'h0;
  assign out_mstatus_bits_UXL = 2'h0;
  assign out_mstatus_bits_SXL = 2'h0;
  assign out_mstatus_bits_SBE = 1'h0;
  assign out_mstatus_bits_MBE = 1'h0;
  assign out_mstatus_bits_GVA = tvalFillGVA;
  assign out_mstatus_bits_MPV = in_privState_V;
  assign out_mstatus_bits_MDT = 1'h1;
  assign out_mstatus_bits_SD = 1'h0;
  assign out_mepc_valid = valid;
  assign out_mepc_bits_epc = in_isFetchMalAddr ? in_fetchMalTval[63:1] : trapPC[63:1];
  assign out_mcause_valid = valid;
  assign out_mcause_bits_Interrupt = in_causeNO_Interrupt;
  assign out_mcause_bits_ExceptionCode = in_hasDTExcp ? 63'h10 : in_causeNO_ExceptionCode;
  assign out_mtval_valid = valid;
  assign out_mtval_bits_ALL =
    in_isFetchMalAddr
      ? in_fetchMalTval
      : {_tval_T_8[63:32],
         _tval_T_8[31:0]
           | (~in_causeNO_Interrupt
              & (in_causeNO_ExceptionCode == 63'h2 | in_causeNO_ExceptionCode == 63'h16)
              & in_trapInst_valid
                ? in_trapInst_bits
                : 32'h0)};
  assign out_mtval2_valid = valid;
  assign out_mtval2_bits_ALL =
    in_hasDTExcp
      ? {in_causeNO_Interrupt, in_causeNO_ExceptionCode}
      : {2'h0,
         {_tval2_T_10[61:54],
          _tval2_T_10[53:0]
            | (isFetchGuestExcp & ~in_isFetchMalAddr & ~in_isCrossPageIPF
                 ? in_trapPcGPA[55:2]
                 : 54'h0)
            | (isFetchGuestExcp & ~in_isFetchMalAddr & in_isCrossPageIPF
                 ? _tval2_T_8[55:2]
                 : 54'h0)} | (isLSGuestExcp ? in_memExceptionGPAddr[63:2] : 62'h0)};
  assign out_mtinst_valid = valid;
  assign out_mtinst_bits_ALL =
    {50'h0,
     isFetchGuestExcp & in_trapIsForVSnonLeafPTE | isLSGuestExcp
     & in_memExceptionIsForVSnonLeafPTE
       ? 14'h3000
       : 14'h0};
  assign out_targetPc_valid = valid;
  assign out_targetPc_bits_pc = in_pcFromXtvec;
  assign out_targetPc_bits_raiseIPF = 1'h0;
  assign out_targetPc_bits_raiseIAF = |(in_pcFromXtvec[63:48]);
  assign out_targetPc_bits_raiseIGPF = 1'h0;
endmodule

