--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
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
		wb_stall_Q0 : in std_logic
	);
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
	signal codasip_tmp_var_11_STATEMENT_AST_8646 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_9_STATEMENT_AST_8657 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_10_STATEMENT_AST_8668 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_7_STATEMENT_AST_8683 : unsigned(0 downto 0);
	-- signal (inner)
	signal pipe_RD_stall_STATEMENT_AST_8694 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_8_STATEMENT_AST_8706 : unsigned(0 downto 0);
	-- signal (inner)
	signal pipe_RD_clear_STATEMENT_AST_8721 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_5_STATEMENT_AST_8736 : unsigned(0 downto 0);
	-- signal (inner)
	signal pipe_EX_stall_STATEMENT_AST_8747 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_6_STATEMENT_AST_8759 : unsigned(0 downto 0);
	-- signal (inner)
	signal pipe_EX_clear_STATEMENT_AST_8774 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_3_STATEMENT_AST_8789 : unsigned(0 downto 0);
	-- signal (inner)
	signal pipe_EX2_stall_STATEMENT_AST_8800 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_4_STATEMENT_AST_8812 : unsigned(0 downto 0);
	-- signal (inner)
	signal pipe_EX2_clear_STATEMENT_AST_8827 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_8842 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2_STATEMENT_AST_8853 : unsigned(0 downto 0);
	-- signal (inner)
	signal pipe_WB_stall_STATEMENT_AST_8868 : unsigned(0 downto 0);
	-- signal (inner)
	signal pipe_WB_clear_STATEMENT_AST_8880 : unsigned(0 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_8649: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_1_8697: unsigned(0 downto 0) := to_unsigned(1, 1);

begin
	-- child instances inside 'main_flow_logic_control_flow_logic_control_fu_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1539: codasip_tmp_var_11=(fe_stall.read())!=0
	codasip_tmp_var_11_STATEMENT_AST_8646 <= "1" when ((fe_stall_Q0 /= CONSTANT_0_8649(0))) else "0";
	-- codix_risc_ca.acdl:1547: codasip_tmp_var_9=(id_stall.read())!=0
	codasip_tmp_var_9_STATEMENT_AST_8657 <= "1" when ((id_stall_Q0 /= CONSTANT_0_8649(0))) else "0";
	-- codix_risc_ca.acdl:1547: codasip_tmp_var_10=(id_clear.read())!=0
	codasip_tmp_var_10_STATEMENT_AST_8668 <= "1" when ((id_clear_Q0 /= CONSTANT_0_8649(0))) else "0";
	-- codix_risc_ca.acdl:1557: codasip_tmp_var_7=(rd_stall.read())!=0
	codasip_tmp_var_7_STATEMENT_AST_8683 <= "1" when ((rd_stall_Q0 /= CONSTANT_0_8649(0))) else "0";
	-- codix_risc_ca.acdl:1548: pipe_RD_stall()
	pipe_RD_stall_STATEMENT_AST_8694 <= CONSTANT_1_8697;
	-- codix_risc_ca.acdl:1557: codasip_tmp_var_8=(rd_clear.read())!=0
	codasip_tmp_var_8_STATEMENT_AST_8706 <= "1" when ((rd_clear_Q0 /= CONSTANT_0_8649(0))) else "0";
	-- codix_risc_ca.acdl:1552: pipe_RD_clear()
	pipe_RD_clear_STATEMENT_AST_8721 <= CONSTANT_1_8697;
	-- codix_risc_ca.acdl:1567: codasip_tmp_var_5=(ex_stall.read())!=0
	codasip_tmp_var_5_STATEMENT_AST_8736 <= "1" when ((ex_stall_Q0 /= CONSTANT_0_8649(0))) else "0";
	-- codix_risc_ca.acdl:1558: pipe_EX_stall()
	pipe_EX_stall_STATEMENT_AST_8747 <= CONSTANT_1_8697;
	-- codix_risc_ca.acdl:1567: codasip_tmp_var_6=(ex_clear.read())!=0
	codasip_tmp_var_6_STATEMENT_AST_8759 <= "1" when ((ex_clear_Q0 /= CONSTANT_0_8649(0))) else "0";
	-- codix_risc_ca.acdl:1562: pipe_EX_clear()
	pipe_EX_clear_STATEMENT_AST_8774 <= CONSTANT_1_8697;
	-- codix_risc_ca.acdl:1577: codasip_tmp_var_3=(ex2_stall.read())!=0
	codasip_tmp_var_3_STATEMENT_AST_8789 <= "1" when ((ex2_stall_Q0 /= CONSTANT_0_8649(0))) else "0";
	-- codix_risc_ca.acdl:1568: pipe_EX2_stall()
	pipe_EX2_stall_STATEMENT_AST_8800 <= CONSTANT_1_8697;
	-- codix_risc_ca.acdl:1577: codasip_tmp_var_4=(ex2_clear.read())!=0
	codasip_tmp_var_4_STATEMENT_AST_8812 <= "1" when ((ex2_clear_Q0 /= CONSTANT_0_8649(0))) else "0";
	-- codix_risc_ca.acdl:1572: pipe_EX2_clear()
	pipe_EX2_clear_STATEMENT_AST_8827 <= CONSTANT_1_8697;
	-- codix_risc_ca.acdl:1585: codasip_tmp_var_1=(wb_stall.read())!=0
	codasip_tmp_var_1_STATEMENT_AST_8842 <= "1" when ((wb_stall_Q0 /= CONSTANT_0_8649(0))) else "0";
	-- codix_risc_ca.acdl:1585: codasip_tmp_var_2=(wb_clear.read())!=0
	codasip_tmp_var_2_STATEMENT_AST_8853 <= "1" when ((wb_clear_Q0 /= CONSTANT_0_8649(0))) else "0";
	-- codix_risc_ca.acdl:1578: pipe_WB_stall()
	pipe_WB_stall_STATEMENT_AST_8868 <= CONSTANT_1_8697;
	-- codix_risc_ca.acdl:1582: pipe_WB_clear()
	pipe_WB_clear_STATEMENT_AST_8880 <= CONSTANT_1_8697;
	codasip_tmp_var_11 <= codasip_tmp_var_11_STATEMENT_AST_8646;
	codasip_tmp_var_9 <= codasip_tmp_var_9_STATEMENT_AST_8657;
	codasip_tmp_var_10 <= codasip_tmp_var_10_STATEMENT_AST_8668 when (((ACT = CONSTANT_1_8697(0)) and not((codasip_tmp_var_9 /= 0)))) else
		CONSTANT_0_8649;
	codasip_tmp_var_7 <= codasip_tmp_var_7_STATEMENT_AST_8683;
	pipe_RD_stall_D0 <= pipe_RD_stall_STATEMENT_AST_8694(0) when (((ACT = CONSTANT_1_8697(0)) and (codasip_tmp_var_7 /= 0))) else
		CONSTANT_0_8649(0);
	codasip_tmp_var_8 <= codasip_tmp_var_8_STATEMENT_AST_8706 when (((ACT = CONSTANT_1_8697(0)) and not((codasip_tmp_var_7 /= 0)))) else
		CONSTANT_0_8649;
	pipe_RD_clear_D0 <= pipe_RD_clear_STATEMENT_AST_8721(0) when (((ACT = CONSTANT_1_8697(0)) and ((codasip_tmp_var_8 /= 0) and not((codasip_tmp_var_7 /= 0))))) else
		CONSTANT_0_8649(0);
	codasip_tmp_var_5 <= codasip_tmp_var_5_STATEMENT_AST_8736;
	pipe_EX_stall_D0 <= pipe_EX_stall_STATEMENT_AST_8747(0) when (((ACT = CONSTANT_1_8697(0)) and (codasip_tmp_var_5 /= 0))) else
		CONSTANT_0_8649(0);
	codasip_tmp_var_6 <= codasip_tmp_var_6_STATEMENT_AST_8759 when (((ACT = CONSTANT_1_8697(0)) and not((codasip_tmp_var_5 /= 0)))) else
		CONSTANT_0_8649;
	pipe_EX_clear_D0 <= pipe_EX_clear_STATEMENT_AST_8774(0) when (((ACT = CONSTANT_1_8697(0)) and ((codasip_tmp_var_6 /= 0) and not((codasip_tmp_var_5 /= 0))))) else
		CONSTANT_0_8649(0);
	codasip_tmp_var_3 <= codasip_tmp_var_3_STATEMENT_AST_8789;
	pipe_EX2_stall_D0 <= pipe_EX2_stall_STATEMENT_AST_8800(0) when (((ACT = CONSTANT_1_8697(0)) and (codasip_tmp_var_3 /= 0))) else
		CONSTANT_0_8649(0);
	codasip_tmp_var_4 <= codasip_tmp_var_4_STATEMENT_AST_8812 when (((ACT = CONSTANT_1_8697(0)) and not((codasip_tmp_var_3 /= 0)))) else
		CONSTANT_0_8649;
	pipe_EX2_clear_D0 <= pipe_EX2_clear_STATEMENT_AST_8827(0) when (((ACT = CONSTANT_1_8697(0)) and ((codasip_tmp_var_4 /= 0) and not((codasip_tmp_var_3 /= 0))))) else
		CONSTANT_0_8649(0);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_8842;
	codasip_tmp_var_2 <= codasip_tmp_var_2_STATEMENT_AST_8853 when (((ACT = CONSTANT_1_8697(0)) and not((codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_8649;
	pipe_WB_stall_D0 <= pipe_WB_stall_STATEMENT_AST_8868(0) when (((ACT = CONSTANT_1_8697(0)) and (codasip_tmp_var_1 /= 0))) else
		CONSTANT_0_8649(0);
	pipe_WB_clear_D0 <= pipe_WB_clear_STATEMENT_AST_8880(0) when (((ACT = CONSTANT_1_8697(0)) and ((codasip_tmp_var_2 /= 0) and not((codasip_tmp_var_1 /= 0))))) else
		CONSTANT_0_8649(0);

end architecture RTL;


