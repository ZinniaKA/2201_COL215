Library ieee;
Use ieee.std_logic_1164.all;
 
Entity adder is
  port ( Cin		:	In	Std_logic;
		x :	In	Std_logic_vector(15 downto 0);
		y: In	Std_logic_vector(15 downto 0);	
		r:	Out	Std_logic_vector (15 downto 0);	
		Cout		:	Out	Std_logic
	);	
end adder;
 
Architecture adder16_structure of adder is
	signal c1, c2, c3, c4	:		Std_logic;
	signal c5, c6, c7, c8	:		Std_logic;
	signal c9, c10, c11, c12	:		Std_logic;
	signal c13, c14, c15		:		Std_logic;
	component fulladder
	port (	Cin, x, y	:	In	Std_logic;
		s, Cout		:	Out	Std_logic
	);
	end component;
begin
	stage0: fulladder port map (Cin, x(0), y(0), r(0), c1);
	stage1: fulladder port map (c1, x(1), y(1), r(1), c2);
	stage2: fulladder port map (c2, x(2), y(2), r(2), c3);
	stage3: fulladder port map (c3, x(3), y(3), r(3), c4);
	stage4: fulladder port map (c4, x(4), y(4), r(4), c5);
	stage5: fulladder port map (c5, x(5), y(5), r(5), c6);
	stage6: fulladder port map (c6, x(6), y(6), r(6), c7);
	stage7: fulladder port map (c7, x(7), y(7), r(7), c8);
	stage8: fulladder port map (c8, x(8), y(8), r(8), c9);
	stage9: fulladder port map (c9, x(9), y(9), r(9), c10);
	stage10: fulladder port map (c10, x(10), y(10), r(10), c11);
	stage11: fulladder port map (c11, x(11), y(11), r(11), c12);
	stage12: fulladder port map (c12, x(12), y(12), r(12), c13);
	stage13: fulladder port map (c13, x(13), y(13), r(13), c14);
	stage14: fulladder port map (c14, x(14), y(14), r(14), c15);
	stage15: fulladder port map (c15, x(15), y(15), r(15), Cout);
	
end Architecture;