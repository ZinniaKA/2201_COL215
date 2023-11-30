----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2022 02:41:18 PM
-- Design Name: 
-- Module Name: display - Behavioral
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
use IEEE.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display is
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
end display;

architecture Behavioral of display is


COMPONENT led_to_bcd
   Port ( A0, A1,A2 , A3 : in STD_LOGIC;
           A,B,C,D,E,F,G: out STD_LOGIC);
end component;
COMPONENT mux_gate 
  Port ( A0: in STD_LOGIC;
    A1: in STD_LOGIC;
    A2: in STD_LOGIC;
    A3: in STD_LOGIC;
    A4: in STD_LOGIC;
    A5: in STD_LOGIC;
    A6: in STD_LOGIC;
    A7: in STD_LOGIC;
    A8: in STD_LOGIC;
    A9: in STD_LOGIC;
    A10: in STD_LOGIC;
    A11: in STD_LOGIC;
    A12: in STD_LOGIC;
    A13: in STD_LOGIC;
    A14: in STD_LOGIC;
    A15: in STD_LOGIC;
    
    S0 : IN STD_LOGIC;
    S1: IN STD_LOGIC;
    
    O0: OUT STD_LOGIC;
    O1: OUT STD_LOGIC;
    O2: OUT STD_LOGIC;
    O3: OUT STD_LOGIC);
end component;

COMPONENT timer 
port( clk: in STD_LOGIC;
    reset: in STD_LOGIC;
    M0: OUT STD_LOGIC;
    M1: OUT STD_LOGIC;
    
    N0: OUT STD_LOGIC;
    N1: OUT STD_LOGIC;
    N2: OUT STD_LOGIC;
    N3: OUT STD_LOGIC);
end component;

SIGNAL Y0: STD_LOGIC;
SIGNAL Y1: STD_LOGIC;
SIGNAL Z0: STD_LOGIC;
SIGNAL Z1: STD_LOGIC;
SIGNAL Z2: STD_LOGIC;
SIGNAL Z3: STD_LOGIC;
SIGNAL Q0: STD_LOGIC;
SIGNAL Q1: STD_LOGIC;
SIGNAL Q2: STD_LOGIC;
SIGNAL Q3: STD_LOGIC;

begin
T1: timer port map (CLK_IN,RES, Y0,Y1,Z0,Z1,Z2,Z3);
U1: mux_gate port map (R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,Y0,Y1,Q0,Q1,Q2,Q3);
H1: led_to_bcd port map (Q0,Q1,Q2,Q3, C0,C1,C2,C3,C4,C5,C6);
D0<=Z0;
D1<= Z1;
D2<= Z2;
D3<=Z3;
end Behavioral;