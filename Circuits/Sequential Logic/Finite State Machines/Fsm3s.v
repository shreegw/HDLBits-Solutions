module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    parameter A=1, B=2, C=3, D=4;
    reg [2:0] state, next_state;
    // State transition logic
    always@ (*) begin 
        case(state) 
        	A: next_state = in ? B : A;
            B: next_state = in ? B : C;
            C: next_state = in ? D : A;
            D: next_state = in ? B : C;
        endcase
    end
	
    // State flip-flops with asynchronous reset
    always @ (posedge clk) begin 
        if(reset) state <= A;
        else state <= next_state;
    end
    
   // Output logic
    assign out = (state == D);

endmodule
