--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_0_op_lshri_operation_instr_hw_0_return_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_0_op_lshri_operation_instr_hw_0_return_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 : out std_logic_vector(3 downto 0)
	);
end entity codix_risc_ca_core_main_0_op_lshri_operation_instr_hw_0_return_t;

architecture RTL of codix_risc_ca_core_main_0_op_lshri_operation_instr_hw_0_return_t is
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_STATEMENT_AST_5042 : unsigned(3 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_5046: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_1_5048: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_10_5044: unsigned(3 downto 0) := to_unsigned(10, 4);

begin
	-- child instances inside 'main_0_op_lshri_operation_instr_hw_0_return' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:320: codasip_instance_main_0_instr_hw_operation_opr_a ...
	codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_STATEMENT_AST_5042 <= CONSTANT_10_5044;
	codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_D0 <= std_logic_vector(codasip_instance_main_0_instr_hw_operation_opr_alu_imm_all_0_STATEMENT_AST_5042) when ((ACT = CONSTANT_1_5048(0))) else
		std_logic_vector(CONSTANT_0_5046);

end architecture RTL;

