`timescale 1ns/1ns
module data_select(
  input clk,
  input rst_n,
  input signed [7:0] a,
  input signed [7:0] b,
  input [1:0]select,
  output reg signed [8:0] c
);
//*****************code************************//
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      c <= 9'b0;
    end
    else begin
      case(select)
        2'b00 : c <= a;
        2'b01 : c <= b;
        2'b10 : c <= {a[7],a} + {b[7],b};
        2'b11 : c <= {a[7],a} - {b[7],b};
        default : c <= 0;
      endcase
    end
  end

// Method2

//*****************code************************//
endmodule

