module mux32bit_4to1(input [31:0] i0, i1,i2,i3,input s,output reg [31:0] z);
	always @(*) 
	begin
		case(s)
			0:z=i0;
			1:z=i1;
			2:z=i2;
			3:z=i3;
		endcase
	end
endmodule
