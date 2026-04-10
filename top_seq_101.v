//top-level design for sequence 101


 module top_seq_101(out,state,clk_led,clk_in,in,rst_n);
 //ports
 input 			in;
 input 			clk_in;
 input			rst_n;
 output			out;
 output [1:0] 	state;
 output 			clk_led;
 
 //nets
 wire clk_w;
 
 //clock divider instance
  clk_div #(.PERIOD_OUT(3)) clk_div_inst(
  .clk_out(clk_w),
  .clk_in(clk_in),
  .clk_led(clk_led)
  );
 
 
 //seq_101 instance
 sequence_101 seq_101_inst(
 .in(in),
 .out(out),
 .state(state),
 .rst(rst_n),
 .clk(clk_w)
 );
 
 endmodule