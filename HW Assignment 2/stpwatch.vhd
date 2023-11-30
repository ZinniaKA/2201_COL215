----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2022 12:10:38 PM
-- Design Name: 
-- Module Name: stpwatch - Behavioral
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

entity stpwatch is
   Port (clk_in : in std_logic;
        
   
        start: in std_logic;
        pause: in std_logic;
        continue: in std_logic;
        reset : in std_logic;
        
        Cat_out: out std_logic_vector (15 downto 0)
--        C0: out std_logic;
--        C1: out std_logic;
--        C2: out std_logic;
--        C4: out std_logic;
--        C5: out std_logic;
--        C6: out std_logic;
--        C7: out std_logic;
--        C8: out std_logic;
--        C9: out std_logic;
--        C10: out std_logic;
--        C11: out std_logic;
--        C12: out std_logic;
--        C13: out std_logic;
--        C14: out std_logic;
--        C15: out std_logic_vector
        );
end stpwatch;

architecture Behavioral of stpwatch is
signal clk_inpt : integer range 0 to 10000000:= 0;--1khz
signal C_OUT : std_logic_vector (15 downto 0):="0000000000000000";

signal enable_watch: std_logic ;
signal reset_watch: std_logic ;

signal m_second_enable:std_logic;
begin 
process(clk_in,start,pause,continue,reset)
begin

    if rising_edge(clk_in) then 
     if reset = '1' then
                   reset_watch <='1';
               
        elsif pause = '1' then
                enable_watch <='0';
                if continue = '1' then
                 enable_watch <='1';
               end if;
       
      
        elsif start = '1' then
            if reset_watch='1' then
                reset_watch<='0';
                end if;
                    enable_watch <='1';
        end if;
    end if;
end process;
process(clk_in,clk_inpt,reset_watch,enable_watch )
begin 
    if(reset_watch='1') then

        clk_inpt <= 0 ;
    end if;

    if(rising_edge(clk_in)) then

        if(clk_inpt =10000000 ) then -- 9999999 cycles = 98967F

            clk_inpt <= 0 ;

        elsif(enable_watch  ='1') then

            clk_inpt <= clk_inpt + 1;

        end if;

    end if;

end process;
m_second_enable<= '1' when clk_inpt= 9999999 else '0';
process (C_OUT ,m_second_enable,enable_watch,reset_watch,clk_inpt,clk_in)
begin
    if reset_watch ='1' then 
        C_OUT <= (OTHERS => '0');
    ELSIF (rising_edge(clk_in)) then
        if m_second_enable  = '1' and enable_watch ='1' then
            C_OUT <= C_OUT + "0000000000000001";
            
        END IF; 
        if C_OUT(3 downto 0) = "1010" then
            C_OUT (7 downto 4) <= C_OUT(7 downto 4) + "0001";
            C_OUT( 3 downto 0) <= "0000";
            END IF;
        if C_OUT (7 downto 4)= "1010" and C_OUT(3 downto 0)="0000" then 
        C_OUT (11 downto 8) <= C_OUT(11 downto 8) +"0001";
            C_OUT( 7 downto 0) <= "00000000";
            END IF;
        if C_OUT (11 downto 8)= "0110" and C_OUT(7 downto 4)="0000" and C_OUT(3 downto 0)="0000" then 
        C_OUT (15 downto 12) <= C_OUT(15 downto 12) +"0001";
            C_OUT( 11 downto 0) <= "000000000000";
        END IF;
        if C_OUT (15 downto 12)= "1010" and C_OUT(11 downto 8)="0000" and C_OUT(7 downto 4)="0000" and C_OUT(3 downto 0) = "0000" then 
        C_OUT (15 downto 0) <="0000000000000000";
         
        END IF;
     END IF;
end process;
Cat_out(0) <= C_OUT(3);
Cat_out(1) <= C_OUT(2);
Cat_out(2) <= C_OUT(1);
Cat_out(3) <= C_OUT(0);
Cat_out(4) <= C_OUT(7);
Cat_out(5) <= C_OUT(6);
Cat_out(6) <= C_OUT(5);
Cat_out(7) <= C_OUT(4);
Cat_out(8) <= C_OUT(11);
Cat_out(9) <= C_OUT(10);
Cat_out(10) <= C_OUT(9);
Cat_out(11) <= C_OUT(8);
Cat_out(12) <= C_OUT(15);
Cat_out(13) <= C_OUT(14);
Cat_out(14) <= C_OUT(13);
Cat_out(15) <= C_OUT(12);

end Behavioral;
