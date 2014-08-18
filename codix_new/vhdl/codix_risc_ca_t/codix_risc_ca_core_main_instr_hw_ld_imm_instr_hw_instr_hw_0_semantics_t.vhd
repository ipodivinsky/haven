--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_instr_hw_operation_opr_ld_imm_0_Q0 : in std_logic_vector(4 downto 0);
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
end entity codix_risc_ca_core_main_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_6134 : unsigned(5 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_6149 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_6158 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_6180 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_6198 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_6216 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_6234 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_6252 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_6291 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_6306 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_6321 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_6336 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_6351 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_6366 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_6381 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_6278: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_6301: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_6346: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_6173: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_6316: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_6144: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_6163: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_2_6185: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_20_6136: unsigned(4 downto 0) := to_unsigned(20, 5);
	constant CONSTANT_21_6161: unsigned(4 downto 0) := to_unsigned(21, 5);
	constant CONSTANT_22_6183: unsigned(4 downto 0) := to_unsigned(22, 5);
	constant CONSTANT_23_6219: unsigned(4 downto 0) := to_unsigned(23, 5);
	constant CONSTANT_24_6201: unsigned(4 downto 0) := to_unsigned(24, 5);
	constant CONSTANT_25_6237: unsigned(4 downto 0) := to_unsigned(25, 5);
	constant CONSTANT_3_6221: unsigned(1 downto 0) := to_unsigned(3, 2);
	constant CONSTANT_4_6203: unsigned(2 downto 0) := to_unsigned(4, 3);
	constant CONSTANT_5_6239: unsigned(2 downto 0) := to_unsigned(5, 3);

begin
	-- child instances inside 'main_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1117: rd_alu_op.write(20)
	rd_alu_op_STATEMENT_AST_6134 <= resize(CONSTANT_20_6136, 6);
	-- codix_risc_ca.acdl:1133: codasip_tmp_var_1=codasip_instance_main_instr_h ...
	codasip_tmp_var_1_STATEMENT_AST_6149 <= unsigned(codasip_instance_main_instr_hw_operation_opr_ld_imm_0_Q0);
	-- codix_risc_ca.acdl:1121: rd_mem_rw.write(1)
	rd_mem_rw_STATEMENT_AST_6158 <= resize(CONSTANT_1_6163, 4);
	-- codix_risc_ca.acdl:1123: rd_mem_rw.write(2)
	rd_mem_rw_STATEMENT_AST_6180 <= resize(CONSTANT_2_6185, 4);
	-- codix_risc_ca.acdl:1127: rd_mem_rw.write(4)
	rd_mem_rw_STATEMENT_AST_6198 <= resize(CONSTANT_4_6203, 4);
	-- codix_risc_ca.acdl:1125: rd_mem_rw.write(3)
	rd_mem_rw_STATEMENT_AST_6216 <= resize(CONSTANT_3_6221, 4);
	-- codix_risc_ca.acdl:1129: rd_mem_rw.write(5)
	rd_mem_rw_STATEMENT_AST_6234 <= resize(CONSTANT_5_6239, 4);
	-- codix_risc_ca.acdl:1131: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_6252 <= resize(CONSTANT_0_6278, 4);
	-- codix_risc_ca.acdl:1135: rd_dest_en_mux.write(1)
	rd_dest_en_mux_STATEMENT_AST_6291 <= resize(CONSTANT_1_6163, 2);
	-- codix_risc_ca.acdl:1136: rd_cond.write(0)
	rd_cond_STATEMENT_AST_6306 <= resize(CONSTANT_0_6278, 5);
	-- codix_risc_ca.acdl:1137: rd_ie_flag.write(0)
	rd_ie_flag_STATEMENT_AST_6321 <= resize(CONSTANT_0_6278, 2);
	-- codix_risc_ca.acdl:1140: rd_amB.write(0)
	rd_amB_STATEMENT_AST_6336 <= resize(CONSTANT_0_6278, 3);
	-- codix_risc_ca.acdl:1141: rd_amC.write(0)
	rd_amC_STATEMENT_AST_6351 <= CONSTANT_0_6278;
	-- codix_risc_ca.acdl:1143: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_6366 <= CONSTANT_0_6278;
	-- codix_risc_ca.acdl:1144: rd_aluB_mux.write(2)
	rd_aluB_mux_STATEMENT_AST_6381 <= resize(CONSTANT_2_6185, 3);
	rd_alu_op_WE0 <= CONSTANT_1_6163(0) when ((ACT = CONSTANT_1_6163(0))) else
		CONSTANT_0_6278(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_6134) when ((ACT = CONSTANT_1_6163(0))) else
		std_logic_vector(CONSTANT_0_6144);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_6149;
	rd_mem_rw_WE0 <= CONSTANT_1_6163(0) when (((ACT = CONSTANT_1_6163(0)) and (CONSTANT_21_6161 = codasip_tmp_var_1))) else 
		CONSTANT_1_6163(0) when (((ACT = CONSTANT_1_6163(0)) and (CONSTANT_22_6183 = codasip_tmp_var_1))) else 
		CONSTANT_1_6163(0) when (((ACT = CONSTANT_1_6163(0)) and (CONSTANT_24_6201 = codasip_tmp_var_1))) else 
		CONSTANT_1_6163(0) when (((ACT = CONSTANT_1_6163(0)) and (CONSTANT_23_6219 = codasip_tmp_var_1))) else 
		CONSTANT_1_6163(0) when (((ACT = CONSTANT_1_6163(0)) and (CONSTANT_25_6237 = codasip_tmp_var_1))) else 
		CONSTANT_1_6163(0) when (((ACT = CONSTANT_1_6163(0)) and ((((not((CONSTANT_21_6161 = codasip_tmp_var_1)) and not((CONSTANT_22_6183 = codasip_tmp_var_1))) and not((CONSTANT_23_6219 = codasip_tmp_var_1))) and not((CONSTANT_24_6201 = codasip_tmp_var_1))) and not((CONSTANT_25_6237 = codasip_tmp_var_1))))) else
		CONSTANT_0_6278(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_6158) when (((ACT = CONSTANT_1_6163(0)) and (CONSTANT_21_6161 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_6180) when (((ACT = CONSTANT_1_6163(0)) and (CONSTANT_22_6183 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_6198) when (((ACT = CONSTANT_1_6163(0)) and (CONSTANT_24_6201 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_6216) when (((ACT = CONSTANT_1_6163(0)) and (CONSTANT_23_6219 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_6234) when (((ACT = CONSTANT_1_6163(0)) and (CONSTANT_25_6237 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_6252) when (((ACT = CONSTANT_1_6163(0)) and ((((not((CONSTANT_21_6161 = codasip_tmp_var_1)) and not((CONSTANT_22_6183 = codasip_tmp_var_1))) and not((CONSTANT_23_6219 = codasip_tmp_var_1))) and not((CONSTANT_24_6201 = codasip_tmp_var_1))) and not((CONSTANT_25_6237 = codasip_tmp_var_1))))) else
		std_logic_vector(CONSTANT_0_6173);
	rd_dest_en_mux_WE0 <= CONSTANT_1_6163(0) when ((ACT = CONSTANT_1_6163(0))) else
		CONSTANT_0_6278(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_6291) when ((ACT = CONSTANT_1_6163(0))) else
		std_logic_vector(CONSTANT_0_6301);
	rd_cond_WE0 <= CONSTANT_1_6163(0) when ((ACT = CONSTANT_1_6163(0))) else
		CONSTANT_0_6278(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_6306) when ((ACT = CONSTANT_1_6163(0))) else
		std_logic_vector(CONSTANT_0_6316);
	rd_ie_flag_WE0 <= CONSTANT_1_6163(0) when ((ACT = CONSTANT_1_6163(0))) else
		CONSTANT_0_6278(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_6321) when ((ACT = CONSTANT_1_6163(0))) else
		std_logic_vector(CONSTANT_0_6301);
	rd_amB_WE0 <= CONSTANT_1_6163(0) when ((ACT = CONSTANT_1_6163(0))) else
		CONSTANT_0_6278(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_6336) when ((ACT = CONSTANT_1_6163(0))) else
		std_logic_vector(CONSTANT_0_6346);
	rd_amC_WE0 <= CONSTANT_1_6163(0) when ((ACT = CONSTANT_1_6163(0))) else
		CONSTANT_0_6278(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_6351(0) when ((ACT = CONSTANT_1_6163(0))) else
		CONSTANT_0_6278(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_6163(0) when ((ACT = CONSTANT_1_6163(0))) else
		CONSTANT_0_6278(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_6366(0) when ((ACT = CONSTANT_1_6163(0))) else
		CONSTANT_0_6278(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_6163(0) when ((ACT = CONSTANT_1_6163(0))) else
		CONSTANT_0_6278(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_6381) when ((ACT = CONSTANT_1_6163(0))) else
		std_logic_vector(CONSTANT_0_6346);

end architecture RTL;


