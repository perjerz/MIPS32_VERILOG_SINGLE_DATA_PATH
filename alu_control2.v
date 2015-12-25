module alu_control (input [5:0] funct,input [2:0] alu_op,output reg [3:0] aluctrl_val);
  reg [3:0] funct_val;
  always @(*) begin
    case(funct)
      6'b100100 : funct_val =  4'b0000;//AND
      6'b100101   : funct_val =  4'b0001;//OR
      6'b100000  : funct_val =  4'b0010;//add
      6'b100010  : funct_val =  4'b0110;//sub 
      6'b101010  : funct_val =  4'b0111;//slt * not yet
      6'b100111  : funct_val =  4'b1100;//nor * not yet
      default: funct_val  = 4'dx;
    endcase
  end  
  always @(*) begin
    aluctrl_val <= 0;
    case (alu_op)
      3'b000  : aluctrl_val <= 4'd2;//lw sw addi
      3'b001 : aluctrl_val <= 4'd6;//branch
      3'b010 : aluctrl_val <= funct_val;//r type
      default: aluctrl_val <= 4'd0;
    endcase
  end
  assign aluctrl = aluctrl_val;
endmodule
