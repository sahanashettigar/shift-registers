module and2 (input wire i0, i1, output wire o);
  assign o = i0 & i1;
endmodule

module mux2 (input wire i0, i1, j, output wire o);
  assign o = (j==0)?i0:i1;
endmodule

module invert (input wire i, output wire o);
   assign o = !i;
endmodule
module df (input wire clk, in, output wire out);
  reg df_out;
  always@(posedge clk) df_out <= in;
  assign out = df_out;
endmodule

module dfr (input wire clk, reset, in, output wire out);
  wire reset_, df_in;
  invert invert_0 (reset, reset_);
  and2 and2_0 (in, reset_, df_in);
  df df_0 (clk, df_in, out);
endmodule

module dfrl (input wire clk, reset, load, in, output wire out);
  wire _in;
  mux2 mux2_0(out, in, load, _in);
  dfr dfr_1(clk, reset, _in, out);
endmodule

module pipo(input wire clk,load,reset,input wire [3:0]in,output wire [3:0]out);
	dfrl d1(clk,reset,load,in[0],out[0]);
	dfrl d2(clk,reset,load,in[1],out[1]);
	dfrl d3(clk,reset,load,in[2],out[2]);
	dfrl d4(clk,reset,load,in[3],out[3]);
endmodule

