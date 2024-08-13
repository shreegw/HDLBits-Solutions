module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);

    reg [2:0] state, next;
    parameter S0=0,S1=1,S2=2,S3=3,S4=4;
	
    always @(*) begin 
        case(state) 
        	S0: next = reset ? S1: S0;
            S1: next = S2;
            S2: next = S3;
            S3: next = S4;
            S4: next = S0;
        endcase
    end
    
    always @(posedge clk) begin 
            state <= next;        
    end
    
    assign shift_ena = ( state == S1 | state == S2 |state == S3 | state == S4 );
    
endmodule
