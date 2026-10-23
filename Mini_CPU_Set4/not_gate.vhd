library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate is
    Port ( a : in  STD_LOGIC;
           y : out STD_LOGIC);
end not_gate;

architecture Structural of not_gate is
    component nand_gate
        Port ( a : in STD_LOGIC; b : in STD_LOGIC; y : out STD_LOGIC);
    end component;
begin
    U1: nand_gate port map (a => a, b => a, y => y);
end Structural;