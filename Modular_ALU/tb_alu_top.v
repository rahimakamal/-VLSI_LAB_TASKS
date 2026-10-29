module tb_alu_top;
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] ALU_Sel;

    wire [3:0] ALU_Out;
    wire CarryOut;

    alu_top uut (
        .A(A), 
        .B(B), 
        .ALU_Sel(ALU_Sel), 
        .ALU_Out(ALU_Out), 
        .CarryOut(CarryOut)
    );
	 initial begin
        A = 4'b0000; B = 4'b0000; ALU_Sel = 3'b000; #20;
        A = 4'b1000; B = 4'b0101; ALU_Sel = 3'b000; #20; // ADD (8+5)
        A = 4'b1100; B = 4'b0100; ALU_Sel = 3'b001; #20; // SUB (12-4)
        A = 4'b1010; B = 4'b1100; ALU_Sel = 3'b010; #20; // AND
        A = 4'b1010; B = 4'b0101; ALU_Sel = 3'b011; #20; // OR
        A = 4'b1010; B = 4'b1100; ALU_Sel = 3'b100; #20; // XOR
        A = 4'b1010; B = 4'b0000; ALU_Sel = 3'b101; #20; // NOT
        $finish;
    end
endmodule

