/*=============================================
		CLOCK DIVIDER
===============================================
Description:
This module takes a high-frequency input clock(clk_in) and divides it down to a 
lower frequency. By default,it divides a 50MHz input clock down to 1s clock period
toggling the outputs every 25,000,000 ticks.

Design Engineer:
Doctora, France Austin D.
Servantes, Jenelyn B.

Date:
18 Feb 2026
----------------------------------------------*/
module clk_div(clk_out,clk_in,clk_led);
//ports and nets
input clk_in;
output reg clk_out=1'b0;
output reg clk_led=1'b0;

//Division Factor
parameter integer FREQ_IN      = 50_000_000;
parameter integer PERIOD_OUT     = 1;
parameter integer TICKS    = (FREQ_IN*PERIOD_OUT);

//CLOCK GENERATOR
integer tick_cnt = 0;

always@(posedge clk_in)begin
   if(tick_cnt == TICKS-1)begin
clk_out <=~clk_out;
clk_led <=~clk_led;
tick_cnt <=0;
end
else tick_cnt<= tick_cnt + 1;

end

endmodule 