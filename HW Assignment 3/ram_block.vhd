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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ram_block is
    Port (d_in: in std_logic_vector(15 downto 0 );
    addr: in std_logic_vector(13 downto 0);
    clk,re: in std_logic;
    d_out: out std_logic_vector(15 downto 0));
end ram_block;

architecture Behavioral of ram_block is

begin


end Behavioral;