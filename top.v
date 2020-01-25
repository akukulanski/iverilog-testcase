`timescale 1ns/1ps

module top (clk, x);

input clk;
output x;
reg x;
reg [1:0] \fsm_state$114 = 0;

// always @* begin
//     if (clk)
//         x = 1'b0;
//     else
//         x = 1'b1;
// end

  always @(posedge clk)
      \fsm_state$114  <= \fsm_state$114 + 2'h1;
  always @* begin
    x = 1'h0;
    /* src = "/home/kuku/STORAGE/estructura/Personales/Desarrollo/repositories/cores-nmigen/cores/axi_lite.py:67" */
    casez (\fsm_state$114 )
      /* src = "/home/kuku/STORAGE/estructura/Personales/Desarrollo/repositories/cores-nmigen/cores/axi_lite.py:68" */
      /* \nmigen.decoding  = "IDLE/0" */
      2'h0:
          x = 1'h1;
      /* src = "/home/kuku/STORAGE/estructura/Personales/Desarrollo/repositories/cores-nmigen/cores/axi_lite.py:79" */
      /* \nmigen.decoding  = "WAITING_DATA/2" */
      2'h2:
          x = 1'h0;
      /* src = "/home/kuku/STORAGE/estructura/Personales/Desarrollo/repositories/cores-nmigen/cores/axi_lite.py:86" */
      /* \nmigen.decoding  = "WAITING_ADDR/3" */
      2'h3:
          x = 1'h1;
      /* src = "/home/kuku/STORAGE/estructura/Personales/Desarrollo/repositories/cores-nmigen/cores/axi_lite.py:93" */
      /* \nmigen.decoding  = "DONE/1" */
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