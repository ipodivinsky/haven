--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_instr_hw_operation_opr_jump_call_0_Q0 : in std_logic_vector(4 downto 0);
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
end entity codix_risc_ca_core_main_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_5601 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_5616 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_5631 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_5646 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_5670 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_5685 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_5700 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_5715 : unsigned(2 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_5730 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5739 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5761 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5779 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5797 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5815 : unsigned(5 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_5603: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_5626: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_5680: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_5611: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_5641: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_5754: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_5618: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_11_5764: unsigned(3 downto 0) := to_unsigned(11, 4);
	constant CONSTANT_12_5654: unsigned(3 downto 0) := to_unsigned(12, 4);
	constant CONSTANT_13_5651: unsigned(3 downto 0) := to_unsigned(13, 4);
	constant CONSTANT_2_5657: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_20_5742: unsigned(4 downto 0) := to_unsigned(20, 5);
	constant CONSTANT_23_5744: unsigned(4 downto 0) := to_unsigned(23, 5);
	constant CONSTANT_24_5766: unsigned(4 downto 0) := to_unsigned(24, 5);
	constant CONSTANT_25_5784: unsigned(4 downto 0) := to_unsigned(25, 5);
	constant CONSTANT_26_5802: unsigned(4 downto 0) := to_unsigned(26, 5);
	constant CONSTANT_3_5717: unsigned(1 downto 0) := to_unsigned(3, 2);

begin
	-- child instances inside 'main_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1022: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_5601 <= resize(CONSTANT_0_5603, 4);
	-- codix_risc_ca.acdl:1023: rd_dest_en_mux.write(1)
	rd_dest_en_mux_STATEMENT_AST_5616 <= resize(CONSTANT_1_5618, 2);
	-- codix_risc_ca.acdl:1024: rd_cond.write(0)
	rd_cond_STATEMENT_AST_5631 <= resize(CONSTANT_0_5603, 5);
	-- codix_risc_ca.acdl:1025: rd_ie_flag.write(((codasip_instance_main_instr_ ...
	rd_ie_flag_STATEMENT_AST_5646 <= 
		CONSTANT_2_5657 when (((unsigned(codasip_instance_main_instr_hw_operation_opr_jump_call_0_Q0) = CONSTANT_12_5654) or (unsigned(codasip_instance_main_instr_hw_operation_opr_jump_call_0_Q0) = CONSTANT_13_5651))) else
		resize(CONSTANT_0_5603, 2);
	-- codix_risc_ca.acdl:1028: rd_amB.write(0)
	rd_amB_STATEMENT_AST_5670 <= resize(CONSTANT_0_5603, 3);
	-- codix_risc_ca.acdl:1029: rd_amC.write(0)
	rd_amC_STATEMENT_AST_5685 <= CONSTANT_0_5603;
	-- codix_risc_ca.acdl:1031: rd_aluA_mux.write(1)
	rd_aluA_mux_STATEMENT_AST_5700 <= CONSTANT_1_5618;
	-- codix_risc_ca.acdl:1032: rd_aluB_mux.write(3)
	rd_aluB_mux_STATEMENT_AST_5715 <= resize(CONSTANT_3_5717, 3);
	-- codix_risc_ca.acdl:1051: codasip_tmp_var_1=codasip_instance_main_instr_h ...
	codasip_tmp_var_1_STATEMENT_AST_5730 <= unsigned(codasip_instance_main_instr_hw_operation_opr_jump_call_0_Q0);
	-- codix_risc_ca.acdl:1037: rd_alu_op.write(23)
	rd_alu_op_STATEMENT_AST_5739 <= resize(CONSTANT_23_5744, 6);
	-- codix_risc_ca.acdl:1040: rd_alu_op.write(24)
	rd_alu_op_STATEMENT_AST_5761 <= resize(CONSTANT_24_5766, 6);
	-- codix_risc_ca.acdl:1043: rd_alu_op.write(25)
	rd_alu_op_STATEMENT_AST_5779 <= resize(CONSTANT_25_5784, 6);
	-- codix_risc_ca.acdl:1046: rd_alu_op.write(26)
	rd_alu_op_STATEMENT_AST_5797 <= resize(CONSTANT_26_5802, 6);
	-- codix_risc_ca.acdl:1049: rd_alu_op.write(0)
	rd_alu_op_STATEMENT_AST_5815 <= resize(CONSTANT_0_5603, 6);
	rd_mem_rw_WE0 <= CONSTANT_1_5618(0) when ((ACT = CONSTANT_1_5618(0))) else
		CONSTANT_0_5603(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_5601) when ((ACT = CONSTANT_1_5618(0))) else
		std_logic_vector(CONSTANT_0_5611);
	rd_dest_en_mux_WE0 <= CONSTANT_1_5618(0) when ((ACT = CONSTANT_1_5618(0))) else
		CONSTANT_0_5603(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_5616) when ((ACT = CONSTANT_1_5618(0))) else
		std_logic_vector(CONSTANT_0_5626);
	rd_cond_WE0 <= CONSTANT_1_5618(0) when ((ACT = CONSTANT_1_5618(0))) else
		CONSTANT_0_5603(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_5631) when ((ACT = CONSTANT_1_5618(0))) else
		std_logic_vector(CONSTANT_0_5641);
	rd_ie_flag_WE0 <= CONSTANT_1_5618(0) when ((ACT = CONSTANT_1_5618(0))) else
		CONSTANT_0_5603(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_5646) when ((ACT = CONSTANT_1_5618(0))) else
		std_logic_vector(CONSTANT_0_5626);
	rd_amB_WE0 <= CONSTANT_1_5618(0) when ((ACT = CONSTANT_1_5618(0))) else
		CONSTANT_0_5603(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_5670) when ((ACT = CONSTANT_1_5618(0))) else
		std_logic_vector(CONSTANT_0_5680);
	rd_amC_WE0 <= CONSTANT_1_5618(0) when ((ACT = CONSTANT_1_5618(0))) else
		CONSTANT_0_5603(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_5685(0) when ((ACT = CONSTANT_1_5618(0))) else
		CONSTANT_0_5603(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_5618(0) when ((ACT = CONSTANT_1_5618(0))) else
		CONSTANT_0_5603(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_5700(0) when ((ACT = CONSTANT_1_5618(0))) else
		CONSTANT_0_5603(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_5618(0) when ((ACT = CONSTANT_1_5618(0))) else
		CONSTANT_0_5603(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_5715) when ((ACT = CONSTANT_1_5618(0))) else
		std_logic_vector(CONSTANT_0_5680);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_5730;
	rd_alu_op_WE0 <= CONSTANT_1_5618(0) when (((ACT = CONSTANT_1_5618(0)) and (CONSTANT_20_5742 = codasip_tmp_var_1))) else 
		CONSTANT_1_5618(0) when (((ACT = CONSTANT_1_5618(0)) and (CONSTANT_11_5764 = codasip_tmp_var_1))) else 
		CONSTANT_1_5618(0) when (((ACT = CONSTANT_1_5618(0)) and (CONSTANT_12_5654 = codasip_tmp_var_1))) else 
		CONSTANT_1_5618(0) when (((ACT = CONSTANT_1_5618(0)) and (CONSTANT_13_5651 = codasip_tmp_var_1))) else 
		CONSTANT_1_5618(0) when (((ACT = CONSTANT_1_5618(0)) and (((not((CONSTANT_20_5742 = codasip_tmp_var_1)) and not((CONSTANT_11_5764 = codasip_tmp_var_1))) and not((CONSTANT_12_5654 = codasip_tmp_var_1))) and not((CONSTANT_13_5651 = codasip_tmp_var_1))))) else
		CONSTANT_0_5603(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_5739) when (((ACT = CONSTANT_1_5618(0)) and (CONSTANT_20_5742 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5761) when (((ACT = CONSTANT_1_5618(0)) and (CONSTANT_11_5764 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5779) when (((ACT = CONSTANT_1_5618(0)) and (CONSTANT_12_5654 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5797) when (((ACT = CONSTANT_1_5618(0)) and (CONSTANT_13_5651 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5815) when (((ACT = CONSTANT_1_5618(0)) and (((not((CONSTANT_20_5742 = codasip_tmp_var_1)) and not((CONSTANT_11_5764 = codasip_tmp_var_1))) and not((CONSTANT_12_5654 = codasip_tmp_var_1))) and not((CONSTANT_13_5651 = codasip_tmp_var_1))))) else
		std_logic_vector(CONSTANT_0_5754);

end architecture RTL;


