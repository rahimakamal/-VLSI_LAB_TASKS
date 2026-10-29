module alu_top (
    input [3:0] A,
    input [3:0] B,
    input [2:0] ALU_Sel,
    output [3:0] ALU_Out,
    output CarryOut
);
    wire [3:0] add_res, sub_res, and_res, or_res, xor_res, not_res;
    wire add_cout, sub_bout;
	 
	 adder_4bit add_inst (.A(A), .B(B), .Cin(1'b0), .Sum(add_res), .Cout(add_cout));
    subtractor_4bit sub_inst (.A(A), .B(B), .Diff(sub_res), .Bout(sub_bout));
    and_4bit and_inst (.A(A), .B(B), .Out(and_res));
    or_4bit or_inst (.A(A), .B(B), .Out(or_res));
    xor_4bit xor_inst (.A(A), .B(B), .Out(xor_res));
    not_4bit not_inst (.A(A), .Out(not_res));
	 
	 mux8to1_4bit mux_inst (
        .in0(add_res),
        .in1(sub_res),
        .in2(and_res),
        .in3(or_res),
        .in4(xor_res),
        .in5(not_res),
        .in6(4'b0000),
        .in7(4'b0000),
        .sel(ALU_Sel),
        .out(ALU_Out)
    );
	 
	 assign CarryOut = (ALU_Sel == 3'b000) ? add_cout :
                      (ALU_Sel == 3'b001) ? sub_bout : 1'b0;
endmodule
