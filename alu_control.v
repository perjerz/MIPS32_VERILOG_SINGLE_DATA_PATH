module alu_control (input [5:0] funct,input [2:0] alu_op,output [3
  reg [3:0] funct_val;
  reg [3:0] aluctrl_val;
  always @(*) begin
    case(funct)
      6'b100100 : funct_val =  4'b0000;
      6'b100101   : funct_val =  4'b0001;
      6'b100000  : funct_val =  4'b0110;
      6'b100010  : funct_val =  4'b0110;
      6'b101010  : funct_val =  4'b0111;
      6'b100111  : funct_val =  4'b1100;
      default: funct_val  = 4'd0;
    endcase
  end  
  always @(*) begin
    aluctrl_val <= 0;
    case (alu_op)
      3'b000  : aluctrl_val <= 4'd2;//lw sw addi
      3'b001 : aluctrl_val <= 4'd6;//branch
      3'd010 : aluctrl_val <= funct_val;//r type
      default: aluctrl_val <= 4'd0;
    endcase
  end
  assign aluctrl = aluctrl_val;
endmodule
