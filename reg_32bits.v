`include "../lib/flip_flop.v"

module reg_32bits (
  input [31:0] d,
  input we, clk,
  output [31:0] q);
 
  d_flip_flop dff0 (.q(q[0 ]), .d(d[0 ]), .we(we), .clk(clk));
  d_flip_flop dff1 (.q(q[1 ]), .d(d[1 ]), .we(we), .clk(clk));
  d_flip_flop dff2 (.q(q[2 ]), .d(d[2 ]), .we(we), .clk(clk));
  d_flip_flop dff3 (.q(q[3 ]), .d(d[3 ]), .we(we), .clk(clk));
  d_flip_flop dff4 (.q(q[4 ]), .d(d[4 ]), .we(we), .clk(clk));
  d_flip_flop dff5 (.q(q[5 ]), .d(d[5 ]), .we(we), .clk(clk));
  d_flip_flop dff6 (.q(q[6 ]), .d(d[6 ]), .we(we), .clk(clk));
  d_flip_flop dff7 (.q(q[7 ]), .d(d[7 ]), .we(we), .clk(clk));
  d_flip_flop dff8 (.q(q[8 ]), .d(d[8 ]), .we(we), .clk(clk));
  d_flip_flop dff9 (.q(q[9 ]), .d(d[9 ]), .we(we), .clk(clk));
  d_flip_flop dff10(.q(q[10]), .d(d[10]), .we(we), .clk(clk));
  d_flip_flop dff11(.q(q[11]), .d(d[11]), .we(we), .clk(clk));
  d_flip_flop dff12(.q(q[12]), .d(d[12]), .we(we), .clk(clk));
  d_flip_flop dff13(.q(q[13]), .d(d[13]), .we(we), .clk(clk));
  d_flip_flop dff14(.q(q[14]), .d(d[14]), .we(we), .clk(clk));
  d_flip_flop dff15(.q(q[15]), .d(d[15]), .we(we), .clk(clk));
  d_flip_flop dff16(.q(q[16]), .d(d[16]), .we(we), .clk(clk));
  d_flip_flop dff17(.q(q[17]), .d(d[17]), .we(we), .clk(clk));
  d_flip_flop dff18(.q(q[18]), .d(d[18]), .we(we), .clk(clk));
  d_flip_flop dff19(.q(q[19]), .d(d[19]), .we(we), .clk(clk));
  d_flip_flop dff20(.q(q[20]), .d(d[20]), .we(we), .clk(clk));
  d_flip_flop dff21(.q(q[21]), .d(d[21]), .we(we), .clk(clk));
  d_flip_flop dff22(.q(q[22]), .d(d[22]), .we(we), .clk(clk));
  d_flip_flop dff23(.q(q[23]), .d(d[23]), .we(we), .clk(clk));
  d_flip_flop dff24(.q(q[24]), .d(d[24]), .we(we), .clk(clk));
  d_flip_flop dff25(.q(q[25]), .d(d[25]), .we(we), .clk(clk));
  d_flip_flop dff26(.q(q[26]), .d(d[26]), .we(we), .clk(clk));
  d_flip_flop dff27(.q(q[27]), .d(d[27]), .we(we), .clk(clk));
  d_flip_flop dff28(.q(q[28]), .d(d[28]), .we(we), .clk(clk));
  d_flip_flop dff29(.q(q[29]), .d(d[29]), .we(we), .clk(clk));
  d_flip_flop dff30(.q(q[30]), .d(d[30]), .we(we), .clk(clk));
  d_flip_flop dff31(.q(q[31]), .d(d[31]), .we(we), .clk(clk));

endmodule
