----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/06/2022 01:48:46 PM
-- Design Name: 
-- Module Name: rom_block - Behavioral
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
use ieee.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom_block is
    Port (
    addr: in std_logic_vector(13 downto 0);
    clk: in std_logic;
    d_out: out std_logic_vector(15 downto 0));
    
end rom_block;

architecture Behavioral of rom_block is

begin
process(clk) is
begin



end Behavioral;