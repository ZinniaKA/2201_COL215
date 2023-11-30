----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.10.2022 15:50:47
-- Design Name: 
-- Module Name: led_to_bcd - Behavioral
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

entity led_to_bcd is
    Port ( A0, A1,A2 , A3 : in STD_LOGIC;
           A,B,C,D,E,F,G: out STD_LOGIC);
end led_to_bcd;

architecture LED_ARC of led_to_bcd is

begin

    A <= ((not A0 and not A1 and not A2 and A3) or (not A0 and A1 and not A2 and not A3) or (A0 and not A1 and A2 and A3) or (A0 and A1 and not A2 and A3));
    B <= ((A1 and A2 and not A3) or (A0  and A2 and A3) or (A0 and A1 and not A3) or (not A0 and A1 and not A2 and A3));
    C <= ((A0 and A1 and not A3) or (A0 and A1 and A2 ) or (not A0 and not A1 and A2 and not A3));
    D <= ((A1 and A2 and A3) or (not A0 and not A1 and not A2 and A3) or (not A0 and A1 and not A2 and not A3));
    E <= ((not A0 and A3) or (not A1 and not A2 and A3) or (not A0 and A1 and NOT A2));
    F <= ((not A0 and not A1 and A3) or (not A1 and A2 and not A3) or (not A0 and A2 and A3) or (A0 and A1 and not A2 and A3));
    G <= ((not A0 and not A1 and not A2 ) or (not A0 and A1 and A2 and A3) or (A0 and A1 and not A2 and not A3));
    
end LED_ARC;