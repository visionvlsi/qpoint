`timescale 1ns/1ps
module bm(multiplier, multiplicand, product);
input [7:0]mutiplier, multiplicand;
product [15:0]product;
integer i;
reg signed [16:0]acc_multiplier_q;

always@(*)
begin
acc_multiplier_q={8’b0000_0000, multiplier, 1’b0};
for(i=0; i<=7; i=i+1)
case(acc_multiplier_q[1:0])
0,3: begin 
                 acc_multiplier_q= acc_multiplier_q >>> 1;
      end
1: begin acc_multiplier_q={acc_multiplier_q[16:9]+multiplicand,acc_multiplier_q[8:0]};
              acc_multiplier_q= acc_multiplier_q >>> 1;

     end
2: begin acc_multiplier_q={acc_multiplier_q[16:9]+~multiplicand+1,acc_multiplier_q[8:0]};
              acc_multiplier_q= acc_multiplier_q >>> 1;

     end
endcase
end
endmodule
