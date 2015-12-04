module traffic_light (
	input clk,    // Clock
	input rst_n,  // Asynchronous reset active low
	output [7:0]Row_Scan_Sig,
	output[1:0]Column_Scan_Sig,
	output[1:0]Column_Scan_Sig2,
	output [3:0]ledout
);

parameter Tx=30;
parameter Ty=15;

wire clk100ms;
wire [7:0] Numout;
clock U1
(
	.clk(clk),
	.rst_n(rst_n),
	.clk100ms(clk100ms)
	);

light_control #(Tx,Ty) U2
(
	.clk(clk100ms),
	.rst_n(rst_n),
	.Gx(ledout[0]),
	.Rx(ledout[1]),
	.Gy(ledout[2]),
	.Ry(ledout[3])
	);

num_generate #(Tx,Ty) U3
(
	.clk(clk100ms),
	.rst_n(rst_n),
	.Numout(Numout)
	);

num_display U4
(
	.CLK(clk),
	.RSTn(rst_n),
	.Number_Data(Numout),
	.Row_Scan_Sig(Row_Scan_Sig),
	.Column_Scan_Sig(Column_Scan_Sig)
	);
	
num_display U5
(
	.CLK(clk),
	.RSTn(rst_n),
	.Column_Scan_Sig(Column_Scan_Sig2)
	);
	
endmodule