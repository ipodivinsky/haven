--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_op_ugt_cond_instr_hw_0_return_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_op_ugt_cond_instr_hw_0_return_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_instr_hw_cond_cond_cmp_0_D0 : out std_logic_vector(3 downto 0)	);
end entity codix_risc_ca_core_main_op_ugt_cond_instr_hw_0_return_t;

architecture RTL of codix_risc_ca_core_main_op_ugt_cond_instr_hw_0_return_t is
	-- signal (inner)
	signal codasip_instance_main_instr_hw_cond_cond_cmp_0_STATEMENT_AST_8529 : unsigned(3 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_8533: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_1_8535: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_9_8531: unsigned(3 downto 0) := to_unsigned(9, 4);

begin
	-- child instances inside 'main_op_ugt_cond_instr_hw_0_return' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:490: codasip_instance_main_instr_hw_cond_cond_cmp_0=9
	codasip_instance_main_instr_hw_cond_cond_cmp_0_STATEMENT_AST_8529 <= CONSTANT_9_8531;
	codasip_instance_main_instr_hw_cond_cond_cmp_0_D0 <= std_logic_vector(codasip_instance_main_instr_hw_cond_cond_cmp_0_STATEMENT_AST_8529) when ((ACT = CONSTANT_1_8535(0))) else
		std_logic_vector(CONSTANT_0_8533);

end architecture RTL;


