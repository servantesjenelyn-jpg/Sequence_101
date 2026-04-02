//testbench for seq_101
module testbench;
//tb signals
reg in;
reg rst;
reg clk;
wire out;
wire [1:0] state;

//instantiate seq_101
sequence_101 dut (
.in(in),
.out(out),
.state(state),
.rst(rst),
.clk50(clk)
);

//apply stimuli
initial clk = 0;
always #1 clk = ~clk;

initial begin
 rst = 0;  in = 1; #6;
 rst = 1;  in = 1; #2;
 rst = 1;  in = 0; #2;
 rst = 1;  in = 1; #2;
 rst = 1;  in = 0; #2;
end

endmodule