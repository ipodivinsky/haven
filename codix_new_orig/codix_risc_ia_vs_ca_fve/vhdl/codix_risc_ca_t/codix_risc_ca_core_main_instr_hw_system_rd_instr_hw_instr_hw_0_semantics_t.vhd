--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_instr_hw_operation_opr_system_rd_0_Q0 : in std_logic_vector(8 downto 0);
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
end entity codix_risc_ca_core_main_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_7579 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_7599 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_7614 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_7629 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_7644 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_7659 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_7674 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_7689 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_7704 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_7601: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_7624: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_7669: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_7609: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_7639: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_7594: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_7590: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_28_7585: unsigned(4 downto 0) := to_unsigned(28, 5);
	constant CONSTANT_29_7586: unsigned(4 downto 0) := to_unsigned(29, 5);
	constant CONSTANT_344_7583: unsigned(8 downto 0) := to_unsigned(344, 9);

begin
	-- child instances inside 'main_instr_hw_system_rd_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1350: rd_alu_op.write((codasip_instance_main_instr_hw ...
	rd_alu_op_STATEMENT_AST_7579 <= 
		resize(CONSTANT_29_7586, 6) when ((unsigned(codasip_instance_main_instr_hw_operation_opr_system_rd_0_Q0) = CONSTANT_344_7583)) else
		resize(CONSTANT_28_7585, 6);
	-- codix_risc_ca.acdl:1351: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_7599 <= resize(CONSTANT_0_7601, 4);
	-- codix_risc_ca.acdl:1352: rd_dest_en_mux.write(0)
	rd_dest_en_mux_STATEMENT_AST_7614 <= resize(CONSTANT_0_7601, 2);
	-- codix_risc_ca.acdl:1353: rd_cond.write(0)
	rd_cond_STATEMENT_AST_7629 <= resize(CONSTANT_0_7601, 5);
	-- codix_risc_ca.acdl:1354: rd_ie_flag.write(0)
	rd_ie_flag_STATEMENT_AST_7644 <= resize(CONSTANT_0_7601, 2);
	-- codix_risc_ca.acdl:1357: rd_amB.write(0)
	rd_amB_STATEMENT_AST_7659 <= resize(CONSTANT_0_7601, 3);
	-- codix_risc_ca.acdl:1358: rd_amC.write(0)
	rd_amC_STATEMENT_AST_7674 <= CONSTANT_0_7601;
	-- codix_risc_ca.acdl:1360: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_7689 <= CONSTANT_0_7601;
	-- codix_risc_ca.acdl:1361: rd_aluB_mux.write(0)
	rd_aluB_mux_STATEMENT_AST_7704 <= resize(CONSTANT_0_7601, 3);
	rd_alu_op_WE0 <= CONSTANT_1_7590(0) when ((ACT = CONSTANT_1_7590(0))) else
		CONSTANT_0_7601(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_7579) when ((ACT = CONSTANT_1_7590(0))) else
		std_logic_vector(CONSTANT_0_7594);
	rd_mem_rw_WE0 <= CONSTANT_1_7590(0) when ((ACT = CONSTANT_1_7590(0))) else
		CONSTANT_0_7601(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_7599) when ((ACT = CONSTANT_1_7590(0))) else
		std_logic_vector(CONSTANT_0_7609);
	rd_dest_en_mux_WE0 <= CONSTANT_1_7590(0) when ((ACT = CONSTANT_1_7590(0))) else
		CONSTANT_0_7601(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_7614) when ((ACT = CONSTANT_1_7590(0))) else
		std_logic_vector(CONSTANT_0_7624);
	rd_cond_WE0 <= CONSTANT_1_7590(0) when ((ACT = CONSTANT_1_7590(0))) else
		CONSTANT_0_7601(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_7629) when ((ACT = CONSTANT_1_7590(0))) else
		std_logic_vector(CONSTANT_0_7639);
	rd_ie_flag_WE0 <= CONSTANT_1_7590(0) when ((ACT = CONSTANT_1_7590(0))) else
		CONSTANT_0_7601(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_7644) when ((ACT = CONSTANT_1_7590(0))) else
		std_logic_vector(CONSTANT_0_7624);
	rd_amB_WE0 <= CONSTANT_1_7590(0) when ((ACT = CONSTANT_1_7590(0))) else
		CONSTANT_0_7601(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_7659) when ((ACT = CONSTANT_1_7590(0))) else
		std_logic_vector(CONSTANT_0_7669);
	rd_amC_WE0 <= CONSTANT_1_7590(0) when ((ACT = CONSTANT_1_7590(0))) else
		CONSTANT_0_7601(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_7674(0) when ((ACT = CONSTANT_1_7590(0))) else
		CONSTANT_0_7601(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_7590(0) when ((ACT = CONSTANT_1_7590(0))) else
		CONSTANT_0_7601(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_7689(0) when ((ACT = CONSTANT_1_7590(0))) else
		CONSTANT_0_7601(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_7590(0) when ((ACT = CONSTANT_1_7590(0))) else
		CONSTANT_0_7601(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_7704) when ((ACT = CONSTANT_1_7590(0))) else
		std_logic_vector(CONSTANT_0_7669);

end architecture RTL;


