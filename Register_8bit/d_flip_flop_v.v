module d_flip_flop_v(
    input D,
    input clk,
    output reg Q
);
    always @(posedge clk) begin
        Q <= D;
    end
endmodule
