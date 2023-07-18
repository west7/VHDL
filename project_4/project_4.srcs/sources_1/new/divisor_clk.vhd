
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divisor_clk is
    Port ( clk : in STD_LOGIC;
           clk_50hz : out STD_LOGIC);
end divisor_clk;

architecture Behavioral of divisor_clk is

    signal counter : integer range 1 to 100_000 := 1;
    signal clk_div : std_logic;

begin
    
    process(clk)
    begin
        if rising_edge(clk) then
            if counter >= 100_000 then
                counter <= 1;
                clk_div <= not clk_div;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    clk_50hz <= clk_div;

end Behavioral;
