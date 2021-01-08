`timescale 1 ns / 100 ps
module pipo_tb;
	reg  [3:0]data;
	reg enable,clk,reset;
	wire [3:0]out;
	pipo register(clk,enable,reset,data,out);
	initial begin
	$dumpfile("pipo_tb.vcd");
	$dumpvars(0,pipo_tb);
	clk = 0;
	data=4'b1101;
	reset=1;enable=1;
	data=4'b1001;
	#10;
	reset=0;enable=0;#10;
	reset=1;enable=1;
	data=4'b1011;
	#10;
	reset=0;enable=0;#10;
	reset=1;enable=1;
	data=4'b1011;
	#10;
	reset=0;enable=0;#10;
	reset=1;enable=1;
	data=4'b1010;
	#10;
	reset=0;enable=0;#10;
	reset=1;enable=1;
	data=4'b1000;
	#10;
	reset=0;enable=0;#10;
	reset=1;enable=1;
	data=4'b0011;
	reset=0;enable=1;#10;
	reset=0;enable=0;#10;
	reset=1;#10;
	$finish;
	end
	always #10 clk=!clk;
endmodule
	
