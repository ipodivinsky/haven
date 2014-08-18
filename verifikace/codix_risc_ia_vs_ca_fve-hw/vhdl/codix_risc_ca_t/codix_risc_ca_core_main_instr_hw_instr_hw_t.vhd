--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of instruction decoder 'codix_risc_ca_core_main_instr_hw_instr_hw_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_instr_hw_instr_hw_t is
	port (
		ACT : in std_logic;
		codasip_attribute_L_main_0_instr_hw_srcB_am_imm3_val_0_D0 : out std_logic_vector(2 downto 0);
		codasip_attribute_L_main_0_instr_hw_srcB_op_imm1_val_0_D0 : out std_logic;
		codasip_attribute_L_main_0_instr_hw_srcC_op_imm1_val_0_D0 : out std_logic;
		id_instr_Q0 : in std_logic_vector(11 downto 0);
		invalid_instruction : out std_logic;
		main_0_imm1_srcB_op_instr_hw_0_return_ACT : out std_logic;
		main_0_imm1_srcC_op_instr_hw_0_return_ACT : out std_logic;
		main_0_imm3_srcB_am_instr_hw_0_return_ACT : out std_logic;
		main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_0_op_add_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_addadd_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_addi_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_addmul_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_addsub_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_and_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_andi_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_ashr_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_ashri_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_binand_cond_instr_hw_0_return_ACT : out std_logic;
		main_0_op_binnand_cond_instr_hw_0_return_ACT : out std_logic;
		main_0_op_call_exc_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_call_int_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_call_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_call_reg_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_ctlz_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_cttz_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_eq_cond_instr_hw_0_return_ACT : out std_logic;
		main_0_op_get_status_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_halt_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_int_dis_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_int_en_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_jump_ie_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_jump_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_jump_reg_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_ld_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_ldbs_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_ldbsx_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_ldbu_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_ldbux_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_ldhs_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_ldhsx_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_ldhu_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_ldhux_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_ldx_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_logand_cond_instr_hw_0_return_ACT : out std_logic;
		main_0_op_lognand_cond_instr_hw_0_return_ACT : out std_logic;
		main_0_op_lognor_cond_instr_hw_0_return_ACT : out std_logic;
		main_0_op_logor_cond_instr_hw_0_return_ACT : out std_logic;
		main_0_op_lshr_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_lshri_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_lui_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_move_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_mul_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_mulsi_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_mului_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_ne_cond_instr_hw_0_return_ACT : out std_logic;
		main_0_op_nor_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_nori_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_or_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_ori_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_printreg_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_select_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_set_status_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_sext16_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_sext8_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_sge_cond_instr_hw_0_return_ACT : out std_logic;
		main_0_op_sgt_cond_instr_hw_0_return_ACT : out std_logic;
		main_0_op_shl_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_shli_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_sle_cond_instr_hw_0_return_ACT : out std_logic;
		main_0_op_slt_cond_instr_hw_0_return_ACT : out std_logic;
		main_0_op_st_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_stb_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_stbx_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_sth_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_sthx_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_stx_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_sub_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_subadd_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_subi_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_submul_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_subsub_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_test_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_uge_cond_instr_hw_0_return_ACT : out std_logic;
		main_0_op_ugt_cond_instr_hw_0_return_ACT : out std_logic;
		main_0_op_ule_cond_instr_hw_0_return_ACT : out std_logic;
		main_0_op_ult_cond_instr_hw_0_return_ACT : out std_logic;
		main_0_op_xor_operation_instr_hw_0_return_ACT : out std_logic;
		main_0_op_xori_operation_instr_hw_0_return_ACT : out std_logic
	);
end entity codix_risc_ca_core_main_instr_hw_instr_hw_t;

