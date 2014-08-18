--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of main controller 'codix_risc_ca_core_main_controller_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_controller_t is
	port (
		CLK : in std_logic;
		RST : in std_logic;
		main_alu_alu_fu_semantics_ACT : out std_logic;
		main_cond_compare_cond_compare_fu_semantics_ACT : out std_logic;
		main_ex2_ex2_controller_semantics_ACT : out std_logic;
		main_ex_ex_controller_semantics_ACT : out std_logic;
		main_ex_output_ex_output_fu_semantics_ACT : out std_logic;
		main_fe_fe_controller_semantics_ACT : out std_logic;
		main_flow_logic_control_flow_logic_control_fu_semantics_ACT : out std_logic;
		main_fnc_ctrl_0_1_condition_ACT : out std_logic;
		main_fnc_ctrl_0_1_condition_RET : in std_logic;
		main_halt_halt_fu_semantics_ACT : out std_logic;
		main_id_id_controller_semantics_ACT : out std_logic;
		main_instr_hw_instr_hw_ACT : out std_logic;
		main_main_controller_semantics_ACT : out std_logic;
		main_rd_rd_controller_semantics_ACT : out std_logic;
		main_wb_output_wb_output_fu_semantics_ACT : out std_logic;
		main_wb_wb_controller_semantics_ACT : out std_logic
	);
end entity codix_risc_ca_core_main_controller_t;

architecture RTL of codix_risc_ca_core_main_controller_t is
	-- pipeline controller
	component codix_risc_ca_core_main_controller_main_wb_wb_controller_t
		port (
			ACT : in std_logic;
			CLK : in std_logic;
			RST : in std_logic;
			main_wb_wb_controller_semantics_ACT : out std_logic
		);
	end component codix_risc_ca_core_main_controller_main_wb_wb_controller_t;

	-- pipeline controller
	component codix_risc_ca_core_main_controller_main_ex2_ex2_controller_t
		port (
			ACT : in std_logic;
			CLK : in std_logic;
			RST : in std_logic;
			main_ex2_ex2_controller_semantics_ACT : out std_logic
		);
	end component codix_risc_ca_core_main_controller_main_ex2_ex2_controller_t;

	-- pipeline controller
	component codix_risc_ca_core_main_controller_main_ex_ex_controller_t
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
			main_wb_output_wb_output_fu_semantics_ACT : out std_logic
		);
	end component codix_risc_ca_core_main_controller_main_ex_ex_controller_t;

	-- pipeline controller
	component codix_risc_ca_core_main_controller_main_rd_rd_controller_t
		port (
			ACT : in std_logic;
			CLK : in std_logic;
			RST : in std_logic;
			main_rd_rd_controller_semantics_ACT : out std_logic
		);
	end component codix_risc_ca_core_main_controller_main_rd_rd_controller_t;

	-- pipeline controller
	component codix_risc_ca_core_main_controller_main_id_id_controller_t
		port (
			ACT : in std_logic;
			CLK : in std_logic;
			RST : in std_logic;
			main_id_id_controller_semantics_ACT : out std_logic;
			main_instr_hw_instr_hw_ACT : out std_logic
		);
	end component codix_risc_ca_core_main_controller_main_id_id_controller_t;

	-- pipeline controller
	component codix_risc_ca_core_main_controller_main_fe_fe_controller_t
		port (
			ACT : in std_logic;
			CLK : in std_logic;
			RST : in std_logic;
			main_fe_fe_controller_semantics_ACT : out std_logic;
			main_flow_logic_control_flow_logic_control_fu_semantics_ACT : out std_logic
		);
	end component codix_risc_ca_core_main_controller_main_fe_fe_controller_t;

	-- pipeline controller
	component codix_risc_ca_core_main_controller_main_main_controller_t
		port (
			CLK : in std_logic;
			RST : in std_logic;
			main_ex2_ex2_controller_ACT : out std_logic;
			main_ex_ex_controller_ACT : out std_logic;
			main_fe_fe_controller_ACT : out std_logic;
			main_id_id_controller_ACT : out std_logic;
			main_main_controller_semantics_ACT : out std_logic;
			main_rd_rd_controller_ACT : out std_logic;
			main_wb_wb_controller_ACT : out std_logic
		);
	end component codix_risc_ca_core_main_controller_main_main_controller_t;


		-- instances connection signals
	signal main_main_controller_main_wb_wb_controller_ACT_0 : std_logic;
	signal main_controller_main_wb_wb_controller_semantics_ACT_1 : std_logic;
	signal main_main_controller_main_ex2_ex2_controller_ACT_2 : std_logic;
	signal main_controller_main_ex2_ex2_controller_semantics_ACT_3 : std_logic;
	signal main_main_controller_main_ex_ex_controller_ACT_4 : std_logic;
	signal main_controller_main_fnc_ctrl_0_1_condition_ACT_5 : std_logic;
	signal main_controller_main_fnc_ctrl_0_1_condition_RET_6 : std_logic;
	signal main_controller_main_ex_ex_controller_semantics_ACT_7 : std_logic;
	signal main_controller_main_cond_compare_cond_compare_fu_semantics_ACT_8 : std_logic;
	signal main_controller_main_alu_alu_fu_semantics_ACT_9 : std_logic;
	signal main_controller_main_ex_output_ex_output_fu_semantics_ACT_10 : std_logic;
	signal main_controller_main_wb_output_wb_output_fu_semantics_ACT_11 : std_logic;
	signal main_controller_main_halt_halt_fu_semantics_ACT_12 : std_logic;
	signal main_main_controller_main_rd_rd_controller_ACT_13 : std_logic;
	signal main_controller_main_rd_rd_controller_semantics_ACT_14 : std_logic;
	signal main_main_controller_main_id_id_controller_ACT_15 : std_logic;
	signal main_controller_main_id_id_controller_semantics_ACT_16 : std_logic;
	signal main_controller_main_instr_hw_instr_hw_ACT_17 : std_logic;
	signal main_main_controller_main_fe_fe_controller_ACT_18 : std_logic;
	signal main_controller_main_fe_fe_controller_semantics_ACT_19 : std_logic;
	signal main_controller_main_flow_logic_control_flow_logic_control_fu_semantics_ACT_20 : std_logic;
	signal main_controller_main_main_controller_semantics_ACT_21 : std_logic;

