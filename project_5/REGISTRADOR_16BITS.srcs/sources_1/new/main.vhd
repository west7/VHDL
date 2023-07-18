library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port (
        clk : in STD_LOGIC;
        Entrada : in STD_LOGIC;
        Saida : out STD_LOGIC_VECTOR (15 DOWNTO 0);
        Clear : in STD_LOGIC
    );
end main;

architecture Behavioral of main is

    component FF_D is
        Port (
            clk_in : in STD_LOGIC;
            D_in : in STD_LOGIC;
            D_out : out STD_LOGIC;
            clear : in STD_LOGIC
        );
    end component;

    component CLK_1Hz is
        Port (
            clk_in : in STD_LOGIC;
            clk_out : out STD_LOGIC
        );
    end component;

    signal clk_hz : STD_LOGIC := '0';
    signal FF_D_out : STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000000000000000";

begin

    clock : CLK_1Hz port map (clk_in => clk, clk_out => clk_hz);

    FF_1 : FF_D port map (clk_in => clk_hz, D_in => Entrada, D_out => FF_D_out(0), clear => Clear);
    FF_2 : FF_D port map (clk_in => clk_hz, D_in => FF_D_out(0), D_out => FF_D_out(1), clear => Clear);
    FF_3 : FF_D port map (clk_in => clk_hz, D_in => FF_D_out(1), D_out => FF_D_out(2), clear => Clear);
    FF_4 : FF_D port map (clk_in => clk_hz, D_in => FF_D_out(2), D_out => FF_D_out(3), clear => Clear);

    FF_5 : FF_D port map (clk_in => clk_hz, D_in => FF_D_out(3), D_out => FF_D_out(4), clear => Clear);
    FF_6 : FF_D port map (clk_in => clk_hz, D_in => FF_D_out(4), D_out => FF_D_out(5), clear => Clear);
    FF_7 : FF_D port map (clk_in => clk_hz, D_in => FF_D_out(5), D_out => FF_D_out(6), clear => Clear);
    FF_8 : FF_D port map (clk_in => clk_hz, D_in => FF_D_out(6), D_out => FF_D_out(7), clear => Clear);

    FF_9 : FF_D port map (clk_in => clk_hz, D_in => FF_D_out(7), D_out => FF_D_out(8), clear => Clear);
    FF_10 : FF_D port map (clk_in => clk_hz, D_in => FF_D_out(8), D_out => FF_D_out(9), clear => Clear);
    FF_11 : FF_D port map (clk_in => clk_hz, D_in => FF_D_out(9), D_out => FF_D_out(10), clear => Clear);
    FF_12 : FF_D port map (clk_in => clk_hz, D_in => FF_D_out(10), D_out => FF_D_out(11), clear => Clear);

    FF_13 : FF_D port map (clk_in => clk_hz, D_in => FF_D_out(11), D_out => FF_D_out(12), clear => Clear);
    FF_14 : FF_D port map (clk_in => clk_hz, D_in => FF_D_out(12), D_out => FF_D_out(13), clear => Clear);
    FF_15 : FF_D port map (clk_in => clk_hz, D_in => FF_D_out(13), D_out => FF_D_out(14), clear => Clear);
    FF_16 : FF_D port map (clk_in => clk_hz, D_in => FF_D_out(14), D_out => FF_D_out(15), clear => Clear);

    Saida <= FF_D_out;

end Behavioral;
