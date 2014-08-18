--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_ex2_ex2_controller_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_ex2_ex2_controller_semantics_t is
	port (
		ACT : in std_logic;
		d_mem_fr_stall_Q0 : in std_logic;
		d_mem_fw_stall_D0 : out std_logic;
		d_mem_rq_stall_D0 : out std_logic;
		dbus_A0 : out std_logic_vector(31 downto 0);
		dbus_D0 : out std_logic_vector(31 downto 0);
		dbus_OFCMD0 : out std_logic_vector(2 downto 0);
		dbus_OFRESP0 : in std_logic_vector(2 downto 0);
		dbus_REQCMD0 : out std_logic_vector(2 downto 0);
		dbus_REQRESP0 : in std_logic_vector(2 downto 0);
		dbus_SC0 : out std_logic_vector(2 downto 0);
		dbus_SI0 : out std_logic_vector(1 downto 0);
		ex2_alu_Q0 : in std_logic_vector(31 downto 0);
		ex2_alu_op_Q0 : in std_logic_vector(5 downto 0);
		ex2_alu_wb_D0 : out std_logic_vector(31 downto 0);
		ex2_cmp_Q0 : in std_logic;
		ex2_dest_en_Q0 : in std_logic;
		ex2_mem_rw_Q0 : in std_logic_vector(3 downto 0);
		ex2_mem_wr_ack_D0 : out std_logic;
		ex2_mem_wr_ack_Q0 : in std_logic;
		ex2_mem_wr_ack_WE0 : out std_logic;
		ex2_mul_Q0 : in std_logic_vector(31 downto 0);
		ex2_rW_Q0 : in std_logic_vector(4 downto 0);
		ex2_regB_Q0 : in std_logic_vector(31 downto 0);
		ex2_regC_Q0 : in std_logic_vector(31 downto 0);
		i_mem_rq_inv_stall_D0 : out std_logic;
		port_error_D0 : out std_logic_vector(31 downto 0);
		wb_alu_D0 : out std_logic_vector(31 downto 0);
		wb_alu_WE0 : out std_logic;
		wb_alu_op_D0 : out std_logic_vector(5 downto 0);
		wb_alu_op_WE0 : out std_logic;
		wb_dest_en_D0 : out std_logic;
		wb_dest_en_WE0 : out std_logic;
		wb_mem_rw_D0 : out std_logic_vector(3 downto 0);
		wb_mem_rw_WE0 : out std_logic;
		wb_rW_D0 : out std_logic_vector(4 downto 0);
		wb_rW_WE0 : out std_logic
	);
end entity codix_risc_ca_core_main_ex2_ex2_controller_semantics_t;

