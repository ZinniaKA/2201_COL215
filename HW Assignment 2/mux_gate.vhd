----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.10.2022 17:13:41
-- Design Name: 
-- Module Name: mux_gate - Behavioral
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

entity mux_gate is
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
end mux_gate;

architecture Behavioral of mux_gate is

begin
O0 <= (not S0 and not S1 and A0) or  (not S0 and S1 and A4) or  (S0 and  S1 and A8) or  (S0 and not S1 and A12);
O1 <= (not S0 and not S1 and A1) or  (not S0 and S1 and A5) or  (S0 and  S1 and A9) or  (S0 and not S1 and A13);
O2 <= (not S0 and not S1 and A2) or  (not S0 and S1 and A6) or  (S0 and  S1 and A10) or  (S0 and not S1 and A14);
O3 <= (not S0 and not S1 and A3) or  (not S0 and S1 and A7) or  (S0 and  S1 and A11) or  (S0 and not S1 and A15);
end Behavioral;
