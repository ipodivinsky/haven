--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_rd_rd_controller_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_rd_rd_controller_semantics_t is
	port (
		ACT : in std_logic;
		ex_aluA_D0 : out std_logic_vector(31 downto 0);
		ex_aluA_WE0 : out std_logic;
		ex_aluB_D0 : out std_logic_vector(31 downto 0);
		ex_aluB_WE0 : out std_logic;
		ex_alu_op_D0 : out std_logic_vector(5 downto 0);
		ex_alu_op_WE0 : out std_logic;
		ex_cond_D0 : out std_logic_vector(4 downto 0);
		ex_cond_WE0 : out std_logic;
		ex_dest_en_mux_D0 : out std_logic_vector(1 downto 0);
		ex_dest_en_mux_WE0 : out std_logic;
		ex_ie_flag_D0 : out std_logic_vector(1 downto 0);
		ex_ie_flag_WE0 : out std_logic;
		ex_mem_rw_D0 : out std_logic_vector(3 downto 0);
		ex_mem_rw_WE0 : out std_logic;
		ex_rW_D0 : out std_logic_vector(4 downto 0);
		ex_rW_WE0 : out std_logic;
		ex_regA_D0 : out std_logic_vector(31 downto 0);
		ex_regA_WE0 : out std_logic;
		ex_regB_D0 : out std_logic_vector(31 downto 0);
		ex_regB_WE0 : out std_logic;
		ex_regC_D0 : out std_logic_vector(31 downto 0);
		ex_regC_WE0 : out std_logic;
		rd_aluA_mux_Q0 : in std_logic;
		rd_aluB_mux_Q0 : in std_logic_vector(2 downto 0);
		rd_alu_op_Q0 : in std_logic_vector(5 downto 0);
		rd_amB_Q0 : in std_logic_vector(2 downto 0);
		rd_amC_Q0 : in std_logic;
		rd_cond_Q0 : in std_logic_vector(4 downto 0);
		rd_dest_en_mux_Q0 : in std_logic_vector(1 downto 0);
		rd_ie_flag_Q0 : in std_logic_vector(1 downto 0);
		rd_imm_D0 : out std_logic_vector(15 downto 0);
		rd_imm_Q0 : in std_logic_vector(15 downto 0);
		rd_jump_abs_D0 : out std_logic_vector(25 downto 0);
		rd_jump_abs_Q0 : in std_logic_vector(25 downto 0);
		rd_jump_rel_D0 : out std_logic_vector(13 downto 0);
		rd_jump_rel_Q0 : in std_logic_vector(13 downto 0);
		rd_mem_Q0 : in std_logic_vector(31 downto 0);
		rd_mem_rw_Q0 : in std_logic_vector(3 downto 0);
		rd_pc_Q0 : in std_logic_vector(31 downto 0);
		rd_rA_D0 : out std_logic_vector(4 downto 0);
		rd_rA_Q0 : in std_logic_vector(4 downto 0);
		rd_rB_D0 : out std_logic_vector(4 downto 0);
		rd_rB_Q0 : in std_logic_vector(4 downto 0);
		rd_rC_D0 : out std_logic_vector(4 downto 0);
		rd_rC_Q0 : in std_logic_vector(4 downto 0);
		rd_rW_D0 : out std_logic_vector(4 downto 0);
		rd_rW_Q0 : in std_logic_vector(4 downto 0);
		rd_store_D0 : out std_logic_vector(15 downto 0);
		rd_store_Q0 : in std_logic_vector(15 downto 0);
		regs_Q0 : in std_logic_vector(31 downto 0);
		regs_Q1 : in std_logic_vector(31 downto 0);
		regs_Q2 : in std_logic_vector(31 downto 0);
		regs_RA0 : out std_logic_vector(4 downto 0);
		regs_RA1 : out std_logic_vector(4 downto 0);
		regs_RA2 : out std_logic_vector(4 downto 0);
		regs_RE0 : out std_logic;
		regs_RE1 : out std_logic;
		regs_RE2 : out std_logic;
		wb_regs_W_Q0 : in std_logic_vector(31 downto 0);
		wb_regs_addrW_Q0 : in std_logic_vector(4 downto 0);
		wb_regs_we_Q0 : in std_logic	);
