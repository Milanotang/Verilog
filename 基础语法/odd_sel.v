`timescale 1ns/1ns
module odd_sel(
  input  [31:0] bus,
  input         sel,
  output        check
);
//---------------code-----------------//
// Method 1:
  wire check_tmp;
  assign check_tmp = ^bus;
  assign check = sel ? check_tmp : !check_tmp;

// Method 2:
  reg check_reg;
  always @(*) begin
    if(sel) begin
      check_reg <= ^bus;
    end
    else begin
      check_reg <= !(^bus);
    end
  end
  assign check = check_reg;

// Method 3:
  wire check_tmp;
  reg  check_reg;
  assign check_tmp = ^bus;
  always @(*) begin
    if(sel) begin
      check_reg <= check_tmp;
    end
    else begin
      check_reg <= !check_tmp;
    end
  end
  assign check = check_reg;
//---------------code-----------------//
endmodule

