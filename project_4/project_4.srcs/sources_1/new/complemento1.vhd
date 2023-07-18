
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity complemento1 is
    Port ( Entrada : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           Saida : out STD_LOGIC_VECTOR (3 downto 0));
end complemento1;

architecture Behavioral of complemento1 is

begin

    with Sel select
    Saida <= (not Entrada) when '1',
              Entrada when others;

end Behavioral;
