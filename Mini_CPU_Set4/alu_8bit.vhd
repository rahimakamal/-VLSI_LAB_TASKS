library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_8bit is
    Port ( acc_in  : in  STD_LOGIC_VECTOR (7 downto 0);
           operand : in  STD_LOGIC_VECTOR (7 downto 0);
           r_in    : in  STD_LOGIC_VECTOR (7 downto 0);
           alu_sel : in  STD_LOGIC_VECTOR (2 downto 0);
           result  : out STD_LOGIC_VECTOR (7 downto 0));
end alu_8bit;

architecture Structural of alu_8bit is
    component adder_8bit
        Port ( a : in STD_LOGIC_VECTOR(7 downto 0); b : in STD_LOGIC_VECTOR(7 downto 0); sum : out STD_LOGIC_VECTOR(7 downto 0));
    end component;
    component and_gate
        Port ( a : in STD_LOGIC; b : in STD_LOGIC; y : out STD_LOGIC);
    end component;
	 signal add_res, and_res : STD_LOGIC_VECTOR(7 downto 0);
begin
    ADD_UNIT: adder_8bit port map (a => acc_in, b => operand, sum => add_res);

    GEN_AND: for i in 0 to 7 generate
        AND_INST: and_gate port map (a => acc_in(i), b => operand(i), y => and_res(i));
    end generate;
	 
	 process(alu_sel, operand, add_res, and_res, r_in)
    begin
        case alu_sel is
            when "000"  => result <= operand;  -- LDI
            when "001"  => result <= add_res;  -- ADD
            when "010"  => result <= and_res;  -- AND
            when "011"  => result <= r_in;     -- LDR
            when others => result <= acc_in;
        end case;
    end process;
end Structural;