end entity codix_risc_ca_core_main_rd_rd_controller_semantics_t;

architecture RTL of codix_risc_ca_core_main_rd_rd_controller_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(2 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_3 : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_1_ex_aluB_int : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_2_ex_aluA_int : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_3_rc_int : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_4_rb_int : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_5_ra_int : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_6_regC_int : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_7_regB_int : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_8_regA_int : unsigned(31 downto 0);
	-- signal (inner)
	signal rd_rW_STATEMENT_AST_8574 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_rA_STATEMENT_AST_8587 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_rB_STATEMENT_AST_8600 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_rC_STATEMENT_AST_8613 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_jump_abs_STATEMENT_AST_8624 : unsigned(25 downto 0);
	-- signal (inner)
	signal rd_jump_rel_STATEMENT_AST_8635 : unsigned(13 downto 0);
	-- signal (inner)
	signal rd_store_STATEMENT_AST_8664 : unsigned(15 downto 0);
	-- signal (inner)
	signal rd_imm_STATEMENT_AST_8683 : unsigned(15 downto 0);
	-- signal (inner)
	signal lv_bb_8_regA_int_STATEMENT_AST_8700 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_7_regB_int_STATEMENT_AST_8729 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_6_regC_int_STATEMENT_AST_8758 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_5_ra_int_STATEMENT_AST_8787 : unsigned(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_3_STATEMENT_AST_8796 : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_4_rb_int_STATEMENT_AST_8805 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_4_rb_int_STATEMENT_AST_8822 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_4_rb_int_STATEMENT_AST_8834 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_4_rb_int_STATEMENT_AST_8849 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_4_rb_int_STATEMENT_AST_8882 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_4_rb_int_STATEMENT_AST_8896 : unsigned(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2_STATEMENT_AST_8911 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_3_rc_int_STATEMENT_AST_8920 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_3_rc_int_STATEMENT_AST_8934 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_3_rc_int_STATEMENT_AST_8952 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_2_ex_aluA_int_STATEMENT_AST_8966 : unsigned(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_8980 : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_1_ex_aluB_int_STATEMENT_AST_8989 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_1_ex_aluB_int_STATEMENT_AST_9003 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_1_ex_aluB_int_STATEMENT_AST_9018 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_1_ex_aluB_int_STATEMENT_AST_9034 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_1_ex_aluB_int_STATEMENT_AST_9048 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_1_ex_aluB_int_STATEMENT_AST_9060 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_1_ex_aluB_int_STATEMENT_AST_9074 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_mem_rw_STATEMENT_AST_9112 : unsigned(3 downto 0);
	-- signal (inner)
	signal ex_alu_op_STATEMENT_AST_9127 : unsigned(5 downto 0);
	-- signal (inner)
	signal ex_cond_STATEMENT_AST_9142 : unsigned(4 downto 0);
	-- signal (inner)
	signal ex_dest_en_mux_STATEMENT_AST_9157 : unsigned(1 downto 0);
	-- signal (inner)
	signal ex_ie_flag_STATEMENT_AST_9172 : unsigned(1 downto 0);
	-- signal (inner)
	signal ex_rW_STATEMENT_AST_9187 : unsigned(4 downto 0);
	-- signal (inner)
	signal ex_regA_STATEMENT_AST_9202 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_regB_STATEMENT_AST_9217 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_regC_STATEMENT_AST_9232 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_aluA_STATEMENT_AST_9247 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_aluB_STATEMENT_AST_9262 : unsigned(31 downto 0);

		-- datapath signals and constants
	signal lv_bb_4_rb_int_D0_8816_select_14586: std_logic_vector(2 downto 0);
	signal lv_bb_3_rc_int_D0_8928_select_14587: std_logic;
	signal lv_bb_1_ex_aluB_int_D0_8997_select_14588: std_logic_vector(2 downto 0);
	constant CONSTANT_0_8875: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_1_8812: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_10_8592: unsigned(3 downto 0) := to_unsigned(10, 4);
	constant CONSTANT_1023_8687: unsigned(9 downto 0) := to_unsigned(1023, 10);
	constant CONSTANT_1024_8649: unsigned(10 downto 0) := to_unsigned(1024, 11);
	constant CONSTANT_14_8651: unsigned(3 downto 0) := to_unsigned(14, 4);
	constant CONSTANT_14336_8654: unsigned(13 downto 0) := to_unsigned(14336, 14);
	constant CONSTANT_15_8579: unsigned(3 downto 0) := to_unsigned(15, 4);
	constant CONSTANT_2_8841: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_3_8903: unsigned(1 downto 0) := to_unsigned(3, 2);
	constant CONSTANT_31_8577: unsigned(4 downto 0) := to_unsigned(31, 5);
	constant CONSTANT_5_8605: unsigned(2 downto 0) := to_unsigned(5, 3);
	constant CONSTANT_64512_8690: unsigned(15 downto 0) := to_unsigned(64512, 16);
	constant CONSTANT_65504_8673: unsigned(15 downto 0) := to_unsigned(65504, 16);
	constant CONSTANT_67108863_8627: unsigned(25 downto 0) := to_unsigned(67108863, 26);
	constant CONSTANT_992_8643: unsigned(9 downto 0) := to_unsigned(992, 10);

begin
	-- child instances inside 'main_rd_rd_controller_semantics' functional unit:

		-- conversions for datapath
	lv_bb_4_rb_int_D0_8816_select_14586 <= std_logic_vector(codasip_tmp_var_3);
	lv_bb_3_rc_int_D0_8928_select_14587 <= codasip_tmp_var_2(0);
	lv_bb_1_ex_aluB_int_D0_8997_select_14588 <= std_logic_vector(codasip_tmp_var_1);

		-- Datapath code
	-- codix_risc_ca.acdl:1693: rd_rW.write((rd_mem.read()>>15)&31)
	rd_rW_STATEMENT_AST_8574 <= (resize(shift_right(unsigned(rd_mem_Q0), to_integer(CONSTANT_15_8579)), 5) and CONSTANT_31_8577);
	-- codix_risc_ca.acdl:1694: rd_rA.write((rd_mem.read()>>10)&31)
	rd_rA_STATEMENT_AST_8587 <= (resize(shift_right(unsigned(rd_mem_Q0), to_integer(CONSTANT_10_8592)), 5) and CONSTANT_31_8577);
	-- codix_risc_ca.acdl:1695: rd_rB.write((rd_mem.read()>>5)&31)
	rd_rB_STATEMENT_AST_8600 <= (resize(shift_right(unsigned(rd_mem_Q0), to_integer(CONSTANT_5_8605)), 5) and CONSTANT_31_8577);
	-- codix_risc_ca.acdl:1696: rd_rC.write((rd_mem.read())&31)
	rd_rC_STATEMENT_AST_8613 <= (unsigned(rd_mem_Q0(4 downto 0)) and CONSTANT_31_8577);
	-- codix_risc_ca.acdl:1698: rd_jump_abs.write(rd_mem.read()&67108863)
	rd_jump_abs_STATEMENT_AST_8624 <= (unsigned(rd_mem_Q0(25 downto 0)) and CONSTANT_67108863_8627);
	-- codix_risc_ca.acdl:1700: rd_jump_rel.write(((rd_mem.read()>>15)&(14336)) ...
	rd_jump_rel_STATEMENT_AST_8635 <= ((((resize(shift_right(unsigned(rd_mem_Q0), to_integer(CONSTANT_15_8579)), 14) and CONSTANT_14336_8654) or resize((resize(shift_right(unsigned(rd_mem_Q0), to_integer(CONSTANT_14_8651)), 11) and CONSTANT_1024_8649), 14)) or resize((resize(shift_right(unsigned(rd_mem_Q0), to_integer(CONSTANT_10_8592)), 10) and CONSTANT_992_8643), 14)) or resize((unsigned(rd_mem_Q0(4 downto 0)) and CONSTANT_31_8577), 14));
	-- codix_risc_ca.acdl:1701: rd_store.write(((rd_mem.read()>>10)&(65504))|(( ...
	rd_store_STATEMENT_AST_8664 <= ((resize(shift_right(unsigned(rd_mem_Q0), to_integer(CONSTANT_10_8592)), 16) and CONSTANT_65504_8673) or resize((resize(shift_right(unsigned(rd_mem_Q0), to_integer(CONSTANT_5_8605)), 5) and CONSTANT_31_8577), 16));
	-- codix_risc_ca.acdl:1702: rd_imm.write(((rd_mem.read()>>10)&(64512))|((rd ...
	rd_imm_STATEMENT_AST_8683 <= ((resize(shift_right(unsigned(rd_mem_Q0), to_integer(CONSTANT_10_8592)), 16) and CONSTANT_64512_8690) or resize((unsigned(rd_mem_Q0(9 downto 0)) and CONSTANT_1023_8687), 16));
	-- codix_risc_ca.acdl:1707: lv_bb_8_regA_int=((wb_regs_addrW.read()==rd_rA. ...
	lv_bb_8_regA_int_STATEMENT_AST_8700 <= 
		unsigned(wb_regs_W_Q0) when (((unsigned(wb_regs_addrW_Q0) = unsigned(rd_rA_Q0)) and (wb_regs_we_Q0 /= '0'))) else
		unsigned(regs_Q0);
	-- codix_risc_ca.acdl:1708: lv_bb_7_regB_int=((wb_regs_addrW.read()==rd_rB. ...
	lv_bb_7_regB_int_STATEMENT_AST_8729 <= 
		unsigned(wb_regs_W_Q0) when (((unsigned(wb_regs_addrW_Q0) = unsigned(rd_rB_Q0)) and (wb_regs_we_Q0 /= '0'))) else
		unsigned(regs_Q1);
	-- codix_risc_ca.acdl:1709: lv_bb_6_regC_int=((wb_regs_addrW.read()==rd_rC. ...
	lv_bb_6_regC_int_STATEMENT_AST_8758 <= 
		unsigned(wb_regs_W_Q0) when (((unsigned(wb_regs_addrW_Q0) = unsigned(rd_rC_Q0)) and (wb_regs_we_Q0 /= '0'))) else
		unsigned(regs_Q2);
	-- codix_risc_ca.acdl:1712: lv_bb_5_ra_int=lv_bb_8_regA_int
	lv_bb_5_ra_int_STATEMENT_AST_8787 <= lv_bb_8_regA_int;
	-- codix_risc_ca.acdl:1734: codasip_tmp_var_3=rd_amB.read()
	codasip_tmp_var_3_STATEMENT_AST_8796 <= unsigned(rd_amB_Q0);
	-- codix_risc_ca.acdl:1720: lv_bb_4_rb_int=((unsigned int  )(lv_bb_7_regB_i ...
	lv_bb_4_rb_int_STATEMENT_AST_8805 <= resize(shift_left(resize(lv_bb_7_regB_int, 33), to_integer(CONSTANT_1_8812)), 32);
	-- codix_risc_ca.acdl:1717: lv_bb_4_rb_int=lv_bb_7_regB_int
	lv_bb_4_rb_int_STATEMENT_AST_8822 <= lv_bb_7_regB_int;
	-- codix_risc_ca.acdl:1723: lv_bb_4_rb_int=((unsigned int  )(lv_bb_7_regB_i ...
	lv_bb_4_rb_int_STATEMENT_AST_8834 <= resize(shift_left(resize(lv_bb_7_regB_int, 34), to_integer(CONSTANT_2_8841)), 32);
	-- codix_risc_ca.acdl:1732: lv_bb_4_rb_int=0
	lv_bb_4_rb_int_STATEMENT_AST_8849 <= resize(CONSTANT_0_8875, 32);
	-- codix_risc_ca.acdl:1729: lv_bb_4_rb_int=((unsigned int  )((codasip::coda ...
	lv_bb_4_rb_int_STATEMENT_AST_8882 <= unsigned(resize(signed(rd_rB_Q0), 32));
	-- codix_risc_ca.acdl:1726: lv_bb_4_rb_int=((unsigned int  )(lv_bb_7_regB_i ...
	lv_bb_4_rb_int_STATEMENT_AST_8896 <= resize(shift_left(resize(lv_bb_7_regB_int, 35), to_integer(CONSTANT_3_8903)), 32);
	-- codix_risc_ca.acdl:1747: codasip_tmp_var_2=rd_amC.read()
	codasip_tmp_var_2_STATEMENT_AST_8911(0) <= rd_amC_Q0;
	-- codix_risc_ca.acdl:1739: lv_bb_3_rc_int=lv_bb_6_regC_int
	lv_bb_3_rc_int_STATEMENT_AST_8920 <= lv_bb_6_regC_int;
	-- codix_risc_ca.acdl:1745: lv_bb_3_rc_int=0
	lv_bb_3_rc_int_STATEMENT_AST_8934 <= resize(CONSTANT_0_8875, 32);
	-- codix_risc_ca.acdl:1742: lv_bb_3_rc_int=((unsigned int  )((codasip::coda ...
	lv_bb_3_rc_int_STATEMENT_AST_8952 <= unsigned(resize(signed(rd_rC_Q0), 32));
	-- codix_risc_ca.acdl:1751: lv_bb_2_ex_aluA_int=(rd_aluA_mux.read()==0) ? ( ...
	lv_bb_2_ex_aluA_int_STATEMENT_AST_8966 <= 
		lv_bb_5_ra_int when ((rd_aluA_mux_Q0 = CONSTANT_0_8875(0))) else
		unsigned(rd_pc_Q0);
	-- codix_risc_ca.acdl:1776: codasip_tmp_var_1=rd_aluB_mux.read()
	codasip_tmp_var_1_STATEMENT_AST_8980 <= unsigned(rd_aluB_mux_Q0);
	-- codix_risc_ca.acdl:1756: lv_bb_1_ex_aluB_int=lv_bb_4_rb_int
	lv_bb_1_ex_aluB_int_STATEMENT_AST_8989 <= lv_bb_4_rb_int;
	-- codix_risc_ca.acdl:1759: lv_bb_1_ex_aluB_int=((unsigned int  )(rd_jump_a ...
	lv_bb_1_ex_aluB_int_STATEMENT_AST_9003 <= resize(shift_left(unsigned(resize(unsigned(rd_jump_abs_Q0), 28)), to_integer(CONSTANT_2_8841)), 32);
	-- codix_risc_ca.acdl:1762: lv_bb_1_ex_aluB_int=((unsigned int  )(((codasip ...
	lv_bb_1_ex_aluB_int_STATEMENT_AST_9018 <= unsigned(resize(shift_left(resize(signed(rd_jump_rel_Q0), 16), to_integer(CONSTANT_2_8841)), 32));
	-- codix_risc_ca.acdl:1765: lv_bb_1_ex_aluB_int=((unsigned int  )((short  ) ...
	lv_bb_1_ex_aluB_int_STATEMENT_AST_9034 <= unsigned(resize(signed(rd_imm_Q0), 32));
	-- codix_risc_ca.acdl:1768: lv_bb_1_ex_aluB_int=rd_imm.read()
	lv_bb_1_ex_aluB_int_STATEMENT_AST_9048 <= unsigned(resize(unsigned(rd_imm_Q0), 32));
	-- codix_risc_ca.acdl:1771: lv_bb_1_ex_aluB_int=((unsigned int  )((short  ) ...
	lv_bb_1_ex_aluB_int_STATEMENT_AST_9060 <= unsigned(resize(signed(rd_store_Q0), 32));
	-- codix_risc_ca.acdl:1774: lv_bb_1_ex_aluB_int=0
	lv_bb_1_ex_aluB_int_STATEMENT_AST_9074 <= resize(CONSTANT_0_8875, 32);
	-- codix_risc_ca.acdl:1779: ex_mem_rw.write(rd_mem_rw.read())
	ex_mem_rw_STATEMENT_AST_9112 <= unsigned(rd_mem_rw_Q0);
	-- codix_risc_ca.acdl:1780: ex_alu_op.write(rd_alu_op.read())
	ex_alu_op_STATEMENT_AST_9127 <= unsigned(rd_alu_op_Q0);
	-- codix_risc_ca.acdl:1781: ex_cond.write(rd_cond.read())
	ex_cond_STATEMENT_AST_9142 <= unsigned(rd_cond_Q0);
	-- codix_risc_ca.acdl:1782: ex_dest_en_mux.write(rd_dest_en_mux.read())
	ex_dest_en_mux_STATEMENT_AST_9157 <= unsigned(rd_dest_en_mux_Q0);
	-- codix_risc_ca.acdl:1783: ex_ie_flag.write(rd_ie_flag.read())
	ex_ie_flag_STATEMENT_AST_9172 <= unsigned(rd_ie_flag_Q0);
	-- codix_risc_ca.acdl:1786: ex_rW.write(rd_rW.read())
	ex_rW_STATEMENT_AST_9187 <= unsigned(rd_rW_Q0);
	-- codix_risc_ca.acdl:1788: ex_regA.write(lv_bb_5_ra_int)
	ex_regA_STATEMENT_AST_9202 <= lv_bb_5_ra_int;
	-- codix_risc_ca.acdl:1789: ex_regB.write(lv_bb_4_rb_int)
	ex_regB_STATEMENT_AST_9217 <= lv_bb_4_rb_int;
	-- codix_risc_ca.acdl:1790: ex_regC.write(lv_bb_3_rc_int)
	ex_regC_STATEMENT_AST_9232 <= lv_bb_3_rc_int;
	-- codix_risc_ca.acdl:1792: ex_aluA.write(lv_bb_2_ex_aluA_int)
	ex_aluA_STATEMENT_AST_9247 <= lv_bb_2_ex_aluA_int;
	-- codix_risc_ca.acdl:1793: ex_aluB.write(lv_bb_1_ex_aluB_int)
	ex_aluB_STATEMENT_AST_9262 <= lv_bb_1_ex_aluB_int;
	rd_rW_D0 <= std_logic_vector(rd_rW_STATEMENT_AST_8574);
	rd_rA_D0 <= std_logic_vector(rd_rA_STATEMENT_AST_8587);
	rd_rB_D0 <= std_logic_vector(rd_rB_STATEMENT_AST_8600);
	rd_rC_D0 <= std_logic_vector(rd_rC_STATEMENT_AST_8613);
	rd_jump_abs_D0 <= std_logic_vector(rd_jump_abs_STATEMENT_AST_8624);
	rd_jump_rel_D0 <= std_logic_vector(rd_jump_rel_STATEMENT_AST_8635);
	rd_store_D0 <= std_logic_vector(rd_store_STATEMENT_AST_8664);
	rd_imm_D0 <= std_logic_vector(rd_imm_STATEMENT_AST_8683);
	regs_RE0 <= CONSTANT_1_8812(0) when ((ACT = CONSTANT_1_8812(0))) else
		CONSTANT_0_8875(0);
	regs_RA0 <= rd_rA_Q0;
	lv_bb_8_regA_int <= lv_bb_8_regA_int_STATEMENT_AST_8700;
	regs_RE1 <= CONSTANT_1_8812(0) when ((ACT = CONSTANT_1_8812(0))) else
		CONSTANT_0_8875(0);
	regs_RA1 <= rd_rB_Q0;
	lv_bb_7_regB_int <= lv_bb_7_regB_int_STATEMENT_AST_8729;
	regs_RE2 <= CONSTANT_1_8812(0) when ((ACT = CONSTANT_1_8812(0))) else
		CONSTANT_0_8875(0);
	regs_RA2 <= rd_rC_Q0;
	lv_bb_6_regC_int <= lv_bb_6_regC_int_STATEMENT_AST_8758;
	lv_bb_5_ra_int <= lv_bb_5_ra_int_STATEMENT_AST_8787;
	codasip_tmp_var_3 <= codasip_tmp_var_3_STATEMENT_AST_8796;
	with lv_bb_4_rb_int_D0_8816_select_14586 select
		lv_bb_4_rb_int <= 
			lv_bb_4_rb_int_STATEMENT_AST_8822 when "000", 
			lv_bb_4_rb_int_STATEMENT_AST_8805 when "001", 
			lv_bb_4_rb_int_STATEMENT_AST_8834 when "010", 
			lv_bb_4_rb_int_STATEMENT_AST_8896 when "011", 
			lv_bb_4_rb_int_STATEMENT_AST_8882 when "111", 
			lv_bb_4_rb_int_STATEMENT_AST_8849 when others;
	codasip_tmp_var_2 <= codasip_tmp_var_2_STATEMENT_AST_8911;
	with lv_bb_3_rc_int_D0_8928_select_14587 select
		lv_bb_3_rc_int <= 
			lv_bb_3_rc_int_STATEMENT_AST_8920 when '0', 
			lv_bb_3_rc_int_STATEMENT_AST_8952 when '1', 
			lv_bb_3_rc_int_STATEMENT_AST_8934 when others;
	lv_bb_2_ex_aluA_int <= lv_bb_2_ex_aluA_int_STATEMENT_AST_8966;
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_8980;
	with lv_bb_1_ex_aluB_int_D0_8997_select_14588 select
		lv_bb_1_ex_aluB_int <= 
			lv_bb_1_ex_aluB_int_STATEMENT_AST_8989 when "000", 
			lv_bb_1_ex_aluB_int_STATEMENT_AST_9048 when "001", 
			lv_bb_1_ex_aluB_int_STATEMENT_AST_9034 when "010", 
			lv_bb_1_ex_aluB_int_STATEMENT_AST_9003 when "011", 
			lv_bb_1_ex_aluB_int_STATEMENT_AST_9018 when "100", 
			lv_bb_1_ex_aluB_int_STATEMENT_AST_9060 when "101", 
			lv_bb_1_ex_aluB_int_STATEMENT_AST_9074 when others;
	ex_mem_rw_WE0 <= CONSTANT_1_8812(0) when ((ACT = CONSTANT_1_8812(0))) else
		CONSTANT_0_8875(0);
	ex_mem_rw_D0 <= std_logic_vector(ex_mem_rw_STATEMENT_AST_9112);
	ex_alu_op_WE0 <= CONSTANT_1_8812(0) when ((ACT = CONSTANT_1_8812(0))) else
		CONSTANT_0_8875(0);
	ex_alu_op_D0 <= std_logic_vector(ex_alu_op_STATEMENT_AST_9127);
	ex_cond_WE0 <= CONSTANT_1_8812(0) when ((ACT = CONSTANT_1_8812(0))) else
		CONSTANT_0_8875(0);
	ex_cond_D0 <= std_logic_vector(ex_cond_STATEMENT_AST_9142);
	ex_dest_en_mux_WE0 <= CONSTANT_1_8812(0) when ((ACT = CONSTANT_1_8812(0))) else
		CONSTANT_0_8875(0);
	ex_dest_en_mux_D0 <= std_logic_vector(ex_dest_en_mux_STATEMENT_AST_9157);
	ex_ie_flag_WE0 <= CONSTANT_1_8812(0) when ((ACT = CONSTANT_1_8812(0))) else
		CONSTANT_0_8875(0);
	ex_ie_flag_D0 <= std_logic_vector(ex_ie_flag_STATEMENT_AST_9172);
	ex_rW_WE0 <= CONSTANT_1_8812(0) when ((ACT = CONSTANT_1_8812(0))) else
		CONSTANT_0_8875(0);
	ex_rW_D0 <= std_logic_vector(ex_rW_STATEMENT_AST_9187);
	ex_regA_WE0 <= CONSTANT_1_8812(0) when ((ACT = CONSTANT_1_8812(0))) else
		CONSTANT_0_8875(0);
	ex_regA_D0 <= std_logic_vector(ex_regA_STATEMENT_AST_9202);
	ex_regB_WE0 <= CONSTANT_1_8812(0) when ((ACT = CONSTANT_1_8812(0))) else
		CONSTANT_0_8875(0);
	ex_regB_D0 <= std_logic_vector(ex_regB_STATEMENT_AST_9217);
	ex_regC_WE0 <= CONSTANT_1_8812(0) when ((ACT = CONSTANT_1_8812(0))) else
		CONSTANT_0_8875(0);
	ex_regC_D0 <= std_logic_vector(ex_regC_STATEMENT_AST_9232);
	ex_aluA_WE0 <= CONSTANT_1_8812(0) when ((ACT = CONSTANT_1_8812(0))) else
		CONSTANT_0_8875(0);
	ex_aluA_D0 <= std_logic_vector(ex_aluA_STATEMENT_AST_9247);
	ex_aluB_WE0 <= CONSTANT_1_8812(0) when ((ACT = CONSTANT_1_8812(0))) else
		CONSTANT_0_8875(0);
	ex_aluB_D0 <= std_logic_vector(ex_aluB_STATEMENT_AST_9262);

end architecture RTL;


