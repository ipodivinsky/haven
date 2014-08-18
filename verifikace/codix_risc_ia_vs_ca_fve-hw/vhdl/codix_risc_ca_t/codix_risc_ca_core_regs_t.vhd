--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of register file 'codix_risc_ca_core_regs_t' type.
--------------------------------------------------------------------------------
-- Register file properties:
	-- size: 32
	-- width: 32 bits
	-- memory address width: 5 bits
	-- number of read data ports: 3
	-- number of write data ports: 1
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_regs_t is
	port (
		CLK : in std_logic;
		D0 : in std_logic_vector(31 downto 0);
		Q0 : out std_logic_vector(31 downto 0);
		Q1 : out std_logic_vector(31 downto 0);
		Q2 : out std_logic_vector(31 downto 0);
		RA0 : in std_logic_vector(4 downto 0);
		RA1 : in std_logic_vector(4 downto 0);
		RA2 : in std_logic_vector(4 downto 0);
		RE0 : in std_logic;
		RE1 : in std_logic;
		RE2 : in std_logic;
		WA0 : in std_logic_vector(4 downto 0);
		WE0 : in std_logic
	);
end entity codix_risc_ca_core_regs_t;

-- Use RTL as data storage.
architecture RTL of codix_risc_ca_core_regs_t is
	type memory_type is array (0 to 31) of std_logic_vector(31 downto 0);

	signal RAM: memory_type;
begin
	process( CLK, WA0, WE0, D0 )
	begin
		if ( rising_edge(CLK) ) then
			if ( WE0 = '1' ) then
				RAM(to_integer(unsigned(WA0))) <= D0;
			end if;
		end if;
	end process;
	Q0 <= RAM(to_integer(unsigned(RA0)));
	Q1 <= RAM(to_integer(unsigned(RA1)));
	Q2 <= RAM(to_integer(unsigned(RA2)));

end architecture RTL;

