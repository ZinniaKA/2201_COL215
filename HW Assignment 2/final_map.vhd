----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2022 01:50:14 PM
-- Design Name: 
-- Module Name: final_map - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity final_map is
   Port ( clk_in : in std_logic;
        
   
        s: in std_logic;
        p: in std_logic;
        cont: in std_logic;
        res : in std_logic;
        res2: in std_logic ;
    dp3:OUT STD_LOGIC;
    B0: OUT STD_LOGIC;
    B1: OUT STD_LOGIC;
    B2: OUT STD_LOGIC;
    B3: OUT STD_LOGIC;
    B4: OUT STD_LOGIC;
    B5: OUT STD_LOGIC;
    B6: OUT STD_LOGIC;
    
    E0: OUT STD_LOGIC;    
    E1: OUT STD_LOGIC;
    E2: OUT STD_LOGIC;
    E3: OUT STD_LOGIC    
    );
end final_map;

architecture Behavioral of final_map is



COMPONENT display
  Port (R0: IN STD_LOGIC;
    R1: IN STD_LOGIC;
    R2: IN STD_LOGIC;
    R3: IN STD_LOGIC;
    R4: IN STD_LOGIC;
    R5: IN STD_LOGIC;
    R6: IN STD_LOGIC;
    R7: IN STD_LOGIC;
    R8: IN STD_LOGIC;
    R9: IN STD_LOGIC;
    R10: IN STD_LOGIC;
    R11: IN STD_LOGIC;
    R12: IN STD_LOGIC;
    R13: IN STD_LOGIC;
    R14: IN STD_LOGIC; 
    R15: IN STD_LOGIC;
    CLK_IN : IN STD_LOGIC;
    RES: IN STD_LOGIC;
    dp2:OUT STD_LOGIC;
    C0: OUT STD_LOGIC;
    C1: OUT STD_LOGIC;
    C2: OUT STD_LOGIC;
    C3: OUT STD_LOGIC;
    C4: OUT STD_LOGIC;
    C5: OUT STD_LOGIC;
    C6: OUT STD_LOGIC;
    
    D0: OUT STD_LOGIC;    
    D1: OUT STD_LOGIC;
    D2: OUT STD_LOGIC;
    D3: OUT STD_LOGIC    
    );
end component;
component stpwatch 
Port (clk_in : in std_logic;
        
   
        start: in std_logic;

        pause: in std_logic;
        continue: in std_logic;
        reset : in std_logic;
        
        Cat_out: out std_logic_vector (15 downto 0));
end component;
signal temp: std_logic_vector (15 downto 0);
begin
Q1 : stpwatch port map( clk_in,s,p,cont,res,temp);
Q2: display port map(temp(0),temp(1),temp(2),temp(3),temp(4),temp(5),temp(6),temp(7),temp(8),temp(9),temp(10),temp(11),temp(12),temp(13),temp(14),temp(15),clk_in,res2,dp3,B0,B1,B2,B3,B4,B5,B6,E0,E1,E2,E3);
end Behavioral;
