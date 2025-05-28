
module array_0_0_ext(
  input W0_clk,
  input [5:0] W0_addr,
  input W0_en,
  input [319:0] W0_data,
  input R0_clk,
  input [5:0] R0_addr,
  input R0_en,
  output [319:0] R0_data
);

  reg reg_R0_ren;
  reg [5:0] reg_R0_addr;
  reg [319:0] ram [63:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 64; initvar = initvar+1)
        ram[initvar] = {10 {$random}};
      reg_R0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge R0_clk)
    reg_R0_ren <= R0_en;
  always @(posedge R0_clk)
    if (R0_en) reg_R0_addr <= R0_addr;
  always @(posedge W0_clk)
    if (W0_en) begin
      ram[W0_addr][319:0] <= W0_data[319:0];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [319:0] R0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      R0_random = {$random, $random, $random, $random, $random, $random, $random, $random, $random, $random};
      reg_R0_ren = R0_random[0];
    end
  `endif
  always @(posedge R0_clk) R0_random <= {$random, $random, $random, $random, $random, $random, $random, $random, $random, $random};
  assign R0_data = reg_R0_ren ? ram[reg_R0_addr] : R0_random[319:0];
  `else
  assign R0_data = ram[reg_R0_addr];
  `endif

endmodule