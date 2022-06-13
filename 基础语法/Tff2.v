`timescale 1ns/1ns
module Tff_2(
  input wire data, clk, rst,
  output reg q
);
//------------------code-------------------
  reg q1;
  always @(posedge clk or negedge rst) begin
    if(!rst) begin
      q1 <= 1'b0;
      q  <= 1'b0;
    end
    else if(data) begin
      q1 <= !q1;
      if(q1) begin
        q <= !q;
      end
      else begin
        q <= q;
      end
    end
    else if(!data) begin
      q1 <= q1;
      if(q1) begin
        q <= !q;
      end
      else begin
        q <= q;
      end
    end
  end
//------------------code-------------------
endmodule

module Tff_2(
  input wire data, clk, rst,
  output reg q
);
//------------------code-------------------
  reg q1;
  always @(posedge clk or negedge rst) begin
    if(!rst) begin
      q <= 1'b0;
    end
    else begin
      if(data) begin
        q1 <= !q1;
      end
      else
        q1 <= q1;
    end
  end

  always @(posedge clk or negedge rst) begin
    if(!rst) begin
      q1 <= 1'b0;
    end
    else begin
      if(q1) begin
        q <= !q;
      end
      else
        q <= q;
    end
  end
//------------------code-------------------
endmodule



