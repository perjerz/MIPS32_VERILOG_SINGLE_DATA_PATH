module jump_addr(
  input [25:0] inst,
  input [3:0] pc_4,
  output[31:0] j_addr);

  buf (j_addr[0 ] ,inst[0 ]);
  buf (j_addr[1 ] ,inst[1 ]);
  buf (j_addr[2 ] ,inst[2 ]);
  buf (j_addr[3 ] ,inst[3 ]);
  buf (j_addr[4 ] ,inst[4 ]);
  buf (j_addr[5 ] ,inst[5 ]);
  buf (j_addr[6 ] ,inst[6 ]);
  buf (j_addr[7 ] ,inst[7 ]);
  buf (j_addr[8 ] ,inst[8 ]);
  buf (j_addr[9 ] ,inst[9 ]);
  buf (j_addr[10] ,inst[10]);
  buf (j_addr[11] ,inst[11]);
  buf (j_addr[12] ,inst[12]);
  buf (j_addr[13] ,inst[13]);
  buf (j_addr[14] ,inst[14]);
  buf (j_addr[15] ,inst[15]);
  buf (j_addr[16] ,inst[16]);
  buf (j_addr[17] ,inst[17]);
  buf (j_addr[18] ,inst[18]);
  buf (j_addr[19] ,inst[19]);
  buf (j_addr[20] ,inst[20]);
  buf (j_addr[21] ,inst[21]);
  buf (j_addr[22] ,inst[22]);
  buf (j_addr[23] ,inst[23]);
  buf (j_addr[24] ,inst[24]);
  buf (j_addr[25] ,inst[25]);
  buf (j_addr[26] ,1'b0    );
  buf (j_addr[27] ,1'b0    );
  buf (j_addr[28] ,pc_4[0 ]);
  buf (j_addr[29] ,pc_4[1 ]);
  buf (j_addr[30] ,pc_4[2 ]);
  buf (j_addr[31] ,pc_4[3 ]);

endmodule
