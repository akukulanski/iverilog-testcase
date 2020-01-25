`timescale 1ns/1ps

module top (clk, x);

input clk;
output x;
reg x;
reg [1:0] \fsm_state$114 = 0;

  always @(posedge clk)
      \fsm_state$114  <= \fsm_state$114 + 2'h1;
  always @* begin
    x = 1'h0;
    casez (\fsm_state$114 )
      2'h0:
          x = 1'h1;
      2'h2:
          x = 1'h0;
      2'h3:
          x = 1'h1;
      2'h1:
          x = 1'h0;
    endcase
  end

`ifdef COCOTB_SIM
initial begin
$dumpfile("./sim_build/waveform.vcd");
$dumpvars (0,top);
end
`endif

endmodule