--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of controller 'codix_risc_ca_core_main_controller_main_ex_ex_controller_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_controller_main_ex_ex_controller_t is
	port (
		ACT : in std_logic;
		CLK : in std_logic;
		RST : in std_logic;
		main_alu_alu_fu_semantics_ACT : out std_logic;
		main_cond_compare_cond_compare_fu_semantics_ACT : out std_logic;
		main_ex_ex_controller_semantics_ACT : out std_logic;
		main_ex_output_ex_output_fu_semantics_ACT : out std_logic;
		main_fnc_ctrl_0_1_condition_ACT : out std_logic;
		main_fnc_ctrl_0_1_condition_RET : in std_logic;
		main_halt_halt_fu_semantics_ACT : out std_logic;
		main_wb_output_wb_output_fu_semantics_ACT : out std_logic	);
end entity codix_risc_ca_core_main_controller_main_ex_ex_controller_t;

architecture RTL of codix_risc_ca_core_main_controller_main_ex_ex_controller_t is
	-- Controller's state register
	type state_reg_type is ( s0, s1 );
	signal state_reg_Q0 : state_reg_type := s0;
	signal state_reg_D0 : state_reg_type;
	-- signal (inner)
	signal main_ex_ex_controller_ACT : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_return_fnc_ctrl_0 : unsigned(0 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_13951: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_1_14052: unsigned(0 downto 0) := to_unsigned(1, 1);

begin
	-- FSM state register
	process ( CLK, RST )
	begin
		if ( RST = '0' ) then
			state_reg_Q0 <= s0;
		elsif ( rising_edge(CLK) ) then
			state_reg_Q0 <= state_reg_D0;
		end if;
	end process;
	-- FSM transitions
	process ( main_ex_ex_controller_ACT, state_reg_Q0 )
	begin
		state_reg_D0 <= state_reg_Q0;
		case state_reg_Q0 is
			when s0 =>
				if ( (main_ex_ex_controller_ACT = CONSTANT_1_14052) ) then
					state_reg_D0 <= s1;
				else
					state_reg_D0 <= s0;
				end if;
			when s1 =>
				if ( (main_ex_ex_controller_ACT = CONSTANT_1_14052) ) then
					state_reg_D0 <= s1;
				end if;
		end case;
	end process;

	-- datapath code
	main_ex_ex_controller_ACT(0) <= ACT;
	main_fnc_ctrl_0_1_condition_ACT <= CONSTANT_1_14052(0) when (((state_reg_Q0 = s0) or (state_reg_Q0 = s1))) else
		CONSTANT_0_13951(0);
	codasip_return_fnc_ctrl_0(0) <= main_fnc_ctrl_0_1_condition_RET;
	main_ex_ex_controller_semantics_ACT <= CONSTANT_1_14052(0) when ((((state_reg_Q0 = s0) and (main_ex_ex_controller_ACT /= 0)) or (state_reg_Q0 = s1))) else
		CONSTANT_0_13951(0);
	main_cond_compare_cond_compare_fu_semantics_ACT <= CONSTANT_1_14052(0) when ((((state_reg_Q0 = s0) and (main_ex_ex_controller_ACT /= 0)) or (state_reg_Q0 = s1))) else
		CONSTANT_0_13951(0);
	main_alu_alu_fu_semantics_ACT <= CONSTANT_1_14052(0) when ((((state_reg_Q0 = s0) and (main_ex_ex_controller_ACT /= 0)) or (state_reg_Q0 = s1))) else
		CONSTANT_0_13951(0);
	main_ex_output_ex_output_fu_semantics_ACT <= CONSTANT_1_14052(0) when ((((state_reg_Q0 = s0) and (main_ex_ex_controller_ACT /= 0)) or (state_reg_Q0 = s1))) else
		CONSTANT_0_13951(0);
	main_wb_output_wb_output_fu_semantics_ACT <= CONSTANT_1_14052(0) when ((((state_reg_Q0 = s0) and (main_ex_ex_controller_ACT /= 0)) or (state_reg_Q0 = s1))) else
		CONSTANT_0_13951(0);
	main_halt_halt_fu_semantics_ACT <= CONSTANT_1_14052(0) when ((((state_reg_Q0 = s0) and ((main_ex_ex_controller_ACT /= 0) and (codasip_return_fnc_ctrl_0 /= 0))) or ((state_reg_Q0 = s1) and (codasip_return_fnc_ctrl_0 /= 0)))) else
		CONSTANT_0_13951(0);

end architecture RTL;


