module and_4bit (
    input [3:0] A,
    input [3:0] B,
    output [3:0] Out
);
    assign Out = A & B;
endmodule