architecture RTL of codix_risc_ca_core_main_instr_hw_instr_hw_t is
	-- signal (inner)
	signal s_invalid_instruction : unsigned(0 downto 0);
	-- signal (inner)
	signal INSTRUCTION : unsigned(11 downto 0);
	-- signal (inner)
	signal cs_0 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_1 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_2 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_3 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_4 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_5 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_6 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_7 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_8 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_9 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_10 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_11 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_12 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_13 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_14 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_15 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_16 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_17 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_18 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_19 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_20 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_21 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_22 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_23 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_24 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_25 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_26 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_27 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_28 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_29 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_30 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_31 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_32 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_33 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_34 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_35 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_36 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_37 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_38 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_39 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_40 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_41 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_42 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_43 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_44 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_45 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_46 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_47 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_48 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_49 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_50 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_51 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_52 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_53 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_54 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_55 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_56 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_57 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_58 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_59 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_60 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_61 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_62 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_63 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_64 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_65 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_66 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_67 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_68 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_69 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_70 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_71 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_72 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_73 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_74 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_75 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_76 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_77 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_78 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_79 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_80 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_81 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_82 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_83 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_84 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_85 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_86 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_87 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_88 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_89 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_90 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_91 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_92 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_93 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_94 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_95 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_96 : unsigned(0 downto 0);
	-- signal (inner)
	signal cs_97 : unsigned(0 downto 0);
	-- signal (inner)
	signal vs_0 : unsigned(0 downto 0);

		-- datapath signals and constants
	signal tmp_conv_sign_15159: unsigned(0 downto 0);
	signal tmp_conv_sign_15160: unsigned(0 downto 0);
	signal tmp_conv_sign_15161: unsigned(0 downto 0);
	constant CONSTANT_0_10746: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_10749: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_11030: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_10924: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_10745: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_1_11085: unsigned(3 downto 0) := to_unsigned(1, 4);
	constant CONSTANT_1_11019: unsigned(4 downto 0) := to_unsigned(1, 5);
	constant CONSTANT_1_11426: unsigned(5 downto 0) := to_unsigned(1, 6);
	constant CONSTANT_10_11155: unsigned(3 downto 0) := to_unsigned(10, 4);
	constant CONSTANT_10_11521: unsigned(5 downto 0) := to_unsigned(10, 6);
	constant CONSTANT_11_11162: unsigned(3 downto 0) := to_unsigned(11, 4);
	constant CONSTANT_11_11211: unsigned(4 downto 0) := to_unsigned(11, 5);
	constant CONSTANT_11_10971: unsigned(5 downto 0) := to_unsigned(11, 6);
	constant CONSTANT_12_11169: unsigned(3 downto 0) := to_unsigned(12, 4);
	constant CONSTANT_12_11216: unsigned(4 downto 0) := to_unsigned(12, 5);
	constant CONSTANT_12_10995: unsigned(5 downto 0) := to_unsigned(12, 6);
	constant CONSTANT_13_11176: unsigned(3 downto 0) := to_unsigned(13, 4);
	constant CONSTANT_13_11259: unsigned(4 downto 0) := to_unsigned(13, 5);
	constant CONSTANT_13_11002: unsigned(5 downto 0) := to_unsigned(13, 6);
	constant CONSTANT_130_11354: unsigned(7 downto 0) := to_unsigned(130, 8);
	constant CONSTANT_132_11303: unsigned(7 downto 0) := to_unsigned(132, 8);
	constant CONSTANT_134_10867: unsigned(7 downto 0) := to_unsigned(134, 8);
	constant CONSTANT_136_10794: unsigned(7 downto 0) := to_unsigned(136, 8);
	constant CONSTANT_138_10883: unsigned(7 downto 0) := to_unsigned(138, 8);
	constant CONSTANT_14_11183: unsigned(3 downto 0) := to_unsigned(14, 4);
	constant CONSTANT_14_10758: unsigned(5 downto 0) := to_unsigned(14, 6);
	constant CONSTANT_146_11506: unsigned(7 downto 0) := to_unsigned(146, 8);
	constant CONSTANT_147_10891: unsigned(7 downto 0) := to_unsigned(147, 8);
	constant CONSTANT_15_11197: unsigned(3 downto 0) := to_unsigned(15, 4);
	constant CONSTANT_152_10804: unsigned(7 downto 0) := to_unsigned(152, 8);
	constant CONSTANT_16_11057: unsigned(5 downto 0) := to_unsigned(16, 6);
	constant CONSTANT_163_11714: unsigned(7 downto 0) := to_unsigned(163, 8);
	constant CONSTANT_164_11719: unsigned(7 downto 0) := to_unsigned(164, 8);
	constant CONSTANT_165_11596: unsigned(7 downto 0) := to_unsigned(165, 8);
	constant CONSTANT_168_10848: unsigned(7 downto 0) := to_unsigned(168, 8);
	constant CONSTANT_17_11064: unsigned(5 downto 0) := to_unsigned(17, 6);
	constant CONSTANT_19_10768: unsigned(5 downto 0) := to_unsigned(19, 6);
	constant CONSTANT_2_10786: unsigned(2 downto 0) := to_unsigned(2, 3);
	constant CONSTANT_2_11092: unsigned(3 downto 0) := to_unsigned(2, 4);
	constant CONSTANT_2_10931: unsigned(4 downto 0) := to_unsigned(2, 5);
	constant CONSTANT_2_11700: unsigned(5 downto 0) := to_unsigned(2, 6);
	constant CONSTANT_20_10980: unsigned(5 downto 0) := to_unsigned(20, 6);
	constant CONSTANT_21_11231: unsigned(5 downto 0) := to_unsigned(21, 6);
	constant CONSTANT_22_11204: unsigned(5 downto 0) := to_unsigned(22, 6);
	constant CONSTANT_23_11238: unsigned(5 downto 0) := to_unsigned(23, 6);
	constant CONSTANT_24_11245: unsigned(5 downto 0) := to_unsigned(24, 6);
	constant CONSTANT_25_11252: unsigned(5 downto 0) := to_unsigned(25, 6);
	constant CONSTANT_256_11377: unsigned(8 downto 0) := to_unsigned(256, 9);
	constant CONSTANT_257_11384: unsigned(8 downto 0) := to_unsigned(257, 9);
	constant CONSTANT_258_11391: unsigned(8 downto 0) := to_unsigned(258, 9);
	constant CONSTANT_259_11398: unsigned(8 downto 0) := to_unsigned(259, 9);
	constant CONSTANT_26_11271: unsigned(5 downto 0) := to_unsigned(26, 6);
	constant CONSTANT_260_11405: unsigned(8 downto 0) := to_unsigned(260, 9);
	constant CONSTANT_261_11412: unsigned(8 downto 0) := to_unsigned(261, 9);
	constant CONSTANT_262_11299: unsigned(8 downto 0) := to_unsigned(262, 9);
	constant CONSTANT_264_11433: unsigned(8 downto 0) := to_unsigned(264, 9);
	constant CONSTANT_265_11440: unsigned(8 downto 0) := to_unsigned(265, 9);
	constant CONSTANT_266_11308: unsigned(8 downto 0) := to_unsigned(266, 9);
	constant CONSTANT_27_11278: unsigned(5 downto 0) := to_unsigned(27, 6);
	constant CONSTANT_272_11481: unsigned(8 downto 0) := to_unsigned(272, 9);
	constant CONSTANT_274_11488: unsigned(8 downto 0) := to_unsigned(274, 9);
	constant CONSTANT_275_11313: unsigned(8 downto 0) := to_unsigned(275, 9);
	constant CONSTANT_276_10799: unsigned(8 downto 0) := to_unsigned(276, 9);
	constant CONSTANT_28_10778: unsigned(5 downto 0) := to_unsigned(28, 6);
	constant CONSTANT_288_11514: unsigned(8 downto 0) := to_unsigned(288, 9);
	constant CONSTANT_289_11528: unsigned(8 downto 0) := to_unsigned(289, 9);
	constant CONSTANT_290_11535: unsigned(8 downto 0) := to_unsigned(290, 9);
	constant CONSTANT_291_11542: unsigned(8 downto 0) := to_unsigned(291, 9);
	constant CONSTANT_292_11549: unsigned(8 downto 0) := to_unsigned(292, 9);
	constant CONSTANT_293_11556: unsigned(8 downto 0) := to_unsigned(293, 9);
	constant CONSTANT_3_11099: unsigned(3 downto 0) := to_unsigned(3, 4);
	constant CONSTANT_3_11012: unsigned(4 downto 0) := to_unsigned(3, 5);
	constant CONSTANT_3_11190: unsigned(5 downto 0) := to_unsigned(3, 6);
	constant CONSTANT_304_11575: unsigned(8 downto 0) := to_unsigned(304, 9);
	constant CONSTANT_305_11582: unsigned(8 downto 0) := to_unsigned(305, 9);
	constant CONSTANT_306_10809: unsigned(8 downto 0) := to_unsigned(306, 9);
	constant CONSTANT_32_10817: unsigned(5 downto 0) := to_unsigned(32, 6);
	constant CONSTANT_325_11734: unsigned(8 downto 0) := to_unsigned(325, 9);
	constant CONSTANT_326_11707: unsigned(8 downto 0) := to_unsigned(326, 9);
	constant CONSTANT_327_11741: unsigned(8 downto 0) := to_unsigned(327, 9);
	constant CONSTANT_328_11748: unsigned(8 downto 0) := to_unsigned(328, 9);
	constant CONSTANT_329_11755: unsigned(8 downto 0) := to_unsigned(329, 9);
	constant CONSTANT_330_11615: unsigned(8 downto 0) := to_unsigned(330, 9);
	constant CONSTANT_331_10830: unsigned(8 downto 0) := to_unsigned(331, 9);
	constant CONSTANT_332_10835: unsigned(8 downto 0) := to_unsigned(332, 9);
	constant CONSTANT_336_11636: unsigned(8 downto 0) := to_unsigned(336, 9);
	constant CONSTANT_339_11674: unsigned(8 downto 0) := to_unsigned(339, 9);
	constant CONSTANT_341_11640: unsigned(8 downto 0) := to_unsigned(341, 9);
	constant CONSTANT_342_10840: unsigned(8 downto 0) := to_unsigned(342, 9);
	constant CONSTANT_343_11762: unsigned(8 downto 0) := to_unsigned(343, 9);
	constant CONSTANT_344_11678: unsigned(8 downto 0) := to_unsigned(344, 9);
	constant CONSTANT_4_11106: unsigned(3 downto 0) := to_unsigned(4, 4);
	constant CONSTANT_4_10908: unsigned(4 downto 0) := to_unsigned(4, 5);
	constant CONSTANT_4_10943: unsigned(5 downto 0) := to_unsigned(4, 6);
	constant CONSTANT_5_10773: unsigned(3 downto 0) := to_unsigned(5, 4);
	constant CONSTANT_5_10950: unsigned(5 downto 0) := to_unsigned(5, 6);
	constant CONSTANT_6_11127: unsigned(3 downto 0) := to_unsigned(6, 4);
	constant CONSTANT_6_10753: unsigned(4 downto 0) := to_unsigned(6, 5);
	constant CONSTANT_6_10935: unsigned(5 downto 0) := to_unsigned(6, 6);
	constant CONSTANT_64_11350: unsigned(6 downto 0) := to_unsigned(64, 7);
	constant CONSTANT_66_10825: unsigned(6 downto 0) := to_unsigned(66, 7);
	constant CONSTANT_68_10875: unsigned(6 downto 0) := to_unsigned(68, 7);
	constant CONSTANT_7_10896: unsigned(2 downto 0) := to_unsigned(7, 3);
	constant CONSTANT_7_11134: unsigned(3 downto 0) := to_unsigned(7, 4);
	constant CONSTANT_7_11113: unsigned(5 downto 0) := to_unsigned(7, 6);
	constant CONSTANT_72_11502: unsigned(6 downto 0) := to_unsigned(72, 7);
	constant CONSTANT_8_11141: unsigned(3 downto 0) := to_unsigned(8, 4);
	constant CONSTANT_8_10763: unsigned(4 downto 0) := to_unsigned(8, 5);
	constant CONSTANT_8_11608: unsigned(5 downto 0) := to_unsigned(8, 6);
	constant CONSTANT_83_10859: unsigned(6 downto 0) := to_unsigned(83, 7);
	constant CONSTANT_9_11148: unsigned(3 downto 0) := to_unsigned(9, 4);
	constant CONSTANT_9_11285: unsigned(5 downto 0) := to_unsigned(9, 6);

