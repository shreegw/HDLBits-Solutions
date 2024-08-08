module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    parameter B1 = 2'b00,B2 = 2'b01,B3 = 2'b10,D  = 2'b11;

    reg [1:0] state, next_state;
    reg [23:0] data;

    // State transition logic (combinational)
    always @(*) begin
    	case(state)
    		B1 : next_state = (in[3]) ? B2 : B1;
    		B2 : next_state = B3;
    		B3 : next_state = D;
    		D  : next_state = (in[3]) ? B2 : B1;
    	endcase
    end

    // State flip-flops (sequential)
    always @(posedge clk) begin
    	if(reset) state <= B1;
    	else state <= next_state;
    end
 
    // Output logic
    always@(posedge clk) begin 
        if(reset) data <= 0;
        else data <= {data[15:8], data[7:0],in};
    end 
    
    assign done = (state == D);
    assign out_bytes = done ? data : 0;

endmodule
