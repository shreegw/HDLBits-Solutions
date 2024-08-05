module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 

	localparam [2:0] A  = 3'd0,	//water level:below s1    
					 B = 3'd1,	//s1~s2, and previous level is higher
					 C = 3'd2,	//s1~s2, and previous level is lower
					 D = 3'd3,	//s2~s3, and previous level is higher
					 E = 3'd4,	//s2~s3, and previous level is lower
					 F  = 3'd5;	//above s3

	reg [2:0] state, next_state;

	always @(posedge clk) begin
		if(reset) state <= A;
		else state <= next_state;
	end

	always @(*) begin
		case(state)
            A 	:	next_state = (s[1]) ? C : A;
            B 	: 	next_state = (s[2]) ? E : ((s[1]) ? B : A);
            C	:	next_state = (s[2]) ? E : ((s[1]) ? C : A);
            D	:	next_state = (s[3]) ? F  : ((s[2]) ? D : B);
            E	:	next_state = (s[3]) ? F  : ((s[2]) ? E : B);
            F 	:	next_state = (s[3]) ? F  : D;
			default : next_state = 3'bxxx;
		endcase
	end

	always @(*) begin
		case(state)
			A  : {fr3, fr2, fr1, dfr} = 4'b1111;
			B : {fr3, fr2, fr1, dfr} = 4'b0111;
			C : {fr3, fr2, fr1, dfr} = 4'b0110;
			D : {fr3, fr2, fr1, dfr} = 4'b0011;
			E : {fr3, fr2, fr1, dfr} = 4'b0010;
			F  : {fr3, fr2, fr1, dfr} = 4'b0000;
			default : {fr3, fr2, fr1, dfr} = 4'bxxxx;
		endcase
	end

endmodule
