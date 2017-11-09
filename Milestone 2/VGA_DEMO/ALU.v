//ALU.v

module ALU(
	input wire [31:0] op1,
	input wire [31:0] op2,
	input wire [31:0] ins,
	output reg [31:0] result);
	
	integer shift_am;
	integer i;
	initial begin
		result = 32'h00000000;
	end
	
	always @* begin
		shift_am = ins[10:6];
	
		//normal add
		if(ins[5:0] == 6'b100000) begin
			result = op1 + op2;
		end
		//unsigned add
		if(ins[5:0] == 6'b100001) begin
			result = op1 + op2;
		end
		//normal sub
		if(ins[5:0] == 6'b100010) begin
			result = op1 - op2;
		end
		//unsigned sub
		if(ins[5:0] == 6'b100011) begin
			result = op1 - op2;
		end
		//and
		if(ins[5:0] == 6'b100100) begin
			result = op1 & op2;
		end
		//or
		if(ins[5:0] == 6'b100101) begin
			result = op1 | op2;
		end
		//nor
		if(ins[5:0] == 6'b100111) begin
			result = ~(op1 | op2);
		end
		//slt meow
		if(ins[5:0] == 6'b101010) begin
			if (op1 < op2) begin
				result = 0;
			end else begin
				result = 1;
			end
		end
		//sll
		if(ins[5:0] == 6'b000000) begin
			result = op2 << shift_am;
		end
		//srl
		if(ins[5:0] == 6'b000010) begin
			result = op2 >> shift_am;
		end
		//sra
		if(ins[5:0] == 6'b000011) begin
			result = op2 >> shift_am;
			if (op2[31] == 1'b1) begin
				for (i = 0; i < shift_am; i=i+1) begin
					result[31-i] = 1'b1;
				end
			end
		end
		//jr
		if(ins[5:0] == 6'b001000) begin
			result = 0;
		end
		//nop 
		if(ins[31:0] == 32'h00000000) begin
			result = 0;
		end
	end
endmodule