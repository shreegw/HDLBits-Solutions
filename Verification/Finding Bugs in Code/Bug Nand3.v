module top_module (input a, input b, input c,input d, input e, output out);//
	wire temp;
    andgate inst1 (temp, a, b, c, 1, 1 );
	assign out = ~temp;
    
endmodule
