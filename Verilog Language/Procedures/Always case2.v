module top_module (
    input [3:0] in,
    output reg [1:0] pos  );

    always @(*)
        begin 
            case(in)
                0: pos = 3'd0;
                1: pos = 3'd0; 
                2: pos = 3'd1;
                3: pos = 3'd0;
                4: pos = 3'd2;
                5: pos = 3'd0;
                6: pos = 3'd1;
                7: pos = 3'd0;
                8: pos = 3'd3;
                9: pos = 3'd0;
                10: pos = 3'd1;
                11: pos = 3'd0;
                12: pos = 3'd2;
                13: pos = 3'd0;
                14: pos = 3'd1;
                15: pos = 3'd0;                   
            endcase
        end
endmodule
