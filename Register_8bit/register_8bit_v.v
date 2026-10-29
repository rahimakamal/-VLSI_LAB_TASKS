module register_8bit_v(
    input D0, input D1, input D2, input D3,
    input D4, input D5, input D6, input D7,
    input clk,
    output Q0, output Q1, output Q2, output Q3,
    output Q4, output Q5, output Q6, output Q7
);

register_1bit_v REG0 (.D(D0), .clk(clk), .Q(Q0));
    register_1bit_v REG1 (.D(D1), .clk(clk), .Q(Q1));
    register_1bit_v REG2 (.D(D2), .clk(clk), .Q(Q2));
    register_1bit_v REG3 (.D(D3), .clk(clk), .Q(Q3));
    register_1bit_v REG4 (.D(D4), .clk(clk), .Q(Q4));
    register_1bit_v REG5 (.D(D5), .clk(clk), .Q(Q5));
    register_1bit_v REG6 (.D(D6), .clk(clk), .Q(Q6));
    register_1bit_v REG7 (.D(D7), .clk(clk), .Q(Q7));
endmodule
