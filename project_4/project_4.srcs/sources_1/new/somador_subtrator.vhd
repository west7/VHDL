

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador_subtrator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Over : out STD_LOGIC);
end somador_subtrator;

architecture Behavioral of somador_subtrator is

    component somador1bit
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               cin : in STD_LOGIC;
               s : out STD_LOGIC;
               cout : out STD_LOGIC);
    end component;
    
    component detector_overflow 
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Cin : in STD_LOGIC;
               Overflow : out STD_LOGIC);
    end component;
    
    component complemento1
        Port ( Entrada : in STD_LOGIC_VECTOR (3 downto 0);
               Sel : in STD_LOGIC;
               Saida : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal s_compB : std_logic_vector (3 downto 0);
    signal c0, c1, c2, s_cin, s_cout, s_over : std_logic;

begin

    comp1 : complemento1 port map (Entrada => B, Sel => M, Saida => s_compB);
    
    sum1 : somador1bit port map (a=> A(0), b=> s_compB(0), cin => M, s => S(0), cout => c0); 
    sum2 : somador1bit port map (a=> A(1), b=> s_compB(1), cin => c0, s => S(1), cout => c1); 
    sum3 : somador1bit port map (a=> A(2), b=> s_compB(2), cin => c1, s => S(2), cout => c2); 
    sum4 : somador1bit port map (a=> A(3), b=> s_compB(3), cin => c2, s => S(3), cout => s_cout);
    
    Overflow : detector_overflow port map (A => A, B => s_compB, Cin => c2, Overflow => Over); 


end Behavioral;
