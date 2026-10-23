library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           y : out STD_LOGIC);
end and_gate;

architecture Structural of and_gate is
    component nand_gate
        Port ( a : in STD_LOGIC; b : in STD_LOGIC; y : out STD_LOGIC);
    end component;
    component not_gate
        Port ( a : in STD_LOGIC; y : out STD_LOGIC);
    end component;
    signal nand_out : STD_LOGIC;
begin
    U1: nand_gate port map (a => a, b => b, y => nand_out);
    U2: not_gate  port map (a => nand_out, y => y);
end Structural;