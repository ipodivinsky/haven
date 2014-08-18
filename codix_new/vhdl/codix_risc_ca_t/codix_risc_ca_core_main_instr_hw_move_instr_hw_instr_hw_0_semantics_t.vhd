--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_instr_hw_move_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_instr_hw_move_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_instr_hw_cond_cond_cmp_0_Q0 : in std_logic_vector(3 downto 0);
		codasip_instance_main_instr_hw_operation_opr_move_0_Q0 : in std_logic_vector(4 downto 0);
		codasip_instance_main_instr_hw_srcB_op_imm1_0_Q0 : in std_logic;
		codasip_instance_main_instr_hw_srcC_op_imm1_0_Q0 : in std_logic;
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
		rd_mem_rw_WE0 : out std_logic	);
end entity codix_risc_ca_core_main_instr_hw_move_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_instr_hw_move_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(4 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_6658 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_6667 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_6689 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_6711 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_6739 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_6757 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_6779 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_6799 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_6817 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_6846 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_6875 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_6904 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_6919 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_6934 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_6952 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_6967 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_6982 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_6833: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_6704: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_6947: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_6914: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_6732: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_6682: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_6766: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_15_6786: unsigned(3 downto 0) := to_unsigned(15, 4);
	constant CONSTANT_16_6722: unsigned(4 downto 0) := to_unsigned(16, 5);
	constant CONSTANT_17_6672: unsigned(4 downto 0) := to_unsigned(17, 5);
	constant CONSTANT_18_6804: unsigned(4 downto 0) := to_unsigned(18, 5);
	constant CONSTANT_19_6744: unsigned(4 downto 0) := to_unsigned(19, 5);
	constant CONSTANT_2_6694: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_7_6939: unsigned(2 downto 0) := to_unsigned(7, 3);

begin
	-- child instances inside 'main_instr_hw_move_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:997: codasip_tmp_var_1=codasip_instance_main_instr_hw ...
	codasip_tmp_var_1_STATEMENT_AST_6658 <= unsigned(codasip_instance_main_instr_hw_operation_opr_move_0_Q0);
	-- codix_risc_ca.acdl:978: rd_alu_op.write(17)
	rd_alu_op_STATEMENT_AST_6667 <= resize(CONSTANT_17_6672, 6);
	-- codix_risc_ca.acdl:979: rd_dest_en_mux.write(2)
	rd_dest_en_mux_STATEMENT_AST_6689 <= CONSTANT_2_6694;
	-- codix_risc_ca.acdl:980: rd_cond.write(16|codasip_instance_main_instr_hw_ ...
	rd_cond_STATEMENT_AST_6711 <= (CONSTANT_16_6722 or unsigned(resize(unsigned(codasip_instance_main_instr_hw_cond_cond_cmp_0_Q0), 5)));
	-- codix_risc_ca.acdl:988: rd_alu_op.write(19)
	rd_alu_op_STATEMENT_AST_6739 <= resize(CONSTANT_19_6744, 6);
	-- codix_risc_ca.acdl:989: rd_dest_en_mux.write(1)
	rd_dest_en_mux_STATEMENT_AST_6757 <= resize(CONSTANT_1_6766, 2);
	-- codix_risc_ca.acdl:990: rd_cond.write(15&codasip_instance_main_instr_hw_ ...
	rd_cond_STATEMENT_AST_6779 <= resize((CONSTANT_15_6786 and unsigned(codasip_instance_main_instr_hw_cond_cond_cmp_0_Q0)), 5);
	-- codix_risc_ca.acdl:983: rd_alu_op.write(18)
	rd_alu_op_STATEMENT_AST_6799 <= resize(CONSTANT_18_6804, 6);
	-- codix_risc_ca.acdl:993: rd_alu_op.write(0)
	rd_alu_op_STATEMENT_AST_6817 <= resize(CONSTANT_0_6833, 6);
	-- codix_risc_ca.acdl:994: rd_dest_en_mux.write(0)
	rd_dest_en_mux_STATEMENT_AST_6846 <= resize(CONSTANT_0_6833, 2);
	-- codix_risc_ca.acdl:995: rd_cond.write(0)
	rd_cond_STATEMENT_AST_6875 <= resize(CONSTANT_0_6833, 5);
	-- codix_risc_ca.acdl:999: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_6904 <= resize(CONSTANT_0_6833, 4);
	-- codix_risc_ca.acdl:1000: rd_ie_flag.write(0)
	rd_ie_flag_STATEMENT_AST_6919 <= resize(CONSTANT_0_6833, 2);
	-- codix_risc_ca.acdl:1003: rd_amB.write(codasip_instance_main_instr_hw_src ...
	rd_amB_STATEMENT_AST_6934 <= 
		CONSTANT_7_6939 when ((codasip_instance_main_instr_hw_srcB_op_imm1_0_Q0 /= '0')) else
		resize(CONSTANT_0_6833, 3);
	-- codix_risc_ca.acdl:1004: rd_amC.write(codasip_instance_main_instr_hw_src ...
	rd_amC_STATEMENT_AST_6952(0) <= codasip_instance_main_instr_hw_srcC_op_imm1_0_Q0;
	-- codix_risc_ca.acdl:1006: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_6967 <= CONSTANT_0_6833;
	-- codix_risc_ca.acdl:1007: rd_aluB_mux.write(0)
	rd_aluB_mux_STATEMENT_AST_6982 <= resize(CONSTANT_0_6833, 3);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_6658;
	rd_alu_op_WE0 <= CONSTANT_1_6766(0) when (((ACT = CONSTANT_1_6766(0)) and (CONSTANT_16_6722 = codasip_tmp_var_1))) else 
		CONSTANT_1_6766(0) when (((ACT = CONSTANT_1_6766(0)) and (CONSTANT_19_6744 = codasip_tmp_var_1))) else 
		CONSTANT_1_6766(0) when (((ACT = CONSTANT_1_6766(0)) and (CONSTANT_17_6672 = codasip_tmp_var_1))) else 
		CONSTANT_1_6766(0) when (((ACT = CONSTANT_1_6766(0)) and ((not((CONSTANT_16_6722 = codasip_tmp_var_1)) and not((CONSTANT_17_6672 = codasip_tmp_var_1))) and not((CONSTANT_19_6744 = codasip_tmp_var_1))))) else
		CONSTANT_0_6833(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_6667) when (((ACT = CONSTANT_1_6766(0)) and (CONSTANT_16_6722 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_6739) when (((ACT = CONSTANT_1_6766(0)) and (CONSTANT_19_6744 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_6799) when (((ACT = CONSTANT_1_6766(0)) and (CONSTANT_17_6672 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_6817) when (((ACT = CONSTANT_1_6766(0)) and ((not((CONSTANT_16_6722 = codasip_tmp_var_1)) and not((CONSTANT_17_6672 = codasip_tmp_var_1))) and not((CONSTANT_19_6744 = codasip_tmp_var_1))))) else
		std_logic_vector(CONSTANT_0_6682);
	rd_dest_en_mux_WE0 <= CONSTANT_1_6766(0) when (((ACT = CONSTANT_1_6766(0)) and (CONSTANT_16_6722 = codasip_tmp_var_1))) else 
		CONSTANT_1_6766(0) when (((ACT = CONSTANT_1_6766(0)) and ((CONSTANT_19_6744 = codasip_tmp_var_1) or (CONSTANT_17_6672 = codasip_tmp_var_1)))) else 
		CONSTANT_1_6766(0) when (((ACT = CONSTANT_1_6766(0)) and ((not((CONSTANT_16_6722 = codasip_tmp_var_1)) and not((CONSTANT_17_6672 = codasip_tmp_var_1))) and not((CONSTANT_19_6744 = codasip_tmp_var_1))))) else
		CONSTANT_0_6833(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_6689) when (((ACT = CONSTANT_1_6766(0)) and (CONSTANT_16_6722 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_dest_en_mux_STATEMENT_AST_6757) when (((ACT = CONSTANT_1_6766(0)) and ((CONSTANT_19_6744 = codasip_tmp_var_1) or (CONSTANT_17_6672 = codasip_tmp_var_1)))) else 
		std_logic_vector(rd_dest_en_mux_STATEMENT_AST_6846) when (((ACT = CONSTANT_1_6766(0)) and ((not((CONSTANT_16_6722 = codasip_tmp_var_1)) and not((CONSTANT_17_6672 = codasip_tmp_var_1))) and not((CONSTANT_19_6744 = codasip_tmp_var_1))))) else
		std_logic_vector(CONSTANT_0_6704);
	rd_cond_WE0 <= CONSTANT_1_6766(0) when (((ACT = CONSTANT_1_6766(0)) and ((CONSTANT_16_6722 = codasip_tmp_var_1) or (CONSTANT_17_6672 = codasip_tmp_var_1)))) else 
		CONSTANT_1_6766(0) when (((ACT = CONSTANT_1_6766(0)) and (CONSTANT_19_6744 = codasip_tmp_var_1))) else 
		CONSTANT_1_6766(0) when (((ACT = CONSTANT_1_6766(0)) and ((not((CONSTANT_16_6722 = codasip_tmp_var_1)) and not((CONSTANT_17_6672 = codasip_tmp_var_1))) and not((CONSTANT_19_6744 = codasip_tmp_var_1))))) else
		CONSTANT_0_6833(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_6711) when (((ACT = CONSTANT_1_6766(0)) and ((CONSTANT_16_6722 = codasip_tmp_var_1) or (CONSTANT_17_6672 = codasip_tmp_var_1)))) else 
		std_logic_vector(rd_cond_STATEMENT_AST_6779) when (((ACT = CONSTANT_1_6766(0)) and (CONSTANT_19_6744 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_cond_STATEMENT_AST_6875) when (((ACT = CONSTANT_1_6766(0)) and ((not((CONSTANT_16_6722 = codasip_tmp_var_1)) and not((CONSTANT_17_6672 = codasip_tmp_var_1))) and not((CONSTANT_19_6744 = codasip_tmp_var_1))))) else
		std_logic_vector(CONSTANT_0_6732);
	rd_mem_rw_WE0 <= CONSTANT_1_6766(0) when ((ACT = CONSTANT_1_6766(0))) else
		CONSTANT_0_6833(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_6904) when ((ACT = CONSTANT_1_6766(0))) else
		std_logic_vector(CONSTANT_0_6914);
	rd_ie_flag_WE0 <= CONSTANT_1_6766(0) when ((ACT = CONSTANT_1_6766(0))) else
		CONSTANT_0_6833(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_6919) when ((ACT = CONSTANT_1_6766(0))) else
		std_logic_vector(CONSTANT_0_6704);
	rd_amB_WE0 <= CONSTANT_1_6766(0) when ((ACT = CONSTANT_1_6766(0))) else
		CONSTANT_0_6833(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_6934) when ((ACT = CONSTANT_1_6766(0))) else
		std_logic_vector(CONSTANT_0_6947);
	rd_amC_WE0 <= CONSTANT_1_6766(0) when ((ACT = CONSTANT_1_6766(0))) else
		CONSTANT_0_6833(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_6952(0) when ((ACT = CONSTANT_1_6766(0))) else
		CONSTANT_0_6833(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_6766(0) when ((ACT = CONSTANT_1_6766(0))) else
		CONSTANT_0_6833(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_6967(0) when ((ACT = CONSTANT_1_6766(0))) else
		CONSTANT_0_6833(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_6766(0) when ((ACT = CONSTANT_1_6766(0))) else
		CONSTANT_0_6833(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_6982) when ((ACT = CONSTANT_1_6766(0))) else
		std_logic_vector(CONSTANT_0_6947);

end architecture RTL;


