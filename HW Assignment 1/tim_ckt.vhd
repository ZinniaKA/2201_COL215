library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
entity timer is 
    port( clk: in STD_LOGIC;
    reset: in STD_LOGIC;
    M0: OUT STD_LOGIC;
    M1: OUT STD_LOGIC;
    
    N0: OUT STD_LOGIC;
    N1: OUT STD_LOGIC;
    N2: OUT STD_LOGIC;
    N3: OUT STD_LOGIC);
end timer;

architecture behav of timer is
signal clk_inpt : integer range 0 to 1000000:= 0;--1khz
signal refresh : std_logic_vector(19 downto 0):= "00000000000000000000";
signal an_act: std_logic_vector(1 downto 0):= "00";--dbt
begin
process(clk,reset)
begin
if reset='1' then
        clk_inpt <= 0;
end if;
if rising_edge(clk) then
    refresh <= refresh + '1';
    clk_inpt <= clk_inpt + 1;

    if clk_inpt= 1000000 then 
        clk_inpt <=0;
        refresh<= (others => '0');
    end if;
end if;
end process;
an_act <= refresh(19 downto 18);
process(an_act)
begin
    case an_act is 
        when "00" => 
            N0<= '0';
            N1<= '1';
            N2<= '1';
            N3<= '1';
            
            M0 <='0';
            M1<= '0';
        when "01" => 
             N0<= '1';
             N1<= '0';
             N2<= '1';
             N3<= '1';
                        
             M0 <='0';
             M1<= '1';
        when "11" => 
             N0<= '1';
             N1<= '1';
             N2<= '0';
             N3<= '1';
                                    
             M0 <='1';
             M1 <= '1';
        when "10"=> 
                                                N0<= '1';
                                                N1<= '1';
                                                N2<= '1';
                                                N3<= '0';
                                                
                                                M0 <='1';
                                                M1<= '0';  
        when OTHERS => 
             N0<= '1';
             N1<= '1';
             N2<= '1';
             N3<= '1';                                   
       
end case;
end process;
end behav;
                                    
                        
            
         
            


        
        
        
        
                
        
       
        