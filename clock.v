/*This module is used to generate the 100ms clock*/
module clock (
	input clk,    // Clock
	input rst_n, // Asynchronous reset active low
	output clk100ms
);
reg [23:0] cnt100ms;
reg rclk100ms;
//the clock of the FPGA is 50MHz=50_000_000HZ

//generate 100ms clock
always @(posedge clk or negedge rst_n) begin : proc_cnt100ms
	if(~rst_n) begin
		cnt100ms <= 0;
		rclk100ms <=0;
	end else begin
		if(cnt100ms == 24'd2_499_999) begin
			cnt100ms <= 24'd0;
			rclk100ms <= ~rclk100ms;
		end
		else
			cnt100ms <= cnt100ms + 1'd1;
	end
end
assign clk100ms = rclk100ms;
endmodule