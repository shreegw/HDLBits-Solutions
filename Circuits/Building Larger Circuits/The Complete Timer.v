module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
    
    parameter INIT=0, S1=1, S11=2, S110=3, SHIFT1=4, SHIFT2=5, SHIFT3=6, SHIFT4=7, DONE=8, COUNT=9;
    reg [3:0] state, next;
    reg [9:0] count1000;
    
    always @(*) begin 
        case(state) 
        	INIT: next = data ? S1 : INIT;
            S1: next = data? S11: INIT;
            S11: next = data? S11: S110;
            S110: next = data ? SHIFT1: INIT;
            SHIFT1: next = SHIFT2;
            SHIFT2: next = SHIFT3;
            SHIFT3: next = SHIFT4;
            SHIFT4: next = COUNT;
            COUNT: next = (count == 0 & count1000 == 999) ? DONE : COUNT;
            DONE: next = ack ? INIT: DONE ;
        endcase
    end
    
    always @(posedge clk)begin 
        if(reset)
            state <= INIT;
        else
            state <= next;
    end
    
	always @(posedge clk) begin
		case (state) 
			SHIFT1: count[3] <= data;
			SHIFT2: count[2] <= data;
			SHIFT3: count[1] <= data;
			SHIFT4: count[0] <= data;
			COUNT : begin
				if (count >= 0) begin
					if (count1000 < 999) 
						count1000 <= count1000 + 1'b1;
					else begin
						count <= count - 1'b1;
						count1000 <= 0;
					end
				end
			end
			default : count1000 <= 0;
		endcase
	end
    
    assign counting = (state == COUNT);
    assign done = (state == DONE);
    
	
endmodule
