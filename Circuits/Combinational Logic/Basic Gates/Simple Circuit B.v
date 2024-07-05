module top_module ( input x, input y, output z );

  assign z = ~(x ^ y); //XNOR gate
    
endmodule
