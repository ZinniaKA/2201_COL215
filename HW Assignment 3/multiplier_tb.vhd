----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2022 05:01:28 PM
-- Design Name: 
-- Module Name: multiplier_tb - Behavioral
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

entity multiplier_tb is
--  Port ( );
end multiplier_tb;

architecture Behavioral of multiplier_tb is
component bitmult
Port (mult_one: in std_logic_vector(7 downto 0 );
    mult_two: in std_logic_vector(7 downto 0);
    prd: out std_logic_vector(15 downto 0));
end component;
signal first_vector: std_logic_vector(7 downto 0);
signal second_vector: std_logic_vector(7 downto 0);
signal final_ans: std_logic_vector(15 downto 0);
begin
a1: bitmult port map (first_vector,second_vector,final_ans);
first_vector<= "00000000","01001010" after 5 ns,"11111000" after 10 ns,"10110101"after 15ns;
second_vector <= "01001010","11010100" after 5 ns,"01101101" after 10 ns,"00011100" after 15 ns;


end Behavioral;