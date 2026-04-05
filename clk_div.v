/*=============================================
		CLOCK DIVIDER
===============================================
Description:
This module takes 50MHz clock input
and divide it to produce 1Hz clock output.

Design Engineer:
Doctora, France Austin D.

Date:
18 Feb 2026
----------------------------------------------*/
module clk_div(clk_out,clk_in,clk_led);
//ports and nets
input clk_in;
output reg clk_out=1'b0;
output reg clk_led=1'b0;

//1s clock @50MHz
parameter integer TICKS_500MS =150_000_000;
reg [27:0]tick_cnt = 28'b0;
always@(posedge clk_in)begin
  if(tick_cnt==TICKS_500MS-1)begin
	clk_out <= ~clk_out;
	clk_led <= ~clk_led;
	tick_cnt <= 28'b0;
end
 else
   tick_cnt = tick_cnt + 28'b1;




end

endmodule 