--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
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
		wb_rW_WE0 : out std_logic	);
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
	signal codasip_tmp_var_18_STATEMENT_AST_2200 : unsigned(5 downto 0);
	-- signal (inner)
	signal ex2_alu_wb_STATEMENT_AST_2209 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex2_alu_wb_STATEMENT_AST_2223 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex2_alu_wb_STATEMENT_AST_2246 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex2_alu_wb_STATEMENT_AST_2261 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_15_subtraction_STATEMENT_AST_2276 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_14_addA_STATEMENT_AST_2295 : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_13_addB_STATEMENT_AST_2313 : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_12_cy_STATEMENT_AST_2327 : unsigned(0 downto 0);
	-- signal (inner)
	signal wb_alu_STATEMENT_AST_2339 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_7_d_addr_STATEMENT_AST_2359 : unsigned(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_17_STATEMENT_AST_2368 : unsigned(3 downto 0);
	-- signal (inner)
	signal lv_bb_11_rsc_STATEMENT_AST_2377 : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_9_rsi_STATEMENT_AST_2395 : unsigned(1 downto 0);
	-- signal (inner)
	signal lv_bb_10_wsc_STATEMENT_AST_2415 : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_8_wsi_STATEMENT_AST_2521 : unsigned(1 downto 0);
	-- signal (inner)
	signal lv_bb_11_rsc_STATEMENT_AST_2631 : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_9_rsi_STATEMENT_AST_2727 : unsigned(1 downto 0);
	-- signal (inner)
	signal lv_bb_11_rsc_STATEMENT_AST_2827 : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_9_rsi_STATEMENT_AST_2843 : unsigned(1 downto 0);
	-- signal (inner)
	signal lv_bb_11_rsc_STATEMENT_AST_2861 : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_10_wsc_STATEMENT_AST_2873 : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_8_wsi_STATEMENT_AST_2885 : unsigned(1 downto 0);
	-- signal (inner)
	signal lv_bb_10_wsc_STATEMENT_AST_2899 : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_8_wsi_STATEMENT_AST_2911 : unsigned(1 downto 0);
	-- signal (inner)
	signal lv_bb_10_wsc_STATEMENT_AST_2925 : unsigned(2 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_2937 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2_STATEMENT_AST_2947 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_6_request_read_rc_STATEMENT_AST_2961 : signed(31 downto 0);
	-- signal (inner)
	signal d_mem_rq_stall_STATEMENT_AST_3009 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_16_STATEMENT_AST_3028 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_3_STATEMENT_AST_3048 : unsigned(0 downto 0);
	-- signal (inner)
	signal port_error_STATEMENT_AST_3065 : unsigned(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_11_STATEMENT_AST_3084 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_5_request_write_rc_STATEMENT_AST_3103 : signed(31 downto 0);
	-- signal (inner)
	signal lv_bb_5_request_write_rc_STATEMENT_AST_3148 : signed(31 downto 0);
	-- signal (inner)
	signal d_mem_rq_stall_STATEMENT_AST_3166 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_10_STATEMENT_AST_3186 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_7_STATEMENT_AST_3205 : unsigned(0 downto 0);
	-- signal (inner)
	signal dbus_STATEMENT_ofinish_3234 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_4_finish_write_rc_STATEMENT_AST_3224 : signed(31 downto 0);
	-- signal (inner)
	signal d_mem_fw_stall_STATEMENT_AST_3262 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_9_STATEMENT_AST_3286 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_8_STATEMENT_AST_3311 : unsigned(0 downto 0);
	-- signal (inner)
	signal port_error_STATEMENT_AST_3337 : unsigned(31 downto 0);
	-- signal (inner)
	signal port_error_STATEMENT_AST_3359 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex2_mem_wr_ack_STATEMENT_AST_3382 : unsigned(0 downto 0);
	-- signal (inner)
	signal i_mem_rq_inv_stall_STATEMENT_AST_3415 : unsigned(0 downto 0);
	-- signal (inner)
	signal wb_alu_op_STATEMENT_AST_3424 : unsigned(5 downto 0);
	-- signal (inner)
	signal wb_rW_STATEMENT_AST_3439 : unsigned(4 downto 0);
	-- signal (inner)
	signal wb_mem_rw_STATEMENT_AST_3454 : unsigned(3 downto 0);
	-- signal (inner)
	signal wb_dest_en_STATEMENT_AST_3469 : unsigned(0 downto 0);

		-- datapath signals and constants
	signal ex2_alu_wb_D0_2217_select_14577: std_logic_vector(5 downto 0);
	signal lv_bb_11_rsc_D0_2389_select_14578: std_logic_vector(3 downto 0);
	signal lv_bb_9_rsi_D0_2409_select_14579: std_logic_vector(3 downto 0);
	signal lv_bb_10_wsc_D0_2515_select_14580: std_logic_vector(3 downto 0);
	signal lv_bb_8_wsi_D0_2625_select_14581: std_logic_vector(3 downto 0);
	constant CONSTANT_0_2253: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_2986: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_2972: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_2979: unsigned(31 downto 0) := to_unsigned(0, 32);
	constant CONSTANT_1_2332: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_2_2836: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_256_3375: unsigned(8 downto 0) := to_unsigned(256, 9);
	constant CONSTANT_3_2405: unsigned(1 downto 0) := to_unsigned(3, 2);
	constant CONSTANT_4_2866: unsigned(2 downto 0) := to_unsigned(4, 3);
	constant CONSTANT_4294967292_2968: unsigned(31 downto 0) := "11111111111111111111111111111100";
	constant CONSTANT_49_2287: unsigned(5 downto 0) := to_unsigned(49, 6);
	constant CONSTANT_51_2284: unsigned(5 downto 0) := to_unsigned(51, 6);
	constant CONSTANT_512_3352: unsigned(9 downto 0) := to_unsigned(512, 10);
	constant CONSTANT_52_2303: unsigned(5 downto 0) := to_unsigned(52, 6);
	constant CONSTANT_53_2280: unsigned(5 downto 0) := to_unsigned(53, 6);
	constant CONSTANT_64_3075: unsigned(6 downto 0) := to_unsigned(64, 7);

begin
	-- child instances inside 'main_ex2_ex2_controller_semantics' functional unit:

		-- conversions for datapath
	ex2_alu_wb_D0_2217_select_14577 <= std_logic_vector(codasip_tmp_var_18);
	lv_bb_11_rsc_D0_2389_select_14578 <= std_logic_vector(codasip_tmp_var_17);
	lv_bb_9_rsi_D0_2409_select_14579 <= std_logic_vector(codasip_tmp_var_17);
	lv_bb_10_wsc_D0_2515_select_14580 <= std_logic_vector(codasip_tmp_var_17);
	lv_bb_8_wsi_D0_2625_select_14581 <= std_logic_vector(codasip_tmp_var_17);

		-- Datapath code
	-- codix_risc_ca.acdl:2141: codasip_tmp_var_18=ex2_alu_op.read()
	codasip_tmp_var_18_STATEMENT_AST_2200 <= unsigned(ex2_alu_op_Q0);
	-- codix_risc_ca.acdl:2132: ex2_alu_wb.write(ex2_regC.read())
	ex2_alu_wb_STATEMENT_AST_2209 <= unsigned(ex2_regC_Q0);
	-- codix_risc_ca.acdl:2140: ex2_alu_wb.write(ex2_alu.read())
	ex2_alu_wb_STATEMENT_AST_2223 <= unsigned(ex2_alu_Q0);
	-- codix_risc_ca.acdl:2135: ex2_alu_wb.write(ex2_cmp.read() ? (unsigned int ...
	ex2_alu_wb_STATEMENT_AST_2246 <= 
		unsigned(ex2_regC_Q0) when ((ex2_cmp_Q0 /= '0')) else
		resize(CONSTANT_0_2253, 32);
	-- codix_risc_ca.acdl:2137: ex2_alu_wb.write(ex2_cmp.read() ? (unsigned int ...
	ex2_alu_wb_STATEMENT_AST_2261 <= 
		unsigned(ex2_regB_Q0) when ((ex2_cmp_Q0 /= '0')) else
		unsigned(ex2_regC_Q0);
	-- codix_risc_ca.acdl:2145: lv_bb_15_subtraction=(ex2_alu_op.read()==49)||( ...
	lv_bb_15_subtraction_STATEMENT_AST_2276 <= "1" when ((((unsigned(ex2_alu_op_Q0) = CONSTANT_49_2287) or (unsigned(ex2_alu_op_Q0) = CONSTANT_51_2284)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_53_2280))) else "0";
	-- codix_risc_ca.acdl:2148: lv_bb_14_addA=((ex2_alu_op.read()==52)||(ex2_al ...
	lv_bb_14_addA_STATEMENT_AST_2295 <= 
		unsigned(resize(unsigned(ex2_mul_Q0), 33)) when (((unsigned(ex2_alu_op_Q0) = CONSTANT_52_2303) or (unsigned(ex2_alu_op_Q0) = CONSTANT_53_2280))) else
		unsigned(resize(unsigned(ex2_alu_Q0), 33));
	-- codix_risc_ca.acdl:2151: lv_bb_13_addB=lv_bb_15_subtraction ? (unsigned  ...
	lv_bb_13_addB_STATEMENT_AST_2313 <= 
		resize(not(unsigned(ex2_regC_Q0)), 33) when ((lv_bb_15_subtraction /= 0)) else
		unsigned(resize(unsigned(ex2_regC_Q0), 33));
	-- codix_risc_ca.acdl:2152: lv_bb_12_cy=lv_bb_15_subtraction ? (codasip::co ...
	lv_bb_12_cy_STATEMENT_AST_2327 <= 
		CONSTANT_1_2332 when ((lv_bb_15_subtraction /= 0)) else
		CONSTANT_0_2253;
	-- codix_risc_ca.acdl:2155: wb_alu.write(((unsigned int  )(lv_bb_14_addA+lv ...
	wb_alu_STATEMENT_AST_2339 <= resize((resize((resize(lv_bb_14_addA, 34) + resize(lv_bb_13_addB, 34)), 35) + resize(lv_bb_12_cy, 35)), 32);
	-- codix_risc_ca.acdl:2159: lv_bb_7_d_addr=ex2_alu.read()
	lv_bb_7_d_addr_STATEMENT_AST_2359 <= unsigned(ex2_alu_Q0);
	-- codix_risc_ca.acdl:2203: codasip_tmp_var_17=ex2_mem_rw.read()
	codasip_tmp_var_17_STATEMENT_AST_2368 <= unsigned(ex2_mem_rw_Q0);
	-- codix_risc_ca.acdl:2169: lv_bb_11_rsc=1
	lv_bb_11_rsc_STATEMENT_AST_2377 <= resize(CONSTANT_1_2332, 3);
	-- codix_risc_ca.acdl:2169: lv_bb_9_rsi=lv_bb_7_d_addr&3
	lv_bb_9_rsi_STATEMENT_AST_2395 <= (resize(lv_bb_7_d_addr, 2) and CONSTANT_3_2405);
	-- codix_risc_ca.acdl:2170: lv_bb_10_wsc=0
	lv_bb_10_wsc_STATEMENT_AST_2415 <= resize(CONSTANT_0_2253, 3);
	-- codix_risc_ca.acdl:2170: lv_bb_8_wsi=0
	lv_bb_8_wsi_STATEMENT_AST_2521 <= resize(CONSTANT_0_2253, 2);
	-- codix_risc_ca.acdl:2164: lv_bb_11_rsc=0
	lv_bb_11_rsc_STATEMENT_AST_2631 <= resize(CONSTANT_0_2253, 3);
	-- codix_risc_ca.acdl:2164: lv_bb_9_rsi=0
	lv_bb_9_rsi_STATEMENT_AST_2727 <= resize(CONSTANT_0_2253, 2);
	-- codix_risc_ca.acdl:2174: lv_bb_11_rsc=2
	lv_bb_11_rsc_STATEMENT_AST_2827 <= resize(CONSTANT_2_2836, 3);
	-- codix_risc_ca.acdl:2174: lv_bb_9_rsi=lv_bb_7_d_addr&2
	lv_bb_9_rsi_STATEMENT_AST_2843 <= (resize(lv_bb_7_d_addr, 2) and CONSTANT_2_2836);
	-- codix_risc_ca.acdl:2178: lv_bb_11_rsc=4
	lv_bb_11_rsc_STATEMENT_AST_2861 <= CONSTANT_4_2866;
	-- codix_risc_ca.acdl:2183: lv_bb_10_wsc=1
	lv_bb_10_wsc_STATEMENT_AST_2873 <= resize(CONSTANT_1_2332, 3);
	-- codix_risc_ca.acdl:2183: lv_bb_8_wsi=lv_bb_7_d_addr&3
	lv_bb_8_wsi_STATEMENT_AST_2885 <= (resize(lv_bb_7_d_addr, 2) and CONSTANT_3_2405);
	-- codix_risc_ca.acdl:2187: lv_bb_10_wsc=2
	lv_bb_10_wsc_STATEMENT_AST_2899 <= resize(CONSTANT_2_2836, 3);
	-- codix_risc_ca.acdl:2187: lv_bb_8_wsi=lv_bb_7_d_addr&2
	lv_bb_8_wsi_STATEMENT_AST_2911 <= (resize(lv_bb_7_d_addr, 2) and CONSTANT_2_2836);
	-- codix_risc_ca.acdl:2191: lv_bb_10_wsc=4
	lv_bb_10_wsc_STATEMENT_AST_2925 <= CONSTANT_4_2866;
	-- codix_risc_ca.acdl:2347: codasip_tmp_var_1=(!d_mem_fr_stall.read())
	codasip_tmp_var_1_STATEMENT_AST_2937 <= "1" when (not((d_mem_fr_stall_Q0 /= '0'))) else "0";
	-- codix_risc_ca.acdl:2296: codasip_tmp_var_2=(lv_bb_11_rsc)!=0
	codasip_tmp_var_2_STATEMENT_AST_2947 <= "1" when ((lv_bb_11_rsc /= CONSTANT_0_2253)) else "0";
	-- codix_risc_ca.acdl:2211: lv_bb_6_request_read_rc=dbus.request(1, lv_bb_7 ...
	lv_bb_6_request_read_rc_STATEMENT_AST_2961 <= signed(resize(unsigned(dbus_REQRESP0), 32));
	-- codix_risc_ca.acdl:2215: d_mem_rq_stall.write((lv_bb_6_request_read_rc== ...
	d_mem_rq_stall_STATEMENT_AST_3009 <= 
		CONSTANT_1_2332 when ((lv_bb_6_request_read_rc = signed(resize(CONSTANT_0_2253, 2)))) else
		CONSTANT_0_2253;
	-- codix_risc_ca.acdl:2223: codasip_tmp_var_16=((lv_bb_6_request_read_rc!=1 ...
	codasip_tmp_var_16_STATEMENT_AST_3028 <= "1" when (((lv_bb_6_request_read_rc /= signed(resize(CONSTANT_1_2332, 2))) and (lv_bb_6_request_read_rc /= signed(resize(CONSTANT_0_2253, 2))))) else "0";
	-- codix_risc_ca.acdl:2296: codasip_tmp_var_3=(lv_bb_10_wsc)!=0
	codasip_tmp_var_3_STATEMENT_AST_3048 <= "1" when ((lv_bb_10_wsc /= CONSTANT_0_2253)) else "0";
	-- codix_risc_ca.acdl:2218: port_error.write(64|((codasip::codasip_int<4, f ...
	port_error_STATEMENT_AST_3065 <= resize((CONSTANT_64_3075 or resize(unsigned(resize(lv_bb_6_request_read_rc, 32)(3 downto 0)), 7)), 32);
	-- codix_risc_ca.acdl:2246: codasip_tmp_var_11=(ex2_mem_wr_ack.read()==0)
	codasip_tmp_var_11_STATEMENT_AST_3084 <= "1" when ((ex2_mem_wr_ack_Q0 = CONSTANT_0_2253(0))) else "0";
	-- codix_risc_ca.acdl:2244: lv_bb_5_request_write_rc=dbus.request(2, lv_bb_ ...
	lv_bb_5_request_write_rc_STATEMENT_AST_3103 <= signed(resize(unsigned(dbus_REQRESP0), 32));
	-- codix_risc_ca.acdl:2246: lv_bb_5_request_write_rc=1
	lv_bb_5_request_write_rc_STATEMENT_AST_3148 <= signed(resize(CONSTANT_1_2332, 32));
	-- codix_risc_ca.acdl:2249: d_mem_rq_stall.write((lv_bb_5_request_write_rc= ...
	d_mem_rq_stall_STATEMENT_AST_3166 <= 
		CONSTANT_1_2332 when ((lv_bb_5_request_write_rc = signed(resize(CONSTANT_0_2253, 2)))) else
		CONSTANT_0_2253;
	-- codix_risc_ca.acdl:2254: codasip_tmp_var_10=(lv_bb_5_request_write_rc==0)
	codasip_tmp_var_10_STATEMENT_AST_3186 <= "1" when ((lv_bb_5_request_write_rc = signed(resize(CONSTANT_0_2253, 2)))) else "0";
	-- codix_risc_ca.acdl:2270: codasip_tmp_var_7=(lv_bb_5_request_write_rc==1)
	codasip_tmp_var_7_STATEMENT_AST_3205 <= "1" when ((lv_bb_5_request_write_rc = signed(resize(CONSTANT_1_2332, 2)))) else "0";
	-- codix_risc_ca.acdl:2255: lv_bb_4_finish_write_rc=dbus.ofinish(2, ex2_reg ...
	lv_bb_4_finish_write_rc_STATEMENT_AST_3224 <= signed(resize(unsigned(dbus_OFRESP0), 32));
	dbus_STATEMENT_ofinish_3234 <= unsigned(ex2_regC_Q0);
	-- codix_risc_ca.acdl:2258: d_mem_fw_stall.write((lv_bb_4_finish_write_rc== ...
	d_mem_fw_stall_STATEMENT_AST_3262 <= 
		CONSTANT_1_2332 when ((lv_bb_4_finish_write_rc = signed(resize(CONSTANT_0_2253, 2)))) else
		CONSTANT_0_2253;
	-- codix_risc_ca.acdl:2264: codasip_tmp_var_9=((lv_bb_4_finish_write_rc!=1) ...
	codasip_tmp_var_9_STATEMENT_AST_3286 <= "1" when (((lv_bb_4_finish_write_rc /= signed(resize(CONSTANT_1_2332, 2))) and (lv_bb_4_finish_write_rc /= signed(resize(CONSTANT_0_2253, 2))))) else "0";
	-- codix_risc_ca.acdl:2270: codasip_tmp_var_8=((lv_bb_5_request_write_rc!=1 ...
	codasip_tmp_var_8_STATEMENT_AST_3311 <= "1" when (((lv_bb_5_request_write_rc /= signed(resize(CONSTANT_1_2332, 2))) and (lv_bb_5_request_write_rc /= signed(resize(CONSTANT_0_2253, 2))))) else "0";
	-- codix_risc_ca.acdl:2261: port_error.write(512|((codasip::codasip_int<4,  ...
	port_error_STATEMENT_AST_3337 <= resize((CONSTANT_512_3352 or resize(unsigned(resize(lv_bb_4_finish_write_rc, 32)(3 downto 0)), 10)), 32);
	-- codix_risc_ca.acdl:2267: port_error.write(256|((codasip::codasip_int<4,  ...
	port_error_STATEMENT_AST_3359 <= resize((CONSTANT_256_3375 or resize(unsigned(resize(lv_bb_5_request_write_rc, 32)(3 downto 0)), 9)), 32);
	-- codix_risc_ca.acdl:2296: ex2_mem_wr_ack.write((((lv_bb_10_wsc)!=0)&&(lv_ ...
	ex2_mem_wr_ack_STATEMENT_AST_3382 <= 
		CONSTANT_1_2332 when ((((lv_bb_10_wsc /= CONSTANT_0_2253) and (lv_bb_5_request_write_rc = signed(resize(CONSTANT_1_2332, 2)))) and (lv_bb_4_finish_write_rc = signed(resize(CONSTANT_0_2253, 2))))) else
		CONSTANT_0_2253;
	-- codix_risc_ca.acdl:2347: i_mem_rq_inv_stall.write(0)
	i_mem_rq_inv_stall_STATEMENT_AST_3415 <= CONSTANT_0_2253;
	-- codix_risc_ca.acdl:2351: wb_alu_op.write(ex2_alu_op.read())
	wb_alu_op_STATEMENT_AST_3424 <= unsigned(ex2_alu_op_Q0);
	-- codix_risc_ca.acdl:2352: wb_rW.write(ex2_rW.read())
	wb_rW_STATEMENT_AST_3439 <= unsigned(ex2_rW_Q0);
	-- codix_risc_ca.acdl:2353: wb_mem_rw.write(ex2_mem_rw.read())
	wb_mem_rw_STATEMENT_AST_3454 <= unsigned(ex2_mem_rw_Q0);
	-- codix_risc_ca.acdl:2354: wb_dest_en.write(ex2_dest_en.read())
	wb_dest_en_STATEMENT_AST_3469(0) <= ex2_dest_en_Q0;
	codasip_tmp_var_18 <= codasip_tmp_var_18_STATEMENT_AST_2200;
	with ex2_alu_wb_D0_2217_select_14577 select
		ex2_alu_wb_D0 <= 
			std_logic_vector(ex2_alu_wb_STATEMENT_AST_2209) when "010001", 
			std_logic_vector(ex2_alu_wb_STATEMENT_AST_2246) when "010010", 
			std_logic_vector(ex2_alu_wb_STATEMENT_AST_2261) when "010011", 
			std_logic_vector(ex2_alu_wb_STATEMENT_AST_2223) when others;
	lv_bb_15_subtraction <= lv_bb_15_subtraction_STATEMENT_AST_2276;
	lv_bb_14_addA <= lv_bb_14_addA_STATEMENT_AST_2295;
	lv_bb_13_addB <= lv_bb_13_addB_STATEMENT_AST_2313;
	lv_bb_12_cy <= lv_bb_12_cy_STATEMENT_AST_2327;
	wb_alu_WE0 <= CONSTANT_1_2332(0) when ((ACT = CONSTANT_1_2332(0))) else
		CONSTANT_0_2253(0);
	wb_alu_D0 <= std_logic_vector(wb_alu_STATEMENT_AST_2339);
	lv_bb_7_d_addr <= lv_bb_7_d_addr_STATEMENT_AST_2359;
	codasip_tmp_var_17 <= codasip_tmp_var_17_STATEMENT_AST_2368;
	with lv_bb_11_rsc_D0_2389_select_14578 select
		lv_bb_11_rsc <= 
			lv_bb_11_rsc_STATEMENT_AST_2377 when "0001", 
			lv_bb_11_rsc_STATEMENT_AST_2377 when "0010", 
			lv_bb_11_rsc_STATEMENT_AST_2827 when "0011", 
			lv_bb_11_rsc_STATEMENT_AST_2827 when "0100", 
			lv_bb_11_rsc_STATEMENT_AST_2861 when "0101", 
			lv_bb_11_rsc_STATEMENT_AST_2631 when others;
	with lv_bb_9_rsi_D0_2409_select_14579 select
		lv_bb_9_rsi <= 
			lv_bb_9_rsi_STATEMENT_AST_2395 when "0001", 
			lv_bb_9_rsi_STATEMENT_AST_2395 when "0010", 
			lv_bb_9_rsi_STATEMENT_AST_2843 when "0011", 
			lv_bb_9_rsi_STATEMENT_AST_2843 when "0100", 
			lv_bb_9_rsi_STATEMENT_AST_2727 when others;
	with lv_bb_10_wsc_D0_2515_select_14580 select
		lv_bb_10_wsc <= 
			lv_bb_10_wsc_STATEMENT_AST_2873 when "1000", 
			lv_bb_10_wsc_STATEMENT_AST_2899 when "1001", 
			lv_bb_10_wsc_STATEMENT_AST_2925 when "1010", 
			lv_bb_10_wsc_STATEMENT_AST_2415 when others;
	with lv_bb_8_wsi_D0_2625_select_14581 select
		lv_bb_8_wsi <= 
			lv_bb_8_wsi_STATEMENT_AST_2885 when "1000", 
			lv_bb_8_wsi_STATEMENT_AST_2911 when "1001", 
			lv_bb_8_wsi_STATEMENT_AST_2521 when others;
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_2937;
	codasip_tmp_var_2 <= codasip_tmp_var_2_STATEMENT_AST_2947 when (((ACT = CONSTANT_1_2332(0)) and (codasip_tmp_var_1 /= 0))) else
		CONSTANT_0_2253;
	dbus_REQCMD0 <= std_logic_vector(resize(CONSTANT_1_2332, 3)) when (((ACT = CONSTANT_1_2332(0)) and ((codasip_tmp_var_2 /= 0) and (codasip_tmp_var_1 /= 0)))) else 
		std_logic_vector(resize(CONSTANT_2_2836, 3)) when (((ACT = CONSTANT_1_2332(0)) and ((((codasip_tmp_var_11 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		std_logic_vector(CONSTANT_0_2972);
	dbus_A0 <= std_logic_vector((lv_bb_7_d_addr and CONSTANT_4294967292_2968)) when (((ACT = CONSTANT_1_2332(0)) and ((codasip_tmp_var_2 /= 0) and (codasip_tmp_var_1 /= 0)))) else 
		std_logic_vector((lv_bb_7_d_addr and CONSTANT_4294967292_2968)) when (((ACT = CONSTANT_1_2332(0)) and ((((codasip_tmp_var_11 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		std_logic_vector(CONSTANT_0_2979);
	dbus_SI0 <= std_logic_vector(lv_bb_9_rsi) when (((ACT = CONSTANT_1_2332(0)) and ((codasip_tmp_var_2 /= 0) and (codasip_tmp_var_1 /= 0)))) else 
		std_logic_vector(lv_bb_8_wsi) when (((ACT = CONSTANT_1_2332(0)) and ((((codasip_tmp_var_11 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		std_logic_vector(CONSTANT_0_2986);
	dbus_SC0 <= std_logic_vector(lv_bb_11_rsc) when (((ACT = CONSTANT_1_2332(0)) and ((codasip_tmp_var_2 /= 0) and (codasip_tmp_var_1 /= 0)))) else 
		std_logic_vector(lv_bb_10_wsc) when (((ACT = CONSTANT_1_2332(0)) and ((((codasip_tmp_var_11 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		std_logic_vector(CONSTANT_0_2972);
	lv_bb_6_request_read_rc <= lv_bb_6_request_read_rc_STATEMENT_AST_2961 when (((ACT = CONSTANT_1_2332(0)) and ((codasip_tmp_var_2 /= 0) and (codasip_tmp_var_1 /= 0)))) else
		signed(CONSTANT_0_2979);
	d_mem_rq_stall_D0 <= d_mem_rq_stall_STATEMENT_AST_3009(0) when (((ACT = CONSTANT_1_2332(0)) and ((codasip_tmp_var_2 /= 0) and (codasip_tmp_var_1 /= 0)))) else 
		d_mem_rq_stall_STATEMENT_AST_3166(0) when (((ACT = CONSTANT_1_2332(0)) and (((codasip_tmp_var_3 /= 0) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_2253(0);
	codasip_tmp_var_16 <= codasip_tmp_var_16_STATEMENT_AST_3028 when (((ACT = CONSTANT_1_2332(0)) and ((codasip_tmp_var_2 /= 0) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_2253;
	codasip_tmp_var_3 <= codasip_tmp_var_3_STATEMENT_AST_3048 when (((ACT = CONSTANT_1_2332(0)) and (not((codasip_tmp_var_2 /= 0)) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_2253;
	port_error_D0 <= std_logic_vector(port_error_STATEMENT_AST_3065) when (((ACT = CONSTANT_1_2332(0)) and (((codasip_tmp_var_16 /= 0) and (codasip_tmp_var_2 /= 0)) and (codasip_tmp_var_1 /= 0)))) else 
		std_logic_vector(port_error_STATEMENT_AST_3337) when (((ACT = CONSTANT_1_2332(0)) and (((((codasip_tmp_var_9 /= 0) and (codasip_tmp_var_7 /= 0)) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else 
		std_logic_vector(port_error_STATEMENT_AST_3359) when (((ACT = CONSTANT_1_2332(0)) and (((((codasip_tmp_var_8 /= 0) and not((codasip_tmp_var_7 /= 0))) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		std_logic_vector(CONSTANT_0_2979);
	codasip_tmp_var_11 <= codasip_tmp_var_11_STATEMENT_AST_3084 when (((ACT = CONSTANT_1_2332(0)) and (((codasip_tmp_var_3 /= 0) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_2253;
	lv_bb_5_request_write_rc <= lv_bb_5_request_write_rc_STATEMENT_AST_3103 when (((ACT = CONSTANT_1_2332(0)) and ((((codasip_tmp_var_11 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else 
		lv_bb_5_request_write_rc_STATEMENT_AST_3148 when (((ACT = CONSTANT_1_2332(0)) and (((not((codasip_tmp_var_11 /= 0)) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		signed(CONSTANT_0_2979);
	codasip_tmp_var_10 <= codasip_tmp_var_10_STATEMENT_AST_3186 when (((ACT = CONSTANT_1_2332(0)) and (((codasip_tmp_var_3 /= 0) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_2253;
	codasip_tmp_var_7 <= codasip_tmp_var_7_STATEMENT_AST_3205 when (((ACT = CONSTANT_1_2332(0)) and (((codasip_tmp_var_3 /= 0) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_2253;
	dbus_OFCMD0 <= std_logic_vector(resize(CONSTANT_2_2836, 3)) when (((ACT = CONSTANT_1_2332(0)) and ((((codasip_tmp_var_7 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		std_logic_vector(CONSTANT_0_2972);
	dbus_D0 <= std_logic_vector(dbus_STATEMENT_ofinish_3234) when (((ACT = CONSTANT_1_2332(0)) and ((((codasip_tmp_var_7 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		std_logic_vector(CONSTANT_0_2979);
	lv_bb_4_finish_write_rc <= lv_bb_4_finish_write_rc_STATEMENT_AST_3224 when (((ACT = CONSTANT_1_2332(0)) and ((((codasip_tmp_var_7 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		signed(CONSTANT_0_2979);
	d_mem_fw_stall_D0 <= d_mem_fw_stall_STATEMENT_AST_3262(0) when (((ACT = CONSTANT_1_2332(0)) and ((((codasip_tmp_var_7 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_2253(0);
	codasip_tmp_var_9 <= codasip_tmp_var_9_STATEMENT_AST_3286 when (((ACT = CONSTANT_1_2332(0)) and ((((codasip_tmp_var_7 /= 0) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_2253;
	codasip_tmp_var_8 <= codasip_tmp_var_8_STATEMENT_AST_3311 when (((ACT = CONSTANT_1_2332(0)) and (((not((codasip_tmp_var_7 /= 0)) and (codasip_tmp_var_3 /= 0)) and not((codasip_tmp_var_2 /= 0))) and (codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_2253;
	ex2_mem_wr_ack_WE0 <= CONSTANT_1_2332(0) when (((ACT = CONSTANT_1_2332(0)) and (codasip_tmp_var_1 /= 0))) else
		CONSTANT_0_2253(0);
	ex2_mem_wr_ack_D0 <= ex2_mem_wr_ack_STATEMENT_AST_3382(0);
	i_mem_rq_inv_stall_D0 <= i_mem_rq_inv_stall_STATEMENT_AST_3415(0);
	wb_alu_op_WE0 <= CONSTANT_1_2332(0) when ((ACT = CONSTANT_1_2332(0))) else
		CONSTANT_0_2253(0);
	wb_alu_op_D0 <= std_logic_vector(wb_alu_op_STATEMENT_AST_3424);
	wb_rW_WE0 <= CONSTANT_1_2332(0) when ((ACT = CONSTANT_1_2332(0))) else
		CONSTANT_0_2253(0);
	wb_rW_D0 <= std_logic_vector(wb_rW_STATEMENT_AST_3439);
	wb_mem_rw_WE0 <= CONSTANT_1_2332(0) when ((ACT = CONSTANT_1_2332(0))) else
		CONSTANT_0_2253(0);
	wb_mem_rw_D0 <= std_logic_vector(wb_mem_rw_STATEMENT_AST_3454);
	wb_dest_en_WE0 <= CONSTANT_1_2332(0) when ((ACT = CONSTANT_1_2332(0))) else
		CONSTANT_0_2253(0);
	wb_dest_en_D0 <= wb_dest_en_STATEMENT_AST_3469(0);

end architecture RTL;


