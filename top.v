`timescale 1ns/1ps

module top (clk, x);

input clk;
output x;
reg x;
reg y = 1'h0;

always @(posedge clk)
    y  <= y + 1'h1;

always @* begin
    x = 1'h0;
    casez (y )
      1'h0:
          x = 1'h1;
      1'h1:
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