/*========================================
				SEQUENCE 101
==========================================
Description:
This Moore FSM detects the non-overlapping
sequence 101, assuming the input stream
arrives LSB first.

Design Engineer:
Servantes,Jenelyn

Date: 
31 Mar 2026
===========================================*/
module sequence_101(in,out,state,rst,clk);
//ports
input in;
input rst;
input clk;
output reg out;
output reg [1:0]state;

//state aassignment
parameter [1:0] s0  = 2'b00;
parameter [1:0] s1 = 2'b01;
parameter [1:0] s2 = 2'b10;
parameter [1:0] s3  = 2'b11;
reg [1:0] pre;
reg [1:0] nxt;


//input block
always@(in,pre)begin
case(pre)
s0: nxt = in? s1:s0;
s1: nxt = in? s0:s2;    //remembers 1
s2: nxt = in? s3:s0;    //remembers 2
s3: nxt = in? s1:s0;   //10
default: nxt = s0;
endcase
end

//sequential block
always @(posedge clk, negedge rst)begin
if(!rst) pre = s0;
else     pre = nxt;
end

//output block
always@ (pre)begin
case(pre)
s0: begin out=0;
          state = s0;
    end
s1: begin out=0;
          state = s1;
    end
s2: begin out=0;
          state = s2;
    end
s3: begin out=1;
          state = s3;
    end
default:  begin out=0;
                state = s0;
          end
endcase
end

endmodule 