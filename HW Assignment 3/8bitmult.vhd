----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2022 04:50:53 PM
-- Design Name: 
-- Module Name: 8bitmult - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bitmult is
    Port (mult_one: in std_logic_vector(7 downto 0 );
    mult_two: in std_logic_vector(7 downto 0);
    prd: out std_logic_vector(15 downto 0));

end bitmult;

architecture Behavioral of bitmult is

begin
prd<= mult_one*mult_two;
end Behavioral;