
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           SEL : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (6 downto 0);
           an : out std_logic_vector (3 downto 0));
end main;

architecture Behavioral of main is

    component multiplexador 
        Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0);
               D1 : in STD_LOGIC_VECTOR (3 downto 0);
               SEL : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0);
               an : out std_logic_vector(3 downto 0));
    end component;
    
    component decodificadorBCD7
        Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
               seg : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    signal temp : std_logic_vector(3 downto 0);
    
begin
    
    multiplexacao : multiplexador port map (D0 => A, D1 => B, SEL => SEL, S => temp, an => an);
    saida : decodificadorBCD7 port map (sw => temp, seg => S);
    
end Behavioral;
