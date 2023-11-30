----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2022 05:25:13 PM
-- Design Name: 
-- Module Name: register - Behavioral
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

entity reg_2 is
    Port (data_in : in std_logic_vector(7 downto 0 );
    data_out: out std_logic_vector(7 downto 0);
    reset,clk,read: in std_logic);
end reg_2;

architecture Behavioral of reg_2 is
signal latch: std_logic_vector(data_in'range):=(others =>'0');
begin
data_out<= latch;
process(reset,clk)
begin
if reset = '1' then
latch <= (latch'range=>'0');

elsif rising_edge(clk) then
if read = '0' then --write when the wr is '0'
latch<= data_in;

end if;
end if;
end process;
end Behavioral;