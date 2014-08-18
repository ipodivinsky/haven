--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_instr_hw_operation_opr_st_imm_0_Q0 : in std_logic_vector(4 downto 0);
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
end entity codix_risc_ca_core_main_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_6997 : unsigned(5 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_7012 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_7021 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_7043 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_7061 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_7079 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_7108 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_7123 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_7138 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_7153 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_7168 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_7183 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_7198 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_7095: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_7118: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_7163: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_7036: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_7133: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_7007: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_7003: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_10_7048: unsigned(3 downto 0) := to_unsigned(10, 4);
	constant CONSTANT_21_6999: unsigned(4 downto 0) := to_unsigned(21, 5);
	constant CONSTANT_26_7024: unsigned(4 downto 0) := to_unsigned(26, 5);
	constant CONSTANT_27_7064: unsigned(4 downto 0) := to_unsigned(27, 5);
	constant CONSTANT_28_7046: unsigned(4 downto 0) := to_unsigned(28, 5);
	constant CONSTANT_5_7200: unsigned(2 downto 0) := to_unsigned(5, 3);
	constant CONSTANT_8_7026: unsigned(3 downto 0) := to_unsigned(8, 4);
	constant CONSTANT_9_7066: unsigned(3 downto 0) := to_unsigned(9, 4);

begin
	-- child instances inside 'main_instr_hw_st_imm_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1158: rd_alu_op.write(21)
	rd_alu_op_STATEMENT_AST_6997 <= resize(CONSTANT_21_6999, 6);
	-- codix_risc_ca.acdl:1170: codasip_tmp_var_1=codasip_instance_main_instr_h ...
	codasip_tmp_var_1_STATEMENT_AST_7012 <= unsigned(codasip_instance_main_instr_hw_operation_opr_st_imm_0_Q0);
	-- codix_risc_ca.acdl:1162: rd_mem_rw.write(8)
	rd_mem_rw_STATEMENT_AST_7021 <= CONSTANT_8_7026;
	-- codix_risc_ca.acdl:1166: rd_mem_rw.write(10)
	rd_mem_rw_STATEMENT_AST_7043 <= CONSTANT_10_7048;
	-- codix_risc_ca.acdl:1164: rd_mem_rw.write(9)
	rd_mem_rw_STATEMENT_AST_7061 <= CONSTANT_9_7066;
	-- codix_risc_ca.acdl:1168: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_7079 <= resize(CONSTANT_0_7095, 4);
	-- codix_risc_ca.acdl:1172: rd_dest_en_mux.write(0)
	rd_dest_en_mux_STATEMENT_AST_7108 <= resize(CONSTANT_0_7095, 2);
	-- codix_risc_ca.acdl:1173: rd_cond.write(0)
	rd_cond_STATEMENT_AST_7123 <= resize(CONSTANT_0_7095, 5);
	-- codix_risc_ca.acdl:1174: rd_ie_flag.write(0)
	rd_ie_flag_STATEMENT_AST_7138 <= resize(CONSTANT_0_7095, 2);
	-- codix_risc_ca.acdl:1177: rd_amB.write(0)
	rd_amB_STATEMENT_AST_7153 <= resize(CONSTANT_0_7095, 3);
	-- codix_risc_ca.acdl:1178: rd_amC.write(0)
	rd_amC_STATEMENT_AST_7168 <= CONSTANT_0_7095;
	-- codix_risc_ca.acdl:1180: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_7183 <= CONSTANT_0_7095;
	-- codix_risc_ca.acdl:1181: rd_aluB_mux.write(5)
	rd_aluB_mux_STATEMENT_AST_7198 <= CONSTANT_5_7200;
	rd_alu_op_WE0 <= CONSTANT_1_7003(0) when ((ACT = CONSTANT_1_7003(0))) else
		CONSTANT_0_7095(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_6997) when ((ACT = CONSTANT_1_7003(0))) else
		std_logic_vector(CONSTANT_0_7007);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_7012;
	rd_mem_rw_WE0 <= CONSTANT_1_7003(0) when (((ACT = CONSTANT_1_7003(0)) and (CONSTANT_26_7024 = codasip_tmp_var_1))) else 
		CONSTANT_1_7003(0) when (((ACT = CONSTANT_1_7003(0)) and (CONSTANT_28_7046 = codasip_tmp_var_1))) else 
		CONSTANT_1_7003(0) when (((ACT = CONSTANT_1_7003(0)) and (CONSTANT_27_7064 = codasip_tmp_var_1))) else 
		CONSTANT_1_7003(0) when (((ACT = CONSTANT_1_7003(0)) and ((not((CONSTANT_26_7024 = codasip_tmp_var_1)) and not((CONSTANT_27_7064 = codasip_tmp_var_1))) and not((CONSTANT_28_7046 = codasip_tmp_var_1))))) else
		CONSTANT_0_7095(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_7021) when (((ACT = CONSTANT_1_7003(0)) and (CONSTANT_26_7024 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_7043) when (((ACT = CONSTANT_1_7003(0)) and (CONSTANT_28_7046 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_7061) when (((ACT = CONSTANT_1_7003(0)) and (CONSTANT_27_7064 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_7079) when (((ACT = CONSTANT_1_7003(0)) and ((not((CONSTANT_26_7024 = codasip_tmp_var_1)) and not((CONSTANT_27_7064 = codasip_tmp_var_1))) and not((CONSTANT_28_7046 = codasip_tmp_var_1))))) else
		std_logic_vector(CONSTANT_0_7036);
	rd_dest_en_mux_WE0 <= CONSTANT_1_7003(0) when ((ACT = CONSTANT_1_7003(0))) else
		CONSTANT_0_7095(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_7108) when ((ACT = CONSTANT_1_7003(0))) else
		std_logic_vector(CONSTANT_0_7118);
	rd_cond_WE0 <= CONSTANT_1_7003(0) when ((ACT = CONSTANT_1_7003(0))) else
		CONSTANT_0_7095(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_7123) when ((ACT = CONSTANT_1_7003(0))) else
		std_logic_vector(CONSTANT_0_7133);
	rd_ie_flag_WE0 <= CONSTANT_1_7003(0) when ((ACT = CONSTANT_1_7003(0))) else
		CONSTANT_0_7095(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_7138) when ((ACT = CONSTANT_1_7003(0))) else
		std_logic_vector(CONSTANT_0_7118);
	rd_amB_WE0 <= CONSTANT_1_7003(0) when ((ACT = CONSTANT_1_7003(0))) else
		CONSTANT_0_7095(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_7153) when ((ACT = CONSTANT_1_7003(0))) else
		std_logic_vector(CONSTANT_0_7163);
	rd_amC_WE0 <= CONSTANT_1_7003(0) when ((ACT = CONSTANT_1_7003(0))) else
		CONSTANT_0_7095(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_7168(0) when ((ACT = CONSTANT_1_7003(0))) else
		CONSTANT_0_7095(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_7003(0) when ((ACT = CONSTANT_1_7003(0))) else
		CONSTANT_0_7095(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_7183(0) when ((ACT = CONSTANT_1_7003(0))) else
		CONSTANT_0_7095(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_7003(0) when ((ACT = CONSTANT_1_7003(0))) else
		CONSTANT_0_7095(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_7198) when ((ACT = CONSTANT_1_7003(0))) else
		std_logic_vector(CONSTANT_0_7163);

end architecture RTL;


