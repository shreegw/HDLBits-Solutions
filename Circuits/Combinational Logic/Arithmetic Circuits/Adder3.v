module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    Fadd F1(a[0], b[0], cin, cout[0], sum[0]);
    Fadd F2(a[1], b[1], cout[0], cout[1], sum[1]);
    Fadd F3(a[2], b[2], cout[1], cout[2], sum[2]);
    
endmodule

module Fadd(input a, input b, input cin, output cout, output sum );
    
    assign sum = a ^ b ^ cin;
    assign cout = a & b | b & cin | a & cin;
    
endmodule 
