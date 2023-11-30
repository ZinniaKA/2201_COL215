----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2022 06:36:07 PM
-- Design Name: 
-- Module Name: adder_tb - Behavioral
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

entity adder_tb is
--  Port ( );
end adder_tb;

architecture Behavioral of adder_tb is
component adder 
port ( Cin		:	In	Std_logic;
		x :	In	Std_logic_vector(15 downto 0);
		y: In	Std_logic_vector(15 downto 0);	
		r:	Out	Std_logic_vector (15 downto 0);	
		Cout		:	Out	Std_logic
	);	
end component;



signal cin,cout: std_logic;
signal s1,s2,s3: std_logic_vector(15 downto 0);
signal clk: std_logic:='0';


begin
dut: adder port map(cin,s1,s2,s3,cout);
clk<=not clk after 5 ns;
cin<='0',cout after 10 ns;
s1<="0010100101001000","0010111101001000" after 10 ns,"0010100101001111" after 20 ns;
s2<="0010110101001000","1110111101001000" after 10 ns,"0010100101000011" after 20 ns;


end Behavioral;