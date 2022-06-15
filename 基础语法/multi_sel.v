`timescale 1ns/1ns
module multi_sel(
  input [7:0]d,
  input clk,
  input rst,
  output reg input_grant,
  output reg [10:0]out
);
//************code**************//
  reg [1:0] count;
  always @(posedge clk or negedge rst) begin
    if(!rst) begin
      count <= 2'b00;
    end
    else begin
      count <= count + 2'b01;
    end
  end

  reg [7:0] d_reg;
  always @(posedge clk or negedge rst) begin
    if(!rst) begin
      out         <= 11'b0;
      input_grant <= 1'b0;
      d_reg       <= 8'b0;
    end
    else begin
      case(count)
        2'b00 : begin
          input_grant <= 1'b1;
          d_reg       <= d;
          out         <= d;
        end
        2'b01 : begin
          input_grant <= 1'b0;
          out         <= d_reg + {d_reg, 1'b0};
        end
        2'b10 : begin
          input_grant <= 1'b0;
          out         <= d_reg + {d_reg, 2'b0} + {d_reg, 1'b0};
        end
        2'b11 : begin
          input_grant <= 1'b0;
          out         <= {d_reg, 3'b0};
        end
        default : begin
          input_grant <= 1'b0;
          d_reg       <= d;
          out         <= d_reg;
        end
      endcase
    end
  end
//************code**************//
endmodule

