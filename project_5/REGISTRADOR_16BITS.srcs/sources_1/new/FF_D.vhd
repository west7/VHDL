library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FF_D is
    Port (
        clk_in : in STD_LOGIC;
        D_in : in STD_LOGIC;
        D_out : out STD_LOGIC;
        clear : in STD_LOGIC
    );
end FF_D;

architecture Behavioral of FF_D is

begin

    process (clk_in)
    begin
        if clear = '1' then
            D_out <= '0';
        elsif falling_edge(clk_in) then
            if D_in = '0' then
                D_out <= '0';
            else
                D_out <= '1';
            end if;
        end if;
    end process;

end Behavioral;
