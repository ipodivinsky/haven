--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_t is
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
end entity codix_risc_ca_core_main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(3 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2 : unsigned(3 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2_STATEMENT_AST_1307 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_1316 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_1338 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_1416 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_1434 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_1452 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_1470 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_1488 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_1510 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_1528 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_1546 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_1564 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_1582 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_1597 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_1612 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_1627 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_1642 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_1657 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_1672 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_1687 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_1696 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_1810 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_1403: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_1607: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_1652: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_1592: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_1622: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_1331: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_1321: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_10_1551: unsigned(3 downto 0) := to_unsigned(10, 4);
	constant CONSTANT_14_1344: unsigned(3 downto 0) := to_unsigned(14, 4);
	constant CONSTANT_15_1569: unsigned(3 downto 0) := to_unsigned(15, 4);
	constant CONSTANT_2_1439: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_3_1457: unsigned(1 downto 0) := to_unsigned(3, 2);
	constant CONSTANT_4_1379: unsigned(2 downto 0) := to_unsigned(4, 3);
	constant CONSTANT_5_1421: unsigned(2 downto 0) := to_unsigned(5, 3);
	constant CONSTANT_6_1475: unsigned(2 downto 0) := to_unsigned(6, 3);
	constant CONSTANT_7_1497: unsigned(2 downto 0) := to_unsigned(7, 3);
	constant CONSTANT_8_1515: unsigned(3 downto 0) := to_unsigned(8, 4);
	constant CONSTANT_9_1533: unsigned(3 downto 0) := to_unsigned(9, 4);

begin
	-- child instances inside 'main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:840: codasip_tmp_var_2=codasip_instance_main_0_instr_ ...
	codasip_tmp_var_2_STATEMENT_AST_1307 <= unsigned(codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_Q0);
	-- codix_risc_ca.acdl:817: rd_alu_op.write(1)
	rd_alu_op_STATEMENT_AST_1316 <= resize(CONSTANT_1_1321, 6);
	-- codix_risc_ca.acdl:815: rd_alu_op.write(0)
	rd_alu_op_STATEMENT_AST_1338 <= resize(CONSTANT_0_1403, 6);
	-- codix_risc_ca.acdl:823: rd_alu_op.write(5)
	rd_alu_op_STATEMENT_AST_1416 <= resize(CONSTANT_5_1421, 6);
	-- codix_risc_ca.acdl:819: rd_alu_op.write(2)
	rd_alu_op_STATEMENT_AST_1434 <= resize(CONSTANT_2_1439, 6);
	-- codix_risc_ca.acdl:821: rd_alu_op.write(3)
	rd_alu_op_STATEMENT_AST_1452 <= resize(CONSTANT_3_1457, 6);
	-- codix_risc_ca.acdl:825: rd_alu_op.write(6)
	rd_alu_op_STATEMENT_AST_1470 <= resize(CONSTANT_6_1475, 6);
	-- codix_risc_ca.acdl:828: rd_alu_op.write(7)
	rd_alu_op_STATEMENT_AST_1488 <= resize(CONSTANT_7_1497, 6);
	-- codix_risc_ca.acdl:830: rd_alu_op.write(8)
	rd_alu_op_STATEMENT_AST_1510 <= resize(CONSTANT_8_1515, 6);
	-- codix_risc_ca.acdl:832: rd_alu_op.write(9)
	rd_alu_op_STATEMENT_AST_1528 <= resize(CONSTANT_9_1533, 6);
	-- codix_risc_ca.acdl:834: rd_alu_op.write(10)
	rd_alu_op_STATEMENT_AST_1546 <= resize(CONSTANT_10_1551, 6);
	-- codix_risc_ca.acdl:836: rd_alu_op.write(15)
	rd_alu_op_STATEMENT_AST_1564 <= resize(CONSTANT_15_1569, 6);
	-- codix_risc_ca.acdl:842: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_1582 <= resize(CONSTANT_0_1403, 4);
	-- codix_risc_ca.acdl:843: rd_dest_en_mux.write(1)
	rd_dest_en_mux_STATEMENT_AST_1597 <= resize(CONSTANT_1_1321, 2);
	-- codix_risc_ca.acdl:844: rd_cond.write(0)
	rd_cond_STATEMENT_AST_1612 <= resize(CONSTANT_0_1403, 5);
	-- codix_risc_ca.acdl:845: rd_ie_flag.write(0)
	rd_ie_flag_STATEMENT_AST_1627 <= resize(CONSTANT_0_1403, 2);
	-- codix_risc_ca.acdl:848: rd_amB.write(0)
	rd_amB_STATEMENT_AST_1642 <= resize(CONSTANT_0_1403, 3);
	-- codix_risc_ca.acdl:849: rd_amC.write(0)
	rd_amC_STATEMENT_AST_1657 <= CONSTANT_0_1403;
	-- codix_risc_ca.acdl:851: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_1672 <= CONSTANT_0_1403;
	-- codix_risc_ca.acdl:873: codasip_tmp_var_1=codasip_instance_main_0_instr_ ...
	codasip_tmp_var_1_STATEMENT_AST_1687 <= unsigned(codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_Q0);
	-- codix_risc_ca.acdl:863: rd_aluB_mux.write(1)
	rd_aluB_mux_STATEMENT_AST_1696 <= resize(CONSTANT_1_1321, 3);
	-- codix_risc_ca.acdl:868: rd_aluB_mux.write(2)
	rd_aluB_mux_STATEMENT_AST_1810 <= resize(CONSTANT_2_1439, 3);
	codasip_tmp_var_2 <= codasip_tmp_var_2_STATEMENT_AST_1307;
	rd_alu_op_WE0 <= CONSTANT_1_1321(0) when (((ACT = CONSTANT_1_1321(0)) and (CONSTANT_1_1321 = codasip_tmp_var_2))) else 
		CONSTANT_1_1321(0) when (((ACT = CONSTANT_1_1321(0)) and ((CONSTANT_0_1403 = codasip_tmp_var_2) or (((((((((((not((CONSTANT_0_1403 = codasip_tmp_var_2)) and not((CONSTANT_1_1321 = codasip_tmp_var_2))) and not((CONSTANT_2_1439 = codasip_tmp_var_2))) and not((CONSTANT_3_1457 = codasip_tmp_var_2))) and not((CONSTANT_4_1379 = codasip_tmp_var_2))) and not((CONSTANT_5_1421 = codasip_tmp_var_2))) and not((CONSTANT_7_1497 = codasip_tmp_var_2))) and not((CONSTANT_6_1475 = codasip_tmp_var_2))) and not((CONSTANT_8_1515 = codasip_tmp_var_2))) and not((CONSTANT_9_1533 = codasip_tmp_var_2))) and not((CONSTANT_10_1551 = codasip_tmp_var_2))) and not((CONSTANT_14_1344 = codasip_tmp_var_2)))))) else 
		CONSTANT_1_1321(0) when (((ACT = CONSTANT_1_1321(0)) and (CONSTANT_4_1379 = codasip_tmp_var_2))) else 
		CONSTANT_1_1321(0) when (((ACT = CONSTANT_1_1321(0)) and (CONSTANT_2_1439 = codasip_tmp_var_2))) else 
		CONSTANT_1_1321(0) when (((ACT = CONSTANT_1_1321(0)) and (CONSTANT_3_1457 = codasip_tmp_var_2))) else 
		CONSTANT_1_1321(0) when (((ACT = CONSTANT_1_1321(0)) and (CONSTANT_5_1421 = codasip_tmp_var_2))) else 
		CONSTANT_1_1321(0) when (((ACT = CONSTANT_1_1321(0)) and ((CONSTANT_6_1475 = codasip_tmp_var_2) or (CONSTANT_7_1497 = codasip_tmp_var_2)))) else 
		CONSTANT_1_1321(0) when (((ACT = CONSTANT_1_1321(0)) and (CONSTANT_8_1515 = codasip_tmp_var_2))) else 
		CONSTANT_1_1321(0) when (((ACT = CONSTANT_1_1321(0)) and (CONSTANT_9_1533 = codasip_tmp_var_2))) else 
		CONSTANT_1_1321(0) when (((ACT = CONSTANT_1_1321(0)) and (CONSTANT_10_1551 = codasip_tmp_var_2))) else 
		CONSTANT_1_1321(0) when (((ACT = CONSTANT_1_1321(0)) and (CONSTANT_14_1344 = codasip_tmp_var_2))) else
		CONSTANT_0_1403(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_1316) when (((ACT = CONSTANT_1_1321(0)) and (CONSTANT_1_1321 = codasip_tmp_var_2))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_1338) when (((ACT = CONSTANT_1_1321(0)) and ((CONSTANT_0_1403 = codasip_tmp_var_2) or (((((((((((not((CONSTANT_0_1403 = codasip_tmp_var_2)) and not((CONSTANT_1_1321 = codasip_tmp_var_2))) and not((CONSTANT_2_1439 = codasip_tmp_var_2))) and not((CONSTANT_3_1457 = codasip_tmp_var_2))) and not((CONSTANT_4_1379 = codasip_tmp_var_2))) and not((CONSTANT_5_1421 = codasip_tmp_var_2))) and not((CONSTANT_7_1497 = codasip_tmp_var_2))) and not((CONSTANT_6_1475 = codasip_tmp_var_2))) and not((CONSTANT_8_1515 = codasip_tmp_var_2))) and not((CONSTANT_9_1533 = codasip_tmp_var_2))) and not((CONSTANT_10_1551 = codasip_tmp_var_2))) and not((CONSTANT_14_1344 = codasip_tmp_var_2)))))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_1416) when (((ACT = CONSTANT_1_1321(0)) and (CONSTANT_4_1379 = codasip_tmp_var_2))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_1434) when (((ACT = CONSTANT_1_1321(0)) and (CONSTANT_2_1439 = codasip_tmp_var_2))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_1452) when (((ACT = CONSTANT_1_1321(0)) and (CONSTANT_3_1457 = codasip_tmp_var_2))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_1470) when (((ACT = CONSTANT_1_1321(0)) and (CONSTANT_5_1421 = codasip_tmp_var_2))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_1488) when (((ACT = CONSTANT_1_1321(0)) and ((CONSTANT_6_1475 = codasip_tmp_var_2) or (CONSTANT_7_1497 = codasip_tmp_var_2)))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_1510) when (((ACT = CONSTANT_1_1321(0)) and (CONSTANT_8_1515 = codasip_tmp_var_2))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_1528) when (((ACT = CONSTANT_1_1321(0)) and (CONSTANT_9_1533 = codasip_tmp_var_2))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_1546) when (((ACT = CONSTANT_1_1321(0)) and (CONSTANT_10_1551 = codasip_tmp_var_2))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_1564) when (((ACT = CONSTANT_1_1321(0)) and (CONSTANT_14_1344 = codasip_tmp_var_2))) else
		std_logic_vector(CONSTANT_0_1331);
	rd_mem_rw_WE0 <= CONSTANT_1_1321(0) when ((ACT = CONSTANT_1_1321(0))) else
		CONSTANT_0_1403(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_1582) when ((ACT = CONSTANT_1_1321(0))) else
		std_logic_vector(CONSTANT_0_1592);
	rd_dest_en_mux_WE0 <= CONSTANT_1_1321(0) when ((ACT = CONSTANT_1_1321(0))) else
		CONSTANT_0_1403(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_1597) when ((ACT = CONSTANT_1_1321(0))) else
		std_logic_vector(CONSTANT_0_1607);
	rd_cond_WE0 <= CONSTANT_1_1321(0) when ((ACT = CONSTANT_1_1321(0))) else
		CONSTANT_0_1403(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_1612) when ((ACT = CONSTANT_1_1321(0))) else
		std_logic_vector(CONSTANT_0_1622);
	rd_ie_flag_WE0 <= CONSTANT_1_1321(0) when ((ACT = CONSTANT_1_1321(0))) else
		CONSTANT_0_1403(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_1627) when ((ACT = CONSTANT_1_1321(0))) else
		std_logic_vector(CONSTANT_0_1607);
	rd_amB_WE0 <= CONSTANT_1_1321(0) when ((ACT = CONSTANT_1_1321(0))) else
		CONSTANT_0_1403(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_1642) when ((ACT = CONSTANT_1_1321(0))) else
		std_logic_vector(CONSTANT_0_1652);
	rd_amC_WE0 <= CONSTANT_1_1321(0) when ((ACT = CONSTANT_1_1321(0))) else
		CONSTANT_0_1403(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_1657(0) when ((ACT = CONSTANT_1_1321(0))) else
		CONSTANT_0_1403(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_1321(0) when ((ACT = CONSTANT_1_1321(0))) else
		CONSTANT_0_1403(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_1672(0) when ((ACT = CONSTANT_1_1321(0))) else
		CONSTANT_0_1403(0);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_1687;
	rd_aluB_mux_WE0 <= CONSTANT_1_1321(0) when (((ACT = CONSTANT_1_1321(0)) and ((((((((((CONSTANT_14_1344 = codasip_tmp_var_1) or (((((((((((not((CONSTANT_0_1403 = codasip_tmp_var_1)) and not((CONSTANT_1_1321 = codasip_tmp_var_1))) and not((CONSTANT_2_1439 = codasip_tmp_var_1))) and not((CONSTANT_3_1457 = codasip_tmp_var_1))) and not((CONSTANT_7_1497 = codasip_tmp_var_1))) and not((CONSTANT_8_1515 = codasip_tmp_var_1))) and not((CONSTANT_9_1533 = codasip_tmp_var_1))) and not((CONSTANT_10_1551 = codasip_tmp_var_1))) and not((CONSTANT_14_1344 = codasip_tmp_var_1))) and not((CONSTANT_4_1379 = codasip_tmp_var_1))) and not((CONSTANT_5_1421 = codasip_tmp_var_1))) and not((CONSTANT_6_1475 = codasip_tmp_var_1)))) or (CONSTANT_10_1551 = codasip_tmp_var_1)) or (CONSTANT_9_1533 = codasip_tmp_var_1)) or (CONSTANT_8_1515 = codasip_tmp_var_1)) or (CONSTANT_7_1497 = codasip_tmp_var_1)) or (CONSTANT_3_1457 = codasip_tmp_var_1)) or (CONSTANT_2_1439 = codasip_tmp_var_1)) or (CONSTANT_1_1321 = codasip_tmp_var_1)) or (CONSTANT_0_1403 = codasip_tmp_var_1)))) else 
		CONSTANT_1_1321(0) when (((ACT = CONSTANT_1_1321(0)) and (((CONSTANT_6_1475 = codasip_tmp_var_1) or (CONSTANT_5_1421 = codasip_tmp_var_1)) or (CONSTANT_4_1379 = codasip_tmp_var_1)))) else
		CONSTANT_0_1403(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_1696) when (((ACT = CONSTANT_1_1321(0)) and ((((((((((CONSTANT_14_1344 = codasip_tmp_var_1) or (((((((((((not((CONSTANT_0_1403 = codasip_tmp_var_1)) and not((CONSTANT_1_1321 = codasip_tmp_var_1))) and not((CONSTANT_2_1439 = codasip_tmp_var_1))) and not((CONSTANT_3_1457 = codasip_tmp_var_1))) and not((CONSTANT_7_1497 = codasip_tmp_var_1))) and not((CONSTANT_8_1515 = codasip_tmp_var_1))) and not((CONSTANT_9_1533 = codasip_tmp_var_1))) and not((CONSTANT_10_1551 = codasip_tmp_var_1))) and not((CONSTANT_14_1344 = codasip_tmp_var_1))) and not((CONSTANT_4_1379 = codasip_tmp_var_1))) and not((CONSTANT_5_1421 = codasip_tmp_var_1))) and not((CONSTANT_6_1475 = codasip_tmp_var_1)))) or (CONSTANT_10_1551 = codasip_tmp_var_1)) or (CONSTANT_9_1533 = codasip_tmp_var_1)) or (CONSTANT_8_1515 = codasip_tmp_var_1)) or (CONSTANT_7_1497 = codasip_tmp_var_1)) or (CONSTANT_3_1457 = codasip_tmp_var_1)) or (CONSTANT_2_1439 = codasip_tmp_var_1)) or (CONSTANT_1_1321 = codasip_tmp_var_1)) or (CONSTANT_0_1403 = codasip_tmp_var_1)))) else 
		std_logic_vector(rd_aluB_mux_STATEMENT_AST_1810) when (((ACT = CONSTANT_1_1321(0)) and (((CONSTANT_6_1475 = codasip_tmp_var_1) or (CONSTANT_5_1421 = codasip_tmp_var_1)) or (CONSTANT_4_1379 = codasip_tmp_var_1)))) else
		std_logic_vector(CONSTANT_0_1652);

end architecture RTL;


