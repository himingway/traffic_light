module seg (
	input clk,    // Clock
	input rst_n, // Asynchronous reset active low
	output Numout,
	output test
	);

reg [20:0]cnt;
reg [7:0] rNumout;
reg [5:0]cnt1;
reg clk1;
reg state;
parameter Tx =30;
parameter Ty = 15;

always @(posedge clk or negedge rst_n) begin : proc_cnt
	if(~rst_n) begin
		cnt <= 0;
	end else begin
		if (cnt == (Tx+Ty)*10-1)
			cnt <= 10'd0;
		else
		cnt <= 1'd1+cnt;
	end
end


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
				rNumout <= rNumout - 1'b1;
			end else 
			cnt1 <= 1'b1+cnt1;
			if(rNumout ==0) begin
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
			if(rNumout ==0) begin 
				state <= 1'b0;
				rNumout <= Tx;
			end
			end
			default : state <= 1'b0;
		endcase
	end
end
assign Numout = rNumout;
assign test=select;
endmodule
