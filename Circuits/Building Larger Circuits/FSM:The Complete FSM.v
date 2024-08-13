module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );

    reg [3:0] state, next;
    parameter INIT=0, S1=1, S11=2, S110=3, B0=4, B1=5, B2=6, B3=7, COUNT=8, DONE=9;
    
    always @(*) begin 
        case(state)
        	INIT: next = data ? S1:INIT ;
            S1: next = data ? S11:INIT ;
            S11: next = data ? S11:S110 ;
            S110: next = data ? B0:INIT ;
            B0: next = B1 ;
            B1: next = B2 ;
            B2: next = B3 ;
            B3: next = COUNT ;
            COUNT: next = done_counting ? DONE : COUNT ;
            DONE: next = ack ? INIT : DONE ;          
        endcase
    end
    
    always @(posedge clk) begin 
        if(reset)
        	state <= INIT;
        else 
            state <= next;
    end
    
    assign shift_ena = (state == B0|state == B1|state == B2|state == B3);
    assign done = (state==DONE);
    assign counting = (state==COUNT);
    
    
endmodule
