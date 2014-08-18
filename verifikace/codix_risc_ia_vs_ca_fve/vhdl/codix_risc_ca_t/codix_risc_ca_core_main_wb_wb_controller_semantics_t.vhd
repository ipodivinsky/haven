--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_wb_wb_controller_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_wb_wb_controller_semantics_t is
	port (
		ACT : in std_logic;
		d_mem_fr_stall_D0 : out std_logic;
		dbus_IFCMD0 : out std_logic_vector(2 downto 0);
		dbus_IFRESP0 : in std_logic_vector(2 downto 0);
		dbus_Q0 : in std_logic_vector(31 downto 0);
		port_error_D0 : out std_logic_vector(31 downto 0);
		wb_mem_D0 : out std_logic_vector(31 downto 0);
		wb_mem_rw_Q0 : in std_logic_vector(3 downto 0)
	);
end entity codix_risc_ca_core_main_wb_wb_controller_semantics_t;

architecture RTL of codix_risc_ca_core_main_wb_wb_controller_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_3 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_wb_finish_rc : signed(31 downto 0);
	-- signal (inner)
	signal lv_bb_2_d_mem_tmp : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_3_d_mem : unsigned(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_10560 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_2_d_mem_tmp_STATEMENT_ifinish_10590 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_1_wb_finish_rc_STATEMENT_AST_10587 : signed(31 downto 0);
	-- signal (inner)
	signal lv_bb_3_d_mem_STATEMENT_AST_10618 : unsigned(31 downto 0);
	-- signal (inner)
	signal d_mem_fr_stall_STATEMENT_AST_10635 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_3_STATEMENT_AST_10652 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_3_d_mem_STATEMENT_AST_10670 : unsigned(31 downto 0);
	-- signal (inner)
	signal port_error_STATEMENT_AST_10681 : unsigned(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2_STATEMENT_AST_10698 : unsigned(0 downto 0);
	-- signal (inner)
	signal wb_mem_STATEMENT_AST_10712 : unsigned(31 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_10625: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_10594: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_10602: unsigned(31 downto 0) := to_unsigned(0, 32);
	constant CONSTANT_1_10579: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_128_10689: unsigned(7 downto 0) := to_unsigned(128, 8);
	constant CONSTANT_2_10576: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_3_10572: unsigned(1 downto 0) := to_unsigned(3, 2);
	constant CONSTANT_4_10568: unsigned(2 downto 0) := to_unsigned(4, 3);
	constant CONSTANT_5_10564: unsigned(2 downto 0) := to_unsigned(5, 3);

begin
	-- child instances inside 'main_wb_wb_controller_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:2385: codasip_tmp_var_1=((wb_mem_rw.read()==1)||(wb_m ...
	codasip_tmp_var_1_STATEMENT_AST_10560 <= "1" when ((((((unsigned(wb_mem_rw_Q0) = CONSTANT_1_10579) or (unsigned(wb_mem_rw_Q0) = CONSTANT_2_10576)) or (unsigned(wb_mem_rw_Q0) = CONSTANT_3_10572)) or (unsigned(wb_mem_rw_Q0) = CONSTANT_4_10568)) or (unsigned(wb_mem_rw_Q0) = CONSTANT_5_10564))) else "0";
	-- codix_risc_ca.acdl:2366: lv_bb_1_wb_finish_rc=dbus.ifinish(1, lv_bb_2_d_ ...
	lv_bb_1_wb_finish_rc_STATEMENT_AST_10587 <= signed(resize(unsigned(dbus_IFRESP0), 32));
	lv_bb_2_d_mem_tmp_STATEMENT_ifinish_10590 <= unsigned(dbus_Q0);
	-- codix_risc_ca.acdl:2369: lv_bb_3_d_mem=(lv_bb_1_wb_finish_rc==1) ? (unsi ...
	lv_bb_3_d_mem_STATEMENT_AST_10618 <= 
		lv_bb_2_d_mem_tmp when ((lv_bb_1_wb_finish_rc = signed(resize(CONSTANT_1_10579, 2)))) else
		resize(CONSTANT_0_10625, 32);
	-- codix_risc_ca.acdl:2372: d_mem_fr_stall.write((lv_bb_1_wb_finish_rc==0)  ...
	d_mem_fr_stall_STATEMENT_AST_10635 <= 
		CONSTANT_1_10579 when ((lv_bb_1_wb_finish_rc = signed(resize(CONSTANT_0_10625, 2)))) else
		CONSTANT_0_10625;
	-- codix_risc_ca.acdl:2379: codasip_tmp_var_3=((lv_bb_1_wb_finish_rc!=1)&&( ...
	codasip_tmp_var_3_STATEMENT_AST_10652 <= "1" when (((lv_bb_1_wb_finish_rc /= signed(resize(CONSTANT_1_10579, 2))) and (lv_bb_1_wb_finish_rc /= signed(resize(CONSTANT_0_10625, 2))))) else "0";
	-- codix_risc_ca.acdl:2384: lv_bb_3_d_mem=0
	lv_bb_3_d_mem_STATEMENT_AST_10670 <= resize(CONSTANT_0_10625, 32);
	-- codix_risc_ca.acdl:2375: port_error.write(128|((codasip::codasip_int<4,  ...
	port_error_STATEMENT_AST_10681 <= resize((CONSTANT_128_10689 or resize(unsigned(resize(lv_bb_1_wb_finish_rc, 32)(3 downto 0)), 8)), 32);
	-- codix_risc_ca.acdl:2381: codasip_tmp_var_2=(lv_bb_1_wb_finish_rc==0)
	codasip_tmp_var_2_STATEMENT_AST_10698 <= "1" when ((lv_bb_1_wb_finish_rc = signed(resize(CONSTANT_0_10625, 2)))) else "0";
	-- codix_risc_ca.acdl:2390: wb_mem.write((wb_mem_rw.read()==2) ? (unsigned  ...
	wb_mem_STATEMENT_AST_10712 <= 
		unsigned(resize(signed(resize(lv_bb_3_d_mem, 8)), 32)) when ((unsigned(wb_mem_rw_Q0) = CONSTANT_2_10576)) else
		unsigned(resize(signed(resize(lv_bb_3_d_mem, 16)), 32)) when ((unsigned(wb_mem_rw_Q0) = CONSTANT_4_10568)) else
		lv_bb_3_d_mem;
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_10560;
	dbus_IFCMD0 <= std_logic_vector(resize(CONSTANT_1_10579, 3)) when (((ACT = CONSTANT_1_10579(0)) and (codasip_tmp_var_1 /= 0))) else
		std_logic_vector(CONSTANT_0_10594);
	lv_bb_2_d_mem_tmp <= lv_bb_2_d_mem_tmp_STATEMENT_ifinish_10590 when (((ACT = CONSTANT_1_10579(0)) and (codasip_tmp_var_1 /= 0))) else
		CONSTANT_0_10602;
	lv_bb_1_wb_finish_rc <= lv_bb_1_wb_finish_rc_STATEMENT_AST_10587 when (((ACT = CONSTANT_1_10579(0)) and (codasip_tmp_var_1 /= 0))) else
		signed(CONSTANT_0_10602);
	lv_bb_3_d_mem <= lv_bb_3_d_mem_STATEMENT_AST_10618 when (((ACT = CONSTANT_1_10579(0)) and (codasip_tmp_var_1 /= 0))) else 
		lv_bb_3_d_mem_STATEMENT_AST_10670 when (((ACT = CONSTANT_1_10579(0)) and not((codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_10602;
	d_mem_fr_stall_D0 <= d_mem_fr_stall_STATEMENT_AST_10635(0) when (((ACT = CONSTANT_1_10579(0)) and (codasip_tmp_var_1 /= 0))) else
		CONSTANT_0_10625(0);
	codasip_tmp_var_3 <= codasip_tmp_var_3_STATEMENT_AST_10652 when (((ACT = CONSTANT_1_10579(0)) and (codasip_tmp_var_1 /= 0))) else
		CONSTANT_0_10625;
	port_error_D0 <= std_logic_vector(port_error_STATEMENT_AST_10681) when (((ACT = CONSTANT_1_10579(0)) and ((codasip_tmp_var_3 /= 0) and (codasip_tmp_var_1 /= 0)))) else
		std_logic_vector(CONSTANT_0_10602);
	codasip_tmp_var_2 <= codasip_tmp_var_2_STATEMENT_AST_10698 when (((ACT = CONSTANT_1_10579(0)) and (codasip_tmp_var_1 /= 0))) else
		CONSTANT_0_10625;
	wb_mem_D0 <= std_logic_vector(wb_mem_STATEMENT_AST_10712);

end architecture RTL;


