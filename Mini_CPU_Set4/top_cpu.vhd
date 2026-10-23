library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_cpu is
    Port ( CLK    : in  STD_LOGIC;
           RESET  : in  STD_LOGIC;
           Q      : out STD_LOGIC_VECTOR (7 downto 0);
           Z      : out STD_LOGIC;
           PC_out : out STD_LOGIC_VECTOR (3 downto 0));
end top_cpu;

architecture Structural of top_cpu is

    component pc_4bit
        Port ( clk : in STD_LOGIC; reset : in STD_LOGIC; pc_out : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component program_rom
        Port ( addr : in STD_LOGIC_VECTOR (3 downto 0); data : out STD_LOGIC_VECTOR (11 downto 0));
    end component;
	 
	 component control_unit
        Port ( opcode : in STD_LOGIC_VECTOR (3 downto 0); acc_write : out STD_LOGIC; r_write : out STD_LOGIC; z_update : out STD_LOGIC; alu_sel : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

    component alu_8bit
        Port ( acc_in : in STD_LOGIC_VECTOR (7 downto 0); operand : in STD_LOGIC_VECTOR (7 downto 0); r_in : in STD_LOGIC_VECTOR (7 downto 0); alu_sel : in STD_LOGIC_VECTOR (2 downto 0); result : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
	 
	 component registers
        Port ( clk : in STD_LOGIC; reset : in STD_LOGIC; acc_write : in STD_LOGIC; r_write : in STD_LOGIC; z_update : in STD_LOGIC; data_in : in STD_LOGIC_VECTOR (7 downto 0); acc_out : out STD_LOGIC_VECTOR (7 downto 0); r_out : out STD_LOGIC_VECTOR (7 downto 0); z_flag : out STD_LOGIC);
    end component;
	 
	 signal pc_addr    : STD_LOGIC_VECTOR(3 downto 0);
    signal instruction: STD_LOGIC_VECTOR(11 downto 0);
    signal acc_write  : STD_LOGIC;
    signal r_write    : STD_LOGIC;
    signal z_update   : STD_LOGIC;
    signal alu_sel    : STD_LOGIC_VECTOR(2 downto 0);
    signal alu_result : STD_LOGIC_VECTOR(7 downto 0);
    signal acc_data   : STD_LOGIC_VECTOR(7 downto 0);
    signal r_data     : STD_LOGIC_VECTOR(7 downto 0);
	 
	 begin

    U_PC    : pc_4bit     port map (clk => CLK, reset => RESET, pc_out => pc_addr);
    U_ROM   : program_rom port map (addr => pc_addr, data => instruction);
    U_CTRL  : control_unit port map (opcode => instruction(11 downto 8), acc_write => acc_write, r_write => r_write, z_update => z_update, alu_sel => alu_sel);
	 U_ALU   : alu_8bit   port map (acc_in => acc_data, operand => instruction(7 downto 0), r_in => r_data, alu_sel => alu_sel, result => alu_result);
    U_REGS  : registers  port map (clk => CLK, reset => RESET, acc_write => acc_write, r_write => r_write, z_update => z_update, data_in => alu_result, acc_out => acc_data, r_out => r_data, z_flag => Z);

    Q      <= acc_data;
    PC_out <= pc_addr;
	 
	 end Structural;