library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_top_cpu is
end tb_top_cpu;

architecture Behavioral of tb_top_cpu is
    component top_cpu
        Port ( CLK : in STD_LOGIC; RESET : in STD_LOGIC; Q : out STD_LOGIC_VECTOR (7 downto 0); Z : out STD_LOGIC; PC_out : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
	 
	 signal CLK    : std_logic := '0';
    signal RESET  : std_logic := '0';
    signal Q      : std_logic_vector(7 downto 0);
    signal Z      : std_logic;
    signal PC_out : std_logic_vector(3 downto 0);

    constant CLK_PERIOD : time := 10 ns;
	 
	 begin
    uut: top_cpu Port Map (CLK => CLK, RESET => RESET, Q => Q, Z => Z, PC_out => PC_out);

    clk_process : process
    begin
        CLK <= '0';
        wait for CLK_PERIOD/2;
        CLK <= '1';
        wait for CLK_PERIOD/2;
    end process;
	 
	 stim_proc: process
    begin
        RESET <= '1';
        wait for CLK_PERIOD;
        RESET <= '0';
        wait for CLK_PERIOD * 12;
        wait;
    end process;
end Behavioral;
