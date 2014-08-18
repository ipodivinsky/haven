--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_fe_fe_controller_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_fe_fe_controller_semantics_t is
	port (
		ACT : in std_logic;
		ex2_mem_rw_Q0 : in std_logic_vector(3 downto 0);
		fe_stall_D0 : out std_logic;
		fe_stall_Q0 : in std_logic;
		i_mem_fr_stall_Q0 : in std_logic;
		i_mem_rq_stall_D0 : out std_logic;
		i_mem_rq_stall_Q0 : in std_logic;
		ibus_A0 : out std_logic_vector(31 downto 0);
		ibus_REQCMD0 : out std_logic_vector(2 downto 0);
		ibus_REQRESP0 : in std_logic_vector(2 downto 0);
		ibus_SC0 : out std_logic_vector(2 downto 0);
		ibus_SI0 : out std_logic_vector(1 downto 0);
		id_clear_reg_D0 : out std_logic;
		id_clear_reg_Q0 : in std_logic;
		id_clear_reg_WE0 : out std_logic;
		id_pc_D0 : out std_logic_vector(31 downto 0);
		id_pc_Q0 : in std_logic_vector(31 downto 0);
		id_pc_WE0 : out std_logic;
		id_stall_Q0 : in std_logic;
		id_stall_reg_D0 : out std_logic;
		id_stall_reg_Q0 : in std_logic;
		id_stall_reg_WE0 : out std_logic;
		pc_D0 : out std_logic_vector(31 downto 0);
		pc_Q0 : in std_logic_vector(31 downto 0);
		pc_WE0 : out std_logic;
		port_error_D0 : out std_logic_vector(31 downto 0);
		wb_pc_W_Q0 : in std_logic_vector(31 downto 0);
		wb_pc_we_Q0 : in std_logic	);
end entity codix_risc_ca_core_main_fe_fe_controller_semantics_t;

