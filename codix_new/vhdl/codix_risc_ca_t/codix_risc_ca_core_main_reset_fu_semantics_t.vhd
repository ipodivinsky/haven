--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_reset_fu_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_reset_fu_semantics_t is
	port (
		ACT : in std_logic;
		IRST_D0 : out std_logic;
		RST : in std_logic	);
end entity codix_risc_ca_core_main_reset_fu_semantics_t;

architecture RTL of codix_risc_ca_core_main_reset_fu_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_3_i : signed(31 downto 0);

begin
	-- child instances inside 'main_reset_fu_semantics' functional unit:

		-- Datapath code
	IRST_D0 <= RST;

end architecture RTL;


