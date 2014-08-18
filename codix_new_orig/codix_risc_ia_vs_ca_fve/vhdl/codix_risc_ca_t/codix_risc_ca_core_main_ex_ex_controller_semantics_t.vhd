--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_ex_ex_controller_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_ex_ex_controller_semantics_t is
	port (
		ACT : in std_logic;
		ex2_mul_D0 : out std_logic_vector(31 downto 0);
		ex2_mul_WE0 : out std_logic;
		ex_aluA_Q0 : in std_logic_vector(31 downto 0);
		ex_aluB_Q0 : in std_logic_vector(31 downto 0);
		ex_alu_op_Q0 : in std_logic_vector(5 downto 0);
		ex_ie_flag_Q0 : in std_logic_vector(1 downto 0);
		int_enabled_D0 : out std_logic;
		int_enabled_Q0 : in std_logic;
		int_enabled_WE0 : out std_logic	);
end entity codix_risc_ca_core_main_ex_ex_controller_semantics_t;

architecture RTL of codix_risc_ca_core_main_ex_ex_controller_semantics_t is
	-- signal (inner)
	signal int_enabled_STATEMENT_AST_3484 : unsigned(0 downto 0);
	-- signal (inner)
	signal ex2_mul_STATEMENT_AST_3516 : unsigned(31 downto 0);

		-- datapath signals and constants
	signal tmp_conv_logic_to_unsigned_14582: unsigned(0 downto 0);
	constant CONSTANT_0_3502: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_1_3503: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_2_3492: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_29_3496: unsigned(4 downto 0) := to_unsigned(29, 5);

begin
	-- child instances inside 'main_ex_ex_controller_semantics' functional unit:

		-- conversions for datapath
	tmp_conv_logic_to_unsigned_14582(0) <= int_enabled_Q0;

		-- Datapath code
	-- codix_risc_ca.acdl:1813: int_enabled.write((ex_ie_flag.read()==1) ? (cod ...
	int_enabled_STATEMENT_AST_3484 <= 
		CONSTANT_1_3503 when ((unsigned(ex_ie_flag_Q0) = CONSTANT_1_3503)) else
		CONSTANT_0_3502 when ((unsigned(ex_ie_flag_Q0) = CONSTANT_2_3492)) else
		(unsigned(ex_aluB_Q0(0 downto 0)) and CONSTANT_1_3503) when ((unsigned(ex_alu_op_Q0) = CONSTANT_29_3496)) else
		tmp_conv_logic_to_unsigned_14582;
	-- codix_risc_ca.acdl:1816: ex2_mul.write(((unsigned int  )(ex_aluA.read()* ...
	ex2_mul_STATEMENT_AST_3516 <= resize((unsigned(ex_aluA_Q0) * unsigned(ex_aluB_Q0)), 32);
	int_enabled_WE0 <= CONSTANT_1_3503(0) when ((ACT = CONSTANT_1_3503(0))) else
		CONSTANT_0_3502(0);
	int_enabled_D0 <= int_enabled_STATEMENT_AST_3484(0);
	ex2_mul_WE0 <= CONSTANT_1_3503(0) when ((ACT = CONSTANT_1_3503(0))) else
		CONSTANT_0_3502(0);
	ex2_mul_D0 <= std_logic_vector(ex2_mul_STATEMENT_AST_3516);

end architecture RTL;


