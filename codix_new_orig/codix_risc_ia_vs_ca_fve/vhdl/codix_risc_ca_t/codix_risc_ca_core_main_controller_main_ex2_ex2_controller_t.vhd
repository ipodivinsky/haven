--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of controller 'codix_risc_ca_core_main_controller_main_ex2_ex2_controller_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_controller_main_ex2_ex2_controller_t is
	port (
		ACT : in std_logic;
		CLK : in std_logic;
		RST : in std_logic;
		main_ex2_ex2_controller_semantics_ACT : out std_logic	);
end entity codix_risc_ca_core_main_controller_main_ex2_ex2_controller_t;

architecture RTL of codix_risc_ca_core_main_controller_main_ex2_ex2_controller_t is
	-- Controller's state register
	type state_reg_type is ( s0, s1 );
	signal state_reg_Q0 : state_reg_type := s1;
	signal state_reg_D0 : state_reg_type;
	-- signal (inner)
	signal main_ex2_ex2_controller_ACT : unsigned(0 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_13928: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_1_13942: unsigned(0 downto 0) := to_unsigned(1, 1);

begin
	-- FSM state register
	process ( CLK, RST )
	begin
		if ( RST = '0' ) then
			state_reg_Q0 <= s1;
		elsif ( rising_edge(CLK) ) then
			state_reg_Q0 <= state_reg_D0;
		end if;
	end process;
	-- FSM transitions
	process ( main_ex2_ex2_controller_ACT, state_reg_Q0 )
	begin
		state_reg_D0 <= state_reg_Q0;
		case state_reg_Q0 is
			when s0 =>
				if ( (main_ex2_ex2_controller_ACT = CONSTANT_1_13942) ) then
					state_reg_D0 <= s0;
				end if;
			when s1 =>
				if ( (main_ex2_ex2_controller_ACT = CONSTANT_1_13942) ) then
					state_reg_D0 <= s0;
				else
					state_reg_D0 <= s1;
				end if;
		end case;
	end process;

	-- datapath code
	main_ex2_ex2_controller_ACT(0) <= ACT;
	main_ex2_ex2_controller_semantics_ACT <= CONSTANT_1_13942(0) when (((state_reg_Q0 = s0) or ((state_reg_Q0 = s1) and (main_ex2_ex2_controller_ACT /= 0)))) else
		CONSTANT_0_13928(0);

end architecture RTL;


