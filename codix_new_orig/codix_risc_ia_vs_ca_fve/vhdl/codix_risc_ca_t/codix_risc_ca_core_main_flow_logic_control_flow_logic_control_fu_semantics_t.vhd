--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_flow_logic_control_flow_logic_control_fu_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_flow_logic_control_flow_logic_control_fu_semantics_t is
	port (
		ACT : in std_logic;
		ex2_clear_Q0 : in std_logic;
		ex2_stall_Q0 : in std_logic;
		ex_clear_Q0 : in std_logic;
		ex_stall_Q0 : in std_logic;
		fe_stall_Q0 : in std_logic;
		id_clear_Q0 : in std_logic;
		id_stall_Q0 : in std_logic;
		pipe_EX2_clear_D0 : out std_logic;
		pipe_EX2_stall_D0 : out std_logic;
		pipe_EX_clear_D0 : out std_logic;
		pipe_EX_stall_D0 : out std_logic;
		pipe_RD_clear_D0 : out std_logic;
		pipe_RD_stall_D0 : out std_logic;
		pipe_WB_clear_D0 : out std_logic;
		pipe_WB_stall_D0 : out std_logic;
		rd_clear_Q0 : in std_logic;
		rd_stall_Q0 : in std_logic;
		wb_clear_Q0 : in std_logic;
		wb_stall_Q0 : in std_logic	);
end entity codix_risc_ca_core_main_flow_logic_control_flow_logic_control_fu_semantics_t;

