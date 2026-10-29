module register_1bit_v(
    input D,
    input clk,
    output Q
);
    d_flip_flop_v DFF1 (
        .D(D),
        .clk(clk),
        .Q(Q)
    );
endmodule
