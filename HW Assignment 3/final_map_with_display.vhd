----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2022 05:03:47 PM
-- Design Name: 
-- Module Name: final_map_with_display - Behavioral
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

entity final_map_with_display is
    Port (A0: in std_logic;
    A3: in std_logic;
    A1: in std_logic;
    A2: in std_logic;
    A4: in std_logic;
    A5: in std_logic;
    A6: in std_logic;
    A7: in std_logic;
    A8: in std_logic;
    A9: in std_logic;
    A10: in std_logic;
    A11: in std_logic;
    A12: in std_logic;
    A13: in std_logic;
    clk_inp: in std_logic;
    rest: in std_logic;
   
        CA1: OUT STD_LOGIC;
        CA2: OUT STD_LOGIC;
        CA3: OUT STD_LOGIC;
        CA4: OUT STD_LOGIC;
        CA5: OUT STD_LOGIC;
        CA0: OUT STD_LOGIC;
        CA6: OUT STD_LOGIC;
        
        DA0: OUT STD_LOGIC;    
        DA1: OUT STD_LOGIC;
        DA2: OUT STD_LOGIC;
        DA3: OUT STD_LOGIC);
end final_map_with_display;

architecture Behavioral of final_map_with_display is
component display 
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

component fsm_unit 
port( ck: in STD_LOGIC;
       reset: in STD_LOGIC ;
       done: out std_logic;
       ram_read: in std_logic_vector(13 downto 0);
       output: out std_logic_vector(15 downto 0) );
end component;
signal dne: std_logic;
signal op: std_logic_vector(15 downto 0);
signal b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15 : std_logic;
signal Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,Z10,Z11,Z12,Z13: STD_LOGIC;
SIGNAL addr_to_display: std_logic_vector(13 downto 0);
begin

d1: fsm_unit port map (ck=> clk_inp, reset=>rest, done=>dne, ram_read=>addr_to_display,output=>op);
d2: display port map( b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,clk_inp,rest,CA0,CA1,CA2,CA3,CA4,CA5,CA6,DA0,DA1,DA2,DA3);
addr_to_display(0)<= A0;
    addr_to_display(1)<= A1;
    addr_to_display(2)<= A2;
        addr_to_display(3)<= A3;
    addr_to_display(4)<= A4;
    addr_to_display(5)<= A5;
    addr_to_display(6)<= A6;
    addr_to_display(7)<= A7;
    addr_to_display(8)<= A8;
    addr_to_display(9)<= A9;
    addr_to_display(10)<= A10;
    addr_to_display(11)<= A11;
    addr_to_display(12)<= A12;
    addr_to_display(13)<= A13;
process(op,dne)
begin
if dne = '1' then
    
                        
    b0<= op(0);
    b1<= op(1);
    b2<= op(2);
    b3<= op(3);
    b4<= op(4);
    b5<= op(5);
    b6<= op(6);
    b7<= op(7);
    b8<= op(8);
    b9<= op(9);
    b10<= op(10);
    b11<= op(11);
    b12<= op(12);
    b13<= op(13);
    b14<= op(14);
    b15<= op(15);
end if;



end process;

end Behavioral;