begin
		-- conversions for datapath
	tmp_conv_sign_15159 <= INSTRUCTION(5 downto 5);
	tmp_conv_sign_15160 <= INSTRUCTION(5 downto 5);
	tmp_conv_sign_15161 <= INSTRUCTION(4 downto 4);

		-- Datapath code
	invalid_instruction <= s_invalid_instruction(0);
	INSTRUCTION <= unsigned(id_instr_Q0);
	cs_0 <= CONSTANT_1_10745 when (((((((((((((((((((((((((INSTRUCTION(11 downto 9) = CONSTANT_0_10749) or (INSTRUCTION(11 downto 7) = CONSTANT_6_10753)) or (INSTRUCTION(11 downto 6) = CONSTANT_14_10758)) or (INSTRUCTION(11 downto 7) = CONSTANT_8_10763)) or (INSTRUCTION(11 downto 6) = CONSTANT_19_10768)) or (INSTRUCTION(11 downto 8) = CONSTANT_5_10773)) or (INSTRUCTION(11 downto 6) = CONSTANT_28_10778)) or (INSTRUCTION(11 downto 11) & INSTRUCTION(9 downto 8) = CONSTANT_2_10786)) or (INSTRUCTION(11 downto 5) & INSTRUCTION(3 downto 3) = CONSTANT_136_10794)) or (INSTRUCTION(11 downto 3) = CONSTANT_276_10799)) or (INSTRUCTION(11 downto 4) = CONSTANT_152_10804)) or (INSTRUCTION(11 downto 3) = CONSTANT_306_10809)) or (INSTRUCTION(11 downto 9) & INSTRUCTION(7 downto 5) = CONSTANT_32_10817)) or (INSTRUCTION(11 downto 9) & INSTRUCTION(7 downto 4) = CONSTANT_66_10825)) or (INSTRUCTION(11 downto 3) = CONSTANT_331_10830)) or (INSTRUCTION(11 downto 3) = CONSTANT_332_10835)) or (INSTRUCTION(11 downto 3) = CONSTANT_342_10840)) or (INSTRUCTION(11 downto 7) & INSTRUCTION(5 downto 3) = CONSTANT_168_10848)) or (INSTRUCTION(11 downto 8) & INSTRUCTION(6 downto 5) & INSTRUCTION(3 downto 3) = CONSTANT_83_10859)) or (INSTRUCTION(11 downto 10) & INSTRUCTION(8 downto 3) = CONSTANT_134_10867)) or (INSTRUCTION(11 downto 10) & INSTRUCTION(8 downto 4) = CONSTANT_68_10875)) or (INSTRUCTION(11 downto 10) & INSTRUCTION(8 downto 3) = CONSTANT_138_10883)) or (INSTRUCTION(11 downto 10) & INSTRUCTION(8 downto 3) = CONSTANT_147_10891)) or (INSTRUCTION(11 downto 9) = CONSTANT_7_10896))) else
		CONSTANT_0_10746;
	cs_1 <= CONSTANT_1_10745 when ((((INSTRUCTION(11 downto 9) = CONSTANT_0_10749) or (INSTRUCTION(11 downto 7) = CONSTANT_4_10908)) or (INSTRUCTION(11 downto 9) & INSTRUCTION(7 downto 6) = CONSTANT_6_10753))) else
		CONSTANT_0_10746;
	cs_10 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_0_10924)) else
		CONSTANT_0_10746;
	cs_11 <= CONSTANT_1_10745 when (((INSTRUCTION(11 downto 7) = CONSTANT_2_10931) or (INSTRUCTION(11 downto 6) = CONSTANT_6_10935))) else
		CONSTANT_0_10746;
	cs_12 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_4_10943)) else
		CONSTANT_0_10746;
	cs_13 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_5_10950)) else
		CONSTANT_0_10746;
	cs_14 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_6_10935)) else
		CONSTANT_0_10746;
	cs_15 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_14_10758)) else
		CONSTANT_0_10746;
	cs_16 <= CONSTANT_1_10745 when ((((INSTRUCTION(11 downto 6) = CONSTANT_11_10971) or (INSTRUCTION(11 downto 7) = CONSTANT_6_10753)) or (INSTRUCTION(11 downto 6) = CONSTANT_20_10980))) else
		CONSTANT_0_10746;
	cs_17 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_11_10971)) else
		CONSTANT_0_10746;
	cs_18 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_12_10995)) else
		CONSTANT_0_10746;
	cs_19 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_13_11002)) else
		CONSTANT_0_10746;
	cs_2 <= CONSTANT_1_10745 when ((((INSTRUCTION(11 downto 9) & INSTRUCTION(7 downto 6) = CONSTANT_3_11012) or (INSTRUCTION(11 downto 10) & INSTRUCTION(8 downto 6) = CONSTANT_1_11019)) or (INSTRUCTION(11 downto 10) & INSTRUCTION(8 downto 8) & INSTRUCTION(6 downto 6) = CONSTANT_0_11030))) else
		CONSTANT_0_10746;
	cs_20 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_20_10980)) else
		CONSTANT_0_10746;
	cs_21 <= CONSTANT_1_10745 when (((INSTRUCTION(11 downto 7) = CONSTANT_8_10763) or (INSTRUCTION(11 downto 6) = CONSTANT_19_10768))) else
		CONSTANT_0_10746;
	cs_22 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_16_11057)) else
		CONSTANT_0_10746;
	cs_23 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_17_11064)) else
		CONSTANT_0_10746;
	cs_24 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_19_10768)) else
		CONSTANT_0_10746;
	cs_25 <= CONSTANT_1_10745 when ((INSTRUCTION(3 downto 0) = CONSTANT_0_11030)) else
		CONSTANT_0_10746;
	cs_26 <= CONSTANT_1_10745 when ((INSTRUCTION(3 downto 0) = CONSTANT_1_11085)) else
		CONSTANT_0_10746;
	cs_27 <= CONSTANT_1_10745 when ((INSTRUCTION(3 downto 0) = CONSTANT_2_11092)) else
		CONSTANT_0_10746;
	cs_28 <= CONSTANT_1_10745 when ((INSTRUCTION(3 downto 0) = CONSTANT_3_11099)) else
		CONSTANT_0_10746;
	cs_29 <= CONSTANT_1_10745 when ((INSTRUCTION(3 downto 0) = CONSTANT_4_11106)) else
		CONSTANT_0_10746;
	cs_3 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_7_11113)) else
		CONSTANT_0_10746;
	cs_30 <= CONSTANT_1_10745 when ((INSTRUCTION(3 downto 0) = CONSTANT_5_10773)) else
		CONSTANT_0_10746;
	cs_31 <= CONSTANT_1_10745 when ((INSTRUCTION(3 downto 0) = CONSTANT_6_11127)) else
		CONSTANT_0_10746;
	cs_32 <= CONSTANT_1_10745 when ((INSTRUCTION(3 downto 0) = CONSTANT_7_11134)) else
		CONSTANT_0_10746;
	cs_33 <= CONSTANT_1_10745 when ((INSTRUCTION(3 downto 0) = CONSTANT_8_11141)) else
		CONSTANT_0_10746;
	cs_34 <= CONSTANT_1_10745 when ((INSTRUCTION(3 downto 0) = CONSTANT_9_11148)) else
		CONSTANT_0_10746;
	cs_35 <= CONSTANT_1_10745 when ((INSTRUCTION(3 downto 0) = CONSTANT_10_11155)) else
		CONSTANT_0_10746;
	cs_36 <= CONSTANT_1_10745 when ((INSTRUCTION(3 downto 0) = CONSTANT_11_11162)) else
		CONSTANT_0_10746;
	cs_37 <= CONSTANT_1_10745 when ((INSTRUCTION(3 downto 0) = CONSTANT_12_11169)) else
		CONSTANT_0_10746;
	cs_38 <= CONSTANT_1_10745 when ((INSTRUCTION(3 downto 0) = CONSTANT_13_11176)) else
		CONSTANT_0_10746;
	cs_39 <= CONSTANT_1_10745 when ((INSTRUCTION(3 downto 0) = CONSTANT_14_11183)) else
		CONSTANT_0_10746;
	cs_4 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_3_11190)) else
		CONSTANT_0_10746;
	cs_40 <= CONSTANT_1_10745 when ((INSTRUCTION(3 downto 0) = CONSTANT_15_11197)) else
		CONSTANT_0_10746;
	cs_41 <= CONSTANT_1_10745 when ((((INSTRUCTION(11 downto 6) = CONSTANT_22_11204) or (INSTRUCTION(11 downto 8) & INSTRUCTION(6 downto 6) = CONSTANT_11_11211)) or (INSTRUCTION(11 downto 7) = CONSTANT_12_11216))) else
		CONSTANT_0_10746;
	cs_42 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_22_11204)) else
		CONSTANT_0_10746;
	cs_43 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_21_11231)) else
		CONSTANT_0_10746;
	cs_44 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_23_11238)) else
		CONSTANT_0_10746;
	cs_45 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_24_11245)) else
		CONSTANT_0_10746;
	cs_46 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_25_11252)) else
		CONSTANT_0_10746;
	cs_47 <= CONSTANT_1_10745 when (((INSTRUCTION(11 downto 7) = CONSTANT_13_11259) or (INSTRUCTION(11 downto 6) = CONSTANT_28_10778))) else
		CONSTANT_0_10746;
	cs_48 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_26_11271)) else
		CONSTANT_0_10746;
	cs_49 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_27_11278)) else
		CONSTANT_0_10746;
	cs_5 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_9_11285)) else
		CONSTANT_0_10746;
	cs_50 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_28_10778)) else
		CONSTANT_0_10746;
	cs_51 <= CONSTANT_1_10745 when (((((((((INSTRUCTION(11 downto 3) = CONSTANT_262_11299) or (INSTRUCTION(11 downto 4) = CONSTANT_132_11303)) or (INSTRUCTION(11 downto 3) = CONSTANT_266_11308)) or (INSTRUCTION(11 downto 3) = CONSTANT_275_11313)) or (INSTRUCTION(11 downto 5) & INSTRUCTION(3 downto 3) = CONSTANT_136_10794)) or (INSTRUCTION(11 downto 3) = CONSTANT_276_10799)) or (INSTRUCTION(11 downto 9) & INSTRUCTION(7 downto 5) = CONSTANT_32_10817)) or (INSTRUCTION(11 downto 9) & INSTRUCTION(7 downto 4) = CONSTANT_66_10825))) else
		CONSTANT_0_10746;
	cs_52 <= CONSTANT_1_10745 when ((((((INSTRUCTION(11 downto 5) = CONSTANT_64_11350) or (INSTRUCTION(11 downto 4) = CONSTANT_130_11354)) or (INSTRUCTION(11 downto 3) = CONSTANT_262_11299)) or (INSTRUCTION(11 downto 4) = CONSTANT_132_11303)) or (INSTRUCTION(11 downto 3) = CONSTANT_266_11308))) else
		CONSTANT_0_10746;
	cs_53 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_256_11377)) else
		CONSTANT_0_10746;
	cs_54 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_257_11384)) else
		CONSTANT_0_10746;
	cs_55 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_258_11391)) else
		CONSTANT_0_10746;
	cs_56 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_259_11398)) else
		CONSTANT_0_10746;
	cs_57 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_260_11405)) else
		CONSTANT_0_10746;
	cs_58 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_261_11412)) else
		CONSTANT_0_10746;
	cs_59 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_262_11299)) else
		CONSTANT_0_10746;
	cs_6 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_1_11426)) else
		CONSTANT_0_10746;
	cs_60 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_264_11433)) else
		CONSTANT_0_10746;
	cs_61 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_265_11440)) else
		CONSTANT_0_10746;
	cs_62 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_266_11308)) else
		CONSTANT_0_10746;
	cs_63 <= CONSTANT_1_10745 when ((((INSTRUCTION(11 downto 3) = CONSTANT_275_11313) or (INSTRUCTION(11 downto 5) & INSTRUCTION(3 downto 3) = CONSTANT_136_10794)) or (INSTRUCTION(11 downto 3) = CONSTANT_276_10799))) else
		CONSTANT_0_10746;
	cs_64 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_275_11313)) else
		CONSTANT_0_10746;
	cs_65 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_272_11481)) else
		CONSTANT_0_10746;
	cs_66 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_274_11488)) else
		CONSTANT_0_10746;
	cs_67 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_276_10799)) else
		CONSTANT_0_10746;
	cs_68 <= CONSTANT_1_10745 when (((INSTRUCTION(11 downto 5) = CONSTANT_72_11502) or (INSTRUCTION(11 downto 4) = CONSTANT_146_11506))) else
		CONSTANT_0_10746;
	cs_69 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_288_11514)) else
		CONSTANT_0_10746;
	cs_7 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_10_11521)) else
		CONSTANT_0_10746;
	cs_70 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_289_11528)) else
		CONSTANT_0_10746;
	cs_71 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_290_11535)) else
		CONSTANT_0_10746;
	cs_72 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_291_11542)) else
		CONSTANT_0_10746;
	cs_73 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_292_11549)) else
		CONSTANT_0_10746;
	cs_74 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_293_11556)) else
		CONSTANT_0_10746;
	cs_75 <= CONSTANT_1_10745 when (((INSTRUCTION(11 downto 4) = CONSTANT_152_10804) or (INSTRUCTION(11 downto 3) = CONSTANT_306_10809))) else
		CONSTANT_0_10746;
	cs_76 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_304_11575)) else
		CONSTANT_0_10746;
	cs_77 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_305_11582)) else
		CONSTANT_0_10746;
	cs_78 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_306_10809)) else
		CONSTANT_0_10746;
	cs_79 <= CONSTANT_1_10745 when (((INSTRUCTION(11 downto 4) = CONSTANT_165_11596) or (INSTRUCTION(11 downto 3) = CONSTANT_332_10835))) else
		CONSTANT_0_10746;
	cs_8 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_8_11608)) else
		CONSTANT_0_10746;
	cs_80 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_330_11615)) else
		CONSTANT_0_10746;
	cs_81 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_331_10830)) else
		CONSTANT_0_10746;
	cs_82 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_332_10835)) else
		CONSTANT_0_10746;
	cs_83 <= CONSTANT_1_10745 when ((((INSTRUCTION(11 downto 3) = CONSTANT_336_11636) or (INSTRUCTION(11 downto 3) = CONSTANT_341_11640)) or (INSTRUCTION(11 downto 3) = CONSTANT_342_10840))) else
		CONSTANT_0_10746;
	cs_84 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_336_11636)) else
		CONSTANT_0_10746;
	cs_85 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_341_11640)) else
		CONSTANT_0_10746;
	cs_86 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_342_10840)) else
		CONSTANT_0_10746;
	cs_87 <= CONSTANT_1_10745 when (((INSTRUCTION(11 downto 3) = CONSTANT_339_11674) or (INSTRUCTION(11 downto 3) = CONSTANT_344_11678))) else
		CONSTANT_0_10746;
	cs_88 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_339_11674)) else
		CONSTANT_0_10746;
	cs_89 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_344_11678)) else
		CONSTANT_0_10746;
	cs_9 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 6) = CONSTANT_2_11700)) else
		CONSTANT_0_10746;
	cs_90 <= CONSTANT_1_10745 when ((((INSTRUCTION(11 downto 3) = CONSTANT_326_11707) or (INSTRUCTION(11 downto 5) & INSTRUCTION(3 downto 3) = CONSTANT_163_11714)) or (INSTRUCTION(11 downto 4) = CONSTANT_164_11719))) else
		CONSTANT_0_10746;
	cs_91 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_326_11707)) else
		CONSTANT_0_10746;
	cs_92 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_325_11734)) else
		CONSTANT_0_10746;
	cs_93 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_327_11741)) else
		CONSTANT_0_10746;
	cs_94 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_328_11748)) else
		CONSTANT_0_10746;
	cs_95 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_329_11755)) else
		CONSTANT_0_10746;
	cs_96 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 3) = CONSTANT_343_11762)) else
		CONSTANT_0_10746;
	cs_97 <= CONSTANT_1_10745 when ((INSTRUCTION(11 downto 9) = CONSTANT_7_10896)) else
		CONSTANT_0_10746;
	s_invalid_instruction <= CONSTANT_0_10746 when ((vs_0 /= 0)) else
		CONSTANT_1_10745;
	vs_0 <= CONSTANT_1_10745 when (((INSTRUCTION(11 downto 9) = CONSTANT_7_10896) or ((INSTRUCTION(11 downto 3) = CONSTANT_343_11762) or ((((INSTRUCTION(11 downto 3) = CONSTANT_326_11707) or (INSTRUCTION(11 downto 5) & INSTRUCTION(3 downto 3) = CONSTANT_163_11714)) or (INSTRUCTION(11 downto 4) = CONSTANT_164_11719)) or (((INSTRUCTION(11 downto 3) = CONSTANT_339_11674) or (INSTRUCTION(11 downto 3) = CONSTANT_344_11678)) or ((((INSTRUCTION(11 downto 3) = CONSTANT_336_11636) or (INSTRUCTION(11 downto 3) = CONSTANT_341_11640)) or (INSTRUCTION(11 downto 3) = CONSTANT_342_10840)) or (((INSTRUCTION(11 downto 4) = CONSTANT_165_11596) or (INSTRUCTION(11 downto 3) = CONSTANT_332_10835)) or (((INSTRUCTION(11 downto 4) = CONSTANT_152_10804) or (INSTRUCTION(11 downto 3) = CONSTANT_306_10809)) or (((((((((INSTRUCTION(11 downto 3) = CONSTANT_262_11299) or (INSTRUCTION(11 downto 4) = CONSTANT_132_11303)) or (INSTRUCTION(11 downto 3) = CONSTANT_266_11308)) or (INSTRUCTION(11 downto 3) = CONSTANT_275_11313)) or (INSTRUCTION(11 downto 5) & INSTRUCTION(3 downto 3) = CONSTANT_136_10794)) or (INSTRUCTION(11 downto 3) = CONSTANT_276_10799)) or (INSTRUCTION(11 downto 9) & INSTRUCTION(7 downto 5) = CONSTANT_32_10817)) or (INSTRUCTION(11 downto 9) & INSTRUCTION(7 downto 4) = CONSTANT_66_10825)) or (((INSTRUCTION(11 downto 7) = CONSTANT_13_11259) or (INSTRUCTION(11 downto 6) = CONSTANT_28_10778)) or ((((INSTRUCTION(11 downto 6) = CONSTANT_22_11204) or (INSTRUCTION(11 downto 8) & INSTRUCTION(6 downto 6) = CONSTANT_11_11211)) or (INSTRUCTION(11 downto 7) = CONSTANT_12_11216)) or (((INSTRUCTION(11 downto 7) = CONSTANT_8_10763) or (INSTRUCTION(11 downto 6) = CONSTANT_19_10768)) or ((((INSTRUCTION(11 downto 6) = CONSTANT_11_10971) or (INSTRUCTION(11 downto 7) = CONSTANT_6_10753)) or (INSTRUCTION(11 downto 6) = CONSTANT_20_10980)) or (((INSTRUCTION(11 downto 9) = CONSTANT_0_10749) or (INSTRUCTION(11 downto 7) = CONSTANT_4_10908)) or (INSTRUCTION(11 downto 9) & INSTRUCTION(7 downto 6) = CONSTANT_6_10753))))))))))))))) else
		CONSTANT_0_10746;
	main_0_imm1_srcB_op_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) or ((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745))))) else
		CONSTANT_0_10746(0);
	main_0_imm1_srcC_op_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_imm3_srcB_am_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) or ((cs_0 = CONSTANT_1_10745) and (cs_79 = CONSTANT_1_10745))) or ((cs_0 = CONSTANT_1_10745) and (cs_90 = CONSTANT_1_10745))))) else
		CONSTANT_0_10746(0);
	main_0_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_1 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_16 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_75 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_41 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_90 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_instr_hw_move_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_47 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_79 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_instr_hw_system_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_83 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_87 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_96 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_add_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_52 = CONSTANT_1_10745)) and (cs_57 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_addadd_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_68 = CONSTANT_1_10745)) and (cs_69 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_addi_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_1 = CONSTANT_1_10745)) and (cs_11 = CONSTANT_1_10745)) and (cs_12 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_addmul_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_68 = CONSTANT_1_10745)) and (cs_73 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_addsub_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_68 = CONSTANT_1_10745)) and (cs_71 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_and_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_52 = CONSTANT_1_10745)) and (cs_53 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_andi_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_1 = CONSTANT_1_10745)) and (cs_2 = CONSTANT_1_10745)) and (cs_10 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_ashr_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_52 = CONSTANT_1_10745)) and (cs_61 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_ashri_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_1 = CONSTANT_1_10745)) and (cs_2 = CONSTANT_1_10745)) and (cs_5 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_binand_cond_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_35 = CONSTANT_1_10745)) or (((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745)) and (cs_35 = CONSTANT_1_10745))))) else
		CONSTANT_0_10746(0);
	main_0_op_binnand_cond_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_36 = CONSTANT_1_10745)) or (((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745)) and (cs_36 = CONSTANT_1_10745))))) else
		CONSTANT_0_10746(0);
	main_0_op_call_exc_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_16 = CONSTANT_1_10745)) and (cs_19 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_call_int_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_16 = CONSTANT_1_10745)) and (cs_18 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_call_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_16 = CONSTANT_1_10745)) and (cs_17 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_call_reg_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_75 = CONSTANT_1_10745)) and (cs_78 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_ctlz_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_63 = CONSTANT_1_10745)) and (cs_65 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_cttz_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_63 = CONSTANT_1_10745)) and (cs_66 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_eq_cond_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_25 = CONSTANT_1_10745)) or (((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745)) and (cs_25 = CONSTANT_1_10745))))) else
		CONSTANT_0_10746(0);
	main_0_op_get_status_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_96 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_halt_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_83 = CONSTANT_1_10745)) and (cs_84 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_int_dis_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_83 = CONSTANT_1_10745)) and (cs_86 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_int_en_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_83 = CONSTANT_1_10745)) and (cs_85 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_jump_ie_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_75 = CONSTANT_1_10745)) and (cs_77 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_jump_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_16 = CONSTANT_1_10745)) and (cs_20 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_jump_reg_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_75 = CONSTANT_1_10745)) and (cs_76 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_ld_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_41 = CONSTANT_1_10745)) and (cs_46 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_ldbs_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_41 = CONSTANT_1_10745)) and (cs_42 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_ldbsx_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_90 = CONSTANT_1_10745)) and (cs_91 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_ldbu_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_41 = CONSTANT_1_10745)) and (cs_43 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_ldbux_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_90 = CONSTANT_1_10745)) and (cs_92 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_ldhs_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_41 = CONSTANT_1_10745)) and (cs_45 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_ldhsx_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_90 = CONSTANT_1_10745)) and (cs_94 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_ldhu_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_41 = CONSTANT_1_10745)) and (cs_44 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_ldhux_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_90 = CONSTANT_1_10745)) and (cs_93 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_ldx_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_90 = CONSTANT_1_10745)) and (cs_95 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_logand_cond_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_37 = CONSTANT_1_10745)) or (((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745)) and (cs_37 = CONSTANT_1_10745))))) else
		CONSTANT_0_10746(0);
	main_0_op_lognand_cond_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_38 = CONSTANT_1_10745)) or (((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745)) and (cs_38 = CONSTANT_1_10745))))) else
		CONSTANT_0_10746(0);
	main_0_op_lognor_cond_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_40 = CONSTANT_1_10745)) or (((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745)) and (cs_40 = CONSTANT_1_10745))))) else
		CONSTANT_0_10746(0);
	main_0_op_logor_cond_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_39 = CONSTANT_1_10745)) or (((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745)) and (cs_39 = CONSTANT_1_10745))))) else
		CONSTANT_0_10746(0);
	main_0_op_lshr_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_52 = CONSTANT_1_10745)) and (cs_62 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_lshri_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_1 = CONSTANT_1_10745)) and (cs_2 = CONSTANT_1_10745)) and (cs_7 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_lui_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_1 = CONSTANT_1_10745)) and (cs_15 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_move_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_22 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_mul_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_52 = CONSTANT_1_10745)) and (cs_59 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_mulsi_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_1 = CONSTANT_1_10745)) and (cs_11 = CONSTANT_1_10745)) and (cs_14 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_mului_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_1 = CONSTANT_1_10745)) and (cs_2 = CONSTANT_1_10745)) and (cs_3 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_ne_cond_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_26 = CONSTANT_1_10745)) or (((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745)) and (cs_26 = CONSTANT_1_10745))))) else
		CONSTANT_0_10746(0);
	main_0_op_nor_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_52 = CONSTANT_1_10745)) and (cs_55 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_nori_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_1 = CONSTANT_1_10745)) and (cs_2 = CONSTANT_1_10745)) and (cs_9 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_or_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_52 = CONSTANT_1_10745)) and (cs_54 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_ori_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_1 = CONSTANT_1_10745)) and (cs_2 = CONSTANT_1_10745)) and (cs_6 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_printreg_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_87 = CONSTANT_1_10745)) and (cs_88 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_select_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_24 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_set_status_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_87 = CONSTANT_1_10745)) and (cs_89 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_sext16_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_63 = CONSTANT_1_10745)) and (cs_67 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_sext8_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_63 = CONSTANT_1_10745)) and (cs_64 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_sge_cond_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_28 = CONSTANT_1_10745)) or (((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745)) and (cs_28 = CONSTANT_1_10745))))) else
		CONSTANT_0_10746(0);
	main_0_op_sgt_cond_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_30 = CONSTANT_1_10745)) or (((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745)) and (cs_30 = CONSTANT_1_10745))))) else
		CONSTANT_0_10746(0);
	main_0_op_shl_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_52 = CONSTANT_1_10745)) and (cs_60 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_shli_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_1 = CONSTANT_1_10745)) and (cs_2 = CONSTANT_1_10745)) and (cs_8 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_sle_cond_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_29 = CONSTANT_1_10745)) or (((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745)) and (cs_29 = CONSTANT_1_10745))))) else
		CONSTANT_0_10746(0);
	main_0_op_slt_cond_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_27 = CONSTANT_1_10745)) or (((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745)) and (cs_27 = CONSTANT_1_10745))))) else
		CONSTANT_0_10746(0);
	main_0_op_st_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_47 = CONSTANT_1_10745)) and (cs_50 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_stb_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_47 = CONSTANT_1_10745)) and (cs_48 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_stbx_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_79 = CONSTANT_1_10745)) and (cs_80 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_sth_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_47 = CONSTANT_1_10745)) and (cs_49 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_sthx_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_79 = CONSTANT_1_10745)) and (cs_81 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_stx_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_79 = CONSTANT_1_10745)) and (cs_82 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_sub_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_52 = CONSTANT_1_10745)) and (cs_58 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_subadd_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_68 = CONSTANT_1_10745)) and (cs_70 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_subi_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_1 = CONSTANT_1_10745)) and (cs_11 = CONSTANT_1_10745)) and (cs_13 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_submul_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_68 = CONSTANT_1_10745)) and (cs_74 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_subsub_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_68 = CONSTANT_1_10745)) and (cs_72 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_test_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and (((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_23 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_uge_cond_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_32 = CONSTANT_1_10745)) or (((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745)) and (cs_32 = CONSTANT_1_10745))))) else
		CONSTANT_0_10746(0);
	main_0_op_ugt_cond_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_34 = CONSTANT_1_10745)) or (((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745)) and (cs_34 = CONSTANT_1_10745))))) else
		CONSTANT_0_10746(0);
	main_0_op_ule_cond_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_33 = CONSTANT_1_10745)) or (((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745)) and (cs_33 = CONSTANT_1_10745))))) else
		CONSTANT_0_10746(0);
	main_0_op_ult_cond_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)) and (cs_31 = CONSTANT_1_10745)) or (((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745)) and (cs_31 = CONSTANT_1_10745))))) else
		CONSTANT_0_10746(0);
	main_0_op_xor_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)) and (cs_52 = CONSTANT_1_10745)) and (cs_56 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	main_0_op_xori_operation_instr_hw_0_return_ACT <= CONSTANT_1_10745(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((((cs_0 = CONSTANT_1_10745) and (cs_1 = CONSTANT_1_10745)) and (cs_2 = CONSTANT_1_10745)) and (cs_4 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	codasip_attribute_L_main_0_instr_hw_srcB_am_imm3_val_0_D0 <= std_logic_vector(INSTRUCTION(2 downto 0)) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_51 = CONSTANT_1_10745)))) else 
		std_logic_vector(INSTRUCTION(2 downto 0)) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_79 = CONSTANT_1_10745)))) else 
		std_logic_vector(INSTRUCTION(2 downto 0)) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_90 = CONSTANT_1_10745)))) else
		std_logic_vector(CONSTANT_0_10749);
	codasip_attribute_L_main_0_instr_hw_srcB_op_imm1_val_0_D0 <= tmp_conv_sign_15159(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)))) else 
		tmp_conv_sign_15160(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_97 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);
	codasip_attribute_L_main_0_instr_hw_srcC_op_imm1_val_0_D0 <= tmp_conv_sign_15161(0) when ((((s_invalid_instruction = CONSTANT_0_10746) and (ACT = CONSTANT_1_10745(0))) and ((cs_0 = CONSTANT_1_10745) and (cs_21 = CONSTANT_1_10745)))) else
		CONSTANT_0_10746(0);

end architecture RTL;


