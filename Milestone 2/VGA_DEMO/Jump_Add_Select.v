module j_addr_sel(
	input wire [4:0] ins,
	input wire [4:0] ex_mem_dst,
	input wire [4:0] mem_wb_dst,
	input wire [31:0] ex_mem_addr,
	input wire [31:0] mem_wb_addr,
	input wire [31:0] id_ex_addr,
	output reg [31:0] j_addr
	);
	
	always @* begin
		
		if (ins == ex_mem_dst) begin
			j_addr = ex_mem_addr;
		end else begin
			j_addr = id_ex_addr;
		end
	end
endmodule
