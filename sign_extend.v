module sign_extend (
  input  [15:0] a,
  output [31:0] b);

buf (b[31], a[15]);
buf (b[30], a[15]);
buf (b[29], a[15]);
buf (b[28], a[15]);
buf (b[27], a[15]);
buf (b[26], a[15]);
buf (b[25], a[15]);
buf (b[24], a[15]);
buf (b[23], a[15]);
buf (b[22], a[15]);
buf (b[21], a[15]);
buf (b[20], a[15]);
buf (b[19], a[15]);
buf (b[18], a[15]);
buf (b[17], a[15]);
buf (b[16], a[15]);
buf (b[15], a[15]);
buf (b[14], a[14]);
buf (b[13], a[13]);
buf (b[12], a[12]);
buf (b[11], a[11]);
buf (b[10], a[10]);
buf (b[9 ], a[9 ]);
buf (b[8 ], a[8 ]);
buf (b[7 ], a[7 ]);
buf (b[6 ], a[6 ]);
buf (b[5 ], a[5 ]);
buf (b[4 ], a[4 ]);
buf (b[3 ], a[3 ]);
buf (b[2 ], a[2 ]);
buf (b[1 ], a[1 ]);
buf (b[0 ], a[0 ]);

endmodule
