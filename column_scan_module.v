module column_scan_module
(
	CLK,RSTn,Column_Scan_Sig
); 
	input CLK;
	input RSTn;
	output [1:0] Column_Scan_Sig;
	
	parameter T10MS=19'd499_999;
	
	reg[18:0] Count1;
	
	always @ (posedge CLK or negedge RSTn)
		if(!RSTn)
			Count1<=19'd0;
		else if(Count1==T10MS)
			Count1<=19'd0;
		else
			Count1<=Count1+19'b1;
		
	reg[1:0]t;
	
	always@(posedge CLK or negedge RSTn)
		if(!RSTn)
			t<=2'd0;
		else if (t==2'd2)
			t<=2'd0;
		else if(Count1==T10MS)
			t<=t+1'b1;
	
	reg[1:0]rColumn_Scan;
	
	always@(posedge CLK or negedge RSTn)
		if(!RSTn)
			rColumn_Scan<=2'b10;
		else if(Count1==T10MS)
			case(t)
				2'd0:rColumn_Scan<=2'b10;
				2'd1:rColumn_Scan<=2'b01;
			endcase
			
	assign Column_Scan_Sig=rColumn_Scan;

endmodule