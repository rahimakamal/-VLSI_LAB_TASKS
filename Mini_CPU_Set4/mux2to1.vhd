library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1 is
    Port ( d0  : in  STD_LOGIC;
           d1  : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           y   : out STD_LOGIC);
end mux2to1;

architecture Structural of mux2to1 is
    component and_gate
        Port ( a : in STD_LOGIC; b : in STD_LOGIC; y : out STD_LOGIC);
    end component;
    component or_gate
        Port ( a : in STD_LOGIC; b : in STD_LOGIC; y : out STD_LOGIC);
    end component;
    component not_gate
        Port ( a : in STD_LOGIC; y : out STD_LOGIC);
    end component;
	 signal not_sel, a1, a2 : STD_LOGIC;
begin
    U1: not_gate port map (a => sel, y => not_sel);
    U2: and_gate port map (a => d0,  b => not_sel, y => a1);
    U3: and_gate port map (a => d1,  b => sel,     y => a2);
    U4: or_gate  port map (a => a1,  b => a2,      y => y);
end Structural;