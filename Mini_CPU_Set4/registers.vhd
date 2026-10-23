library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registers is
    Port ( clk      : in  STD_LOGIC;
           reset    : in  STD_LOGIC;
           acc_write: in  STD_LOGIC;
           r_write  : in  STD_LOGIC;
           z_update : in  STD_LOGIC;
           data_in  : in  STD_LOGIC_VECTOR (7 downto 0);
           acc_out  : out STD_LOGIC_VECTOR (7 downto 0);
           r_out    : out STD_LOGIC_VECTOR (7 downto 0);
           z_flag   : out STD_LOGIC);
end registers;

architecture Behavioral of registers is
    signal ACC_reg : STD_LOGIC_VECTOR(7 downto 0) := x"00";
    signal R_reg   : STD_LOGIC_VECTOR(7 downto 0) := x"00";
    signal Z_reg   : STD_LOGIC := '1';
begin
    process(clk)
    begin
	 if rising_edge(clk) then
            if reset = '1' then
                ACC_reg <= x"00";
                R_reg   <= x"00";
                Z_reg   <= '1';
            else
				if acc_write = '1' then
                    ACC_reg <= data_in;
                    if z_update = '1' then
                        if data_in = x"00" then
                            Z_reg <= '1';
                        else
                            Z_reg <= '0';
                        end if;
                    end if;
                end if;
					 
					 if r_write = '1' then
                    R_reg <= ACC_reg;
                end if;
            end if;
        end if;
    end process;

    acc_out <= ACC_reg;
    r_out   <= R_reg;
    z_flag  <= Z_reg;
end Behavioral;