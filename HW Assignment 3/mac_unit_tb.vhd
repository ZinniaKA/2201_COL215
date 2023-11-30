----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2022 05:39:17 PM
-- Design Name: 
-- Module Name: mac_unit_tb - Behavioral
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

entity mac_unit_tb is
--  Port ( );
end mac_unit_tb;

architecture Behavioral of mac_unit_tb is
component mac_unit 
Port (in_clk,cntrl: in std_logic;
   inpt_1: in std_logic_vector(7 downto 0);
   inpt_2: in std_logic_vector(7 downto 0);
   outsum: out std_logic_vector(15 downto 0)
   );
end component;
signal clk: std_logic:='1';
signal ctrl: std_logic:='1';
signal in1,in2: std_logic_vector(7 downto 0 );
signal ou: std_logic_vector(15 downto 0);


begin
k1 : mac_unit port map(in_clk=>clk,cntrl=>ctrl,inpt_1=>in1,inpt_2=>in2,outsum=>ou);
clk<= not clk after 1 ns;
ctrl<='0' after 10 ns;
in1<= "00101010", "10010100" after 10 ns, "10011111" after 20 ns, "11110000" after 30 ns;
in2<= "00101110", "11110100" after 10 ns, "10011111" after 20 ns, "11110010" after 30 ns;
end Behavioral;