architecture RTL of codix_risc_ca_core_main_fe_fe_controller_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(0 downto 0);
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
	signal lv_bb_1_fe_request_rc : signed(31 downto 0);
	-- signal (inner)
	signal lv_bb_2_i_addr : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_4_raw_ex2 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_5_raw_ex : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_2_i_addr_STATEMENT_AST_3673 : unsigned(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_6_STATEMENT_AST_3690 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_8_STATEMENT_AST_3701 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_fe_request_rc_STATEMENT_AST_3715 : signed(31 downto 0);
	-- signal (inner)
	signal lv_bb_1_fe_request_rc_STATEMENT_AST_3728 : signed(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_7_STATEMENT_AST_3770 : unsigned(0 downto 0);
	-- signal (inner)
	signal i_mem_rq_stall_STATEMENT_AST_3784 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_5_STATEMENT_AST_3798 : unsigned(0 downto 0);
	-- signal (inner)
	signal port_error_STATEMENT_AST_3813 : unsigned(31 downto 0);
	-- signal (inner)
	signal fe_stall_STATEMENT_AST_3828 : unsigned(0 downto 0);
	-- signal (inner)
	signal id_pc_STATEMENT_AST_3841 : unsigned(31 downto 0);
	-- signal (inner)
	signal pc_STATEMENT_AST_3861 : unsigned(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_4_STATEMENT_AST_3888 : unsigned(0 downto 0);
	-- signal (inner)
	signal id_stall_reg_STATEMENT_AST_3903 : unsigned(0 downto 0);
	-- signal (inner)
	signal id_clear_reg_STATEMENT_AST_3936 : unsigned(0 downto 0);

		-- datapath signals and constants
	signal tmp_conv_logic_to_unsigned_14584: unsigned(0 downto 0);
	signal tmp_conv_logic_to_unsigned_14585: unsigned(0 downto 0);
	constant CONSTANT_0_3719: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_3749: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_3735: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_3721: unsigned(31 downto 0) := to_unsigned(0, 32);
	constant CONSTANT_1_3791: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_11_3693: unsigned(3 downto 0) := to_unsigned(11, 4);
	constant CONSTANT_16_3819: unsigned(4 downto 0) := to_unsigned(16, 5);
	constant CONSTANT_3_3894: unsigned(1 downto 0) := to_unsigned(3, 2);
	constant CONSTANT_4_3869: unsigned(2 downto 0) := to_unsigned(4, 3);
	constant CONSTANT_4294967292_3874: unsigned(31 downto 0) := "11111111111111111111111111111100";

begin
	-- child instances inside 'main_fe_fe_controller_semantics' functional unit:

		-- conversions for datapath
	tmp_conv_logic_to_unsigned_14584(0) <= id_stall_reg_Q0;
	tmp_conv_logic_to_unsigned_14585(0) <= id_clear_reg_Q0;

		-- Datapath code
	-- codix_risc_ca.acdl:1418: lv_bb_2_i_addr=((id_stall.read()&&!i_mem_fr_sta ...
	lv_bb_2_i_addr_STATEMENT_AST_3673 <= 
		unsigned(id_pc_Q0) when ((((id_stall_Q0 /= '0') and not((i_mem_fr_stall_Q0 /= '0'))) or (id_stall_reg_Q0 /= '0'))) else
		unsigned(pc_Q0);
	-- codix_risc_ca.acdl:1434: codasip_tmp_var_6=(ex2_mem_rw.read()!=11)
	codasip_tmp_var_6_STATEMENT_AST_3690 <= "1" when ((unsigned(ex2_mem_rw_Q0) /= CONSTANT_11_3693)) else "0";
	-- codix_risc_ca.acdl:1426: codasip_tmp_var_8=(lv_bb_2_i_addr!=pc.read())
	codasip_tmp_var_8_STATEMENT_AST_3701 <= "1" when ((lv_bb_2_i_addr /= unsigned(pc_Q0))) else "0";
	-- codix_risc_ca.acdl:1433: lv_bb_1_fe_request_rc=0
	lv_bb_1_fe_request_rc_STATEMENT_AST_3715 <= signed(resize(CONSTANT_0_3719, 32));
	-- codix_risc_ca.acdl:1426: lv_bb_1_fe_request_rc=ibus.request(1, lv_bb_2_i ...
	lv_bb_1_fe_request_rc_STATEMENT_AST_3728 <= signed(resize(unsigned(ibus_REQRESP0), 32));
	-- codix_risc_ca.acdl:1430: codasip_tmp_var_7=(lv_bb_1_fe_request_rc==0)
	codasip_tmp_var_7_STATEMENT_AST_3770 <= "1" when ((lv_bb_1_fe_request_rc = signed(resize(CONSTANT_0_3719, 2)))) else "0";
	-- codix_risc_ca.acdl:1438: i_mem_rq_stall.write((lv_bb_1_fe_request_rc==0) ...
	i_mem_rq_stall_STATEMENT_AST_3784 <= 
		CONSTANT_1_3791 when ((lv_bb_1_fe_request_rc = signed(resize(CONSTANT_0_3719, 2)))) else
		CONSTANT_0_3719;
	-- codix_risc_ca.acdl:1447: codasip_tmp_var_5=((lv_bb_1_fe_request_rc!=1)&& ...
	codasip_tmp_var_5_STATEMENT_AST_3798 <= "1" when (((lv_bb_1_fe_request_rc /= signed(resize(CONSTANT_1_3791, 2))) and (lv_bb_1_fe_request_rc /= signed(resize(CONSTANT_0_3719, 2))))) else "0";
	-- codix_risc_ca.acdl:1441: port_error.write(16|((codasip::codasip_int<4, f ...
	port_error_STATEMENT_AST_3813 <= resize((CONSTANT_16_3819 or resize(unsigned(resize(lv_bb_1_fe_request_rc, 32)(3 downto 0)), 5)), 32);
	-- codix_risc_ca.acdl:1447: fe_stall.write(id_stall.read()||id_stall_reg.re ...
	fe_stall_STATEMENT_AST_3828 <= "1" when ((((id_stall_Q0 /= '0') or (id_stall_reg_Q0 /= '0')) or (i_mem_rq_stall_Q0 /= '0'))) else "0";
	-- codix_risc_ca.acdl:1450: id_pc.write((lv_bb_1_fe_request_rc==1) ? (unsig ...
	id_pc_STATEMENT_AST_3841 <= 
		lv_bb_2_i_addr when ((lv_bb_1_fe_request_rc = signed(resize(CONSTANT_1_3791, 2)))) else
		unsigned(id_pc_Q0);
	-- codix_risc_ca.acdl:1454: pc.write(wb_pc_we.read() ? (unsigned int )(((un ...
	pc_STATEMENT_AST_3861 <= 
		(unsigned(wb_pc_W_Q0) and CONSTANT_4294967292_3874) when ((wb_pc_we_Q0 /= '0')) else
		unsigned(pc_Q0) when ((fe_stall_Q0 /= '0')) else
		resize((unsigned(resize(unsigned(pc_Q0), 33)) + resize(CONSTANT_4_3869, 33)), 32);
	-- codix_risc_ca.acdl:1463: codasip_tmp_var_4=(wb_pc_we.read()&&((wb_pc_W.r ...
	codasip_tmp_var_4_STATEMENT_AST_3888 <= "1" when (((wb_pc_we_Q0 /= '0') and ((unsigned(wb_pc_W_Q0(1 downto 0)) and CONSTANT_3_3894) /= CONSTANT_0_3719))) else "0";
	-- codix_risc_ca.acdl:1463: id_stall_reg.write((id_stall.read()&&!i_mem_fr_ ...
	id_stall_reg_STATEMENT_AST_3903 <= 
		CONSTANT_1_3791 when (((((id_stall_Q0 /= '0') and not((i_mem_fr_stall_Q0 /= '0'))) and (i_mem_rq_stall_Q0 /= '0')) and not((id_clear_reg_Q0 /= '0')))) else
		CONSTANT_0_3719 when (((lv_bb_1_fe_request_rc = signed(resize(CONSTANT_1_3791, 2))) or (wb_pc_we_Q0 /= '0'))) else
		tmp_conv_logic_to_unsigned_14584;
	-- codix_risc_ca.acdl:1466: id_clear_reg.write(wb_pc_we.read() ? (codasip:: ...
	id_clear_reg_STATEMENT_AST_3936 <= 
		CONSTANT_1_3791 when ((wb_pc_we_Q0 /= '0')) else
		CONSTANT_0_3719 when (((lv_bb_1_fe_request_rc = signed(resize(CONSTANT_1_3791, 2))) and not((id_stall_Q0 /= '0')))) else
		tmp_conv_logic_to_unsigned_14585;
	lv_bb_2_i_addr <= lv_bb_2_i_addr_STATEMENT_AST_3673;
	codasip_tmp_var_6 <= codasip_tmp_var_6_STATEMENT_AST_3690;
	codasip_tmp_var_8 <= codasip_tmp_var_8_STATEMENT_AST_3701 when (((ACT = CONSTANT_1_3791(0)) and (codasip_tmp_var_6 /= 0))) else
		CONSTANT_0_3719;
	lv_bb_1_fe_request_rc <= lv_bb_1_fe_request_rc_STATEMENT_AST_3715 when (((ACT = CONSTANT_1_3791(0)) and not((codasip_tmp_var_6 /= 0)))) else 
		lv_bb_1_fe_request_rc_STATEMENT_AST_3728 when (((ACT = CONSTANT_1_3791(0)) and (codasip_tmp_var_6 /= 0))) else
		signed(CONSTANT_0_3721);
	ibus_REQCMD0 <= std_logic_vector(resize(CONSTANT_1_3791, 3)) when (((ACT = CONSTANT_1_3791(0)) and (codasip_tmp_var_6 /= 0))) else
		std_logic_vector(CONSTANT_0_3735);
	ibus_A0 <= std_logic_vector(lv_bb_2_i_addr) when (((ACT = CONSTANT_1_3791(0)) and (codasip_tmp_var_6 /= 0))) else
		std_logic_vector(CONSTANT_0_3721);
	ibus_SI0 <= std_logic_vector(resize(CONSTANT_0_3719, 2)) when (((ACT = CONSTANT_1_3791(0)) and (codasip_tmp_var_6 /= 0))) else
		std_logic_vector(CONSTANT_0_3749);
	ibus_SC0 <= std_logic_vector(CONSTANT_4_3869) when (((ACT = CONSTANT_1_3791(0)) and (codasip_tmp_var_6 /= 0))) else
		std_logic_vector(CONSTANT_0_3735);
	codasip_tmp_var_7 <= codasip_tmp_var_7_STATEMENT_AST_3770 when (((ACT = CONSTANT_1_3791(0)) and (codasip_tmp_var_6 /= 0))) else
		CONSTANT_0_3719;
	i_mem_rq_stall_D0 <= i_mem_rq_stall_STATEMENT_AST_3784(0);
	codasip_tmp_var_5 <= codasip_tmp_var_5_STATEMENT_AST_3798;
	port_error_D0 <= std_logic_vector(port_error_STATEMENT_AST_3813) when (((ACT = CONSTANT_1_3791(0)) and (codasip_tmp_var_5 /= 0))) else
		std_logic_vector(CONSTANT_0_3721);
	fe_stall_D0 <= fe_stall_STATEMENT_AST_3828(0);
	id_pc_WE0 <= CONSTANT_1_3791(0) when ((ACT = CONSTANT_1_3791(0))) else
		CONSTANT_0_3719(0);
	id_pc_D0 <= std_logic_vector(id_pc_STATEMENT_AST_3841);
	pc_WE0 <= CONSTANT_1_3791(0) when ((ACT = CONSTANT_1_3791(0))) else
		CONSTANT_0_3719(0);
	pc_D0 <= std_logic_vector(pc_STATEMENT_AST_3861);
	codasip_tmp_var_4 <= codasip_tmp_var_4_STATEMENT_AST_3888;
	id_stall_reg_WE0 <= CONSTANT_1_3791(0) when ((ACT = CONSTANT_1_3791(0))) else
		CONSTANT_0_3719(0);
	id_stall_reg_D0 <= id_stall_reg_STATEMENT_AST_3903(0);
	id_clear_reg_WE0 <= CONSTANT_1_3791(0) when ((ACT = CONSTANT_1_3791(0))) else
		CONSTANT_0_3719(0);
	id_clear_reg_D0 <= id_clear_reg_STATEMENT_AST_3936(0);

end architecture RTL;


