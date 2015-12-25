module control (
    input [5:0] op,
    output [1:0] alu_op,
    output regDst, aluSrc, memToReg, regWrite,
    output memRead, memWrite, branch
  );

wire int0, op0_bar, op1_bar, op2_bar, op3_bar, op4_bar, op5_bar;

not (op0_bar, op[0]);
not (op1_bar, op[1]);
not (op2_bar, op[2]);
not (op3_bar, op[3]);
not (op4_bar, op[4]);
not (op5_bar, op[5]);

and (alu_op[0], op5_bar, op4_bar, op3_bar, op[2]  , op1_bar, op0_bar); 
and (alu_op[1], op5_bar, op4_bar, op3_bar, op2_bar, op1_bar, op0_bar); 
and (regDst   , op5_bar, op4_bar, op3_bar, op2_bar, op1_bar, op0_bar); 
and (memToReg , op[5]  , op4_bar, op3_bar, op2_bar, op[1]  , op[0]  );
and (memRead  , op[5]  , op4_bar, op3_bar, op2_bar, op[1]  , op[0]  ); 
and (memWrite , op[5]  , op4_bar, op[3]  , op2_bar, op[1]  , op[0]  ); 
and (branch   , op5_bar, op4_bar, op3_bar, op[2]  , op1_bar, op0_bar); 
and (int0     , op[5]  , op4_bar, op3_bar, op2_bar, op[1]  , op[0]  );
and (aluSrc   , op[5]  , op4_bar, op2_bar, op[1]  , op[0] ); 
or  (regWrite , int0   , alu_op[1]);

endmodule
