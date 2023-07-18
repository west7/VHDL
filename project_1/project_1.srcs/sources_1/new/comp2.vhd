----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.05.2023 11:20:01
-- Design Name: 
-- Module Name: comp2 - Behavioral
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
use ieee.std_logic_unsigned.all;

entity comp2 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (3 downto 0));
end comp2;

architecture Behavioral of comp2 is
    
    signal reversed_a : std_logic_vector(3 downto 0);
    
    component comp1
        Port (A : in std_logic_vector(3 downto 0);
              Z : out std_logic_vector(3 downto 0));
    end component;
    
begin
    
    reverse_a : comp1 port map(a => a, z => reversed_a);
    
    process(sel, reversed_a, a)
    begin
        if sel = '1' then
            s <= reversed_a + "0001";
        else
            s <= a;
        end if;
    end process;
end Behavioral;
