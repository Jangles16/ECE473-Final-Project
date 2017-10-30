// Add.v

module Add4(
	input wire [31:0] in,
	output reg [31:0] out);
	
	always @(*) begin
		out <= in + 4;
	end
endmodule