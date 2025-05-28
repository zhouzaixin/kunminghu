
module array_22_ext(
  input RW0_clk,
  input [10:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [5:0] RW0_wmask,
  input [41:0] RW0_wdata,
  output [41:0] RW0_rdata
);

  reg reg_RW0_ren;
  reg [10:0] reg_RW0_addr;
  reg [41:0] ram [2047:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 2048; initvar = initvar+1)
        ram[initvar] = {2 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge RW0_clk)
    reg_RW0_ren <= RW0_en && !RW0_wmode;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;
  always @(posedge RW0_clk)
    if (RW0_en && RW0_wmode) begin
      for (i=0;i<6;i=i+1) begin
        if (RW0_wmask[i]) begin
          ram[RW0_addr][i*7 +: 7] <= RW0_wdata[i*7 +: 7];
        end
      end
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] RW0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      RW0_random = {$random, $random};
      reg_RW0_ren = RW0_random[0];
    end
  `endif
  always @(posedge RW0_clk) RW0_random <= {$random, $random};
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[41:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule