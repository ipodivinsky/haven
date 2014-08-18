--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_instr_hw_operation_opr_alu_imm_all_0_Q0 : in std_logic_vector(3 downto 0);
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
end entity codix_risc_ca_core_main_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(3 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2 : unsigned(3 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2_STATEMENT_AST_4479 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_4488 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_4510 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_4528 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_4606 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_4624 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_4642 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_4660 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_4682 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_4700 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_4718 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_4736 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_4754 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_4769 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_4784 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_4799 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_4814 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_4829 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_4844 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_4859 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_4868 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_4982 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_4593: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_4779: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_4824: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_4764: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_4794: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_4503: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_4629: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_10_4723: unsigned(3 downto 0) := to_unsigned(10, 4);
	constant CONSTANT_14_4534: unsigned(3 downto 0) := to_unsigned(14, 4);
	constant CONSTANT_15_4741: unsigned(3 downto 0) := to_unsigned(15, 4);
	constant CONSTANT_2_4611: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_3_4493: unsigned(1 downto 0) := to_unsigned(3, 2);
	constant CONSTANT_4_4513: unsigned(2 downto 0) := to_unsigned(4, 3);
	constant CONSTANT_5_4515: unsigned(2 downto 0) := to_unsigned(5, 3);
	constant CONSTANT_6_4647: unsigned(2 downto 0) := to_unsigned(6, 3);
	constant CONSTANT_7_4669: unsigned(2 downto 0) := to_unsigned(7, 3);
	constant CONSTANT_8_4687: unsigned(3 downto 0) := to_unsigned(8, 4);
	constant CONSTANT_9_4705: unsigned(3 downto 0) := to_unsigned(9, 4);

begin
	-- child instances inside 'main_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:840: codasip_tmp_var_2=codasip_instance_main_instr_hw ...
	codasip_tmp_var_2_STATEMENT_AST_4479 <= unsigned(codasip_instance_main_instr_hw_operation_opr_alu_imm_all_0_Q0);
	-- codix_risc_ca.acdl:821: rd_alu_op.write(3)
	rd_alu_op_STATEMENT_AST_4488 <= resize(CONSTANT_3_4493, 6);
	-- codix_risc_ca.acdl:823: rd_alu_op.write(5)
	rd_alu_op_STATEMENT_AST_4510 <= resize(CONSTANT_5_4515, 6);
	-- codix_risc_ca.acdl:815: rd_alu_op.write(0)
	rd_alu_op_STATEMENT_AST_4528 <= resize(CONSTANT_0_4593, 6);
	-- codix_risc_ca.acdl:819: rd_alu_op.write(2)
	rd_alu_op_STATEMENT_AST_4606 <= resize(CONSTANT_2_4611, 6);
	-- codix_risc_ca.acdl:817: rd_alu_op.write(1)
	rd_alu_op_STATEMENT_AST_4624 <= resize(CONSTANT_1_4629, 6);
	-- codix_risc_ca.acdl:825: rd_alu_op.write(6)
	rd_alu_op_STATEMENT_AST_4642 <= resize(CONSTANT_6_4647, 6);
	-- codix_risc_ca.acdl:828: rd_alu_op.write(7)
	rd_alu_op_STATEMENT_AST_4660 <= resize(CONSTANT_7_4669, 6);
	-- codix_risc_ca.acdl:830: rd_alu_op.write(8)
	rd_alu_op_STATEMENT_AST_4682 <= resize(CONSTANT_8_4687, 6);
	-- codix_risc_ca.acdl:832: rd_alu_op.write(9)
	rd_alu_op_STATEMENT_AST_4700 <= resize(CONSTANT_9_4705, 6);
	-- codix_risc_ca.acdl:834: rd_alu_op.write(10)
	rd_alu_op_STATEMENT_AST_4718 <= resize(CONSTANT_10_4723, 6);
	-- codix_risc_ca.acdl:836: rd_alu_op.write(15)
	rd_alu_op_STATEMENT_AST_4736 <= resize(CONSTANT_15_4741, 6);
	-- codix_risc_ca.acdl:842: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_4754 <= resize(CONSTANT_0_4593, 4);
	-- codix_risc_ca.acdl:843: rd_dest_en_mux.write(1)
	rd_dest_en_mux_STATEMENT_AST_4769 <= resize(CONSTANT_1_4629, 2);
	-- codix_risc_ca.acdl:844: rd_cond.write(0)
	rd_cond_STATEMENT_AST_4784 <= resize(CONSTANT_0_4593, 5);
	-- codix_risc_ca.acdl:845: rd_ie_flag.write(0)
	rd_ie_flag_STATEMENT_AST_4799 <= resize(CONSTANT_0_4593, 2);
	-- codix_risc_ca.acdl:848: rd_amB.write(0)
	rd_amB_STATEMENT_AST_4814 <= resize(CONSTANT_0_4593, 3);
	-- codix_risc_ca.acdl:849: rd_amC.write(0)
	rd_amC_STATEMENT_AST_4829 <= CONSTANT_0_4593;
	-- codix_risc_ca.acdl:851: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_4844 <= CONSTANT_0_4593;
	-- codix_risc_ca.acdl:873: codasip_tmp_var_1=codasip_instance_main_instr_hw ...
	codasip_tmp_var_1_STATEMENT_AST_4859 <= unsigned(codasip_instance_main_instr_hw_operation_opr_alu_imm_all_0_Q0);
	-- codix_risc_ca.acdl:863: rd_aluB_mux.write(1)
	rd_aluB_mux_STATEMENT_AST_4868 <= resize(CONSTANT_1_4629, 3);
	-- codix_risc_ca.acdl:868: rd_aluB_mux.write(2)
	rd_aluB_mux_STATEMENT_AST_4982 <= resize(CONSTANT_2_4611, 3);
	codasip_tmp_var_2 <= codasip_tmp_var_2_STATEMENT_AST_4479;
	rd_alu_op_WE0 <= CONSTANT_1_4629(0) when (((ACT = CONSTANT_1_4629(0)) and (CONSTANT_3_4493 = codasip_tmp_var_2))) else 
		CONSTANT_1_4629(0) when (((ACT = CONSTANT_1_4629(0)) and (CONSTANT_4_4513 = codasip_tmp_var_2))) else 
		CONSTANT_1_4629(0) when (((ACT = CONSTANT_1_4629(0)) and ((CONSTANT_0_4593 = codasip_tmp_var_2) or (((((((((((not((CONSTANT_0_4593 = codasip_tmp_var_2)) and not((CONSTANT_1_4629 = codasip_tmp_var_2))) and not((CONSTANT_2_4611 = codasip_tmp_var_2))) and not((CONSTANT_3_4493 = codasip_tmp_var_2))) and not((CONSTANT_4_4513 = codasip_tmp_var_2))) and not((CONSTANT_5_4515 = codasip_tmp_var_2))) and not((CONSTANT_7_4669 = codasip_tmp_var_2))) and not((CONSTANT_6_4647 = codasip_tmp_var_2))) and not((CONSTANT_8_4687 = codasip_tmp_var_2))) and not((CONSTANT_9_4705 = codasip_tmp_var_2))) and not((CONSTANT_10_4723 = codasip_tmp_var_2))) and not((CONSTANT_14_4534 = codasip_tmp_var_2)))))) else 
		CONSTANT_1_4629(0) when (((ACT = CONSTANT_1_4629(0)) and (CONSTANT_2_4611 = codasip_tmp_var_2))) else 
		CONSTANT_1_4629(0) when (((ACT = CONSTANT_1_4629(0)) and (CONSTANT_1_4629 = codasip_tmp_var_2))) else 
		CONSTANT_1_4629(0) when (((ACT = CONSTANT_1_4629(0)) and (CONSTANT_5_4515 = codasip_tmp_var_2))) else 
		CONSTANT_1_4629(0) when (((ACT = CONSTANT_1_4629(0)) and ((CONSTANT_6_4647 = codasip_tmp_var_2) or (CONSTANT_7_4669 = codasip_tmp_var_2)))) else 
		CONSTANT_1_4629(0) when (((ACT = CONSTANT_1_4629(0)) and (CONSTANT_8_4687 = codasip_tmp_var_2))) else 
		CONSTANT_1_4629(0) when (((ACT = CONSTANT_1_4629(0)) and (CONSTANT_9_4705 = codasip_tmp_var_2))) else 
		CONSTANT_1_4629(0) when (((ACT = CONSTANT_1_4629(0)) and (CONSTANT_10_4723 = codasip_tmp_var_2))) else 
		CONSTANT_1_4629(0) when (((ACT = CONSTANT_1_4629(0)) and (CONSTANT_14_4534 = codasip_tmp_var_2))) else
		CONSTANT_0_4593(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_4488) when (((ACT = CONSTANT_1_4629(0)) and (CONSTANT_3_4493 = codasip_tmp_var_2))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_4510) when (((ACT = CONSTANT_1_4629(0)) and (CONSTANT_4_4513 = codasip_tmp_var_2))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_4528) when (((ACT = CONSTANT_1_4629(0)) and ((CONSTANT_0_4593 = codasip_tmp_var_2) or (((((((((((not((CONSTANT_0_4593 = codasip_tmp_var_2)) and not((CONSTANT_1_4629 = codasip_tmp_var_2))) and not((CONSTANT_2_4611 = codasip_tmp_var_2))) and not((CONSTANT_3_4493 = codasip_tmp_var_2))) and not((CONSTANT_4_4513 = codasip_tmp_var_2))) and not((CONSTANT_5_4515 = codasip_tmp_var_2))) and not((CONSTANT_7_4669 = codasip_tmp_var_2))) and not((CONSTANT_6_4647 = codasip_tmp_var_2))) and not((CONSTANT_8_4687 = codasip_tmp_var_2))) and not((CONSTANT_9_4705 = codasip_tmp_var_2))) and not((CONSTANT_10_4723 = codasip_tmp_var_2))) and not((CONSTANT_14_4534 = codasip_tmp_var_2)))))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_4606) when (((ACT = CONSTANT_1_4629(0)) and (CONSTANT_2_4611 = codasip_tmp_var_2))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_4624) when (((ACT = CONSTANT_1_4629(0)) and (CONSTANT_1_4629 = codasip_tmp_var_2))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_4642) when (((ACT = CONSTANT_1_4629(0)) and (CONSTANT_5_4515 = codasip_tmp_var_2))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_4660) when (((ACT = CONSTANT_1_4629(0)) and ((CONSTANT_6_4647 = codasip_tmp_var_2) or (CONSTANT_7_4669 = codasip_tmp_var_2)))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_4682) when (((ACT = CONSTANT_1_4629(0)) and (CONSTANT_8_4687 = codasip_tmp_var_2))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_4700) when (((ACT = CONSTANT_1_4629(0)) and (CONSTANT_9_4705 = codasip_tmp_var_2))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_4718) when (((ACT = CONSTANT_1_4629(0)) and (CONSTANT_10_4723 = codasip_tmp_var_2))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_4736) when (((ACT = CONSTANT_1_4629(0)) and (CONSTANT_14_4534 = codasip_tmp_var_2))) else
		std_logic_vector(CONSTANT_0_4503);
	rd_mem_rw_WE0 <= CONSTANT_1_4629(0) when ((ACT = CONSTANT_1_4629(0))) else
		CONSTANT_0_4593(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_4754) when ((ACT = CONSTANT_1_4629(0))) else
		std_logic_vector(CONSTANT_0_4764);
	rd_dest_en_mux_WE0 <= CONSTANT_1_4629(0) when ((ACT = CONSTANT_1_4629(0))) else
		CONSTANT_0_4593(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_4769) when ((ACT = CONSTANT_1_4629(0))) else
		std_logic_vector(CONSTANT_0_4779);
	rd_cond_WE0 <= CONSTANT_1_4629(0) when ((ACT = CONSTANT_1_4629(0))) else
		CONSTANT_0_4593(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_4784) when ((ACT = CONSTANT_1_4629(0))) else
		std_logic_vector(CONSTANT_0_4794);
	rd_ie_flag_WE0 <= CONSTANT_1_4629(0) when ((ACT = CONSTANT_1_4629(0))) else
		CONSTANT_0_4593(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_4799) when ((ACT = CONSTANT_1_4629(0))) else
		std_logic_vector(CONSTANT_0_4779);
	rd_amB_WE0 <= CONSTANT_1_4629(0) when ((ACT = CONSTANT_1_4629(0))) else
		CONSTANT_0_4593(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_4814) when ((ACT = CONSTANT_1_4629(0))) else
		std_logic_vector(CONSTANT_0_4824);
	rd_amC_WE0 <= CONSTANT_1_4629(0) when ((ACT = CONSTANT_1_4629(0))) else
		CONSTANT_0_4593(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_4829(0) when ((ACT = CONSTANT_1_4629(0))) else
		CONSTANT_0_4593(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_4629(0) when ((ACT = CONSTANT_1_4629(0))) else
		CONSTANT_0_4593(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_4844(0) when ((ACT = CONSTANT_1_4629(0))) else
		CONSTANT_0_4593(0);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_4859;
	rd_aluB_mux_WE0 <= CONSTANT_1_4629(0) when (((ACT = CONSTANT_1_4629(0)) and ((((((((((CONSTANT_14_4534 = codasip_tmp_var_1) or (((((((((((not((CONSTANT_0_4593 = codasip_tmp_var_1)) and not((CONSTANT_1_4629 = codasip_tmp_var_1))) and not((CONSTANT_2_4611 = codasip_tmp_var_1))) and not((CONSTANT_3_4493 = codasip_tmp_var_1))) and not((CONSTANT_7_4669 = codasip_tmp_var_1))) and not((CONSTANT_8_4687 = codasip_tmp_var_1))) and not((CONSTANT_9_4705 = codasip_tmp_var_1))) and not((CONSTANT_10_4723 = codasip_tmp_var_1))) and not((CONSTANT_14_4534 = codasip_tmp_var_1))) and not((CONSTANT_4_4513 = codasip_tmp_var_1))) and not((CONSTANT_5_4515 = codasip_tmp_var_1))) and not((CONSTANT_6_4647 = codasip_tmp_var_1)))) or (CONSTANT_10_4723 = codasip_tmp_var_1)) or (CONSTANT_9_4705 = codasip_tmp_var_1)) or (CONSTANT_8_4687 = codasip_tmp_var_1)) or (CONSTANT_7_4669 = codasip_tmp_var_1)) or (CONSTANT_3_4493 = codasip_tmp_var_1)) or (CONSTANT_2_4611 = codasip_tmp_var_1)) or (CONSTANT_1_4629 = codasip_tmp_var_1)) or (CONSTANT_0_4593 = codasip_tmp_var_1)))) else 
		CONSTANT_1_4629(0) when (((ACT = CONSTANT_1_4629(0)) and (((CONSTANT_6_4647 = codasip_tmp_var_1) or (CONSTANT_5_4515 = codasip_tmp_var_1)) or (CONSTANT_4_4513 = codasip_tmp_var_1)))) else
		CONSTANT_0_4593(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_4868) when (((ACT = CONSTANT_1_4629(0)) and ((((((((((CONSTANT_14_4534 = codasip_tmp_var_1) or (((((((((((not((CONSTANT_0_4593 = codasip_tmp_var_1)) and not((CONSTANT_1_4629 = codasip_tmp_var_1))) and not((CONSTANT_2_4611 = codasip_tmp_var_1))) and not((CONSTANT_3_4493 = codasip_tmp_var_1))) and not((CONSTANT_7_4669 = codasip_tmp_var_1))) and not((CONSTANT_8_4687 = codasip_tmp_var_1))) and not((CONSTANT_9_4705 = codasip_tmp_var_1))) and not((CONSTANT_10_4723 = codasip_tmp_var_1))) and not((CONSTANT_14_4534 = codasip_tmp_var_1))) and not((CONSTANT_4_4513 = codasip_tmp_var_1))) and not((CONSTANT_5_4515 = codasip_tmp_var_1))) and not((CONSTANT_6_4647 = codasip_tmp_var_1)))) or (CONSTANT_10_4723 = codasip_tmp_var_1)) or (CONSTANT_9_4705 = codasip_tmp_var_1)) or (CONSTANT_8_4687 = codasip_tmp_var_1)) or (CONSTANT_7_4669 = codasip_tmp_var_1)) or (CONSTANT_3_4493 = codasip_tmp_var_1)) or (CONSTANT_2_4611 = codasip_tmp_var_1)) or (CONSTANT_1_4629 = codasip_tmp_var_1)) or (CONSTANT_0_4593 = codasip_tmp_var_1)))) else 
		std_logic_vector(rd_aluB_mux_STATEMENT_AST_4982) when (((ACT = CONSTANT_1_4629(0)) and (((CONSTANT_6_4647 = codasip_tmp_var_1) or (CONSTANT_5_4515 = codasip_tmp_var_1)) or (CONSTANT_4_4513 = codasip_tmp_var_1)))) else
		std_logic_vector(CONSTANT_0_4824);

end architecture RTL;


