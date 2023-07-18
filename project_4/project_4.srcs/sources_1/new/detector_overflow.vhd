
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detector_overflow is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Overflow : out STD_LOGIC);
end detector_overflow;

architecture Behavioral of detector_overflow is

begin

    Overflow <= ((not A(3)) and (not B(3)) and Cin) or (A(3) and B(3) and (not Cin));

end Behavioral;
