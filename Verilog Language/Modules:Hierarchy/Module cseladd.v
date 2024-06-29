module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire c1,c2,c3;
    wire [15:0] sum1, sum2;
    
    add16 a2(.a(a[31:16]), .b(b[31:16]), .cin(0), .cout(c2), .sum(sum1[15:0]));
    add16 a3(.a(a[31:16]), .b(b[31:16]), .cin(1), .cout(c3), .sum(sum2[15:0]));
    
    add16 a1(.a(a[15:0]), .b(b[15:0]), .cin(0), .cout(c1), .sum(sum[15:0]));
    
    always @(*)begin 
        case(c1)
            0: sum[31:16] = sum1;
            1: sum[31:16] = sum2;
        endcase
    end
endmodule
