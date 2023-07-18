library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CLK_1Hz is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end CLK_1Hz;

architecture Behavioral of CLK_1Hz is

    signal clk_div : STD_LOGIC := '0';
    signal contador : integer range 1 to 100_000_000 := 1; 
    
begin
    process (clk_in)
    begin
        if rising_edge(clk_in) then
            if contador >= 100_000_000 then
                contador <= 1;
                clk_div <= not clk_div;
            else
                contador <= contador + 1;
            end if;
        end if;
    end process;

    clk_out <= clk_div;

end Behavioral;
