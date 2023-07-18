
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp1 is
    Port (A : in std_logic_vector(3 downto 0);
          Z : out std_logic_vector(3 downto 0));
end comp1;

architecture Behavioral of comp1 is
begin
    process(A)
    begin
        if A(3) = '1' then
            Z <= not A;
        else
            Z <= A;
        end if;
    end process;
end Behavioral;
