module cpu(input clk,
           output [31:0] alu_output, data,
			  output reg [31:0] pc,
				output [31:0] nxt_pc,
			  output [3:0] alu_ctrl,
			  output [31:0] readData1,
			  output [31:0] mux1_output,
			  output [2:0] alu_op,
			  output [1:0] regDst, memToReg,
				output regWrite, aluSrc,memRead, memWrite, branch,
			  output [31:0] writeData,
			  output zero,
			  output [31:0] mux3_output,
			  output [31:0] mux4_output,
			  output jump
  );

  //reg [31:0] pc;
  //wire [31:0] readData, b;
  //Output Control Unit
  //wire regDest, regWrite, aluSrc, memToReg; 
  //wire [2:0] alu_op;
  //wire memRead, memWrite, branch;
  //Input Register
  
  //wire [31:0] data;
  wire [4:0] readReg1;
  wire [4:0] readReg2;
  wire [4:0] writeReg;
  //wire [31:0] writeData;
  
  //Output Register
  wire [31:0] /*readData1,*/readData2;
  
  
  //Output alu
   //wire [31:0] alu_output;
	
	//Output Mem
	wire [31:0] memData;
  
  wire [31:0] sExtended, j_addr;
 // wire [3:0] alu_ctrl;
  

  wire [31:0] fa1_output, ex_shifted, pc_4;
  
  initial
  begin
  pc = 32'd40;
  pc = pc<<2;
  end
  //wire [31:0] afterpc;
  wire [31:0] aftersignExtend;
  //wire [31:0] mux1_output;
  //wire mux3_output;
  
  //wire zero;
  //Jump
  //wire branch_ne, s_branch, jump
  //wire jump;
  wire [31:0] jumpa;
  im i_mem(.clk(clk),.addr(pc),.data(data));
  control         ca(.op(data[31:26]), 
                    .alu_op(alu_op), 
                    .regDst(regDst), 
                    .aluSrc(aluSrc), 
                    .memToReg(memToReg), 
                    .regWrite(regWrite), 
                    .memRead(memRead), 
                    .memWrite(memWrite), 
                    .branch(branch),.jump(jump));
  reg_file        rf(.readReg1(data[25:21]),
                     .readReg2(data[20:16]),
                     .writeReg(writeReg),
							.writeData(writeData),
                     .regWrite(regWrite),
							.clk(clk),
                     .readData1(readData1),
                     .readData2(readData2)
                     );

 assign aftersignExtend = {16'b000000000000000,data[15:0]};
 //wire mux3_output;
 //wire mux4_output;
 wire jr;
  alu             main_alu(.op(alu_ctrl), .a(readData1), .b(mux1_output	), .z(alu_output), .zero(zero));
  alu_control     ac  (.funct(data[5:0]), .alu_op(alu_op), .aluctrl_val(alu_ctrl));
  
  dm mem(.clk(clk), .addr(alu_output), .writeData(readData2), .memWrite(memWrite), .memRead(memRead), .readData(memData));  
  
  assign ex_shifted = aftersignExtend<<2;

  //alu             fa1(.op(4'd2), .a(pc_4), .b(ex_shifted), .z(fa1_output));
  alu             fa1(.op(4'd2), .a(pc_4), .b(ex_shifted), .z(fa1_output));//alu before for next instruction
  alu             fa2(.op(4'd2), .a(pc), .b(32'd4), .z(pc_4));//alu pc+4
  //wire int0, int1;
  //and (int0, branch, zero);
  //and (int1, branch_ne, ~zero);
  //or (s_branch, int0, int1);
  and(s_branch,branch,zero);
  /*wire jr;
  and and1(jr , ~data[5], ~data[4], data[3], ~data[2], ~data[1], ~data[0]
              , ~data[26], ~data[27],~data[28], ~data[29], ~data[30], ~data[31] ); 
  */
  //always @(*) jr =  ~data[26] & ~data[27] & data[28] & ~data[29] & ~data[30] & ~data[31];

  //mux32bit_2to1 mux3(.i0(pc_4), .i1(fa1_output), .s(s_branch), .z(nxt_pc));
  
  /**/
  //mux5bit_2to1 mux0(.i0(data[20:16]), .i1(data[15:11]),.s(regDst),.z(writeReg));//mux 20-16 or 15-11 I or R format
  /**/
  
  mux5bit_3to1 mux0(.i0(data[20:16]), .i1(data[15:11]),.i2(5'b11111),.s(regDst),.z(writeReg));
  
  mux32bit_2to1_2   mux1(readData2,aftersignExtend,aluSrc,mux1_output);//mux before ALU
  
  /**/
  //mux32bit_2to1_2 mux2(.i0(alu_output), .i1(memData), .s(memToReg), .z(writeData));//mux to write data
  /**/
  
  mux32bit_3to1 mux2(.i0(alu_output),.i1(memData),.i2(pc_4),.s(memToReg),.z(writeData));
  //mux32bit_4to1 mux2(.i0(alu_output), .i1(memData), .i2(pc_4), .s(memToReg), .z(writeData));//mux to write data
  mux32bit_2to1_2 mux3(.i0(pc_4), .i1(fa1_output), .s(s_branch), .z(mux3_output));//mux before next instruction .z(nxt_pc)
  mux32bit_2to1_2 mux4(.i0(mux3_output),.i1(jumpa),.s(jump),.z(mux4_output));//nxt_pc_afterjump
  //mux32bit_2to1_2 mux4(.i0(mux3_output), .i1(j_addr), .s(jump), .z(mux4_output));//mux jump after*
 // mux32bit_2to1_2 mux5(.i1(readData1), .i0(mux4_output), .z(nxt_pc), .s(jr));//mux jr

  //mux32bit_2to1 mux4(.i1(j_addr), .i0(mux3_output), .z(nxt_pc), .s(jump)); 
  and jr1(jr , ~data[5], ~data[4], data[3], ~data[2], ~data[1], ~data[0]
              , ~data[26], ~data[27],~data[28], ~data[29], ~data[30], ~data[31]);//check jr R fotmat and opcode 8hex 0/08hex
	mux32bit_2to1_2 mux5(.i0(mux4_output),.i1(readData1),.s(jr),.z(nxt_pc));//mux jr
  assign jumpa = {pc_4[31:28],(data[27:0]<<2)};
  always @(posedge clk) begin
    pc <= nxt_pc;
  end
  
endmodule
