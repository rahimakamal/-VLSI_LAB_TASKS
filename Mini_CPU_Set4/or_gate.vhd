library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_gate is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           y : out STD_LOGIC);
end or_gate;

architecture Structural of or_gate is
    component nand_gate
        Port ( a : in STD_LOGIC; b : in STD_LOGIC; y : out STD_LOGIC);
    end component;
    component not_gate
        Port ( a : in STD_LOGIC; y : out STD_LOGIC);
    end component;
    signal not_a, not_b : STD_LOGIC;
begin
    U1: not_gate  port map (a => a, y => not_a);
    U2: not_gate  port map (a => b, y => not_b);
    U3: nand_gate port map (a => not_a, b => not_b, y => y);
end Structural;