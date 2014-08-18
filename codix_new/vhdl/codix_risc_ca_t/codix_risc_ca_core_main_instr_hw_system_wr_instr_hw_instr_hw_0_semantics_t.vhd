--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_t is
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
		rd_mem_rw_WE0 : out std_logic	);
end entity codix_risc_ca_core_main_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_7719 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_7734 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_7749 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_7764 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_7779 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_7794 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_7809 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_7824 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_7839 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_7736: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_7759: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_7804: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_7744: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_7774: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_7729: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_7751: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_30_7721: unsigned(4 downto 0) := to_unsigned(30, 5);

begin
	-- child instances inside 'main_instr_hw_system_wr_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1375: rd_alu_op.write(30)
	rd_alu_op_STATEMENT_AST_7719 <= resize(CONSTANT_30_7721, 6);
	-- codix_risc_ca.acdl:1376: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_7734 <= resize(CONSTANT_0_7736, 4);
	-- codix_risc_ca.acdl:1377: rd_dest_en_mux.write(1)
	rd_dest_en_mux_STATEMENT_AST_7749 <= resize(CONSTANT_1_7751, 2);
	-- codix_risc_ca.acdl:1378: rd_cond.write(0)
	rd_cond_STATEMENT_AST_7764 <= resize(CONSTANT_0_7736, 5);
	-- codix_risc_ca.acdl:1379: rd_ie_flag.write(0)
	rd_ie_flag_STATEMENT_AST_7779 <= resize(CONSTANT_0_7736, 2);
	-- codix_risc_ca.acdl:1382: rd_amB.write(0)
	rd_amB_STATEMENT_AST_7794 <= resize(CONSTANT_0_7736, 3);
	-- codix_risc_ca.acdl:1383: rd_amC.write(0)
	rd_amC_STATEMENT_AST_7809 <= CONSTANT_0_7736;
	-- codix_risc_ca.acdl:1385: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_7824 <= CONSTANT_0_7736;
	-- codix_risc_ca.acdl:1386: rd_aluB_mux.write(0)
	rd_aluB_mux_STATEMENT_AST_7839 <= resize(CONSTANT_0_7736, 3);
	rd_alu_op_WE0 <= CONSTANT_1_7751(0) when ((ACT = CONSTANT_1_7751(0))) else
		CONSTANT_0_7736(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_7719) when ((ACT = CONSTANT_1_7751(0))) else
		std_logic_vector(CONSTANT_0_7729);
	rd_mem_rw_WE0 <= CONSTANT_1_7751(0) when ((ACT = CONSTANT_1_7751(0))) else
		CONSTANT_0_7736(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_7734) when ((ACT = CONSTANT_1_7751(0))) else
		std_logic_vector(CONSTANT_0_7744);
	rd_dest_en_mux_WE0 <= CONSTANT_1_7751(0) when ((ACT = CONSTANT_1_7751(0))) else
		CONSTANT_0_7736(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_7749) when ((ACT = CONSTANT_1_7751(0))) else
		std_logic_vector(CONSTANT_0_7759);
	rd_cond_WE0 <= CONSTANT_1_7751(0) when ((ACT = CONSTANT_1_7751(0))) else
		CONSTANT_0_7736(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_7764) when ((ACT = CONSTANT_1_7751(0))) else
		std_logic_vector(CONSTANT_0_7774);
	rd_ie_flag_WE0 <= CONSTANT_1_7751(0) when ((ACT = CONSTANT_1_7751(0))) else
		CONSTANT_0_7736(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_7779) when ((ACT = CONSTANT_1_7751(0))) else
		std_logic_vector(CONSTANT_0_7759);
	rd_amB_WE0 <= CONSTANT_1_7751(0) when ((ACT = CONSTANT_1_7751(0))) else
		CONSTANT_0_7736(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_7794) when ((ACT = CONSTANT_1_7751(0))) else
		std_logic_vector(CONSTANT_0_7804);
	rd_amC_WE0 <= CONSTANT_1_7751(0) when ((ACT = CONSTANT_1_7751(0))) else
		CONSTANT_0_7736(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_7809(0) when ((ACT = CONSTANT_1_7751(0))) else
		CONSTANT_0_7736(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_7751(0) when ((ACT = CONSTANT_1_7751(0))) else
		CONSTANT_0_7736(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_7824(0) when ((ACT = CONSTANT_1_7751(0))) else
		CONSTANT_0_7736(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_7751(0) when ((ACT = CONSTANT_1_7751(0))) else
		CONSTANT_0_7736(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_7839) when ((ACT = CONSTANT_1_7751(0))) else
		std_logic_vector(CONSTANT_0_7804);

end architecture RTL;


