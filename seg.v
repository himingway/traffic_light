module seg (
	input clk,    // Clock
	input clk_en, // Clock Enable
	input rst_n // Asynchronous reset active low
	
);

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

endmodule