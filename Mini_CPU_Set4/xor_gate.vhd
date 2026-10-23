library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_gate is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           y : out STD_LOGIC);
end xor_gate;

architecture Structural of xor_gate is
    component nand_gate
        Port ( a : in STD_LOGIC; b : in STD_LOGIC; y : out STD_LOGIC);
    end component;
    signal n1, n2, n3 : STD_LOGIC;
begin
    U1: nand_gate port map (a => a,  b => b,  y => n1);
    U2: nand_gate port map (a => a,  b => n1, y => n2);
    U3: nand_gate port map (a => n1, b => b,  y => n3);
    U4: nand_gate port map (a => n2, b => n3, y => y);
end Structural;