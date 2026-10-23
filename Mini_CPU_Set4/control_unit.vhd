library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port ( opcode    : in  STD_LOGIC_VECTOR (3 downto 0);
           acc_write : out STD_LOGIC;
           r_write   : out STD_LOGIC;
           z_update  : out STD_LOGIC;
           alu_sel   : out STD_LOGIC_VECTOR (2 downto 0));
end control_unit;

architecture Behavioral of control_unit is
begin
    process(opcode)
    begin
        acc_write <= '0';
        r_write   <= '0';
        z_update  <= '0';
        alu_sel   <= "100";
		  
		  case opcode is
            when "0001" => -- LDI
                acc_write <= '1';
                z_update  <= '1';
                alu_sel   <= "000";
            when "0010" => -- ADD
                acc_write <= '1';
                z_update  <= '1';
                alu_sel   <= "001";
            when "0100" => -- AND
                acc_write <= '1';
                z_update  <= '1';
                alu_sel   <= "010";
					 when "1010" => -- STA
                r_write   <= '1';
            when "1011" => -- LDR
                acc_write <= '1';
                z_update  <= '1';
                alu_sel   <= "011";
            when others =>
                null;
        end case;
    end process;
end Behavioral;