--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_t is
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
end entity codix_risc_ca_core_main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(4 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_3486 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_3495 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_3517 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_3539 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_3567 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_3585 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_3607 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_3625 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_3645 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_3674 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_3703 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_3732 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_3747 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_3762 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_3780 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_3795 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_3810 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_3661: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_3532: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_3775: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_3742: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_3560: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_3510: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_3594: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_15_3632: unsigned(3 downto 0) := to_unsigned(15, 4);
	constant CONSTANT_16_3550: unsigned(4 downto 0) := to_unsigned(16, 5);
	constant CONSTANT_17_3500: unsigned(4 downto 0) := to_unsigned(17, 5);
	constant CONSTANT_18_3572: unsigned(4 downto 0) := to_unsigned(18, 5);
	constant CONSTANT_19_3612: unsigned(4 downto 0) := to_unsigned(19, 5);
	constant CONSTANT_2_3522: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_7_3767: unsigned(2 downto 0) := to_unsigned(7, 3);

begin
	-- child instances inside 'main_0_instr_hw_move_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:997: codasip_tmp_var_1=codasip_instance_main_0_instr_ ...
	codasip_tmp_var_1_STATEMENT_AST_3486 <= unsigned(codasip_instance_main_0_instr_hw_operation_opr_move_0_Q0);
	-- codix_risc_ca.acdl:978: rd_alu_op.write(17)
	rd_alu_op_STATEMENT_AST_3495 <= resize(CONSTANT_17_3500, 6);
	-- codix_risc_ca.acdl:979: rd_dest_en_mux.write(2)
	rd_dest_en_mux_STATEMENT_AST_3517 <= CONSTANT_2_3522;
	-- codix_risc_ca.acdl:980: rd_cond.write(16|codasip_instance_main_0_instr_h ...
	rd_cond_STATEMENT_AST_3539 <= (CONSTANT_16_3550 or unsigned(resize(unsigned(codasip_instance_main_0_instr_hw_cond_cond_cmp_0_Q0), 5)));
	-- codix_risc_ca.acdl:983: rd_alu_op.write(18)
	rd_alu_op_STATEMENT_AST_3567 <= resize(CONSTANT_18_3572, 6);
	-- codix_risc_ca.acdl:984: rd_dest_en_mux.write(1)
	rd_dest_en_mux_STATEMENT_AST_3585 <= resize(CONSTANT_1_3594, 2);
	-- codix_risc_ca.acdl:988: rd_alu_op.write(19)
	rd_alu_op_STATEMENT_AST_3607 <= resize(CONSTANT_19_3612, 6);
	-- codix_risc_ca.acdl:990: rd_cond.write(15&codasip_instance_main_0_instr_h ...
	rd_cond_STATEMENT_AST_3625 <= resize((CONSTANT_15_3632 and unsigned(codasip_instance_main_0_instr_hw_cond_cond_cmp_0_Q0)), 5);
	-- codix_risc_ca.acdl:993: rd_alu_op.write(0)
	rd_alu_op_STATEMENT_AST_3645 <= resize(CONSTANT_0_3661, 6);
	-- codix_risc_ca.acdl:994: rd_dest_en_mux.write(0)
	rd_dest_en_mux_STATEMENT_AST_3674 <= resize(CONSTANT_0_3661, 2);
	-- codix_risc_ca.acdl:995: rd_cond.write(0)
	rd_cond_STATEMENT_AST_3703 <= resize(CONSTANT_0_3661, 5);
	-- codix_risc_ca.acdl:999: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_3732 <= resize(CONSTANT_0_3661, 4);
	-- codix_risc_ca.acdl:1000: rd_ie_flag.write(0)
	rd_ie_flag_STATEMENT_AST_3747 <= resize(CONSTANT_0_3661, 2);
	-- codix_risc_ca.acdl:1003: rd_amB.write(codasip_instance_main_0_instr_hw_s ...
	rd_amB_STATEMENT_AST_3762 <= 
		CONSTANT_7_3767 when ((codasip_instance_main_0_instr_hw_srcB_op_imm1_0_Q0 /= '0')) else
		resize(CONSTANT_0_3661, 3);
	-- codix_risc_ca.acdl:1004: rd_amC.write(codasip_instance_main_0_instr_hw_s ...
	rd_amC_STATEMENT_AST_3780(0) <= codasip_instance_main_0_instr_hw_srcC_op_imm1_0_Q0;
	-- codix_risc_ca.acdl:1006: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_3795 <= CONSTANT_0_3661;
	-- codix_risc_ca.acdl:1007: rd_aluB_mux.write(0)
	rd_aluB_mux_STATEMENT_AST_3810 <= resize(CONSTANT_0_3661, 3);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_3486;
	rd_alu_op_WE0 <= CONSTANT_1_3594(0) when (((ACT = CONSTANT_1_3594(0)) and (CONSTANT_16_3550 = codasip_tmp_var_1))) else 
		CONSTANT_1_3594(0) when (((ACT = CONSTANT_1_3594(0)) and (CONSTANT_17_3500 = codasip_tmp_var_1))) else 
		CONSTANT_1_3594(0) when (((ACT = CONSTANT_1_3594(0)) and (CONSTANT_19_3612 = codasip_tmp_var_1))) else 
		CONSTANT_1_3594(0) when (((ACT = CONSTANT_1_3594(0)) and ((not((CONSTANT_16_3550 = codasip_tmp_var_1)) and not((CONSTANT_17_3500 = codasip_tmp_var_1))) and not((CONSTANT_19_3612 = codasip_tmp_var_1))))) else
		CONSTANT_0_3661(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_3495) when (((ACT = CONSTANT_1_3594(0)) and (CONSTANT_16_3550 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_3567) when (((ACT = CONSTANT_1_3594(0)) and (CONSTANT_17_3500 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_3607) when (((ACT = CONSTANT_1_3594(0)) and (CONSTANT_19_3612 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_3645) when (((ACT = CONSTANT_1_3594(0)) and ((not((CONSTANT_16_3550 = codasip_tmp_var_1)) and not((CONSTANT_17_3500 = codasip_tmp_var_1))) and not((CONSTANT_19_3612 = codasip_tmp_var_1))))) else
		std_logic_vector(CONSTANT_0_3510);
	rd_dest_en_mux_WE0 <= CONSTANT_1_3594(0) when (((ACT = CONSTANT_1_3594(0)) and (CONSTANT_16_3550 = codasip_tmp_var_1))) else 
		CONSTANT_1_3594(0) when (((ACT = CONSTANT_1_3594(0)) and ((CONSTANT_17_3500 = codasip_tmp_var_1) or (CONSTANT_19_3612 = codasip_tmp_var_1)))) else 
		CONSTANT_1_3594(0) when (((ACT = CONSTANT_1_3594(0)) and ((not((CONSTANT_16_3550 = codasip_tmp_var_1)) and not((CONSTANT_17_3500 = codasip_tmp_var_1))) and not((CONSTANT_19_3612 = codasip_tmp_var_1))))) else
		CONSTANT_0_3661(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_3517) when (((ACT = CONSTANT_1_3594(0)) and (CONSTANT_16_3550 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_dest_en_mux_STATEMENT_AST_3585) when (((ACT = CONSTANT_1_3594(0)) and ((CONSTANT_17_3500 = codasip_tmp_var_1) or (CONSTANT_19_3612 = codasip_tmp_var_1)))) else 
		std_logic_vector(rd_dest_en_mux_STATEMENT_AST_3674) when (((ACT = CONSTANT_1_3594(0)) and ((not((CONSTANT_16_3550 = codasip_tmp_var_1)) and not((CONSTANT_17_3500 = codasip_tmp_var_1))) and not((CONSTANT_19_3612 = codasip_tmp_var_1))))) else
		std_logic_vector(CONSTANT_0_3532);
	rd_cond_WE0 <= CONSTANT_1_3594(0) when (((ACT = CONSTANT_1_3594(0)) and ((CONSTANT_16_3550 = codasip_tmp_var_1) or (CONSTANT_17_3500 = codasip_tmp_var_1)))) else 
		CONSTANT_1_3594(0) when (((ACT = CONSTANT_1_3594(0)) and (CONSTANT_19_3612 = codasip_tmp_var_1))) else 
		CONSTANT_1_3594(0) when (((ACT = CONSTANT_1_3594(0)) and ((not((CONSTANT_16_3550 = codasip_tmp_var_1)) and not((CONSTANT_17_3500 = codasip_tmp_var_1))) and not((CONSTANT_19_3612 = codasip_tmp_var_1))))) else
		CONSTANT_0_3661(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_3539) when (((ACT = CONSTANT_1_3594(0)) and ((CONSTANT_16_3550 = codasip_tmp_var_1) or (CONSTANT_17_3500 = codasip_tmp_var_1)))) else 
		std_logic_vector(rd_cond_STATEMENT_AST_3625) when (((ACT = CONSTANT_1_3594(0)) and (CONSTANT_19_3612 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_cond_STATEMENT_AST_3703) when (((ACT = CONSTANT_1_3594(0)) and ((not((CONSTANT_16_3550 = codasip_tmp_var_1)) and not((CONSTANT_17_3500 = codasip_tmp_var_1))) and not((CONSTANT_19_3612 = codasip_tmp_var_1))))) else
		std_logic_vector(CONSTANT_0_3560);
	rd_mem_rw_WE0 <= CONSTANT_1_3594(0) when ((ACT = CONSTANT_1_3594(0))) else
		CONSTANT_0_3661(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_3732) when ((ACT = CONSTANT_1_3594(0))) else
		std_logic_vector(CONSTANT_0_3742);
	rd_ie_flag_WE0 <= CONSTANT_1_3594(0) when ((ACT = CONSTANT_1_3594(0))) else
		CONSTANT_0_3661(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_3747) when ((ACT = CONSTANT_1_3594(0))) else
		std_logic_vector(CONSTANT_0_3532);
	rd_amB_WE0 <= CONSTANT_1_3594(0) when ((ACT = CONSTANT_1_3594(0))) else
		CONSTANT_0_3661(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_3762) when ((ACT = CONSTANT_1_3594(0))) else
		std_logic_vector(CONSTANT_0_3775);
	rd_amC_WE0 <= CONSTANT_1_3594(0) when ((ACT = CONSTANT_1_3594(0))) else
		CONSTANT_0_3661(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_3780(0) when ((ACT = CONSTANT_1_3594(0))) else
		CONSTANT_0_3661(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_3594(0) when ((ACT = CONSTANT_1_3594(0))) else
		CONSTANT_0_3661(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_3795(0) when ((ACT = CONSTANT_1_3594(0))) else
		CONSTANT_0_3661(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_3594(0) when ((ACT = CONSTANT_1_3594(0))) else
		CONSTANT_0_3661(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_3810) when ((ACT = CONSTANT_1_3594(0))) else
		std_logic_vector(CONSTANT_0_3775);

end architecture RTL;


