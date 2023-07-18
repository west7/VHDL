
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SomadorSubtrator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           SEL : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           E : out STD_LOGIC;
           C3 : out STD_LOGIC);
end SomadorSubtrator;

architecture Behavioral of SomadorSubtrator is

    component comp1
        Port (A : in std_logic_vector(3 downto 0);
              Z : out std_logic_vector(3 downto 0));
    end component;
    
    component soma1
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               cin : in STD_LOGIC;
               --botton : in std_logic;
               s : out STD_LOGIC;
               cout : out STD_LOGIC);
    end component;
    
    component detectorOverflow
        Port ( A : in std_logic_vector(3 downto 0);
               B : in std_logic_vector(3 downto 0);
               Cin : in std_logic;
               Sum : in std_logic_vector(3 downto 0);
               Overflow : out std_logic);
    end component;
    
    component comp2 
        Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
               sel : in STD_LOGIC;
               s : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal c0, c1, c2, cin, cout : std_logic;
    signal temp : std_logic_vector (3 downto 0);
    signal comp1_A : std_logic_vector (3 downto 0);
    signal comp1_B : std_logic_vector (3 downto 0);
    signal comp2_A : std_logic_vector (3 downto 0);
    signal comp2_B : std_logic_vector (3 downto 0);

begin
    
    handle_2 : comp2 port map(a=> B, sel=> SEL, s=> comp2_B);
    
    sum1 : soma1 port map(a=> A(0), b=> comp2_B(0), cin=>'0', s=> S(0), cout=> c0);
    sum2 : soma1 port map(a=> A(1), b=> comp2_B(1), cin=>c0, s=> S(1), cout=> c1);
    sum3 : soma1 port map(a=> A(2), b=> comp2_B(2), cin=>c1, s=> S(2), cout=> c2);
    sum4 : soma1 port map(a=> A(3), b=> comp2_B(3), cin=>c2, s=> S(3), cout=> c3);

    OverflowCheck : detectorOverflow port map(A => A, B => B, Cin => SEL, Sum => temp, Overflow => E);
                   
end Behavioral;
