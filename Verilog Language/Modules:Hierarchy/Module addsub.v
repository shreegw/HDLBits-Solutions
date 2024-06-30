module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire c1,c2;
    wire [31:0] ones;
    assign ones = b ^ {32{sub}};

    add16 a1(.a(a[15:0]), .b(ones[15:0]), .cin(sub), .cout(c1), .sum(sum[15:0]));
    add16 a2(.a(a[31:16]), .b(ones[31:16]), .cin(c1), .cout(c2), .sum(sum[31:16]));
    
endmodule
