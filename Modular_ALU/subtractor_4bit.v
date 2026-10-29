module subtractor_4bit (
    input [3:0] A,
    input [3:0] B,
    output [3:0] Diff,
    output Bout
);
    wire [3:0] B_inv;
    wire carry_out;
	 
	 assign B_inv = ~B;

    adder_4bit add_sub_inst (
        .A(A),
        .B(B_inv),
        .Cin(1'b1),
        .Sum(Diff),
        .Cout(carry_out)
    );

    assign Bout = ~carry_out;
endmodule
