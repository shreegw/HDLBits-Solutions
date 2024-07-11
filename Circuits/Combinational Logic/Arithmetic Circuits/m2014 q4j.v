module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire [3:0] cout;
    
    FA F1(x[0], y[0], 1'b0, cout[0], sum[0]);
    FA F2(x[1], y[1], cout[0], cout[1], sum[1]);
    FA F3(x[2], y[2], cout[1], cout[2], sum[2]);
    FA F4(x[3], y[3], cout[2], sum[4], sum[3]);
    
endmodule

module FA(input x, input y, input cin, output cout, output sum );
    
    assign sum = x ^ y ^ cin;
    assign cout = x & y | y & cin | x & cin;
    
endmodule 
