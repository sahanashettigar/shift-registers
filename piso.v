module and2 (input wire i0, i1, output wire o);
  assign o = i0 & i1;
endmodule

module or2 (input wire i0, i1, output wire o);
	assign o = i0 | i1;
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

module piso (input wire clk, load,reset,shift,input wire [3:0] in, output wire sout);
	wire [2:0] out;
	wire [2:0]muxout;
	dfrl _d0 (clk, reset, load, in[0], out[0]);
	mux2 _m0 (in[1], out[0], shift, muxout[0]);
	dfrl _d1 (clk, reset, load, muxout[0], out[1]);
	mux2 _m1 (in[2], out[1], shift, muxout[1]);
	dfrl _d2 (clk, reset, load, muxout[1], out[2]);
	mux2 _m2 (in[3], out[2], shift, muxout[2]);
	dfrl _d3 (clk, reset, load, muxout[2], sout);

endmodule
