-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity tb is 
end tb;

architecture behav of tb is 

component final_map 
 Port ( clk_in : in std_logic;
        
   
        s: in std_logic;
        p: in std_logic;
        cont: in std_logic;
        res : in std_logic;
        res2: in std_logic ;
    
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
    
end component;

signal clk,set,pause,continue,reset1,reset2,CAT0,CAT1,CAT2,CAT3,CAT4,CAT5,CAT6,AN01,AN02,AN03,AN04 : std_logic:= '0';
begin
UUT : final_map port map(clk, set ,pause,continue,reset1,reset2,CAT0,CAT1,CAT2,CAT3,CAT4,CAT5,CAT6,AN01,AN02,AN03,AN04);

clk<= not clk after 0.01 ns;
set <='1';
pause<= '0','1' after 300 ns, '0' after 400 ns;
continue<= '0', '1' after 400 ns,'0' after 440 ns;
reset1 <= '0';--'1' after 500 ns ,'0' after 800 ns;
reset2<= '0';
end behav;
