--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_ex_output_ex_output_fu_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_ex_output_ex_output_fu_semantics_t is
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
end entity codix_risc_ca_core_main_ex_output_ex_output_fu_semantics_t;

architecture RTL of codix_risc_ca_core_main_ex_output_ex_output_fu_semantics_t is
	-- signal (inner)
	signal ex_dest_en_STATEMENT_AST_8221 : unsigned(0 downto 0);
	-- signal (inner)
	signal ex2_alu_op_STATEMENT_AST_8240 : unsigned(5 downto 0);
	-- signal (inner)
	signal ex2_rW_STATEMENT_AST_8255 : unsigned(4 downto 0);
	-- signal (inner)
	signal ex2_mem_rw_STATEMENT_AST_8285 : unsigned(3 downto 0);
	-- signal (inner)
	signal ex2_dest_en_STATEMENT_AST_8300 : unsigned(0 downto 0);
	-- signal (inner)
	signal ex2_alu_STATEMENT_AST_8315 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex2_regB_STATEMENT_AST_8330 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex2_regC_STATEMENT_AST_8345 : unsigned(31 downto 0);

		-- datapath signals and constants
	signal tmp_conv_logic_to_unsigned_15151: unsigned(0 downto 0);
	constant CONSTANT_0_8231: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_1_8232: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_2_8225: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_24_8259: unsigned(4 downto 0) := to_unsigned(24, 5);
	constant CONSTANT_25_8263: unsigned(4 downto 0) := to_unsigned(25, 5);
	constant CONSTANT_26_8267: unsigned(4 downto 0) := to_unsigned(26, 5);
	constant CONSTANT_28_8270: unsigned(4 downto 0) := to_unsigned(28, 5);
	constant CONSTANT_29_8271: unsigned(4 downto 0) := to_unsigned(29, 5);
	constant CONSTANT_31_8272: unsigned(4 downto 0) := to_unsigned(31, 5);

begin
	-- child instances inside 'main_ex_output_ex_output_fu_semantics' functional unit:

		-- conversions for datapath
	tmp_conv_logic_to_unsigned_15151(0) <= ex_cmp_Q0;

		-- Datapath code
	-- codix_risc_ca.acdl:2091: ex_dest_en.write((ex_dest_en_mux.read()==2) ? ( ...
	ex_dest_en_STATEMENT_AST_8221 <= 
		tmp_conv_logic_to_unsigned_15151 when ((unsigned(ex_dest_en_mux_Q0) = CONSTANT_2_8225)) else
		CONSTANT_1_8232 when ((unsigned(ex_dest_en_mux_Q0) = CONSTANT_1_8232)) else
		CONSTANT_0_8231;
	-- codix_risc_ca.acdl:2095: ex2_alu_op.write(ex_alu_op.read())
	ex2_alu_op_STATEMENT_AST_8240 <= unsigned(ex_alu_op_Q0);
	-- codix_risc_ca.acdl:2098: ex2_rW.write((ex_alu_op.read()==24) ? (codasip: ...
	ex2_rW_STATEMENT_AST_8255 <= 
		CONSTANT_31_8272 when ((unsigned(ex_alu_op_Q0) = CONSTANT_24_8259)) else
		CONSTANT_29_8271 when ((unsigned(ex_alu_op_Q0) = CONSTANT_25_8263)) else
		CONSTANT_28_8270 when ((unsigned(ex_alu_op_Q0) = CONSTANT_26_8267)) else
		unsigned(ex_rW_Q0);
	-- codix_risc_ca.acdl:2099: ex2_mem_rw.write(ex_mem_rw.read())
	ex2_mem_rw_STATEMENT_AST_8285 <= unsigned(ex_mem_rw_Q0);
	-- codix_risc_ca.acdl:2100: ex2_dest_en.write(ex_dest_en.read())
	ex2_dest_en_STATEMENT_AST_8300(0) <= ex_dest_en_Q0;
	-- codix_risc_ca.acdl:2102: ex2_alu.write(ex_alu_arith.read())
	ex2_alu_STATEMENT_AST_8315 <= unsigned(ex_alu_arith_Q0);
	-- codix_risc_ca.acdl:2103: ex2_regB.write(ex_regB.read())
	ex2_regB_STATEMENT_AST_8330 <= unsigned(ex_regB_Q0);
	-- codix_risc_ca.acdl:2104: ex2_regC.write(ex_regC.read())
	ex2_regC_STATEMENT_AST_8345 <= unsigned(ex_regC_Q0);
	ex_dest_en_D0 <= ex_dest_en_STATEMENT_AST_8221(0);
	ex2_alu_op_WE0 <= CONSTANT_1_8232(0) when ((ACT = CONSTANT_1_8232(0))) else
		CONSTANT_0_8231(0);
	ex2_alu_op_D0 <= std_logic_vector(ex2_alu_op_STATEMENT_AST_8240);
	ex2_rW_WE0 <= CONSTANT_1_8232(0) when ((ACT = CONSTANT_1_8232(0))) else
		CONSTANT_0_8231(0);
	ex2_rW_D0 <= std_logic_vector(ex2_rW_STATEMENT_AST_8255);
	ex2_mem_rw_WE0 <= CONSTANT_1_8232(0) when ((ACT = CONSTANT_1_8232(0))) else
		CONSTANT_0_8231(0);
	ex2_mem_rw_D0 <= std_logic_vector(ex2_mem_rw_STATEMENT_AST_8285);
	ex2_dest_en_WE0 <= CONSTANT_1_8232(0) when ((ACT = CONSTANT_1_8232(0))) else
		CONSTANT_0_8231(0);
	ex2_dest_en_D0 <= ex2_dest_en_STATEMENT_AST_8300(0);
	ex2_alu_WE0 <= CONSTANT_1_8232(0) when ((ACT = CONSTANT_1_8232(0))) else
		CONSTANT_0_8231(0);
	ex2_alu_D0 <= std_logic_vector(ex2_alu_STATEMENT_AST_8315);
	ex2_regB_WE0 <= CONSTANT_1_8232(0) when ((ACT = CONSTANT_1_8232(0))) else
		CONSTANT_0_8231(0);
	ex2_regB_D0 <= std_logic_vector(ex2_regB_STATEMENT_AST_8330);
	ex2_regC_WE0 <= CONSTANT_1_8232(0) when ((ACT = CONSTANT_1_8232(0))) else
		CONSTANT_0_8231(0);
	ex2_regC_D0 <= std_logic_vector(ex2_regC_STATEMENT_AST_8345);

end architecture RTL;