begin
	-- child instances inside 'main_controller' main CPU controller:
	-- instance of 'main_wb_wb_controller' CPU controller:
	main_wb_wb_controller : codix_risc_ca_core_main_controller_main_wb_wb_controller_t
		port map (
			ACT => main_main_controller_main_wb_wb_controller_ACT_0,
			CLK => CLK,
			RST => RST,
			main_wb_wb_controller_semantics_ACT => main_controller_main_wb_wb_controller_semantics_ACT_1
		);

	-- instance of 'main_ex2_ex2_controller' CPU controller:
	main_ex2_ex2_controller : codix_risc_ca_core_main_controller_main_ex2_ex2_controller_t
		port map (
			ACT => main_main_controller_main_ex2_ex2_controller_ACT_2,
			CLK => CLK,
			RST => RST,
			main_ex2_ex2_controller_semantics_ACT => main_controller_main_ex2_ex2_controller_semantics_ACT_3
		);

	-- instance of 'main_ex_ex_controller' CPU controller:
	main_ex_ex_controller : codix_risc_ca_core_main_controller_main_ex_ex_controller_t
		port map (
			ACT => main_main_controller_main_ex_ex_controller_ACT_4,
			CLK => CLK,
			RST => RST,
			main_fnc_ctrl_0_1_condition_ACT => main_controller_main_fnc_ctrl_0_1_condition_ACT_5,
			main_fnc_ctrl_0_1_condition_RET => main_controller_main_fnc_ctrl_0_1_condition_RET_6,
			main_ex_ex_controller_semantics_ACT => main_controller_main_ex_ex_controller_semantics_ACT_7,
			main_cond_compare_cond_compare_fu_semantics_ACT => main_controller_main_cond_compare_cond_compare_fu_semantics_ACT_8,
			main_alu_alu_fu_semantics_ACT => main_controller_main_alu_alu_fu_semantics_ACT_9,
			main_ex_output_ex_output_fu_semantics_ACT => main_controller_main_ex_output_ex_output_fu_semantics_ACT_10,
			main_wb_output_wb_output_fu_semantics_ACT => main_controller_main_wb_output_wb_output_fu_semantics_ACT_11,
			main_halt_halt_fu_semantics_ACT => main_controller_main_halt_halt_fu_semantics_ACT_12
		);

	-- instance of 'main_rd_rd_controller' CPU controller:
	main_rd_rd_controller : codix_risc_ca_core_main_controller_main_rd_rd_controller_t
		port map (
			ACT => main_main_controller_main_rd_rd_controller_ACT_13,
			CLK => CLK,
			RST => RST,
			main_rd_rd_controller_semantics_ACT => main_controller_main_rd_rd_controller_semantics_ACT_14
		);

	-- instance of 'main_id_id_controller' CPU controller:
	main_id_id_controller : codix_risc_ca_core_main_controller_main_id_id_controller_t
		port map (
			ACT => main_main_controller_main_id_id_controller_ACT_15,
			CLK => CLK,
			RST => RST,
			main_id_id_controller_semantics_ACT => main_controller_main_id_id_controller_semantics_ACT_16,
			main_instr_hw_instr_hw_ACT => main_controller_main_instr_hw_instr_hw_ACT_17
		);

	-- instance of 'main_fe_fe_controller' CPU controller:
	main_fe_fe_controller : codix_risc_ca_core_main_controller_main_fe_fe_controller_t
		port map (
			ACT => main_main_controller_main_fe_fe_controller_ACT_18,
			CLK => CLK,
			RST => RST,
			main_fe_fe_controller_semantics_ACT => main_controller_main_fe_fe_controller_semantics_ACT_19,
			main_flow_logic_control_flow_logic_control_fu_semantics_ACT => main_controller_main_flow_logic_control_flow_logic_control_fu_semantics_ACT_20
		);

	-- instance of 'main_main_controller' CPU controller:
	main_main_controller : codix_risc_ca_core_main_controller_main_main_controller_t
		port map (
			CLK => CLK,
			RST => RST,
			main_main_controller_semantics_ACT => main_controller_main_main_controller_semantics_ACT_21,
			main_fe_fe_controller_ACT => main_main_controller_main_fe_fe_controller_ACT_18,
			main_id_id_controller_ACT => main_main_controller_main_id_id_controller_ACT_15,
			main_rd_rd_controller_ACT => main_main_controller_main_rd_rd_controller_ACT_13,
			main_ex_ex_controller_ACT => main_main_controller_main_ex_ex_controller_ACT_4,
			main_ex2_ex2_controller_ACT => main_main_controller_main_ex2_ex2_controller_ACT_2,
			main_wb_wb_controller_ACT => main_main_controller_main_wb_wb_controller_ACT_0
		);

	-- port mappings for 'main_controller' main CPU controller:
	main_wb_wb_controller_semantics_ACT <= main_controller_main_wb_wb_controller_semantics_ACT_1;
	main_ex2_ex2_controller_semantics_ACT <= main_controller_main_ex2_ex2_controller_semantics_ACT_3;
	main_fnc_ctrl_0_1_condition_ACT <= main_controller_main_fnc_ctrl_0_1_condition_ACT_5;
	main_controller_main_fnc_ctrl_0_1_condition_RET_6 <= main_fnc_ctrl_0_1_condition_RET;
	main_ex_ex_controller_semantics_ACT <= main_controller_main_ex_ex_controller_semantics_ACT_7;
	main_cond_compare_cond_compare_fu_semantics_ACT <= main_controller_main_cond_compare_cond_compare_fu_semantics_ACT_8;
	main_alu_alu_fu_semantics_ACT <= main_controller_main_alu_alu_fu_semantics_ACT_9;
	main_ex_output_ex_output_fu_semantics_ACT <= main_controller_main_ex_output_ex_output_fu_semantics_ACT_10;
	main_wb_output_wb_output_fu_semantics_ACT <= main_controller_main_wb_output_wb_output_fu_semantics_ACT_11;
	main_halt_halt_fu_semantics_ACT <= main_controller_main_halt_halt_fu_semantics_ACT_12;
	main_rd_rd_controller_semantics_ACT <= main_controller_main_rd_rd_controller_semantics_ACT_14;
	main_id_id_controller_semantics_ACT <= main_controller_main_id_id_controller_semantics_ACT_16;
	main_instr_hw_instr_hw_ACT <= main_controller_main_instr_hw_instr_hw_ACT_17;
	main_fe_fe_controller_semantics_ACT <= main_controller_main_fe_fe_controller_semantics_ACT_19;
	main_flow_logic_control_flow_logic_control_fu_semantics_ACT <= main_controller_main_flow_logic_control_flow_logic_control_fu_semantics_ACT_20;
	main_main_controller_semantics_ACT <= main_controller_main_main_controller_semantics_ACT_21;

end architecture RTL;


