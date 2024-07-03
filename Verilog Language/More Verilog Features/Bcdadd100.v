module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire[99:0] couttemp;
    genvar i;
    
    generate
        bcd_fadd(a[3:0], b[3:0], cin, couttemp[0],sum[3:0]);
        for (i=4; i<400; i=i+4) begin: bcd_adder_instances
            bcd_fadd bcda(a[i+3:i], b[i+3:i], couttemp[i/4-1],couttemp[i/4],sum[i+3:i]);
        end
    endgenerate
    
    assign cout = couttemp[99];
endmodule
