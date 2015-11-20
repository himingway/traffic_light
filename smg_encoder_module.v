module smg_encoder_module
(
	CLK,RSTn,Ten_Data,One_Data,Ten_SMG_Data,One_SMG_Data
); 

	input CLK;
	input RSTn;
	input [3:0]Ten_Data;
	input [3:0]One_Data;
	output[7:0]Ten_SMG_Data;
	output[7:0]One_SMG_Data;
	
	parameter 
	_0=8'b1100_0000,
	_1=8'b1111_1001,
	_2=8'b1010_0100,
	_3=8'b1011_0000,
	_4=8'b1001_1001,
	_5=8'b1001_0010,
	_6=8'b1000_0010,
	_7=8'b1111_1000,
	_8=8'b1000_0000,
	_9=8'b1001_0000;
	
	reg[7:0] rTen_SMG_Data;
	
	always@(posedge CLK or negedge RSTn)
		if(!RSTn)
			begin
				rTen_SMG_Data<=8'b1111_1111;
			end
		else
			case(Ten_Data)
				4'd0:rTen_SMG_Data<=_0;
				4'd1:rTen_SMG_Data<=_1;
				4'd2:rTen_SMG_Data<=_2;
				4'd3:rTen_SMG_Data<=_3;
				4'd4:rTen_SMG_Data<=_4;
				4'd5:rTen_SMG_Data<=_5;
				4'd6:rTen_SMG_Data<=_6;
				4'd7:rTen_SMG_Data<=_7;
				4'd8:rTen_SMG_Data<=_8;
				4'd9:rTen_SMG_Data<=_9;
			endcase
			
		reg[7:0]rOne_SMG_Data;
		
		always@(posedge CLK or negedge RSTn)
			if(!RSTn)
				begin
					rOne_SMG_Data<=8'b1111_1111;
				end
			else
				case(One_Data)
				4'd0:rOne_SMG_Data<=_0;
				4'd1:rOne_SMG_Data<=_1;
				4'd2:rOne_SMG_Data<=_2;
				4'd3:rOne_SMG_Data<=_3;
				4'd4:rOne_SMG_Data<=_4;
				4'd5:rOne_SMG_Data<=_5;
				4'd6:rOne_SMG_Data<=_6;
				4'd7:rOne_SMG_Data<=_7;
				4'd8:rOne_SMG_Data<=_8;
				4'd9:rOne_SMG_Data<=_9;
			endcase
	assign Ten_SMG_Data=rTen_SMG_Data;
	assign One_SMG_Data=rOne_SMG_Data;
endmodule