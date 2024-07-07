module top_moduleA (input x, input y, output z);

    assign z = (x^y) & x;
    
endmodule

module top_moduleB ( input x, input y, output z );

    assign z = ~(x ^ y);
    
endmodule

module top_module (input x, input y, output z);

    wire z1,z2,z3,z4,z5,z6;
    
    top_moduleA IA1(.x(x),.y(y),.z(z1));
    top_moduleA IA2(.x(x),.y(y),.z(z2));
    top_moduleB IB1(.x(x),.y(y),.z(z3));
    top_moduleB IB2(.x(x),.y(y),.z(z4));
    
    assign z5 = z1 | z3;
    assign z6 = z2 & z4;
    assign z = z5 ^ z6;
    
endmodule
