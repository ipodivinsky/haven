--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of CPU core 'codix_risc_ca_core_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_t is
	port (
		CLK : in std_logic;
		ERST_Q0_main_reset_fu_semantics_4910 : in std_logic;
		IRST_D0_main_reset_fu_semantics_4912 : out std_logic;
		RST : in std_logic;
		dbus_A0_main_ex2_ex2_controller_semantics_3556 : out std_logic_vector(31 downto 0);
		dbus_D0_main_ex2_ex2_controller_semantics_3754 : out std_logic_vector(31 downto 0);
		dbus_IFCMD0_main_wb_wb_controller_semantics_5362 : out std_logic_vector(2 downto 0);
		dbus_IFRESP0_main_wb_wb_controller_semantics_5372 : in std_logic_vector(2 downto 0);
		dbus_OFCMD0_main_ex2_ex2_controller_semantics_3756 : out std_logic_vector(2 downto 0);
		dbus_OFRESP0_main_ex2_ex2_controller_semantics_3765 : in std_logic_vector(2 downto 0);
		dbus_Q0_main_wb_wb_controller_semantics_5360 : in std_logic_vector(31 downto 0);
		dbus_REQCMD0_main_ex2_ex2_controller_semantics_3552 : out std_logic_vector(2 downto 0);
		dbus_REQRESP0_main_ex2_ex2_controller_semantics_3568 : in std_logic_vector(2 downto 0);
		dbus_SC0_main_ex2_ex2_controller_semantics_3564 : out std_logic_vector(2 downto 0);
		dbus_SI0_main_ex2_ex2_controller_semantics_3560 : out std_logic_vector(1 downto 0);
		ibus_A0_main_fe_fe_controller_semantics_4111 : out std_logic_vector(31 downto 0);
		ibus_IFCMD0_main_id_id_controller_semantics_4422 : out std_logic_vector(2 downto 0);
		ibus_IFRESP0_main_id_id_controller_semantics_4430 : in std_logic_vector(2 downto 0);
		ibus_Q0_main_id_id_controller_semantics_4420 : in std_logic_vector(31 downto 0);
		ibus_REQCMD0_main_fe_fe_controller_semantics_4107 : out std_logic_vector(2 downto 0);
		ibus_REQRESP0_main_fe_fe_controller_semantics_4123 : in std_logic_vector(2 downto 0);
		ibus_SC0_main_fe_fe_controller_semantics_4119 : out std_logic_vector(2 downto 0);
		ibus_SI0_main_fe_fe_controller_semantics_4115 : out std_logic_vector(1 downto 0);
		irq_Q0_main_id_id_controller_semantics_4411 : in std_logic;
		port_error_D0_main_ex2_ex2_controller_semantics_3619 : out std_logic_vector(31 downto 0);
		port_error_D0_main_fe_fe_controller_semantics_4155 : out std_logic_vector(31 downto 0);
		port_error_D0_main_id_id_controller_semantics_4454 : out std_logic_vector(31 downto 0);
		port_error_D0_main_wb_wb_controller_semantics_5420 : out std_logic_vector(31 downto 0);
		port_halt_D0_main_wb_output_wb_output_fu_semantics_5340 : out std_logic;
		port_out_D0_main_wb_output_wb_output_fu_semantics_5310 : out std_logic_vector(31 downto 0);
		port_out_en_D0_main_wb_output_wb_output_fu_semantics_5318 : out std_logic
	);
end entity codix_risc_ca_core_t;

