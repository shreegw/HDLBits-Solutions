module top_module(
    input a,
    input b,
    input c,
    output out  ); 

    assign out = a | b | c; //If a truth table is created using the outputs, the output is 1 when the inputs are non zero. Hence it can be reduced to A or B or C.
endmodule
