module exp07_top
(
	CLK,RSTn,Number_Data,Row_Scan_Sig,Column_Scan_Sig
); 
	input CLK;
	input RSTn;
	input [7:0] Number_Data;
	output [7:0]Row_Scan_Sig;
	output[1:0]Column_Scan_Sig;
	
	wire [3:0]Ten_Data;
	wire [3:0]One_Data;
	
	number_mod_module U1
	(
		.CLK(CLK),
		.RSTn(RSTn),
		.Number_Data(Number_Data),
		.Ten_Data(Ten_Data),
		.One_Data(One_Data),
	);
	
	wire[7:0]Ten_SMG_Data;
	wire[7:0]One_SMG_Data;
	
	smg_encoder_module U2
	(
		.CLK(CLK),
		.RSTn(RSTn),
		.Ten_Data(Ten_Data),
		.One_Data(One_Data),
		.Ten_SMG_Data(Ten_SMG_Data),
		.One_SMG_Data(One_SMG_Data)
	);
	
	smg_scan_module U3
	(
		.CLK(CLK),
		.RSTn(RSTn),
		.Ten_SMG_Data(Ten_SMG_Data),
		.One_SMG_Data(One_SMG_Data),
		.Row_Scan_Sig(Row_Scan_Sig),
		.Column_Scan_Sig(Column_Scan_Sig)
	);
	
endmodule
	