architecture RTL of codix_risc_ca_core_main_ex2_ex2_controller_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_10 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_11 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_12 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_13 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_14 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_15 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_16 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_17 : unsigned(3 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_18 : unsigned(5 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_3 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_4 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_5 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_6 : unsigned(2 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_7 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_8 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_9 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_10_wsc : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_11_rsc : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_12_cy : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_13_addB : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_14_addA : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_15_subtraction : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_request_icache_invalidate_rc : signed(31 downto 0);
	-- signal (inner)
	signal lv_bb_2_request_invalidate_rc : signed(31 downto 0);
	-- signal (inner)
	signal lv_bb_3_request_flush_rc : signed(31 downto 0);
	-- signal (inner)
	signal lv_bb_4_finish_write_rc : signed(31 downto 0);
	-- signal (inner)
	signal lv_bb_5_request_write_rc : signed(31 downto 0);
	-- signal (inner)
	signal lv_bb_6_request_read_rc : signed(31 downto 0);
	-- signal (inner)
	signal lv_bb_7_d_addr : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_8_wsi : unsigned(1 downto 0);
	-- signal (inner)
	signal lv_bb_9_rsi : unsigned(1 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_18_STATEMENT_AST_6736 : unsigned(5 downto 0);
	-- signal (inner)
	signal ex2_alu_wb_STATEMENT_AST_6745 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex2_alu_wb_STATEMENT_AST_6770 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex2_alu_wb_STATEMENT_AST_6782 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex2_alu_wb_STATEMENT_AST_6797 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_15_subtraction_STATEMENT_AST_6812 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_14_addA_STATEMENT_AST_6831 : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_13_addB_STATEMENT_AST_6849 : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_12_cy_STATEMENT_AST_6863 : unsigned(0 downto 0);
	-- signal (inner)
	signal wb_alu_STATEMENT_AST_6875 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_7_d_addr_STATEMENT_AST_6895 : unsigned(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_17_STATEMENT_AST_6904 : unsigned(3 downto 0);
	-- signal (inner)
	signal lv_bb_11_rsc_STATEMENT_AST_6913 : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_9_rsi_STATEMENT_AST_7011 : unsigned(1 downto 0);
	-- signal (inner)
	signal lv_bb_10_wsc_STATEMENT_AST_7113 : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_8_wsi_STATEMENT_AST_7219 : unsigned(1 downto 0);
	-- signal (inner)
	signal lv_bb_11_rsc_STATEMENT_AST_7329 : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_9_rsi_STATEMENT_AST_7345 : unsigned(1 downto 0);
	-- signal (inner)
	signal lv_bb_11_rsc_STATEMENT_AST_7363 : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_9_rsi_STATEMENT_AST_7379 : unsigned(1 downto 0);
	-- signal (inner)
	signal lv_bb_11_rsc_STATEMENT_AST_7397 : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_10_wsc_STATEMENT_AST_7409 : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_8_wsi_STATEMENT_AST_7421 : unsigned(1 downto 0);
	-- signal (inner)
	signal lv_bb_10_wsc_STATEMENT_AST_7435 : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_8_wsi_STATEMENT_AST_7447 : unsigned(1 downto 0);
	-- signal (inner)
	signal lv_bb_10_wsc_STATEMENT_AST_7461 : unsigned(2 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_7473 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2_STATEMENT_AST_7483 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_6_request_read_rc_STATEMENT_AST_7497 : signed(31 downto 0);
	-- signal (inner)
	signal d_mem_rq_stall_STATEMENT_AST_7545 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_16_STATEMENT_AST_7564 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_3_STATEMENT_AST_7584 : unsigned(0 downto 0);
	-- signal (inner)
	signal port_error_STATEMENT_AST_7601 : unsigned(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_11_STATEMENT_AST_7620 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_5_request_write_rc_STATEMENT_AST_7639 : signed(31 downto 0);
	-- signal (inner)
	signal lv_bb_5_request_write_rc_STATEMENT_AST_7684 : signed(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_15_STATEMENT_AST_7702 : unsigned(0 downto 0);
	-- signal (inner)
	signal d_mem_rq_stall_STATEMENT_AST_7726 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_10_STATEMENT_AST_7746 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_14_STATEMENT_AST_7765 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_7_STATEMENT_AST_7789 : unsigned(0 downto 0);
	-- signal (inner)
	signal dbus_STATEMENT_ofinish_7818 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_4_finish_write_rc_STATEMENT_AST_7808 : signed(31 downto 0);
	-- signal (inner)
	signal d_mem_fw_stall_STATEMENT_AST_7846 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_9_STATEMENT_AST_7870 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_8_STATEMENT_AST_7895 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_13_STATEMENT_AST_7921 : unsigned(0 downto 0);
	-- signal (inner)
	signal port_error_STATEMENT_AST_7943 : unsigned(31 downto 0);
	-- signal (inner)
	signal port_error_STATEMENT_AST_7965 : unsigned(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_12_STATEMENT_AST_7988 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_6_STATEMENT_AST_8004 : unsigned(2 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_5_STATEMENT_AST_8021 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_4_STATEMENT_AST_8044 : unsigned(0 downto 0);
	-- signal (inner)
	signal ex2_mem_wr_ack_STATEMENT_AST_8069 : unsigned(0 downto 0);
	-- signal (inner)
	signal i_mem_rq_inv_stall_STATEMENT_AST_8102 : unsigned(0 downto 0);
	-- signal (inner)
	signal wb_alu_op_STATEMENT_AST_8111 : unsigned(5 downto 0);
	-- signal (inner)
	signal wb_rW_STATEMENT_AST_8126 : unsigned(4 downto 0);
	-- signal (inner)
	signal wb_mem_rw_STATEMENT_AST_8141 : unsigned(3 downto 0);
	-- signal (inner)
	signal wb_dest_en_STATEMENT_AST_8156 : unsigned(0 downto 0);

		-- datapath signals and constants
	signal ex2_alu_wb_D0_6764_select_15145: std_logic_vector(5 downto 0);
	signal lv_bb_11_rsc_D0_7005_select_15146: std_logic_vector(3 downto 0);
	signal lv_bb_9_rsi_D0_7107_select_15147: std_logic_vector(3 downto 0);
	signal lv_bb_10_wsc_D0_7213_select_15148: std_logic_vector(3 downto 0);
	signal lv_bb_8_wsi_D0_7323_select_15149: std_logic_vector(3 downto 0);
	constant CONSTANT_0_6789: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_7522: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_7508: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_7515: unsigned(31 downto 0) := to_unsigned(0, 32);
	constant CONSTANT_1_6868: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_10_8059: unsigned(3 downto 0) := to_unsigned(10, 4);
	constant CONSTANT_2_7372: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_256_7981: unsigned(8 downto 0) := to_unsigned(256, 9);
	constant CONSTANT_3_7355: unsigned(1 downto 0) := to_unsigned(3, 2);
	constant CONSTANT_4_7402: unsigned(2 downto 0) := to_unsigned(4, 3);
	constant CONSTANT_4294967292_7504: unsigned(31 downto 0) := "11111111111111111111111111111100";
	constant CONSTANT_49_6823: unsigned(5 downto 0) := to_unsigned(49, 6);
	constant CONSTANT_5_7933: unsigned(2 downto 0) := to_unsigned(5, 3);
	constant CONSTANT_51_6820: unsigned(5 downto 0) := to_unsigned(51, 6);
	constant CONSTANT_512_7958: unsigned(9 downto 0) := to_unsigned(512, 10);
	constant CONSTANT_52_6839: unsigned(5 downto 0) := to_unsigned(52, 6);
	constant CONSTANT_53_6816: unsigned(5 downto 0) := to_unsigned(53, 6);
	constant CONSTANT_64_7611: unsigned(6 downto 0) := to_unsigned(64, 7);
	constant CONSTANT_9_8034: unsigned(3 downto 0) := to_unsigned(9, 4);

begin
	-- child instances inside 'main_ex2_ex2_controller_semantics' functional unit:

		-- conversions for datapath
	ex2_alu_wb_D0_6764_select_15145 <= std_logic_vector(codasip_tmp_var_18);
	lv_bb_11_rsc_D0_7005_select_15146 <= std_logic_vector(codasip_tmp_var_17);
	lv_bb_9_rsi_D0_7107_select_15147 <= std_logic_vector(codasip_tmp_var_17);
	lv_bb_10_wsc_D0_7213_select_15148 <= std_logic_vector(codasip_tmp_var_17);
	lv_bb_8_wsi_D0_7323_select_15149 <= std_logic_vector(codasip_tmp_var_17);

		-- Datapath code
	-- codix_risc_ca.acdl:2141: codasip_tmp_var_18=ex2_alu_op.read()
	codasip_tmp_var_18_STATEMENT_AST_6736 <= unsigned(ex2_alu_op_Q0);
	-- codix_risc_ca.acdl:2140: ex2_alu_wb.write(ex2_alu.read())
	ex2_alu_wb_STATEMENT_AST_6745 <= unsigned(ex2_alu_Q0);
	-- codix_risc_ca.acdl:2132: ex2_alu_wb.write(ex2_regC.read())
	ex2_alu_wb_STATEMENT_AST_6770 <= unsigned(ex2_regC_Q0);
	-- codix_risc_ca.acdl:2135: ex2_alu_wb.write(ex2_cmp.read() ? (unsigned int ...
	ex2_alu_wb_STATEMENT_AST_6782 <= 
		unsigned(ex2_regC_Q0) when ((ex2_cmp_Q0 /= '0')) else
		resize(CONSTANT_0_6789, 32);
	-- codix_risc_ca.acdl:2137: ex2_alu_wb.write(ex2_cmp.read() ? (unsigned int ...
	ex2_alu_wb_STATEMENT_AST_6797 <= 
		unsigned(ex2_regB_Q0) when ((ex2_cmp_Q0 /= '0')) else
		unsigned(ex2_regC_Q0);
	-- codix_risc_ca.acdl:2145: lv_bb_15_subtraction=(ex2_alu_op.read()==49)||( ...
	lv_bb_15_subtraction_STATEMENT_AST_6812 <= "1" when ((((unsigned(ex2_alu_op_Q0) = CONSTANT_49_6823) or (unsigned(ex2_alu_op_Q0) = CONSTANT_51_6820)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_53_6816))) else "0";
	-- codix_risc_ca.acdl:2148: lv_bb_14_addA=((ex2_alu_op.read()==52)||(ex2_al ...
	lv_bb_14_addA_STATEMENT_AST_6831 <= 
		unsigned(resize(unsigned(ex2_mul_Q0), 33)) when (((unsigned(ex2_alu_op_Q0) = CONSTANT_52_6839) or (unsigned(ex2_alu_op_Q0) = CONSTANT_53_6816))) else
		unsigned(resize(unsigned(ex2_alu_Q0), 33));
	-- codix_risc_ca.acdl:2151: lv_bb_13_addB=lv_bb_15_subtraction ? (unsigned  ...
	lv_bb_13_addB_STATEMENT_AST_6849 <= 
		resize(not(unsigned(ex2_regC_Q0)), 33) when ((lv_bb_15_subtraction /= 0)) else
		unsigned(resize(unsigned(ex2_regC_Q0), 33));
	-- codix_risc_ca.acdl:2152: lv_bb_12_cy=lv_bb_15_subtraction ? (codasip::co ...
	lv_bb_12_cy_STATEMENT_AST_6863 <= 
		CONSTANT_1_6868 when ((lv_bb_15_subtraction /= 0)) else
		CONSTANT_0_6789;
	-- codix_risc_ca.acdl:2155: wb_alu.write(((unsigned int  )(lv_bb_14_addA+lv ...
	wb_alu_STATEMENT_AST_6875 <= resize((resize((resize(lv_bb_14_addA, 34) + resize(lv_bb_13_addB, 34)), 35) + resize(lv_bb_12_cy, 35)), 32);
	-- codix_risc_ca.acdl:2159: lv_bb_7_d_addr=ex2_alu.read()
	lv_bb_7_d_addr_STATEMENT_AST_6895 <= unsigned(ex2_alu_Q0);
	-- codix_risc_ca.acdl:2203: codasip_tmp_var_17=ex2_mem_rw.read()
	codasip_tmp_var_17_STATEMENT_AST_6904 <= unsigned(ex2_mem_rw_Q0);
	-- codix_risc_ca.acdl:2164: lv_bb_11_rsc=0
	lv_bb_11_rsc_STATEMENT_AST_6913 <= resize(CONSTANT_0_6789, 3);
	-- codix_risc_ca.acdl:2164: lv_bb_9_rsi=0
	lv_bb_9_rsi_STATEMENT_AST_7011 <= resize(CONSTANT_0_6789, 2);
	-- codix_risc_ca.acdl:2165: lv_bb_10_wsc=0
	lv_bb_10_wsc_STATEMENT_AST_7113 <= resize(CONSTANT_0_6789, 3);
	-- codix_risc_ca.acdl:2165: lv_bb_8_wsi=0
	lv_bb_8_wsi_STATEMENT_AST_7219 <= resize(CONSTANT_0_6789, 2);
	-- codix_risc_ca.acdl:2169: lv_bb_11_rsc=1
	lv_bb_11_rsc_STATEMENT_AST_7329 <= resize(CONSTANT_1_6868, 3);
	-- codix_risc_ca.acdl:2169: lv_bb_9_rsi=lv_bb_7_d_addr&3
	lv_bb_9_rsi_STATEMENT_AST_7345 <= (resize(lv_bb_7_d_addr, 2) and CONSTANT_3_7355);
	-- codix_risc_ca.acdl:2174: lv_bb_11_rsc=2
	lv_bb_11_rsc_STATEMENT_AST_7363 <= resize(CONSTANT_2_7372, 3);
	-- codix_risc_ca.acdl:2174: lv_bb_9_rsi=lv_bb_7_d_addr&2
	lv_bb_9_rsi_STATEMENT_AST_7379 <= (resize(lv_bb_7_d_addr, 2) and CONSTANT_2_7372);
	-- codix_risc_ca.acdl:2178: lv_bb_11_rsc=4
	lv_bb_11_rsc_STATEMENT_AST_7397 <= CONSTANT_4_7402;
	-- codix_risc_ca.acdl:2183: lv_bb_10_wsc=1
	lv_bb_10_wsc_STATEMENT_AST_7409 <= resize(CONSTANT_1_6868, 3);
	-- codix_risc_ca.acdl:2183: lv_bb_8_wsi=lv_bb_7_d_addr&3
	lv_bb_8_wsi_STATEMENT_AST_7421 <= (resize(lv_bb_7_d_addr, 2) and CONSTANT_3_7355);
	-- codix_risc_ca.acdl:2187: lv_bb_10_wsc=2
	lv_bb_10_wsc_STATEMENT_AST_7435 <= resize(CONSTANT_2_7372, 3);
	-- codix_risc_ca.acdl:2187: lv_bb_8_wsi=lv_bb_7_d_addr&2
	lv_bb_8_wsi_STATEMENT_AST_7447 <= (resize(lv_bb_7_d_addr, 2) and CONSTANT_2_7372);
	-- codix_risc_ca.acdl:2191: lv_bb_10_wsc=4
	lv_bb_10_wsc_STATEMENT_AST_7461 <= CONSTANT_4_7402;
	-- codix_risc_ca.acdl:2341: codasip_tmp_var_1=(!d_mem_fr_stall.read())
	codasip_tmp_var_1_STATEMENT_AST_7473 <= "1" when (not((d_mem_fr_stall_Q0 /= '0'))) else "0";
	-- codix_risc_ca.acdl:2290: codasip_tmp_var_2=(lv_bb_11_rsc)!=0
	codasip_tmp_var_2_STATEMENT_AST_7483 <= "1" when ((lv_bb_11_rsc /= CONSTANT_0_6789)) else "0";
	-- codix_risc_ca.acdl:2211: lv_bb_6_request_read_rc=dbus.request(1, lv_bb_7 ...
	lv_bb_6_request_read_rc_STATEMENT_AST_7497 <= signed(resize(unsigned(dbus_REQRESP0), 32));
	-- codix_risc_ca.acdl:2215: d_mem_rq_stall.write((lv_bb_6_request_read_rc== ...
	d_mem_rq_stall_STATEMENT_AST_7545 <= 
		CONSTANT_1_6868 when ((lv_bb_6_request_read_rc = signed(resize(CONSTANT_0_6789, 2)))) else
		CONSTANT_0_6789;
	-- codix_risc_ca.acdl:2223: codasip_tmp_var_16=((lv_bb_6_request_read_rc!=1 ...
	codasip_tmp_var_16_STATEMENT_AST_7564 <= "1" when (((lv_bb_6_request_read_rc /= signed(resize(CONSTANT_1_6868, 2))) and (lv_bb_6_request_read_rc /= signed(resize(CONSTANT_0_6789, 2))))) else "0";
	-- codix_risc_ca.acdl:2290: codasip_tmp_var_3=(lv_bb_10_wsc)!=0
	codasip_tmp_var_3_STATEMENT_AST_7584 <= "1" when ((lv_bb_10_wsc /= CONSTANT_0_6789)) else "0";
	-- codix_risc_ca.acdl:2218: port_error.write(64|((codasip::codasip_int<4, f ...
	port_error_STATEMENT_AST_7601 <= resize((CONSTANT_64_7611 or resize(unsigned(resize(lv_bb_6_request_read_rc, 32)(3 downto 0)), 7)), 32);
	-- codix_risc_ca.acdl:2243: codasip_tmp_var_11=(ex2_mem_wr_ack.read()==0)
	codasip_tmp_var_11_STATEMENT_AST_7620 <= "1" when ((ex2_mem_wr_ack_Q0 = CONSTANT_0_6789(0))) else "0";
	-- codix_risc_ca.acdl:2241: lv_bb_5_request_write_rc=dbus.request(2, lv_bb_ ...
	lv_bb_5_request_write_rc_STATEMENT_AST_7639 <= signed(resize(unsigned(dbus_REQRESP0), 32));
	-- codix_risc_ca.acdl:2243: lv_bb_5_request_write_rc=1
	lv_bb_5_request_write_rc_STATEMENT_AST_7684 <= signed(resize(CONSTANT_1_6868, 32));
	-- codix_risc_ca.acdl:2228: codasip_tmp_var_15=((lv_bb_11_rsc!=1)&&(lv_bb_1 ...
	codasip_tmp_var_15_STATEMENT_AST_7702 <= "1" when ((((lv_bb_11_rsc /= CONSTANT_1_6868) and (lv_bb_11_rsc /= CONSTANT_2_7372)) and (lv_bb_11_rsc /= CONSTANT_4_7402))) else "0";
	-- codix_risc_ca.acdl:2246: d_mem_rq_stall.write((lv_bb_5_request_write_rc= ...
	d_mem_rq_stall_STATEMENT_AST_7726 <= 
		CONSTANT_1_6868 when ((lv_bb_5_request_write_rc = signed(resize(CONSTANT_0_6789, 2)))) else
		CONSTANT_0_6789;
	-- codix_risc_ca.acdl:2251: codasip_tmp_var_10=(lv_bb_5_request_write_rc==0)
	codasip_tmp_var_10_STATEMENT_AST_7746 <= "1" when ((lv_bb_5_request_write_rc = signed(resize(CONSTANT_0_6789, 2)))) else "0";
	-- codix_risc_ca.acdl:2231: codasip_tmp_var_14=(((ex2_mem_rw.read()==3)||(e ...
	codasip_tmp_var_14_STATEMENT_AST_7765 <= "1" when ((((unsigned(ex2_mem_rw_Q0) = CONSTANT_3_7355) or (unsigned(ex2_mem_rw_Q0) = CONSTANT_4_7402)) and ((resize(lv_bb_7_d_addr, 1) and CONSTANT_1_6868) /= 0))) else "0";
	-- codix_risc_ca.acdl:2267: codasip_tmp_var_7=(lv_bb_5_request_write_rc==1)
	codasip_tmp_var_7_STATEMENT_AST_7789 <= "1" when ((lv_bb_5_request_write_rc = signed(resize(CONSTANT_1_6868, 2)))) else "0";
	-- codix_risc_ca.acdl:2252: lv_bb_4_finish_write_rc=dbus.ofinish(2, ex2_reg ...
	lv_bb_4_finish_write_rc_STATEMENT_AST_7808 <= signed(resize(unsigned(dbus_OFRESP0), 32));
	dbus_STATEMENT_ofinish_7818 <= unsigned(ex2_regC_Q0);
	-- codix_risc_ca.acdl:2255: d_mem_fw_stall.write((lv_bb_4_finish_write_rc== ...
	d_mem_fw_stall_STATEMENT_AST_7846 <= 
		CONSTANT_1_6868 when ((lv_bb_4_finish_write_rc = signed(resize(CONSTANT_0_6789, 2)))) else
		CONSTANT_0_6789;
	-- codix_risc_ca.acdl:2261: codasip_tmp_var_9=((lv_bb_4_finish_write_rc!=1) ...
	codasip_tmp_var_9_STATEMENT_AST_7870 <= "1" when (((lv_bb_4_finish_write_rc /= signed(resize(CONSTANT_1_6868, 2))) and (lv_bb_4_finish_write_rc /= signed(resize(CONSTANT_0_6789, 2))))) else "0";
	-- codix_risc_ca.acdl:2267: codasip_tmp_var_8=((lv_bb_5_request_write_rc!=1 ...
	codasip_tmp_var_8_STATEMENT_AST_7895 <= "1" when (((lv_bb_5_request_write_rc /= signed(resize(CONSTANT_1_6868, 2))) and (lv_bb_5_request_write_rc /= signed(resize(CONSTANT_0_6789, 2))))) else "0";
	-- codix_risc_ca.acdl:2234: codasip_tmp_var_13=((ex2_mem_rw.read()==5)&&((l ...
	codasip_tmp_var_13_STATEMENT_AST_7921 <= "1" when (((unsigned(ex2_mem_rw_Q0) = CONSTANT_5_7933) and ((resize(lv_bb_7_d_addr, 2) and CONSTANT_3_7355) /= CONSTANT_0_6789))) else "0";
	-- codix_risc_ca.acdl:2258: port_error.write(512|((codasip::codasip_int<4,  ...
	port_error_STATEMENT_AST_7943 <= resize((CONSTANT_512_7958 or resize(unsigned(resize(lv_bb_4_finish_write_rc, 32)(3 downto 0)), 10)), 32);
	-- codix_risc_ca.acdl:2264: port_error.write(256|((codasip::codasip_int<4,  ...
	port_error_STATEMENT_AST_7965 <= resize((CONSTANT_256_7981 or resize(unsigned(resize(lv_bb_5_request_write_rc, 32)(3 downto 0)), 9)), 32);
	-- codix_risc_ca.acdl:2236: codasip_tmp_var_12=(lv_bb_6_request_read_rc==0)
	codasip_tmp_var_12_STATEMENT_AST_7988 <= "1" when ((lv_bb_6_request_read_rc = signed(resize(CONSTANT_0_6789, 2)))) else "0";
	-- codix_risc_ca.acdl:2281: codasip_tmp_var_6=lv_bb_10_wsc
	codasip_tmp_var_6_STATEMENT_AST_8004 <= lv_bb_10_wsc;
	-- codix_risc_ca.acdl:2285: codasip_tmp_var_5=((ex2_mem_rw.read()==9)&&(lv_ ...
	codasip_tmp_var_5_STATEMENT_AST_8021 <= "1" when (((unsigned(ex2_mem_rw_Q0) = CONSTANT_9_8034) and ((resize(lv_bb_7_d_addr, 1) and CONSTANT_1_6868) /= 0))) else "0";
	-- codix_risc_ca.acdl:2287: codasip_tmp_var_4=((ex2_mem_rw.read()==10)&&((l ...
	codasip_tmp_var_4_STATEMENT_AST_8044 <= "1" when (((unsigned(ex2_mem_rw_Q0) = CONSTANT_10_8059) and ((resize(lv_bb_7_d_addr, 2) and CONSTANT_3_7355) /= CONSTANT_0_6789))) else "0";
	-- codix_risc_ca.acdl:2290: ex2_mem_wr_ack.write((((lv_bb_10_wsc)!=0)&&(lv_ ...
	ex2_mem_wr_ack_STATEMENT_AST_8069 <= 
		CONSTANT_1_6868 when ((((lv_bb_10_wsc /= CONSTANT_0_6789) and (lv_bb_5_request_write_rc = signed(resize(CONSTANT_1_6868, 2)))) and (lv_bb_4_finish_write_rc = signed(resize(CONSTANT_0_6789, 2))))) else
		CONSTANT_0_6789;
	-- codix_risc_ca.acdl:2341: i_mem_rq_inv_stall.write(0)
	i_mem_rq_inv_stall_STATEMENT_AST_8102 <= CONSTANT_0_6789;
	-- codix_risc_ca.acdl:2345: wb_alu_op.write(ex2_alu_op.read())
	wb_alu_op_STATEMENT_AST_8111 <= unsigned(ex2_alu_op_Q0);
	-- codix_risc_ca.acdl:2346: wb_rW.write(ex2_rW.read())
	wb_rW_STATEMENT_AST_8126 <= unsigned(ex2_rW_Q0);
	-- codix_risc_ca.acdl:2347: wb_mem_rw.write(ex2_mem_rw.read())
	wb_mem_rw_STATEMENT_AST_8141 <= unsigned(ex2_mem_rw_Q0);
	-- codix_risc_ca.acdl:2348: wb_dest_en.write(ex2_dest_en.read())
	wb_dest_en_STATEMENT_AST_8156(0) <= ex2_dest_en_Q0;
	codasip_tmp_var_18 <= codasip_tmp_var_18_STATEMENT_AST_6736;
	with ex2_alu_wb_D0_6764_select_15145 select
		ex2_alu_wb_D0 <= 
			std_logic_vector(ex2_alu_wb_STATEMENT_AST_6770) when "010001", 
			std_logic_vector(ex2_alu_wb_STATEMENT_AST_6782) when "010010", 
			std_logic_vector(ex2_alu_wb_STATEMENT_AST_6797) when "010011", 
			std_logic_vector(ex2_alu_wb_STATEMENT_AST_6745) when others;
	lv_bb_15_subtraction <= lv_bb_15_subtraction_STATEMENT_AST_6812;
	lv_bb_14_addA <= lv_bb_14_addA_STATEMENT_AST_6831;
	lv_bb_13_addB <= lv_bb_13_addB_STATEMENT_AST_6849;
	lv_bb_12_cy <= lv_bb_12_cy_STATEMENT_AST_6863;
	wb_alu_WE0 <= CONSTANT_1_6868(0) when ((ACT = CONSTANT_1_6868(0))) else
		CONSTANT_0_6789(0);
	wb_alu_D0 <= std_logic_vector(wb_alu_STATEMENT_AST_6875);
	lv_bb_7_d_addr <= lv_bb_7_d_addr_STATEMENT_AST_6895;
	codasip_tmp_var_17 <= codasip_tmp_var_17_STATEMENT_AST_6904;
	with lv_bb_11_rsc_D0_7005_select_15146 select
		lv_bb_11_rsc <= 
			lv_bb_11_rsc_STATEMENT_AST_7329 when "0001", 
			lv_bb_11_rsc_STATEMENT_AST_7329 when "0010", 
			lv_bb_11_rsc_STATEMENT_AST_7363 when "0011", 
			lv_bb_11_rsc_STATEMENT_AST_7363 when "0100", 
			lv_bb_11_rsc_STATEMENT_AST_7397 when "0101", 
			lv_bb_11_rsc_STATEMENT_AST_6913 when others;
	with lv_bb_9_rsi_D0_7107_select_15147 select
		lv_bb_9_rsi <= 
			lv_bb_9_rsi_STATEMENT_AST_7345 when "0001", 
			lv_bb_9_rsi_STATEMENT_AST_7345 when "0010", 
			lv_bb_9_rsi_STATEMENT_AST_7379 when "0011", 
			lv_bb_9_rsi_STATEMENT_AST_7379 when "0100", 
			lv_bb_9_rsi_STATEMENT_AST_7011 when others;
	with lv_bb_10_wsc_D0_7213_select_15148 select
		lv_bb_10_wsc <= 
			lv_bb_10_wsc_STATEMENT_AST_7409 when "1000", 
			lv_bb_10_wsc_STATEMENT_AST_7435 when "1001", 
			lv_bb_10_wsc_STATEMENT_AST_7461 when "1010", 
			lv_bb_10_wsc_STATEMENT_AST_7113 when others;
	with lv_bb_8_wsi_D0_7323_select_15149 select
		lv_bb_8_wsi <= 
			lv_bb_8_wsi_STATEMENT_AST_7421 when "1000", 
			lv_bb_8_wsi_STATEMENT_AST_7447 when "1001", 
			lv_bb_8_wsi_STATEMENT_AST_7219 when others;
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_7473;
	codasip_tmp_var_2 <= codasip_tmp_var_2_STATEMENT_AST_7483 when (((ACT = CONSTANT_1_6868(0)) and (codasip_tmp_var_1 /= 0))) else
		CONSTANT_0_6789;
	dbus_REQCMD0 <= std_logic_vector(resize(CONSTANT_1_6868, 3)) when (((ACT = CONSTANT_1_6868(0)) and ((codasip_tmp_var_2 /= 0) and (codasip_tmp_var_1 /= 0)))) else 
		std_logic_vector(resize(CONSTANT_2_7372, 3)) when (((ACT = CONSTANT_1_6868(0)) and ((((codasip_tmp_var_11 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		std_logic_vector(CONSTANT_0_7508);
	dbus_A0 <= std_logic_vector((lv_bb_7_d_addr and CONSTANT_4294967292_7504)) when (((ACT = CONSTANT_1_6868(0)) and ((codasip_tmp_var_2 /= 0) and (codasip_tmp_var_1 /= 0)))) else 
		std_logic_vector((lv_bb_7_d_addr and CONSTANT_4294967292_7504)) when (((ACT = CONSTANT_1_6868(0)) and ((((codasip_tmp_var_11 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		std_logic_vector(CONSTANT_0_7515);
	dbus_SI0 <= std_logic_vector(lv_bb_9_rsi) when (((ACT = CONSTANT_1_6868(0)) and ((codasip_tmp_var_2 /= 0) and (codasip_tmp_var_1 /= 0)))) else 
		std_logic_vector(lv_bb_8_wsi) when (((ACT = CONSTANT_1_6868(0)) and ((((codasip_tmp_var_11 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		std_logic_vector(CONSTANT_0_7522);
	dbus_SC0 <= std_logic_vector(lv_bb_11_rsc) when (((ACT = CONSTANT_1_6868(0)) and ((codasip_tmp_var_2 /= 0) and (codasip_tmp_var_1 /= 0)))) else 
		std_logic_vector(lv_bb_10_wsc) when (((ACT = CONSTANT_1_6868(0)) and ((((codasip_tmp_var_11 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		std_logic_vector(CONSTANT_0_7508);
	lv_bb_6_request_read_rc <= lv_bb_6_request_read_rc_STATEMENT_AST_7497 when (((ACT = CONSTANT_1_6868(0)) and ((codasip_tmp_var_2 /= 0) and (codasip_tmp_var_1 /= 0)))) else
		signed(CONSTANT_0_7515);
	d_mem_rq_stall_D0 <= d_mem_rq_stall_STATEMENT_AST_7545(0) when (((ACT = CONSTANT_1_6868(0)) and ((codasip_tmp_var_2 /= 0) and (codasip_tmp_var_1 /= 0)))) else 
		d_mem_rq_stall_STATEMENT_AST_7726(0) when (((ACT = CONSTANT_1_6868(0)) and (((codasip_tmp_var_3 /= 0) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_6789(0);
	codasip_tmp_var_16 <= codasip_tmp_var_16_STATEMENT_AST_7564 when (((ACT = CONSTANT_1_6868(0)) and ((codasip_tmp_var_2 /= 0) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_6789;
	codasip_tmp_var_3 <= codasip_tmp_var_3_STATEMENT_AST_7584 when (((ACT = CONSTANT_1_6868(0)) and (not((codasip_tmp_var_2 /= 0)) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_6789;
	port_error_D0 <= std_logic_vector(port_error_STATEMENT_AST_7601) when (((ACT = CONSTANT_1_6868(0)) and (((codasip_tmp_var_16 /= 0) and (codasip_tmp_var_2 /= 0)) and (codasip_tmp_var_1 /= 0)))) else 
		std_logic_vector(port_error_STATEMENT_AST_7943) when (((ACT = CONSTANT_1_6868(0)) and (((((codasip_tmp_var_9 /= 0) and (codasip_tmp_var_7 /= 0)) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else 
		std_logic_vector(port_error_STATEMENT_AST_7965) when (((ACT = CONSTANT_1_6868(0)) and (((((codasip_tmp_var_8 /= 0) and not((codasip_tmp_var_7 /= 0))) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		std_logic_vector(CONSTANT_0_7515);
	codasip_tmp_var_11 <= codasip_tmp_var_11_STATEMENT_AST_7620 when (((ACT = CONSTANT_1_6868(0)) and (((codasip_tmp_var_3 /= 0) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_6789;
	lv_bb_5_request_write_rc <= lv_bb_5_request_write_rc_STATEMENT_AST_7639 when (((ACT = CONSTANT_1_6868(0)) and ((((codasip_tmp_var_11 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else 
		lv_bb_5_request_write_rc_STATEMENT_AST_7684 when (((ACT = CONSTANT_1_6868(0)) and (((not((codasip_tmp_var_11 /= 0)) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		signed(CONSTANT_0_7515);
	codasip_tmp_var_15 <= codasip_tmp_var_15_STATEMENT_AST_7702 when (((ACT = CONSTANT_1_6868(0)) and ((codasip_tmp_var_2 /= 0) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_6789;
	codasip_tmp_var_10 <= codasip_tmp_var_10_STATEMENT_AST_7746 when (((ACT = CONSTANT_1_6868(0)) and (((codasip_tmp_var_3 /= 0) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_6789;
	codasip_tmp_var_14 <= codasip_tmp_var_14_STATEMENT_AST_7765 when (((ACT = CONSTANT_1_6868(0)) and ((codasip_tmp_var_2 /= 0) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_6789;
	codasip_tmp_var_7 <= codasip_tmp_var_7_STATEMENT_AST_7789 when (((ACT = CONSTANT_1_6868(0)) and (((codasip_tmp_var_3 /= 0) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_6789;
	dbus_OFCMD0 <= std_logic_vector(resize(CONSTANT_2_7372, 3)) when (((ACT = CONSTANT_1_6868(0)) and ((((codasip_tmp_var_7 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		std_logic_vector(CONSTANT_0_7508);
	dbus_D0 <= std_logic_vector(dbus_STATEMENT_ofinish_7818) when (((ACT = CONSTANT_1_6868(0)) and ((((codasip_tmp_var_7 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		std_logic_vector(CONSTANT_0_7515);
	lv_bb_4_finish_write_rc <= lv_bb_4_finish_write_rc_STATEMENT_AST_7808 when (((ACT = CONSTANT_1_6868(0)) and ((((codasip_tmp_var_7 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		signed(CONSTANT_0_7515);
	d_mem_fw_stall_D0 <= d_mem_fw_stall_STATEMENT_AST_7846(0) when (((ACT = CONSTANT_1_6868(0)) and ((((codasip_tmp_var_7 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_6789(0);
	codasip_tmp_var_9 <= codasip_tmp_var_9_STATEMENT_AST_7870 when (((ACT = CONSTANT_1_6868(0)) and ((((codasip_tmp_var_7 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_6789;
	codasip_tmp_var_8 <= codasip_tmp_var_8_STATEMENT_AST_7895 when (((ACT = CONSTANT_1_6868(0)) and (((not((codasip_tmp_var_7 /= 0)) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_6789;
	codasip_tmp_var_13 <= codasip_tmp_var_13_STATEMENT_AST_7921 when (((ACT = CONSTANT_1_6868(0)) and ((codasip_tmp_var_2 /= 0) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_6789;
	codasip_tmp_var_12 <= codasip_tmp_var_12_STATEMENT_AST_7988 when (((ACT = CONSTANT_1_6868(0)) and ((codasip_tmp_var_2 /= 0) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_6789;
	codasip_tmp_var_6 <= codasip_tmp_var_6_STATEMENT_AST_8004 when (((ACT = CONSTANT_1_6868(0)) and (((codasip_tmp_var_3 /= 0) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_7508;
	codasip_tmp_var_5 <= codasip_tmp_var_5_STATEMENT_AST_8021 when (((ACT = CONSTANT_1_6868(0)) and (((codasip_tmp_var_3 /= 0) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_6789;
	codasip_tmp_var_4 <= codasip_tmp_var_4_STATEMENT_AST_8044 when (((ACT = CONSTANT_1_6868(0)) and (((codasip_tmp_var_3 /= 0) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_6789;
	ex2_mem_wr_ack_WE0 <= CONSTANT_1_6868(0) when (((ACT = CONSTANT_1_6868(0)) and (codasip_tmp_var_1 /= 0))) else
		CONSTANT_0_6789(0);
	ex2_mem_wr_ack_D0 <= ex2_mem_wr_ack_STATEMENT_AST_8069(0);
	i_mem_rq_inv_stall_D0 <= i_mem_rq_inv_stall_STATEMENT_AST_8102(0);
	wb_alu_op_WE0 <= CONSTANT_1_6868(0) when ((ACT = CONSTANT_1_6868(0))) else
		CONSTANT_0_6789(0);
	wb_alu_op_D0 <= std_logic_vector(wb_alu_op_STATEMENT_AST_8111);
	wb_rW_WE0 <= CONSTANT_1_6868(0) when ((ACT = CONSTANT_1_6868(0))) else
		CONSTANT_0_6789(0);
	wb_rW_D0 <= std_logic_vector(wb_rW_STATEMENT_AST_8126);
	wb_mem_rw_WE0 <= CONSTANT_1_6868(0) when ((ACT = CONSTANT_1_6868(0))) else
		CONSTANT_0_6789(0);
	wb_mem_rw_D0 <= std_logic_vector(wb_mem_rw_STATEMENT_AST_8141);
	wb_dest_en_WE0 <= CONSTANT_1_6868(0) when ((ACT = CONSTANT_1_6868(0))) else
		CONSTANT_0_6789(0);
	wb_dest_en_D0 <= wb_dest_en_STATEMENT_AST_8156(0);

end architecture RTL;


