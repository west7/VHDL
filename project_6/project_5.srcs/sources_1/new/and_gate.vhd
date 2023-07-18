

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity and_gate is
  Port (A : in std_logic;
        B : in std_logic;
        S : out std_logic);
end and_gate;

architecture Behavioral of and_gate is
    
    signal sin : std_logic := '1'; 
    
begin

    process(A)
    begin
        if sin = '1' then
            S <= A and B;
        end if;
    end process;
end Behavioral;
