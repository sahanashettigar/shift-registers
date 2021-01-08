`timescale 1 ns / 100 ps
module piso_tb;
	reg  [3:0]data;
	reg enable,clk,reset,select;
	wire out;
	piso register(clk,enable,reset,select,data,out);
	initial begin
	$dumpfile("piso_tb.vcd");
	$dumpvars(0,piso_tb);
	reset=1;
	clk = 1;
	select=0;
	enable=1;
	data=4'b0001;
	#10;
	reset=0;enable=1;select=1;
	#40;
	reset=0;enable=1;select=0;
	data=4'b0011;
	#10;
	reset=0;enable=1;select=1;
	#40;
	reset=0;enable=1;select=0;
	data=4'b1011;
	#10;
	reset=0;enable=1;select=1;
	#40;
	reset=0;enable=1;select=0;
	data=4'b1010;
	#10;
	reset=0;enable=1;select=1;
	#40;
	reset=0;enable=1;select=0;
	data=4'b1000;
	#10;
	reset=0;enable=1;select=1;
	#40;
	reset=0;enable=1;select=0;
	data=4'b0111;
	#10;
	reset=0;enable=1;select=1;
	#40;
	reset=1;#10;
	$finish;
	end
	always 
	#5 clk=!clk; 
	//always
	//#20 select=!select;
endmodule
	
