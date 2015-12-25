module mux5bit_2to1 (
  input [4:0] i0, i1,
  input s ,
  output reg[4:0] z
);
  initial z = 0;

  always @(*) begin
      case(s)
        2'b00 : z = i0;
        2'b01 : z = i1;
      endcase
  end

endmodule
