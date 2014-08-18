--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_instr_hw_system_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_instr_hw_system_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_instr_hw_operation_opr_system_0_Q0 : in std_logic_vector(8 downto 0);
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
end entity codix_risc_ca_core_main_instr_hw_system_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_instr_hw_system_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_7429 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_7449 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_7464 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_7479 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_7494 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_7519 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_7534 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_7549 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_7564 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_7435: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_7474: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_7529: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_7459: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_7489: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_7444: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_7506: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_2_7505: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_31_7436: unsigned(4 downto 0) := to_unsigned(31, 5);
	constant CONSTANT_336_7433: unsigned(8 downto 0) := to_unsigned(336, 9);
	constant CONSTANT_341_7498: unsigned(8 downto 0) := to_unsigned(341, 9);
	constant CONSTANT_342_7502: unsigned(8 downto 0) := to_unsigned(342, 9);

begin
	-- child instances inside 'main_instr_hw_system_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1320: rd_alu_op.write((codasip_instance_main_instr_hw ...
	rd_alu_op_STATEMENT_AST_7429 <= 
		resize(CONSTANT_31_7436, 6) when ((unsigned(codasip_instance_main_instr_hw_operation_opr_system_0_Q0) = CONSTANT_336_7433)) else
		resize(CONSTANT_0_7435, 6);
	-- codix_risc_ca.acdl:1325: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_7449 <= resize(CONSTANT_0_7435, 4);
	-- codix_risc_ca.acdl:1326: rd_dest_en_mux.write(0)
	rd_dest_en_mux_STATEMENT_AST_7464 <= resize(CONSTANT_0_7435, 2);
	-- codix_risc_ca.acdl:1327: rd_cond.write(0)
	rd_cond_STATEMENT_AST_7479 <= resize(CONSTANT_0_7435, 5);
	-- codix_risc_ca.acdl:1329: rd_ie_flag.write((codasip_instance_main_instr_h ...
	rd_ie_flag_STATEMENT_AST_7494 <= 
		resize(CONSTANT_1_7506, 2) when ((unsigned(codasip_instance_main_instr_hw_operation_opr_system_0_Q0) = CONSTANT_341_7498)) else
		CONSTANT_2_7505 when ((unsigned(codasip_instance_main_instr_hw_operation_opr_system_0_Q0) = CONSTANT_342_7502)) else
		resize(CONSTANT_0_7435, 2);
	-- codix_risc_ca.acdl:1332: rd_amB.write(0)
	rd_amB_STATEMENT_AST_7519 <= resize(CONSTANT_0_7435, 3);
	-- codix_risc_ca.acdl:1333: rd_amC.write(0)
	rd_amC_STATEMENT_AST_7534 <= CONSTANT_0_7435;
	-- codix_risc_ca.acdl:1335: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_7549 <= CONSTANT_0_7435;
	-- codix_risc_ca.acdl:1336: rd_aluB_mux.write(0)
	rd_aluB_mux_STATEMENT_AST_7564 <= resize(CONSTANT_0_7435, 3);
	rd_alu_op_WE0 <= CONSTANT_1_7506(0) when ((ACT = CONSTANT_1_7506(0))) else
		CONSTANT_0_7435(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_7429) when ((ACT = CONSTANT_1_7506(0))) else
		std_logic_vector(CONSTANT_0_7444);
	rd_mem_rw_WE0 <= CONSTANT_1_7506(0) when ((ACT = CONSTANT_1_7506(0))) else
		CONSTANT_0_7435(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_7449) when ((ACT = CONSTANT_1_7506(0))) else
		std_logic_vector(CONSTANT_0_7459);
	rd_dest_en_mux_WE0 <= CONSTANT_1_7506(0) when ((ACT = CONSTANT_1_7506(0))) else
		CONSTANT_0_7435(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_7464) when ((ACT = CONSTANT_1_7506(0))) else
		std_logic_vector(CONSTANT_0_7474);
	rd_cond_WE0 <= CONSTANT_1_7506(0) when ((ACT = CONSTANT_1_7506(0))) else
		CONSTANT_0_7435(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_7479) when ((ACT = CONSTANT_1_7506(0))) else
		std_logic_vector(CONSTANT_0_7489);
	rd_ie_flag_WE0 <= CONSTANT_1_7506(0) when ((ACT = CONSTANT_1_7506(0))) else
		CONSTANT_0_7435(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_7494) when ((ACT = CONSTANT_1_7506(0))) else
		std_logic_vector(CONSTANT_0_7474);
	rd_amB_WE0 <= CONSTANT_1_7506(0) when ((ACT = CONSTANT_1_7506(0))) else
		CONSTANT_0_7435(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_7519) when ((ACT = CONSTANT_1_7506(0))) else
		std_logic_vector(CONSTANT_0_7529);
	rd_amC_WE0 <= CONSTANT_1_7506(0) when ((ACT = CONSTANT_1_7506(0))) else
		CONSTANT_0_7435(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_7534(0) when ((ACT = CONSTANT_1_7506(0))) else
		CONSTANT_0_7435(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_7506(0) when ((ACT = CONSTANT_1_7506(0))) else
		CONSTANT_0_7435(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_7549(0) when ((ACT = CONSTANT_1_7506(0))) else
		CONSTANT_0_7435(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_7506(0) when ((ACT = CONSTANT_1_7506(0))) else
		CONSTANT_0_7435(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_7564) when ((ACT = CONSTANT_1_7506(0))) else
		std_logic_vector(CONSTANT_0_7529);

end architecture RTL;


