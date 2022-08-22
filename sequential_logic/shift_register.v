module shift_register(
  input in,
  input clk,
  input reset_n,
  output out
);

  reg [3:0] out_reg;

  always@(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
      out_reg <= 0;    
    end
    else begin
      out_reg = {in[0], out_reg[7:1]};
    end
  end

  assign out = out_reg[0];

endmodule
