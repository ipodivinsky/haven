--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of generic register with synchronous write and asynchronous reset.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity d_ff_plain_t is
	generic (
		bit_width : natural := 8;
		reset_value : std_logic_vector := "00000000"
	);
	port (
		CLK:    in  std_logic;
		RST:    in  std_logic;
		WE0:    in  std_logic;
		D0:     in  std_logic_vector(bit_width-1 downto 0);
		Q0:     out std_logic_vector(bit_width-1 downto 0)
	);
end entity;

architecture RTL of d_ff_plain_t is
	constant big_endian_reset_value : std_logic_vector(reset_value'length -1 downto 0) := reset_value;
begin
	process( CLK, RST, WE0, D0 )
	begin
		if ( RST = '0' ) then
			Q0 <= big_endian_reset_value( Q0'range );
		else
			if ( rising_edge(CLK) ) then
				if ( WE0 = '1' ) then
					Q0 <= D0;
				end if;
			end if;
		end if;
	end process;
end architecture RTL;

