
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexador is
    Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           SEL : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           an : out std_logic_vector(3 downto 0));
end multiplexador;

architecture Behavioral of multiplexador is

begin
    process(D0, D1, SEL)
    begin
        if SEL = '0' then
            S <= D0;
            an <= "1110";
        else 
            S <= D1;
            an <= "1101";
        end if;
    end process;
end Behavioral;
