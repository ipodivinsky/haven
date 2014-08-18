--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of generic pipeline register with synchronous write and asynchronous reset.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity d_ff_pipeline_t is
	generic (
		bit_width : natural := 8;
		reset_value : std_logic_vector := "00000000"
	);
	port (
		CLK:    in  std_logic;
		RST:    in  std_logic;
		CLEAR:  in  std_logic;
		STALL:  in  std_logic;
		WE0:    in  std_logic;
		D0:     in  std_logic_vector(bit_width-1 downto 0);
		Q0:     out std_logic_vector(bit_width-1 downto 0)
	);
end entity;

architecture RTL of d_ff_pipeline_t is
	signal Q_local: std_logic_vector(bit_width-1 downto 0);
	constant big_endian_reset_value : std_logic_vector(reset_value'length -1 downto 0) := reset_value;
begin
	process( CLK, RST, CLEAR, STALL, WE0, D0, Q_local )
	begin
		if ( RST = '0' ) then
			Q_local <= big_endian_reset_value( Q_local'range );
		else
			if ( rising_edge(CLK) ) then
				if ( CLEAR = '1' ) then
					Q_local <= big_endian_reset_value( Q_local'range );
				elsif ( STALL = '1' ) then
					Q_local <= Q_local;
				elsif ( WE0 = '1' ) then
					Q_local <= D0;
				end if;
			end if;
		end if;
	end process;

	Q0 <= Q_local;

end architecture RTL;

