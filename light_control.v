module light_control (
	input clk,    // Clock
	input rst_n,  // Asynchronous reset active low
	output Gx,Rx,Gy,Ry
);

reg rGx;
reg rGy;
reg rRx;
reg rRy;
reg [1:0] state;
reg [23:0] cnt;

parameter Tx =30;
parameter Ty = 15;

always @(posedge clk or negedge rst_n) begin : proc_cnt
	if(~rst_n) begin
		cnt <= 0;
	end else begin
		if (cnt == (Tx+Ty)*10-1)
			cnt <= 0;
		else
			cnt <= 1'd1+cnt;
	end
end

always @(posedge clk or negedge rst_n) begin : proc_light_control
	if(~rst_n) begin
		state <= 2'd0;
		rGx <= 1'd0;
		rGy <= 1'd0;
		rRx <=1'd0;
		rRy <= 1'd0;
	end else begin
		case (state)
			2'd0:begin 
				if(cnt == Tx * 10 - 51) begin
					state <= 2'd1;
					rGx <= 1'b0;
				end
				else
					rGx <= 1'b1;
					rRy <= 1'b1;
					rRx <= 1'b0;
					rGy <= 1'b0;
			end
			2'd1:begin 
				if(cnt == Tx*10 -1) begin
					state <= 2'd2;
					rGx <= 1'b0;
				end
				else if(cnt == Tx*10 - 6) begin 
					rGx <= 1'b1;
				end
				else if(cnt == Tx*10 - 11) begin 
					rGx <= 1'b0;
					end
				else if(cnt == Tx*10 - 16) begin 
					rGx <= 1'b1;
					end
				else if(cnt == Tx*10 - 21) begin 
					rGx <= 1'b0;
					end
				else if(cnt == Tx*10 - 26) begin 
					rGx <= 1'b1;
					end
				else if(cnt == Tx*10 - 31) begin 
					rGx <= 1'b0;
					end
				else if(cnt == Tx*10 - 36) begin 
					rGx <= 1'b1;
					end
				else if(cnt == Tx*10 - 41) begin 
					rGx <= 1'b0;
					end
				else if(cnt == Tx*10- 46) begin 
					rGx <= 1'b1;
					end
			end
			2'd2:begin 
				if(cnt == (Tx+Ty)*10-51) begin 
					state <= 2'd3;
					rGy <= 1'b0;
				end
				else begin
					rRy <=1'b0;
					rGy <= 1'b1;
					rRx <= 1'b1;
				end
			end
			2'd3:begin 
				if(cnt == (Tx+Ty)*10-1) begin
					rGy <= 1'b0;
					state <= 2'd0;
				end
				else if(cnt == (Tx+Ty)*10-6) begin 
					rGy <= 1'b1;
				end
				else if(cnt == (Tx+Ty)*10-11) begin 
					rGy<= 1'b0;
					end
				else if(cnt == (Tx+Ty)*10-16) begin 
					rGy <= 1'b1;
					end
				else if(cnt == (Tx+Ty)*10-21) begin 
					rGy <= 1'b0;
					end		
				if(cnt == (Tx+Ty)*10-26) begin
					rGy <= 1'b1;
				end
				else if(cnt == (Tx+Ty)*10-31) begin 
					rGy <= 1'b0;
				end
				else if(cnt == (Tx+Ty)*10-36) begin 
					rGy<= 1'b1;
					end
				else if(cnt == (Tx+Ty)*10-41) begin 
					rGy <= 1'b0;
					end
				else if(cnt == (Tx+Ty)*10-46) begin 
					rGy <= 1'b1;
					end
			end
			default : state <= 2'd0;
		endcase
	end
end

assign Gx = rGx;
assign Gy = rGy;
assign Rx = rRx;
assign Ry = rRy;
endmodule
