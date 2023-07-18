
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.ALL;

entity mux is
    Port ( clk : in STD_LOGIC;
           M : in std_logic;
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           dp : out STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           Over : out std_logic);
end mux;

architecture Behavioral of mux is

    component divisor_clk
        Port ( clk : in STD_LOGIC;
               clk_50hz : out STD_LOGIC);
    end component;
    
    component driver_BCD7
        Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
               seg : out STD_LOGIC_VECTOR (6 downto 0));
    end component;

    component somador_subtrator 
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               M : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0);
               Over : out STD_LOGIC);
    end component;
    
   component complemento2
        Port ( Entrada : in STD_LOGIC_VECTOR (3 downto 0);
               Saida : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal clk_s : std_logic := '0';
    signal seletor : integer range 1 to 3 := 1;
    signal s_an, bcd_now, temp, temp_s, compA, compB : std_logic_vector (3 downto 0);
    signal A_def, B_def, temp_def : std_logic_vector (3 downto 0);
    
begin

    clock : divisor_clk port map(clk => clk, clk_50hz => clk_s);
    somasub : somador_subtrator port map (A => A, B => B, M => M, S => temp, Over => Over);
     
    comp2A : complemento2 port map(Entrada => A, Saida => compA);       
    comp2B : complemento2 port map(Entrada => B, Saida => compB);
    comp2temp : complemento2 port map(Entrada => temp, Saida => temp_s);
    
    process(A)
    begin
        if A(3) = '0' then
            A_def <= A;
        else
            A_def <= compA;
        end if;
    end process;
    
    process(B)
    begin
        if B(3) = '0' then
           B_def <= B;
        else
            B_def <= compB;
        end if;
    end process;
    
    process(temp)
    begin
        dp <= '1';
        if temp(3) = '0' then
            dp <= '0';
            temp_def <= temp;
         else 
            temp_def <= temp_s;
        end if;
    end process;
    
    --Multiplexação dos Displays
    process (clk_s)
    begin
        if rising_edge(clk_s) then
            case seletor is
                when 1 => s_an <= "0111"; bcd_now <= A_def;
                when 2 => s_an <= "1011"; bcd_now <= B_def;
                when 3 => s_an <= "1110"; bcd_now <= temp_def;
            end case;
            
            if seletor = 3 then
                seletor <= 1;
            else
                seletor <= seletor + 1;
            end if;
        end if;
    end process;
    
    an <= s_an;
    
    driver : driver_BCD7 port map (sw => bcd_now, seg => seg);
    

end Behavioral;
