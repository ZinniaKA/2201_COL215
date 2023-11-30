library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
entity timer is 
    port( clk: in STD_LOGIC;
    reset: in STD_LOGIC;
    dp : out STD_LOGIC;
    M0: OUT STD_LOGIC;
    M1: OUT STD_LOGIC;
    
    N0: OUT STD_LOGIC;
    N1: OUT STD_LOGIC;
    N2: OUT STD_LOGIC;
    N3: OUT STD_LOGIC);
end timer;

architecture behav of timer is

signal refresh : std_logic_vector(19 downto 0):= "00000000000000000000";
signal an_act: std_logic_vector(1 downto 0):= "00";--dbt
begin
process(clk,reset)
begin
if rising_edge(clk) then
    refresh <= refresh + 1;
end if;
end process;
an_act <= refresh(19 downto 18);
process(an_act)
begin
    if an_act ="00" then
            N0<= '0';
            N1<= '1';
            N2<= '1';
            N3<= '1';
            dp<='1';
            M0 <='0';
            M1 <= '0';

      elsif an_act ="01" then 
      N0<= '1';
      N1<= '0';
      N2<= '1';
      N3<= '1';
       dp<='0';                  
      M0 <='0';
      M1<= '1';
       elsif an_act = "10" then  
       N0<= '1';
       N1<= '1';
         N2<= '0';
       N3<= '1';
         dp<='1';                            
       M0 <='1';
      M1<= '1';
        elsif an_act= "11" then
       N0<= '1';
       N1<= '1';
                                                N2<= '1';
                                                N3<= '0';
                                                 dp<='0';
                                                M0 <='1';
                                                M1<= '0';
        else
         N0<= '1';
                                                N1<= '1';
                                                N2<= '1';
                                                N3<= '1';
                  
     end if;
         
end process;
end behav;
                                    
                        
            
         
            


        
        
        
        
                
        
       
        
