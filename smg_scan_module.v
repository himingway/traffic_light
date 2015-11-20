 module smg_scan_module
 (
 	CLK,RSTn,Ten_SMG_Data,One_SMG_Data,
 	Row_Scan_Sig,Column_Scan_Sig
 );
 
 	input CLK;
 	input RSTn;
 	input[7:0]Ten_SMG_Data;
 	input[7:0]One_SMG_Data;
 	output[7:0]Row_Scan_Sig;
 	output[1:0]Column_Scan_Sig;
 	
 	row_scan_module U1
 	(
 		.CLK(CLK),
 		.RSTn(RSTn),
 		.Ten_SMG_Data(Ten_SMG_Data),
 		.One_SMG_Data(One_SMG_Data),
 		.Row_Scan_Sig(Row_Scan_Sig)
 	);
 	
 	column_scan_module U2
 	(
 		.CLK(CLK),
 		.RSTn(RSTn),
 		.Column_Scan_Sig(Column_Scan_Sig)
 	);
 endmodule