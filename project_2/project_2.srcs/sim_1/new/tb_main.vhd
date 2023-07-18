----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.06.2023 09:51:54
-- Design Name: 
-- Module Name: tb_main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_main is
--  Port ( );
end tb_main;

architecture Behavioral of tb_main is

    component main
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               SEL : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    signal testeA, testeB : std_logic_vector(3 downto 0);
    signal testeSEL : std_logic;
    signal testeS : std_logic_vector(6 downto 0);

begin

    UUT : main port map(A => testeA, B => testeB, SEL => testeSEL, S => testeS);

process
begin

    testeA <= "0000";
    testeB <= "0000";
    testeSEL <= '0';
    wait for 100ns;
    assert (testeS = "1000000") report "testeS diferente de 0 para A = 0000" severity ERROR;

    
    testeA <= "0000";
    testeB <= "0001";
    testeSEL <= '0';
    wait for 100ns;
    assert (testeS = "1000000") report "testeS diferente de 0 para A = 0000" severity ERROR;
    
    testeA <= "0001";
    testeB <= "0000";
    testeSEL <= '0';
    wait for 100ns;
    assert (testeS = "1111001") report "testeS diferente de 1 para A = 0001" severity ERROR;

    
    testeA <= "0001";
    testeB <= "0001";
    testeSEL <= '0';
    wait for 100ns;
    assert (testeS = "1111001") report "testeS diferente de 1 para A = 0001 e B = 0001" severity ERROR;
    
    testeA <= "0010";
    testeB <= "0000";
    testeSEL <= '0';
    wait for 100ns;
    assert (testeS = "0100100") report "testeS diferente de 2 para A = 0010" severity ERROR;
    
    testeA <= "0011";
    testeB <= "0000";
    testeSEL <= '0';
    wait for 100ns;
    assert (testeS = "0110000") report "testeS diferente de 3 para A = 0011" severity ERROR;

    
    testeA <= "0100";
    testeB <= "0000";
    testeSEL <= '0';
    wait for 100ns;
    assert (testeS = "0011001") report "testeS diferente de 4 para A = 0100" severity ERROR;

    
    testeA <= "0101";
    testeB <= "0000";
    testeSEL <= '0';
    wait for 100ns;
    assert (testeS = "0010010") report "testeS diferente de 5 para A = 0101" severity ERROR;

    
    testeA <= "0110";
    testeB <= "0000";
    testeSEL <= '0';
    wait for 100ns;
    assert (testeS = "0000010") report "testeS diferente de 6 para A = 0110" severity ERROR;

    
    testeA <= "0111";
    testeB <= "0000";
    testeSEL <= '0';
    wait for 100ns;
    assert (testeS = "1111000") report "testeS diferente de 7 para A = 0111" severity ERROR;

    
    testeA <= "1000";
    testeB <= "0000";
    testeSEL <= '0';
    wait for 100ns;
    assert (testeS = "0000000") report "testeS diferente de 8 para A = 1000" severity ERROR;

    
    testeA <= "1001";
    testeB <= "0000";
    testeSEL <= '0';
    wait for 100ns;
    assert (testeS = "0010000") report "testeS diferente de 9 para A = 1001" severity ERROR;

    
    testeA <= "1111";
    testeB <= "0000";
    testeSEL <= '0';
    wait for 100ns;
    assert (testeS = "1111111") report "testeS diferente de NULO para A = 1111" severity ERROR;

    
    testeA <= "0000";
    testeB <= "0000";
    testeSEL <= '1';
    wait for 100ns;
    assert (testeS = "1000000") report "testeS diferente de 0 para B = 0000" severity ERROR;

    
    testeA <= "0001";
    testeB <= "0000";
    testeSEL <= '1';
    wait for 100ns;
    assert (testeS = "1000000") report "testeS diferente de 0 para B = 0000" severity ERROR;


    testeA <= "0000";
    testeB <= "0011";
    testeSEL <= '1';
    wait for 100ns;
    assert (testeS = "0110000") report "testeS diferente de 3 para B = 0011" severity ERROR;

    
    testeA <= "0000";
    testeB <= "1000";
    testeSEL <= '1';
    wait for 100ns;
    assert (testeS = "0000000") report "testeS diferente de 8 para B = 1000" severity ERROR;

    
    testeA <= "0011";
    testeB <= "1001";
    testeSEL <= '1';
    wait for 100ns;
    assert (testeS = "0010000") report "testeS diferente de 9 para B = 1001" severity ERROR;

    testeA <= "0011";
    testeB <= "1111";
    testeSEL <= '1';
    wait for 100ns;
    assert (testeS = "1111111") report "testeS diferente de NULO para B = 1111" severity ERROR;

    
end process;

end Behavioral;
