
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock is
    Port ( clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           dp : out STD_LOGIC);
end clock;

architecture Behavioral of clock is

    component decodificadorBCD7
        Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
               seg : out STD_LOGIC_VECTOR (6 downto 0));
    end component;

    signal clk_dividido, tick : std_logic := '0';
    signal contador : integer range 1 to 3 := 1;
    signal counter : integer range 1 to 100_000 := 1;
    signal temporizer : integer range 1 to 200_000_000 := 1;
    signal seletor : integer range 1 to 4 := 1;
    signal s_an, bcd_now : std_logic_vector (3 downto 0);
    signal bcd_u : std_logic_vector(3 downto 0);
    signal bcd_d : std_logic_vector(3 downto 0);
    signal bcd_c : std_logic_vector(3 downto 0);
    signal bcd_m : std_logic_vector(3 downto 0);

begin

    --Divisor do clock 50Hz
    divisor : process(clk)
    begin
        if rising_edge (clk) then
            if counter = 100_000 then
                counter <= 1;
                clk_dividido <= not clk_dividido;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    --Divisor do clock 0,5Hz
    temporizador : process(clk)
    begin
        if rising_edge(clk) then
            if temporizer = 200_000_000 then
                temporizer <= 1;
                tick <= not tick;
            else 
                temporizer <= temporizer + 1;
            end if;
        end if;
    end process;
    
    contadorr : process(tick)
    begin
        if rising_edge (tick) then
            if contador = 3 then
                contador <= 1;
             else
                contador <= contador + 1;
            end if;
        end if;
    end process;
    
    sel_valores : process(clk_dividido)
    begin
        if rising_edge(clk_dividido) then
            if contador = 1 then
                case seletor is
                    when 1 => s_an <= "1110"; bcd_now <= "1001";       
                    when 2 => s_an <= "1101"; bcd_now <= "0000";
                    when 3 => s_an <= "1011"; bcd_now <= "1111";
                    when 4 => s_an <= "0111"; bcd_now <= "1111";     
                end case;
            elsif contador = 2 then
                case seletor is
                    when 1 => s_an <= "1110"; bcd_now <= "0101";       
                    when 2 => s_an <= "1101"; bcd_now <= "0000";
                    when 3 => s_an <= "1011"; bcd_now <= "1000";
                    when 4 => s_an <= "0111"; bcd_now <= "0001";     
                end case; 
            else
                s_an <= "1111"; 
            end if;
            if seletor = 4 then
                seletor <= 1;
            else
                seletor <= seletor + 1;
            end if;
        end if;
    end process;
    
    an <= s_an;
    dp <= '1';
    driver : decodificadorBCD7 port map(sw => bcd_now, seg => seg);

end Behavioral;
