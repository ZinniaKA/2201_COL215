----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2022 05:49:55 PM
-- Design Name: 
-- Module Name: fsm_tb - Behavioral
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

entity fsm_tb is
--  Port ( );
end fsm_tb;


architecture Behavioral of fsm_tb is
component fsm_unit
  Port (
     ck: in STD_LOGIC;
     reset: in STD_LOGIC ;
     done: out std_logic;
     ram_read: in std_logic_vector(13 downto 0);
     output: out std_logic_vector(15 downto 0) );
end component;
signal clk: std_logic:='0';
signal r: std_logic:='0';
signal do: std_logic;
signal rread: std_logic_vector(13 downto 0):="00000000000000";
signal op: std_logic_vector(15 downto 0);

begin
g1 : fsm_unit port map (clk,r,do,rread,op);

clk<= not clk after 1 ns;
end Behavioral;