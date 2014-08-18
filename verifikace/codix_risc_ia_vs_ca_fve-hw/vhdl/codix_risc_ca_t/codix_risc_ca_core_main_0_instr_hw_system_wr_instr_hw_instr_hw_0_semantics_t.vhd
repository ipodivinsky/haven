--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_t is
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
		rd_mem_rw_WE0 : out std_logic
	);
end entity codix_risc_ca_core_main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_4547 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_4562 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_4577 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_4592 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_4607 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_4622 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_4637 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_4652 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_4667 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_4564: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_4587: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_4632: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_4572: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_4602: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_4557: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_4579: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_30_4549: unsigned(4 downto 0) := to_unsigned(30, 5);

begin
	-- child instances inside 'main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1375: rd_alu_op.write(30)
	rd_alu_op_STATEMENT_AST_4547 <= resize(CONSTANT_30_4549, 6);
	-- codix_risc_ca.acdl:1376: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_4562 <= resize(CONSTANT_0_4564, 4);
	-- codix_risc_ca.acdl:1377: rd_dest_en_mux.write(1)
	rd_dest_en_mux_STATEMENT_AST_4577 <= resize(CONSTANT_1_4579, 2);
	-- codix_risc_ca.acdl:1378: rd_cond.write(0)
	rd_cond_STATEMENT_AST_4592 <= resize(CONSTANT_0_4564, 5);
	-- codix_risc_ca.acdl:1379: rd_ie_flag.write(0)
	rd_ie_flag_STATEMENT_AST_4607 <= resize(CONSTANT_0_4564, 2);
	-- codix_risc_ca.acdl:1382: rd_amB.write(0)
	rd_amB_STATEMENT_AST_4622 <= resize(CONSTANT_0_4564, 3);
	-- codix_risc_ca.acdl:1383: rd_amC.write(0)
	rd_amC_STATEMENT_AST_4637 <= CONSTANT_0_4564;
	-- codix_risc_ca.acdl:1385: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_4652 <= CONSTANT_0_4564;
	-- codix_risc_ca.acdl:1386: rd_aluB_mux.write(0)
	rd_aluB_mux_STATEMENT_AST_4667 <= resize(CONSTANT_0_4564, 3);
	rd_alu_op_WE0 <= CONSTANT_1_4579(0) when ((ACT = CONSTANT_1_4579(0))) else
		CONSTANT_0_4564(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_4547) when ((ACT = CONSTANT_1_4579(0))) else
		std_logic_vector(CONSTANT_0_4557);
	rd_mem_rw_WE0 <= CONSTANT_1_4579(0) when ((ACT = CONSTANT_1_4579(0))) else
		CONSTANT_0_4564(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_4562) when ((ACT = CONSTANT_1_4579(0))) else
		std_logic_vector(CONSTANT_0_4572);
	rd_dest_en_mux_WE0 <= CONSTANT_1_4579(0) when ((ACT = CONSTANT_1_4579(0))) else
		CONSTANT_0_4564(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_4577) when ((ACT = CONSTANT_1_4579(0))) else
		std_logic_vector(CONSTANT_0_4587);
	rd_cond_WE0 <= CONSTANT_1_4579(0) when ((ACT = CONSTANT_1_4579(0))) else
		CONSTANT_0_4564(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_4592) when ((ACT = CONSTANT_1_4579(0))) else
		std_logic_vector(CONSTANT_0_4602);
	rd_ie_flag_WE0 <= CONSTANT_1_4579(0) when ((ACT = CONSTANT_1_4579(0))) else
		CONSTANT_0_4564(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_4607) when ((ACT = CONSTANT_1_4579(0))) else
		std_logic_vector(CONSTANT_0_4587);
	rd_amB_WE0 <= CONSTANT_1_4579(0) when ((ACT = CONSTANT_1_4579(0))) else
		CONSTANT_0_4564(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_4622) when ((ACT = CONSTANT_1_4579(0))) else
		std_logic_vector(CONSTANT_0_4632);
	rd_amC_WE0 <= CONSTANT_1_4579(0) when ((ACT = CONSTANT_1_4579(0))) else
		CONSTANT_0_4564(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_4637(0) when ((ACT = CONSTANT_1_4579(0))) else
		CONSTANT_0_4564(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_4579(0) when ((ACT = CONSTANT_1_4579(0))) else
		CONSTANT_0_4564(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_4652(0) when ((ACT = CONSTANT_1_4579(0))) else
		CONSTANT_0_4564(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_4579(0) when ((ACT = CONSTANT_1_4579(0))) else
		CONSTANT_0_4564(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_4667) when ((ACT = CONSTANT_1_4579(0))) else
		std_logic_vector(CONSTANT_0_4632);

end architecture RTL;


