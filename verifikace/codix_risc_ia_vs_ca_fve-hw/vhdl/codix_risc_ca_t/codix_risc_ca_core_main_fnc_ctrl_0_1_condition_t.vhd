--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_fnc_ctrl_0_1_condition_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_fnc_ctrl_0_1_condition_t is
	port (
		ACT : in std_logic;
		RET : out std_logic;
		ex_alu_op_Q0 : in std_logic_vector(5 downto 0)
	);
end entity codix_risc_ca_core_main_fnc_ctrl_0_1_condition_t;

architecture RTL of codix_risc_ca_core_main_fnc_ctrl_0_1_condition_t is
	-- signal (inner)
	signal codasip_return_fnc_ctrl_0 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_return_fnc_ctrl_0_STATEMENT_AST_8899 : unsigned(0 downto 0);

		-- datapath signals and constants
	constant CONSTANT_31_8902: unsigned(4 downto 0) := to_unsigned(31, 5);

begin
	-- child instances inside 'main_fnc_ctrl_0_1_condition' functional unit:

		-- Datapath code
	RET <= codasip_return_fnc_ctrl_0(0);
	-- codix_risc_ca.acdl:1836: codasip_return_fnc_ctrl_0=(ex_alu_op.read()==31)
	codasip_return_fnc_ctrl_0_STATEMENT_AST_8899 <= "1" when ((unsigned(ex_alu_op_Q0) = CONSTANT_31_8902)) else "0";
	codasip_return_fnc_ctrl_0 <= codasip_return_fnc_ctrl_0_STATEMENT_AST_8899;

end architecture RTL;


