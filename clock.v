/*This module is used to generate the 100ms clock*/
module clock (
	input clk,    // Clock
	input rst_n, // Asynchronous reset active low
	output clk100ms
);
reg [25:0] cnt1ms;
reg [5:0] cnt100ms;
reg rclk100ms;
//the clock of the FPGA is 50MHz=50_000_000_000HZ

//generate 1ms clock
always @(posedge clk or negedge rst_n) begin : proc_cnt1ms
	if(~rst_n) begin
		cnt1ms <= 0;
	end else begin
		if (cnt1ms == 26'd49_999_999)
			cnt1ms <= 26'd0;
		else
			cnt1ms <= 1'd1+cnt1ms;
	end
end

//generate 100ms clock
always @(posedge cnt1ms or negedge rst_n) begin : proc_cnt100ms
	if(~rst_n) begin
		cnt100ms <= 0;
		rclk100ms <=0;
	end else begin
		if(cnt100ms == 6'd49) begin
			cnt100ms <= 6'd0;
			rclk100ms <= ~rclk100ms;
		end
		else
			cnt100ms <= cnt100ms + 1'd1;
	end
end
assign clk100ms = rclk100ms;
endmodule