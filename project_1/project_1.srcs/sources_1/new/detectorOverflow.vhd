
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detectorOverflow is
    Port ( A : in std_logic_vector(3 downto 0);
           B : in std_logic_vector(3 downto 0);
           Cin : in std_logic;
           Sum : in std_logic_vector(3 downto 0);
           Overflow : out std_logic);
end detectorOverflow;

architecture Behavioral of detectorOverflow is
begin
    process(A)
    begin
        if (A(3) = '0' and B(3) = '0' and Sum(3) = '1')or
           (A(3) = '1' and B(3) = '1' and Sum(3) = '0') then
           Overflow <= '1';
        else
            Overflow <= '0';
        end if;
    end process;
end Behavioral;
