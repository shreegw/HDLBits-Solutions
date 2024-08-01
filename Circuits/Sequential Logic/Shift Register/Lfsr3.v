module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
    output [2:0] LEDR);  // Q
    
    dflop d1(.sw(KEY[1]), .d0(SW[0]), .d1(LEDR[2]), .clk(KEY[0]), .q(LEDR[0]));
    dflop d2(.sw(KEY[1]), .d0(SW[1]), .d1(LEDR[0]), .clk(KEY[0]), .q(LEDR[1]));
    dflop d3(.sw(KEY[1]), .d0(SW[2]), .d1(LEDR[1] ^ LEDR[2]), .clk(KEY[0]), .q(LEDR[2]));
endmodule

module dflop(input sw, input d0, input d1, input clk, output q);
    always @ (posedge clk) begin 
        if(sw)
            q <= d0;
        else 
            q <= d1;
    end
endmodule
