`timescale 1ns/1ns
module mux4_1(
  input  [1:0]d1,d2,d3,d0,
  input  [1:0]sel,
  output [1:0]mux_out
);

  reg [1:0] mux_out_reg;
  always @(*) begin
    case(sel)
      2'b00 : mux_out_reg = d3;
      2'b01 : mux_out_reg = d2;
      2'b10 : mux_out_reg = d1;
      default : mux_out_reg = d0;
    endcase
  end
  assign mux_out = mux_out_reg;
endmodule

