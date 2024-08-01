module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    
    wire [7:0] qout;
    
    dflop d1(clk, S, enable, qout[0]); 
    dflop d2(clk, qout[0], enable, qout[1]);
    dflop d3(clk, qout[1], enable, qout[2]);
    dflop d4(clk, qout[2], enable, qout[3]);
    dflop d5(clk, qout[3], enable, qout[4]);
    dflop d6(clk, qout[4], enable, qout[5]);
    dflop d7(clk, qout[5], enable, qout[6]);
    dflop d8(clk, qout[6], enable, qout[7]);    
    
    always @(*) begin 
        case({A,B,C})
            0: Z <= qout[0];
            1: Z <= qout[1];
            2: Z <= qout[2];
            3: Z <= qout[3];
            4: Z <= qout[4];
            5: Z <= qout[5];
            6: Z <= qout[6];
            7: Z <= qout[7];
        endcase
    end
      
endmodule


module dflop(
	input clk,
    input d,
    input enable,
    output q
		);
    
    always @(posedge clk) begin
        if(enable)
            q <= d;
        else 
            q <= q;
    end
endmodule
