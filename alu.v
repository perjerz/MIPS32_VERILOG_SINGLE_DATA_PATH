module alu (input [3:0] op,input [31:0] a, b,output reg [31:0] z, output reg zero);
	always @(*) begin
	case(op)
		4'b0000: z<=a&b;//and
		4'b0001: z<=a|b;//or
		4'b0010: {zero,z}<=a+b;//add
		4'b0110:
			begin		
			z<=a-b;//sub
			if(z==0)
				zero <=1;
			end		
		4'b0111: begin // SLT
				if (a[31] != b[31]) begin
					if (a[31] > b[31]) begin
						z <= 1;
					end else begin
						z <= 0;
					end
				end else begin
					if (a < b)
					begin
						z <= 1;
					end
					else
					begin
						z <= 0;
					end
				end
			end
		/*4'b0111: 
		begin
			if(a-b>0)
				zero=1'b1;
			else
				zero=1'b0;
		
		end*/
	//	4'b1100: assign z=a~|b;//nor
	endcase
	end
endmodule
