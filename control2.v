module control (input [5:0] op,output reg [2:0] alu_op,output reg [1:0] regDst,output reg aluSrc,output reg[1:0] memToReg, output reg regWrite,
    memRead, memWrite, branch,jump);
  always @(*) begin
  case (op)
    6'h0 : //R-format
    begin
      regDst <= 2'b1; 
      branch <= 1'b0;
      memRead <= 1'b0;
      memToReg <=  2'b0;
      alu_op <= 2'b10;
      memWrite  <= 1'b0;
      aluSrc <= 1'b0;
      regWrite <= 1'b1;
		jump <= 1'b0;
      end
    6'h8 ://addi
    begin
      regDst <= 2'b0;
      branch <= 1'b0;
      memRead <= 1'b0;
      memToReg <= 2'b0;
      alu_op <= 2'b00;
      memWrite <= 1'b0;
      aluSrc <= 1'b1;
      regWrite <= 1'b1;
		jump <= 1'b0;
    end
    6'h23://lw
    begin
		regDst <= 2'b0;
      aluSrc <= 1'b1;
      memToReg <= 2'b1;
		regWrite <= 1'b1;
      memRead <= 1'b1;
		memWrite <= 1'b0;
		branch <= 1'b0;
      alu_op <= 2'b00;
		jump <= 1'b0;
    end
    6'h2b://sw
    begin
      regDst <= 2'bx;
      aluSrc <= 1'b1;
      memToReg <= 2'bx;
		regWrite <= 1'b0;
      memRead <= 1'b0;
		memWrite <= 1'b1;
		branch <= 1'b0;
      alu_op <= 2'b00;
		jump <= 1'b0;
    end
    6'h4://beq
    begin
		regDst <= 2'bx;
      aluSrc <= 1'b0;
      memToReg <= 2'bx;
		regWrite <= 1'b0;
      memRead <= 1'b0;
		memWrite <= 1'b0;
      branch <= 1'b1;
      alu_op <= 2'b01;
		jump <= 1'b0;
    end
    6'h5://bnq
    begin

    end
	 6'h2://?jump
    begin
		regDst <= 2'b00;
      aluSrc <= 1'b0;
      memToReg <= 2'b00;
		regWrite <= 1'b0;
      memRead <= 1'b0;
		memWrite <= 1'b0;
      branch <= 1'b0;
      alu_op <= 2'b00;
		jump <= 1'b1;
    end
	 6'h3://?jumpandlink
    begin
		regDst <= 2'b11;
      aluSrc <= 1'b0;
      memToReg <= 2'b11;
		regWrite <= 1'b1;
      memRead <= 1'b0;
		memWrite <= 1'b0;
      branch <= 1'b1;
      alu_op <= 2'b01;
		jump <= 1'b1;
    end

  endcase
  end

  /*reg addi, andi, lw, sw, ori, beq, bne, j, jal, slti, r_format, x_found;

  always @(*) begin
    
    addi     <= 1'b0;
    lw       <= 1'b0;
    sw       <= 1'b0;
    ori      <= 1'b0;
    beq      <= 1'b0;
    bne      <= 1'b0;
    j        <= 1'b0;
    jal      <= 1'b0;
    andi     <= 1'b0;
    ori      <= 1'b0;
    r_format <= 1'b0;
    x_found  <= 1'b0;
    case (op)
      6'dx      : x_found  <= 1'b1;
      6'b001000 : addi     <= 1'b1; 
      6'b100011 : lw       <= 1'b1; 
      6'b101011 : sw       <= 1'b1; 
      6'b000100 : beq      <= 1'b1; 
      6'b000101 : bne      <= 1'b1; 
      6'b000010 : j        <= 1'b1; 
      6'b000011 : jal      <= 1'b1; 
      6'b001010 : slti     <= 1'b1; 
      6'b000000 : r_format <= 1'b1;
      6'b001100 : andi     <= 1'b1;
      6'b001101 : ori      <= 1'b1;
      6'b001000 : andi      <= 1'b1;
    endcase
  end

  assign regDst0 = r_format & (~x_found);
  assign regDst1 = jal & (~x_found);
  assign aluSrc = (lw | sw | andi | ori | addi) & (~x_found);
  assign memToReg0 = lw & (~x_found);
  assign memToReg1 = jal & (~x_found);
  assign regWrite = (r_format | lw | andi | ori | addi | jal) & (~x_found);
  assign memRead = lw & (~x_found);
  assign memWrite = sw & (~x_found); 
  assign branch = (beq) & (~x_found);
  assign branch_ne = (bne) & (~x_found);
  assign jump = (j | jal) & (~x_found);
  assign alu_op[0] = (beq | bne | andi) & (~x_found);
  assign alu_op[1] = (r_format | andi) & (~x_found);
  assign alu_op[2] = ori & (~x_found);
  */
endmodule
