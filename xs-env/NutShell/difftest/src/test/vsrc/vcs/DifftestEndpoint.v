/***************************************************************************************
* Copyright (c) 2024 Beijing Institute of Open Source Chip (BOSC)
* Copyright (c) 2020-2024 Institute of Computing Technology, Chinese Academy of Sciences
* Copyright (c) 2020-2021 Peng Cheng Laboratory
*
* DiffTest is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

`include "DifftestMacros.v"
module DifftestEndpoint(
  input  wire        clock,
  input  wire        reset,

`ifdef ENABLE_WORKLOAD_SWITCH
  output wire        workload_switch,
`endif // ENABLE_WORKLOAD_SWITCH

  /* DifftestTopIO */
  output wire [63:0] difftest_logCtrl_begin,
  output wire [63:0] difftest_logCtrl_end,
  output wire [63:0] difftest_logCtrl_level,
  output wire        difftest_perfCtrl_clean,
  output wire        difftest_perfCtrl_dump,
  input  wire        difftest_uart_out_valid,
  input  wire [ 7:0] difftest_uart_out_ch,
  output wire        difftest_uart_in_valid,
  output wire [ 7:0] difftest_uart_in_ch,
  input  wire [`CONFIG_DIFFTEST_STEPWIDTH - 1:0] difftest_step
);

`ifndef TB_NO_DPIC
import "DPI-C" function void set_bin_file(string bin);
import "DPI-C" function void set_flash_bin(string bin);
import "DPI-C" function void set_gcpt_bin(string bin);
import "DPI-C" function void set_diff_ref_so(string diff_so);
import "DPI-C" function void set_no_diff();
import "DPI-C" function byte simv_init();
import "DPI-C" function void set_max_instrs(longint mc);
import "DPI-C" function void set_overwrite_nbytes(longint len);
`ifdef WITH_DRAMSIM3
import "DPI-C" function void simv_tick();
`endif // WITH_DRAMSIM3
`ifdef ENABLE_WORKLOAD_SWITCH
import "DPI-C" function void set_workload_list(string path);
`endif // ENABLE_WORKLOAD_SWITCH
import "DPI-C" function byte workload_list_completed();
`ifndef CONFIG_DIFFTEST_DEFERRED_RESULT
import "DPI-C" function byte simv_nstep(byte step);
`endif // CONFIG_DIFFTEST_DEFERRED_RESULT
`endif // TB_NO_DPIC

`define SIMV_DONE     8'h1
`define SIMV_FAIL     8'h2

reg  [63:0] difftest_logCtrl_begin_r;
reg  [63:0] difftest_logCtrl_end_r;

string bin_file;
string flash_bin_file;
string gcpt_bin_file;
string diff_ref_so;
string workload_list;
longint overwrite_nbytes;

reg [63:0] max_instrs;
reg [63:0] max_cycles;

initial begin
  // log begin
  if ($test$plusargs("b")) begin
    $value$plusargs("b=%d", difftest_logCtrl_begin_r);
  end
  else begin
    difftest_logCtrl_begin_r = 0;
  end
  // log end
  if ($test$plusargs("e")) begin
    $value$plusargs("e=%d", difftest_logCtrl_end_r);
  end
  else begin
    difftest_logCtrl_end_r = 0;
  end
`ifndef TB_NO_DPIC
  // workload: bin file
  if ($test$plusargs("workload")) begin
    $value$plusargs("workload=%s", bin_file);
    set_bin_file(bin_file);
  end
  // boot flash image: bin file
  if ($test$plusargs("flash")) begin
    $value$plusargs("flash=%s", flash_bin_file);
    set_flash_bin(flash_bin_file);
  end
  // size of the gcpt used
  if ($test$plusargs("overwrite_nbytes")) begin
    $value$plusargs("overwrite_nbytes=%d", overwrite_nbytes);
    set_overwrite_nbytes(overwrite_nbytes);
  end
  // overwrite gcpt on ram: bin file
  if ($test$plusargs("gcpt-restore")) begin
    $value$plusargs("gcpt-restore=%s", gcpt_bin_file);
    set_gcpt_bin(gcpt_bin_file);
  end
  // diff-test golden model: nemu-so
  if ($test$plusargs("diff")) begin
    $value$plusargs("diff=%s", diff_ref_so);
    set_diff_ref_so(diff_ref_so);
  end
  // disable diff-test
  if ($test$plusargs("no-diff")) begin
    set_no_diff();
  end
  // set exit instrs const
  if ($test$plusargs("max-instrs")) begin
    $value$plusargs("max-instrs=%d", max_instrs);
    set_max_instrs(max_instrs);
  end
`ifdef ENABLE_WORKLOAD_SWITCH
  // set workload list
  if ($test$plusargs("workload-list")) begin
    $value$plusargs("workload-list=%s", workload_list);
    set_workload_list(workload_list);
  end
  else begin
    $display("workload switch is enabled but the workload list is not set");
    $fatal;
  end
`endif // ENABLE_WORKLOAD_SWITCH
`endif // TB_NO_DPIC
  // max cycles to execute, no limit for default
  max_cycles = 0;
  if ($test$plusargs("max-cycles")) begin
    $value$plusargs("max-cycles=%d", max_cycles);
    $display("set max cycles: %d", max_cycles);
  end
end

assign difftest_logCtrl_begin = difftest_logCtrl_begin_r;
assign difftest_logCtrl_end = difftest_logCtrl_end_r;
assign difftest_logCtrl_level = 0;
assign difftest_perfCtrl_clean = 0;
assign difftest_uart_in_ch = 8'hff;

always @(posedge clock) begin
  if (!reset && difftest_uart_out_valid) begin
    $fwrite(32'h8000_0001, "%c", difftest_uart_out_ch);
    $fflush();
  end
end

`ifndef TB_NO_DPIC
`ifdef CONFIG_DIFFTEST_DEFERRED_RESULT
wire [7:0] simv_result;
DeferredControl deferred(
  .clock(clock),
  .reset(reset),
`ifndef CONFIG_DIFFTEST_INTERNAL_STEP
  .step(difftest_step),
`endif // CONFIG_DIFFTEST_INTERNAL_STEP
  .simv_result(simv_result)
);
`else
reg [7:0] simv_result;
initial simv_result = 0;
`endif // CONFIG_DIFFTEST_DEFERRED_RESULT

`ifdef ENABLE_WORKLOAD_SWITCH
assign workload_switch = simv_result == `SIMV_DONE;
`endif // ENABLE_WORKLOAD_SWITCH
`endif // TB_NO_DPIC

`ifndef TB_NO_DPIC
assign difftest_perfCtrl_dump = simv_result != 0;
`else
assign difftest_perfCtrl_dump = 0;
`endif // TB_NO_DPIC

reg [63:0] n_cycles;
always @(posedge clock) begin
  if (reset) begin
    n_cycles <= 64'h0;
  end
  else begin
    n_cycles <= n_cycles + 64'h1;

    // max cycles
    if (max_cycles > 0 && n_cycles >= max_cycles) begin
      $display("EXCEEDED MAX CYCLE: %d", max_cycles);
      $finish();
    end

`ifndef TB_NO_DPIC
`ifdef WITH_DRAMSIM3
    if (n_cycles) begin
      simv_tick();
    end
`endif // WITH_DRAMSIM3
    // difftest
    if (!n_cycles) begin
      if (simv_init()) begin
        if (workload_list_completed()) begin
          $display("DIFFTEST WORKLOAD LIST DONE at cycle %d", n_cycles);
          $finish();
        end
        else begin
          $display("DIFFTEST INIT FAILED");
          $fatal;
        end
      end
    end
    else if (simv_result == `SIMV_FAIL) begin
      $display("DIFFTEST FAILED at cycle %d", n_cycles);
      $fatal;
    end
    else if (simv_result == `SIMV_DONE) begin
      $display("DIFFTEST WORKLOAD DONE at cycle %d", n_cycles);
`ifndef CONFIG_DIFFTEST_DEFERRED_RESULT
      simv_result <= 8'b0;
`endif // CONFIG_DIFFTEST_DEFERRED_RESULT
`ifndef ENABLE_WORKLOAD_SWITCH
      $finish();
`endif // ENABLE_WORKLOAD_SWITCH
    end
`ifndef CONFIG_DIFFTEST_DEFERRED_RESULT
    else if (|difftest_step) begin
      simv_result <= simv_nstep(difftest_step);
    end
`endif // CONFIG_DIFFTEST_DEFERRED_RESULT
`endif // TB_NO_DPIC
  end
end

endmodule
