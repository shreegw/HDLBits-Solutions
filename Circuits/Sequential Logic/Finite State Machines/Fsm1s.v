// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
	parameter A=0, B=1;
    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) present_state = B;// Fill in reset logic
        else present_state = next_state;
    end
    
    always @(*) begin
            case (present_state)
                B: next_state = in ? B : A;
                A: next_state = in ? A : B;
                default : next_state = B;// Fill in state transition logic
            endcase
    end   
    always @(*) begin
            case (present_state)
                A: out = 1'b0;
                B: out = 1'b1;// Fill in output logic
                default: out = 1'b0;
            endcase
        end
    
endmodule
