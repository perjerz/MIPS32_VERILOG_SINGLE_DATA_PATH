module dm (
  input clk,
  input [31:0] addr, writeData,
  input memWrite, memRead,
  output [31:0] readData
);

  reg [31:0] mem [0:10000];  
  integer i=0;
 initial begin
	for (i=0; i<10000; i=i+1) mem[i] = 32'b0;
  end
  always @(posedge clk) begin 
    if(memWrite)
      mem[addr] <= writeData;
  end

  assign readData = memRead ? mem[addr] : 0;
endmodule
//Stack ... -> 10000
//Dynamic data 2000 -> ...
//Static data 1000 -> 2000
//Text 40 -> 1000
//Reserved 0 -> 40