module mux32bit_2to1_2(input [31:0] i0, i1,
                    input s,
                    output [31:0] z);
  reg [31:0] z;

  initial z = 0;

  always @(*) begin
    case(s)
      1'b0: z = i0;
      1'b1: z = i1;
    endcase
  end
endmodule
