--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_0_instr_hw_operation_opr_system_0_Q0 : in std_logic_vector(8 downto 0);
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
end entity codix_risc_ca_core_main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_4257 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_4277 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_4292 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_4307 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_4322 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_4347 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_4362 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_4377 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_4392 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_4263: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_4302: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_4357: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_4287: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_4317: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_4272: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_4334: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_2_4333: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_31_4264: unsigned(4 downto 0) := to_unsigned(31, 5);
	constant CONSTANT_336_4261: unsigned(8 downto 0) := to_unsigned(336, 9);
	constant CONSTANT_341_4326: unsigned(8 downto 0) := to_unsigned(341, 9);
	constant CONSTANT_342_4330: unsigned(8 downto 0) := to_unsigned(342, 9);

begin
	-- child instances inside 'main_0_instr_hw_system_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1320: rd_alu_op.write((codasip_instance_main_0_instr_ ...
	rd_alu_op_STATEMENT_AST_4257 <= 
		resize(CONSTANT_31_4264, 6) when ((unsigned(codasip_instance_main_0_instr_hw_operation_opr_system_0_Q0) = CONSTANT_336_4261)) else
		resize(CONSTANT_0_4263, 6);
	-- codix_risc_ca.acdl:1325: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_4277 <= resize(CONSTANT_0_4263, 4);
	-- codix_risc_ca.acdl:1326: rd_dest_en_mux.write(0)
	rd_dest_en_mux_STATEMENT_AST_4292 <= resize(CONSTANT_0_4263, 2);
	-- codix_risc_ca.acdl:1327: rd_cond.write(0)
	rd_cond_STATEMENT_AST_4307 <= resize(CONSTANT_0_4263, 5);
	-- codix_risc_ca.acdl:1329: rd_ie_flag.write((codasip_instance_main_0_instr ...
	rd_ie_flag_STATEMENT_AST_4322 <= 
		resize(CONSTANT_1_4334, 2) when ((unsigned(codasip_instance_main_0_instr_hw_operation_opr_system_0_Q0) = CONSTANT_341_4326)) else
		CONSTANT_2_4333 when ((unsigned(codasip_instance_main_0_instr_hw_operation_opr_system_0_Q0) = CONSTANT_342_4330)) else
		resize(CONSTANT_0_4263, 2);
	-- codix_risc_ca.acdl:1332: rd_amB.write(0)
	rd_amB_STATEMENT_AST_4347 <= resize(CONSTANT_0_4263, 3);
	-- codix_risc_ca.acdl:1333: rd_amC.write(0)
	rd_amC_STATEMENT_AST_4362 <= CONSTANT_0_4263;
	-- codix_risc_ca.acdl:1335: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_4377 <= CONSTANT_0_4263;
	-- codix_risc_ca.acdl:1336: rd_aluB_mux.write(0)
	rd_aluB_mux_STATEMENT_AST_4392 <= resize(CONSTANT_0_4263, 3);
	rd_alu_op_WE0 <= CONSTANT_1_4334(0) when ((ACT = CONSTANT_1_4334(0))) else
		CONSTANT_0_4263(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_4257) when ((ACT = CONSTANT_1_4334(0))) else
		std_logic_vector(CONSTANT_0_4272);
	rd_mem_rw_WE0 <= CONSTANT_1_4334(0) when ((ACT = CONSTANT_1_4334(0))) else
		CONSTANT_0_4263(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_4277) when ((ACT = CONSTANT_1_4334(0))) else
		std_logic_vector(CONSTANT_0_4287);
	rd_dest_en_mux_WE0 <= CONSTANT_1_4334(0) when ((ACT = CONSTANT_1_4334(0))) else
		CONSTANT_0_4263(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_4292) when ((ACT = CONSTANT_1_4334(0))) else
		std_logic_vector(CONSTANT_0_4302);
	rd_cond_WE0 <= CONSTANT_1_4334(0) when ((ACT = CONSTANT_1_4334(0))) else
		CONSTANT_0_4263(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_4307) when ((ACT = CONSTANT_1_4334(0))) else
		std_logic_vector(CONSTANT_0_4317);
	rd_ie_flag_WE0 <= CONSTANT_1_4334(0) when ((ACT = CONSTANT_1_4334(0))) else
		CONSTANT_0_4263(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_4322) when ((ACT = CONSTANT_1_4334(0))) else
		std_logic_vector(CONSTANT_0_4302);
	rd_amB_WE0 <= CONSTANT_1_4334(0) when ((ACT = CONSTANT_1_4334(0))) else
		CONSTANT_0_4263(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_4347) when ((ACT = CONSTANT_1_4334(0))) else
		std_logic_vector(CONSTANT_0_4357);
	rd_amC_WE0 <= CONSTANT_1_4334(0) when ((ACT = CONSTANT_1_4334(0))) else
		CONSTANT_0_4263(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_4362(0) when ((ACT = CONSTANT_1_4334(0))) else
		CONSTANT_0_4263(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_4334(0) when ((ACT = CONSTANT_1_4334(0))) else
		CONSTANT_0_4263(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_4377(0) when ((ACT = CONSTANT_1_4334(0))) else
		CONSTANT_0_4263(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_4334(0) when ((ACT = CONSTANT_1_4334(0))) else
		CONSTANT_0_4263(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_4392) when ((ACT = CONSTANT_1_4334(0))) else
		std_logic_vector(CONSTANT_0_4357);

end architecture RTL;


