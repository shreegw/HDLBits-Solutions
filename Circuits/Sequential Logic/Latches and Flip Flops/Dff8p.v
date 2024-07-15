module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);

    integer i;
    always @ (negedge clk) begin 
        if(reset==1)
            q <= 8'h34;
        else begin
        for (i=0; i<8; i=i+1) 
            q[i]<=d[i];
        end
    end
endmodule
