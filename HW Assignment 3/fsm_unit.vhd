----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2022 13:37:11
-- Design Name: 
-- Module Name: fsm_unit - Behavioral
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
use ieee.std_logic_unsigned.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsm_unit is
  Port (
       ck: in STD_LOGIC;
       reset: in STD_LOGIC ;
       done: out std_logic;
       ram_read: in std_logic_vector(13 downto 0);
       output: out std_logic_vector(15 downto 0) );
end fsm_unit;

architecture Behavioral of fsm_unit is
component mac_unit 
Port (in_clk,cntrl: in std_logic;
   inpt_1: in std_logic_vector(7 downto 0);
   inpt_2: in std_logic_vector(7 downto 0);
   outsum: out std_logic_vector(15 downto 0)
   );
end component;
component rom_block_1
Port(a:in std_logic_vector(13 downto 0);
    clk: in std_logic;
    spo: out std_logic_vector(7 downto 0));
end component;

component rom_block_2
Port(a:in std_logic_vector(13 downto 0);
    clk: in std_logic;
    spo: out std_logic_vector(7 downto 0));
end component;

component ram_block
Port(a:in std_logic_vector(13 downto 0);
    we,clk: in std_logic;
    d: in std_logic_vector(15 downto 0);
     spo: out std_logic_vector(15 downto 0));
end component;

component reg 
 Port (data_in : in std_logic_vector(15 downto 0 );
   data_out: out std_logic_vector(15 downto 0);
   reset,clk,read: in std_logic);   
end component;
component reg_2 
    Port (data_in : in std_logic_vector(7 downto 0 );
      data_out: out std_logic_vector(7 downto 0);
      reset,clk,read: in std_logic);
end component;

signal addr1,addr2,temp: STD_LOGIC_VECTOR(13 downto 0):="00000000000000";
signal addr_ram: STD_LOGIC_VECTOR(13 downto 0):="00000000000000";
--signal address1,address2: std_logic_vector(13 downto 0);
signal spo1,spo2,reg2_o1,reg2_o2,mac_inpt_1,mac_inpt_2: std_logic_vector(7 downto 0 );
signal reg2_r1, reg2_r2,start,reg_r,ram_wr,reg_reset,reg2_reset1,reg2_reset2,control: std_logic;
signal mac_result,reg_out,spo_ram: std_logic_vector(15 downto 0);
signal count_mul,rom1_row,rom1_col,rom2_row,rom2_col,ram_row,ram_col: integer range 0 to 12:=0;
signal total_cnt: integer range 0 to 16384;
signal RE4,WR4,row_change,first_compute,first_write,ram_row_change: STD_LOGIC;
signal dn: std_logic:='0';
signal int1,int2,int3 : integer;
signal ctr: std_logic;


type state_type is(mac_state,rom_state,ram_state,termination_state);
    signal curr_state: state_type := rom_state;
    signal next_state: state_type := rom_state;
    
    
    
begin
a1: rom_block_1 port map (a=>addr1,clk=>ck,spo=>spo1);
--a0: rom_block_1 port map (a=>addr1,clk=>ck,spo=>spo1);
a2: rom_block_2 port map (a=>addr2,clk=>ck,spo=>spo2);

a3: ram_block port map (a=>addr_ram,we=>WR4,clk=>ck,d=>reg_out,spo=>spo_ram);

a4: reg port map(data_in=>mac_result,data_out=>reg_out,reset=>reg_reset,clk=>ck,read=>reg_r);

a5: reg_2 port map(data_in=>spo1,data_out=>reg2_o1,reset=>reg2_reset1,clk=>ck,read=>reg2_r1);
a6: reg_2 port map(data_in=>spo2,data_out=>reg2_o2,reset=>reg2_reset2,clk=>ck,read=>reg2_r2);

m0: mac_unit port map(in_clk=>ck,cntrl=>ctr,inpt_1=>reg2_o1,inpt_2=>reg2_o2,outsum=>mac_result);

ram_row<=0;
--process(ram_read)
--begin
--if done='1' then
--addr_ram<= ram_read;
--end if;
--end process;



process (ck,reset)
begin
if reset ='1' then
curr_state<= rom_state;
elsif rising_edge(ck) then
curr_state<= next_state;
end if;
end process;


process(rom1_row,rom1_col,rom2_row,rom2_col)
begin
addr1<= std_logic_vector(to_unsigned(rom1_col,7)) & std_logic_vector(to_unsigned(rom1_row,7));
addr2<= std_logic_vector(to_unsigned(rom2_col,7)) & std_logic_vector(to_unsigned(rom2_row,7));
end process;
process(int1,int2)
begin
int3<= int1-int2;
end process;
process(int3,ram_read,dn)
begin
if dn = '1' then
addr_ram<= ram_read;
output<= spo_ram;
WR4<='0';
else
addr_ram <= std_logic_vector(to_unsigned(int3,addr_ram'length));
WR4<='1';
end if;
end process;



process(curr_state,next_state)
begin
next_state<= curr_state;
case curr_state is 

when rom_state=>
if rom1_row= 127 and rom1_col = 127 and rom2_row = 127 and rom2_col = 127 then 
next_state <= termination_state;
else
if rom1_col = 127 and rom2_row = 127 then
if total_cnt = 16383 then
rom1_row <=rom1_row+1;
rom1_col<=0;
rom2_row<=0;
rom2_col<= 0;
total_cnt<= 0;
else
rom1_col<=0;
rom2_row<=0;
rom2_col<=rom2_col+1;
count_mul<=0;
end if;
else
rom1_col<= rom1_col +1;
rom2_row<= rom2_row+1;
count_mul<= count_mul+1;
total_cnt<= total_cnt+1;
end if;
end if;
next_state<= mac_state;


when mac_state=>
reg2_r1<='1';
reg2_r2<='1';
if count_mul = 0 then 
ctr<='1';
else
ctr<='0';
end if;
reg_r<='0';
if count_mul = 127 then 
next_state<= ram_state;
else
next_state<= rom_state;
end if;

when ram_state=>
--reg2_r1<='0';
--reg2_r2<='0';
int1<= to_integer(unsigned(addr1));
int2<= to_integer(unsigned(addr2));
reg_r<='1';
next_state<=rom_state;

when termination_state=>
done <= '1';
dn<='1';

next_state<= termination_state;



end case;
end process;


end Behavioral;