architecture RTL of codix_risc_ca_core_t is
	-- register (standard)
	component d_ff_plain_t
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
	end component;
	-- register file
	component codix_risc_ca_core_regs_t
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
	end component codix_risc_ca_core_regs_t;

	-- signal (CodAL)
	signal id_instr : std_logic_vector(11 downto 0);
	-- register (pipeline)
	component d_ff_pipeline_t
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
	end component;
	-- signal (CodAL)
	signal rd_rA : std_logic_vector(4 downto 0);
	-- signal (CodAL)
	signal rd_rB : std_logic_vector(4 downto 0);
	-- signal (CodAL)
	signal rd_rC : std_logic_vector(4 downto 0);
	-- signal (CodAL)
	signal rd_rW : std_logic_vector(4 downto 0);
	-- signal (CodAL)
	signal rd_jump_abs : std_logic_vector(25 downto 0);
	-- signal (CodAL)
	signal rd_jump_rel : std_logic_vector(13 downto 0);
	-- signal (CodAL)
	signal rd_store : std_logic_vector(15 downto 0);
	-- signal (CodAL)
	signal rd_imm : std_logic_vector(15 downto 0);
	-- signal (CodAL)
	signal ex_alu_add : std_logic_vector(31 downto 0);
	-- signal (CodAL)
	signal ex_alu_logic : std_logic_vector(31 downto 0);
	-- signal (CodAL)
	signal ex_alu_arith : std_logic_vector(31 downto 0);
	-- signal (CodAL)
	signal ex_dest_en : std_logic;
	-- signal (CodAL)
	signal ex_cmp : std_logic;
	-- signal (CodAL)
	signal ex2_alu_wb : std_logic_vector(31 downto 0);
	-- signal (CodAL)
	signal wb_mem : std_logic_vector(31 downto 0);
	-- signal (CodAL)
	signal wb_regs_W : std_logic_vector(31 downto 0);
	-- signal (CodAL)
	signal wb_regs_addrW : std_logic_vector(4 downto 0);
	-- signal (CodAL)
	signal wb_regs_we : std_logic;
	-- signal (CodAL)
	signal wb_pc_W : std_logic_vector(31 downto 0);
	-- signal (CodAL)
	signal wb_pc_we : std_logic;
	-- signal (CodAL)
	signal fe_stall : std_logic;
	-- signal (CodAL)
	signal id_stall : std_logic;
	-- signal (CodAL)
	signal id_clear : std_logic;
	-- signal (CodAL)
	signal rd_stall : std_logic;
	-- signal (CodAL)
	signal rd_clear : std_logic;
	-- signal (CodAL)
	signal ex_stall : std_logic;
	-- signal (CodAL)
	signal ex_clear : std_logic;
	-- signal (CodAL)
	signal ex2_stall : std_logic;
	-- signal (CodAL)
	signal ex2_clear : std_logic;
	-- signal (CodAL)
	signal wb_stall : std_logic;
	-- signal (CodAL)
	signal wb_clear : std_logic;
	-- signal (CodAL)
	signal i_mem_rq_stall : std_logic;
	-- signal (CodAL)
	signal i_mem_rq_inv_stall : std_logic;
	-- signal (CodAL)
	signal i_mem_fr_stall : std_logic;
	-- signal (CodAL)
	signal d_mem_rq_stall : std_logic;
	-- signal (CodAL)
	signal d_mem_fr_stall : std_logic;
	-- signal (CodAL)
	signal d_mem_fw_stall : std_logic;
	-- signal (CodAL)
	signal ex_hazard_stall : std_logic;
	-- signal (CodAL)
	signal ex2_hazard_stall : std_logic;
	-- signal (inner)
	signal pipe_RD_stall : std_logic;
	-- signal (inner)
	signal pipe_RD_clear : std_logic;
	-- signal (inner)
	signal pipe_EX_stall : std_logic;
	-- signal (inner)
	signal pipe_EX_clear : std_logic;
	-- signal (inner)
	signal pipe_EX2_stall : std_logic;
	-- signal (inner)
	signal pipe_EX2_clear : std_logic;
	-- signal (inner)
	signal pipe_WB_stall : std_logic;
	-- signal (inner)
	signal pipe_WB_clear : std_logic;
	-- signal (inner)
	signal codasip_attribute_L_main_0_instr_hw_srcB_am_imm3_val_0 : std_logic_vector(2 downto 0);
	-- signal (inner)
	signal codasip_attribute_L_main_0_instr_hw_srcB_op_imm1_val_0 : std_logic;
	-- signal (inner)
	signal codasip_attribute_L_main_0_instr_hw_srcC_op_imm1_val_0 : std_logic;
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_cond_cond_cmp_0 : std_logic_vector(3 downto 0);
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0 : std_logic_vector(3 downto 0);
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0 : std_logic_vector(8 downto 0);
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_operation_opr_jump_call_0 : std_logic_vector(4 downto 0);
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0 : std_logic_vector(8 downto 0);
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0 : std_logic_vector(4 downto 0);
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0 : std_logic_vector(8 downto 0);
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_operation_opr_move_0 : std_logic_vector(4 downto 0);
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_operation_opr_st_imm_0 : std_logic_vector(4 downto 0);
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_operation_opr_st_reg_0 : std_logic_vector(8 downto 0);
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_operation_opr_system_0 : std_logic_vector(8 downto 0);
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_operation_opr_system_rd_0 : std_logic_vector(8 downto 0);
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_operation_opr_system_wr_0 : std_logic_vector(8 downto 0);
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_srcB_am_imm3_0 : std_logic_vector(2 downto 0);
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_srcB_op_imm1_0 : std_logic;
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_srcC_op_imm1_0 : std_logic;
	-- functional unit
	component codix_risc_ca_core_main_0_imm1_srcB_op_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_attribute_L_main_0_instr_hw_srcB_op_imm1_val_0_Q0 : in std_logic;
			codasip_instance_main_0_instr_hw_srcB_op_imm1_0_D0 : out std_logic
		);
	end component codix_risc_ca_core_main_0_imm1_srcB_op_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_imm1_srcC_op_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_attribute_L_main_0_instr_hw_srcC_op_imm1_val_0_Q0 : in std_logic;
			codasip_instance_main_0_instr_hw_srcC_op_imm1_0_D0 : out std_logic
		);
	end component codix_risc_ca_core_main_0_imm1_srcC_op_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_imm3_srcB_am_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_attribute_L_main_0_instr_hw_srcB_am_imm3_val_0_Q0 : in std_logic_vector(2 downto 0);
			codasip_instance_main_0_instr_hw_srcB_am_imm3_0_D0 : out std_logic_vector(2 downto 0)
		);
	end component codix_risc_ca_core_main_0_imm3_srcB_am_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_Q0 : in std_logic_vector(3 downto 0);
			rd_aluA_mux_D0 : out std_logic;
			rd_aluA_mux_WE0 : out std_logic;
			rd_aluB_mux_D0 : out std_logic_vector(2 downto 0);
			rd_aluB_mux_WE0 : out std_logic;
			rd_alu_op_D0 : out std_logic_vector(5 downto 0);
			rd_alu_op_WE0 : out std_logic;
			rd_amB_D0 : out std_logic_vector(2 downto 0);
			rd_amB_WE0 : out std_logic;
			rd_amC_D0 : out std_logic;
			rd_amC_WE0 : out std_logic;
			rd_cond_D0 : out std_logic_vector(4 downto 0);
			rd_cond_WE0 : out std_logic;
			rd_dest_en_mux_D0 : out std_logic_vector(1 downto 0);
			rd_dest_en_mux_WE0 : out std_logic;
			rd_ie_flag_D0 : out std_logic_vector(1 downto 0);
			rd_ie_flag_WE0 : out std_logic;
			rd_mem_rw_D0 : out std_logic_vector(3 downto 0);
			rd_mem_rw_WE0 : out std_logic
		);
	end component codix_risc_ca_core_main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_Q0 : in std_logic_vector(8 downto 0);
			codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0 : in std_logic_vector(2 downto 0);
			rd_aluA_mux_D0 : out std_logic;
			rd_aluA_mux_WE0 : out std_logic;
			rd_aluB_mux_D0 : out std_logic_vector(2 downto 0);
			rd_aluB_mux_WE0 : out std_logic;
			rd_alu_op_D0 : out std_logic_vector(5 downto 0);
			rd_alu_op_WE0 : out std_logic;
			rd_amB_D0 : out std_logic_vector(2 downto 0);
			rd_amB_WE0 : out std_logic;
			rd_amC_D0 : out std_logic;
			rd_amC_WE0 : out std_logic;
			rd_cond_D0 : out std_logic_vector(4 downto 0);
			rd_cond_WE0 : out std_logic;
			rd_dest_en_mux_D0 : out std_logic_vector(1 downto 0);
			rd_dest_en_mux_WE0 : out std_logic;
			rd_ie_flag_D0 : out std_logic_vector(1 downto 0);
			rd_ie_flag_WE0 : out std_logic;
			rd_mem_rw_D0 : out std_logic_vector(3 downto 0);
			rd_mem_rw_WE0 : out std_logic
		);
	end component codix_risc_ca_core_main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_Q0 : in std_logic_vector(4 downto 0);
			rd_aluA_mux_D0 : out std_logic;
			rd_aluA_mux_WE0 : out std_logic;
			rd_aluB_mux_D0 : out std_logic_vector(2 downto 0);
			rd_aluB_mux_WE0 : out std_logic;
			rd_alu_op_D0 : out std_logic_vector(5 downto 0);
			rd_alu_op_WE0 : out std_logic;
			rd_amB_D0 : out std_logic_vector(2 downto 0);
			rd_amB_WE0 : out std_logic;
			rd_amC_D0 : out std_logic;
			rd_amC_WE0 : out std_logic;
			rd_cond_D0 : out std_logic_vector(4 downto 0);
			rd_cond_WE0 : out std_logic;
			rd_dest_en_mux_D0 : out std_logic_vector(1 downto 0);
			rd_dest_en_mux_WE0 : out std_logic;
			rd_ie_flag_D0 : out std_logic_vector(1 downto 0);
			rd_ie_flag_WE0 : out std_logic;
			rd_mem_rw_D0 : out std_logic_vector(3 downto 0);
			rd_mem_rw_WE0 : out std_logic
		);
	end component codix_risc_ca_core_main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_Q0 : in std_logic_vector(8 downto 0);
			rd_aluA_mux_D0 : out std_logic;
			rd_aluA_mux_WE0 : out std_logic;
			rd_aluB_mux_D0 : out std_logic_vector(2 downto 0);
			rd_aluB_mux_WE0 : out std_logic;
			rd_alu_op_D0 : out std_logic_vector(5 downto 0);
			rd_alu_op_WE0 : out std_logic;
			rd_amB_D0 : out std_logic_vector(2 downto 0);
			rd_amB_WE0 : out std_logic;
			rd_amC_D0 : out std_logic;
			rd_amC_WE0 : out std_logic;
			rd_cond_D0 : out std_logic_vector(4 downto 0);
			rd_cond_WE0 : out std_logic;
			rd_dest_en_mux_D0 : out std_logic_vector(1 downto 0);
			rd_dest_en_mux_WE0 : out std_logic;
			rd_ie_flag_D0 : out std_logic_vector(1 downto 0);
			rd_ie_flag_WE0 : out std_logic;
			rd_mem_rw_D0 : out std_logic_vector(3 downto 0);
			rd_mem_rw_WE0 : out std_logic
		);
	end component codix_risc_ca_core_main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_Q0 : in std_logic_vector(3 downto 0);
			codasip_instance_main_0_instr_hw_srcB_op_imm1_0_Q0 : in std_logic;
			rd_aluA_mux_D0 : out std_logic;
			rd_aluA_mux_WE0 : out std_logic;
			rd_aluB_mux_D0 : out std_logic_vector(2 downto 0);
			rd_aluB_mux_WE0 : out std_logic;
			rd_alu_op_D0 : out std_logic_vector(5 downto 0);
			rd_alu_op_WE0 : out std_logic;
			rd_amB_D0 : out std_logic_vector(2 downto 0);
			rd_amB_WE0 : out std_logic;
			rd_amC_D0 : out std_logic;
			rd_amC_WE0 : out std_logic;
			rd_cond_D0 : out std_logic_vector(4 downto 0);
			rd_cond_WE0 : out std_logic;
			rd_dest_en_mux_D0 : out std_logic_vector(1 downto 0);
			rd_dest_en_mux_WE0 : out std_logic;
			rd_ie_flag_D0 : out std_logic_vector(1 downto 0);
			rd_ie_flag_WE0 : out std_logic;
			rd_mem_rw_D0 : out std_logic_vector(3 downto 0);
			rd_mem_rw_WE0 : out std_logic
		);
	end component codix_risc_ca_core_main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_Q0 : in std_logic_vector(4 downto 0);
			rd_aluA_mux_D0 : out std_logic;
			rd_aluA_mux_WE0 : out std_logic;
			rd_aluB_mux_D0 : out std_logic_vector(2 downto 0);
			rd_aluB_mux_WE0 : out std_logic;
			rd_alu_op_D0 : out std_logic_vector(5 downto 0);
			rd_alu_op_WE0 : out std_logic;
			rd_amB_D0 : out std_logic_vector(2 downto 0);
			rd_amB_WE0 : out std_logic;
			rd_amC_D0 : out std_logic;
			rd_amC_WE0 : out std_logic;
			rd_cond_D0 : out std_logic_vector(4 downto 0);
			rd_cond_WE0 : out std_logic;
			rd_dest_en_mux_D0 : out std_logic_vector(1 downto 0);
			rd_dest_en_mux_WE0 : out std_logic;
			rd_ie_flag_D0 : out std_logic_vector(1 downto 0);
			rd_ie_flag_WE0 : out std_logic;
			rd_mem_rw_D0 : out std_logic_vector(3 downto 0);
			rd_mem_rw_WE0 : out std_logic
		);
	end component codix_risc_ca_core_main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_Q0 : in std_logic_vector(8 downto 0);
			codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0 : in std_logic_vector(2 downto 0);
			rd_aluA_mux_D0 : out std_logic;
			rd_aluA_mux_WE0 : out std_logic;
			rd_aluB_mux_D0 : out std_logic_vector(2 downto 0);
			rd_aluB_mux_WE0 : out std_logic;
			rd_alu_op_D0 : out std_logic_vector(5 downto 0);
			rd_alu_op_WE0 : out std_logic;
			rd_amB_D0 : out std_logic_vector(2 downto 0);
			rd_amB_WE0 : out std_logic;
			rd_amC_D0 : out std_logic;
			rd_amC_WE0 : out std_logic;
			rd_cond_D0 : out std_logic_vector(4 downto 0);
			rd_cond_WE0 : out std_logic;
			rd_dest_en_mux_D0 : out std_logic_vector(1 downto 0);
			rd_dest_en_mux_WE0 : out std_logic;
			rd_ie_flag_D0 : out std_logic_vector(1 downto 0);
			rd_ie_flag_WE0 : out std_logic;
			rd_mem_rw_D0 : out std_logic_vector(3 downto 0);
			rd_mem_rw_WE0 : out std_logic
		);
	end component codix_risc_ca_core_main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_Q0 : in std_logic_vector(3 downto 0);
			codasip_instance_main_0_instr_hw_operation_opr_move_0_Q0 : in std_logic_vector(4 downto 0);
			codasip_instance_main_0_instr_hw_srcB_op_imm1_0_Q0 : in std_logic;
			codasip_instance_main_0_instr_hw_srcC_op_imm1_0_Q0 : in std_logic;
			rd_aluA_mux_D0 : out std_logic;
			rd_aluA_mux_WE0 : out std_logic;
			rd_aluB_mux_D0 : out std_logic_vector(2 downto 0);
			rd_aluB_mux_WE0 : out std_logic;
			rd_alu_op_D0 : out std_logic_vector(5 downto 0);
			rd_alu_op_WE0 : out std_logic;
			rd_amB_D0 : out std_logic_vector(2 downto 0);
			rd_amB_WE0 : out std_logic;
			rd_amC_D0 : out std_logic;
			rd_amC_WE0 : out std_logic;
			rd_cond_D0 : out std_logic_vector(4 downto 0);
			rd_cond_WE0 : out std_logic;
			rd_dest_en_mux_D0 : out std_logic_vector(1 downto 0);
			rd_dest_en_mux_WE0 : out std_logic;
			rd_ie_flag_D0 : out std_logic_vector(1 downto 0);
			rd_ie_flag_WE0 : out std_logic;
			rd_mem_rw_D0 : out std_logic_vector(3 downto 0);
			rd_mem_rw_WE0 : out std_logic
		);
	end component codix_risc_ca_core_main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_Q0 : in std_logic_vector(4 downto 0);
			rd_aluA_mux_D0 : out std_logic;
			rd_aluA_mux_WE0 : out std_logic;
			rd_aluB_mux_D0 : out std_logic_vector(2 downto 0);
			rd_aluB_mux_WE0 : out std_logic;
			rd_alu_op_D0 : out std_logic_vector(5 downto 0);
			rd_alu_op_WE0 : out std_logic;
			rd_amB_D0 : out std_logic_vector(2 downto 0);
			rd_amB_WE0 : out std_logic;
			rd_amC_D0 : out std_logic;
			rd_amC_WE0 : out std_logic;
			rd_cond_D0 : out std_logic_vector(4 downto 0);
			rd_cond_WE0 : out std_logic;
			rd_dest_en_mux_D0 : out std_logic_vector(1 downto 0);
			rd_dest_en_mux_WE0 : out std_logic;
			rd_ie_flag_D0 : out std_logic_vector(1 downto 0);
			rd_ie_flag_WE0 : out std_logic;
			rd_mem_rw_D0 : out std_logic_vector(3 downto 0);
			rd_mem_rw_WE0 : out std_logic
		);
	end component codix_risc_ca_core_main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_Q0 : in std_logic_vector(8 downto 0);
			codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0 : in std_logic_vector(2 downto 0);
			rd_aluA_mux_D0 : out std_logic;
			rd_aluA_mux_WE0 : out std_logic;
			rd_aluB_mux_D0 : out std_logic_vector(2 downto 0);
			rd_aluB_mux_WE0 : out std_logic;
			rd_alu_op_D0 : out std_logic_vector(5 downto 0);
			rd_alu_op_WE0 : out std_logic;
			rd_amB_D0 : out std_logic_vector(2 downto 0);
			rd_amB_WE0 : out std_logic;
			rd_amC_D0 : out std_logic;
			rd_amC_WE0 : out std_logic;
			rd_cond_D0 : out std_logic_vector(4 downto 0);
			rd_cond_WE0 : out std_logic;
			rd_dest_en_mux_D0 : out std_logic_vector(1 downto 0);
			rd_dest_en_mux_WE0 : out std_logic;
			rd_ie_flag_D0 : out std_logic_vector(1 downto 0);
			rd_ie_flag_WE0 : out std_logic;
			rd_mem_rw_D0 : out std_logic_vector(3 downto 0);
			rd_mem_rw_WE0 : out std_logic
		);
	end component codix_risc_ca_core_main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_system_0_Q0 : in std_logic_vector(8 downto 0);
			rd_aluA_mux_D0 : out std_logic;
			rd_aluA_mux_WE0 : out std_logic;
			rd_aluB_mux_D0 : out std_logic_vector(2 downto 0);
			rd_aluB_mux_WE0 : out std_logic;
			rd_alu_op_D0 : out std_logic_vector(5 downto 0);
			rd_alu_op_WE0 : out std_logic;
			rd_amB_D0 : out std_logic_vector(2 downto 0);
			rd_amB_WE0 : out std_logic;
			rd_amC_D0 : out std_logic;
			rd_amC_WE0 : out std_logic;
			rd_cond_D0 : out std_logic_vector(4 downto 0);
			rd_cond_WE0 : out std_logic;
			rd_dest_en_mux_D0 : out std_logic_vector(1 downto 0);
			rd_dest_en_mux_WE0 : out std_logic;
			rd_ie_flag_D0 : out std_logic_vector(1 downto 0);
			rd_ie_flag_WE0 : out std_logic;
			rd_mem_rw_D0 : out std_logic_vector(3 downto 0);
			rd_mem_rw_WE0 : out std_logic
		);
	end component codix_risc_ca_core_main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_system_rd_0_Q0 : in std_logic_vector(8 downto 0);
			rd_aluA_mux_D0 : out std_logic;
			rd_aluA_mux_WE0 : out std_logic;
			rd_aluB_mux_D0 : out std_logic_vector(2 downto 0);
			rd_aluB_mux_WE0 : out std_logic;
			rd_alu_op_D0 : out std_logic_vector(5 downto 0);
			rd_alu_op_WE0 : out std_logic;
			rd_amB_D0 : out std_logic_vector(2 downto 0);
			rd_amB_WE0 : out std_logic;
			rd_amC_D0 : out std_logic;
			rd_amC_WE0 : out std_logic;
			rd_cond_D0 : out std_logic_vector(4 downto 0);
			rd_cond_WE0 : out std_logic;
			rd_dest_en_mux_D0 : out std_logic_vector(1 downto 0);
			rd_dest_en_mux_WE0 : out std_logic;
			rd_ie_flag_D0 : out std_logic_vector(1 downto 0);
			rd_ie_flag_WE0 : out std_logic;
			rd_mem_rw_D0 : out std_logic_vector(3 downto 0);
			rd_mem_rw_WE0 : out std_logic
		);
	end component codix_risc_ca_core_main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_t
		port (
			ACT : in std_logic;
			rd_aluA_mux_D0 : out std_logic;
			rd_aluA_mux_WE0 : out std_logic;
			rd_aluB_mux_D0 : out std_logic_vector(2 downto 0);
			rd_aluB_mux_WE0 : out std_logic;
			rd_alu_op_D0 : out std_logic_vector(5 downto 0);
			rd_alu_op_WE0 : out std_logic;
			rd_amB_D0 : out std_logic_vector(2 downto 0);
			rd_amB_WE0 : out std_logic;
			rd_amC_D0 : out std_logic;
			rd_amC_WE0 : out std_logic;
			rd_cond_D0 : out std_logic_vector(4 downto 0);
			rd_cond_WE0 : out std_logic;
			rd_dest_en_mux_D0 : out std_logic_vector(1 downto 0);
			rd_dest_en_mux_WE0 : out std_logic;
			rd_ie_flag_D0 : out std_logic_vector(1 downto 0);
			rd_ie_flag_WE0 : out std_logic;
			rd_mem_rw_D0 : out std_logic_vector(3 downto 0);
			rd_mem_rw_WE0 : out std_logic
		);
	end component codix_risc_ca_core_main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_add_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_add_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_addadd_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_addadd_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_addi_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_addi_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_addmul_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_addmul_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_addsub_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_addsub_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_and_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_and_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_andi_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_andi_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_ashr_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_ashr_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_ashri_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_ashri_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_binand_cond_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_binand_cond_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_binnand_cond_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_binnand_cond_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_call_exc_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0 : out std_logic_vector(4 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_call_exc_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_call_int_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0 : out std_logic_vector(4 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_call_int_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_call_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0 : out std_logic_vector(4 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_call_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_call_reg_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_call_reg_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_ctlz_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_ctlz_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_cttz_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_cttz_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_eq_cond_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_eq_cond_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_get_status_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_system_wr_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_get_status_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_halt_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_system_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_halt_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_int_dis_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_system_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_int_dis_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_int_en_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_system_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_int_en_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_jump_ie_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_jump_ie_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_jump_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0 : out std_logic_vector(4 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_jump_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_jump_reg_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_jump_reg_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_ld_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0 : out std_logic_vector(4 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_ld_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_ldbs_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0 : out std_logic_vector(4 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_ldbs_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_ldbsx_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_ldbsx_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_ldbu_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0 : out std_logic_vector(4 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_ldbu_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_ldbux_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_ldbux_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_ldhs_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0 : out std_logic_vector(4 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_ldhs_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_ldhsx_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_ldhsx_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_ldhu_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0 : out std_logic_vector(4 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_ldhu_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_ldhux_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_ldhux_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_ldx_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_ldx_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_logand_cond_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_logand_cond_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_lognand_cond_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_lognand_cond_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_lognor_cond_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_lognor_cond_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_logor_cond_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_logor_cond_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_lshr_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_lshr_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_lshri_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_lshri_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_lui_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_lui_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_move_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_move_0_D0 : out std_logic_vector(4 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_move_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_mul_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_mul_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_mulsi_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_mulsi_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_mului_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_mului_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_ne_cond_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_ne_cond_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_nor_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_nor_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_nori_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_nori_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_or_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_or_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_ori_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_ori_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_printreg_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_system_rd_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_printreg_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_select_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_move_0_D0 : out std_logic_vector(4 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_select_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_set_status_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_system_rd_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_set_status_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_sext16_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_sext16_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_sext8_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_sext8_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_sge_cond_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_sge_cond_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_sgt_cond_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_sgt_cond_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_shl_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_shl_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_shli_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_shli_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_sle_cond_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_sle_cond_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_slt_cond_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_slt_cond_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_st_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_D0 : out std_logic_vector(4 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_st_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_stb_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_D0 : out std_logic_vector(4 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_stb_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_stbx_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_stbx_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_sth_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_D0 : out std_logic_vector(4 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_sth_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_sthx_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_sthx_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_stx_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_stx_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_sub_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_sub_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_subadd_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_subadd_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_subi_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_subi_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_submul_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_submul_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_subsub_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_subsub_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_test_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_move_0_D0 : out std_logic_vector(4 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_test_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_uge_cond_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_uge_cond_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_ugt_cond_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_ugt_cond_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_ule_cond_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_ule_cond_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_ult_cond_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_ult_cond_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_xor_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_xor_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_0_op_xori_operation_instr_hw_0_return_t
		port (
			ACT : in std_logic;
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 : out std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_0_op_xori_operation_instr_hw_0_return_t;

	-- functional unit
	component codix_risc_ca_core_main_alu_alu_fu_semantics_t
		port (
			ACT : in std_logic;
			ex_aluA_Q0 : in std_logic_vector(31 downto 0);
			ex_aluB_Q0 : in std_logic_vector(31 downto 0);
			ex_alu_add_D0 : out std_logic_vector(31 downto 0);
			ex_alu_add_Q0 : in std_logic_vector(31 downto 0);
			ex_alu_arith_D0 : out std_logic_vector(31 downto 0);
			ex_alu_logic_D0 : out std_logic_vector(31 downto 0);
			ex_alu_op_Q0 : in std_logic_vector(5 downto 0);
			int_enabled_Q0 : in std_logic
		);
	end component codix_risc_ca_core_main_alu_alu_fu_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_cond_compare_cond_compare_fu_semantics_t
		port (
			ACT : in std_logic;
			ex2_cmp_D0 : out std_logic;
			ex2_cmp_WE0 : out std_logic;
			ex_cmp_D0 : out std_logic;
			ex_cmp_Q0 : in std_logic;
			ex_cond_Q0 : in std_logic_vector(4 downto 0);
			ex_regA_Q0 : in std_logic_vector(31 downto 0);
			ex_regB_Q0 : in std_logic_vector(31 downto 0)
		);
	end component codix_risc_ca_core_main_cond_compare_cond_compare_fu_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_ex2_ex2_controller_semantics_t
		port (
			ACT : in std_logic;
			d_mem_fr_stall_Q0 : in std_logic;
			d_mem_fw_stall_D0 : out std_logic;
			d_mem_rq_stall_D0 : out std_logic;
			dbus_A0 : out std_logic_vector(31 downto 0);
			dbus_D0 : out std_logic_vector(31 downto 0);
			dbus_OFCMD0 : out std_logic_vector(2 downto 0);
			dbus_OFRESP0 : in std_logic_vector(2 downto 0);
			dbus_REQCMD0 : out std_logic_vector(2 downto 0);
			dbus_REQRESP0 : in std_logic_vector(2 downto 0);
			dbus_SC0 : out std_logic_vector(2 downto 0);
			dbus_SI0 : out std_logic_vector(1 downto 0);
			ex2_alu_Q0 : in std_logic_vector(31 downto 0);
			ex2_alu_op_Q0 : in std_logic_vector(5 downto 0);
			ex2_alu_wb_D0 : out std_logic_vector(31 downto 0);
			ex2_cmp_Q0 : in std_logic;
			ex2_dest_en_Q0 : in std_logic;
			ex2_mem_rw_Q0 : in std_logic_vector(3 downto 0);
			ex2_mem_wr_ack_D0 : out std_logic;
			ex2_mem_wr_ack_Q0 : in std_logic;
			ex2_mem_wr_ack_WE0 : out std_logic;
			ex2_mul_Q0 : in std_logic_vector(31 downto 0);
			ex2_rW_Q0 : in std_logic_vector(4 downto 0);
			ex2_regB_Q0 : in std_logic_vector(31 downto 0);
			ex2_regC_Q0 : in std_logic_vector(31 downto 0);
			i_mem_rq_inv_stall_D0 : out std_logic;
			port_error_D0 : out std_logic_vector(31 downto 0);
			wb_alu_D0 : out std_logic_vector(31 downto 0);
			wb_alu_WE0 : out std_logic;
			wb_alu_op_D0 : out std_logic_vector(5 downto 0);
			wb_alu_op_WE0 : out std_logic;
			wb_dest_en_D0 : out std_logic;
			wb_dest_en_WE0 : out std_logic;
			wb_mem_rw_D0 : out std_logic_vector(3 downto 0);
			wb_mem_rw_WE0 : out std_logic;
			wb_rW_D0 : out std_logic_vector(4 downto 0);
			wb_rW_WE0 : out std_logic
		);
	end component codix_risc_ca_core_main_ex2_ex2_controller_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_ex_ex_controller_semantics_t
		port (
			ACT : in std_logic;
			ex2_mul_D0 : out std_logic_vector(31 downto 0);
			ex2_mul_WE0 : out std_logic;
			ex_aluA_Q0 : in std_logic_vector(31 downto 0);
			ex_aluB_Q0 : in std_logic_vector(31 downto 0);
			ex_alu_op_Q0 : in std_logic_vector(5 downto 0);
			ex_ie_flag_Q0 : in std_logic_vector(1 downto 0);
			int_enabled_D0 : out std_logic;
			int_enabled_Q0 : in std_logic;
			int_enabled_WE0 : out std_logic
		);
	end component codix_risc_ca_core_main_ex_ex_controller_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_ex_output_ex_output_fu_semantics_t
		port (
			ACT : in std_logic;
			ex2_alu_D0 : out std_logic_vector(31 downto 0);
			ex2_alu_WE0 : out std_logic;
			ex2_alu_op_D0 : out std_logic_vector(5 downto 0);
			ex2_alu_op_WE0 : out std_logic;
			ex2_dest_en_D0 : out std_logic;
			ex2_dest_en_WE0 : out std_logic;
			ex2_mem_rw_D0 : out std_logic_vector(3 downto 0);
			ex2_mem_rw_WE0 : out std_logic;
			ex2_rW_D0 : out std_logic_vector(4 downto 0);
			ex2_rW_WE0 : out std_logic;
			ex2_regB_D0 : out std_logic_vector(31 downto 0);
			ex2_regB_WE0 : out std_logic;
			ex2_regC_D0 : out std_logic_vector(31 downto 0);
			ex2_regC_WE0 : out std_logic;
			ex_alu_arith_Q0 : in std_logic_vector(31 downto 0);
			ex_alu_op_Q0 : in std_logic_vector(5 downto 0);
			ex_cmp_Q0 : in std_logic;
			ex_dest_en_D0 : out std_logic;
			ex_dest_en_Q0 : in std_logic;
			ex_dest_en_mux_Q0 : in std_logic_vector(1 downto 0);
			ex_mem_rw_Q0 : in std_logic_vector(3 downto 0);
			ex_rW_Q0 : in std_logic_vector(4 downto 0);
			ex_regB_Q0 : in std_logic_vector(31 downto 0);
			ex_regC_Q0 : in std_logic_vector(31 downto 0)
		);
	end component codix_risc_ca_core_main_ex_output_ex_output_fu_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_fe_fe_controller_semantics_t
		port (
			ACT : in std_logic;
			ex2_mem_rw_Q0 : in std_logic_vector(3 downto 0);
			fe_stall_D0 : out std_logic;
			fe_stall_Q0 : in std_logic;
			i_mem_fr_stall_Q0 : in std_logic;
			i_mem_rq_stall_D0 : out std_logic;
			i_mem_rq_stall_Q0 : in std_logic;
			ibus_A0 : out std_logic_vector(31 downto 0);
			ibus_REQCMD0 : out std_logic_vector(2 downto 0);
			ibus_REQRESP0 : in std_logic_vector(2 downto 0);
			ibus_SC0 : out std_logic_vector(2 downto 0);
			ibus_SI0 : out std_logic_vector(1 downto 0);
			id_clear_reg_D0 : out std_logic;
			id_clear_reg_Q0 : in std_logic;
			id_clear_reg_WE0 : out std_logic;
			id_pc_D0 : out std_logic_vector(31 downto 0);
			id_pc_Q0 : in std_logic_vector(31 downto 0);
			id_pc_WE0 : out std_logic;
			id_stall_Q0 : in std_logic;
			id_stall_reg_D0 : out std_logic;
			id_stall_reg_Q0 : in std_logic;
			id_stall_reg_WE0 : out std_logic;
			pc_D0 : out std_logic_vector(31 downto 0);
			pc_Q0 : in std_logic_vector(31 downto 0);
			pc_WE0 : out std_logic;
			port_error_D0 : out std_logic_vector(31 downto 0);
			wb_pc_W_Q0 : in std_logic_vector(31 downto 0);
			wb_pc_we_Q0 : in std_logic
		);
	end component codix_risc_ca_core_main_fe_fe_controller_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_flow_logic_control_flow_logic_control_fu_semantics_t
		port (
			ACT : in std_logic;
			ex2_clear_Q0 : in std_logic;
			ex2_stall_Q0 : in std_logic;
			ex_clear_Q0 : in std_logic;
			ex_stall_Q0 : in std_logic;
			fe_stall_Q0 : in std_logic;
			id_clear_Q0 : in std_logic;
			id_stall_Q0 : in std_logic;
			pipe_EX2_clear_D0 : out std_logic;
			pipe_EX2_stall_D0 : out std_logic;
			pipe_EX_clear_D0 : out std_logic;
			pipe_EX_stall_D0 : out std_logic;
			pipe_RD_clear_D0 : out std_logic;
			pipe_RD_stall_D0 : out std_logic;
			pipe_WB_clear_D0 : out std_logic;
			pipe_WB_stall_D0 : out std_logic;
			rd_clear_Q0 : in std_logic;
			rd_stall_Q0 : in std_logic;
			wb_clear_Q0 : in std_logic;
			wb_stall_Q0 : in std_logic
		);
	end component codix_risc_ca_core_main_flow_logic_control_flow_logic_control_fu_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_fnc_ctrl_0_1_condition_t
		port (
			ACT : in std_logic;
			RET : out std_logic;
			ex_alu_op_Q0 : in std_logic_vector(5 downto 0)
		);
	end component codix_risc_ca_core_main_fnc_ctrl_0_1_condition_t;

	-- functional unit
	component codix_risc_ca_core_main_id_id_controller_semantics_t
		port (
			ACT : in std_logic;
			ex_alu_op_Q0 : in std_logic_vector(5 downto 0);
			ex_clear_D0 : out std_logic;
			ex_ie_flag_Q0 : in std_logic_vector(1 downto 0);
			ex_stall_Q0 : in std_logic;
			i_mem_fr_stall_D0 : out std_logic;
			ibus_IFCMD0 : out std_logic_vector(2 downto 0);
			ibus_IFRESP0 : in std_logic_vector(2 downto 0);
			ibus_Q0 : in std_logic_vector(31 downto 0);
			id_clear_D0 : out std_logic;
			id_clear_reg_Q0 : in std_logic;
			id_instr_D0 : out std_logic_vector(11 downto 0);
			id_pc_Q0 : in std_logic_vector(31 downto 0);
			id_stall_D0 : out std_logic;
			int_enabled_Q0 : in std_logic;
			irq_Q0 : in std_logic;
			port_error_D0 : out std_logic_vector(31 downto 0);
			rd_alu_op_Q0 : in std_logic_vector(5 downto 0);
			rd_clear_D0 : out std_logic;
			rd_ie_flag_Q0 : in std_logic_vector(1 downto 0);
			rd_mem_D0 : out std_logic_vector(31 downto 0);
			rd_mem_WE0 : out std_logic;
			rd_pc_D0 : out std_logic_vector(31 downto 0);
			rd_pc_WE0 : out std_logic;
			rd_stall_D0 : out std_logic;
			rd_stall_Q0 : in std_logic;
			wb_pc_we_Q0 : in std_logic
		);
	end component codix_risc_ca_core_main_id_id_controller_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_rd_rd_controller_semantics_t
		port (
			ACT : in std_logic;
			ex_aluA_D0 : out std_logic_vector(31 downto 0);
			ex_aluA_WE0 : out std_logic;
			ex_aluB_D0 : out std_logic_vector(31 downto 0);
			ex_aluB_WE0 : out std_logic;
			ex_alu_op_D0 : out std_logic_vector(5 downto 0);
			ex_alu_op_WE0 : out std_logic;
			ex_cond_D0 : out std_logic_vector(4 downto 0);
			ex_cond_WE0 : out std_logic;
			ex_dest_en_mux_D0 : out std_logic_vector(1 downto 0);
			ex_dest_en_mux_WE0 : out std_logic;
			ex_ie_flag_D0 : out std_logic_vector(1 downto 0);
			ex_ie_flag_WE0 : out std_logic;
			ex_mem_rw_D0 : out std_logic_vector(3 downto 0);
			ex_mem_rw_WE0 : out std_logic;
			ex_rW_D0 : out std_logic_vector(4 downto 0);
			ex_rW_WE0 : out std_logic;
			ex_regA_D0 : out std_logic_vector(31 downto 0);
			ex_regA_WE0 : out std_logic;
			ex_regB_D0 : out std_logic_vector(31 downto 0);
			ex_regB_WE0 : out std_logic;
			ex_regC_D0 : out std_logic_vector(31 downto 0);
			ex_regC_WE0 : out std_logic;
			rd_aluA_mux_Q0 : in std_logic;
			rd_aluB_mux_Q0 : in std_logic_vector(2 downto 0);
			rd_alu_op_Q0 : in std_logic_vector(5 downto 0);
			rd_amB_Q0 : in std_logic_vector(2 downto 0);
			rd_amC_Q0 : in std_logic;
			rd_cond_Q0 : in std_logic_vector(4 downto 0);
			rd_dest_en_mux_Q0 : in std_logic_vector(1 downto 0);
			rd_ie_flag_Q0 : in std_logic_vector(1 downto 0);
			rd_imm_D0 : out std_logic_vector(15 downto 0);
			rd_imm_Q0 : in std_logic_vector(15 downto 0);
			rd_jump_abs_D0 : out std_logic_vector(25 downto 0);
			rd_jump_abs_Q0 : in std_logic_vector(25 downto 0);
			rd_jump_rel_D0 : out std_logic_vector(13 downto 0);
			rd_jump_rel_Q0 : in std_logic_vector(13 downto 0);
			rd_mem_Q0 : in std_logic_vector(31 downto 0);
			rd_mem_rw_Q0 : in std_logic_vector(3 downto 0);
			rd_pc_Q0 : in std_logic_vector(31 downto 0);
			rd_rA_D0 : out std_logic_vector(4 downto 0);
			rd_rA_Q0 : in std_logic_vector(4 downto 0);
			rd_rB_D0 : out std_logic_vector(4 downto 0);
			rd_rB_Q0 : in std_logic_vector(4 downto 0);
			rd_rC_D0 : out std_logic_vector(4 downto 0);
			rd_rC_Q0 : in std_logic_vector(4 downto 0);
			rd_rW_D0 : out std_logic_vector(4 downto 0);
			rd_rW_Q0 : in std_logic_vector(4 downto 0);
			rd_store_D0 : out std_logic_vector(15 downto 0);
			rd_store_Q0 : in std_logic_vector(15 downto 0);
			regs_Q0 : in std_logic_vector(31 downto 0);
			regs_Q1 : in std_logic_vector(31 downto 0);
			regs_Q2 : in std_logic_vector(31 downto 0);
			regs_RA0 : out std_logic_vector(4 downto 0);
			regs_RA1 : out std_logic_vector(4 downto 0);
			regs_RA2 : out std_logic_vector(4 downto 0);
			regs_RE0 : out std_logic;
			regs_RE1 : out std_logic;
			regs_RE2 : out std_logic;
			wb_regs_W_Q0 : in std_logic_vector(31 downto 0);
			wb_regs_addrW_Q0 : in std_logic_vector(4 downto 0);
			wb_regs_we_Q0 : in std_logic
		);
	end component codix_risc_ca_core_main_rd_rd_controller_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_reset_fu_semantics_t
		port (
			ACT : in std_logic;
			IRST_D0 : out std_logic;
			RST : in std_logic
		);
	end component codix_risc_ca_core_main_reset_fu_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_wb_output_wb_output_fu_semantics_t
		port (
			ACT : in std_logic;
			d_mem_fr_stall_Q0 : in std_logic;
			d_mem_fw_stall_Q0 : in std_logic;
			d_mem_rq_stall_Q0 : in std_logic;
			ex2_alu_op_Q0 : in std_logic_vector(5 downto 0);
			ex2_alu_wb_Q0 : in std_logic_vector(31 downto 0);
			ex2_clear_D0 : out std_logic;
			ex2_dest_en_Q0 : in std_logic;
			ex2_hazard_stall_D0 : out std_logic;
			ex2_hazard_stall_Q0 : in std_logic;
			ex2_mul_Q0 : in std_logic_vector(31 downto 0);
			ex2_rW_Q0 : in std_logic_vector(4 downto 0);
			ex2_stall_D0 : out std_logic;
			ex2_stall_Q0 : in std_logic;
			ex_aluB_Q0 : in std_logic_vector(31 downto 0);
			ex_alu_add_Q0 : in std_logic_vector(31 downto 0);
			ex_alu_logic_Q0 : in std_logic_vector(31 downto 0);
			ex_alu_op_Q0 : in std_logic_vector(5 downto 0);
			ex_dest_en_Q0 : in std_logic;
			ex_hazard_stall_D0 : out std_logic;
			ex_hazard_stall_Q0 : in std_logic;
			ex_rW_Q0 : in std_logic_vector(4 downto 0);
			ex_stall_D0 : out std_logic;
			ex_stall_Q0 : in std_logic;
			i_mem_rq_inv_stall_Q0 : in std_logic;
			port_halt_D0 : out std_logic;
			port_out_D0 : out std_logic_vector(31 downto 0);
			port_out_en_D0 : out std_logic;
			regs_D0 : out std_logic_vector(31 downto 0);
			regs_WA0 : out std_logic_vector(4 downto 0);
			regs_WE0 : out std_logic;
			wb_alu_Q0 : in std_logic_vector(31 downto 0);
			wb_alu_op_Q0 : in std_logic_vector(5 downto 0);
			wb_clear_D0 : out std_logic;
			wb_dest_en_Q0 : in std_logic;
			wb_mem_Q0 : in std_logic_vector(31 downto 0);
			wb_pc_W_D0 : out std_logic_vector(31 downto 0);
			wb_pc_we_D0 : out std_logic;
			wb_pc_we_Q0 : in std_logic;
			wb_rW_Q0 : in std_logic_vector(4 downto 0);
			wb_regs_W_D0 : out std_logic_vector(31 downto 0);
			wb_regs_W_Q0 : in std_logic_vector(31 downto 0);
			wb_regs_addrW_D0 : out std_logic_vector(4 downto 0);
			wb_regs_addrW_Q0 : in std_logic_vector(4 downto 0);
			wb_regs_we_D0 : out std_logic;
			wb_regs_we_Q0 : in std_logic;
			wb_stall_D0 : out std_logic;
			wb_stall_Q0 : in std_logic
		);
	end component codix_risc_ca_core_main_wb_output_wb_output_fu_semantics_t;

	-- functional unit
	component codix_risc_ca_core_main_wb_wb_controller_semantics_t
		port (
			ACT : in std_logic;
			d_mem_fr_stall_D0 : out std_logic;
			dbus_IFCMD0 : out std_logic_vector(2 downto 0);
			dbus_IFRESP0 : in std_logic_vector(2 downto 0);
			dbus_Q0 : in std_logic_vector(31 downto 0);
			port_error_D0 : out std_logic_vector(31 downto 0);
			wb_mem_D0 : out std_logic_vector(31 downto 0);
			wb_mem_rw_Q0 : in std_logic_vector(3 downto 0)
		);
	end component codix_risc_ca_core_main_wb_wb_controller_semantics_t;

	-- instruction decoder
	component codix_risc_ca_core_main_instr_hw_instr_hw_t
		port (
			ACT : in std_logic;
			codasip_attribute_L_main_0_instr_hw_srcB_am_imm3_val_0_D0 : out std_logic_vector(2 downto 0);
			codasip_attribute_L_main_0_instr_hw_srcB_op_imm1_val_0_D0 : out std_logic;
			codasip_attribute_L_main_0_instr_hw_srcC_op_imm1_val_0_D0 : out std_logic;
			id_instr_Q0 : in std_logic_vector(11 downto 0);
			invalid_instruction : out std_logic;
			main_0_imm1_srcB_op_instr_hw_0_return_ACT : out std_logic;
			main_0_imm1_srcC_op_instr_hw_0_return_ACT : out std_logic;
			main_0_imm3_srcB_am_instr_hw_0_return_ACT : out std_logic;
			main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
			main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
			main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
			main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
			main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
			main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
			main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
			main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
			main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
			main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
			main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
			main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
			main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
			main_0_op_add_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_addadd_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_addi_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_addmul_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_addsub_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_and_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_andi_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_ashr_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_ashri_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_binand_cond_instr_hw_0_return_ACT : out std_logic;
			main_0_op_binnand_cond_instr_hw_0_return_ACT : out std_logic;
			main_0_op_call_exc_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_call_int_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_call_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_call_reg_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_ctlz_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_cttz_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_eq_cond_instr_hw_0_return_ACT : out std_logic;
			main_0_op_get_status_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_halt_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_int_dis_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_int_en_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_jump_ie_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_jump_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_jump_reg_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_ld_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_ldbs_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_ldbsx_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_ldbu_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_ldbux_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_ldhs_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_ldhsx_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_ldhu_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_ldhux_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_ldx_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_logand_cond_instr_hw_0_return_ACT : out std_logic;
			main_0_op_lognand_cond_instr_hw_0_return_ACT : out std_logic;
			main_0_op_lognor_cond_instr_hw_0_return_ACT : out std_logic;
			main_0_op_logor_cond_instr_hw_0_return_ACT : out std_logic;
			main_0_op_lshr_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_lshri_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_lui_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_move_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_mul_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_mulsi_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_mului_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_ne_cond_instr_hw_0_return_ACT : out std_logic;
			main_0_op_nor_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_nori_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_or_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_ori_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_printreg_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_select_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_set_status_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_sext16_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_sext8_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_sge_cond_instr_hw_0_return_ACT : out std_logic;
			main_0_op_sgt_cond_instr_hw_0_return_ACT : out std_logic;
			main_0_op_shl_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_shli_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_sle_cond_instr_hw_0_return_ACT : out std_logic;
			main_0_op_slt_cond_instr_hw_0_return_ACT : out std_logic;
			main_0_op_st_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_stb_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_stbx_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_sth_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_sthx_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_stx_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_sub_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_subadd_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_subi_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_submul_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_subsub_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_test_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_uge_cond_instr_hw_0_return_ACT : out std_logic;
			main_0_op_ugt_cond_instr_hw_0_return_ACT : out std_logic;
			main_0_op_ule_cond_instr_hw_0_return_ACT : out std_logic;
			main_0_op_ult_cond_instr_hw_0_return_ACT : out std_logic;
			main_0_op_xor_operation_instr_hw_0_return_ACT : out std_logic;
			main_0_op_xori_operation_instr_hw_0_return_ACT : out std_logic
		);
	end component codix_risc_ca_core_main_instr_hw_instr_hw_t;

	-- controller encapsulation
	component codix_risc_ca_core_main_controller_t
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
	end component codix_risc_ca_core_main_controller_t;


		-- instances connection signals
	signal main_fe_fe_controller_semantics_pc_Q0_0 : std_logic_vector(31 downto 0);
	signal main_fe_fe_controller_semantics_pc_D0_1 : std_logic_vector(31 downto 0);
	signal main_fe_fe_controller_semantics_pc_WE0_2 : std_logic;
	signal main_rd_rd_controller_semantics_regs_Q0_3 : std_logic_vector(31 downto 0);
	signal main_rd_rd_controller_semantics_regs_RA0_4 : std_logic_vector(4 downto 0);
	signal main_rd_rd_controller_semantics_regs_RE0_5 : std_logic;
	signal main_rd_rd_controller_semantics_regs_Q1_6 : std_logic_vector(31 downto 0);
	signal main_rd_rd_controller_semantics_regs_RA1_7 : std_logic_vector(4 downto 0);
	signal main_rd_rd_controller_semantics_regs_RE1_8 : std_logic;
	signal main_rd_rd_controller_semantics_regs_Q2_9 : std_logic_vector(31 downto 0);
	signal main_rd_rd_controller_semantics_regs_RA2_10 : std_logic_vector(4 downto 0);
	signal main_rd_rd_controller_semantics_regs_RE2_11 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_regs_D0_12 : std_logic_vector(31 downto 0);
	signal main_wb_output_wb_output_fu_semantics_regs_WA0_13 : std_logic_vector(4 downto 0);
	signal main_wb_output_wb_output_fu_semantics_regs_WE0_14 : std_logic;
	signal int_enabled_Q0_15 : std_logic;
	signal main_alu_alu_fu_semantics_int_enabled_Q0_16 : std_logic;
	signal main_ex_ex_controller_semantics_int_enabled_Q0_17 : std_logic;
	signal main_id_id_controller_semantics_int_enabled_Q0_18 : std_logic;
	signal main_ex_ex_controller_semantics_int_enabled_D0_19 : std_logic;
	signal main_ex_ex_controller_semantics_int_enabled_WE0_20 : std_logic;
	signal id_pc_Q0_21 : std_logic_vector(31 downto 0);
	signal main_fe_fe_controller_semantics_id_pc_Q0_22 : std_logic_vector(31 downto 0);
	signal main_id_id_controller_semantics_id_pc_Q0_23 : std_logic_vector(31 downto 0);
	signal main_fe_fe_controller_semantics_id_pc_D0_24 : std_logic_vector(31 downto 0);
	signal main_fe_fe_controller_semantics_id_pc_WE0_25 : std_logic;
	signal main_instr_hw_instr_hw_id_instr_Q0_26 : std_logic_vector(11 downto 0);
	signal main_id_id_controller_semantics_id_instr_D0_27 : std_logic_vector(11 downto 0);
	signal pipe_RD_clear_Q0_28 : std_logic;
	signal pipe_RD_stall_Q0_29 : std_logic;
	signal main_rd_rd_controller_semantics_rd_mem_rw_Q0_30 : std_logic_vector(3 downto 0);
	signal rd_mem_rw_D0_31 : std_logic_vector(3 downto 0);
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_32 : std_logic_vector(3 downto 0);
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_33 : std_logic_vector(3 downto 0);
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_34 : std_logic_vector(3 downto 0);
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_35 : std_logic_vector(3 downto 0);
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_36 : std_logic_vector(3 downto 0);
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_37 : std_logic_vector(3 downto 0);
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_38 : std_logic_vector(3 downto 0);
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_39 : std_logic_vector(3 downto 0);
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_40 : std_logic_vector(3 downto 0);
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_41 : std_logic_vector(3 downto 0);
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_42 : std_logic_vector(3 downto 0);
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_43 : std_logic_vector(3 downto 0);
	signal main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_44 : std_logic_vector(3 downto 0);
	signal rd_mem_rw_WE0_45 : std_logic;
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_46 : std_logic;
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_47 : std_logic;
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_48 : std_logic;
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_49 : std_logic;
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_50 : std_logic;
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_51 : std_logic;
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_52 : std_logic;
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_53 : std_logic;
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_54 : std_logic;
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_55 : std_logic;
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_56 : std_logic;
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_57 : std_logic;
	signal main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_58 : std_logic;
	signal pipe_RD_clear_Q0_59 : std_logic;
	signal pipe_RD_stall_Q0_60 : std_logic;
	signal rd_alu_op_Q0_61 : std_logic_vector(5 downto 0);
	signal main_id_id_controller_semantics_rd_alu_op_Q0_62 : std_logic_vector(5 downto 0);
	signal main_rd_rd_controller_semantics_rd_alu_op_Q0_63 : std_logic_vector(5 downto 0);
	signal rd_alu_op_D0_64 : std_logic_vector(5 downto 0);
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_65 : std_logic_vector(5 downto 0);
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_66 : std_logic_vector(5 downto 0);
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_67 : std_logic_vector(5 downto 0);
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_68 : std_logic_vector(5 downto 0);
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_69 : std_logic_vector(5 downto 0);
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_70 : std_logic_vector(5 downto 0);
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_71 : std_logic_vector(5 downto 0);
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_72 : std_logic_vector(5 downto 0);
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_73 : std_logic_vector(5 downto 0);
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_74 : std_logic_vector(5 downto 0);
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_75 : std_logic_vector(5 downto 0);
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_76 : std_logic_vector(5 downto 0);
	signal main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_77 : std_logic_vector(5 downto 0);
	signal rd_alu_op_WE0_78 : std_logic;
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_79 : std_logic;
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_80 : std_logic;
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_81 : std_logic;
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_82 : std_logic;
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_83 : std_logic;
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_84 : std_logic;
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_85 : std_logic;
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_86 : std_logic;
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_87 : std_logic;
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_88 : std_logic;
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_89 : std_logic;
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_90 : std_logic;
	signal main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_91 : std_logic;
	signal pipe_RD_clear_Q0_92 : std_logic;
	signal pipe_RD_stall_Q0_93 : std_logic;
	signal main_rd_rd_controller_semantics_rd_cond_Q0_94 : std_logic_vector(4 downto 0);
	signal rd_cond_D0_95 : std_logic_vector(4 downto 0);
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_cond_D0_96 : std_logic_vector(4 downto 0);
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_cond_D0_97 : std_logic_vector(4 downto 0);
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_cond_D0_98 : std_logic_vector(4 downto 0);
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_cond_D0_99 : std_logic_vector(4 downto 0);
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_cond_D0_100 : std_logic_vector(4 downto 0);
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_cond_D0_101 : std_logic_vector(4 downto 0);
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_cond_D0_102 : std_logic_vector(4 downto 0);
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_cond_D0_103 : std_logic_vector(4 downto 0);
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_cond_D0_104 : std_logic_vector(4 downto 0);
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_cond_D0_105 : std_logic_vector(4 downto 0);
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_cond_D0_106 : std_logic_vector(4 downto 0);
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_cond_D0_107 : std_logic_vector(4 downto 0);
	signal main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_cond_D0_108 : std_logic_vector(4 downto 0);
	signal rd_cond_WE0_109 : std_logic;
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_cond_WE0_110 : std_logic;
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_cond_WE0_111 : std_logic;
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_cond_WE0_112 : std_logic;
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_cond_WE0_113 : std_logic;
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_cond_WE0_114 : std_logic;
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_cond_WE0_115 : std_logic;
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_cond_WE0_116 : std_logic;
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_cond_WE0_117 : std_logic;
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_cond_WE0_118 : std_logic;
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_cond_WE0_119 : std_logic;
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_cond_WE0_120 : std_logic;
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_cond_WE0_121 : std_logic;
	signal main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_cond_WE0_122 : std_logic;
	signal pipe_RD_clear_Q0_123 : std_logic;
	signal pipe_RD_stall_Q0_124 : std_logic;
	signal main_rd_rd_controller_semantics_rd_dest_en_mux_Q0_125 : std_logic_vector(1 downto 0);
	signal rd_dest_en_mux_D0_126 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_127 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_128 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_129 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_130 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_131 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_132 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_133 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_134 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_135 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_136 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_137 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_138 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_139 : std_logic_vector(1 downto 0);
	signal rd_dest_en_mux_WE0_140 : std_logic;
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_141 : std_logic;
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_142 : std_logic;
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_143 : std_logic;
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_144 : std_logic;
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_145 : std_logic;
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_146 : std_logic;
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_147 : std_logic;
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_148 : std_logic;
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_149 : std_logic;
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_150 : std_logic;
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_151 : std_logic;
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_152 : std_logic;
	signal main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_153 : std_logic;
	signal pipe_RD_clear_Q0_154 : std_logic;
	signal pipe_RD_stall_Q0_155 : std_logic;
	signal rd_ie_flag_Q0_156 : std_logic_vector(1 downto 0);
	signal main_id_id_controller_semantics_rd_ie_flag_Q0_157 : std_logic_vector(1 downto 0);
	signal main_rd_rd_controller_semantics_rd_ie_flag_Q0_158 : std_logic_vector(1 downto 0);
	signal rd_ie_flag_D0_159 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_160 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_161 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_162 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_163 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_164 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_165 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_166 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_167 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_168 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_169 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_170 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_171 : std_logic_vector(1 downto 0);
	signal main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_172 : std_logic_vector(1 downto 0);
	signal rd_ie_flag_WE0_173 : std_logic;
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_174 : std_logic;
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_175 : std_logic;
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_176 : std_logic;
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_177 : std_logic;
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_178 : std_logic;
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_179 : std_logic;
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_180 : std_logic;
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_181 : std_logic;
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_182 : std_logic;
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_183 : std_logic;
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_184 : std_logic;
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_185 : std_logic;
	signal main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_186 : std_logic;
	signal pipe_RD_clear_Q0_187 : std_logic;
	signal pipe_RD_stall_Q0_188 : std_logic;
	signal main_rd_rd_controller_semantics_rd_aluA_mux_Q0_189 : std_logic;
	signal rd_aluA_mux_D0_190 : std_logic;
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_191 : std_logic;
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_192 : std_logic;
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_193 : std_logic;
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_194 : std_logic;
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_195 : std_logic;
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_196 : std_logic;
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_197 : std_logic;
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_198 : std_logic;
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_199 : std_logic;
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_200 : std_logic;
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_201 : std_logic;
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_202 : std_logic;
	signal main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_203 : std_logic;
	signal rd_aluA_mux_WE0_204 : std_logic;
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_205 : std_logic;
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_206 : std_logic;
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_207 : std_logic;
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_208 : std_logic;
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_209 : std_logic;
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_210 : std_logic;
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_211 : std_logic;
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_212 : std_logic;
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_213 : std_logic;
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_214 : std_logic;
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_215 : std_logic;
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_216 : std_logic;
	signal main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_217 : std_logic;
	signal pipe_RD_clear_Q0_218 : std_logic;
	signal pipe_RD_stall_Q0_219 : std_logic;
	signal main_rd_rd_controller_semantics_rd_aluB_mux_Q0_220 : std_logic_vector(2 downto 0);
	signal rd_aluB_mux_D0_221 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_222 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_223 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_224 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_225 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_226 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_227 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_228 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_229 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_230 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_231 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_232 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_233 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_234 : std_logic_vector(2 downto 0);
	signal rd_aluB_mux_WE0_235 : std_logic;
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_236 : std_logic;
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_237 : std_logic;
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_238 : std_logic;
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_239 : std_logic;
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_240 : std_logic;
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_241 : std_logic;
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_242 : std_logic;
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_243 : std_logic;
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_244 : std_logic;
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_245 : std_logic;
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_246 : std_logic;
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_247 : std_logic;
	signal main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_248 : std_logic;
	signal pipe_RD_clear_Q0_249 : std_logic;
	signal pipe_RD_stall_Q0_250 : std_logic;
	signal main_rd_rd_controller_semantics_rd_amB_Q0_251 : std_logic_vector(2 downto 0);
	signal rd_amB_D0_252 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_amB_D0_253 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_amB_D0_254 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_amB_D0_255 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_amB_D0_256 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_amB_D0_257 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_amB_D0_258 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_amB_D0_259 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_amB_D0_260 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_amB_D0_261 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_amB_D0_262 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_amB_D0_263 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_amB_D0_264 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_amB_D0_265 : std_logic_vector(2 downto 0);
	signal rd_amB_WE0_266 : std_logic;
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_amB_WE0_267 : std_logic;
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_amB_WE0_268 : std_logic;
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_amB_WE0_269 : std_logic;
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_amB_WE0_270 : std_logic;
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_amB_WE0_271 : std_logic;
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_amB_WE0_272 : std_logic;
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_amB_WE0_273 : std_logic;
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_amB_WE0_274 : std_logic;
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_amB_WE0_275 : std_logic;
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_amB_WE0_276 : std_logic;
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_amB_WE0_277 : std_logic;
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_amB_WE0_278 : std_logic;
	signal main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_amB_WE0_279 : std_logic;
	signal pipe_RD_clear_Q0_280 : std_logic;
	signal pipe_RD_stall_Q0_281 : std_logic;
	signal main_rd_rd_controller_semantics_rd_amC_Q0_282 : std_logic;
	signal rd_amC_D0_283 : std_logic;
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_amC_D0_284 : std_logic;
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_amC_D0_285 : std_logic;
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_amC_D0_286 : std_logic;
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_amC_D0_287 : std_logic;
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_amC_D0_288 : std_logic;
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_amC_D0_289 : std_logic;
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_amC_D0_290 : std_logic;
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_amC_D0_291 : std_logic;
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_amC_D0_292 : std_logic;
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_amC_D0_293 : std_logic;
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_amC_D0_294 : std_logic;
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_amC_D0_295 : std_logic;
	signal main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_amC_D0_296 : std_logic;
	signal rd_amC_WE0_297 : std_logic;
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_amC_WE0_298 : std_logic;
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_amC_WE0_299 : std_logic;
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_amC_WE0_300 : std_logic;
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_amC_WE0_301 : std_logic;
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_amC_WE0_302 : std_logic;
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_amC_WE0_303 : std_logic;
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_amC_WE0_304 : std_logic;
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_amC_WE0_305 : std_logic;
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_amC_WE0_306 : std_logic;
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_amC_WE0_307 : std_logic;
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_amC_WE0_308 : std_logic;
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_amC_WE0_309 : std_logic;
	signal main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_amC_WE0_310 : std_logic;
	signal pipe_RD_clear_Q0_311 : std_logic;
	signal pipe_RD_stall_Q0_312 : std_logic;
	signal main_rd_rd_controller_semantics_rd_mem_Q0_313 : std_logic_vector(31 downto 0);
	signal main_id_id_controller_semantics_rd_mem_D0_314 : std_logic_vector(31 downto 0);
	signal main_id_id_controller_semantics_rd_mem_WE0_315 : std_logic;
	signal pipe_RD_clear_Q0_316 : std_logic;
	signal pipe_RD_stall_Q0_317 : std_logic;
	signal main_rd_rd_controller_semantics_rd_pc_Q0_318 : std_logic_vector(31 downto 0);
	signal main_id_id_controller_semantics_rd_pc_D0_319 : std_logic_vector(31 downto 0);
	signal main_id_id_controller_semantics_rd_pc_WE0_320 : std_logic;
	signal main_rd_rd_controller_semantics_rd_rA_Q0_321 : std_logic_vector(4 downto 0);
	signal main_rd_rd_controller_semantics_rd_rA_D0_322 : std_logic_vector(4 downto 0);
	signal main_rd_rd_controller_semantics_rd_rB_Q0_323 : std_logic_vector(4 downto 0);
	signal main_rd_rd_controller_semantics_rd_rB_D0_324 : std_logic_vector(4 downto 0);
	signal main_rd_rd_controller_semantics_rd_rC_Q0_325 : std_logic_vector(4 downto 0);
	signal main_rd_rd_controller_semantics_rd_rC_D0_326 : std_logic_vector(4 downto 0);
	signal main_rd_rd_controller_semantics_rd_rW_Q0_327 : std_logic_vector(4 downto 0);
	signal main_rd_rd_controller_semantics_rd_rW_D0_328 : std_logic_vector(4 downto 0);
	signal main_rd_rd_controller_semantics_rd_jump_abs_Q0_329 : std_logic_vector(25 downto 0);
	signal main_rd_rd_controller_semantics_rd_jump_abs_D0_330 : std_logic_vector(25 downto 0);
	signal main_rd_rd_controller_semantics_rd_jump_rel_Q0_331 : std_logic_vector(13 downto 0);
	signal main_rd_rd_controller_semantics_rd_jump_rel_D0_332 : std_logic_vector(13 downto 0);
	signal main_rd_rd_controller_semantics_rd_store_Q0_333 : std_logic_vector(15 downto 0);
	signal main_rd_rd_controller_semantics_rd_store_D0_334 : std_logic_vector(15 downto 0);
	signal main_rd_rd_controller_semantics_rd_imm_Q0_335 : std_logic_vector(15 downto 0);
	signal main_rd_rd_controller_semantics_rd_imm_D0_336 : std_logic_vector(15 downto 0);
	signal pipe_EX_clear_Q0_337 : std_logic;
	signal pipe_EX_stall_Q0_338 : std_logic;
	signal main_ex_output_ex_output_fu_semantics_ex_mem_rw_Q0_339 : std_logic_vector(3 downto 0);
	signal main_rd_rd_controller_semantics_ex_mem_rw_D0_340 : std_logic_vector(3 downto 0);
	signal main_rd_rd_controller_semantics_ex_mem_rw_WE0_341 : std_logic;
	signal pipe_EX_clear_Q0_342 : std_logic;
	signal pipe_EX_stall_Q0_343 : std_logic;
	signal ex_alu_op_Q0_344 : std_logic_vector(5 downto 0);
	signal main_alu_alu_fu_semantics_ex_alu_op_Q0_345 : std_logic_vector(5 downto 0);
	signal main_ex_ex_controller_semantics_ex_alu_op_Q0_346 : std_logic_vector(5 downto 0);
	signal main_ex_output_ex_output_fu_semantics_ex_alu_op_Q0_347 : std_logic_vector(5 downto 0);
	signal main_fnc_ctrl_0_1_condition_ex_alu_op_Q0_348 : std_logic_vector(5 downto 0);
	signal main_id_id_controller_semantics_ex_alu_op_Q0_349 : std_logic_vector(5 downto 0);
	signal main_wb_output_wb_output_fu_semantics_ex_alu_op_Q0_350 : std_logic_vector(5 downto 0);
	signal main_rd_rd_controller_semantics_ex_alu_op_D0_351 : std_logic_vector(5 downto 0);
	signal main_rd_rd_controller_semantics_ex_alu_op_WE0_352 : std_logic;
	signal pipe_EX_clear_Q0_353 : std_logic;
	signal pipe_EX_stall_Q0_354 : std_logic;
	signal main_cond_compare_cond_compare_fu_semantics_ex_cond_Q0_355 : std_logic_vector(4 downto 0);
	signal main_rd_rd_controller_semantics_ex_cond_D0_356 : std_logic_vector(4 downto 0);
	signal main_rd_rd_controller_semantics_ex_cond_WE0_357 : std_logic;
	signal pipe_EX_clear_Q0_358 : std_logic;
	signal pipe_EX_stall_Q0_359 : std_logic;
	signal main_ex_output_ex_output_fu_semantics_ex_dest_en_mux_Q0_360 : std_logic_vector(1 downto 0);
	signal main_rd_rd_controller_semantics_ex_dest_en_mux_D0_361 : std_logic_vector(1 downto 0);
	signal main_rd_rd_controller_semantics_ex_dest_en_mux_WE0_362 : std_logic;
	signal pipe_EX_clear_Q0_363 : std_logic;
	signal pipe_EX_stall_Q0_364 : std_logic;
	signal ex_ie_flag_Q0_365 : std_logic_vector(1 downto 0);
	signal main_ex_ex_controller_semantics_ex_ie_flag_Q0_366 : std_logic_vector(1 downto 0);
	signal main_id_id_controller_semantics_ex_ie_flag_Q0_367 : std_logic_vector(1 downto 0);
	signal main_rd_rd_controller_semantics_ex_ie_flag_D0_368 : std_logic_vector(1 downto 0);
	signal main_rd_rd_controller_semantics_ex_ie_flag_WE0_369 : std_logic;
	signal pipe_EX_clear_Q0_370 : std_logic;
	signal pipe_EX_stall_Q0_371 : std_logic;
	signal main_cond_compare_cond_compare_fu_semantics_ex_regA_Q0_372 : std_logic_vector(31 downto 0);
	signal main_rd_rd_controller_semantics_ex_regA_D0_373 : std_logic_vector(31 downto 0);
	signal main_rd_rd_controller_semantics_ex_regA_WE0_374 : std_logic;
	signal pipe_EX_clear_Q0_375 : std_logic;
	signal pipe_EX_stall_Q0_376 : std_logic;
	signal ex_regB_Q0_377 : std_logic_vector(31 downto 0);
	signal main_cond_compare_cond_compare_fu_semantics_ex_regB_Q0_378 : std_logic_vector(31 downto 0);
	signal main_ex_output_ex_output_fu_semantics_ex_regB_Q0_379 : std_logic_vector(31 downto 0);
	signal main_rd_rd_controller_semantics_ex_regB_D0_380 : std_logic_vector(31 downto 0);
	signal main_rd_rd_controller_semantics_ex_regB_WE0_381 : std_logic;
	signal pipe_EX_clear_Q0_382 : std_logic;
	signal pipe_EX_stall_Q0_383 : std_logic;
	signal main_ex_output_ex_output_fu_semantics_ex_regC_Q0_384 : std_logic_vector(31 downto 0);
	signal main_rd_rd_controller_semantics_ex_regC_D0_385 : std_logic_vector(31 downto 0);
	signal main_rd_rd_controller_semantics_ex_regC_WE0_386 : std_logic;
	signal pipe_EX_clear_Q0_387 : std_logic;
	signal pipe_EX_stall_Q0_388 : std_logic;
	signal ex_aluA_Q0_389 : std_logic_vector(31 downto 0);
	signal main_alu_alu_fu_semantics_ex_aluA_Q0_390 : std_logic_vector(31 downto 0);
	signal main_ex_ex_controller_semantics_ex_aluA_Q0_391 : std_logic_vector(31 downto 0);
	signal main_rd_rd_controller_semantics_ex_aluA_D0_392 : std_logic_vector(31 downto 0);
	signal main_rd_rd_controller_semantics_ex_aluA_WE0_393 : std_logic;
	signal pipe_EX_clear_Q0_394 : std_logic;
	signal pipe_EX_stall_Q0_395 : std_logic;
	signal ex_aluB_Q0_396 : std_logic_vector(31 downto 0);
	signal main_alu_alu_fu_semantics_ex_aluB_Q0_397 : std_logic_vector(31 downto 0);
	signal main_ex_ex_controller_semantics_ex_aluB_Q0_398 : std_logic_vector(31 downto 0);
	signal main_wb_output_wb_output_fu_semantics_ex_aluB_Q0_399 : std_logic_vector(31 downto 0);
	signal main_rd_rd_controller_semantics_ex_aluB_D0_400 : std_logic_vector(31 downto 0);
	signal main_rd_rd_controller_semantics_ex_aluB_WE0_401 : std_logic;
	signal pipe_EX_clear_Q0_402 : std_logic;
	signal pipe_EX_stall_Q0_403 : std_logic;
	signal ex_rW_Q0_404 : std_logic_vector(4 downto 0);
	signal main_ex_output_ex_output_fu_semantics_ex_rW_Q0_405 : std_logic_vector(4 downto 0);
	signal main_wb_output_wb_output_fu_semantics_ex_rW_Q0_406 : std_logic_vector(4 downto 0);
	signal main_rd_rd_controller_semantics_ex_rW_D0_407 : std_logic_vector(4 downto 0);
	signal main_rd_rd_controller_semantics_ex_rW_WE0_408 : std_logic;
	signal main_alu_alu_fu_semantics_ex_alu_add_Q0_409 : std_logic_vector(31 downto 0);
	signal main_wb_output_wb_output_fu_semantics_ex_alu_add_Q0_410 : std_logic_vector(31 downto 0);
	signal main_alu_alu_fu_semantics_ex_alu_add_D0_411 : std_logic_vector(31 downto 0);
	signal main_wb_output_wb_output_fu_semantics_ex_alu_logic_Q0_412 : std_logic_vector(31 downto 0);
	signal main_alu_alu_fu_semantics_ex_alu_logic_D0_413 : std_logic_vector(31 downto 0);
	signal main_ex_output_ex_output_fu_semantics_ex_alu_arith_Q0_414 : std_logic_vector(31 downto 0);
	signal main_alu_alu_fu_semantics_ex_alu_arith_D0_415 : std_logic_vector(31 downto 0);
	signal main_ex_output_ex_output_fu_semantics_ex_dest_en_Q0_416 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_ex_dest_en_Q0_417 : std_logic;
	signal main_ex_output_ex_output_fu_semantics_ex_dest_en_D0_418 : std_logic;
	signal main_cond_compare_cond_compare_fu_semantics_ex_cmp_Q0_419 : std_logic;
	signal main_ex_output_ex_output_fu_semantics_ex_cmp_Q0_420 : std_logic;
	signal main_cond_compare_cond_compare_fu_semantics_ex_cmp_D0_421 : std_logic;
	signal pipe_EX2_clear_Q0_422 : std_logic;
	signal pipe_EX2_stall_Q0_423 : std_logic;
	signal ex2_alu_op_Q0_424 : std_logic_vector(5 downto 0);
	signal main_ex2_ex2_controller_semantics_ex2_alu_op_Q0_425 : std_logic_vector(5 downto 0);
	signal main_wb_output_wb_output_fu_semantics_ex2_alu_op_Q0_426 : std_logic_vector(5 downto 0);
	signal main_ex_output_ex_output_fu_semantics_ex2_alu_op_D0_427 : std_logic_vector(5 downto 0);
	signal main_ex_output_ex_output_fu_semantics_ex2_alu_op_WE0_428 : std_logic;
	signal pipe_EX2_clear_Q0_429 : std_logic;
	signal pipe_EX2_stall_Q0_430 : std_logic;
	signal ex2_rW_Q0_431 : std_logic_vector(4 downto 0);
	signal main_ex2_ex2_controller_semantics_ex2_rW_Q0_432 : std_logic_vector(4 downto 0);
	signal main_wb_output_wb_output_fu_semantics_ex2_rW_Q0_433 : std_logic_vector(4 downto 0);
	signal main_ex_output_ex_output_fu_semantics_ex2_rW_D0_434 : std_logic_vector(4 downto 0);
	signal main_ex_output_ex_output_fu_semantics_ex2_rW_WE0_435 : std_logic;
	signal pipe_EX2_clear_Q0_436 : std_logic;
	signal pipe_EX2_stall_Q0_437 : std_logic;
	signal ex2_mem_rw_Q0_438 : std_logic_vector(3 downto 0);
	signal main_ex2_ex2_controller_semantics_ex2_mem_rw_Q0_439 : std_logic_vector(3 downto 0);
	signal main_fe_fe_controller_semantics_ex2_mem_rw_Q0_440 : std_logic_vector(3 downto 0);
	signal main_ex_output_ex_output_fu_semantics_ex2_mem_rw_D0_441 : std_logic_vector(3 downto 0);
	signal main_ex_output_ex_output_fu_semantics_ex2_mem_rw_WE0_442 : std_logic;
	signal pipe_EX2_clear_Q0_443 : std_logic;
	signal pipe_EX2_stall_Q0_444 : std_logic;
	signal ex2_dest_en_Q0_445 : std_logic;
	signal main_ex2_ex2_controller_semantics_ex2_dest_en_Q0_446 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_ex2_dest_en_Q0_447 : std_logic;
	signal main_ex_output_ex_output_fu_semantics_ex2_dest_en_D0_448 : std_logic;
	signal main_ex_output_ex_output_fu_semantics_ex2_dest_en_WE0_449 : std_logic;
	signal pipe_EX2_clear_Q0_450 : std_logic;
	signal pipe_EX2_stall_Q0_451 : std_logic;
	signal main_ex2_ex2_controller_semantics_ex2_cmp_Q0_452 : std_logic;
	signal main_cond_compare_cond_compare_fu_semantics_ex2_cmp_D0_453 : std_logic;
	signal main_cond_compare_cond_compare_fu_semantics_ex2_cmp_WE0_454 : std_logic;
	signal pipe_EX2_clear_Q0_455 : std_logic;
	signal pipe_EX2_stall_Q0_456 : std_logic;
	signal main_ex2_ex2_controller_semantics_ex2_alu_Q0_457 : std_logic_vector(31 downto 0);
	signal main_ex_output_ex_output_fu_semantics_ex2_alu_D0_458 : std_logic_vector(31 downto 0);
	signal main_ex_output_ex_output_fu_semantics_ex2_alu_WE0_459 : std_logic;
	signal pipe_EX2_clear_Q0_460 : std_logic;
	signal pipe_EX2_stall_Q0_461 : std_logic;
	signal ex2_mul_Q0_462 : std_logic_vector(31 downto 0);
	signal main_ex2_ex2_controller_semantics_ex2_mul_Q0_463 : std_logic_vector(31 downto 0);
	signal main_wb_output_wb_output_fu_semantics_ex2_mul_Q0_464 : std_logic_vector(31 downto 0);
	signal main_ex_ex_controller_semantics_ex2_mul_D0_465 : std_logic_vector(31 downto 0);
	signal main_ex_ex_controller_semantics_ex2_mul_WE0_466 : std_logic;
	signal pipe_EX2_clear_Q0_467 : std_logic;
	signal pipe_EX2_stall_Q0_468 : std_logic;
	signal main_ex2_ex2_controller_semantics_ex2_regB_Q0_469 : std_logic_vector(31 downto 0);
	signal main_ex_output_ex_output_fu_semantics_ex2_regB_D0_470 : std_logic_vector(31 downto 0);
	signal main_ex_output_ex_output_fu_semantics_ex2_regB_WE0_471 : std_logic;
	signal pipe_EX2_clear_Q0_472 : std_logic;
	signal pipe_EX2_stall_Q0_473 : std_logic;
	signal main_ex2_ex2_controller_semantics_ex2_regC_Q0_474 : std_logic_vector(31 downto 0);
	signal main_ex_output_ex_output_fu_semantics_ex2_regC_D0_475 : std_logic_vector(31 downto 0);
	signal main_ex_output_ex_output_fu_semantics_ex2_regC_WE0_476 : std_logic;
	signal main_ex2_ex2_controller_semantics_ex2_mem_wr_ack_Q0_477 : std_logic;
	signal main_ex2_ex2_controller_semantics_ex2_mem_wr_ack_D0_478 : std_logic;
	signal main_ex2_ex2_controller_semantics_ex2_mem_wr_ack_WE0_479 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_ex2_alu_wb_Q0_480 : std_logic_vector(31 downto 0);
	signal main_ex2_ex2_controller_semantics_ex2_alu_wb_D0_481 : std_logic_vector(31 downto 0);
	signal main_wb_output_wb_output_fu_semantics_wb_alu_Q0_482 : std_logic_vector(31 downto 0);
	signal main_ex2_ex2_controller_semantics_wb_alu_D0_483 : std_logic_vector(31 downto 0);
	signal main_ex2_ex2_controller_semantics_wb_alu_WE0_484 : std_logic;
	signal pipe_WB_clear_Q0_485 : std_logic;
	signal pipe_WB_stall_Q0_486 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_wb_alu_op_Q0_487 : std_logic_vector(5 downto 0);
	signal main_ex2_ex2_controller_semantics_wb_alu_op_D0_488 : std_logic_vector(5 downto 0);
	signal main_ex2_ex2_controller_semantics_wb_alu_op_WE0_489 : std_logic;
	signal pipe_WB_clear_Q0_490 : std_logic;
	signal pipe_WB_stall_Q0_491 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_wb_rW_Q0_492 : std_logic_vector(4 downto 0);
	signal main_ex2_ex2_controller_semantics_wb_rW_D0_493 : std_logic_vector(4 downto 0);
	signal main_ex2_ex2_controller_semantics_wb_rW_WE0_494 : std_logic;
	signal pipe_WB_clear_Q0_495 : std_logic;
	signal pipe_WB_stall_Q0_496 : std_logic;
	signal main_wb_wb_controller_semantics_wb_mem_rw_Q0_497 : std_logic_vector(3 downto 0);
	signal main_ex2_ex2_controller_semantics_wb_mem_rw_D0_498 : std_logic_vector(3 downto 0);
	signal main_ex2_ex2_controller_semantics_wb_mem_rw_WE0_499 : std_logic;
	signal pipe_WB_clear_Q0_500 : std_logic;
	signal pipe_WB_stall_Q0_501 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_wb_dest_en_Q0_502 : std_logic;
	signal main_ex2_ex2_controller_semantics_wb_dest_en_D0_503 : std_logic;
	signal main_ex2_ex2_controller_semantics_wb_dest_en_WE0_504 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_wb_mem_Q0_505 : std_logic_vector(31 downto 0);
	signal main_wb_wb_controller_semantics_wb_mem_D0_506 : std_logic_vector(31 downto 0);
	signal main_rd_rd_controller_semantics_wb_regs_W_Q0_507 : std_logic_vector(31 downto 0);
	signal main_wb_output_wb_output_fu_semantics_wb_regs_W_Q0_508 : std_logic_vector(31 downto 0);
	signal main_wb_output_wb_output_fu_semantics_wb_regs_W_D0_509 : std_logic_vector(31 downto 0);
	signal main_rd_rd_controller_semantics_wb_regs_addrW_Q0_510 : std_logic_vector(4 downto 0);
	signal main_wb_output_wb_output_fu_semantics_wb_regs_addrW_Q0_511 : std_logic_vector(4 downto 0);
	signal main_wb_output_wb_output_fu_semantics_wb_regs_addrW_D0_512 : std_logic_vector(4 downto 0);
	signal main_rd_rd_controller_semantics_wb_regs_we_Q0_513 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_wb_regs_we_Q0_514 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_wb_regs_we_D0_515 : std_logic;
	signal main_fe_fe_controller_semantics_wb_pc_W_Q0_516 : std_logic_vector(31 downto 0);
	signal main_wb_output_wb_output_fu_semantics_wb_pc_W_D0_517 : std_logic_vector(31 downto 0);
	signal main_fe_fe_controller_semantics_wb_pc_we_Q0_518 : std_logic;
	signal main_id_id_controller_semantics_wb_pc_we_Q0_519 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_wb_pc_we_Q0_520 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_wb_pc_we_D0_521 : std_logic;
	signal main_fe_fe_controller_semantics_fe_stall_Q0_522 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_fe_stall_Q0_523 : std_logic;
	signal main_fe_fe_controller_semantics_fe_stall_D0_524 : std_logic;
	signal main_fe_fe_controller_semantics_id_stall_Q0_525 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_id_stall_Q0_526 : std_logic;
	signal main_id_id_controller_semantics_id_stall_D0_527 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_id_clear_Q0_528 : std_logic;
	signal main_id_id_controller_semantics_id_clear_D0_529 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_rd_stall_Q0_530 : std_logic;
	signal main_id_id_controller_semantics_rd_stall_Q0_531 : std_logic;
	signal main_id_id_controller_semantics_rd_stall_D0_532 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_rd_clear_Q0_533 : std_logic;
	signal main_id_id_controller_semantics_rd_clear_D0_534 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_ex_stall_Q0_535 : std_logic;
	signal main_id_id_controller_semantics_ex_stall_Q0_536 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_ex_stall_Q0_537 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_ex_stall_D0_538 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_ex_clear_Q0_539 : std_logic;
	signal main_id_id_controller_semantics_ex_clear_D0_540 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_ex2_stall_Q0_541 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_ex2_stall_Q0_542 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_ex2_stall_D0_543 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_ex2_clear_Q0_544 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_ex2_clear_D0_545 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_wb_stall_Q0_546 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_wb_stall_Q0_547 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_wb_stall_D0_548 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_wb_clear_Q0_549 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_wb_clear_D0_550 : std_logic;
	signal main_fe_fe_controller_semantics_i_mem_rq_stall_Q0_551 : std_logic;
	signal main_fe_fe_controller_semantics_i_mem_rq_stall_D0_552 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_i_mem_rq_inv_stall_Q0_553 : std_logic;
	signal main_ex2_ex2_controller_semantics_i_mem_rq_inv_stall_D0_554 : std_logic;
	signal main_fe_fe_controller_semantics_i_mem_fr_stall_Q0_555 : std_logic;
	signal main_id_id_controller_semantics_i_mem_fr_stall_D0_556 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_d_mem_rq_stall_Q0_557 : std_logic;
	signal main_ex2_ex2_controller_semantics_d_mem_rq_stall_D0_558 : std_logic;
	signal main_ex2_ex2_controller_semantics_d_mem_fr_stall_Q0_559 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_d_mem_fr_stall_Q0_560 : std_logic;
	signal main_wb_wb_controller_semantics_d_mem_fr_stall_D0_561 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_d_mem_fw_stall_Q0_562 : std_logic;
	signal main_ex2_ex2_controller_semantics_d_mem_fw_stall_D0_563 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_ex_hazard_stall_Q0_564 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_ex_hazard_stall_D0_565 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_ex2_hazard_stall_Q0_566 : std_logic;
	signal main_wb_output_wb_output_fu_semantics_ex2_hazard_stall_D0_567 : std_logic;
	signal id_clear_reg_Q0_568 : std_logic;
	signal main_fe_fe_controller_semantics_id_clear_reg_Q0_569 : std_logic;
	signal main_id_id_controller_semantics_id_clear_reg_Q0_570 : std_logic;
	signal main_fe_fe_controller_semantics_id_clear_reg_D0_571 : std_logic;
	signal main_fe_fe_controller_semantics_id_clear_reg_WE0_572 : std_logic;
	signal main_fe_fe_controller_semantics_id_stall_reg_Q0_573 : std_logic;
	signal main_fe_fe_controller_semantics_id_stall_reg_D0_574 : std_logic;
	signal main_fe_fe_controller_semantics_id_stall_reg_WE0_575 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_pipe_RD_stall_D0_576 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_pipe_RD_clear_D0_577 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_pipe_EX_stall_D0_578 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_pipe_EX_clear_D0_579 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_pipe_EX2_stall_D0_580 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_pipe_EX2_clear_D0_581 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_pipe_WB_stall_D0_582 : std_logic;
	signal main_flow_logic_control_flow_logic_control_fu_semantics_pipe_WB_clear_D0_583 : std_logic;
	signal main_0_imm3_srcB_am_instr_hw_0_return_codasip_attribute_L_main_0_instr_hw_srcB_am_imm3_val_0_Q0_584 : std_logic_vector(2 downto 0);
	signal main_instr_hw_instr_hw_codasip_attribute_L_main_0_instr_hw_srcB_am_imm3_val_0_D0_585 : std_logic_vector(2 downto 0);
	signal main_0_imm1_srcB_op_instr_hw_0_return_codasip_attribute_L_main_0_instr_hw_srcB_op_imm1_val_0_Q0_586 : std_logic;
	signal main_instr_hw_instr_hw_codasip_attribute_L_main_0_instr_hw_srcB_op_imm1_val_0_D0_587 : std_logic;
	signal main_0_imm1_srcC_op_instr_hw_0_return_codasip_attribute_L_main_0_instr_hw_srcC_op_imm1_val_0_Q0_588 : std_logic;
	signal main_instr_hw_instr_hw_codasip_attribute_L_main_0_instr_hw_srcC_op_imm1_val_0_D0_589 : std_logic;
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_Q0_590 : std_logic_vector(3 downto 0);
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_Q0_591 : std_logic_vector(3 downto 0);
	signal main_0_op_binand_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_592 : std_logic_vector(3 downto 0);
	signal main_0_op_binnand_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_593 : std_logic_vector(3 downto 0);
	signal main_0_op_eq_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_594 : std_logic_vector(3 downto 0);
	signal main_0_op_logand_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_595 : std_logic_vector(3 downto 0);
	signal main_0_op_lognand_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_596 : std_logic_vector(3 downto 0);
	signal main_0_op_lognor_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_597 : std_logic_vector(3 downto 0);
	signal main_0_op_logor_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_598 : std_logic_vector(3 downto 0);
	signal main_0_op_ne_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_599 : std_logic_vector(3 downto 0);
	signal main_0_op_sge_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_600 : std_logic_vector(3 downto 0);
	signal main_0_op_sgt_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_601 : std_logic_vector(3 downto 0);
	signal main_0_op_sle_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_602 : std_logic_vector(3 downto 0);
	signal main_0_op_slt_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_603 : std_logic_vector(3 downto 0);
	signal main_0_op_uge_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_604 : std_logic_vector(3 downto 0);
	signal main_0_op_ugt_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_605 : std_logic_vector(3 downto 0);
	signal main_0_op_ule_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_606 : std_logic_vector(3 downto 0);
	signal main_0_op_ult_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_607 : std_logic_vector(3 downto 0);
	signal main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_Q0_608 : std_logic_vector(3 downto 0);
	signal main_0_op_addi_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_609 : std_logic_vector(3 downto 0);
	signal main_0_op_andi_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_610 : std_logic_vector(3 downto 0);
	signal main_0_op_ashri_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_611 : std_logic_vector(3 downto 0);
	signal main_0_op_lshri_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_612 : std_logic_vector(3 downto 0);
	signal main_0_op_lui_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_613 : std_logic_vector(3 downto 0);
	signal main_0_op_mulsi_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_614 : std_logic_vector(3 downto 0);
	signal main_0_op_mului_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_615 : std_logic_vector(3 downto 0);
	signal main_0_op_nori_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_616 : std_logic_vector(3 downto 0);
	signal main_0_op_ori_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_617 : std_logic_vector(3 downto 0);
	signal main_0_op_shli_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_618 : std_logic_vector(3 downto 0);
	signal main_0_op_subi_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_619 : std_logic_vector(3 downto 0);
	signal main_0_op_xori_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_620 : std_logic_vector(3 downto 0);
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_Q0_621 : std_logic_vector(8 downto 0);
	signal main_0_op_add_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_622 : std_logic_vector(8 downto 0);
	signal main_0_op_addadd_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_623 : std_logic_vector(8 downto 0);
	signal main_0_op_addmul_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_624 : std_logic_vector(8 downto 0);
	signal main_0_op_addsub_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_625 : std_logic_vector(8 downto 0);
	signal main_0_op_and_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_626 : std_logic_vector(8 downto 0);
	signal main_0_op_ashr_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_627 : std_logic_vector(8 downto 0);
	signal main_0_op_ctlz_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_628 : std_logic_vector(8 downto 0);
	signal main_0_op_cttz_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_629 : std_logic_vector(8 downto 0);
	signal main_0_op_lshr_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_630 : std_logic_vector(8 downto 0);
	signal main_0_op_mul_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_631 : std_logic_vector(8 downto 0);
	signal main_0_op_nor_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_632 : std_logic_vector(8 downto 0);
	signal main_0_op_or_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_633 : std_logic_vector(8 downto 0);
	signal main_0_op_sext16_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_634 : std_logic_vector(8 downto 0);
	signal main_0_op_sext8_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_635 : std_logic_vector(8 downto 0);
	signal main_0_op_shl_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_636 : std_logic_vector(8 downto 0);
	signal main_0_op_sub_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_637 : std_logic_vector(8 downto 0);
	signal main_0_op_subadd_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_638 : std_logic_vector(8 downto 0);
	signal main_0_op_submul_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_639 : std_logic_vector(8 downto 0);
	signal main_0_op_subsub_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_640 : std_logic_vector(8 downto 0);
	signal main_0_op_xor_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_641 : std_logic_vector(8 downto 0);
	signal main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_Q0_642 : std_logic_vector(4 downto 0);
	signal main_0_op_call_exc_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0_643 : std_logic_vector(4 downto 0);
	signal main_0_op_call_int_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0_644 : std_logic_vector(4 downto 0);
	signal main_0_op_call_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0_645 : std_logic_vector(4 downto 0);
	signal main_0_op_jump_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0_646 : std_logic_vector(4 downto 0);
	signal main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_Q0_647 : std_logic_vector(8 downto 0);
	signal main_0_op_call_reg_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_D0_648 : std_logic_vector(8 downto 0);
	signal main_0_op_jump_ie_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_D0_649 : std_logic_vector(8 downto 0);
	signal main_0_op_jump_reg_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_D0_650 : std_logic_vector(8 downto 0);
	signal main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_Q0_651 : std_logic_vector(4 downto 0);
	signal main_0_op_ld_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0_652 : std_logic_vector(4 downto 0);
	signal main_0_op_ldbs_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0_653 : std_logic_vector(4 downto 0);
	signal main_0_op_ldbu_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0_654 : std_logic_vector(4 downto 0);
	signal main_0_op_ldhs_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0_655 : std_logic_vector(4 downto 0);
	signal main_0_op_ldhu_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0_656 : std_logic_vector(4 downto 0);
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_Q0_657 : std_logic_vector(8 downto 0);
	signal main_0_op_ldbsx_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0_658 : std_logic_vector(8 downto 0);
	signal main_0_op_ldbux_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0_659 : std_logic_vector(8 downto 0);
	signal main_0_op_ldhsx_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0_660 : std_logic_vector(8 downto 0);
	signal main_0_op_ldhux_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0_661 : std_logic_vector(8 downto 0);
	signal main_0_op_ldx_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0_662 : std_logic_vector(8 downto 0);
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_move_0_Q0_663 : std_logic_vector(4 downto 0);
	signal main_0_op_move_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_move_0_D0_664 : std_logic_vector(4 downto 0);
	signal main_0_op_select_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_move_0_D0_665 : std_logic_vector(4 downto 0);
	signal main_0_op_test_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_move_0_D0_666 : std_logic_vector(4 downto 0);
	signal main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_Q0_667 : std_logic_vector(4 downto 0);
	signal main_0_op_st_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_D0_668 : std_logic_vector(4 downto 0);
	signal main_0_op_stb_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_D0_669 : std_logic_vector(4 downto 0);
	signal main_0_op_sth_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_D0_670 : std_logic_vector(4 downto 0);
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_Q0_671 : std_logic_vector(8 downto 0);
	signal main_0_op_stbx_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_D0_672 : std_logic_vector(8 downto 0);
	signal main_0_op_sthx_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_D0_673 : std_logic_vector(8 downto 0);
	signal main_0_op_stx_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_D0_674 : std_logic_vector(8 downto 0);
	signal main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_system_0_Q0_675 : std_logic_vector(8 downto 0);
	signal main_0_op_halt_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_system_0_D0_676 : std_logic_vector(8 downto 0);
	signal main_0_op_int_dis_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_system_0_D0_677 : std_logic_vector(8 downto 0);
	signal main_0_op_int_en_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_system_0_D0_678 : std_logic_vector(8 downto 0);
	signal main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_system_rd_0_Q0_679 : std_logic_vector(8 downto 0);
	signal main_0_op_printreg_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_system_rd_0_D0_680 : std_logic_vector(8 downto 0);
	signal main_0_op_set_status_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_system_rd_0_D0_681 : std_logic_vector(8 downto 0);
	signal main_0_op_get_status_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_system_wr_0_D0_682 : std_logic_vector(8 downto 0);
	signal main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0_683 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0_684 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0_685 : std_logic_vector(2 downto 0);
	signal main_0_imm3_srcB_am_instr_hw_0_return_codasip_instance_main_0_instr_hw_srcB_am_imm3_0_D0_686 : std_logic_vector(2 downto 0);
	signal main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_srcB_op_imm1_0_Q0_687 : std_logic;
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_srcB_op_imm1_0_Q0_688 : std_logic;
	signal main_0_imm1_srcB_op_instr_hw_0_return_codasip_instance_main_0_instr_hw_srcB_op_imm1_0_D0_689 : std_logic;
	signal main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_srcC_op_imm1_0_Q0_690 : std_logic;
	signal main_0_imm1_srcC_op_instr_hw_0_return_codasip_instance_main_0_instr_hw_srcC_op_imm1_0_D0_691 : std_logic;
	signal main_instr_hw_instr_hw_main_0_imm1_srcB_op_instr_hw_0_return_ACT_692 : std_logic;
	signal main_instr_hw_instr_hw_main_0_imm1_srcC_op_instr_hw_0_return_ACT_693 : std_logic;
	signal main_instr_hw_instr_hw_main_0_imm3_srcB_am_instr_hw_0_return_ACT_694 : std_logic;
	signal main_instr_hw_instr_hw_main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_ACT_695 : std_logic;
	signal main_instr_hw_instr_hw_main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_ACT_696 : std_logic;
	signal main_instr_hw_instr_hw_main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_ACT_697 : std_logic;
	signal main_instr_hw_instr_hw_main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_ACT_698 : std_logic;
	signal main_instr_hw_instr_hw_main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_ACT_699 : std_logic;
	signal main_instr_hw_instr_hw_main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_ACT_700 : std_logic;
	signal main_instr_hw_instr_hw_main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_ACT_701 : std_logic;
	signal main_instr_hw_instr_hw_main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_ACT_702 : std_logic;
	signal main_instr_hw_instr_hw_main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_ACT_703 : std_logic;
	signal main_instr_hw_instr_hw_main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_ACT_704 : std_logic;
	signal main_instr_hw_instr_hw_main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_ACT_705 : std_logic;
	signal main_instr_hw_instr_hw_main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_ACT_706 : std_logic;
	signal main_instr_hw_instr_hw_main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_ACT_707 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_add_operation_instr_hw_0_return_ACT_708 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_addadd_operation_instr_hw_0_return_ACT_709 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_addi_operation_instr_hw_0_return_ACT_710 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_addmul_operation_instr_hw_0_return_ACT_711 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_addsub_operation_instr_hw_0_return_ACT_712 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_and_operation_instr_hw_0_return_ACT_713 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_andi_operation_instr_hw_0_return_ACT_714 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_ashr_operation_instr_hw_0_return_ACT_715 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_ashri_operation_instr_hw_0_return_ACT_716 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_binand_cond_instr_hw_0_return_ACT_717 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_binnand_cond_instr_hw_0_return_ACT_718 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_call_exc_operation_instr_hw_0_return_ACT_719 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_call_int_operation_instr_hw_0_return_ACT_720 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_call_operation_instr_hw_0_return_ACT_721 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_call_reg_operation_instr_hw_0_return_ACT_722 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_ctlz_operation_instr_hw_0_return_ACT_723 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_cttz_operation_instr_hw_0_return_ACT_724 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_eq_cond_instr_hw_0_return_ACT_725 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_get_status_operation_instr_hw_0_return_ACT_726 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_halt_operation_instr_hw_0_return_ACT_727 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_int_dis_operation_instr_hw_0_return_ACT_728 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_int_en_operation_instr_hw_0_return_ACT_729 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_jump_ie_operation_instr_hw_0_return_ACT_730 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_jump_operation_instr_hw_0_return_ACT_731 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_jump_reg_operation_instr_hw_0_return_ACT_732 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_ld_operation_instr_hw_0_return_ACT_733 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_ldbs_operation_instr_hw_0_return_ACT_734 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_ldbsx_operation_instr_hw_0_return_ACT_735 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_ldbu_operation_instr_hw_0_return_ACT_736 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_ldbux_operation_instr_hw_0_return_ACT_737 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_ldhs_operation_instr_hw_0_return_ACT_738 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_ldhsx_operation_instr_hw_0_return_ACT_739 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_ldhu_operation_instr_hw_0_return_ACT_740 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_ldhux_operation_instr_hw_0_return_ACT_741 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_ldx_operation_instr_hw_0_return_ACT_742 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_logand_cond_instr_hw_0_return_ACT_743 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_lognand_cond_instr_hw_0_return_ACT_744 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_lognor_cond_instr_hw_0_return_ACT_745 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_logor_cond_instr_hw_0_return_ACT_746 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_lshr_operation_instr_hw_0_return_ACT_747 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_lshri_operation_instr_hw_0_return_ACT_748 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_lui_operation_instr_hw_0_return_ACT_749 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_move_operation_instr_hw_0_return_ACT_750 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_mul_operation_instr_hw_0_return_ACT_751 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_mulsi_operation_instr_hw_0_return_ACT_752 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_mului_operation_instr_hw_0_return_ACT_753 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_ne_cond_instr_hw_0_return_ACT_754 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_nor_operation_instr_hw_0_return_ACT_755 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_nori_operation_instr_hw_0_return_ACT_756 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_or_operation_instr_hw_0_return_ACT_757 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_ori_operation_instr_hw_0_return_ACT_758 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_printreg_operation_instr_hw_0_return_ACT_759 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_select_operation_instr_hw_0_return_ACT_760 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_set_status_operation_instr_hw_0_return_ACT_761 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_sext16_operation_instr_hw_0_return_ACT_762 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_sext8_operation_instr_hw_0_return_ACT_763 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_sge_cond_instr_hw_0_return_ACT_764 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_sgt_cond_instr_hw_0_return_ACT_765 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_shl_operation_instr_hw_0_return_ACT_766 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_shli_operation_instr_hw_0_return_ACT_767 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_sle_cond_instr_hw_0_return_ACT_768 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_slt_cond_instr_hw_0_return_ACT_769 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_st_operation_instr_hw_0_return_ACT_770 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_stb_operation_instr_hw_0_return_ACT_771 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_stbx_operation_instr_hw_0_return_ACT_772 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_sth_operation_instr_hw_0_return_ACT_773 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_sthx_operation_instr_hw_0_return_ACT_774 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_stx_operation_instr_hw_0_return_ACT_775 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_sub_operation_instr_hw_0_return_ACT_776 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_subadd_operation_instr_hw_0_return_ACT_777 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_subi_operation_instr_hw_0_return_ACT_778 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_submul_operation_instr_hw_0_return_ACT_779 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_subsub_operation_instr_hw_0_return_ACT_780 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_test_operation_instr_hw_0_return_ACT_781 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_uge_cond_instr_hw_0_return_ACT_782 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_ugt_cond_instr_hw_0_return_ACT_783 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_ule_cond_instr_hw_0_return_ACT_784 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_ult_cond_instr_hw_0_return_ACT_785 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_xor_operation_instr_hw_0_return_ACT_786 : std_logic;
	signal main_instr_hw_instr_hw_main_0_op_xori_operation_instr_hw_0_return_ACT_787 : std_logic;
	signal main_controller_main_alu_alu_fu_semantics_ACT_788 : std_logic;
	signal main_controller_main_cond_compare_cond_compare_fu_semantics_ACT_789 : std_logic;
	signal main_controller_main_ex2_ex2_controller_semantics_ACT_790 : std_logic;
	signal core_dbus_REQCMD0_main_ex2_ex2_controller_semantics_3552_791 : std_logic_vector(2 downto 0);
	signal core_dbus_A0_main_ex2_ex2_controller_semantics_3556_792 : std_logic_vector(31 downto 0);
	signal core_dbus_SI0_main_ex2_ex2_controller_semantics_3560_793 : std_logic_vector(1 downto 0);
	signal core_dbus_SC0_main_ex2_ex2_controller_semantics_3564_794 : std_logic_vector(2 downto 0);
	signal core_dbus_REQRESP0_main_ex2_ex2_controller_semantics_3568_795 : std_logic_vector(2 downto 0);
	signal core_port_error_D0_main_ex2_ex2_controller_semantics_3619_796 : std_logic_vector(31 downto 0);
	signal core_dbus_D0_main_ex2_ex2_controller_semantics_3754_797 : std_logic_vector(31 downto 0);
	signal core_dbus_OFCMD0_main_ex2_ex2_controller_semantics_3756_798 : std_logic_vector(2 downto 0);
	signal core_dbus_OFRESP0_main_ex2_ex2_controller_semantics_3765_799 : std_logic_vector(2 downto 0);
	signal main_controller_main_ex_ex_controller_semantics_ACT_800 : std_logic;
	signal main_controller_main_ex_output_ex_output_fu_semantics_ACT_801 : std_logic;
	signal main_controller_main_fe_fe_controller_semantics_ACT_802 : std_logic;
	signal core_ibus_REQCMD0_main_fe_fe_controller_semantics_4107_803 : std_logic_vector(2 downto 0);
	signal core_ibus_A0_main_fe_fe_controller_semantics_4111_804 : std_logic_vector(31 downto 0);
	signal core_ibus_SI0_main_fe_fe_controller_semantics_4115_805 : std_logic_vector(1 downto 0);
	signal core_ibus_SC0_main_fe_fe_controller_semantics_4119_806 : std_logic_vector(2 downto 0);
	signal core_ibus_REQRESP0_main_fe_fe_controller_semantics_4123_807 : std_logic_vector(2 downto 0);
	signal core_port_error_D0_main_fe_fe_controller_semantics_4155_808 : std_logic_vector(31 downto 0);
	signal main_controller_main_flow_logic_control_flow_logic_control_fu_semantics_ACT_809 : std_logic;
	signal main_controller_main_fnc_ctrl_0_1_condition_ACT_810 : std_logic;
	signal main_controller_main_fnc_ctrl_0_1_condition_RET_811 : std_logic;
	signal main_controller_main_id_id_controller_semantics_ACT_812 : std_logic;
	signal core_irq_Q0_main_id_id_controller_semantics_4411_813 : std_logic;
	signal core_ibus_Q0_main_id_id_controller_semantics_4420_814 : std_logic_vector(31 downto 0);
	signal core_ibus_IFCMD0_main_id_id_controller_semantics_4422_815 : std_logic_vector(2 downto 0);
	signal core_ibus_IFRESP0_main_id_id_controller_semantics_4430_816 : std_logic_vector(2 downto 0);
	signal core_port_error_D0_main_id_id_controller_semantics_4454_817 : std_logic_vector(31 downto 0);
	signal main_controller_main_rd_rd_controller_semantics_ACT_818 : std_logic;
	signal core_ERST_Q0_main_reset_fu_semantics_4910_819 : std_logic;
	signal core_IRST_D0_main_reset_fu_semantics_4912_820 : std_logic;
	signal main_controller_main_wb_output_wb_output_fu_semantics_ACT_821 : std_logic;
	signal core_port_out_D0_main_wb_output_wb_output_fu_semantics_5310_822 : std_logic_vector(31 downto 0);
	signal core_port_out_en_D0_main_wb_output_wb_output_fu_semantics_5318_823 : std_logic;
	signal core_port_halt_D0_main_wb_output_wb_output_fu_semantics_5340_824 : std_logic;
	signal main_controller_main_wb_wb_controller_semantics_ACT_825 : std_logic;
	signal core_dbus_Q0_main_wb_wb_controller_semantics_5360_826 : std_logic_vector(31 downto 0);
	signal core_dbus_IFCMD0_main_wb_wb_controller_semantics_5362_827 : std_logic_vector(2 downto 0);
	signal core_dbus_IFRESP0_main_wb_wb_controller_semantics_5372_828 : std_logic_vector(2 downto 0);
	signal core_port_error_D0_main_wb_wb_controller_semantics_5420_829 : std_logic_vector(31 downto 0);
	signal main_controller_main_instr_hw_instr_hw_ACT_830 : std_logic;

begin
	-- child instances inside 'core' CPU core:
	-- instance of 'pc' register:
	pc : d_ff_plain_t
		generic map (
			bit_width => 32,
			reset_value => "00000000000000000000000000000000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			Q0 => main_fe_fe_controller_semantics_pc_Q0_0,
			D0 => main_fe_fe_controller_semantics_pc_D0_1,
			WE0 => main_fe_fe_controller_semantics_pc_WE0_2
		);

	-- instance of 'regs' register file:
	regs : codix_risc_ca_core_regs_t
		port map (
			CLK => CLK,
			Q0 => main_rd_rd_controller_semantics_regs_Q0_3,
			RA0 => main_rd_rd_controller_semantics_regs_RA0_4,
			RE0 => main_rd_rd_controller_semantics_regs_RE0_5,
			Q1 => main_rd_rd_controller_semantics_regs_Q1_6,
			RA1 => main_rd_rd_controller_semantics_regs_RA1_7,
			RE1 => main_rd_rd_controller_semantics_regs_RE1_8,
			Q2 => main_rd_rd_controller_semantics_regs_Q2_9,
			RA2 => main_rd_rd_controller_semantics_regs_RA2_10,
			RE2 => main_rd_rd_controller_semantics_regs_RE2_11,
			D0 => main_wb_output_wb_output_fu_semantics_regs_D0_12,
			WA0 => main_wb_output_wb_output_fu_semantics_regs_WA0_13,
			WE0 => main_wb_output_wb_output_fu_semantics_regs_WE0_14
		);

	-- instance of 'int_enabled' register:
	int_enabled : d_ff_plain_t
		generic map (
			bit_width => 1,
			reset_value => "0"
		)
		port map (
			CLK => CLK,
			RST => RST,
			Q0(0) => int_enabled_Q0_15,
			D0(0) => main_ex_ex_controller_semantics_int_enabled_D0_19,
			WE0 => main_ex_ex_controller_semantics_int_enabled_WE0_20
		);
	main_alu_alu_fu_semantics_int_enabled_Q0_16 <= int_enabled_Q0_15;
	main_ex_ex_controller_semantics_int_enabled_Q0_17 <= int_enabled_Q0_15;
	main_id_id_controller_semantics_int_enabled_Q0_18 <= int_enabled_Q0_15;

	-- instance of 'id_pc' register:
	id_pc : d_ff_plain_t
		generic map (
			bit_width => 32,
			reset_value => "00000000000000000000000000000000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			Q0 => id_pc_Q0_21,
			D0 => main_fe_fe_controller_semantics_id_pc_D0_24,
			WE0 => main_fe_fe_controller_semantics_id_pc_WE0_25
		);
	main_fe_fe_controller_semantics_id_pc_Q0_22 <= id_pc_Q0_21;
	main_id_id_controller_semantics_id_pc_Q0_23 <= id_pc_Q0_21;

	-- instance of 'id_instr' signal:
	main_instr_hw_instr_hw_id_instr_Q0_26 <= id_instr;

	id_instr <= main_id_id_controller_semantics_id_instr_D0_27;

	-- instance of 'rd_mem_rw' register:
	rd_mem_rw : d_ff_pipeline_t
		generic map (
			bit_width => 4,
			reset_value => "0000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_RD_clear_Q0_28,
			STALL => pipe_RD_stall_Q0_29,
			Q0 => main_rd_rd_controller_semantics_rd_mem_rw_Q0_30,
			D0 => rd_mem_rw_D0_31,
			WE0 => rd_mem_rw_WE0_45
		);
	rd_mem_rw_D0_31 <= main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_32 or
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_33 or
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_34 or
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_35 or
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_36 or
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_37 or
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_38 or
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_39 or
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_40 or
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_41 or
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_42 or
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_43 or
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_44;
	rd_mem_rw_WE0_45 <= main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_46 or
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_47 or
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_48 or
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_49 or
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_50 or
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_51 or
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_52 or
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_53 or
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_54 or
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_55 or
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_56 or
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_57 or
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_58;

	-- instance of 'rd_alu_op' register:
	rd_alu_op : d_ff_pipeline_t
		generic map (
			bit_width => 6,
			reset_value => "000000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_RD_clear_Q0_59,
			STALL => pipe_RD_stall_Q0_60,
			Q0 => rd_alu_op_Q0_61,
			D0 => rd_alu_op_D0_64,
			WE0 => rd_alu_op_WE0_78
		);
	main_id_id_controller_semantics_rd_alu_op_Q0_62 <= rd_alu_op_Q0_61;
	main_rd_rd_controller_semantics_rd_alu_op_Q0_63 <= rd_alu_op_Q0_61;
	rd_alu_op_D0_64 <= main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_65 or
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_66 or
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_67 or
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_68 or
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_69 or
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_70 or
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_71 or
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_72 or
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_73 or
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_74 or
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_75 or
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_76 or
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_77;
	rd_alu_op_WE0_78 <= main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_79 or
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_80 or
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_81 or
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_82 or
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_83 or
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_84 or
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_85 or
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_86 or
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_87 or
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_88 or
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_89 or
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_90 or
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_91;

	-- instance of 'rd_cond' register:
	rd_cond : d_ff_pipeline_t
		generic map (
			bit_width => 5,
			reset_value => "00000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_RD_clear_Q0_92,
			STALL => pipe_RD_stall_Q0_93,
			Q0 => main_rd_rd_controller_semantics_rd_cond_Q0_94,
			D0 => rd_cond_D0_95,
			WE0 => rd_cond_WE0_109
		);
	rd_cond_D0_95 <= main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_cond_D0_96 or
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_cond_D0_97 or
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_cond_D0_98 or
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_cond_D0_99 or
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_cond_D0_100 or
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_cond_D0_101 or
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_cond_D0_102 or
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_cond_D0_103 or
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_cond_D0_104 or
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_cond_D0_105 or
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_cond_D0_106 or
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_cond_D0_107 or
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_cond_D0_108;
	rd_cond_WE0_109 <= main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_cond_WE0_110 or
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_cond_WE0_111 or
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_cond_WE0_112 or
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_cond_WE0_113 or
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_cond_WE0_114 or
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_cond_WE0_115 or
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_cond_WE0_116 or
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_cond_WE0_117 or
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_cond_WE0_118 or
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_cond_WE0_119 or
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_cond_WE0_120 or
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_cond_WE0_121 or
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_cond_WE0_122;

	-- instance of 'rd_dest_en_mux' register:
	rd_dest_en_mux : d_ff_pipeline_t
		generic map (
			bit_width => 2,
			reset_value => "00"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_RD_clear_Q0_123,
			STALL => pipe_RD_stall_Q0_124,
			Q0 => main_rd_rd_controller_semantics_rd_dest_en_mux_Q0_125,
			D0 => rd_dest_en_mux_D0_126,
			WE0 => rd_dest_en_mux_WE0_140
		);
	rd_dest_en_mux_D0_126 <= main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_127 or
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_128 or
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_129 or
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_130 or
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_131 or
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_132 or
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_133 or
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_134 or
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_135 or
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_136 or
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_137 or
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_138 or
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_139;
	rd_dest_en_mux_WE0_140 <= main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_141 or
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_142 or
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_143 or
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_144 or
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_145 or
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_146 or
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_147 or
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_148 or
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_149 or
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_150 or
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_151 or
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_152 or
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_153;

	-- instance of 'rd_ie_flag' register:
	rd_ie_flag : d_ff_pipeline_t
		generic map (
			bit_width => 2,
			reset_value => "00"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_RD_clear_Q0_154,
			STALL => pipe_RD_stall_Q0_155,
			Q0 => rd_ie_flag_Q0_156,
			D0 => rd_ie_flag_D0_159,
			WE0 => rd_ie_flag_WE0_173
		);
	main_id_id_controller_semantics_rd_ie_flag_Q0_157 <= rd_ie_flag_Q0_156;
	main_rd_rd_controller_semantics_rd_ie_flag_Q0_158 <= rd_ie_flag_Q0_156;
	rd_ie_flag_D0_159 <= main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_160 or
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_161 or
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_162 or
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_163 or
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_164 or
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_165 or
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_166 or
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_167 or
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_168 or
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_169 or
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_170 or
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_171 or
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_172;
	rd_ie_flag_WE0_173 <= main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_174 or
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_175 or
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_176 or
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_177 or
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_178 or
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_179 or
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_180 or
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_181 or
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_182 or
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_183 or
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_184 or
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_185 or
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_186;

	-- instance of 'rd_aluA_mux' register:
	rd_aluA_mux : d_ff_pipeline_t
		generic map (
			bit_width => 1,
			reset_value => "0"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_RD_clear_Q0_187,
			STALL => pipe_RD_stall_Q0_188,
			Q0(0) => main_rd_rd_controller_semantics_rd_aluA_mux_Q0_189,
			D0(0) => rd_aluA_mux_D0_190,
			WE0 => rd_aluA_mux_WE0_204
		);
	rd_aluA_mux_D0_190 <= main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_191 or
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_192 or
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_193 or
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_194 or
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_195 or
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_196 or
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_197 or
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_198 or
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_199 or
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_200 or
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_201 or
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_202 or
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_203;
	rd_aluA_mux_WE0_204 <= main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_205 or
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_206 or
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_207 or
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_208 or
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_209 or
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_210 or
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_211 or
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_212 or
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_213 or
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_214 or
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_215 or
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_216 or
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_217;

	-- instance of 'rd_aluB_mux' register:
	rd_aluB_mux : d_ff_pipeline_t
		generic map (
			bit_width => 3,
			reset_value => "000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_RD_clear_Q0_218,
			STALL => pipe_RD_stall_Q0_219,
			Q0 => main_rd_rd_controller_semantics_rd_aluB_mux_Q0_220,
			D0 => rd_aluB_mux_D0_221,
			WE0 => rd_aluB_mux_WE0_235
		);
	rd_aluB_mux_D0_221 <= main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_222 or
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_223 or
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_224 or
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_225 or
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_226 or
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_227 or
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_228 or
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_229 or
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_230 or
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_231 or
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_232 or
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_233 or
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_234;
	rd_aluB_mux_WE0_235 <= main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_236 or
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_237 or
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_238 or
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_239 or
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_240 or
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_241 or
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_242 or
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_243 or
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_244 or
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_245 or
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_246 or
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_247 or
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_248;

	-- instance of 'rd_amB' register:
	rd_amB : d_ff_pipeline_t
		generic map (
			bit_width => 3,
			reset_value => "000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_RD_clear_Q0_249,
			STALL => pipe_RD_stall_Q0_250,
			Q0 => main_rd_rd_controller_semantics_rd_amB_Q0_251,
			D0 => rd_amB_D0_252,
			WE0 => rd_amB_WE0_266
		);
	rd_amB_D0_252 <= main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_amB_D0_253 or
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_amB_D0_254 or
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_amB_D0_255 or
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_amB_D0_256 or
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_amB_D0_257 or
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_amB_D0_258 or
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_amB_D0_259 or
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_amB_D0_260 or
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_amB_D0_261 or
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_amB_D0_262 or
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_amB_D0_263 or
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_amB_D0_264 or
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_amB_D0_265;
	rd_amB_WE0_266 <= main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_amB_WE0_267 or
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_amB_WE0_268 or
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_amB_WE0_269 or
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_amB_WE0_270 or
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_amB_WE0_271 or
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_amB_WE0_272 or
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_amB_WE0_273 or
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_amB_WE0_274 or
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_amB_WE0_275 or
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_amB_WE0_276 or
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_amB_WE0_277 or
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_amB_WE0_278 or
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_amB_WE0_279;

	-- instance of 'rd_amC' register:
	rd_amC : d_ff_pipeline_t
		generic map (
			bit_width => 1,
			reset_value => "0"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_RD_clear_Q0_280,
			STALL => pipe_RD_stall_Q0_281,
			Q0(0) => main_rd_rd_controller_semantics_rd_amC_Q0_282,
			D0(0) => rd_amC_D0_283,
			WE0 => rd_amC_WE0_297
		);
	rd_amC_D0_283 <= main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_amC_D0_284 or
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_amC_D0_285 or
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_amC_D0_286 or
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_amC_D0_287 or
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_amC_D0_288 or
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_amC_D0_289 or
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_amC_D0_290 or
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_amC_D0_291 or
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_amC_D0_292 or
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_amC_D0_293 or
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_amC_D0_294 or
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_amC_D0_295 or
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_amC_D0_296;
	rd_amC_WE0_297 <= main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_amC_WE0_298 or
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_amC_WE0_299 or
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_amC_WE0_300 or
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_amC_WE0_301 or
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_amC_WE0_302 or
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_amC_WE0_303 or
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_amC_WE0_304 or
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_amC_WE0_305 or
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_amC_WE0_306 or
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_amC_WE0_307 or
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_amC_WE0_308 or
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_amC_WE0_309 or
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_amC_WE0_310;

	-- instance of 'rd_mem' register:
	rd_mem : d_ff_pipeline_t
		generic map (
			bit_width => 32,
			reset_value => "00000000000000000000000000000000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_RD_clear_Q0_311,
			STALL => pipe_RD_stall_Q0_312,
			Q0 => main_rd_rd_controller_semantics_rd_mem_Q0_313,
			D0 => main_id_id_controller_semantics_rd_mem_D0_314,
			WE0 => main_id_id_controller_semantics_rd_mem_WE0_315
		);

	-- instance of 'rd_pc' register:
	rd_pc : d_ff_pipeline_t
		generic map (
			bit_width => 32,
			reset_value => "00000000000000000000000000000000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_RD_clear_Q0_316,
			STALL => pipe_RD_stall_Q0_317,
			Q0 => main_rd_rd_controller_semantics_rd_pc_Q0_318,
			D0 => main_id_id_controller_semantics_rd_pc_D0_319,
			WE0 => main_id_id_controller_semantics_rd_pc_WE0_320
		);

	-- instance of 'rd_rA' signal:
	main_rd_rd_controller_semantics_rd_rA_Q0_321 <= rd_rA;

	rd_rA <= main_rd_rd_controller_semantics_rd_rA_D0_322;

	-- instance of 'rd_rB' signal:
	main_rd_rd_controller_semantics_rd_rB_Q0_323 <= rd_rB;

	rd_rB <= main_rd_rd_controller_semantics_rd_rB_D0_324;

	-- instance of 'rd_rC' signal:
	main_rd_rd_controller_semantics_rd_rC_Q0_325 <= rd_rC;

	rd_rC <= main_rd_rd_controller_semantics_rd_rC_D0_326;

	-- instance of 'rd_rW' signal:
	main_rd_rd_controller_semantics_rd_rW_Q0_327 <= rd_rW;

	rd_rW <= main_rd_rd_controller_semantics_rd_rW_D0_328;

	-- instance of 'rd_jump_abs' signal:
	main_rd_rd_controller_semantics_rd_jump_abs_Q0_329 <= rd_jump_abs;

	rd_jump_abs <= main_rd_rd_controller_semantics_rd_jump_abs_D0_330;

	-- instance of 'rd_jump_rel' signal:
	main_rd_rd_controller_semantics_rd_jump_rel_Q0_331 <= rd_jump_rel;

	rd_jump_rel <= main_rd_rd_controller_semantics_rd_jump_rel_D0_332;

	-- instance of 'rd_store' signal:
	main_rd_rd_controller_semantics_rd_store_Q0_333 <= rd_store;

	rd_store <= main_rd_rd_controller_semantics_rd_store_D0_334;

	-- instance of 'rd_imm' signal:
	main_rd_rd_controller_semantics_rd_imm_Q0_335 <= rd_imm;

	rd_imm <= main_rd_rd_controller_semantics_rd_imm_D0_336;

	-- instance of 'ex_mem_rw' register:
	ex_mem_rw : d_ff_pipeline_t
		generic map (
			bit_width => 4,
			reset_value => "0000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX_clear_Q0_337,
			STALL => pipe_EX_stall_Q0_338,
			Q0 => main_ex_output_ex_output_fu_semantics_ex_mem_rw_Q0_339,
			D0 => main_rd_rd_controller_semantics_ex_mem_rw_D0_340,
			WE0 => main_rd_rd_controller_semantics_ex_mem_rw_WE0_341
		);

	-- instance of 'ex_alu_op' register:
	ex_alu_op : d_ff_pipeline_t
		generic map (
			bit_width => 6,
			reset_value => "000000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX_clear_Q0_342,
			STALL => pipe_EX_stall_Q0_343,
			Q0 => ex_alu_op_Q0_344,
			D0 => main_rd_rd_controller_semantics_ex_alu_op_D0_351,
			WE0 => main_rd_rd_controller_semantics_ex_alu_op_WE0_352
		);
	main_alu_alu_fu_semantics_ex_alu_op_Q0_345 <= ex_alu_op_Q0_344;
	main_ex_ex_controller_semantics_ex_alu_op_Q0_346 <= ex_alu_op_Q0_344;
	main_ex_output_ex_output_fu_semantics_ex_alu_op_Q0_347 <= ex_alu_op_Q0_344;
	main_fnc_ctrl_0_1_condition_ex_alu_op_Q0_348 <= ex_alu_op_Q0_344;
	main_id_id_controller_semantics_ex_alu_op_Q0_349 <= ex_alu_op_Q0_344;
	main_wb_output_wb_output_fu_semantics_ex_alu_op_Q0_350 <= ex_alu_op_Q0_344;

	-- instance of 'ex_cond' register:
	ex_cond : d_ff_pipeline_t
		generic map (
			bit_width => 5,
			reset_value => "00000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX_clear_Q0_353,
			STALL => pipe_EX_stall_Q0_354,
			Q0 => main_cond_compare_cond_compare_fu_semantics_ex_cond_Q0_355,
			D0 => main_rd_rd_controller_semantics_ex_cond_D0_356,
			WE0 => main_rd_rd_controller_semantics_ex_cond_WE0_357
		);

	-- instance of 'ex_dest_en_mux' register:
	ex_dest_en_mux : d_ff_pipeline_t
		generic map (
			bit_width => 2,
			reset_value => "00"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX_clear_Q0_358,
			STALL => pipe_EX_stall_Q0_359,
			Q0 => main_ex_output_ex_output_fu_semantics_ex_dest_en_mux_Q0_360,
			D0 => main_rd_rd_controller_semantics_ex_dest_en_mux_D0_361,
			WE0 => main_rd_rd_controller_semantics_ex_dest_en_mux_WE0_362
		);

	-- instance of 'ex_ie_flag' register:
	ex_ie_flag : d_ff_pipeline_t
		generic map (
			bit_width => 2,
			reset_value => "00"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX_clear_Q0_363,
			STALL => pipe_EX_stall_Q0_364,
			Q0 => ex_ie_flag_Q0_365,
			D0 => main_rd_rd_controller_semantics_ex_ie_flag_D0_368,
			WE0 => main_rd_rd_controller_semantics_ex_ie_flag_WE0_369
		);
	main_ex_ex_controller_semantics_ex_ie_flag_Q0_366 <= ex_ie_flag_Q0_365;
	main_id_id_controller_semantics_ex_ie_flag_Q0_367 <= ex_ie_flag_Q0_365;

	-- instance of 'ex_regA' register:
	ex_regA : d_ff_pipeline_t
		generic map (
			bit_width => 32,
			reset_value => "00000000000000000000000000000000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX_clear_Q0_370,
			STALL => pipe_EX_stall_Q0_371,
			Q0 => main_cond_compare_cond_compare_fu_semantics_ex_regA_Q0_372,
			D0 => main_rd_rd_controller_semantics_ex_regA_D0_373,
			WE0 => main_rd_rd_controller_semantics_ex_regA_WE0_374
		);

	-- instance of 'ex_regB' register:
	ex_regB : d_ff_pipeline_t
		generic map (
			bit_width => 32,
			reset_value => "00000000000000000000000000000000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX_clear_Q0_375,
			STALL => pipe_EX_stall_Q0_376,
			Q0 => ex_regB_Q0_377,
			D0 => main_rd_rd_controller_semantics_ex_regB_D0_380,
			WE0 => main_rd_rd_controller_semantics_ex_regB_WE0_381
		);
	main_cond_compare_cond_compare_fu_semantics_ex_regB_Q0_378 <= ex_regB_Q0_377;
	main_ex_output_ex_output_fu_semantics_ex_regB_Q0_379 <= ex_regB_Q0_377;

	-- instance of 'ex_regC' register:
	ex_regC : d_ff_pipeline_t
		generic map (
			bit_width => 32,
			reset_value => "00000000000000000000000000000000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX_clear_Q0_382,
			STALL => pipe_EX_stall_Q0_383,
			Q0 => main_ex_output_ex_output_fu_semantics_ex_regC_Q0_384,
			D0 => main_rd_rd_controller_semantics_ex_regC_D0_385,
			WE0 => main_rd_rd_controller_semantics_ex_regC_WE0_386
		);

	-- instance of 'ex_aluA' register:
	ex_aluA : d_ff_pipeline_t
		generic map (
			bit_width => 32,
			reset_value => "00000000000000000000000000000000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX_clear_Q0_387,
			STALL => pipe_EX_stall_Q0_388,
			Q0 => ex_aluA_Q0_389,
			D0 => main_rd_rd_controller_semantics_ex_aluA_D0_392,
			WE0 => main_rd_rd_controller_semantics_ex_aluA_WE0_393
		);
	main_alu_alu_fu_semantics_ex_aluA_Q0_390 <= ex_aluA_Q0_389;
	main_ex_ex_controller_semantics_ex_aluA_Q0_391 <= ex_aluA_Q0_389;

	-- instance of 'ex_aluB' register:
	ex_aluB : d_ff_pipeline_t
		generic map (
			bit_width => 32,
			reset_value => "00000000000000000000000000000000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX_clear_Q0_394,
			STALL => pipe_EX_stall_Q0_395,
			Q0 => ex_aluB_Q0_396,
			D0 => main_rd_rd_controller_semantics_ex_aluB_D0_400,
			WE0 => main_rd_rd_controller_semantics_ex_aluB_WE0_401
		);
	main_alu_alu_fu_semantics_ex_aluB_Q0_397 <= ex_aluB_Q0_396;
	main_ex_ex_controller_semantics_ex_aluB_Q0_398 <= ex_aluB_Q0_396;
	main_wb_output_wb_output_fu_semantics_ex_aluB_Q0_399 <= ex_aluB_Q0_396;

	-- instance of 'ex_rW' register:
	ex_rW : d_ff_pipeline_t
		generic map (
			bit_width => 5,
			reset_value => "00000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX_clear_Q0_402,
			STALL => pipe_EX_stall_Q0_403,
			Q0 => ex_rW_Q0_404,
			D0 => main_rd_rd_controller_semantics_ex_rW_D0_407,
			WE0 => main_rd_rd_controller_semantics_ex_rW_WE0_408
		);
	main_ex_output_ex_output_fu_semantics_ex_rW_Q0_405 <= ex_rW_Q0_404;
	main_wb_output_wb_output_fu_semantics_ex_rW_Q0_406 <= ex_rW_Q0_404;

	-- instance of 'ex_alu_add' signal:
	main_alu_alu_fu_semantics_ex_alu_add_Q0_409 <= ex_alu_add;
	main_wb_output_wb_output_fu_semantics_ex_alu_add_Q0_410 <= ex_alu_add;

	ex_alu_add <= main_alu_alu_fu_semantics_ex_alu_add_D0_411;

	-- instance of 'ex_alu_logic' signal:
	main_wb_output_wb_output_fu_semantics_ex_alu_logic_Q0_412 <= ex_alu_logic;

	ex_alu_logic <= main_alu_alu_fu_semantics_ex_alu_logic_D0_413;

	-- instance of 'ex_alu_arith' signal:
	main_ex_output_ex_output_fu_semantics_ex_alu_arith_Q0_414 <= ex_alu_arith;

	ex_alu_arith <= main_alu_alu_fu_semantics_ex_alu_arith_D0_415;

	-- instance of 'ex_dest_en' signal:
	main_ex_output_ex_output_fu_semantics_ex_dest_en_Q0_416 <= ex_dest_en;
	main_wb_output_wb_output_fu_semantics_ex_dest_en_Q0_417 <= ex_dest_en;

	ex_dest_en <= main_ex_output_ex_output_fu_semantics_ex_dest_en_D0_418;

	-- instance of 'ex_cmp' signal:
	main_cond_compare_cond_compare_fu_semantics_ex_cmp_Q0_419 <= ex_cmp;
	main_ex_output_ex_output_fu_semantics_ex_cmp_Q0_420 <= ex_cmp;

	ex_cmp <= main_cond_compare_cond_compare_fu_semantics_ex_cmp_D0_421;

	-- instance of 'ex2_alu_op' register:
	ex2_alu_op : d_ff_pipeline_t
		generic map (
			bit_width => 6,
			reset_value => "000000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX2_clear_Q0_422,
			STALL => pipe_EX2_stall_Q0_423,
			Q0 => ex2_alu_op_Q0_424,
			D0 => main_ex_output_ex_output_fu_semantics_ex2_alu_op_D0_427,
			WE0 => main_ex_output_ex_output_fu_semantics_ex2_alu_op_WE0_428
		);
	main_ex2_ex2_controller_semantics_ex2_alu_op_Q0_425 <= ex2_alu_op_Q0_424;
	main_wb_output_wb_output_fu_semantics_ex2_alu_op_Q0_426 <= ex2_alu_op_Q0_424;

	-- instance of 'ex2_rW' register:
	ex2_rW : d_ff_pipeline_t
		generic map (
			bit_width => 5,
			reset_value => "00000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX2_clear_Q0_429,
			STALL => pipe_EX2_stall_Q0_430,
			Q0 => ex2_rW_Q0_431,
			D0 => main_ex_output_ex_output_fu_semantics_ex2_rW_D0_434,
			WE0 => main_ex_output_ex_output_fu_semantics_ex2_rW_WE0_435
		);
	main_ex2_ex2_controller_semantics_ex2_rW_Q0_432 <= ex2_rW_Q0_431;
	main_wb_output_wb_output_fu_semantics_ex2_rW_Q0_433 <= ex2_rW_Q0_431;

	-- instance of 'ex2_mem_rw' register:
	ex2_mem_rw : d_ff_pipeline_t
		generic map (
			bit_width => 4,
			reset_value => "0000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX2_clear_Q0_436,
			STALL => pipe_EX2_stall_Q0_437,
			Q0 => ex2_mem_rw_Q0_438,
			D0 => main_ex_output_ex_output_fu_semantics_ex2_mem_rw_D0_441,
			WE0 => main_ex_output_ex_output_fu_semantics_ex2_mem_rw_WE0_442
		);
	main_ex2_ex2_controller_semantics_ex2_mem_rw_Q0_439 <= ex2_mem_rw_Q0_438;
	main_fe_fe_controller_semantics_ex2_mem_rw_Q0_440 <= ex2_mem_rw_Q0_438;

	-- instance of 'ex2_dest_en' register:
	ex2_dest_en : d_ff_pipeline_t
		generic map (
			bit_width => 1,
			reset_value => "0"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX2_clear_Q0_443,
			STALL => pipe_EX2_stall_Q0_444,
			Q0(0) => ex2_dest_en_Q0_445,
			D0(0) => main_ex_output_ex_output_fu_semantics_ex2_dest_en_D0_448,
			WE0 => main_ex_output_ex_output_fu_semantics_ex2_dest_en_WE0_449
		);
	main_ex2_ex2_controller_semantics_ex2_dest_en_Q0_446 <= ex2_dest_en_Q0_445;
	main_wb_output_wb_output_fu_semantics_ex2_dest_en_Q0_447 <= ex2_dest_en_Q0_445;

	-- instance of 'ex2_cmp' register:
	ex2_cmp : d_ff_pipeline_t
		generic map (
			bit_width => 1,
			reset_value => "0"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX2_clear_Q0_450,
			STALL => pipe_EX2_stall_Q0_451,
			Q0(0) => main_ex2_ex2_controller_semantics_ex2_cmp_Q0_452,
			D0(0) => main_cond_compare_cond_compare_fu_semantics_ex2_cmp_D0_453,
			WE0 => main_cond_compare_cond_compare_fu_semantics_ex2_cmp_WE0_454
		);

	-- instance of 'ex2_alu' register:
	ex2_alu : d_ff_pipeline_t
		generic map (
			bit_width => 32,
			reset_value => "00000000000000000000000000000000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX2_clear_Q0_455,
			STALL => pipe_EX2_stall_Q0_456,
			Q0 => main_ex2_ex2_controller_semantics_ex2_alu_Q0_457,
			D0 => main_ex_output_ex_output_fu_semantics_ex2_alu_D0_458,
			WE0 => main_ex_output_ex_output_fu_semantics_ex2_alu_WE0_459
		);

	-- instance of 'ex2_mul' register:
	ex2_mul : d_ff_pipeline_t
		generic map (
			bit_width => 32,
			reset_value => "00000000000000000000000000000000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX2_clear_Q0_460,
			STALL => pipe_EX2_stall_Q0_461,
			Q0 => ex2_mul_Q0_462,
			D0 => main_ex_ex_controller_semantics_ex2_mul_D0_465,
			WE0 => main_ex_ex_controller_semantics_ex2_mul_WE0_466
		);
	main_ex2_ex2_controller_semantics_ex2_mul_Q0_463 <= ex2_mul_Q0_462;
	main_wb_output_wb_output_fu_semantics_ex2_mul_Q0_464 <= ex2_mul_Q0_462;

	-- instance of 'ex2_regB' register:
	ex2_regB : d_ff_pipeline_t
		generic map (
			bit_width => 32,
			reset_value => "00000000000000000000000000000000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX2_clear_Q0_467,
			STALL => pipe_EX2_stall_Q0_468,
			Q0 => main_ex2_ex2_controller_semantics_ex2_regB_Q0_469,
			D0 => main_ex_output_ex_output_fu_semantics_ex2_regB_D0_470,
			WE0 => main_ex_output_ex_output_fu_semantics_ex2_regB_WE0_471
		);

	-- instance of 'ex2_regC' register:
	ex2_regC : d_ff_pipeline_t
		generic map (
			bit_width => 32,
			reset_value => "00000000000000000000000000000000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_EX2_clear_Q0_472,
			STALL => pipe_EX2_stall_Q0_473,
			Q0 => main_ex2_ex2_controller_semantics_ex2_regC_Q0_474,
			D0 => main_ex_output_ex_output_fu_semantics_ex2_regC_D0_475,
			WE0 => main_ex_output_ex_output_fu_semantics_ex2_regC_WE0_476
		);

	-- instance of 'ex2_mem_wr_ack' register:
	ex2_mem_wr_ack : d_ff_plain_t
		generic map (
			bit_width => 1,
			reset_value => "0"
		)
		port map (
			CLK => CLK,
			RST => RST,
			Q0(0) => main_ex2_ex2_controller_semantics_ex2_mem_wr_ack_Q0_477,
			D0(0) => main_ex2_ex2_controller_semantics_ex2_mem_wr_ack_D0_478,
			WE0 => main_ex2_ex2_controller_semantics_ex2_mem_wr_ack_WE0_479
		);

	-- instance of 'ex2_alu_wb' signal:
	main_wb_output_wb_output_fu_semantics_ex2_alu_wb_Q0_480 <= ex2_alu_wb;

	ex2_alu_wb <= main_ex2_ex2_controller_semantics_ex2_alu_wb_D0_481;

	-- instance of 'wb_alu' register:
	wb_alu : d_ff_plain_t
		generic map (
			bit_width => 32,
			reset_value => "00000000000000000000000000000000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			Q0 => main_wb_output_wb_output_fu_semantics_wb_alu_Q0_482,
			D0 => main_ex2_ex2_controller_semantics_wb_alu_D0_483,
			WE0 => main_ex2_ex2_controller_semantics_wb_alu_WE0_484
		);

	-- instance of 'wb_alu_op' register:
	wb_alu_op : d_ff_pipeline_t
		generic map (
			bit_width => 6,
			reset_value => "000000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_WB_clear_Q0_485,
			STALL => pipe_WB_stall_Q0_486,
			Q0 => main_wb_output_wb_output_fu_semantics_wb_alu_op_Q0_487,
			D0 => main_ex2_ex2_controller_semantics_wb_alu_op_D0_488,
			WE0 => main_ex2_ex2_controller_semantics_wb_alu_op_WE0_489
		);

	-- instance of 'wb_rW' register:
	wb_rW : d_ff_pipeline_t
		generic map (
			bit_width => 5,
			reset_value => "00000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_WB_clear_Q0_490,
			STALL => pipe_WB_stall_Q0_491,
			Q0 => main_wb_output_wb_output_fu_semantics_wb_rW_Q0_492,
			D0 => main_ex2_ex2_controller_semantics_wb_rW_D0_493,
			WE0 => main_ex2_ex2_controller_semantics_wb_rW_WE0_494
		);

	-- instance of 'wb_mem_rw' register:
	wb_mem_rw : d_ff_pipeline_t
		generic map (
			bit_width => 4,
			reset_value => "0000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_WB_clear_Q0_495,
			STALL => pipe_WB_stall_Q0_496,
			Q0 => main_wb_wb_controller_semantics_wb_mem_rw_Q0_497,
			D0 => main_ex2_ex2_controller_semantics_wb_mem_rw_D0_498,
			WE0 => main_ex2_ex2_controller_semantics_wb_mem_rw_WE0_499
		);

	-- instance of 'wb_dest_en' register:
	wb_dest_en : d_ff_pipeline_t
		generic map (
			bit_width => 1,
			reset_value => "0"
		)
		port map (
			CLK => CLK,
			RST => RST,
			CLEAR => pipe_WB_clear_Q0_500,
			STALL => pipe_WB_stall_Q0_501,
			Q0(0) => main_wb_output_wb_output_fu_semantics_wb_dest_en_Q0_502,
			D0(0) => main_ex2_ex2_controller_semantics_wb_dest_en_D0_503,
			WE0 => main_ex2_ex2_controller_semantics_wb_dest_en_WE0_504
		);

	-- instance of 'wb_mem' signal:
	main_wb_output_wb_output_fu_semantics_wb_mem_Q0_505 <= wb_mem;

	wb_mem <= main_wb_wb_controller_semantics_wb_mem_D0_506;

	-- instance of 'wb_regs_W' signal:
	main_rd_rd_controller_semantics_wb_regs_W_Q0_507 <= wb_regs_W;
	main_wb_output_wb_output_fu_semantics_wb_regs_W_Q0_508 <= wb_regs_W;

	wb_regs_W <= main_wb_output_wb_output_fu_semantics_wb_regs_W_D0_509;

	-- instance of 'wb_regs_addrW' signal:
	main_rd_rd_controller_semantics_wb_regs_addrW_Q0_510 <= wb_regs_addrW;
	main_wb_output_wb_output_fu_semantics_wb_regs_addrW_Q0_511 <= wb_regs_addrW;

	wb_regs_addrW <= main_wb_output_wb_output_fu_semantics_wb_regs_addrW_D0_512;

	-- instance of 'wb_regs_we' signal:
	main_rd_rd_controller_semantics_wb_regs_we_Q0_513 <= wb_regs_we;
	main_wb_output_wb_output_fu_semantics_wb_regs_we_Q0_514 <= wb_regs_we;

	wb_regs_we <= main_wb_output_wb_output_fu_semantics_wb_regs_we_D0_515;

	-- instance of 'wb_pc_W' signal:
	main_fe_fe_controller_semantics_wb_pc_W_Q0_516 <= wb_pc_W;

	wb_pc_W <= main_wb_output_wb_output_fu_semantics_wb_pc_W_D0_517;

	-- instance of 'wb_pc_we' signal:
	main_fe_fe_controller_semantics_wb_pc_we_Q0_518 <= wb_pc_we;
	main_id_id_controller_semantics_wb_pc_we_Q0_519 <= wb_pc_we;
	main_wb_output_wb_output_fu_semantics_wb_pc_we_Q0_520 <= wb_pc_we;

	wb_pc_we <= main_wb_output_wb_output_fu_semantics_wb_pc_we_D0_521;

	-- instance of 'fe_stall' signal:
	main_fe_fe_controller_semantics_fe_stall_Q0_522 <= fe_stall;
	main_flow_logic_control_flow_logic_control_fu_semantics_fe_stall_Q0_523 <= fe_stall;

	fe_stall <= main_fe_fe_controller_semantics_fe_stall_D0_524;

	-- instance of 'id_stall' signal:
	main_fe_fe_controller_semantics_id_stall_Q0_525 <= id_stall;
	main_flow_logic_control_flow_logic_control_fu_semantics_id_stall_Q0_526 <= id_stall;

	id_stall <= main_id_id_controller_semantics_id_stall_D0_527;

	-- instance of 'id_clear' signal:
	main_flow_logic_control_flow_logic_control_fu_semantics_id_clear_Q0_528 <= id_clear;

	id_clear <= main_id_id_controller_semantics_id_clear_D0_529;

	-- instance of 'rd_stall' signal:
	main_flow_logic_control_flow_logic_control_fu_semantics_rd_stall_Q0_530 <= rd_stall;
	main_id_id_controller_semantics_rd_stall_Q0_531 <= rd_stall;

	rd_stall <= main_id_id_controller_semantics_rd_stall_D0_532;

	-- instance of 'rd_clear' signal:
	main_flow_logic_control_flow_logic_control_fu_semantics_rd_clear_Q0_533 <= rd_clear;

	rd_clear <= main_id_id_controller_semantics_rd_clear_D0_534;

	-- instance of 'ex_stall' signal:
	main_flow_logic_control_flow_logic_control_fu_semantics_ex_stall_Q0_535 <= ex_stall;
	main_id_id_controller_semantics_ex_stall_Q0_536 <= ex_stall;
	main_wb_output_wb_output_fu_semantics_ex_stall_Q0_537 <= ex_stall;

	ex_stall <= main_wb_output_wb_output_fu_semantics_ex_stall_D0_538;

	-- instance of 'ex_clear' signal:
	main_flow_logic_control_flow_logic_control_fu_semantics_ex_clear_Q0_539 <= ex_clear;

	ex_clear <= main_id_id_controller_semantics_ex_clear_D0_540;

	-- instance of 'ex2_stall' signal:
	main_flow_logic_control_flow_logic_control_fu_semantics_ex2_stall_Q0_541 <= ex2_stall;
	main_wb_output_wb_output_fu_semantics_ex2_stall_Q0_542 <= ex2_stall;

	ex2_stall <= main_wb_output_wb_output_fu_semantics_ex2_stall_D0_543;

	-- instance of 'ex2_clear' signal:
	main_flow_logic_control_flow_logic_control_fu_semantics_ex2_clear_Q0_544 <= ex2_clear;

	ex2_clear <= main_wb_output_wb_output_fu_semantics_ex2_clear_D0_545;

	-- instance of 'wb_stall' signal:
	main_flow_logic_control_flow_logic_control_fu_semantics_wb_stall_Q0_546 <= wb_stall;
	main_wb_output_wb_output_fu_semantics_wb_stall_Q0_547 <= wb_stall;

	wb_stall <= main_wb_output_wb_output_fu_semantics_wb_stall_D0_548;

	-- instance of 'wb_clear' signal:
	main_flow_logic_control_flow_logic_control_fu_semantics_wb_clear_Q0_549 <= wb_clear;

	wb_clear <= main_wb_output_wb_output_fu_semantics_wb_clear_D0_550;

	-- instance of 'i_mem_rq_stall' signal:
	main_fe_fe_controller_semantics_i_mem_rq_stall_Q0_551 <= i_mem_rq_stall;

	i_mem_rq_stall <= main_fe_fe_controller_semantics_i_mem_rq_stall_D0_552;

	-- instance of 'i_mem_rq_inv_stall' signal:
	main_wb_output_wb_output_fu_semantics_i_mem_rq_inv_stall_Q0_553 <= i_mem_rq_inv_stall;

	i_mem_rq_inv_stall <= main_ex2_ex2_controller_semantics_i_mem_rq_inv_stall_D0_554;

	-- instance of 'i_mem_fr_stall' signal:
	main_fe_fe_controller_semantics_i_mem_fr_stall_Q0_555 <= i_mem_fr_stall;

	i_mem_fr_stall <= main_id_id_controller_semantics_i_mem_fr_stall_D0_556;

	-- instance of 'd_mem_rq_stall' signal:
	main_wb_output_wb_output_fu_semantics_d_mem_rq_stall_Q0_557 <= d_mem_rq_stall;

	d_mem_rq_stall <= main_ex2_ex2_controller_semantics_d_mem_rq_stall_D0_558;

	-- instance of 'd_mem_fr_stall' signal:
	main_ex2_ex2_controller_semantics_d_mem_fr_stall_Q0_559 <= d_mem_fr_stall;
	main_wb_output_wb_output_fu_semantics_d_mem_fr_stall_Q0_560 <= d_mem_fr_stall;

	d_mem_fr_stall <= main_wb_wb_controller_semantics_d_mem_fr_stall_D0_561;

	-- instance of 'd_mem_fw_stall' signal:
	main_wb_output_wb_output_fu_semantics_d_mem_fw_stall_Q0_562 <= d_mem_fw_stall;

	d_mem_fw_stall <= main_ex2_ex2_controller_semantics_d_mem_fw_stall_D0_563;

	-- instance of 'ex_hazard_stall' signal:
	main_wb_output_wb_output_fu_semantics_ex_hazard_stall_Q0_564 <= ex_hazard_stall;

	ex_hazard_stall <= main_wb_output_wb_output_fu_semantics_ex_hazard_stall_D0_565;

	-- instance of 'ex2_hazard_stall' signal:
	main_wb_output_wb_output_fu_semantics_ex2_hazard_stall_Q0_566 <= ex2_hazard_stall;

	ex2_hazard_stall <= main_wb_output_wb_output_fu_semantics_ex2_hazard_stall_D0_567;

	-- instance of 'id_clear_reg' register:
	id_clear_reg : d_ff_plain_t
		generic map (
			bit_width => 1,
			reset_value => "0"
		)
		port map (
			CLK => CLK,
			RST => RST,
			Q0(0) => id_clear_reg_Q0_568,
			D0(0) => main_fe_fe_controller_semantics_id_clear_reg_D0_571,
			WE0 => main_fe_fe_controller_semantics_id_clear_reg_WE0_572
		);
	main_fe_fe_controller_semantics_id_clear_reg_Q0_569 <= id_clear_reg_Q0_568;
	main_id_id_controller_semantics_id_clear_reg_Q0_570 <= id_clear_reg_Q0_568;

	-- instance of 'id_stall_reg' register:
	id_stall_reg : d_ff_plain_t
		generic map (
			bit_width => 1,
			reset_value => "0"
		)
		port map (
			CLK => CLK,
			RST => RST,
			Q0(0) => main_fe_fe_controller_semantics_id_stall_reg_Q0_573,
			D0(0) => main_fe_fe_controller_semantics_id_stall_reg_D0_574,
			WE0 => main_fe_fe_controller_semantics_id_stall_reg_WE0_575
		);

	-- instance of 'pipe_RD_stall' signal:
	pipe_RD_stall_Q0_29 <= pipe_RD_stall;
	pipe_RD_stall_Q0_60 <= pipe_RD_stall;
	pipe_RD_stall_Q0_93 <= pipe_RD_stall;
	pipe_RD_stall_Q0_124 <= pipe_RD_stall;
	pipe_RD_stall_Q0_155 <= pipe_RD_stall;
	pipe_RD_stall_Q0_188 <= pipe_RD_stall;
	pipe_RD_stall_Q0_219 <= pipe_RD_stall;
	pipe_RD_stall_Q0_250 <= pipe_RD_stall;
	pipe_RD_stall_Q0_281 <= pipe_RD_stall;
	pipe_RD_stall_Q0_312 <= pipe_RD_stall;
	pipe_RD_stall_Q0_317 <= pipe_RD_stall;

	pipe_RD_stall <= main_flow_logic_control_flow_logic_control_fu_semantics_pipe_RD_stall_D0_576;

	-- instance of 'pipe_RD_clear' signal:
	pipe_RD_clear_Q0_28 <= pipe_RD_clear;
	pipe_RD_clear_Q0_59 <= pipe_RD_clear;
	pipe_RD_clear_Q0_92 <= pipe_RD_clear;
	pipe_RD_clear_Q0_123 <= pipe_RD_clear;
	pipe_RD_clear_Q0_154 <= pipe_RD_clear;
	pipe_RD_clear_Q0_187 <= pipe_RD_clear;
	pipe_RD_clear_Q0_218 <= pipe_RD_clear;
	pipe_RD_clear_Q0_249 <= pipe_RD_clear;
	pipe_RD_clear_Q0_280 <= pipe_RD_clear;
	pipe_RD_clear_Q0_311 <= pipe_RD_clear;
	pipe_RD_clear_Q0_316 <= pipe_RD_clear;

	pipe_RD_clear <= main_flow_logic_control_flow_logic_control_fu_semantics_pipe_RD_clear_D0_577;

	-- instance of 'pipe_EX_stall' signal:
	pipe_EX_stall_Q0_371 <= pipe_EX_stall;
	pipe_EX_stall_Q0_376 <= pipe_EX_stall;
	pipe_EX_stall_Q0_383 <= pipe_EX_stall;
	pipe_EX_stall_Q0_388 <= pipe_EX_stall;
	pipe_EX_stall_Q0_395 <= pipe_EX_stall;
	pipe_EX_stall_Q0_403 <= pipe_EX_stall;
	pipe_EX_stall_Q0_338 <= pipe_EX_stall;
	pipe_EX_stall_Q0_343 <= pipe_EX_stall;
	pipe_EX_stall_Q0_354 <= pipe_EX_stall;
	pipe_EX_stall_Q0_359 <= pipe_EX_stall;
	pipe_EX_stall_Q0_364 <= pipe_EX_stall;

	pipe_EX_stall <= main_flow_logic_control_flow_logic_control_fu_semantics_pipe_EX_stall_D0_578;

	-- instance of 'pipe_EX_clear' signal:
	pipe_EX_clear_Q0_370 <= pipe_EX_clear;
	pipe_EX_clear_Q0_375 <= pipe_EX_clear;
	pipe_EX_clear_Q0_382 <= pipe_EX_clear;
	pipe_EX_clear_Q0_387 <= pipe_EX_clear;
	pipe_EX_clear_Q0_394 <= pipe_EX_clear;
	pipe_EX_clear_Q0_402 <= pipe_EX_clear;
	pipe_EX_clear_Q0_337 <= pipe_EX_clear;
	pipe_EX_clear_Q0_342 <= pipe_EX_clear;
	pipe_EX_clear_Q0_353 <= pipe_EX_clear;
	pipe_EX_clear_Q0_358 <= pipe_EX_clear;
	pipe_EX_clear_Q0_363 <= pipe_EX_clear;

	pipe_EX_clear <= main_flow_logic_control_flow_logic_control_fu_semantics_pipe_EX_clear_D0_579;

	-- instance of 'pipe_EX2_stall' signal:
	pipe_EX2_stall_Q0_423 <= pipe_EX2_stall;
	pipe_EX2_stall_Q0_430 <= pipe_EX2_stall;
	pipe_EX2_stall_Q0_456 <= pipe_EX2_stall;
	pipe_EX2_stall_Q0_437 <= pipe_EX2_stall;
	pipe_EX2_stall_Q0_444 <= pipe_EX2_stall;
	pipe_EX2_stall_Q0_451 <= pipe_EX2_stall;
	pipe_EX2_stall_Q0_468 <= pipe_EX2_stall;
	pipe_EX2_stall_Q0_473 <= pipe_EX2_stall;
	pipe_EX2_stall_Q0_461 <= pipe_EX2_stall;

	pipe_EX2_stall <= main_flow_logic_control_flow_logic_control_fu_semantics_pipe_EX2_stall_D0_580;

	-- instance of 'pipe_EX2_clear' signal:
	pipe_EX2_clear_Q0_422 <= pipe_EX2_clear;
	pipe_EX2_clear_Q0_429 <= pipe_EX2_clear;
	pipe_EX2_clear_Q0_455 <= pipe_EX2_clear;
	pipe_EX2_clear_Q0_436 <= pipe_EX2_clear;
	pipe_EX2_clear_Q0_443 <= pipe_EX2_clear;
	pipe_EX2_clear_Q0_450 <= pipe_EX2_clear;
	pipe_EX2_clear_Q0_467 <= pipe_EX2_clear;
	pipe_EX2_clear_Q0_472 <= pipe_EX2_clear;
	pipe_EX2_clear_Q0_460 <= pipe_EX2_clear;

	pipe_EX2_clear <= main_flow_logic_control_flow_logic_control_fu_semantics_pipe_EX2_clear_D0_581;

	-- instance of 'pipe_WB_stall' signal:
	pipe_WB_stall_Q0_486 <= pipe_WB_stall;
	pipe_WB_stall_Q0_491 <= pipe_WB_stall;
	pipe_WB_stall_Q0_501 <= pipe_WB_stall;
	pipe_WB_stall_Q0_496 <= pipe_WB_stall;

	pipe_WB_stall <= main_flow_logic_control_flow_logic_control_fu_semantics_pipe_WB_stall_D0_582;

	-- instance of 'pipe_WB_clear' signal:
	pipe_WB_clear_Q0_485 <= pipe_WB_clear;
	pipe_WB_clear_Q0_490 <= pipe_WB_clear;
	pipe_WB_clear_Q0_500 <= pipe_WB_clear;
	pipe_WB_clear_Q0_495 <= pipe_WB_clear;

	pipe_WB_clear <= main_flow_logic_control_flow_logic_control_fu_semantics_pipe_WB_clear_D0_583;

	-- instance of 'codasip_attribute_L_main_0_instr_hw_srcB_am_imm3_val_0' signal:
	main_0_imm3_srcB_am_instr_hw_0_return_codasip_attribute_L_main_0_instr_hw_srcB_am_imm3_val_0_Q0_584 <= codasip_attribute_L_main_0_instr_hw_srcB_am_imm3_val_0;

	codasip_attribute_L_main_0_instr_hw_srcB_am_imm3_val_0 <= main_instr_hw_instr_hw_codasip_attribute_L_main_0_instr_hw_srcB_am_imm3_val_0_D0_585;

	-- instance of 'codasip_attribute_L_main_0_instr_hw_srcB_op_imm1_val_0' signal:
	main_0_imm1_srcB_op_instr_hw_0_return_codasip_attribute_L_main_0_instr_hw_srcB_op_imm1_val_0_Q0_586 <= codasip_attribute_L_main_0_instr_hw_srcB_op_imm1_val_0;

	codasip_attribute_L_main_0_instr_hw_srcB_op_imm1_val_0 <= main_instr_hw_instr_hw_codasip_attribute_L_main_0_instr_hw_srcB_op_imm1_val_0_D0_587;

	-- instance of 'codasip_attribute_L_main_0_instr_hw_srcC_op_imm1_val_0' signal:
	main_0_imm1_srcC_op_instr_hw_0_return_codasip_attribute_L_main_0_instr_hw_srcC_op_imm1_val_0_Q0_588 <= codasip_attribute_L_main_0_instr_hw_srcC_op_imm1_val_0;

	codasip_attribute_L_main_0_instr_hw_srcC_op_imm1_val_0 <= main_instr_hw_instr_hw_codasip_attribute_L_main_0_instr_hw_srcC_op_imm1_val_0_D0_589;

	-- instance of 'codasip_instance_main_0_instr_hw_cond_cond_cmp_0' signal:
	main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_Q0_590 <= codasip_instance_main_0_instr_hw_cond_cond_cmp_0;
	main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_Q0_591 <= codasip_instance_main_0_instr_hw_cond_cond_cmp_0;

	codasip_instance_main_0_instr_hw_cond_cond_cmp_0 <= main_0_op_binand_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_592 or
		main_0_op_binnand_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_593 or
		main_0_op_eq_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_594 or
		main_0_op_logand_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_595 or
		main_0_op_lognand_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_596 or
		main_0_op_lognor_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_597 or
		main_0_op_logor_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_598 or
		main_0_op_ne_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_599 or
		main_0_op_sge_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_600 or
		main_0_op_sgt_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_601 or
		main_0_op_sle_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_602 or
		main_0_op_slt_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_603 or
		main_0_op_uge_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_604 or
		main_0_op_ugt_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_605 or
		main_0_op_ule_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_606 or
		main_0_op_ult_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_607;

	-- instance of 'codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0' signal:
	main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_Q0_608 <= codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0;

	codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0 <= main_0_op_addi_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_609 or
		main_0_op_andi_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_610 or
		main_0_op_ashri_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_611 or
		main_0_op_lshri_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_612 or
		main_0_op_lui_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_613 or
		main_0_op_mulsi_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_614 or
		main_0_op_mului_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_615 or
		main_0_op_nori_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_616 or
		main_0_op_ori_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_617 or
		main_0_op_shli_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_618 or
		main_0_op_subi_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_619 or
		main_0_op_xori_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_620;

	-- instance of 'codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0' signal:
	main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_Q0_621 <= codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0;

	codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0 <= main_0_op_add_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_622 or
		main_0_op_addadd_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_623 or
		main_0_op_addmul_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_624 or
		main_0_op_addsub_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_625 or
		main_0_op_and_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_626 or
		main_0_op_ashr_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_627 or
		main_0_op_ctlz_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_628 or
		main_0_op_cttz_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_629 or
		main_0_op_lshr_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_630 or
		main_0_op_mul_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_631 or
		main_0_op_nor_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_632 or
		main_0_op_or_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_633 or
		main_0_op_sext16_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_634 or
		main_0_op_sext8_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_635 or
		main_0_op_shl_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_636 or
		main_0_op_sub_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_637 or
		main_0_op_subadd_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_638 or
		main_0_op_submul_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_639 or
		main_0_op_subsub_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_640 or
		main_0_op_xor_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_641;

	-- instance of 'codasip_instance_main_0_instr_hw_operation_opr_jump_call_0' signal:
	main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_Q0_642 <= codasip_instance_main_0_instr_hw_operation_opr_jump_call_0;

	codasip_instance_main_0_instr_hw_operation_opr_jump_call_0 <= main_0_op_call_exc_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0_643 or
		main_0_op_call_int_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0_644 or
		main_0_op_call_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0_645 or
		main_0_op_jump_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0_646;

	-- instance of 'codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0' signal:
	main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_Q0_647 <= codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0;

	codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0 <= main_0_op_call_reg_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_D0_648 or
		main_0_op_jump_ie_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_D0_649 or
		main_0_op_jump_reg_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_D0_650;

	-- instance of 'codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0' signal:
	main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_Q0_651 <= codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0;

	codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0 <= main_0_op_ld_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0_652 or
		main_0_op_ldbs_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0_653 or
		main_0_op_ldbu_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0_654 or
		main_0_op_ldhs_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0_655 or
		main_0_op_ldhu_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0_656;

	-- instance of 'codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0' signal:
	main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_Q0_657 <= codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0;

	codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0 <= main_0_op_ldbsx_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0_658 or
		main_0_op_ldbux_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0_659 or
		main_0_op_ldhsx_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0_660 or
		main_0_op_ldhux_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0_661 or
		main_0_op_ldx_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0_662;

	-- instance of 'codasip_instance_main_0_instr_hw_operation_opr_move_0' signal:
	main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_move_0_Q0_663 <= codasip_instance_main_0_instr_hw_operation_opr_move_0;

	codasip_instance_main_0_instr_hw_operation_opr_move_0 <= main_0_op_move_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_move_0_D0_664 or
		main_0_op_select_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_move_0_D0_665 or
		main_0_op_test_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_move_0_D0_666;

	-- instance of 'codasip_instance_main_0_instr_hw_operation_opr_st_imm_0' signal:
	main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_Q0_667 <= codasip_instance_main_0_instr_hw_operation_opr_st_imm_0;

	codasip_instance_main_0_instr_hw_operation_opr_st_imm_0 <= main_0_op_st_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_D0_668 or
		main_0_op_stb_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_D0_669 or
		main_0_op_sth_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_D0_670;

	-- instance of 'codasip_instance_main_0_instr_hw_operation_opr_st_reg_0' signal:
	main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_Q0_671 <= codasip_instance_main_0_instr_hw_operation_opr_st_reg_0;

	codasip_instance_main_0_instr_hw_operation_opr_st_reg_0 <= main_0_op_stbx_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_D0_672 or
		main_0_op_sthx_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_D0_673 or
		main_0_op_stx_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_D0_674;

	-- instance of 'codasip_instance_main_0_instr_hw_operation_opr_system_0' signal:
	main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_system_0_Q0_675 <= codasip_instance_main_0_instr_hw_operation_opr_system_0;

	codasip_instance_main_0_instr_hw_operation_opr_system_0 <= main_0_op_halt_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_system_0_D0_676 or
		main_0_op_int_dis_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_system_0_D0_677 or
		main_0_op_int_en_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_system_0_D0_678;

	-- instance of 'codasip_instance_main_0_instr_hw_operation_opr_system_rd_0' signal:
	main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_system_rd_0_Q0_679 <= codasip_instance_main_0_instr_hw_operation_opr_system_rd_0;

	codasip_instance_main_0_instr_hw_operation_opr_system_rd_0 <= main_0_op_printreg_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_system_rd_0_D0_680 or
		main_0_op_set_status_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_system_rd_0_D0_681;

	-- instance of 'codasip_instance_main_0_instr_hw_operation_opr_system_wr_0' signal:

	codasip_instance_main_0_instr_hw_operation_opr_system_wr_0 <= main_0_op_get_status_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_system_wr_0_D0_682;

	-- instance of 'codasip_instance_main_0_instr_hw_srcB_am_imm3_0' signal:
	main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0_683 <= codasip_instance_main_0_instr_hw_srcB_am_imm3_0;
	main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0_684 <= codasip_instance_main_0_instr_hw_srcB_am_imm3_0;
	main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0_685 <= codasip_instance_main_0_instr_hw_srcB_am_imm3_0;

	codasip_instance_main_0_instr_hw_srcB_am_imm3_0 <= main_0_imm3_srcB_am_instr_hw_0_return_codasip_instance_main_0_instr_hw_srcB_am_imm3_0_D0_686;

	-- instance of 'codasip_instance_main_0_instr_hw_srcB_op_imm1_0' signal:
	main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_srcB_op_imm1_0_Q0_687 <= codasip_instance_main_0_instr_hw_srcB_op_imm1_0;
	main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_srcB_op_imm1_0_Q0_688 <= codasip_instance_main_0_instr_hw_srcB_op_imm1_0;

	codasip_instance_main_0_instr_hw_srcB_op_imm1_0 <= main_0_imm1_srcB_op_instr_hw_0_return_codasip_instance_main_0_instr_hw_srcB_op_imm1_0_D0_689;

	-- instance of 'codasip_instance_main_0_instr_hw_srcC_op_imm1_0' signal:
	main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_srcC_op_imm1_0_Q0_690 <= codasip_instance_main_0_instr_hw_srcC_op_imm1_0;

	codasip_instance_main_0_instr_hw_srcC_op_imm1_0 <= main_0_imm1_srcC_op_instr_hw_0_return_codasip_instance_main_0_instr_hw_srcC_op_imm1_0_D0_691;

	-- instance of 'main_0_imm1_srcB_op_instr_hw_0_return' functional unit:
	main_0_imm1_srcB_op_instr_hw_0_return : codix_risc_ca_core_main_0_imm1_srcB_op_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_imm1_srcB_op_instr_hw_0_return_ACT_692,
			codasip_attribute_L_main_0_instr_hw_srcB_op_imm1_val_0_Q0 => main_0_imm1_srcB_op_instr_hw_0_return_codasip_attribute_L_main_0_instr_hw_srcB_op_imm1_val_0_Q0_586,
			codasip_instance_main_0_instr_hw_srcB_op_imm1_0_D0 => main_0_imm1_srcB_op_instr_hw_0_return_codasip_instance_main_0_instr_hw_srcB_op_imm1_0_D0_689
		);

	-- instance of 'main_0_imm1_srcC_op_instr_hw_0_return' functional unit:
	main_0_imm1_srcC_op_instr_hw_0_return : codix_risc_ca_core_main_0_imm1_srcC_op_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_imm1_srcC_op_instr_hw_0_return_ACT_693,
			codasip_attribute_L_main_0_instr_hw_srcC_op_imm1_val_0_Q0 => main_0_imm1_srcC_op_instr_hw_0_return_codasip_attribute_L_main_0_instr_hw_srcC_op_imm1_val_0_Q0_588,
			codasip_instance_main_0_instr_hw_srcC_op_imm1_0_D0 => main_0_imm1_srcC_op_instr_hw_0_return_codasip_instance_main_0_instr_hw_srcC_op_imm1_0_D0_691
		);

	-- instance of 'main_0_imm3_srcB_am_instr_hw_0_return' functional unit:
	main_0_imm3_srcB_am_instr_hw_0_return : codix_risc_ca_core_main_0_imm3_srcB_am_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_imm3_srcB_am_instr_hw_0_return_ACT_694,
			codasip_attribute_L_main_0_instr_hw_srcB_am_imm3_val_0_Q0 => main_0_imm3_srcB_am_instr_hw_0_return_codasip_attribute_L_main_0_instr_hw_srcB_am_imm3_val_0_Q0_584,
			codasip_instance_main_0_instr_hw_srcB_am_imm3_0_D0 => main_0_imm3_srcB_am_instr_hw_0_return_codasip_instance_main_0_instr_hw_srcB_am_imm3_0_D0_686
		);

	-- instance of 'main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics' functional unit:
	main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics : codix_risc_ca_core_main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_ACT_695,
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_Q0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_Q0_608,
			rd_alu_op_D0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_65,
			rd_alu_op_WE0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_79,
			rd_mem_rw_D0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_32,
			rd_mem_rw_WE0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_46,
			rd_dest_en_mux_D0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_127,
			rd_dest_en_mux_WE0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_141,
			rd_cond_D0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_cond_D0_96,
			rd_cond_WE0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_cond_WE0_110,
			rd_ie_flag_D0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_160,
			rd_ie_flag_WE0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_174,
			rd_amB_D0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_amB_D0_253,
			rd_amB_WE0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_amB_WE0_267,
			rd_amC_D0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_amC_D0_284,
			rd_amC_WE0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_amC_WE0_298,
			rd_aluA_mux_D0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_191,
			rd_aluA_mux_WE0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_205,
			rd_aluB_mux_D0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_222,
			rd_aluB_mux_WE0 => main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_236
		);

	-- instance of 'main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics' functional unit:
	main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics : codix_risc_ca_core_main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_ACT_696,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_Q0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_Q0_621,
			rd_alu_op_D0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_66,
			rd_alu_op_WE0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_80,
			rd_mem_rw_D0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_33,
			rd_mem_rw_WE0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_47,
			rd_dest_en_mux_D0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_128,
			rd_dest_en_mux_WE0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_142,
			rd_cond_D0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_cond_D0_97,
			rd_cond_WE0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_cond_WE0_111,
			rd_ie_flag_D0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_161,
			rd_ie_flag_WE0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_175,
			codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0_683,
			rd_amB_D0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_amB_D0_254,
			rd_amB_WE0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_amB_WE0_268,
			rd_amC_D0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_amC_D0_285,
			rd_amC_WE0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_amC_WE0_299,
			rd_aluA_mux_D0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_192,
			rd_aluA_mux_WE0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_206,
			rd_aluB_mux_D0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_223,
			rd_aluB_mux_WE0 => main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_237
		);

	-- instance of 'main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics' functional unit:
	main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics : codix_risc_ca_core_main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_ACT_697,
			rd_mem_rw_D0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_34,
			rd_mem_rw_WE0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_48,
			rd_dest_en_mux_D0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_129,
			rd_dest_en_mux_WE0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_143,
			rd_cond_D0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_cond_D0_98,
			rd_cond_WE0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_cond_WE0_112,
			codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_Q0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_Q0_642,
			rd_ie_flag_D0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_162,
			rd_ie_flag_WE0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_176,
			rd_amB_D0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_amB_D0_255,
			rd_amB_WE0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_amB_WE0_269,
			rd_amC_D0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_amC_D0_286,
			rd_amC_WE0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_amC_WE0_300,
			rd_aluA_mux_D0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_193,
			rd_aluA_mux_WE0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_207,
			rd_aluB_mux_D0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_224,
			rd_aluB_mux_WE0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_238,
			rd_alu_op_D0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_67,
			rd_alu_op_WE0 => main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_81
		);

	-- instance of 'main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics' functional unit:
	main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics : codix_risc_ca_core_main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_ACT_698,
			codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_Q0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_Q0_647,
			rd_alu_op_D0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_68,
			rd_alu_op_WE0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_82,
			rd_mem_rw_D0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_35,
			rd_mem_rw_WE0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_49,
			rd_dest_en_mux_D0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_130,
			rd_dest_en_mux_WE0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_144,
			rd_cond_D0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_cond_D0_99,
			rd_cond_WE0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_cond_WE0_113,
			rd_ie_flag_D0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_163,
			rd_ie_flag_WE0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_177,
			rd_amB_D0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_amB_D0_256,
			rd_amB_WE0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_amB_WE0_270,
			rd_amC_D0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_amC_D0_287,
			rd_amC_WE0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_amC_WE0_301,
			rd_aluA_mux_D0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_194,
			rd_aluA_mux_WE0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_208,
			rd_aluB_mux_D0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_225,
			rd_aluB_mux_WE0 => main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_239
		);

	-- instance of 'main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics' functional unit:
	main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics : codix_risc_ca_core_main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_ACT_699,
			rd_alu_op_D0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_69,
			rd_alu_op_WE0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_83,
			rd_mem_rw_D0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_36,
			rd_mem_rw_WE0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_50,
			rd_dest_en_mux_D0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_131,
			rd_dest_en_mux_WE0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_145,
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_Q0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_Q0_590,
			rd_cond_D0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_cond_D0_100,
			rd_cond_WE0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_cond_WE0_114,
			rd_ie_flag_D0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_164,
			rd_ie_flag_WE0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_178,
			codasip_instance_main_0_instr_hw_srcB_op_imm1_0_Q0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_srcB_op_imm1_0_Q0_687,
			rd_amB_D0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_amB_D0_257,
			rd_amB_WE0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_amB_WE0_271,
			rd_amC_D0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_amC_D0_288,
			rd_amC_WE0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_amC_WE0_302,
			rd_aluA_mux_D0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_195,
			rd_aluA_mux_WE0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_209,
			rd_aluB_mux_D0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_226,
			rd_aluB_mux_WE0 => main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_240
		);

	-- instance of 'main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics' functional unit:
	main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics : codix_risc_ca_core_main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_ACT_700,
			rd_alu_op_D0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_70,
			rd_alu_op_WE0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_84,
			codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_Q0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_Q0_651,
			rd_mem_rw_D0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_37,
			rd_mem_rw_WE0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_51,
			rd_dest_en_mux_D0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_132,
			rd_dest_en_mux_WE0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_146,
			rd_cond_D0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_cond_D0_101,
			rd_cond_WE0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_cond_WE0_115,
			rd_ie_flag_D0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_165,
			rd_ie_flag_WE0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_179,
			rd_amB_D0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_amB_D0_258,
			rd_amB_WE0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_amB_WE0_272,
			rd_amC_D0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_amC_D0_289,
			rd_amC_WE0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_amC_WE0_303,
			rd_aluA_mux_D0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_196,
			rd_aluA_mux_WE0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_210,
			rd_aluB_mux_D0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_227,
			rd_aluB_mux_WE0 => main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_241
		);

	-- instance of 'main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics' functional unit:
	main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics : codix_risc_ca_core_main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_ACT_701,
			rd_alu_op_D0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_71,
			rd_alu_op_WE0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_85,
			codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_Q0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_Q0_657,
			rd_mem_rw_D0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_38,
			rd_mem_rw_WE0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_52,
			rd_dest_en_mux_D0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_133,
			rd_dest_en_mux_WE0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_147,
			rd_cond_D0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_cond_D0_102,
			rd_cond_WE0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_cond_WE0_116,
			rd_ie_flag_D0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_166,
			rd_ie_flag_WE0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_180,
			codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0_684,
			rd_amB_D0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_amB_D0_259,
			rd_amB_WE0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_amB_WE0_273,
			rd_amC_D0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_amC_D0_290,
			rd_amC_WE0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_amC_WE0_304,
			rd_aluA_mux_D0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_197,
			rd_aluA_mux_WE0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_211,
			rd_aluB_mux_D0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_228,
			rd_aluB_mux_WE0 => main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_242
		);

	-- instance of 'main_0_instr_hw_move_instr_hw_instr_hw_0_semantics' functional unit:
	main_0_instr_hw_move_instr_hw_instr_hw_0_semantics : codix_risc_ca_core_main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_ACT_702,
			codasip_instance_main_0_instr_hw_operation_opr_move_0_Q0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_move_0_Q0_663,
			rd_alu_op_D0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_72,
			rd_alu_op_WE0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_86,
			rd_dest_en_mux_D0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_134,
			rd_dest_en_mux_WE0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_148,
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_Q0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_Q0_591,
			rd_cond_D0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_cond_D0_103,
			rd_cond_WE0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_cond_WE0_117,
			rd_mem_rw_D0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_39,
			rd_mem_rw_WE0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_53,
			rd_ie_flag_D0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_167,
			rd_ie_flag_WE0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_181,
			codasip_instance_main_0_instr_hw_srcB_op_imm1_0_Q0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_srcB_op_imm1_0_Q0_688,
			rd_amB_D0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_amB_D0_260,
			rd_amB_WE0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_amB_WE0_274,
			codasip_instance_main_0_instr_hw_srcC_op_imm1_0_Q0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_srcC_op_imm1_0_Q0_690,
			rd_amC_D0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_amC_D0_291,
			rd_amC_WE0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_amC_WE0_305,
			rd_aluA_mux_D0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_198,
			rd_aluA_mux_WE0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_212,
			rd_aluB_mux_D0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_229,
			rd_aluB_mux_WE0 => main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_243
		);

	-- instance of 'main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics' functional unit:
	main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics : codix_risc_ca_core_main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_ACT_703,
			rd_alu_op_D0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_73,
			rd_alu_op_WE0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_87,
			codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_Q0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_Q0_667,
			rd_mem_rw_D0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_40,
			rd_mem_rw_WE0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_54,
			rd_dest_en_mux_D0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_135,
			rd_dest_en_mux_WE0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_149,
			rd_cond_D0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_cond_D0_104,
			rd_cond_WE0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_cond_WE0_118,
			rd_ie_flag_D0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_168,
			rd_ie_flag_WE0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_182,
			rd_amB_D0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_amB_D0_261,
			rd_amB_WE0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_amB_WE0_275,
			rd_amC_D0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_amC_D0_292,
			rd_amC_WE0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_amC_WE0_306,
			rd_aluA_mux_D0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_199,
			rd_aluA_mux_WE0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_213,
			rd_aluB_mux_D0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_230,
			rd_aluB_mux_WE0 => main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_244
		);

	-- instance of 'main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics' functional unit:
	main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics : codix_risc_ca_core_main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_ACT_704,
			rd_alu_op_D0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_74,
			rd_alu_op_WE0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_88,
			codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_Q0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_Q0_671,
			rd_mem_rw_D0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_41,
			rd_mem_rw_WE0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_55,
			rd_dest_en_mux_D0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_136,
			rd_dest_en_mux_WE0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_150,
			rd_cond_D0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_cond_D0_105,
			rd_cond_WE0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_cond_WE0_119,
			rd_ie_flag_D0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_169,
			rd_ie_flag_WE0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_183,
			codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0_685,
			rd_amB_D0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_amB_D0_262,
			rd_amB_WE0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_amB_WE0_276,
			rd_amC_D0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_amC_D0_293,
			rd_amC_WE0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_amC_WE0_307,
			rd_aluA_mux_D0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_200,
			rd_aluA_mux_WE0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_214,
			rd_aluB_mux_D0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_231,
			rd_aluB_mux_WE0 => main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_245
		);

	-- instance of 'main_0_instr_hw_system_instr_hw_instr_hw_0_semantics' functional unit:
	main_0_instr_hw_system_instr_hw_instr_hw_0_semantics : codix_risc_ca_core_main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_ACT_705,
			codasip_instance_main_0_instr_hw_operation_opr_system_0_Q0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_system_0_Q0_675,
			rd_alu_op_D0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_75,
			rd_alu_op_WE0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_89,
			rd_mem_rw_D0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_42,
			rd_mem_rw_WE0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_56,
			rd_dest_en_mux_D0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_137,
			rd_dest_en_mux_WE0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_151,
			rd_cond_D0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_cond_D0_106,
			rd_cond_WE0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_cond_WE0_120,
			rd_ie_flag_D0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_170,
			rd_ie_flag_WE0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_184,
			rd_amB_D0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_amB_D0_263,
			rd_amB_WE0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_amB_WE0_277,
			rd_amC_D0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_amC_D0_294,
			rd_amC_WE0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_amC_WE0_308,
			rd_aluA_mux_D0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_201,
			rd_aluA_mux_WE0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_215,
			rd_aluB_mux_D0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_232,
			rd_aluB_mux_WE0 => main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_246
		);

	-- instance of 'main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics' functional unit:
	main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics : codix_risc_ca_core_main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_ACT_706,
			codasip_instance_main_0_instr_hw_operation_opr_system_rd_0_Q0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_codasip_instance_main_0_instr_hw_operation_opr_system_rd_0_Q0_679,
			rd_alu_op_D0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_76,
			rd_alu_op_WE0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_90,
			rd_mem_rw_D0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_43,
			rd_mem_rw_WE0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_57,
			rd_dest_en_mux_D0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_138,
			rd_dest_en_mux_WE0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_152,
			rd_cond_D0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_cond_D0_107,
			rd_cond_WE0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_cond_WE0_121,
			rd_ie_flag_D0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_171,
			rd_ie_flag_WE0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_185,
			rd_amB_D0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_amB_D0_264,
			rd_amB_WE0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_amB_WE0_278,
			rd_amC_D0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_amC_D0_295,
			rd_amC_WE0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_amC_WE0_309,
			rd_aluA_mux_D0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_202,
			rd_aluA_mux_WE0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_216,
			rd_aluB_mux_D0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_233,
			rd_aluB_mux_WE0 => main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_247
		);

	-- instance of 'main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics' functional unit:
	main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics : codix_risc_ca_core_main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_ACT_707,
			rd_alu_op_D0 => main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_alu_op_D0_77,
			rd_alu_op_WE0 => main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_alu_op_WE0_91,
			rd_mem_rw_D0 => main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_mem_rw_D0_44,
			rd_mem_rw_WE0 => main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_mem_rw_WE0_58,
			rd_dest_en_mux_D0 => main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_D0_139,
			rd_dest_en_mux_WE0 => main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_dest_en_mux_WE0_153,
			rd_cond_D0 => main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_cond_D0_108,
			rd_cond_WE0 => main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_cond_WE0_122,
			rd_ie_flag_D0 => main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_ie_flag_D0_172,
			rd_ie_flag_WE0 => main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_ie_flag_WE0_186,
			rd_amB_D0 => main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_amB_D0_265,
			rd_amB_WE0 => main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_amB_WE0_279,
			rd_amC_D0 => main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_amC_D0_296,
			rd_amC_WE0 => main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_amC_WE0_310,
			rd_aluA_mux_D0 => main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_aluA_mux_D0_203,
			rd_aluA_mux_WE0 => main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_aluA_mux_WE0_217,
			rd_aluB_mux_D0 => main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_aluB_mux_D0_234,
			rd_aluB_mux_WE0 => main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_rd_aluB_mux_WE0_248
		);

	-- instance of 'main_0_op_add_operation_instr_hw_0_return' functional unit:
	main_0_op_add_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_add_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_add_operation_instr_hw_0_return_ACT_708,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_add_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_622
		);

	-- instance of 'main_0_op_addadd_operation_instr_hw_0_return' functional unit:
	main_0_op_addadd_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_addadd_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_addadd_operation_instr_hw_0_return_ACT_709,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_addadd_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_623
		);

	-- instance of 'main_0_op_addi_operation_instr_hw_0_return' functional unit:
	main_0_op_addi_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_addi_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_addi_operation_instr_hw_0_return_ACT_710,
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 => main_0_op_addi_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_609
		);

	-- instance of 'main_0_op_addmul_operation_instr_hw_0_return' functional unit:
	main_0_op_addmul_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_addmul_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_addmul_operation_instr_hw_0_return_ACT_711,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_addmul_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_624
		);

	-- instance of 'main_0_op_addsub_operation_instr_hw_0_return' functional unit:
	main_0_op_addsub_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_addsub_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_addsub_operation_instr_hw_0_return_ACT_712,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_addsub_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_625
		);

	-- instance of 'main_0_op_and_operation_instr_hw_0_return' functional unit:
	main_0_op_and_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_and_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_and_operation_instr_hw_0_return_ACT_713,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_and_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_626
		);

	-- instance of 'main_0_op_andi_operation_instr_hw_0_return' functional unit:
	main_0_op_andi_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_andi_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_andi_operation_instr_hw_0_return_ACT_714,
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 => main_0_op_andi_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_610
		);

	-- instance of 'main_0_op_ashr_operation_instr_hw_0_return' functional unit:
	main_0_op_ashr_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_ashr_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_ashr_operation_instr_hw_0_return_ACT_715,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_ashr_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_627
		);

	-- instance of 'main_0_op_ashri_operation_instr_hw_0_return' functional unit:
	main_0_op_ashri_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_ashri_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_ashri_operation_instr_hw_0_return_ACT_716,
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 => main_0_op_ashri_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_611
		);

	-- instance of 'main_0_op_binand_cond_instr_hw_0_return' functional unit:
	main_0_op_binand_cond_instr_hw_0_return : codix_risc_ca_core_main_0_op_binand_cond_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_binand_cond_instr_hw_0_return_ACT_717,
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 => main_0_op_binand_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_592
		);

	-- instance of 'main_0_op_binnand_cond_instr_hw_0_return' functional unit:
	main_0_op_binnand_cond_instr_hw_0_return : codix_risc_ca_core_main_0_op_binnand_cond_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_binnand_cond_instr_hw_0_return_ACT_718,
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 => main_0_op_binnand_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_593
		);

	-- instance of 'main_0_op_call_exc_operation_instr_hw_0_return' functional unit:
	main_0_op_call_exc_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_call_exc_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_call_exc_operation_instr_hw_0_return_ACT_719,
			codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0 => main_0_op_call_exc_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0_643
		);

	-- instance of 'main_0_op_call_int_operation_instr_hw_0_return' functional unit:
	main_0_op_call_int_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_call_int_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_call_int_operation_instr_hw_0_return_ACT_720,
			codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0 => main_0_op_call_int_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0_644
		);

	-- instance of 'main_0_op_call_operation_instr_hw_0_return' functional unit:
	main_0_op_call_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_call_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_call_operation_instr_hw_0_return_ACT_721,
			codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0 => main_0_op_call_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0_645
		);

	-- instance of 'main_0_op_call_reg_operation_instr_hw_0_return' functional unit:
	main_0_op_call_reg_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_call_reg_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_call_reg_operation_instr_hw_0_return_ACT_722,
			codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_D0 => main_0_op_call_reg_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_D0_648
		);

	-- instance of 'main_0_op_ctlz_operation_instr_hw_0_return' functional unit:
	main_0_op_ctlz_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_ctlz_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_ctlz_operation_instr_hw_0_return_ACT_723,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_ctlz_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_628
		);

	-- instance of 'main_0_op_cttz_operation_instr_hw_0_return' functional unit:
	main_0_op_cttz_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_cttz_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_cttz_operation_instr_hw_0_return_ACT_724,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_cttz_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_629
		);

	-- instance of 'main_0_op_eq_cond_instr_hw_0_return' functional unit:
	main_0_op_eq_cond_instr_hw_0_return : codix_risc_ca_core_main_0_op_eq_cond_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_eq_cond_instr_hw_0_return_ACT_725,
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 => main_0_op_eq_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_594
		);

	-- instance of 'main_0_op_get_status_operation_instr_hw_0_return' functional unit:
	main_0_op_get_status_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_get_status_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_get_status_operation_instr_hw_0_return_ACT_726,
			codasip_instance_main_0_instr_hw_operation_opr_system_wr_0_D0 => main_0_op_get_status_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_system_wr_0_D0_682
		);

	-- instance of 'main_0_op_halt_operation_instr_hw_0_return' functional unit:
	main_0_op_halt_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_halt_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_halt_operation_instr_hw_0_return_ACT_727,
			codasip_instance_main_0_instr_hw_operation_opr_system_0_D0 => main_0_op_halt_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_system_0_D0_676
		);

	-- instance of 'main_0_op_int_dis_operation_instr_hw_0_return' functional unit:
	main_0_op_int_dis_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_int_dis_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_int_dis_operation_instr_hw_0_return_ACT_728,
			codasip_instance_main_0_instr_hw_operation_opr_system_0_D0 => main_0_op_int_dis_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_system_0_D0_677
		);

	-- instance of 'main_0_op_int_en_operation_instr_hw_0_return' functional unit:
	main_0_op_int_en_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_int_en_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_int_en_operation_instr_hw_0_return_ACT_729,
			codasip_instance_main_0_instr_hw_operation_opr_system_0_D0 => main_0_op_int_en_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_system_0_D0_678
		);

	-- instance of 'main_0_op_jump_ie_operation_instr_hw_0_return' functional unit:
	main_0_op_jump_ie_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_jump_ie_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_jump_ie_operation_instr_hw_0_return_ACT_730,
			codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_D0 => main_0_op_jump_ie_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_D0_649
		);

	-- instance of 'main_0_op_jump_operation_instr_hw_0_return' functional unit:
	main_0_op_jump_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_jump_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_jump_operation_instr_hw_0_return_ACT_731,
			codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0 => main_0_op_jump_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_D0_646
		);

	-- instance of 'main_0_op_jump_reg_operation_instr_hw_0_return' functional unit:
	main_0_op_jump_reg_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_jump_reg_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_jump_reg_operation_instr_hw_0_return_ACT_732,
			codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_D0 => main_0_op_jump_reg_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_D0_650
		);

	-- instance of 'main_0_op_ld_operation_instr_hw_0_return' functional unit:
	main_0_op_ld_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_ld_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_ld_operation_instr_hw_0_return_ACT_733,
			codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0 => main_0_op_ld_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0_652
		);

	-- instance of 'main_0_op_ldbs_operation_instr_hw_0_return' functional unit:
	main_0_op_ldbs_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_ldbs_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_ldbs_operation_instr_hw_0_return_ACT_734,
			codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0 => main_0_op_ldbs_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0_653
		);

	-- instance of 'main_0_op_ldbsx_operation_instr_hw_0_return' functional unit:
	main_0_op_ldbsx_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_ldbsx_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_ldbsx_operation_instr_hw_0_return_ACT_735,
			codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0 => main_0_op_ldbsx_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0_658
		);

	-- instance of 'main_0_op_ldbu_operation_instr_hw_0_return' functional unit:
	main_0_op_ldbu_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_ldbu_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_ldbu_operation_instr_hw_0_return_ACT_736,
			codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0 => main_0_op_ldbu_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0_654
		);

	-- instance of 'main_0_op_ldbux_operation_instr_hw_0_return' functional unit:
	main_0_op_ldbux_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_ldbux_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_ldbux_operation_instr_hw_0_return_ACT_737,
			codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0 => main_0_op_ldbux_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0_659
		);

	-- instance of 'main_0_op_ldhs_operation_instr_hw_0_return' functional unit:
	main_0_op_ldhs_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_ldhs_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_ldhs_operation_instr_hw_0_return_ACT_738,
			codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0 => main_0_op_ldhs_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0_655
		);

	-- instance of 'main_0_op_ldhsx_operation_instr_hw_0_return' functional unit:
	main_0_op_ldhsx_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_ldhsx_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_ldhsx_operation_instr_hw_0_return_ACT_739,
			codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0 => main_0_op_ldhsx_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0_660
		);

	-- instance of 'main_0_op_ldhu_operation_instr_hw_0_return' functional unit:
	main_0_op_ldhu_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_ldhu_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_ldhu_operation_instr_hw_0_return_ACT_740,
			codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0 => main_0_op_ldhu_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_D0_656
		);

	-- instance of 'main_0_op_ldhux_operation_instr_hw_0_return' functional unit:
	main_0_op_ldhux_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_ldhux_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_ldhux_operation_instr_hw_0_return_ACT_741,
			codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0 => main_0_op_ldhux_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0_661
		);

	-- instance of 'main_0_op_ldx_operation_instr_hw_0_return' functional unit:
	main_0_op_ldx_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_ldx_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_ldx_operation_instr_hw_0_return_ACT_742,
			codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0 => main_0_op_ldx_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_D0_662
		);

	-- instance of 'main_0_op_logand_cond_instr_hw_0_return' functional unit:
	main_0_op_logand_cond_instr_hw_0_return : codix_risc_ca_core_main_0_op_logand_cond_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_logand_cond_instr_hw_0_return_ACT_743,
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 => main_0_op_logand_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_595
		);

	-- instance of 'main_0_op_lognand_cond_instr_hw_0_return' functional unit:
	main_0_op_lognand_cond_instr_hw_0_return : codix_risc_ca_core_main_0_op_lognand_cond_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_lognand_cond_instr_hw_0_return_ACT_744,
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 => main_0_op_lognand_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_596
		);

	-- instance of 'main_0_op_lognor_cond_instr_hw_0_return' functional unit:
	main_0_op_lognor_cond_instr_hw_0_return : codix_risc_ca_core_main_0_op_lognor_cond_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_lognor_cond_instr_hw_0_return_ACT_745,
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 => main_0_op_lognor_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_597
		);

	-- instance of 'main_0_op_logor_cond_instr_hw_0_return' functional unit:
	main_0_op_logor_cond_instr_hw_0_return : codix_risc_ca_core_main_0_op_logor_cond_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_logor_cond_instr_hw_0_return_ACT_746,
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 => main_0_op_logor_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_598
		);

	-- instance of 'main_0_op_lshr_operation_instr_hw_0_return' functional unit:
	main_0_op_lshr_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_lshr_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_lshr_operation_instr_hw_0_return_ACT_747,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_lshr_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_630
		);

	-- instance of 'main_0_op_lshri_operation_instr_hw_0_return' functional unit:
	main_0_op_lshri_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_lshri_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_lshri_operation_instr_hw_0_return_ACT_748,
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 => main_0_op_lshri_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_612
		);

	-- instance of 'main_0_op_lui_operation_instr_hw_0_return' functional unit:
	main_0_op_lui_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_lui_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_lui_operation_instr_hw_0_return_ACT_749,
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 => main_0_op_lui_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_613
		);

	-- instance of 'main_0_op_move_operation_instr_hw_0_return' functional unit:
	main_0_op_move_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_move_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_move_operation_instr_hw_0_return_ACT_750,
			codasip_instance_main_0_instr_hw_operation_opr_move_0_D0 => main_0_op_move_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_move_0_D0_664
		);

	-- instance of 'main_0_op_mul_operation_instr_hw_0_return' functional unit:
	main_0_op_mul_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_mul_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_mul_operation_instr_hw_0_return_ACT_751,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_mul_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_631
		);

	-- instance of 'main_0_op_mulsi_operation_instr_hw_0_return' functional unit:
	main_0_op_mulsi_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_mulsi_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_mulsi_operation_instr_hw_0_return_ACT_752,
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 => main_0_op_mulsi_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_614
		);

	-- instance of 'main_0_op_mului_operation_instr_hw_0_return' functional unit:
	main_0_op_mului_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_mului_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_mului_operation_instr_hw_0_return_ACT_753,
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 => main_0_op_mului_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_615
		);

	-- instance of 'main_0_op_ne_cond_instr_hw_0_return' functional unit:
	main_0_op_ne_cond_instr_hw_0_return : codix_risc_ca_core_main_0_op_ne_cond_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_ne_cond_instr_hw_0_return_ACT_754,
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 => main_0_op_ne_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_599
		);

	-- instance of 'main_0_op_nor_operation_instr_hw_0_return' functional unit:
	main_0_op_nor_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_nor_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_nor_operation_instr_hw_0_return_ACT_755,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_nor_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_632
		);

	-- instance of 'main_0_op_nori_operation_instr_hw_0_return' functional unit:
	main_0_op_nori_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_nori_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_nori_operation_instr_hw_0_return_ACT_756,
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 => main_0_op_nori_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_616
		);

	-- instance of 'main_0_op_or_operation_instr_hw_0_return' functional unit:
	main_0_op_or_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_or_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_or_operation_instr_hw_0_return_ACT_757,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_or_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_633
		);

	-- instance of 'main_0_op_ori_operation_instr_hw_0_return' functional unit:
	main_0_op_ori_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_ori_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_ori_operation_instr_hw_0_return_ACT_758,
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 => main_0_op_ori_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_617
		);

	-- instance of 'main_0_op_printreg_operation_instr_hw_0_return' functional unit:
	main_0_op_printreg_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_printreg_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_printreg_operation_instr_hw_0_return_ACT_759,
			codasip_instance_main_0_instr_hw_operation_opr_system_rd_0_D0 => main_0_op_printreg_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_system_rd_0_D0_680
		);

	-- instance of 'main_0_op_select_operation_instr_hw_0_return' functional unit:
	main_0_op_select_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_select_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_select_operation_instr_hw_0_return_ACT_760,
			codasip_instance_main_0_instr_hw_operation_opr_move_0_D0 => main_0_op_select_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_move_0_D0_665
		);

	-- instance of 'main_0_op_set_status_operation_instr_hw_0_return' functional unit:
	main_0_op_set_status_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_set_status_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_set_status_operation_instr_hw_0_return_ACT_761,
			codasip_instance_main_0_instr_hw_operation_opr_system_rd_0_D0 => main_0_op_set_status_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_system_rd_0_D0_681
		);

	-- instance of 'main_0_op_sext16_operation_instr_hw_0_return' functional unit:
	main_0_op_sext16_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_sext16_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_sext16_operation_instr_hw_0_return_ACT_762,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_sext16_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_634
		);

	-- instance of 'main_0_op_sext8_operation_instr_hw_0_return' functional unit:
	main_0_op_sext8_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_sext8_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_sext8_operation_instr_hw_0_return_ACT_763,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_sext8_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_635
		);

	-- instance of 'main_0_op_sge_cond_instr_hw_0_return' functional unit:
	main_0_op_sge_cond_instr_hw_0_return : codix_risc_ca_core_main_0_op_sge_cond_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_sge_cond_instr_hw_0_return_ACT_764,
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 => main_0_op_sge_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_600
		);

	-- instance of 'main_0_op_sgt_cond_instr_hw_0_return' functional unit:
	main_0_op_sgt_cond_instr_hw_0_return : codix_risc_ca_core_main_0_op_sgt_cond_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_sgt_cond_instr_hw_0_return_ACT_765,
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 => main_0_op_sgt_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_601
		);

	-- instance of 'main_0_op_shl_operation_instr_hw_0_return' functional unit:
	main_0_op_shl_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_shl_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_shl_operation_instr_hw_0_return_ACT_766,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_shl_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_636
		);

	-- instance of 'main_0_op_shli_operation_instr_hw_0_return' functional unit:
	main_0_op_shli_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_shli_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_shli_operation_instr_hw_0_return_ACT_767,
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 => main_0_op_shli_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_618
		);

	-- instance of 'main_0_op_sle_cond_instr_hw_0_return' functional unit:
	main_0_op_sle_cond_instr_hw_0_return : codix_risc_ca_core_main_0_op_sle_cond_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_sle_cond_instr_hw_0_return_ACT_768,
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 => main_0_op_sle_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_602
		);

	-- instance of 'main_0_op_slt_cond_instr_hw_0_return' functional unit:
	main_0_op_slt_cond_instr_hw_0_return : codix_risc_ca_core_main_0_op_slt_cond_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_slt_cond_instr_hw_0_return_ACT_769,
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 => main_0_op_slt_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_603
		);

	-- instance of 'main_0_op_st_operation_instr_hw_0_return' functional unit:
	main_0_op_st_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_st_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_st_operation_instr_hw_0_return_ACT_770,
			codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_D0 => main_0_op_st_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_D0_668
		);

	-- instance of 'main_0_op_stb_operation_instr_hw_0_return' functional unit:
	main_0_op_stb_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_stb_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_stb_operation_instr_hw_0_return_ACT_771,
			codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_D0 => main_0_op_stb_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_D0_669
		);

	-- instance of 'main_0_op_stbx_operation_instr_hw_0_return' functional unit:
	main_0_op_stbx_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_stbx_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_stbx_operation_instr_hw_0_return_ACT_772,
			codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_D0 => main_0_op_stbx_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_D0_672
		);

	-- instance of 'main_0_op_sth_operation_instr_hw_0_return' functional unit:
	main_0_op_sth_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_sth_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_sth_operation_instr_hw_0_return_ACT_773,
			codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_D0 => main_0_op_sth_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_D0_670
		);

	-- instance of 'main_0_op_sthx_operation_instr_hw_0_return' functional unit:
	main_0_op_sthx_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_sthx_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_sthx_operation_instr_hw_0_return_ACT_774,
			codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_D0 => main_0_op_sthx_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_D0_673
		);

	-- instance of 'main_0_op_stx_operation_instr_hw_0_return' functional unit:
	main_0_op_stx_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_stx_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_stx_operation_instr_hw_0_return_ACT_775,
			codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_D0 => main_0_op_stx_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_st_reg_0_D0_674
		);

	-- instance of 'main_0_op_sub_operation_instr_hw_0_return' functional unit:
	main_0_op_sub_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_sub_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_sub_operation_instr_hw_0_return_ACT_776,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_sub_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_637
		);

	-- instance of 'main_0_op_subadd_operation_instr_hw_0_return' functional unit:
	main_0_op_subadd_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_subadd_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_subadd_operation_instr_hw_0_return_ACT_777,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_subadd_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_638
		);

	-- instance of 'main_0_op_subi_operation_instr_hw_0_return' functional unit:
	main_0_op_subi_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_subi_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_subi_operation_instr_hw_0_return_ACT_778,
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 => main_0_op_subi_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_619
		);

	-- instance of 'main_0_op_submul_operation_instr_hw_0_return' functional unit:
	main_0_op_submul_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_submul_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_submul_operation_instr_hw_0_return_ACT_779,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_submul_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_639
		);

	-- instance of 'main_0_op_subsub_operation_instr_hw_0_return' functional unit:
	main_0_op_subsub_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_subsub_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_subsub_operation_instr_hw_0_return_ACT_780,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_subsub_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_640
		);

	-- instance of 'main_0_op_test_operation_instr_hw_0_return' functional unit:
	main_0_op_test_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_test_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_test_operation_instr_hw_0_return_ACT_781,
			codasip_instance_main_0_instr_hw_operation_opr_move_0_D0 => main_0_op_test_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_move_0_D0_666
		);

	-- instance of 'main_0_op_uge_cond_instr_hw_0_return' functional unit:
	main_0_op_uge_cond_instr_hw_0_return : codix_risc_ca_core_main_0_op_uge_cond_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_uge_cond_instr_hw_0_return_ACT_782,
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 => main_0_op_uge_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_604
		);

	-- instance of 'main_0_op_ugt_cond_instr_hw_0_return' functional unit:
	main_0_op_ugt_cond_instr_hw_0_return : codix_risc_ca_core_main_0_op_ugt_cond_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_ugt_cond_instr_hw_0_return_ACT_783,
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 => main_0_op_ugt_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_605
		);

	-- instance of 'main_0_op_ule_cond_instr_hw_0_return' functional unit:
	main_0_op_ule_cond_instr_hw_0_return : codix_risc_ca_core_main_0_op_ule_cond_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_ule_cond_instr_hw_0_return_ACT_784,
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 => main_0_op_ule_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_606
		);

	-- instance of 'main_0_op_ult_cond_instr_hw_0_return' functional unit:
	main_0_op_ult_cond_instr_hw_0_return : codix_risc_ca_core_main_0_op_ult_cond_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_ult_cond_instr_hw_0_return_ACT_785,
			codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0 => main_0_op_ult_cond_instr_hw_0_return_codasip_instance_main_0_instr_hw_cond_cond_cmp_0_D0_607
		);

	-- instance of 'main_0_op_xor_operation_instr_hw_0_return' functional unit:
	main_0_op_xor_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_xor_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_xor_operation_instr_hw_0_return_ACT_786,
			codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0 => main_0_op_xor_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_D0_641
		);

	-- instance of 'main_0_op_xori_operation_instr_hw_0_return' functional unit:
	main_0_op_xori_operation_instr_hw_0_return : codix_risc_ca_core_main_0_op_xori_operation_instr_hw_0_return_t
		port map (
			ACT => main_instr_hw_instr_hw_main_0_op_xori_operation_instr_hw_0_return_ACT_787,
			codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 => main_0_op_xori_operation_instr_hw_0_return_codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0_620
		);

	-- instance of 'main_alu_alu_fu_semantics' functional unit:
	main_alu_alu_fu_semantics : codix_risc_ca_core_main_alu_alu_fu_semantics_t
		port map (
			ACT => main_controller_main_alu_alu_fu_semantics_ACT_788,
			ex_aluB_Q0 => main_alu_alu_fu_semantics_ex_aluB_Q0_397,
			ex_alu_op_Q0 => main_alu_alu_fu_semantics_ex_alu_op_Q0_345,
			ex_aluA_Q0 => main_alu_alu_fu_semantics_ex_aluA_Q0_390,
			ex_alu_logic_D0 => main_alu_alu_fu_semantics_ex_alu_logic_D0_413,
			int_enabled_Q0 => main_alu_alu_fu_semantics_int_enabled_Q0_16,
			ex_alu_add_D0 => main_alu_alu_fu_semantics_ex_alu_add_D0_411,
			ex_alu_arith_D0 => main_alu_alu_fu_semantics_ex_alu_arith_D0_415,
			ex_alu_add_Q0 => main_alu_alu_fu_semantics_ex_alu_add_Q0_409
		);

	-- instance of 'main_cond_compare_cond_compare_fu_semantics' functional unit:
	main_cond_compare_cond_compare_fu_semantics : codix_risc_ca_core_main_cond_compare_cond_compare_fu_semantics_t
		port map (
			ACT => main_controller_main_cond_compare_cond_compare_fu_semantics_ACT_789,
			ex_regA_Q0 => main_cond_compare_cond_compare_fu_semantics_ex_regA_Q0_372,
			ex_cond_Q0 => main_cond_compare_cond_compare_fu_semantics_ex_cond_Q0_355,
			ex_regB_Q0 => main_cond_compare_cond_compare_fu_semantics_ex_regB_Q0_378,
			ex_cmp_D0 => main_cond_compare_cond_compare_fu_semantics_ex_cmp_D0_421,
			ex_cmp_Q0 => main_cond_compare_cond_compare_fu_semantics_ex_cmp_Q0_419,
			ex2_cmp_D0 => main_cond_compare_cond_compare_fu_semantics_ex2_cmp_D0_453,
			ex2_cmp_WE0 => main_cond_compare_cond_compare_fu_semantics_ex2_cmp_WE0_454
		);

	-- instance of 'main_ex2_ex2_controller_semantics' functional unit:
	main_ex2_ex2_controller_semantics : codix_risc_ca_core_main_ex2_ex2_controller_semantics_t
		port map (
			ACT => main_controller_main_ex2_ex2_controller_semantics_ACT_790,
			ex2_alu_op_Q0 => main_ex2_ex2_controller_semantics_ex2_alu_op_Q0_425,
			ex2_alu_Q0 => main_ex2_ex2_controller_semantics_ex2_alu_Q0_457,
			ex2_alu_wb_D0 => main_ex2_ex2_controller_semantics_ex2_alu_wb_D0_481,
			ex2_regC_Q0 => main_ex2_ex2_controller_semantics_ex2_regC_Q0_474,
			ex2_cmp_Q0 => main_ex2_ex2_controller_semantics_ex2_cmp_Q0_452,
			ex2_regB_Q0 => main_ex2_ex2_controller_semantics_ex2_regB_Q0_469,
			ex2_mul_Q0 => main_ex2_ex2_controller_semantics_ex2_mul_Q0_463,
			wb_alu_D0 => main_ex2_ex2_controller_semantics_wb_alu_D0_483,
			wb_alu_WE0 => main_ex2_ex2_controller_semantics_wb_alu_WE0_484,
			ex2_mem_rw_Q0 => main_ex2_ex2_controller_semantics_ex2_mem_rw_Q0_439,
			d_mem_fr_stall_Q0 => main_ex2_ex2_controller_semantics_d_mem_fr_stall_Q0_559,
			dbus_REQCMD0 => core_dbus_REQCMD0_main_ex2_ex2_controller_semantics_3552_791,
			dbus_A0 => core_dbus_A0_main_ex2_ex2_controller_semantics_3556_792,
			dbus_SI0 => core_dbus_SI0_main_ex2_ex2_controller_semantics_3560_793,
			dbus_SC0 => core_dbus_SC0_main_ex2_ex2_controller_semantics_3564_794,
			dbus_REQRESP0 => core_dbus_REQRESP0_main_ex2_ex2_controller_semantics_3568_795,
			d_mem_rq_stall_D0 => main_ex2_ex2_controller_semantics_d_mem_rq_stall_D0_558,
			port_error_D0 => core_port_error_D0_main_ex2_ex2_controller_semantics_3619_796,
			ex2_mem_wr_ack_Q0 => main_ex2_ex2_controller_semantics_ex2_mem_wr_ack_Q0_477,
			dbus_D0 => core_dbus_D0_main_ex2_ex2_controller_semantics_3754_797,
			dbus_OFCMD0 => core_dbus_OFCMD0_main_ex2_ex2_controller_semantics_3756_798,
			dbus_OFRESP0 => core_dbus_OFRESP0_main_ex2_ex2_controller_semantics_3765_799,
			d_mem_fw_stall_D0 => main_ex2_ex2_controller_semantics_d_mem_fw_stall_D0_563,
			ex2_mem_wr_ack_D0 => main_ex2_ex2_controller_semantics_ex2_mem_wr_ack_D0_478,
			ex2_mem_wr_ack_WE0 => main_ex2_ex2_controller_semantics_ex2_mem_wr_ack_WE0_479,
			i_mem_rq_inv_stall_D0 => main_ex2_ex2_controller_semantics_i_mem_rq_inv_stall_D0_554,
			wb_alu_op_D0 => main_ex2_ex2_controller_semantics_wb_alu_op_D0_488,
			wb_alu_op_WE0 => main_ex2_ex2_controller_semantics_wb_alu_op_WE0_489,
			ex2_rW_Q0 => main_ex2_ex2_controller_semantics_ex2_rW_Q0_432,
			wb_rW_D0 => main_ex2_ex2_controller_semantics_wb_rW_D0_493,
			wb_rW_WE0 => main_ex2_ex2_controller_semantics_wb_rW_WE0_494,
			wb_mem_rw_D0 => main_ex2_ex2_controller_semantics_wb_mem_rw_D0_498,
			wb_mem_rw_WE0 => main_ex2_ex2_controller_semantics_wb_mem_rw_WE0_499,
			ex2_dest_en_Q0 => main_ex2_ex2_controller_semantics_ex2_dest_en_Q0_446,
			wb_dest_en_D0 => main_ex2_ex2_controller_semantics_wb_dest_en_D0_503,
			wb_dest_en_WE0 => main_ex2_ex2_controller_semantics_wb_dest_en_WE0_504
		);

	-- instance of 'main_ex_ex_controller_semantics' functional unit:
	main_ex_ex_controller_semantics : codix_risc_ca_core_main_ex_ex_controller_semantics_t
		port map (
			ACT => main_controller_main_ex_ex_controller_semantics_ACT_800,
			ex_ie_flag_Q0 => main_ex_ex_controller_semantics_ex_ie_flag_Q0_366,
			ex_alu_op_Q0 => main_ex_ex_controller_semantics_ex_alu_op_Q0_346,
			int_enabled_Q0 => main_ex_ex_controller_semantics_int_enabled_Q0_17,
			ex_aluB_Q0 => main_ex_ex_controller_semantics_ex_aluB_Q0_398,
			int_enabled_D0 => main_ex_ex_controller_semantics_int_enabled_D0_19,
			int_enabled_WE0 => main_ex_ex_controller_semantics_int_enabled_WE0_20,
			ex_aluA_Q0 => main_ex_ex_controller_semantics_ex_aluA_Q0_391,
			ex2_mul_D0 => main_ex_ex_controller_semantics_ex2_mul_D0_465,
			ex2_mul_WE0 => main_ex_ex_controller_semantics_ex2_mul_WE0_466
		);

	-- instance of 'main_ex_output_ex_output_fu_semantics' functional unit:
	main_ex_output_ex_output_fu_semantics : codix_risc_ca_core_main_ex_output_ex_output_fu_semantics_t
		port map (
			ACT => main_controller_main_ex_output_ex_output_fu_semantics_ACT_801,
			ex_dest_en_mux_Q0 => main_ex_output_ex_output_fu_semantics_ex_dest_en_mux_Q0_360,
			ex_cmp_Q0 => main_ex_output_ex_output_fu_semantics_ex_cmp_Q0_420,
			ex_dest_en_D0 => main_ex_output_ex_output_fu_semantics_ex_dest_en_D0_418,
			ex_alu_op_Q0 => main_ex_output_ex_output_fu_semantics_ex_alu_op_Q0_347,
			ex2_alu_op_D0 => main_ex_output_ex_output_fu_semantics_ex2_alu_op_D0_427,
			ex2_alu_op_WE0 => main_ex_output_ex_output_fu_semantics_ex2_alu_op_WE0_428,
			ex_rW_Q0 => main_ex_output_ex_output_fu_semantics_ex_rW_Q0_405,
			ex2_rW_D0 => main_ex_output_ex_output_fu_semantics_ex2_rW_D0_434,
			ex2_rW_WE0 => main_ex_output_ex_output_fu_semantics_ex2_rW_WE0_435,
			ex_mem_rw_Q0 => main_ex_output_ex_output_fu_semantics_ex_mem_rw_Q0_339,
			ex2_mem_rw_D0 => main_ex_output_ex_output_fu_semantics_ex2_mem_rw_D0_441,
			ex2_mem_rw_WE0 => main_ex_output_ex_output_fu_semantics_ex2_mem_rw_WE0_442,
			ex_dest_en_Q0 => main_ex_output_ex_output_fu_semantics_ex_dest_en_Q0_416,
			ex2_dest_en_D0 => main_ex_output_ex_output_fu_semantics_ex2_dest_en_D0_448,
			ex2_dest_en_WE0 => main_ex_output_ex_output_fu_semantics_ex2_dest_en_WE0_449,
			ex_alu_arith_Q0 => main_ex_output_ex_output_fu_semantics_ex_alu_arith_Q0_414,
			ex2_alu_D0 => main_ex_output_ex_output_fu_semantics_ex2_alu_D0_458,
			ex2_alu_WE0 => main_ex_output_ex_output_fu_semantics_ex2_alu_WE0_459,
			ex_regB_Q0 => main_ex_output_ex_output_fu_semantics_ex_regB_Q0_379,
			ex2_regB_D0 => main_ex_output_ex_output_fu_semantics_ex2_regB_D0_470,
			ex2_regB_WE0 => main_ex_output_ex_output_fu_semantics_ex2_regB_WE0_471,
			ex_regC_Q0 => main_ex_output_ex_output_fu_semantics_ex_regC_Q0_384,
			ex2_regC_D0 => main_ex_output_ex_output_fu_semantics_ex2_regC_D0_475,
			ex2_regC_WE0 => main_ex_output_ex_output_fu_semantics_ex2_regC_WE0_476
		);

	-- instance of 'main_fe_fe_controller_semantics' functional unit:
	main_fe_fe_controller_semantics : codix_risc_ca_core_main_fe_fe_controller_semantics_t
		port map (
			ACT => main_controller_main_fe_fe_controller_semantics_ACT_802,
			id_stall_reg_Q0 => main_fe_fe_controller_semantics_id_stall_reg_Q0_573,
			id_stall_Q0 => main_fe_fe_controller_semantics_id_stall_Q0_525,
			pc_Q0 => main_fe_fe_controller_semantics_pc_Q0_0,
			id_pc_Q0 => main_fe_fe_controller_semantics_id_pc_Q0_22,
			ex2_mem_rw_Q0 => main_fe_fe_controller_semantics_ex2_mem_rw_Q0_440,
			ibus_REQCMD0 => core_ibus_REQCMD0_main_fe_fe_controller_semantics_4107_803,
			ibus_A0 => core_ibus_A0_main_fe_fe_controller_semantics_4111_804,
			ibus_SI0 => core_ibus_SI0_main_fe_fe_controller_semantics_4115_805,
			ibus_SC0 => core_ibus_SC0_main_fe_fe_controller_semantics_4119_806,
			ibus_REQRESP0 => core_ibus_REQRESP0_main_fe_fe_controller_semantics_4123_807,
			i_mem_rq_stall_D0 => main_fe_fe_controller_semantics_i_mem_rq_stall_D0_552,
			port_error_D0 => core_port_error_D0_main_fe_fe_controller_semantics_4155_808,
			i_mem_rq_stall_Q0 => main_fe_fe_controller_semantics_i_mem_rq_stall_Q0_551,
			fe_stall_D0 => main_fe_fe_controller_semantics_fe_stall_D0_524,
			id_pc_D0 => main_fe_fe_controller_semantics_id_pc_D0_24,
			id_pc_WE0 => main_fe_fe_controller_semantics_id_pc_WE0_25,
			wb_pc_we_Q0 => main_fe_fe_controller_semantics_wb_pc_we_Q0_518,
			fe_stall_Q0 => main_fe_fe_controller_semantics_fe_stall_Q0_522,
			wb_pc_W_Q0 => main_fe_fe_controller_semantics_wb_pc_W_Q0_516,
			pc_D0 => main_fe_fe_controller_semantics_pc_D0_1,
			pc_WE0 => main_fe_fe_controller_semantics_pc_WE0_2,
			id_clear_reg_Q0 => main_fe_fe_controller_semantics_id_clear_reg_Q0_569,
			i_mem_fr_stall_Q0 => main_fe_fe_controller_semantics_i_mem_fr_stall_Q0_555,
			id_stall_reg_D0 => main_fe_fe_controller_semantics_id_stall_reg_D0_574,
			id_stall_reg_WE0 => main_fe_fe_controller_semantics_id_stall_reg_WE0_575,
			id_clear_reg_D0 => main_fe_fe_controller_semantics_id_clear_reg_D0_571,
			id_clear_reg_WE0 => main_fe_fe_controller_semantics_id_clear_reg_WE0_572
		);

	-- instance of 'main_flow_logic_control_flow_logic_control_fu_semantics' functional unit:
	main_flow_logic_control_flow_logic_control_fu_semantics : codix_risc_ca_core_main_flow_logic_control_flow_logic_control_fu_semantics_t
		port map (
			ACT => main_controller_main_flow_logic_control_flow_logic_control_fu_semantics_ACT_809,
			fe_stall_Q0 => main_flow_logic_control_flow_logic_control_fu_semantics_fe_stall_Q0_523,
			id_stall_Q0 => main_flow_logic_control_flow_logic_control_fu_semantics_id_stall_Q0_526,
			id_clear_Q0 => main_flow_logic_control_flow_logic_control_fu_semantics_id_clear_Q0_528,
			rd_stall_Q0 => main_flow_logic_control_flow_logic_control_fu_semantics_rd_stall_Q0_530,
			pipe_RD_stall_D0 => main_flow_logic_control_flow_logic_control_fu_semantics_pipe_RD_stall_D0_576,
			rd_clear_Q0 => main_flow_logic_control_flow_logic_control_fu_semantics_rd_clear_Q0_533,
			pipe_RD_clear_D0 => main_flow_logic_control_flow_logic_control_fu_semantics_pipe_RD_clear_D0_577,
			ex_stall_Q0 => main_flow_logic_control_flow_logic_control_fu_semantics_ex_stall_Q0_535,
			pipe_EX_stall_D0 => main_flow_logic_control_flow_logic_control_fu_semantics_pipe_EX_stall_D0_578,
			ex_clear_Q0 => main_flow_logic_control_flow_logic_control_fu_semantics_ex_clear_Q0_539,
			pipe_EX_clear_D0 => main_flow_logic_control_flow_logic_control_fu_semantics_pipe_EX_clear_D0_579,
			ex2_stall_Q0 => main_flow_logic_control_flow_logic_control_fu_semantics_ex2_stall_Q0_541,
			pipe_EX2_stall_D0 => main_flow_logic_control_flow_logic_control_fu_semantics_pipe_EX2_stall_D0_580,
			ex2_clear_Q0 => main_flow_logic_control_flow_logic_control_fu_semantics_ex2_clear_Q0_544,
			pipe_EX2_clear_D0 => main_flow_logic_control_flow_logic_control_fu_semantics_pipe_EX2_clear_D0_581,
			wb_stall_Q0 => main_flow_logic_control_flow_logic_control_fu_semantics_wb_stall_Q0_546,
			wb_clear_Q0 => main_flow_logic_control_flow_logic_control_fu_semantics_wb_clear_Q0_549,
			pipe_WB_stall_D0 => main_flow_logic_control_flow_logic_control_fu_semantics_pipe_WB_stall_D0_582,
			pipe_WB_clear_D0 => main_flow_logic_control_flow_logic_control_fu_semantics_pipe_WB_clear_D0_583
		);

	-- instance of 'main_fnc_ctrl_0_1_condition' functional unit:
	main_fnc_ctrl_0_1_condition : codix_risc_ca_core_main_fnc_ctrl_0_1_condition_t
		port map (
			ACT => main_controller_main_fnc_ctrl_0_1_condition_ACT_810,
			RET => main_controller_main_fnc_ctrl_0_1_condition_RET_811,
			ex_alu_op_Q0 => main_fnc_ctrl_0_1_condition_ex_alu_op_Q0_348
		);

	-- instance of 'main_id_id_controller_semantics' functional unit:
	main_id_id_controller_semantics : codix_risc_ca_core_main_id_id_controller_semantics_t
		port map (
			ACT => main_controller_main_id_id_controller_semantics_ACT_812,
			id_clear_reg_Q0 => main_id_id_controller_semantics_id_clear_reg_Q0_570,
			ex_ie_flag_Q0 => main_id_id_controller_semantics_ex_ie_flag_Q0_367,
			rd_ie_flag_Q0 => main_id_id_controller_semantics_rd_ie_flag_Q0_157,
			ex_alu_op_Q0 => main_id_id_controller_semantics_ex_alu_op_Q0_349,
			rd_alu_op_Q0 => main_id_id_controller_semantics_rd_alu_op_Q0_62,
			int_enabled_Q0 => main_id_id_controller_semantics_int_enabled_Q0_18,
			irq_Q0 => core_irq_Q0_main_id_id_controller_semantics_4411_813,
			ibus_Q0 => core_ibus_Q0_main_id_id_controller_semantics_4420_814,
			ibus_IFCMD0 => core_ibus_IFCMD0_main_id_id_controller_semantics_4422_815,
			ibus_IFRESP0 => core_ibus_IFRESP0_main_id_id_controller_semantics_4430_816,
			i_mem_fr_stall_D0 => main_id_id_controller_semantics_i_mem_fr_stall_D0_556,
			port_error_D0 => core_port_error_D0_main_id_id_controller_semantics_4454_817,
			id_instr_D0 => main_id_id_controller_semantics_id_instr_D0_27,
			rd_mem_D0 => main_id_id_controller_semantics_rd_mem_D0_314,
			rd_mem_WE0 => main_id_id_controller_semantics_rd_mem_WE0_315,
			id_pc_Q0 => main_id_id_controller_semantics_id_pc_Q0_23,
			rd_pc_D0 => main_id_id_controller_semantics_rd_pc_D0_319,
			rd_pc_WE0 => main_id_id_controller_semantics_rd_pc_WE0_320,
			wb_pc_we_Q0 => main_id_id_controller_semantics_wb_pc_we_Q0_519,
			ex_clear_D0 => main_id_id_controller_semantics_ex_clear_D0_540,
			ex_stall_Q0 => main_id_id_controller_semantics_ex_stall_Q0_536,
			rd_stall_D0 => main_id_id_controller_semantics_rd_stall_D0_532,
			rd_clear_D0 => main_id_id_controller_semantics_rd_clear_D0_534,
			rd_stall_Q0 => main_id_id_controller_semantics_rd_stall_Q0_531,
			id_stall_D0 => main_id_id_controller_semantics_id_stall_D0_527,
			id_clear_D0 => main_id_id_controller_semantics_id_clear_D0_529
		);

	-- instance of 'main_rd_rd_controller_semantics' functional unit:
	main_rd_rd_controller_semantics : codix_risc_ca_core_main_rd_rd_controller_semantics_t
		port map (
			ACT => main_controller_main_rd_rd_controller_semantics_ACT_818,
			rd_mem_Q0 => main_rd_rd_controller_semantics_rd_mem_Q0_313,
			rd_rW_D0 => main_rd_rd_controller_semantics_rd_rW_D0_328,
			rd_rA_D0 => main_rd_rd_controller_semantics_rd_rA_D0_322,
			rd_rB_D0 => main_rd_rd_controller_semantics_rd_rB_D0_324,
			rd_rC_D0 => main_rd_rd_controller_semantics_rd_rC_D0_326,
			rd_jump_abs_D0 => main_rd_rd_controller_semantics_rd_jump_abs_D0_330,
			rd_jump_rel_D0 => main_rd_rd_controller_semantics_rd_jump_rel_D0_332,
			rd_store_D0 => main_rd_rd_controller_semantics_rd_store_D0_334,
			rd_imm_D0 => main_rd_rd_controller_semantics_rd_imm_D0_336,
			wb_regs_we_Q0 => main_rd_rd_controller_semantics_wb_regs_we_Q0_513,
			rd_rA_Q0 => main_rd_rd_controller_semantics_rd_rA_Q0_321,
			wb_regs_addrW_Q0 => main_rd_rd_controller_semantics_wb_regs_addrW_Q0_510,
			regs_Q0 => main_rd_rd_controller_semantics_regs_Q0_3,
			regs_RE0 => main_rd_rd_controller_semantics_regs_RE0_5,
			regs_RA0 => main_rd_rd_controller_semantics_regs_RA0_4,
			wb_regs_W_Q0 => main_rd_rd_controller_semantics_wb_regs_W_Q0_507,
			rd_rB_Q0 => main_rd_rd_controller_semantics_rd_rB_Q0_323,
			regs_Q1 => main_rd_rd_controller_semantics_regs_Q1_6,
			regs_RE1 => main_rd_rd_controller_semantics_regs_RE1_8,
			regs_RA1 => main_rd_rd_controller_semantics_regs_RA1_7,
			rd_rC_Q0 => main_rd_rd_controller_semantics_rd_rC_Q0_325,
			regs_Q2 => main_rd_rd_controller_semantics_regs_Q2_9,
			regs_RE2 => main_rd_rd_controller_semantics_regs_RE2_11,
			regs_RA2 => main_rd_rd_controller_semantics_regs_RA2_10,
			rd_amB_Q0 => main_rd_rd_controller_semantics_rd_amB_Q0_251,
			rd_amC_Q0 => main_rd_rd_controller_semantics_rd_amC_Q0_282,
			rd_aluA_mux_Q0 => main_rd_rd_controller_semantics_rd_aluA_mux_Q0_189,
			rd_pc_Q0 => main_rd_rd_controller_semantics_rd_pc_Q0_318,
			rd_aluB_mux_Q0 => main_rd_rd_controller_semantics_rd_aluB_mux_Q0_220,
			rd_jump_abs_Q0 => main_rd_rd_controller_semantics_rd_jump_abs_Q0_329,
			rd_jump_rel_Q0 => main_rd_rd_controller_semantics_rd_jump_rel_Q0_331,
			rd_imm_Q0 => main_rd_rd_controller_semantics_rd_imm_Q0_335,
			rd_store_Q0 => main_rd_rd_controller_semantics_rd_store_Q0_333,
			rd_mem_rw_Q0 => main_rd_rd_controller_semantics_rd_mem_rw_Q0_30,
			ex_mem_rw_D0 => main_rd_rd_controller_semantics_ex_mem_rw_D0_340,
			ex_mem_rw_WE0 => main_rd_rd_controller_semantics_ex_mem_rw_WE0_341,
			rd_alu_op_Q0 => main_rd_rd_controller_semantics_rd_alu_op_Q0_63,
			ex_alu_op_D0 => main_rd_rd_controller_semantics_ex_alu_op_D0_351,
			ex_alu_op_WE0 => main_rd_rd_controller_semantics_ex_alu_op_WE0_352,
			rd_cond_Q0 => main_rd_rd_controller_semantics_rd_cond_Q0_94,
			ex_cond_D0 => main_rd_rd_controller_semantics_ex_cond_D0_356,
			ex_cond_WE0 => main_rd_rd_controller_semantics_ex_cond_WE0_357,
			rd_dest_en_mux_Q0 => main_rd_rd_controller_semantics_rd_dest_en_mux_Q0_125,
			ex_dest_en_mux_D0 => main_rd_rd_controller_semantics_ex_dest_en_mux_D0_361,
			ex_dest_en_mux_WE0 => main_rd_rd_controller_semantics_ex_dest_en_mux_WE0_362,
			rd_ie_flag_Q0 => main_rd_rd_controller_semantics_rd_ie_flag_Q0_158,
			ex_ie_flag_D0 => main_rd_rd_controller_semantics_ex_ie_flag_D0_368,
			ex_ie_flag_WE0 => main_rd_rd_controller_semantics_ex_ie_flag_WE0_369,
			rd_rW_Q0 => main_rd_rd_controller_semantics_rd_rW_Q0_327,
			ex_rW_D0 => main_rd_rd_controller_semantics_ex_rW_D0_407,
			ex_rW_WE0 => main_rd_rd_controller_semantics_ex_rW_WE0_408,
			ex_regA_D0 => main_rd_rd_controller_semantics_ex_regA_D0_373,
			ex_regA_WE0 => main_rd_rd_controller_semantics_ex_regA_WE0_374,
			ex_regB_D0 => main_rd_rd_controller_semantics_ex_regB_D0_380,
			ex_regB_WE0 => main_rd_rd_controller_semantics_ex_regB_WE0_381,
			ex_regC_D0 => main_rd_rd_controller_semantics_ex_regC_D0_385,
			ex_regC_WE0 => main_rd_rd_controller_semantics_ex_regC_WE0_386,
			ex_aluA_D0 => main_rd_rd_controller_semantics_ex_aluA_D0_392,
			ex_aluA_WE0 => main_rd_rd_controller_semantics_ex_aluA_WE0_393,
			ex_aluB_D0 => main_rd_rd_controller_semantics_ex_aluB_D0_400,
			ex_aluB_WE0 => main_rd_rd_controller_semantics_ex_aluB_WE0_401
		);

	-- instance of 'main_reset_fu_semantics' functional unit:
	main_reset_fu_semantics : codix_risc_ca_core_main_reset_fu_semantics_t
		port map (
			RST => core_ERST_Q0_main_reset_fu_semantics_4910_819,
			ACT => '0',
			IRST_D0 => core_IRST_D0_main_reset_fu_semantics_4912_820
		);

	-- instance of 'main_wb_output_wb_output_fu_semantics' functional unit:
	main_wb_output_wb_output_fu_semantics : codix_risc_ca_core_main_wb_output_wb_output_fu_semantics_t
		port map (
			ACT => main_controller_main_wb_output_wb_output_fu_semantics_ACT_821,
			ex_alu_op_Q0 => main_wb_output_wb_output_fu_semantics_ex_alu_op_Q0_350,
			ex2_alu_op_Q0 => main_wb_output_wb_output_fu_semantics_ex2_alu_op_Q0_426,
			wb_alu_op_Q0 => main_wb_output_wb_output_fu_semantics_wb_alu_op_Q0_487,
			ex_rW_Q0 => main_wb_output_wb_output_fu_semantics_ex_rW_Q0_406,
			ex2_rW_Q0 => main_wb_output_wb_output_fu_semantics_ex2_rW_Q0_433,
			ex2_dest_en_Q0 => main_wb_output_wb_output_fu_semantics_ex2_dest_en_Q0_447,
			wb_rW_Q0 => main_wb_output_wb_output_fu_semantics_wb_rW_Q0_492,
			wb_dest_en_Q0 => main_wb_output_wb_output_fu_semantics_wb_dest_en_Q0_502,
			wb_regs_W_D0 => main_wb_output_wb_output_fu_semantics_wb_regs_W_D0_509,
			wb_regs_addrW_D0 => main_wb_output_wb_output_fu_semantics_wb_regs_addrW_D0_512,
			ex_alu_logic_Q0 => main_wb_output_wb_output_fu_semantics_ex_alu_logic_Q0_412,
			ex2_alu_wb_Q0 => main_wb_output_wb_output_fu_semantics_ex2_alu_wb_Q0_480,
			ex2_mul_Q0 => main_wb_output_wb_output_fu_semantics_ex2_mul_Q0_464,
			wb_alu_Q0 => main_wb_output_wb_output_fu_semantics_wb_alu_Q0_482,
			wb_mem_Q0 => main_wb_output_wb_output_fu_semantics_wb_mem_Q0_505,
			ex_hazard_stall_D0 => main_wb_output_wb_output_fu_semantics_ex_hazard_stall_D0_565,
			ex2_hazard_stall_D0 => main_wb_output_wb_output_fu_semantics_ex2_hazard_stall_D0_567,
			d_mem_fr_stall_Q0 => main_wb_output_wb_output_fu_semantics_d_mem_fr_stall_Q0_560,
			wb_stall_D0 => main_wb_output_wb_output_fu_semantics_wb_stall_D0_548,
			wb_stall_Q0 => main_wb_output_wb_output_fu_semantics_wb_stall_Q0_547,
			i_mem_rq_inv_stall_Q0 => main_wb_output_wb_output_fu_semantics_i_mem_rq_inv_stall_Q0_553,
			d_mem_fw_stall_Q0 => main_wb_output_wb_output_fu_semantics_d_mem_fw_stall_Q0_562,
			d_mem_rq_stall_Q0 => main_wb_output_wb_output_fu_semantics_d_mem_rq_stall_Q0_557,
			wb_clear_D0 => main_wb_output_wb_output_fu_semantics_wb_clear_D0_550,
			ex2_hazard_stall_Q0 => main_wb_output_wb_output_fu_semantics_ex2_hazard_stall_Q0_566,
			ex2_stall_D0 => main_wb_output_wb_output_fu_semantics_ex2_stall_D0_543,
			ex2_clear_D0 => main_wb_output_wb_output_fu_semantics_ex2_clear_D0_545,
			ex_hazard_stall_Q0 => main_wb_output_wb_output_fu_semantics_ex_hazard_stall_Q0_564,
			ex2_stall_Q0 => main_wb_output_wb_output_fu_semantics_ex2_stall_Q0_542,
			ex_stall_D0 => main_wb_output_wb_output_fu_semantics_ex_stall_D0_538,
			ex_stall_Q0 => main_wb_output_wb_output_fu_semantics_ex_stall_Q0_537,
			wb_regs_we_D0 => main_wb_output_wb_output_fu_semantics_wb_regs_we_D0_515,
			wb_regs_we_Q0 => main_wb_output_wb_output_fu_semantics_wb_regs_we_Q0_514,
			wb_regs_W_Q0 => main_wb_output_wb_output_fu_semantics_wb_regs_W_Q0_508,
			wb_regs_addrW_Q0 => main_wb_output_wb_output_fu_semantics_wb_regs_addrW_Q0_511,
			regs_D0 => main_wb_output_wb_output_fu_semantics_regs_D0_12,
			regs_WE0 => main_wb_output_wb_output_fu_semantics_regs_WE0_14,
			regs_WA0 => main_wb_output_wb_output_fu_semantics_regs_WA0_13,
			ex_dest_en_Q0 => main_wb_output_wb_output_fu_semantics_ex_dest_en_Q0_417,
			wb_pc_we_D0 => main_wb_output_wb_output_fu_semantics_wb_pc_we_D0_521,
			ex_aluB_Q0 => main_wb_output_wb_output_fu_semantics_ex_aluB_Q0_399,
			ex_alu_add_Q0 => main_wb_output_wb_output_fu_semantics_ex_alu_add_Q0_410,
			wb_pc_W_D0 => main_wb_output_wb_output_fu_semantics_wb_pc_W_D0_517,
			wb_pc_we_Q0 => main_wb_output_wb_output_fu_semantics_wb_pc_we_Q0_520,
			port_out_D0 => core_port_out_D0_main_wb_output_wb_output_fu_semantics_5310_822,
			port_out_en_D0 => core_port_out_en_D0_main_wb_output_wb_output_fu_semantics_5318_823,
			port_halt_D0 => core_port_halt_D0_main_wb_output_wb_output_fu_semantics_5340_824
		);

	-- instance of 'main_wb_wb_controller_semantics' functional unit:
	main_wb_wb_controller_semantics : codix_risc_ca_core_main_wb_wb_controller_semantics_t
		port map (
			ACT => main_controller_main_wb_wb_controller_semantics_ACT_825,
			wb_mem_rw_Q0 => main_wb_wb_controller_semantics_wb_mem_rw_Q0_497,
			dbus_Q0 => core_dbus_Q0_main_wb_wb_controller_semantics_5360_826,
			dbus_IFCMD0 => core_dbus_IFCMD0_main_wb_wb_controller_semantics_5362_827,
			dbus_IFRESP0 => core_dbus_IFRESP0_main_wb_wb_controller_semantics_5372_828,
			d_mem_fr_stall_D0 => main_wb_wb_controller_semantics_d_mem_fr_stall_D0_561,
			port_error_D0 => core_port_error_D0_main_wb_wb_controller_semantics_5420_829,
			wb_mem_D0 => main_wb_wb_controller_semantics_wb_mem_D0_506
		);

	-- instance of 'main_instr_hw_instr_hw' instruction decoder:
	main_instr_hw_instr_hw : codix_risc_ca_core_main_instr_hw_instr_hw_t
		port map (
			ACT => main_controller_main_instr_hw_instr_hw_ACT_830,
			invalid_instruction => open,
			id_instr_Q0 => main_instr_hw_instr_hw_id_instr_Q0_26,
			main_0_imm1_srcB_op_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_imm1_srcB_op_instr_hw_0_return_ACT_692,
			main_0_imm1_srcC_op_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_imm1_srcC_op_instr_hw_0_return_ACT_693,
			main_0_imm3_srcB_am_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_imm3_srcB_am_instr_hw_0_return_ACT_694,
			main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_ACT => main_instr_hw_instr_hw_main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_ACT_695,
			main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_ACT => main_instr_hw_instr_hw_main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_ACT_696,
			main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_ACT => main_instr_hw_instr_hw_main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_ACT_697,
			main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_ACT => main_instr_hw_instr_hw_main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_ACT_698,
			main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_ACT => main_instr_hw_instr_hw_main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_ACT_699,
			main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_ACT => main_instr_hw_instr_hw_main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_ACT_700,
			main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_ACT => main_instr_hw_instr_hw_main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_ACT_701,
			main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_ACT => main_instr_hw_instr_hw_main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_ACT_702,
			main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_ACT => main_instr_hw_instr_hw_main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_ACT_703,
			main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_ACT => main_instr_hw_instr_hw_main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_ACT_704,
			main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_ACT => main_instr_hw_instr_hw_main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_ACT_705,
			main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_ACT => main_instr_hw_instr_hw_main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_ACT_706,
			main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_ACT => main_instr_hw_instr_hw_main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_ACT_707,
			main_0_op_add_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_add_operation_instr_hw_0_return_ACT_708,
			main_0_op_addadd_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_addadd_operation_instr_hw_0_return_ACT_709,
			main_0_op_addi_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_addi_operation_instr_hw_0_return_ACT_710,
			main_0_op_addmul_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_addmul_operation_instr_hw_0_return_ACT_711,
			main_0_op_addsub_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_addsub_operation_instr_hw_0_return_ACT_712,
			main_0_op_and_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_and_operation_instr_hw_0_return_ACT_713,
			main_0_op_andi_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_andi_operation_instr_hw_0_return_ACT_714,
			main_0_op_ashr_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_ashr_operation_instr_hw_0_return_ACT_715,
			main_0_op_ashri_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_ashri_operation_instr_hw_0_return_ACT_716,
			main_0_op_binand_cond_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_binand_cond_instr_hw_0_return_ACT_717,
			main_0_op_binnand_cond_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_binnand_cond_instr_hw_0_return_ACT_718,
			main_0_op_call_exc_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_call_exc_operation_instr_hw_0_return_ACT_719,
			main_0_op_call_int_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_call_int_operation_instr_hw_0_return_ACT_720,
			main_0_op_call_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_call_operation_instr_hw_0_return_ACT_721,
			main_0_op_call_reg_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_call_reg_operation_instr_hw_0_return_ACT_722,
			main_0_op_ctlz_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_ctlz_operation_instr_hw_0_return_ACT_723,
			main_0_op_cttz_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_cttz_operation_instr_hw_0_return_ACT_724,
			main_0_op_eq_cond_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_eq_cond_instr_hw_0_return_ACT_725,
			main_0_op_get_status_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_get_status_operation_instr_hw_0_return_ACT_726,
			main_0_op_halt_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_halt_operation_instr_hw_0_return_ACT_727,
			main_0_op_int_dis_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_int_dis_operation_instr_hw_0_return_ACT_728,
			main_0_op_int_en_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_int_en_operation_instr_hw_0_return_ACT_729,
			main_0_op_jump_ie_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_jump_ie_operation_instr_hw_0_return_ACT_730,
			main_0_op_jump_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_jump_operation_instr_hw_0_return_ACT_731,
			main_0_op_jump_reg_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_jump_reg_operation_instr_hw_0_return_ACT_732,
			main_0_op_ld_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_ld_operation_instr_hw_0_return_ACT_733,
			main_0_op_ldbs_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_ldbs_operation_instr_hw_0_return_ACT_734,
			main_0_op_ldbsx_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_ldbsx_operation_instr_hw_0_return_ACT_735,
			main_0_op_ldbu_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_ldbu_operation_instr_hw_0_return_ACT_736,
			main_0_op_ldbux_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_ldbux_operation_instr_hw_0_return_ACT_737,
			main_0_op_ldhs_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_ldhs_operation_instr_hw_0_return_ACT_738,
			main_0_op_ldhsx_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_ldhsx_operation_instr_hw_0_return_ACT_739,
			main_0_op_ldhu_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_ldhu_operation_instr_hw_0_return_ACT_740,
			main_0_op_ldhux_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_ldhux_operation_instr_hw_0_return_ACT_741,
			main_0_op_ldx_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_ldx_operation_instr_hw_0_return_ACT_742,
			main_0_op_logand_cond_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_logand_cond_instr_hw_0_return_ACT_743,
			main_0_op_lognand_cond_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_lognand_cond_instr_hw_0_return_ACT_744,
			main_0_op_lognor_cond_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_lognor_cond_instr_hw_0_return_ACT_745,
			main_0_op_logor_cond_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_logor_cond_instr_hw_0_return_ACT_746,
			main_0_op_lshr_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_lshr_operation_instr_hw_0_return_ACT_747,
			main_0_op_lshri_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_lshri_operation_instr_hw_0_return_ACT_748,
			main_0_op_lui_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_lui_operation_instr_hw_0_return_ACT_749,
			main_0_op_move_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_move_operation_instr_hw_0_return_ACT_750,
			main_0_op_mul_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_mul_operation_instr_hw_0_return_ACT_751,
			main_0_op_mulsi_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_mulsi_operation_instr_hw_0_return_ACT_752,
			main_0_op_mului_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_mului_operation_instr_hw_0_return_ACT_753,
			main_0_op_ne_cond_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_ne_cond_instr_hw_0_return_ACT_754,
			main_0_op_nor_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_nor_operation_instr_hw_0_return_ACT_755,
			main_0_op_nori_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_nori_operation_instr_hw_0_return_ACT_756,
			main_0_op_or_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_or_operation_instr_hw_0_return_ACT_757,
			main_0_op_ori_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_ori_operation_instr_hw_0_return_ACT_758,
			main_0_op_printreg_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_printreg_operation_instr_hw_0_return_ACT_759,
			main_0_op_select_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_select_operation_instr_hw_0_return_ACT_760,
			main_0_op_set_status_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_set_status_operation_instr_hw_0_return_ACT_761,
			main_0_op_sext16_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_sext16_operation_instr_hw_0_return_ACT_762,
			main_0_op_sext8_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_sext8_operation_instr_hw_0_return_ACT_763,
			main_0_op_sge_cond_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_sge_cond_instr_hw_0_return_ACT_764,
			main_0_op_sgt_cond_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_sgt_cond_instr_hw_0_return_ACT_765,
			main_0_op_shl_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_shl_operation_instr_hw_0_return_ACT_766,
			main_0_op_shli_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_shli_operation_instr_hw_0_return_ACT_767,
			main_0_op_sle_cond_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_sle_cond_instr_hw_0_return_ACT_768,
			main_0_op_slt_cond_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_slt_cond_instr_hw_0_return_ACT_769,
			main_0_op_st_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_st_operation_instr_hw_0_return_ACT_770,
			main_0_op_stb_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_stb_operation_instr_hw_0_return_ACT_771,
			main_0_op_stbx_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_stbx_operation_instr_hw_0_return_ACT_772,
			main_0_op_sth_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_sth_operation_instr_hw_0_return_ACT_773,
			main_0_op_sthx_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_sthx_operation_instr_hw_0_return_ACT_774,
			main_0_op_stx_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_stx_operation_instr_hw_0_return_ACT_775,
			main_0_op_sub_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_sub_operation_instr_hw_0_return_ACT_776,
			main_0_op_subadd_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_subadd_operation_instr_hw_0_return_ACT_777,
			main_0_op_subi_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_subi_operation_instr_hw_0_return_ACT_778,
			main_0_op_submul_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_submul_operation_instr_hw_0_return_ACT_779,
			main_0_op_subsub_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_subsub_operation_instr_hw_0_return_ACT_780,
			main_0_op_test_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_test_operation_instr_hw_0_return_ACT_781,
			main_0_op_uge_cond_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_uge_cond_instr_hw_0_return_ACT_782,
			main_0_op_ugt_cond_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_ugt_cond_instr_hw_0_return_ACT_783,
			main_0_op_ule_cond_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_ule_cond_instr_hw_0_return_ACT_784,
			main_0_op_ult_cond_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_ult_cond_instr_hw_0_return_ACT_785,
			main_0_op_xor_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_xor_operation_instr_hw_0_return_ACT_786,
			main_0_op_xori_operation_instr_hw_0_return_ACT => main_instr_hw_instr_hw_main_0_op_xori_operation_instr_hw_0_return_ACT_787,
			codasip_attribute_L_main_0_instr_hw_srcB_am_imm3_val_0_D0 => main_instr_hw_instr_hw_codasip_attribute_L_main_0_instr_hw_srcB_am_imm3_val_0_D0_585,
			codasip_attribute_L_main_0_instr_hw_srcB_op_imm1_val_0_D0 => main_instr_hw_instr_hw_codasip_attribute_L_main_0_instr_hw_srcB_op_imm1_val_0_D0_587,
			codasip_attribute_L_main_0_instr_hw_srcC_op_imm1_val_0_D0 => main_instr_hw_instr_hw_codasip_attribute_L_main_0_instr_hw_srcC_op_imm1_val_0_D0_589
		);

	-- instance of 'main_controller' main CPU controller:
	main_controller : codix_risc_ca_core_main_controller_t
		port map (
			CLK => CLK,
			RST => RST,
			main_wb_wb_controller_semantics_ACT => main_controller_main_wb_wb_controller_semantics_ACT_825,
			main_ex2_ex2_controller_semantics_ACT => main_controller_main_ex2_ex2_controller_semantics_ACT_790,
			main_fnc_ctrl_0_1_condition_ACT => main_controller_main_fnc_ctrl_0_1_condition_ACT_810,
			main_fnc_ctrl_0_1_condition_RET => main_controller_main_fnc_ctrl_0_1_condition_RET_811,
			main_ex_ex_controller_semantics_ACT => main_controller_main_ex_ex_controller_semantics_ACT_800,
			main_cond_compare_cond_compare_fu_semantics_ACT => main_controller_main_cond_compare_cond_compare_fu_semantics_ACT_789,
			main_alu_alu_fu_semantics_ACT => main_controller_main_alu_alu_fu_semantics_ACT_788,
			main_ex_output_ex_output_fu_semantics_ACT => main_controller_main_ex_output_ex_output_fu_semantics_ACT_801,
			main_wb_output_wb_output_fu_semantics_ACT => main_controller_main_wb_output_wb_output_fu_semantics_ACT_821,
			main_halt_halt_fu_semantics_ACT => open,
			main_rd_rd_controller_semantics_ACT => main_controller_main_rd_rd_controller_semantics_ACT_818,
			main_id_id_controller_semantics_ACT => main_controller_main_id_id_controller_semantics_ACT_812,
			main_instr_hw_instr_hw_ACT => main_controller_main_instr_hw_instr_hw_ACT_830,
			main_fe_fe_controller_semantics_ACT => main_controller_main_fe_fe_controller_semantics_ACT_802,
			main_flow_logic_control_flow_logic_control_fu_semantics_ACT => main_controller_main_flow_logic_control_flow_logic_control_fu_semantics_ACT_809,
			main_main_controller_semantics_ACT => open
		);

	-- port mappings for 'core' CPU core:
	dbus_REQCMD0_main_ex2_ex2_controller_semantics_3552 <= core_dbus_REQCMD0_main_ex2_ex2_controller_semantics_3552_791;
	dbus_A0_main_ex2_ex2_controller_semantics_3556 <= core_dbus_A0_main_ex2_ex2_controller_semantics_3556_792;
	dbus_SI0_main_ex2_ex2_controller_semantics_3560 <= core_dbus_SI0_main_ex2_ex2_controller_semantics_3560_793;
	dbus_SC0_main_ex2_ex2_controller_semantics_3564 <= core_dbus_SC0_main_ex2_ex2_controller_semantics_3564_794;
	core_dbus_REQRESP0_main_ex2_ex2_controller_semantics_3568_795 <= dbus_REQRESP0_main_ex2_ex2_controller_semantics_3568;
	port_error_D0_main_ex2_ex2_controller_semantics_3619 <= core_port_error_D0_main_ex2_ex2_controller_semantics_3619_796;
	dbus_D0_main_ex2_ex2_controller_semantics_3754 <= core_dbus_D0_main_ex2_ex2_controller_semantics_3754_797;
	dbus_OFCMD0_main_ex2_ex2_controller_semantics_3756 <= core_dbus_OFCMD0_main_ex2_ex2_controller_semantics_3756_798;
	core_dbus_OFRESP0_main_ex2_ex2_controller_semantics_3765_799 <= dbus_OFRESP0_main_ex2_ex2_controller_semantics_3765;
	ibus_REQCMD0_main_fe_fe_controller_semantics_4107 <= core_ibus_REQCMD0_main_fe_fe_controller_semantics_4107_803;
	ibus_A0_main_fe_fe_controller_semantics_4111 <= core_ibus_A0_main_fe_fe_controller_semantics_4111_804;
	ibus_SI0_main_fe_fe_controller_semantics_4115 <= core_ibus_SI0_main_fe_fe_controller_semantics_4115_805;
	ibus_SC0_main_fe_fe_controller_semantics_4119 <= core_ibus_SC0_main_fe_fe_controller_semantics_4119_806;
	core_ibus_REQRESP0_main_fe_fe_controller_semantics_4123_807 <= ibus_REQRESP0_main_fe_fe_controller_semantics_4123;
	port_error_D0_main_fe_fe_controller_semantics_4155 <= core_port_error_D0_main_fe_fe_controller_semantics_4155_808;
	core_irq_Q0_main_id_id_controller_semantics_4411_813 <= irq_Q0_main_id_id_controller_semantics_4411;
	core_ibus_Q0_main_id_id_controller_semantics_4420_814 <= ibus_Q0_main_id_id_controller_semantics_4420;
	ibus_IFCMD0_main_id_id_controller_semantics_4422 <= core_ibus_IFCMD0_main_id_id_controller_semantics_4422_815;
	core_ibus_IFRESP0_main_id_id_controller_semantics_4430_816 <= ibus_IFRESP0_main_id_id_controller_semantics_4430;
	port_error_D0_main_id_id_controller_semantics_4454 <= core_port_error_D0_main_id_id_controller_semantics_4454_817;
	core_ERST_Q0_main_reset_fu_semantics_4910_819 <= ERST_Q0_main_reset_fu_semantics_4910;
	IRST_D0_main_reset_fu_semantics_4912 <= core_IRST_D0_main_reset_fu_semantics_4912_820;
	port_out_D0_main_wb_output_wb_output_fu_semantics_5310 <= core_port_out_D0_main_wb_output_wb_output_fu_semantics_5310_822;
	port_out_en_D0_main_wb_output_wb_output_fu_semantics_5318 <= core_port_out_en_D0_main_wb_output_wb_output_fu_semantics_5318_823;
	port_halt_D0_main_wb_output_wb_output_fu_semantics_5340 <= core_port_halt_D0_main_wb_output_wb_output_fu_semantics_5340_824;
	core_dbus_Q0_main_wb_wb_controller_semantics_5360_826 <= dbus_Q0_main_wb_wb_controller_semantics_5360;
	dbus_IFCMD0_main_wb_wb_controller_semantics_5362 <= core_dbus_IFCMD0_main_wb_wb_controller_semantics_5362_827;
	core_dbus_IFRESP0_main_wb_wb_controller_semantics_5372_828 <= dbus_IFRESP0_main_wb_wb_controller_semantics_5372;
	port_error_D0_main_wb_wb_controller_semantics_5420 <= core_port_error_D0_main_wb_wb_controller_semantics_5420_829;

end architecture RTL;


