module top_module ();
reg clk;
    reg reset;
    reg t;
    wire q;
    
    tff dut(.clk(clk), .reset(reset), .t(t), .q(q));
    
    initial 
    clk = 0;
    always #10 clk = ~clk;
	
    initial begin 
		reset = 0; #10
        reset = 1; #10;
        reset = 0; #10;
    end
    
    always @(posedge clk) begin 
        if (reset)
            t <= 0;
        else 
            t <= 1;
    end
    
endmodule
