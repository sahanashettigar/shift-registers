# shift-registers
Verilog code for Parallel In Parallel Out and Parallel In Serial Out Shift Registers
To execute piso :
iverilog -o aout testbenchpiso.v piso.v
vvp aout
gtkwave piso_tb.vcd

To execute pipo:
iverilog -o aout testbenchpipo.v pipo.v
vvp aout
gtkwave pipo_tb.vcd
