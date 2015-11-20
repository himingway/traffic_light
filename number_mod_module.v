module number_mod_module
(
	CLK,RSTn,Number_Data,Ten_Data,One_Data
);
	input CLK;
	input RSTn;
	input [7:0]Number_Data;
	output[3:0]Ten_Data;
	output[3:0]One_Data;
	
	/******************************************/
	
	 reg [31:0]rTen;
	 reg[31:0]rOne;
	 
	 always@(posedge CLK or negedge RSTn)
	 	if(!RSTn)
	 		begin
	 			rOne<=32'd0;
	 		end
	 	else
	 		begin
	 			rTen<=Number_Data/10;
	 			rOne<=Number_Data%10;
	 		end
	 		
	 		assign Ten_Data=rTen[3:0];
	 		assign One_Data=rOne[3:0];
	 endmodule