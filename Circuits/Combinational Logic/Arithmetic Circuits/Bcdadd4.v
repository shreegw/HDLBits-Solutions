module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire cout1, cout2, cout3;
    
    bcd_fadd f1(.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(cout1) );
    bcd_fadd f2(.a(a[7:4]), .b(b[7:4]), .cin(cout1), .sum(sum[7:4]), .cout(cout2) );
    bcd_fadd f3(.a(a[11:8]), .b(b[11:8]), .cin(cout2), .sum(sum[11:8]), .cout(cout3) );
    bcd_fadd f4(.a(a[15:12]), .b(b[15:12]), .cin(cout3), .sum(sum[15:12]), .cout(cout) );

endmodule
