--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_0_op_st_operation_instr_hw_0_return_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_0_op_st_operation_instr_hw_0_return_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_D0 : out std_logic_vector(4 downto 0)
	);
end entity codix_risc_ca_core_main_0_op_st_operation_instr_hw_0_return_t;

architecture RTL of codix_risc_ca_core_main_0_op_st_operation_instr_hw_0_return_t is
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_STATEMENT_AST_5240 : unsigned(4 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_5244: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_1_5246: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_28_5242: unsigned(4 downto 0) := to_unsigned(28, 5);

begin
	-- child instances inside 'main_0_op_st_operation_instr_hw_0_return' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:410: codasip_instance_main_0_instr_hw_operation_opr_s ...
	codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_STATEMENT_AST_5240 <= CONSTANT_28_5242;
	codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_D0 <= std_logic_vector(codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_STATEMENT_AST_5240) when ((ACT = CONSTANT_1_5246(0))) else
		std_logic_vector(CONSTANT_0_5244);

end architecture RTL;


