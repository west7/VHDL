
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.ALL;


entity complemento2 is
    Port ( Entrada : in STD_LOGIC_VECTOR (3 downto 0);
           Saida : out STD_LOGIC_VECTOR (3 downto 0));
end complemento2;

architecture Behavioral of complemento2 is

begin

Saida <= (not Entrada) + "0001";

end Behavioral;