architecture RTL of codix_risc_ca_core_main_flow_logic_control_flow_logic_control_fu_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_10 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_11 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_3 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_4 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_5 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_6 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_7 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_8 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_9 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_11_STATEMENT_AST_3962 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_9_STATEMENT_AST_3973 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_10_STATEMENT_AST_3984 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_7_STATEMENT_AST_3999 : unsigned(0 downto 0);
	-- signal (inner)
	signal pipe_RD_stall_STATEMENT_AST_4010 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_8_STATEMENT_AST_4022 : unsigned(0 downto 0);
	-- signal (inner)
	signal pipe_RD_clear_STATEMENT_AST_4037 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_5_STATEMENT_AST_4052 : unsigned(0 downto 0);
	-- signal (inner)
	signal pipe_EX_stall_STATEMENT_AST_4063 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_6_STATEMENT_AST_4075 : unsigned(0 downto 0);
	-- signal (inner)
	signal pipe_EX_clear_STATEMENT_AST_4090 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_3_STATEMENT_AST_4105 : unsigned(0 downto 0);
	-- signal (inner)
	signal pipe_EX2_stall_STATEMENT_AST_4116 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_4_STATEMENT_AST_4128 : unsigned(0 downto 0);
	-- signal (inner)
	signal pipe_EX2_clear_STATEMENT_AST_4143 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_4158 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2_STATEMENT_AST_4169 : unsigned(0 downto 0);
	-- signal (inner)
	signal pipe_WB_stall_STATEMENT_AST_4184 : unsigned(0 downto 0);
	-- signal (inner)
	signal pipe_WB_clear_STATEMENT_AST_4196 : unsigned(0 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_3965: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_1_4013: unsigned(0 downto 0) := to_unsigned(1, 1);

begin
	-- child instances inside 'main_flow_logic_control_flow_logic_control_fu_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1539: codasip_tmp_var_11=(fe_stall.read())!=0
	codasip_tmp_var_11_STATEMENT_AST_3962 <= "1" when ((fe_stall_Q0 /= CONSTANT_0_3965(0))) else "0";
	-- codix_risc_ca.acdl:1547: codasip_tmp_var_9=(id_stall.read())!=0
	codasip_tmp_var_9_STATEMENT_AST_3973 <= "1" when ((id_stall_Q0 /= CONSTANT_0_3965(0))) else "0";
	-- codix_risc_ca.acdl:1547: codasip_tmp_var_10=(id_clear.read())!=0
	codasip_tmp_var_10_STATEMENT_AST_3984 <= "1" when ((id_clear_Q0 /= CONSTANT_0_3965(0))) else "0";
	-- codix_risc_ca.acdl:1557: codasip_tmp_var_7=(rd_stall.read())!=0
	codasip_tmp_var_7_STATEMENT_AST_3999 <= "1" when ((rd_stall_Q0 /= CONSTANT_0_3965(0))) else "0";
	-- codix_risc_ca.acdl:1548: pipe_RD_stall()
	pipe_RD_stall_STATEMENT_AST_4010 <= CONSTANT_1_4013;
	-- codix_risc_ca.acdl:1557: codasip_tmp_var_8=(rd_clear.read())!=0
	codasip_tmp_var_8_STATEMENT_AST_4022 <= "1" when ((rd_clear_Q0 /= CONSTANT_0_3965(0))) else "0";
	-- codix_risc_ca.acdl:1552: pipe_RD_clear()
	pipe_RD_clear_STATEMENT_AST_4037 <= CONSTANT_1_4013;
	-- codix_risc_ca.acdl:1567: codasip_tmp_var_5=(ex_stall.read())!=0
	codasip_tmp_var_5_STATEMENT_AST_4052 <= "1" when ((ex_stall_Q0 /= CONSTANT_0_3965(0))) else "0";
	-- codix_risc_ca.acdl:1558: pipe_EX_stall()
	pipe_EX_stall_STATEMENT_AST_4063 <= CONSTANT_1_4013;
	-- codix_risc_ca.acdl:1567: codasip_tmp_var_6=(ex_clear.read())!=0
	codasip_tmp_var_6_STATEMENT_AST_4075 <= "1" when ((ex_clear_Q0 /= CONSTANT_0_3965(0))) else "0";
	-- codix_risc_ca.acdl:1562: pipe_EX_clear()
	pipe_EX_clear_STATEMENT_AST_4090 <= CONSTANT_1_4013;
	-- codix_risc_ca.acdl:1577: codasip_tmp_var_3=(ex2_stall.read())!=0
	codasip_tmp_var_3_STATEMENT_AST_4105 <= "1" when ((ex2_stall_Q0 /= CONSTANT_0_3965(0))) else "0";
	-- codix_risc_ca.acdl:1568: pipe_EX2_stall()
	pipe_EX2_stall_STATEMENT_AST_4116 <= CONSTANT_1_4013;
	-- codix_risc_ca.acdl:1577: codasip_tmp_var_4=(ex2_clear.read())!=0
	codasip_tmp_var_4_STATEMENT_AST_4128 <= "1" when ((ex2_clear_Q0 /= CONSTANT_0_3965(0))) else "0";
	-- codix_risc_ca.acdl:1572: pipe_EX2_clear()
	pipe_EX2_clear_STATEMENT_AST_4143 <= CONSTANT_1_4013;
	-- codix_risc_ca.acdl:1585: codasip_tmp_var_1=(wb_stall.read())!=0
	codasip_tmp_var_1_STATEMENT_AST_4158 <= "1" when ((wb_stall_Q0 /= CONSTANT_0_3965(0))) else "0";
	-- codix_risc_ca.acdl:1585: codasip_tmp_var_2=(wb_clear.read())!=0
	codasip_tmp_var_2_STATEMENT_AST_4169 <= "1" when ((wb_clear_Q0 /= CONSTANT_0_3965(0))) else "0";
	-- codix_risc_ca.acdl:1578: pipe_WB_stall()
	pipe_WB_stall_STATEMENT_AST_4184 <= CONSTANT_1_4013;
	-- codix_risc_ca.acdl:1582: pipe_WB_clear()
	pipe_WB_clear_STATEMENT_AST_4196 <= CONSTANT_1_4013;
	codasip_tmp_var_11 <= codasip_tmp_var_11_STATEMENT_AST_3962;
	codasip_tmp_var_9 <= codasip_tmp_var_9_STATEMENT_AST_3973;
	codasip_tmp_var_10 <= codasip_tmp_var_10_STATEMENT_AST_3984 when (((ACT = CONSTANT_1_4013(0)) and not((codasip_tmp_var_9 /= 0)))) else
		CONSTANT_0_3965;
	codasip_tmp_var_7 <= codasip_tmp_var_7_STATEMENT_AST_3999;
	pipe_RD_stall_D0 <= pipe_RD_stall_STATEMENT_AST_4010(0) when (((ACT = CONSTANT_1_4013(0)) and (codasip_tmp_var_7 /= 0))) else
		CONSTANT_0_3965(0);
	codasip_tmp_var_8 <= codasip_tmp_var_8_STATEMENT_AST_4022 when (((ACT = CONSTANT_1_4013(0)) and not((codasip_tmp_var_7 /= 0)))) else
		CONSTANT_0_3965;
	pipe_RD_clear_D0 <= pipe_RD_clear_STATEMENT_AST_4037(0) when (((ACT = CONSTANT_1_4013(0)) and ((codasip_tmp_var_8 /= 0) and not((codasip_tmp_var_7 /= 0))))) else
		CONSTANT_0_3965(0);
	codasip_tmp_var_5 <= codasip_tmp_var_5_STATEMENT_AST_4052;
	pipe_EX_stall_D0 <= pipe_EX_stall_STATEMENT_AST_4063(0) when (((ACT = CONSTANT_1_4013(0)) and (codasip_tmp_var_5 /= 0))) else
		CONSTANT_0_3965(0);
	codasip_tmp_var_6 <= codasip_tmp_var_6_STATEMENT_AST_4075 when (((ACT = CONSTANT_1_4013(0)) and not((codasip_tmp_var_5 /= 0)))) else
		CONSTANT_0_3965;
	pipe_EX_clear_D0 <= pipe_EX_clear_STATEMENT_AST_4090(0) when (((ACT = CONSTANT_1_4013(0)) and ((codasip_tmp_var_6 /= 0) and not((codasip_tmp_var_5 /= 0))))) else
		CONSTANT_0_3965(0);
	codasip_tmp_var_3 <= codasip_tmp_var_3_STATEMENT_AST_4105;
	pipe_EX2_stall_D0 <= pipe_EX2_stall_STATEMENT_AST_4116(0) when (((ACT = CONSTANT_1_4013(0)) and (codasip_tmp_var_3 /= 0))) else
		CONSTANT_0_3965(0);
	codasip_tmp_var_4 <= codasip_tmp_var_4_STATEMENT_AST_4128 when (((ACT = CONSTANT_1_4013(0)) and not((codasip_tmp_var_3 /= 0)))) else
		CONSTANT_0_3965;
	pipe_EX2_clear_D0 <= pipe_EX2_clear_STATEMENT_AST_4143(0) when (((ACT = CONSTANT_1_4013(0)) and ((codasip_tmp_var_4 /= 0) and not((codasip_tmp_var_3 /= 0))))) else
		CONSTANT_0_3965(0);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_4158;
	codasip_tmp_var_2 <= codasip_tmp_var_2_STATEMENT_AST_4169 when (((ACT = CONSTANT_1_4013(0)) and not((codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_3965;
	pipe_WB_stall_D0 <= pipe_WB_stall_STATEMENT_AST_4184(0) when (((ACT = CONSTANT_1_4013(0)) and (codasip_tmp_var_1 /= 0))) else
		CONSTANT_0_3965(0);
	pipe_WB_clear_D0 <= pipe_WB_clear_STATEMENT_AST_4196(0) when (((ACT = CONSTANT_1_4013(0)) and ((codasip_tmp_var_2 /= 0) and not((codasip_tmp_var_1 /= 0))))) else
		CONSTANT_0_3965(0);

end architecture RTL;


