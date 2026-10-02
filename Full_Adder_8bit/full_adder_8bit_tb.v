`timescale 1ns / 1ps

module full_adder_8bit_tb;
    // Inputs
    reg A0, A1, A2, A3, A4, A5, A6, A7;
    reg B0, B1, B2, B3, B4, B5, B6, B7;
    reg Cin;
	 
	 // Outputs
    wire S0, S1, S2, S3, S4, S5, S6, S7;
    wire Cout;
	 
	 // Instantiate the Unit Under Test (UUT)
    full_adder_8bit uut (
        .A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .A5(A5), .A6(A6), .A7(A7),
        .B0(B0), .B1(B1), .B2(B2), .B3(B3), .B4(B4), .B5(B5), .B6(B6), .B7(B7),
        .Cin(Cin),
        .S0(S0), .S1(S1), .S2(S2), .S3(S3), .S4(S4), .S5(S5), .S6(S6), .S7(S7),
        .Cout(Cout)
    );
	 initial begin
        // Test 1: All zeros -> 0 + 0 + 0 = 0
        {A7, A6, A5, A4, A3, A2, A1, A0} = 8'b00000000;
        {B7, B6, B5, B4, B3, B2, B1, B0} = 8'b00000000;
        Cin = 0; #100;
		  
		  // Test 2: Small values -> 1 + 1 + 0 = 2
        {A7, A6, A5, A4, A3, A2, A1, A0} = 8'b00000001;
        {B7, B6, B5, B4, B3, B2, B1, B0} = 8'b00000001;
        Cin = 0; #100;

        // Test 3: Maximum addition without carry-in -> 255 + 255 + 0 = 510 (Sum=254, Cout=1)
        {A7, A6, A5, A4, A3, A2, A1, A0} = 8'b11111111;
        {B7, B6, B5, B4, B3, B2, B1, B0} = 8'b11111111;
        Cin = 0; #100;
		  
		  // Test 4: Maximum addition with carry-in -> 255 + 255 + 1 = 511 (Sum=255, Cout=1)
        {A7, A6, A5, A4, A3, A2, A1, A0} = 8'b11111111;
        {B7, B6, B5, B4, B3, B2, B1, B0} = 8'b11111111;
        Cin = 1; #100;

        // Test 5: Alternating bits -> 170 + 85 + 0 = 255
        {A7, A6, A5, A4, A3, A2, A1, A0} = 8'b10101010;
        {B7, B6, B5, B4, B3, B2, B1, B0} = 8'b01010101;
        Cin = 0; #100;
		  
		  // Test 6: Carry ripple propagation -> 255 + 1 + 0 = 256 (Sum=0, Cout=1)
        {A7, A6, A5, A4, A3, A2, A1, A0} = 8'b11111111;
        {B7, B6, B5, B4, B3, B2, B1, B0} = 8'b00000001;
        Cin = 0; #100;

        // Test 7: Carry-in ripple -> 255 + 0 + 1 = 256 (Sum=0, Cout=1)
        {A7, A6, A5, A4, A3, A2, A1, A0} = 8'b11111111;
        {B7, B6, B5, B4, B3, B2, B1, B0} = 8'b00000000;
        Cin = 1; #100;
		  
		  // Test 8: Single bit set -> 16 + 32 + 0 = 48
        {A7, A6, A5, A4, A3, A2, A1, A0} = 8'b00010000;
        {B7, B6, B5, B4, B3, B2, B1, B0} = 8'b00100000;
        Cin = 0; #100;

        // Test 9: Mid-range values -> 128 + 127 + 0 = 255
        {A7, A6, A5, A4, A3, A2, A1, A0} = 8'b10000000;
        {B7, B6, B5, B4, B3, B2, B1, B0} = 8'b01111111;
        Cin = 0; #100;
		  
		  // Test 10: Mid-range overflow -> 128 + 128 + 0 = 256 (Sum=0, Cout=1)
        {A7, A6, A5, A4, A3, A2, A1, A0} = 8'b10000000;
        {B7, B6, B5, B4, B3, B2, B1, B0} = 8'b10000000;
        Cin = 0; #100;

        // Test 11: Random test pattern 1 -> 15 + 240 + 0 = 255
        {A7, A6, A5, A4, A3, A2, A1, A0} = 8'b00001111;
        {B7, B6, B5, B4, B3, B2, B1, B0} = 8'b11110000;
        Cin = 0; #100;
		  
		  // Test 12: Random test pattern 2 -> 51 + 204 + 1 = 256 (Sum=0, Cout=1)
        {A7, A6, A5, A4, A3, A2, A1, A0} = 8'b00110011;
        {B7, B6, B5, B4, B3, B2, B1, B0} = 8'b11001100;
        Cin = 1; #100;

        // Test 13: Random test pattern 3 -> 200 + 100 + 0 = 300 (Sum=44, Cout=1)
        {A7, A6, A5, A4, A3, A2, A1, A0} = 8'b11001000;
        {B7, B6, B5, B4, B3, B2, B1, B0} = 8'b01100100;
        Cin = 0; #100;
		  
		  // Test 14: Lower nibble carry -> 15 + 1 + 0 = 16
        {A7, A6, A5, A4, A3, A2, A1, A0} = 8'b00001111;
        {B7, B6, B5, B4, B3, B2, B1, B0} = 8'b00000001;
        Cin = 0; #100;

        // Test 15: All ones A with zero B and Cin -> 255 + 0 + 0 = 255
        {A7, A6, A5, A4, A3, A2, A1, A0} = 8'b11111111;
        {B7, B6, B5, B4, B3, B2, B1, B0} = 8'b00000000;
        Cin = 0; #100;
		  
		  $finish;

	end
      
endmodule

