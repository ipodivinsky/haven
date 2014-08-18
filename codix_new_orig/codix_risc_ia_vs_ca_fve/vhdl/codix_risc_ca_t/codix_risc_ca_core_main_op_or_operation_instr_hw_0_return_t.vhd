--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_op_or_operation_instr_hw_0_return_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_op_or_operation_instr_hw_0_return_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_instr_hw_operation_opr_alu_reg_all_0_D0 : out std_logic_vector(8 downto 0)	);
end entity codix_risc_ca_core_main_op_or_operation_instr_hw_0_return_t;

architecture RTL of codix_risc_ca_core_main_op_or_operation_instr_hw_0_return_t is
	-- signal (inner)
	signal codasip_instance_main_instr_hw_operation_opr_alu_reg_all_0_STATEMENT_AST_8295 : unsigned(8 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_8299: unsigned(8 downto 0) := to_unsigned(0, 9);
	constant CONSTANT_1_8301: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_257_8297: unsigned(8 downto 0) := to_unsigned(257, 9);

begin
	-- child instances inside 'main_op_or_operation_instr_hw_0_return' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:334: codasip_instance_main_instr_hw_operation_opr_alu ...
	codasip_instance_main_instr_hw_operation_opr_alu_reg_all_0_STATEMENT_AST_8295 <= CONSTANT_257_8297;
	codasip_instance_main_instr_hw_operation_opr_alu_reg_all_0_D0 <= std_logic_vector(codasip_instance_main_instr_hw_operation_opr_alu_reg_all_0_STATEMENT_AST_8295) when ((ACT = CONSTANT_1_8301(0))) else
		std_logic_vector(CONSTANT_0_8299);

end architecture RTL;


