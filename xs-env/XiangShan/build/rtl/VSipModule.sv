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

module VSipModule(
  input         w_wen,
  input  [63:0] w_wdata,
  output [63:0] rdata,
  output        regOut_SSIP,
  output        regOut_STIP,
  output        regOut_SEIP,
  output        regOut_LCOFIP,
  output        regOut_LC14IP,
  output        regOut_LC15IP,
  output        regOut_LC16IP,
  output        regOut_LC17IP,
  output        regOut_LC18IP,
  output        regOut_LC19IP,
  output        regOut_LC20IP,
  output        regOut_LC21IP,
  output        regOut_LC22IP,
  output        regOut_LC23IP,
  output        regOut_LC24IP,
  output        regOut_LC25IP,
  output        regOut_LC26IP,
  output        regOut_LC27IP,
  output        regOut_LC28IP,
  output        regOut_LC29IP,
  output        regOut_LC30IP,
  output        regOut_LC31IP,
  output        regOut_LC32IP,
  output        regOut_LC33IP,
  output        regOut_LC34IP,
  output        regOut_LPRASEIP,
  output        regOut_LC36IP,
  output        regOut_LC37IP,
  output        regOut_LC38IP,
  output        regOut_LC39IP,
  output        regOut_LC40IP,
  output        regOut_LC41IP,
  output        regOut_LC42IP,
  output        regOut_HPRASEIP,
  output        regOut_LC44IP,
  output        regOut_LC45IP,
  output        regOut_LC46IP,
  output        regOut_LC47IP,
  output        regOut_LC48IP,
  output        regOut_LC49IP,
  output        regOut_LC50IP,
  output        regOut_LC51IP,
  output        regOut_LC52IP,
  output        regOut_LC53IP,
  output        regOut_LC54IP,
  output        regOut_LC55IP,
  output        regOut_LC56IP,
  output        regOut_LC57IP,
  output        regOut_LC58IP,
  output        regOut_LC59IP,
  output        regOut_LC60IP,
  output        regOut_LC61IP,
  output        regOut_LC62IP,
  output        regOut_LC63IP,
  input         mideleg_SSI,
  input         mideleg_STI,
  input         mideleg_SEI,
  input         mideleg_LCOFI,
  input         mip_SSIP,
  input         mip_VSSIP,
  input         mip_MSIP,
  input         mip_STIP,
  input         mip_VSTIP,
  input         mip_MTIP,
  input         mip_SEIP,
  input         mip_VSEIP,
  input         mip_MEIP,
  input         mip_SGEIP,
  input         mip_LCOFIP,
  input         mip_LC14IP,
  input         mip_LC15IP,
  input         mip_LC16IP,
  input         mip_LC17IP,
  input         mip_LC18IP,
  input         mip_LC19IP,
  input         mip_LC20IP,
  input         mip_LC21IP,
  input         mip_LC22IP,
  input         mip_LC23IP,
  input         mip_LC24IP,
  input         mip_LC25IP,
  input         mip_LC26IP,
  input         mip_LC27IP,
  input         mip_LC28IP,
  input         mip_LC29IP,
  input         mip_LC30IP,
  input         mip_LC31IP,
  input         mip_LC32IP,
  input         mip_LC33IP,
  input         mip_LC34IP,
  input         mip_LPRASEIP,
  input         mip_LC36IP,
  input         mip_LC37IP,
  input         mip_LC38IP,
  input         mip_LC39IP,
  input         mip_LC40IP,
  input         mip_LC41IP,
  input         mip_LC42IP,
  input         mip_HPRASEIP,
  input         mip_LC44IP,
  input         mip_LC45IP,
  input         mip_LC46IP,
  input         mip_LC47IP,
  input         mip_LC48IP,
  input         mip_LC49IP,
  input         mip_LC50IP,
  input         mip_LC51IP,
  input         mip_LC52IP,
  input         mip_LC53IP,
  input         mip_LC54IP,
  input         mip_LC55IP,
  input         mip_LC56IP,
  input         mip_LC57IP,
  input         mip_LC58IP,
  input         mip_LC59IP,
  input         mip_LC60IP,
  input         mip_LC61IP,
  input         mip_LC62IP,
  input         mip_LC63IP,
  input         mvip_SSIP,
  input         mvip_STIP,
  input         mvip_SEIP,
  input         mvip_LCOFIP,
  input         mvip_LC14IP,
  input         mvip_LC15IP,
  input         mvip_LC16IP,
  input         mvip_LC17IP,
  input         mvip_LC18IP,
  input         mvip_LC19IP,
  input         mvip_LC20IP,
  input         mvip_LC21IP,
  input         mvip_LC22IP,
  input         mvip_LC23IP,
  input         mvip_LC24IP,
  input         mvip_LC25IP,
  input         mvip_LC26IP,
  input         mvip_LC27IP,
  input         mvip_LC28IP,
  input         mvip_LC29IP,
  input         mvip_LC30IP,
  input         mvip_LC31IP,
  input         mvip_LC32IP,
  input         mvip_LC33IP,
  input         mvip_LC34IP,
  input         mvip_LPRASEIP,
  input         mvip_LC36IP,
  input         mvip_LC37IP,
  input         mvip_LC38IP,
  input         mvip_LC39IP,
  input         mvip_LC40IP,
  input         mvip_LC41IP,
  input         mvip_LC42IP,
  input         mvip_HPRASEIP,
  input         mvip_LC44IP,
  input         mvip_LC45IP,
  input         mvip_LC46IP,
  input         mvip_LC47IP,
  input         mvip_LC48IP,
  input         mvip_LC49IP,
  input         mvip_LC50IP,
  input         mvip_LC51IP,
  input         mvip_LC52IP,
  input         mvip_LC53IP,
  input         mvip_LC54IP,
  input         mvip_LC55IP,
  input         mvip_LC56IP,
  input         mvip_LC57IP,
  input         mvip_LC58IP,
  input         mvip_LC59IP,
  input         mvip_LC60IP,
  input         mvip_LC61IP,
  input         mvip_LC62IP,
  input         mvip_LC63IP,
  input         mvien_SSIE,
  input         mvien_SEIE,
  input         mvien_LCOFIE,
  input         mvien_LC14IE,
  input         mvien_LC15IE,
  input         mvien_LC16IE,
  input         mvien_LC17IE,
  input         mvien_LC18IE,
  input         mvien_LC19IE,
  input         mvien_LC20IE,
  input         mvien_LC21IE,
  input         mvien_LC22IE,
  input         mvien_LC23IE,
  input         mvien_LC24IE,
  input         mvien_LC25IE,
  input         mvien_LC26IE,
  input         mvien_LC27IE,
  input         mvien_LC28IE,
  input         mvien_LC29IE,
  input         mvien_LC30IE,
  input         mvien_LC31IE,
  input         mvien_LC32IE,
  input         mvien_LC33IE,
  input         mvien_LC34IE,
  input         mvien_LPRASEIE,
  input         mvien_LC36IE,
  input         mvien_LC37IE,
  input         mvien_LC38IE,
  input         mvien_LC39IE,
  input         mvien_LC40IE,
  input         mvien_LC41IE,
  input         mvien_LC42IE,
  input         mvien_HPRASEIE,
  input         mvien_LC44IE,
  input         mvien_LC45IE,
  input         mvien_LC46IE,
  input         mvien_LC47IE,
  input         mvien_LC48IE,
  input         mvien_LC49IE,
  input         mvien_LC50IE,
  input         mvien_LC51IE,
  input         mvien_LC52IE,
  input         mvien_LC53IE,
  input         mvien_LC54IE,
  input         mvien_LC55IE,
  input         mvien_LC56IE,
  input         mvien_LC57IE,
  input         mvien_LC58IE,
  input         mvien_LC59IE,
  input         mvien_LC60IE,
  input         mvien_LC61IE,
  input         mvien_LC62IE,
  input         mvien_LC63IE,
  input         hideleg_SSI,
  input         hideleg_VSSI,
  input         hideleg_MSI,
  input         hideleg_STI,
  input         hideleg_VSTI,
  input         hideleg_MTI,
  input         hideleg_SEI,
  input         hideleg_VSEI,
  input         hideleg_MEI,
  input         hideleg_SGEI,
  input         hideleg_LCOFI,
  input         hvien_LCOFIE,
  input         hvien_LC14IE,
  input         hvien_LC15IE,
  input         hvien_LC16IE,
  input         hvien_LC17IE,
  input         hvien_LC18IE,
  input         hvien_LC19IE,
  input         hvien_LC20IE,
  input         hvien_LC21IE,
  input         hvien_LC22IE,
  input         hvien_LC23IE,
  input         hvien_LC24IE,
  input         hvien_LC25IE,
  input         hvien_LC26IE,
  input         hvien_LC27IE,
  input         hvien_LC28IE,
  input         hvien_LC29IE,
  input         hvien_LC30IE,
  input         hvien_LC31IE,
  input         hvien_LC32IE,
  input         hvien_LC33IE,
  input         hvien_LC34IE,
  input         hvien_LPRASEIE,
  input         hvien_LC36IE,
  input         hvien_LC37IE,
  input         hvien_LC38IE,
  input         hvien_LC39IE,
  input         hvien_LC40IE,
  input         hvien_LC41IE,
  input         hvien_LC42IE,
  input         hvien_HPRASEIE,
  input         hvien_LC44IE,
  input         hvien_LC45IE,
  input         hvien_LC46IE,
  input         hvien_LC47IE,
  input         hvien_LC48IE,
  input         hvien_LC49IE,
  input         hvien_LC50IE,
  input         hvien_LC51IE,
  input         hvien_LC52IE,
  input         hvien_LC53IE,
  input         hvien_LC54IE,
  input         hvien_LC55IE,
  input         hvien_LC56IE,
  input         hvien_LC57IE,
  input         hvien_LC58IE,
  input         hvien_LC59IE,
  input         hvien_LC60IE,
  input         hvien_LC61IE,
  input         hvien_LC62IE,
  input         hvien_LC63IE,
  input         hvip_VSSIP,
  input         hvip_VSTIP,
  input         hvip_VSEIP,
  input         hvip_LCOFIP,
  input         hvip_LC14IP,
  input         hvip_LC15IP,
  input         hvip_LC16IP,
  input         hvip_LC17IP,
  input         hvip_LC18IP,
  input         hvip_LC19IP,
  input         hvip_LC20IP,
  input         hvip_LC21IP,
  input         hvip_LC22IP,
  input         hvip_LC23IP,
  input         hvip_LC24IP,
  input         hvip_LC25IP,
  input         hvip_LC26IP,
  input         hvip_LC27IP,
  input         hvip_LC28IP,
  input         hvip_LC29IP,
  input         hvip_LC30IP,
  input         hvip_LC31IP,
  input         hvip_LC32IP,
  input         hvip_LC33IP,
  input         hvip_LC34IP,
  input         hvip_LPRASEIP,
  input         hvip_LC36IP,
  input         hvip_LC37IP,
  input         hvip_LC38IP,
  input         hvip_LC39IP,
  input         hvip_LC40IP,
  input         hvip_LC41IP,
  input         hvip_LC42IP,
  input         hvip_HPRASEIP,
  input         hvip_LC44IP,
  input         hvip_LC45IP,
  input         hvip_LC46IP,
  input         hvip_LC47IP,
  input         hvip_LC48IP,
  input         hvip_LC49IP,
  input         hvip_LC50IP,
  input         hvip_LC51IP,
  input         hvip_LC52IP,
  input         hvip_LC53IP,
  input         hvip_LC54IP,
  input         hvip_LC55IP,
  input         hvip_LC56IP,
  input         hvip_LC57IP,
  input         hvip_LC58IP,
  input         hvip_LC59IP,
  input         hvip_LC60IP,
  input         hvip_LC61IP,
  input         hvip_LC62IP,
  input         hvip_LC63IP,
  output        toMip_LCOFIP_valid,
  output        toMip_LCOFIP_bits,
  output        toMvip_LCOFIP_valid,
  output        toMvip_LCOFIP_bits,
  output        toHvip_VSSIP_valid,
  output        toHvip_VSSIP_bits,
  output        toHvip_LCOFIP_valid,
  output        toHvip_LCOFIP_bits,
  output        toHvip_LC14IP_valid,
  output        toHvip_LC14IP_bits,
  output        toHvip_LC15IP_valid,
  output        toHvip_LC15IP_bits,
  output        toHvip_LC16IP_valid,
  output        toHvip_LC16IP_bits,
  output        toHvip_LC17IP_valid,
  output        toHvip_LC17IP_bits,
  output        toHvip_LC18IP_valid,
  output        toHvip_LC18IP_bits,
  output        toHvip_LC19IP_valid,
  output        toHvip_LC19IP_bits,
  output        toHvip_LC20IP_valid,
  output        toHvip_LC20IP_bits,
  output        toHvip_LC21IP_valid,
  output        toHvip_LC21IP_bits,
  output        toHvip_LC22IP_valid,
  output        toHvip_LC22IP_bits,
  output        toHvip_LC23IP_valid,
  output        toHvip_LC23IP_bits,
  output        toHvip_LC24IP_valid,
  output        toHvip_LC24IP_bits,
  output        toHvip_LC25IP_valid,
  output        toHvip_LC25IP_bits,
  output        toHvip_LC26IP_valid,
  output        toHvip_LC26IP_bits,
  output        toHvip_LC27IP_valid,
  output        toHvip_LC27IP_bits,
  output        toHvip_LC28IP_valid,
  output        toHvip_LC28IP_bits,
  output        toHvip_LC29IP_valid,
  output        toHvip_LC29IP_bits,
  output        toHvip_LC30IP_valid,
  output        toHvip_LC30IP_bits,
  output        toHvip_LC31IP_valid,
  output        toHvip_LC31IP_bits,
  output        toHvip_LC32IP_valid,
  output        toHvip_LC32IP_bits,
  output        toHvip_LC33IP_valid,
  output        toHvip_LC33IP_bits,
  output        toHvip_LC34IP_valid,
  output        toHvip_LC34IP_bits,
  output        toHvip_LPRASEIP_valid,
  output        toHvip_LPRASEIP_bits,
  output        toHvip_LC36IP_valid,
  output        toHvip_LC36IP_bits,
  output        toHvip_LC37IP_valid,
  output        toHvip_LC37IP_bits,
  output        toHvip_LC38IP_valid,
  output        toHvip_LC38IP_bits,
  output        toHvip_LC39IP_valid,
  output        toHvip_LC39IP_bits,
  output        toHvip_LC40IP_valid,
  output        toHvip_LC40IP_bits,
  output        toHvip_LC41IP_valid,
  output        toHvip_LC41IP_bits,
  output        toHvip_LC42IP_valid,
  output        toHvip_LC42IP_bits,
  output        toHvip_HPRASEIP_valid,
  output        toHvip_HPRASEIP_bits,
  output        toHvip_LC44IP_valid,
  output        toHvip_LC44IP_bits,
  output        toHvip_LC45IP_valid,
  output        toHvip_LC45IP_bits,
  output        toHvip_LC46IP_valid,
  output        toHvip_LC46IP_bits,
  output        toHvip_LC47IP_valid,
  output        toHvip_LC47IP_bits,
  output        toHvip_LC48IP_valid,
  output        toHvip_LC48IP_bits,
  output        toHvip_LC49IP_valid,
  output        toHvip_LC49IP_bits,
  output        toHvip_LC50IP_valid,
  output        toHvip_LC50IP_bits,
  output        toHvip_LC51IP_valid,
  output        toHvip_LC51IP_bits,
  output        toHvip_LC52IP_valid,
  output        toHvip_LC52IP_bits,
  output        toHvip_LC53IP_valid,
  output        toHvip_LC53IP_bits,
  output        toHvip_LC54IP_valid,
  output        toHvip_LC54IP_bits,
  output        toHvip_LC55IP_valid,
  output        toHvip_LC55IP_bits,
  output        toHvip_LC56IP_valid,
  output        toHvip_LC56IP_bits,
  output        toHvip_LC57IP_valid,
  output        toHvip_LC57IP_bits,
  output        toHvip_LC58IP_valid,
  output        toHvip_LC58IP_bits,
  output        toHvip_LC59IP_valid,
  output        toHvip_LC59IP_bits,
  output        toHvip_LC60IP_valid,
  output        toHvip_LC60IP_bits,
  output        toHvip_LC61IP_valid,
  output        toHvip_LC61IP_bits,
  output        toHvip_LC62IP_valid,
  output        toHvip_LC62IP_bits,
  output        toHvip_LC63IP_valid,
  output        toHvip_LC63IP_bits
);

  wire        _regOut_SSIP_T;
  wire        _regOut_STIP_T;
  wire        _regOut_SEIP_T;
  wire [61:0] originIP;
  wire [61:0] _GEN =
    {50'h0,
     hideleg_LCOFI,
     hideleg_SGEI,
     hideleg_MEI,
     hideleg_VSEI,
     hideleg_SEI,
     1'h0,
     hideleg_MTI,
     hideleg_VSTI,
     hideleg_STI,
     1'h0,
     hideleg_MSI,
     hideleg_VSSI};
  assign originIP =
    {50'h0, mideleg_LCOFI, 3'h5, mideleg_SEI, 3'h1, mideleg_STI, 3'h1} & _GEN
    & {mip_LC63IP,
       mip_LC62IP,
       mip_LC61IP,
       mip_LC60IP,
       mip_LC59IP,
       mip_LC58IP,
       mip_LC57IP,
       mip_LC56IP,
       mip_LC55IP,
       mip_LC54IP,
       mip_LC53IP,
       mip_LC52IP,
       mip_LC51IP,
       mip_LC50IP,
       mip_LC49IP,
       mip_LC48IP,
       mip_LC47IP,
       mip_LC46IP,
       mip_LC45IP,
       mip_LC44IP,
       mip_HPRASEIP,
       mip_LC42IP,
       mip_LC41IP,
       mip_LC40IP,
       mip_LC39IP,
       mip_LC38IP,
       mip_LC37IP,
       mip_LC36IP,
       mip_LPRASEIP,
       mip_LC34IP,
       mip_LC33IP,
       mip_LC32IP,
       mip_LC31IP,
       mip_LC30IP,
       mip_LC29IP,
       mip_LC28IP,
       mip_LC27IP,
       mip_LC26IP,
       mip_LC25IP,
       mip_LC24IP,
       mip_LC23IP,
       mip_LC22IP,
       mip_LC21IP,
       mip_LC20IP,
       mip_LC19IP,
       mip_LC18IP,
       mip_LC17IP,
       mip_LC16IP,
       mip_LC15IP,
       mip_LC14IP,
       mip_LCOFIP,
       mip_SGEIP,
       mip_MEIP,
       mip_VSEIP,
       mip_SEIP,
       1'h0,
       mip_MTIP,
       mip_VSTIP,
       mip_STIP,
       1'h0,
       mip_MSIP,
       mip_VSSIP}
    | {50'h3FFFFFFFFFFFF, ~mideleg_LCOFI, 3'h2, ~mideleg_SEI, 3'h6, ~mideleg_STI, 3'h6}
    & _GEN
    & {mvien_LC63IE,
       mvien_LC62IE,
       mvien_LC61IE,
       mvien_LC60IE,
       mvien_LC59IE,
       mvien_LC58IE,
       mvien_LC57IE,
       mvien_LC56IE,
       mvien_LC55IE,
       mvien_LC54IE,
       mvien_LC53IE,
       mvien_LC52IE,
       mvien_LC51IE,
       mvien_LC50IE,
       mvien_LC49IE,
       mvien_LC48IE,
       mvien_LC47IE,
       mvien_LC46IE,
       mvien_LC45IE,
       mvien_LC44IE,
       mvien_HPRASEIE,
       mvien_LC42IE,
       mvien_LC41IE,
       mvien_LC40IE,
       mvien_LC39IE,
       mvien_LC38IE,
       mvien_LC37IE,
       mvien_LC36IE,
       mvien_LPRASEIE,
       mvien_LC34IE,
       mvien_LC33IE,
       mvien_LC32IE,
       mvien_LC31IE,
       mvien_LC30IE,
       mvien_LC29IE,
       mvien_LC28IE,
       mvien_LC27IE,
       mvien_LC26IE,
       mvien_LC25IE,
       mvien_LC24IE,
       mvien_LC23IE,
       mvien_LC22IE,
       mvien_LC21IE,
       mvien_LC20IE,
       mvien_LC19IE,
       mvien_LC18IE,
       mvien_LC17IE,
       mvien_LC16IE,
       mvien_LC15IE,
       mvien_LC14IE,
       mvien_LCOFIE,
       3'h0,
       mvien_SEIE,
       7'h0}
    & {mvip_LC63IP,
       mvip_LC62IP,
       mvip_LC61IP,
       mvip_LC60IP,
       mvip_LC59IP,
       mvip_LC58IP,
       mvip_LC57IP,
       mvip_LC56IP,
       mvip_LC55IP,
       mvip_LC54IP,
       mvip_LC53IP,
       mvip_LC52IP,
       mvip_LC51IP,
       mvip_LC50IP,
       mvip_LC49IP,
       mvip_LC48IP,
       mvip_LC47IP,
       mvip_LC46IP,
       mvip_LC45IP,
       mvip_LC44IP,
       mvip_HPRASEIP,
       mvip_LC42IP,
       mvip_LC41IP,
       mvip_LC40IP,
       mvip_LC39IP,
       mvip_LC38IP,
       mvip_LC37IP,
       mvip_LC36IP,
       mvip_LPRASEIP,
       mvip_LC34IP,
       mvip_LC33IP,
       mvip_LC32IP,
       mvip_LC31IP,
       mvip_LC30IP,
       mvip_LC29IP,
       mvip_LC28IP,
       mvip_LC27IP,
       mvip_LC26IP,
       mvip_LC25IP,
       mvip_LC24IP,
       mvip_LC23IP,
       mvip_LC22IP,
       mvip_LC21IP,
       mvip_LC20IP,
       mvip_LC19IP,
       mvip_LC18IP,
       mvip_LC17IP,
       mvip_LC16IP,
       mvip_LC15IP,
       mvip_LC14IP,
       mvip_LCOFIP,
       3'h0,
       mvip_SEIP,
       3'h0,
       mvip_STIP,
       3'h0}
    | {50'h3FFFFFFFFFFFF,
       ~hideleg_LCOFI,
       ~hideleg_SGEI,
       ~hideleg_MEI,
       ~hideleg_VSEI,
       ~hideleg_SEI,
       1'h1,
       ~hideleg_MTI,
       ~hideleg_VSTI,
       ~hideleg_STI,
       1'h1,
       ~hideleg_MSI,
       ~hideleg_VSSI}
    & {hvien_LC63IE,
       hvien_LC62IE,
       hvien_LC61IE,
       hvien_LC60IE,
       hvien_LC59IE,
       hvien_LC58IE,
       hvien_LC57IE,
       hvien_LC56IE,
       hvien_LC55IE,
       hvien_LC54IE,
       hvien_LC53IE,
       hvien_LC52IE,
       hvien_LC51IE,
       hvien_LC50IE,
       hvien_LC49IE,
       hvien_LC48IE,
       hvien_LC47IE,
       hvien_LC46IE,
       hvien_LC45IE,
       hvien_LC44IE,
       hvien_HPRASEIE,
       hvien_LC42IE,
       hvien_LC41IE,
       hvien_LC40IE,
       hvien_LC39IE,
       hvien_LC38IE,
       hvien_LC37IE,
       hvien_LC36IE,
       hvien_LPRASEIE,
       hvien_LC34IE,
       hvien_LC33IE,
       hvien_LC32IE,
       hvien_LC31IE,
       hvien_LC30IE,
       hvien_LC29IE,
       hvien_LC28IE,
       hvien_LC27IE,
       hvien_LC26IE,
       hvien_LC25IE,
       hvien_LC24IE,
       hvien_LC23IE,
       hvien_LC22IE,
       hvien_LC21IE,
       hvien_LC20IE,
       hvien_LC19IE,
       hvien_LC18IE,
       hvien_LC17IE,
       hvien_LC16IE,
       hvien_LC15IE,
       hvien_LC14IE,
       hvien_LCOFIE,
       11'h0}
    & {hvip_LC63IP,
       hvip_LC62IP,
       hvip_LC61IP,
       hvip_LC60IP,
       hvip_LC59IP,
       hvip_LC58IP,
       hvip_LC57IP,
       hvip_LC56IP,
       hvip_LC55IP,
       hvip_LC54IP,
       hvip_LC53IP,
       hvip_LC52IP,
       hvip_LC51IP,
       hvip_LC50IP,
       hvip_LC49IP,
       hvip_LC48IP,
       hvip_LC47IP,
       hvip_LC46IP,
       hvip_LC45IP,
       hvip_LC44IP,
       hvip_HPRASEIP,
       hvip_LC42IP,
       hvip_LC41IP,
       hvip_LC40IP,
       hvip_LC39IP,
       hvip_LC38IP,
       hvip_LC37IP,
       hvip_LC36IP,
       hvip_LPRASEIP,
       hvip_LC34IP,
       hvip_LC33IP,
       hvip_LC32IP,
       hvip_LC31IP,
       hvip_LC30IP,
       hvip_LC29IP,
       hvip_LC28IP,
       hvip_LC27IP,
       hvip_LC26IP,
       hvip_LC25IP,
       hvip_LC24IP,
       hvip_LC23IP,
       hvip_LC22IP,
       hvip_LC21IP,
       hvip_LC20IP,
       hvip_LC19IP,
       hvip_LC18IP,
       hvip_LC17IP,
       hvip_LC16IP,
       hvip_LC15IP,
       hvip_LC14IP,
       hvip_LCOFIP,
       2'h0,
       hvip_VSEIP,
       3'h0,
       hvip_VSTIP,
       3'h0,
       hvip_VSSIP};
  assign _regOut_SEIP_T = originIP[8];
  assign _regOut_STIP_T = originIP[4];
  assign _regOut_SSIP_T = originIP[0];
  assign rdata =
    {originIP[61:11],
     3'h0,
     _regOut_SEIP_T,
     3'h0,
     _regOut_STIP_T,
     3'h0,
     _regOut_SSIP_T,
     1'h0};
  assign regOut_SSIP = _regOut_SSIP_T;
  assign regOut_STIP = _regOut_STIP_T;
  assign regOut_SEIP = _regOut_SEIP_T;
  assign regOut_LCOFIP = originIP[11];
  assign regOut_LC14IP = originIP[12];
  assign regOut_LC15IP = originIP[13];
  assign regOut_LC16IP = originIP[14];
  assign regOut_LC17IP = originIP[15];
  assign regOut_LC18IP = originIP[16];
  assign regOut_LC19IP = originIP[17];
  assign regOut_LC20IP = originIP[18];
  assign regOut_LC21IP = originIP[19];
  assign regOut_LC22IP = originIP[20];
  assign regOut_LC23IP = originIP[21];
  assign regOut_LC24IP = originIP[22];
  assign regOut_LC25IP = originIP[23];
  assign regOut_LC26IP = originIP[24];
  assign regOut_LC27IP = originIP[25];
  assign regOut_LC28IP = originIP[26];
  assign regOut_LC29IP = originIP[27];
  assign regOut_LC30IP = originIP[28];
  assign regOut_LC31IP = originIP[29];
  assign regOut_LC32IP = originIP[30];
  assign regOut_LC33IP = originIP[31];
  assign regOut_LC34IP = originIP[32];
  assign regOut_LPRASEIP = originIP[33];
  assign regOut_LC36IP = originIP[34];
  assign regOut_LC37IP = originIP[35];
  assign regOut_LC38IP = originIP[36];
  assign regOut_LC39IP = originIP[37];
  assign regOut_LC40IP = originIP[38];
  assign regOut_LC41IP = originIP[39];
  assign regOut_LC42IP = originIP[40];
  assign regOut_HPRASEIP = originIP[41];
  assign regOut_LC44IP = originIP[42];
  assign regOut_LC45IP = originIP[43];
  assign regOut_LC46IP = originIP[44];
  assign regOut_LC47IP = originIP[45];
  assign regOut_LC48IP = originIP[46];
  assign regOut_LC49IP = originIP[47];
  assign regOut_LC50IP = originIP[48];
  assign regOut_LC51IP = originIP[49];
  assign regOut_LC52IP = originIP[50];
  assign regOut_LC53IP = originIP[51];
  assign regOut_LC54IP = originIP[52];
  assign regOut_LC55IP = originIP[53];
  assign regOut_LC56IP = originIP[54];
  assign regOut_LC57IP = originIP[55];
  assign regOut_LC58IP = originIP[56];
  assign regOut_LC59IP = originIP[57];
  assign regOut_LC60IP = originIP[58];
  assign regOut_LC61IP = originIP[59];
  assign regOut_LC62IP = originIP[60];
  assign regOut_LC63IP = originIP[61];
  assign toMip_LCOFIP_valid = w_wen & hideleg_LCOFI & mideleg_LCOFI;
  assign toMip_LCOFIP_bits = w_wdata[13];
  assign toMvip_LCOFIP_valid = w_wen & hideleg_LCOFI & ~mideleg_LCOFI & mvien_LCOFIE;
  assign toMvip_LCOFIP_bits = w_wdata[13];
  assign toHvip_VSSIP_valid = w_wen & hideleg_VSSI;
  assign toHvip_VSSIP_bits = w_wdata[1];
  assign toHvip_LCOFIP_valid = w_wen & ~hideleg_LCOFI & hvien_LCOFIE;
  assign toHvip_LCOFIP_bits = w_wdata[13];
  assign toHvip_LC14IP_valid = w_wen & hvien_LC14IE;
  assign toHvip_LC14IP_bits = w_wdata[14];
  assign toHvip_LC15IP_valid = w_wen & hvien_LC15IE;
  assign toHvip_LC15IP_bits = w_wdata[15];
  assign toHvip_LC16IP_valid = w_wen & hvien_LC16IE;
  assign toHvip_LC16IP_bits = w_wdata[16];
  assign toHvip_LC17IP_valid = w_wen & hvien_LC17IE;
  assign toHvip_LC17IP_bits = w_wdata[17];
  assign toHvip_LC18IP_valid = w_wen & hvien_LC18IE;
  assign toHvip_LC18IP_bits = w_wdata[18];
  assign toHvip_LC19IP_valid = w_wen & hvien_LC19IE;
  assign toHvip_LC19IP_bits = w_wdata[19];
  assign toHvip_LC20IP_valid = w_wen & hvien_LC20IE;
  assign toHvip_LC20IP_bits = w_wdata[20];
  assign toHvip_LC21IP_valid = w_wen & hvien_LC21IE;
  assign toHvip_LC21IP_bits = w_wdata[21];
  assign toHvip_LC22IP_valid = w_wen & hvien_LC22IE;
  assign toHvip_LC22IP_bits = w_wdata[22];
  assign toHvip_LC23IP_valid = w_wen & hvien_LC23IE;
  assign toHvip_LC23IP_bits = w_wdata[23];
  assign toHvip_LC24IP_valid = w_wen & hvien_LC24IE;
  assign toHvip_LC24IP_bits = w_wdata[24];
  assign toHvip_LC25IP_valid = w_wen & hvien_LC25IE;
  assign toHvip_LC25IP_bits = w_wdata[25];
  assign toHvip_LC26IP_valid = w_wen & hvien_LC26IE;
  assign toHvip_LC26IP_bits = w_wdata[26];
  assign toHvip_LC27IP_valid = w_wen & hvien_LC27IE;
  assign toHvip_LC27IP_bits = w_wdata[27];
  assign toHvip_LC28IP_valid = w_wen & hvien_LC28IE;
  assign toHvip_LC28IP_bits = w_wdata[28];
  assign toHvip_LC29IP_valid = w_wen & hvien_LC29IE;
  assign toHvip_LC29IP_bits = w_wdata[29];
  assign toHvip_LC30IP_valid = w_wen & hvien_LC30IE;
  assign toHvip_LC30IP_bits = w_wdata[30];
  assign toHvip_LC31IP_valid = w_wen & hvien_LC31IE;
  assign toHvip_LC31IP_bits = w_wdata[31];
  assign toHvip_LC32IP_valid = w_wen & hvien_LC32IE;
  assign toHvip_LC32IP_bits = w_wdata[32];
  assign toHvip_LC33IP_valid = w_wen & hvien_LC33IE;
  assign toHvip_LC33IP_bits = w_wdata[33];
  assign toHvip_LC34IP_valid = w_wen & hvien_LC34IE;
  assign toHvip_LC34IP_bits = w_wdata[34];
  assign toHvip_LPRASEIP_valid = w_wen & hvien_LPRASEIE;
  assign toHvip_LPRASEIP_bits = w_wdata[35];
  assign toHvip_LC36IP_valid = w_wen & hvien_LC36IE;
  assign toHvip_LC36IP_bits = w_wdata[36];
  assign toHvip_LC37IP_valid = w_wen & hvien_LC37IE;
  assign toHvip_LC37IP_bits = w_wdata[37];
  assign toHvip_LC38IP_valid = w_wen & hvien_LC38IE;
  assign toHvip_LC38IP_bits = w_wdata[38];
  assign toHvip_LC39IP_valid = w_wen & hvien_LC39IE;
  assign toHvip_LC39IP_bits = w_wdata[39];
  assign toHvip_LC40IP_valid = w_wen & hvien_LC40IE;
  assign toHvip_LC40IP_bits = w_wdata[40];
  assign toHvip_LC41IP_valid = w_wen & hvien_LC41IE;
  assign toHvip_LC41IP_bits = w_wdata[41];
  assign toHvip_LC42IP_valid = w_wen & hvien_LC42IE;
  assign toHvip_LC42IP_bits = w_wdata[42];
  assign toHvip_HPRASEIP_valid = w_wen & hvien_HPRASEIE;
  assign toHvip_HPRASEIP_bits = w_wdata[43];
  assign toHvip_LC44IP_valid = w_wen & hvien_LC44IE;
  assign toHvip_LC44IP_bits = w_wdata[44];
  assign toHvip_LC45IP_valid = w_wen & hvien_LC45IE;
  assign toHvip_LC45IP_bits = w_wdata[45];
  assign toHvip_LC46IP_valid = w_wen & hvien_LC46IE;
  assign toHvip_LC46IP_bits = w_wdata[46];
  assign toHvip_LC47IP_valid = w_wen & hvien_LC47IE;
  assign toHvip_LC47IP_bits = w_wdata[47];
  assign toHvip_LC48IP_valid = w_wen & hvien_LC48IE;
  assign toHvip_LC48IP_bits = w_wdata[48];
  assign toHvip_LC49IP_valid = w_wen & hvien_LC49IE;
  assign toHvip_LC49IP_bits = w_wdata[49];
  assign toHvip_LC50IP_valid = w_wen & hvien_LC50IE;
  assign toHvip_LC50IP_bits = w_wdata[50];
  assign toHvip_LC51IP_valid = w_wen & hvien_LC51IE;
  assign toHvip_LC51IP_bits = w_wdata[51];
  assign toHvip_LC52IP_valid = w_wen & hvien_LC52IE;
  assign toHvip_LC52IP_bits = w_wdata[52];
  assign toHvip_LC53IP_valid = w_wen & hvien_LC53IE;
  assign toHvip_LC53IP_bits = w_wdata[53];
  assign toHvip_LC54IP_valid = w_wen & hvien_LC54IE;
  assign toHvip_LC54IP_bits = w_wdata[54];
  assign toHvip_LC55IP_valid = w_wen & hvien_LC55IE;
  assign toHvip_LC55IP_bits = w_wdata[55];
  assign toHvip_LC56IP_valid = w_wen & hvien_LC56IE;
  assign toHvip_LC56IP_bits = w_wdata[56];
  assign toHvip_LC57IP_valid = w_wen & hvien_LC57IE;
  assign toHvip_LC57IP_bits = w_wdata[57];
  assign toHvip_LC58IP_valid = w_wen & hvien_LC58IE;
  assign toHvip_LC58IP_bits = w_wdata[58];
  assign toHvip_LC59IP_valid = w_wen & hvien_LC59IE;
  assign toHvip_LC59IP_bits = w_wdata[59];
  assign toHvip_LC60IP_valid = w_wen & hvien_LC60IE;
  assign toHvip_LC60IP_bits = w_wdata[60];
  assign toHvip_LC61IP_valid = w_wen & hvien_LC61IE;
  assign toHvip_LC61IP_bits = w_wdata[61];
  assign toHvip_LC62IP_valid = w_wen & hvien_LC62IE;
  assign toHvip_LC62IP_bits = w_wdata[62];
  assign toHvip_LC63IP_valid = w_wen & hvien_LC63IE;
  assign toHvip_LC63IP_bits = w_wdata[63];
endmodule

