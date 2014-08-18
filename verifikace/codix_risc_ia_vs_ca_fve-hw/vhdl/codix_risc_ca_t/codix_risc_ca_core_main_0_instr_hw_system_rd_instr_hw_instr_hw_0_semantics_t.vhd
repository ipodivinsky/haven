--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_0_instr_hw_operation_opr_system_rd_0_Q0 : in std_logic_vector(8 downto 0);
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
end entity codix_risc_ca_core_main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_4407 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_4427 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_4442 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_4457 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_4472 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_4487 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_4502 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_4517 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_4532 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_4429: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_4452: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_4497: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_4437: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_4467: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_4422: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_4418: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_28_4413: unsigned(4 downto 0) := to_unsigned(28, 5);
	constant CONSTANT_29_4414: unsigned(4 downto 0) := to_unsigned(29, 5);
	constant CONSTANT_344_4411: unsigned(8 downto 0) := to_unsigned(344, 9);

begin
	-- child instances inside 'main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1350: rd_alu_op.write((codasip_instance_main_0_instr_ ...
	rd_alu_op_STATEMENT_AST_4407 <= 
		resize(CONSTANT_29_4414, 6) when ((unsigned(codasip_instance_main_0_instr_hw_operation_opr_system_rd_0_Q0) = CONSTANT_344_4411)) else
		resize(CONSTANT_28_4413, 6);
	-- codix_risc_ca.acdl:1351: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_4427 <= resize(CONSTANT_0_4429, 4);
	-- codix_risc_ca.acdl:1352: rd_dest_en_mux.write(0)
	rd_dest_en_mux_STATEMENT_AST_4442 <= resize(CONSTANT_0_4429, 2);
	-- codix_risc_ca.acdl:1353: rd_cond.write(0)
	rd_cond_STATEMENT_AST_4457 <= resize(CONSTANT_0_4429, 5);
	-- codix_risc_ca.acdl:1354: rd_ie_flag.write(0)
	rd_ie_flag_STATEMENT_AST_4472 <= resize(CONSTANT_0_4429, 2);
	-- codix_risc_ca.acdl:1357: rd_amB.write(0)
	rd_amB_STATEMENT_AST_4487 <= resize(CONSTANT_0_4429, 3);
	-- codix_risc_ca.acdl:1358: rd_amC.write(0)
	rd_amC_STATEMENT_AST_4502 <= CONSTANT_0_4429;
	-- codix_risc_ca.acdl:1360: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_4517 <= CONSTANT_0_4429;
	-- codix_risc_ca.acdl:1361: rd_aluB_mux.write(0)
	rd_aluB_mux_STATEMENT_AST_4532 <= resize(CONSTANT_0_4429, 3);
	rd_alu_op_WE0 <= CONSTANT_1_4418(0) when ((ACT = CONSTANT_1_4418(0))) else
		CONSTANT_0_4429(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_4407) when ((ACT = CONSTANT_1_4418(0))) else
		std_logic_vector(CONSTANT_0_4422);
	rd_mem_rw_WE0 <= CONSTANT_1_4418(0) when ((ACT = CONSTANT_1_4418(0))) else
		CONSTANT_0_4429(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_4427) when ((ACT = CONSTANT_1_4418(0))) else
		std_logic_vector(CONSTANT_0_4437);
	rd_dest_en_mux_WE0 <= CONSTANT_1_4418(0) when ((ACT = CONSTANT_1_4418(0))) else
		CONSTANT_0_4429(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_4442) when ((ACT = CONSTANT_1_4418(0))) else
		std_logic_vector(CONSTANT_0_4452);
	rd_cond_WE0 <= CONSTANT_1_4418(0) when ((ACT = CONSTANT_1_4418(0))) else
		CONSTANT_0_4429(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_4457) when ((ACT = CONSTANT_1_4418(0))) else
		std_logic_vector(CONSTANT_0_4467);
	rd_ie_flag_WE0 <= CONSTANT_1_4418(0) when ((ACT = CONSTANT_1_4418(0))) else
		CONSTANT_0_4429(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_4472) when ((ACT = CONSTANT_1_4418(0))) else
		std_logic_vector(CONSTANT_0_4452);
	rd_amB_WE0 <= CONSTANT_1_4418(0) when ((ACT = CONSTANT_1_4418(0))) else
		CONSTANT_0_4429(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_4487) when ((ACT = CONSTANT_1_4418(0))) else
		std_logic_vector(CONSTANT_0_4497);
	rd_amC_WE0 <= CONSTANT_1_4418(0) when ((ACT = CONSTANT_1_4418(0))) else
		CONSTANT_0_4429(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_4502(0) when ((ACT = CONSTANT_1_4418(0))) else
		CONSTANT_0_4429(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_4418(0) when ((ACT = CONSTANT_1_4418(0))) else
		CONSTANT_0_4429(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_4517(0) when ((ACT = CONSTANT_1_4418(0))) else
		CONSTANT_0_4429(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_4418(0) when ((ACT = CONSTANT_1_4418(0))) else
		CONSTANT_0_4429(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_4532) when ((ACT = CONSTANT_1_4418(0))) else
		std_logic_vector(CONSTANT_0_4497);

end architecture RTL;


