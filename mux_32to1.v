module mux32bit_2to1(input [31:0] i0, i1,input s,output reg [31:0] z);
	always @(*) 
	begin
		if(sel == 0)
			z=i0;
		else
		begin
			z=i1;
		end
	end
endmodule
