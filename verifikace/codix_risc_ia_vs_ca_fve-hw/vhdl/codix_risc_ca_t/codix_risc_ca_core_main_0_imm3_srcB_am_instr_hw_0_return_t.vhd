--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_0_imm3_srcB_am_instr_hw_0_return_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_0_imm3_srcB_am_instr_hw_0_return_t is
	port (
		ACT : in std_logic;
		codasip_attribute_L_main_0_instr_hw_srcB_am_imm3_val_0_Q0 : in std_logic_vector(2 downto 0);
		codasip_instance_main_0_instr_hw_srcB_am_imm3_0_D0 : out std_logic_vector(2 downto 0)
	);
end entity codix_risc_ca_core_main_0_imm3_srcB_am_instr_hw_0_return_t;

architecture RTL of codix_risc_ca_core_main_0_imm3_srcB_am_instr_hw_0_return_t is
	-- signal (inner)
	signal codasip_instance_main_0_instr_hw_srcB_am_imm3_0_STATEMENT_AST_1298 : unsigned(2 downto 0);

begin
	-- child instances inside 'main_0_imm3_srcB_am_instr_hw_0_return' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:277: codasip_instance_main_0_instr_hw_srcB_am_imm3_0= ...
	codasip_instance_main_0_instr_hw_srcB_am_imm3_0_STATEMENT_AST_1298 <= unsigned(codasip_attribute_L_main_0_instr_hw_srcB_am_imm3_val_0_Q0);
	codasip_instance_main_0_instr_hw_srcB_am_imm3_0_D0 <= std_logic_vector(codasip_instance_main_0_instr_hw_srcB_am_imm3_0_STATEMENT_AST_1298);

end architecture RTL;

