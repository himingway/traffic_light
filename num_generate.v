module num_generate (
	input clk,    // Clock
	input rst_n, // Asynchronous reset active low
	output [7:0]Numout,
	output test
	);

parameter Tx =30;
parameter Ty = 15;

reg [7:0] rNumout = Tx-1;
reg [5:0]cnt1;
reg clk1;
reg state;

always @(posedge clk or negedge rst_n) begin : proc_Numour
	if(~rst_n) begin
		rNumout <= Tx-1;
		cnt1 <=0;
		state <= 1'b0;
	end else begin
		case (state)
			1'b0: begin
			if(cnt1 == 49)begin 
				cnt1 <= 0;
				rNumout <= rNumout -1'b1;
			end else 
			cnt1 <= 1'b1+cnt1;
			if(rNumout == 8'b11111111) begin
				state <= 1'b1; 
				rNumout <= Ty-1;
			end
			end
			1'b1: begin
			if(cnt1 == 49)begin 
				cnt1 <= 0;
				rNumout <= rNumout - 1'b1;
			end else 
			cnt1 <= 1'b1+cnt1;
			if(rNumout == 8'b11111111) begin 
				state <= 1'b0;
				rNumout <= Tx-1;
			end
			end
			default : state <= 1'b0;
		endcase
	end
end
assign Numout = rNumout;
endmodule
