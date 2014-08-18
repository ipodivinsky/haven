--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of instruction decoder 'codix_risc_ca_core_main_instr_hw_instr_hw_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_instr_hw_instr_hw_t is
	port (
		ACT : in std_logic;
		codasip_attribute_L_main_instr_hw_srcB_am_imm3_val_0_D0 : out std_logic_vector(2 downto 0);
		codasip_attribute_L_main_instr_hw_srcB_op_imm1_val_0_D0 : out std_logic;
		codasip_attribute_L_main_instr_hw_srcC_op_imm1_val_0_D0 : out std_logic;
		id_instr_Q0 : in std_logic_vector(11 downto 0);
		invalid_instruction : out std_logic;
		main_imm1_srcB_op_instr_hw_0_return_ACT : out std_logic;
		main_imm1_srcC_op_instr_hw_0_return_ACT : out std_logic;
		main_imm3_srcB_am_instr_hw_0_return_ACT : out std_logic;
		main_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_instr_hw_alu_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_instr_hw_move_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_instr_hw_system_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_ACT : out std_logic;
		main_op_add_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_addadd_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_addi_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_addmul_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_addsub_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_and_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_andi_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_ashr_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_ashri_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_binand_cond_instr_hw_0_return_ACT : out std_logic;
		main_op_binnand_cond_instr_hw_0_return_ACT : out std_logic;
		main_op_call_exc_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_call_int_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_call_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_call_reg_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_ctlz_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_cttz_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_eq_cond_instr_hw_0_return_ACT : out std_logic;
		main_op_get_status_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_halt_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_int_dis_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_int_en_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_jump_ie_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_jump_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_jump_reg_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_ld_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_ldbs_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_ldbsx_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_ldbu_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_ldbux_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_ldhs_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_ldhsx_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_ldhu_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_ldhux_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_ldx_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_logand_cond_instr_hw_0_return_ACT : out std_logic;
		main_op_lognand_cond_instr_hw_0_return_ACT : out std_logic;
		main_op_lognor_cond_instr_hw_0_return_ACT : out std_logic;
		main_op_logor_cond_instr_hw_0_return_ACT : out std_logic;
		main_op_lshr_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_lshri_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_lui_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_move_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_mul_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_mulsi_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_mului_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_ne_cond_instr_hw_0_return_ACT : out std_logic;
		main_op_nor_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_nori_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_or_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_ori_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_printreg_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_select_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_set_status_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_sext16_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_sext8_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_sge_cond_instr_hw_0_return_ACT : out std_logic;
		main_op_sgt_cond_instr_hw_0_return_ACT : out std_logic;
		main_op_shl_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_shli_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_sle_cond_instr_hw_0_return_ACT : out std_logic;
		main_op_slt_cond_instr_hw_0_return_ACT : out std_logic;
		main_op_st_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_stb_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_stbx_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_sth_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_sthx_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_stx_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_sub_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_subadd_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_subi_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_submul_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_subsub_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_test_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_uge_cond_instr_hw_0_return_ACT : out std_logic;
		main_op_ugt_cond_instr_hw_0_return_ACT : out std_logic;
		main_op_ule_cond_instr_hw_0_return_ACT : out std_logic;
		main_op_ult_cond_instr_hw_0_return_ACT : out std_logic;
		main_op_xor_operation_instr_hw_0_return_ACT : out std_logic;
		main_op_xori_operation_instr_hw_0_return_ACT : out std_logic	);
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
	signal tmp_conv_sign_14591: unsigned(0 downto 0);
	signal tmp_conv_sign_14592: unsigned(0 downto 0);
	signal tmp_conv_sign_14593: unsigned(0 downto 0);
	constant CONSTANT_0_10184: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_10187: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_10468: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_10362: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_10183: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_1_10523: unsigned(3 downto 0) := to_unsigned(1, 4);
	constant CONSTANT_1_10457: unsigned(4 downto 0) := to_unsigned(1, 5);
	constant CONSTANT_1_10864: unsigned(5 downto 0) := to_unsigned(1, 6);
	constant CONSTANT_10_10593: unsigned(3 downto 0) := to_unsigned(10, 4);
	constant CONSTANT_10_10959: unsigned(5 downto 0) := to_unsigned(10, 6);
	constant CONSTANT_11_10600: unsigned(3 downto 0) := to_unsigned(11, 4);
	constant CONSTANT_11_10649: unsigned(4 downto 0) := to_unsigned(11, 5);
	constant CONSTANT_11_10409: unsigned(5 downto 0) := to_unsigned(11, 6);
	constant CONSTANT_12_10607: unsigned(3 downto 0) := to_unsigned(12, 4);
	constant CONSTANT_12_10654: unsigned(4 downto 0) := to_unsigned(12, 5);
	constant CONSTANT_12_10433: unsigned(5 downto 0) := to_unsigned(12, 6);
	constant CONSTANT_13_10614: unsigned(3 downto 0) := to_unsigned(13, 4);
	constant CONSTANT_13_10697: unsigned(4 downto 0) := to_unsigned(13, 5);
	constant CONSTANT_13_10440: unsigned(5 downto 0) := to_unsigned(13, 6);
	constant CONSTANT_130_10792: unsigned(7 downto 0) := to_unsigned(130, 8);
	constant CONSTANT_132_10741: unsigned(7 downto 0) := to_unsigned(132, 8);
	constant CONSTANT_134_10305: unsigned(7 downto 0) := to_unsigned(134, 8);
	constant CONSTANT_136_10232: unsigned(7 downto 0) := to_unsigned(136, 8);
	constant CONSTANT_138_10321: unsigned(7 downto 0) := to_unsigned(138, 8);
	constant CONSTANT_14_10621: unsigned(3 downto 0) := to_unsigned(14, 4);
	constant CONSTANT_14_10196: unsigned(5 downto 0) := to_unsigned(14, 6);
	constant CONSTANT_146_10944: unsigned(7 downto 0) := to_unsigned(146, 8);
	constant CONSTANT_147_10329: unsigned(7 downto 0) := to_unsigned(147, 8);
	constant CONSTANT_15_10635: unsigned(3 downto 0) := to_unsigned(15, 4);
	constant CONSTANT_152_10242: unsigned(7 downto 0) := to_unsigned(152, 8);
	constant CONSTANT_16_10495: unsigned(5 downto 0) := to_unsigned(16, 6);
	constant CONSTANT_163_11152: unsigned(7 downto 0) := to_unsigned(163, 8);
	constant CONSTANT_164_11157: unsigned(7 downto 0) := to_unsigned(164, 8);
	constant CONSTANT_165_11034: unsigned(7 downto 0) := to_unsigned(165, 8);
	constant CONSTANT_168_10286: unsigned(7 downto 0) := to_unsigned(168, 8);
	constant CONSTANT_17_10502: unsigned(5 downto 0) := to_unsigned(17, 6);
	constant CONSTANT_19_10206: unsigned(5 downto 0) := to_unsigned(19, 6);
	constant CONSTANT_2_10224: unsigned(2 downto 0) := to_unsigned(2, 3);
	constant CONSTANT_2_10530: unsigned(3 downto 0) := to_unsigned(2, 4);
	constant CONSTANT_2_10369: unsigned(4 downto 0) := to_unsigned(2, 5);
	constant CONSTANT_2_11138: unsigned(5 downto 0) := to_unsigned(2, 6);
	constant CONSTANT_20_10418: unsigned(5 downto 0) := to_unsigned(20, 6);
	constant CONSTANT_21_10669: unsigned(5 downto 0) := to_unsigned(21, 6);
	constant CONSTANT_22_10642: unsigned(5 downto 0) := to_unsigned(22, 6);
	constant CONSTANT_23_10676: unsigned(5 downto 0) := to_unsigned(23, 6);
	constant CONSTANT_24_10683: unsigned(5 downto 0) := to_unsigned(24, 6);
	constant CONSTANT_25_10690: unsigned(5 downto 0) := to_unsigned(25, 6);
	constant CONSTANT_256_10815: unsigned(8 downto 0) := to_unsigned(256, 9);
	constant CONSTANT_257_10822: unsigned(8 downto 0) := to_unsigned(257, 9);
	constant CONSTANT_258_10829: unsigned(8 downto 0) := to_unsigned(258, 9);
	constant CONSTANT_259_10836: unsigned(8 downto 0) := to_unsigned(259, 9);
	constant CONSTANT_26_10709: unsigned(5 downto 0) := to_unsigned(26, 6);
	constant CONSTANT_260_10843: unsigned(8 downto 0) := to_unsigned(260, 9);
	constant CONSTANT_261_10850: unsigned(8 downto 0) := to_unsigned(261, 9);
	constant CONSTANT_262_10737: unsigned(8 downto 0) := to_unsigned(262, 9);
	constant CONSTANT_264_10871: unsigned(8 downto 0) := to_unsigned(264, 9);
	constant CONSTANT_265_10878: unsigned(8 downto 0) := to_unsigned(265, 9);
	constant CONSTANT_266_10746: unsigned(8 downto 0) := to_unsigned(266, 9);
	constant CONSTANT_27_10716: unsigned(5 downto 0) := to_unsigned(27, 6);
	constant CONSTANT_272_10919: unsigned(8 downto 0) := to_unsigned(272, 9);
	constant CONSTANT_274_10926: unsigned(8 downto 0) := to_unsigned(274, 9);
	constant CONSTANT_275_10751: unsigned(8 downto 0) := to_unsigned(275, 9);
	constant CONSTANT_276_10237: unsigned(8 downto 0) := to_unsigned(276, 9);
	constant CONSTANT_28_10216: unsigned(5 downto 0) := to_unsigned(28, 6);
	constant CONSTANT_288_10952: unsigned(8 downto 0) := to_unsigned(288, 9);
	constant CONSTANT_289_10966: unsigned(8 downto 0) := to_unsigned(289, 9);
	constant CONSTANT_290_10973: unsigned(8 downto 0) := to_unsigned(290, 9);
	constant CONSTANT_291_10980: unsigned(8 downto 0) := to_unsigned(291, 9);
	constant CONSTANT_292_10987: unsigned(8 downto 0) := to_unsigned(292, 9);
	constant CONSTANT_293_10994: unsigned(8 downto 0) := to_unsigned(293, 9);
	constant CONSTANT_3_10537: unsigned(3 downto 0) := to_unsigned(3, 4);
	constant CONSTANT_3_10450: unsigned(4 downto 0) := to_unsigned(3, 5);
	constant CONSTANT_3_10628: unsigned(5 downto 0) := to_unsigned(3, 6);
	constant CONSTANT_304_11013: unsigned(8 downto 0) := to_unsigned(304, 9);
	constant CONSTANT_305_11020: unsigned(8 downto 0) := to_unsigned(305, 9);
	constant CONSTANT_306_10247: unsigned(8 downto 0) := to_unsigned(306, 9);
	constant CONSTANT_32_10255: unsigned(5 downto 0) := to_unsigned(32, 6);
	constant CONSTANT_325_11172: unsigned(8 downto 0) := to_unsigned(325, 9);
	constant CONSTANT_326_11145: unsigned(8 downto 0) := to_unsigned(326, 9);
	constant CONSTANT_327_11179: unsigned(8 downto 0) := to_unsigned(327, 9);
	constant CONSTANT_328_11186: unsigned(8 downto 0) := to_unsigned(328, 9);
	constant CONSTANT_329_11193: unsigned(8 downto 0) := to_unsigned(329, 9);
	constant CONSTANT_330_11053: unsigned(8 downto 0) := to_unsigned(330, 9);
	constant CONSTANT_331_10268: unsigned(8 downto 0) := to_unsigned(331, 9);
	constant CONSTANT_332_10273: unsigned(8 downto 0) := to_unsigned(332, 9);
	constant CONSTANT_336_11074: unsigned(8 downto 0) := to_unsigned(336, 9);
	constant CONSTANT_339_11112: unsigned(8 downto 0) := to_unsigned(339, 9);
	constant CONSTANT_341_11078: unsigned(8 downto 0) := to_unsigned(341, 9);
	constant CONSTANT_342_10278: unsigned(8 downto 0) := to_unsigned(342, 9);
	constant CONSTANT_343_11200: unsigned(8 downto 0) := to_unsigned(343, 9);
	constant CONSTANT_344_11116: unsigned(8 downto 0) := to_unsigned(344, 9);
	constant CONSTANT_4_10544: unsigned(3 downto 0) := to_unsigned(4, 4);
	constant CONSTANT_4_10346: unsigned(4 downto 0) := to_unsigned(4, 5);
	constant CONSTANT_4_10381: unsigned(5 downto 0) := to_unsigned(4, 6);
	constant CONSTANT_5_10211: unsigned(3 downto 0) := to_unsigned(5, 4);
	constant CONSTANT_5_10388: unsigned(5 downto 0) := to_unsigned(5, 6);
	constant CONSTANT_6_10565: unsigned(3 downto 0) := to_unsigned(6, 4);
	constant CONSTANT_6_10191: unsigned(4 downto 0) := to_unsigned(6, 5);
	constant CONSTANT_6_10373: unsigned(5 downto 0) := to_unsigned(6, 6);
	constant CONSTANT_64_10788: unsigned(6 downto 0) := to_unsigned(64, 7);
	constant CONSTANT_66_10263: unsigned(6 downto 0) := to_unsigned(66, 7);
	constant CONSTANT_68_10313: unsigned(6 downto 0) := to_unsigned(68, 7);
	constant CONSTANT_7_10334: unsigned(2 downto 0) := to_unsigned(7, 3);
	constant CONSTANT_7_10572: unsigned(3 downto 0) := to_unsigned(7, 4);
	constant CONSTANT_7_10551: unsigned(5 downto 0) := to_unsigned(7, 6);
	constant CONSTANT_72_10940: unsigned(6 downto 0) := to_unsigned(72, 7);
	constant CONSTANT_8_10579: unsigned(3 downto 0) := to_unsigned(8, 4);
	constant CONSTANT_8_10201: unsigned(4 downto 0) := to_unsigned(8, 5);
	constant CONSTANT_8_11046: unsigned(5 downto 0) := to_unsigned(8, 6);
	constant CONSTANT_83_10297: unsigned(6 downto 0) := to_unsigned(83, 7);
	constant CONSTANT_9_10586: unsigned(3 downto 0) := to_unsigned(9, 4);
	constant CONSTANT_9_10723: unsigned(5 downto 0) := to_unsigned(9, 6);

begin
		-- conversions for datapath
	tmp_conv_sign_14591 <= INSTRUCTION(5 downto 5);
	tmp_conv_sign_14592 <= INSTRUCTION(5 downto 5);
	tmp_conv_sign_14593 <= INSTRUCTION(4 downto 4);

		-- Datapath code
	invalid_instruction <= s_invalid_instruction(0);
	INSTRUCTION <= unsigned(id_instr_Q0);
	cs_0 <= CONSTANT_1_10183 when (((((((((((((((((((((((((INSTRUCTION(11 downto 9) = CONSTANT_0_10187) or (INSTRUCTION(11 downto 7) = CONSTANT_6_10191)) or (INSTRUCTION(11 downto 6) = CONSTANT_14_10196)) or (INSTRUCTION(11 downto 7) = CONSTANT_8_10201)) or (INSTRUCTION(11 downto 6) = CONSTANT_19_10206)) or (INSTRUCTION(11 downto 8) = CONSTANT_5_10211)) or (INSTRUCTION(11 downto 6) = CONSTANT_28_10216)) or (INSTRUCTION(11 downto 11) & INSTRUCTION(9 downto 8) = CONSTANT_2_10224)) or (INSTRUCTION(11 downto 5) & INSTRUCTION(3 downto 3) = CONSTANT_136_10232)) or (INSTRUCTION(11 downto 3) = CONSTANT_276_10237)) or (INSTRUCTION(11 downto 4) = CONSTANT_152_10242)) or (INSTRUCTION(11 downto 3) = CONSTANT_306_10247)) or (INSTRUCTION(11 downto 9) & INSTRUCTION(7 downto 5) = CONSTANT_32_10255)) or (INSTRUCTION(11 downto 9) & INSTRUCTION(7 downto 4) = CONSTANT_66_10263)) or (INSTRUCTION(11 downto 3) = CONSTANT_331_10268)) or (INSTRUCTION(11 downto 3) = CONSTANT_332_10273)) or (INSTRUCTION(11 downto 3) = CONSTANT_342_10278)) or (INSTRUCTION(11 downto 7) & INSTRUCTION(5 downto 3) = CONSTANT_168_10286)) or (INSTRUCTION(11 downto 8) & INSTRUCTION(6 downto 5) & INSTRUCTION(3 downto 3) = CONSTANT_83_10297)) or (INSTRUCTION(11 downto 10) & INSTRUCTION(8 downto 3) = CONSTANT_134_10305)) or (INSTRUCTION(11 downto 10) & INSTRUCTION(8 downto 4) = CONSTANT_68_10313)) or (INSTRUCTION(11 downto 10) & INSTRUCTION(8 downto 3) = CONSTANT_138_10321)) or (INSTRUCTION(11 downto 10) & INSTRUCTION(8 downto 3) = CONSTANT_147_10329)) or (INSTRUCTION(11 downto 9) = CONSTANT_7_10334))) else
		CONSTANT_0_10184;
	cs_1 <= CONSTANT_1_10183 when ((((INSTRUCTION(11 downto 9) = CONSTANT_0_10187) or (INSTRUCTION(11 downto 7) = CONSTANT_4_10346)) or (INSTRUCTION(11 downto 9) & INSTRUCTION(7 downto 6) = CONSTANT_6_10191))) else
		CONSTANT_0_10184;
	cs_10 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_0_10362)) else
		CONSTANT_0_10184;
	cs_11 <= CONSTANT_1_10183 when (((INSTRUCTION(11 downto 7) = CONSTANT_2_10369) or (INSTRUCTION(11 downto 6) = CONSTANT_6_10373))) else
		CONSTANT_0_10184;
	cs_12 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_4_10381)) else
		CONSTANT_0_10184;
	cs_13 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_5_10388)) else
		CONSTANT_0_10184;
	cs_14 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_6_10373)) else
		CONSTANT_0_10184;
	cs_15 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_14_10196)) else
		CONSTANT_0_10184;
	cs_16 <= CONSTANT_1_10183 when ((((INSTRUCTION(11 downto 6) = CONSTANT_11_10409) or (INSTRUCTION(11 downto 7) = CONSTANT_6_10191)) or (INSTRUCTION(11 downto 6) = CONSTANT_20_10418))) else
		CONSTANT_0_10184;
	cs_17 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_11_10409)) else
		CONSTANT_0_10184;
	cs_18 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_12_10433)) else
		CONSTANT_0_10184;
	cs_19 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_13_10440)) else
		CONSTANT_0_10184;
	cs_2 <= CONSTANT_1_10183 when ((((INSTRUCTION(11 downto 9) & INSTRUCTION(7 downto 6) = CONSTANT_3_10450) or (INSTRUCTION(11 downto 10) & INSTRUCTION(8 downto 6) = CONSTANT_1_10457)) or (INSTRUCTION(11 downto 10) & INSTRUCTION(8 downto 8) & INSTRUCTION(6 downto 6) = CONSTANT_0_10468))) else
		CONSTANT_0_10184;
	cs_20 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_20_10418)) else
		CONSTANT_0_10184;
	cs_21 <= CONSTANT_1_10183 when (((INSTRUCTION(11 downto 7) = CONSTANT_8_10201) or (INSTRUCTION(11 downto 6) = CONSTANT_19_10206))) else
		CONSTANT_0_10184;
	cs_22 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_16_10495)) else
		CONSTANT_0_10184;
	cs_23 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_17_10502)) else
		CONSTANT_0_10184;
	cs_24 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_19_10206)) else
		CONSTANT_0_10184;
	cs_25 <= CONSTANT_1_10183 when ((INSTRUCTION(3 downto 0) = CONSTANT_0_10468)) else
		CONSTANT_0_10184;
	cs_26 <= CONSTANT_1_10183 when ((INSTRUCTION(3 downto 0) = CONSTANT_1_10523)) else
		CONSTANT_0_10184;
	cs_27 <= CONSTANT_1_10183 when ((INSTRUCTION(3 downto 0) = CONSTANT_2_10530)) else
		CONSTANT_0_10184;
	cs_28 <= CONSTANT_1_10183 when ((INSTRUCTION(3 downto 0) = CONSTANT_3_10537)) else
		CONSTANT_0_10184;
	cs_29 <= CONSTANT_1_10183 when ((INSTRUCTION(3 downto 0) = CONSTANT_4_10544)) else
		CONSTANT_0_10184;
	cs_3 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_7_10551)) else
		CONSTANT_0_10184;
	cs_30 <= CONSTANT_1_10183 when ((INSTRUCTION(3 downto 0) = CONSTANT_5_10211)) else
		CONSTANT_0_10184;
	cs_31 <= CONSTANT_1_10183 when ((INSTRUCTION(3 downto 0) = CONSTANT_6_10565)) else
		CONSTANT_0_10184;
	cs_32 <= CONSTANT_1_10183 when ((INSTRUCTION(3 downto 0) = CONSTANT_7_10572)) else
		CONSTANT_0_10184;
	cs_33 <= CONSTANT_1_10183 when ((INSTRUCTION(3 downto 0) = CONSTANT_8_10579)) else
		CONSTANT_0_10184;
	cs_34 <= CONSTANT_1_10183 when ((INSTRUCTION(3 downto 0) = CONSTANT_9_10586)) else
		CONSTANT_0_10184;
	cs_35 <= CONSTANT_1_10183 when ((INSTRUCTION(3 downto 0) = CONSTANT_10_10593)) else
		CONSTANT_0_10184;
	cs_36 <= CONSTANT_1_10183 when ((INSTRUCTION(3 downto 0) = CONSTANT_11_10600)) else
		CONSTANT_0_10184;
	cs_37 <= CONSTANT_1_10183 when ((INSTRUCTION(3 downto 0) = CONSTANT_12_10607)) else
		CONSTANT_0_10184;
	cs_38 <= CONSTANT_1_10183 when ((INSTRUCTION(3 downto 0) = CONSTANT_13_10614)) else
		CONSTANT_0_10184;
	cs_39 <= CONSTANT_1_10183 when ((INSTRUCTION(3 downto 0) = CONSTANT_14_10621)) else
		CONSTANT_0_10184;
	cs_4 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_3_10628)) else
		CONSTANT_0_10184;
	cs_40 <= CONSTANT_1_10183 when ((INSTRUCTION(3 downto 0) = CONSTANT_15_10635)) else
		CONSTANT_0_10184;
	cs_41 <= CONSTANT_1_10183 when ((((INSTRUCTION(11 downto 6) = CONSTANT_22_10642) or (INSTRUCTION(11 downto 8) & INSTRUCTION(6 downto 6) = CONSTANT_11_10649)) or (INSTRUCTION(11 downto 7) = CONSTANT_12_10654))) else
		CONSTANT_0_10184;
	cs_42 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_22_10642)) else
		CONSTANT_0_10184;
	cs_43 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_21_10669)) else
		CONSTANT_0_10184;
	cs_44 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_23_10676)) else
		CONSTANT_0_10184;
	cs_45 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_24_10683)) else
		CONSTANT_0_10184;
	cs_46 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_25_10690)) else
		CONSTANT_0_10184;
	cs_47 <= CONSTANT_1_10183 when (((INSTRUCTION(11 downto 7) = CONSTANT_13_10697) or (INSTRUCTION(11 downto 6) = CONSTANT_28_10216))) else
		CONSTANT_0_10184;
	cs_48 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_26_10709)) else
		CONSTANT_0_10184;
	cs_49 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_27_10716)) else
		CONSTANT_0_10184;
	cs_5 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_9_10723)) else
		CONSTANT_0_10184;
	cs_50 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_28_10216)) else
		CONSTANT_0_10184;
	cs_51 <= CONSTANT_1_10183 when (((((((((INSTRUCTION(11 downto 3) = CONSTANT_262_10737) or (INSTRUCTION(11 downto 4) = CONSTANT_132_10741)) or (INSTRUCTION(11 downto 3) = CONSTANT_266_10746)) or (INSTRUCTION(11 downto 3) = CONSTANT_275_10751)) or (INSTRUCTION(11 downto 5) & INSTRUCTION(3 downto 3) = CONSTANT_136_10232)) or (INSTRUCTION(11 downto 3) = CONSTANT_276_10237)) or (INSTRUCTION(11 downto 9) & INSTRUCTION(7 downto 5) = CONSTANT_32_10255)) or (INSTRUCTION(11 downto 9) & INSTRUCTION(7 downto 4) = CONSTANT_66_10263))) else
		CONSTANT_0_10184;
	cs_52 <= CONSTANT_1_10183 when ((((((INSTRUCTION(11 downto 5) = CONSTANT_64_10788) or (INSTRUCTION(11 downto 4) = CONSTANT_130_10792)) or (INSTRUCTION(11 downto 3) = CONSTANT_262_10737)) or (INSTRUCTION(11 downto 4) = CONSTANT_132_10741)) or (INSTRUCTION(11 downto 3) = CONSTANT_266_10746))) else
		CONSTANT_0_10184;
	cs_53 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_256_10815)) else
		CONSTANT_0_10184;
	cs_54 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_257_10822)) else
		CONSTANT_0_10184;
	cs_55 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_258_10829)) else
		CONSTANT_0_10184;
	cs_56 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_259_10836)) else
		CONSTANT_0_10184;
	cs_57 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_260_10843)) else
		CONSTANT_0_10184;
	cs_58 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_261_10850)) else
		CONSTANT_0_10184;
	cs_59 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_262_10737)) else
		CONSTANT_0_10184;
	cs_6 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_1_10864)) else
		CONSTANT_0_10184;
	cs_60 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_264_10871)) else
		CONSTANT_0_10184;
	cs_61 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_265_10878)) else
		CONSTANT_0_10184;
	cs_62 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_266_10746)) else
		CONSTANT_0_10184;
	cs_63 <= CONSTANT_1_10183 when ((((INSTRUCTION(11 downto 3) = CONSTANT_275_10751) or (INSTRUCTION(11 downto 5) & INSTRUCTION(3 downto 3) = CONSTANT_136_10232)) or (INSTRUCTION(11 downto 3) = CONSTANT_276_10237))) else
		CONSTANT_0_10184;
	cs_64 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_275_10751)) else
		CONSTANT_0_10184;
	cs_65 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_272_10919)) else
		CONSTANT_0_10184;
	cs_66 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_274_10926)) else
		CONSTANT_0_10184;
	cs_67 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_276_10237)) else
		CONSTANT_0_10184;
	cs_68 <= CONSTANT_1_10183 when (((INSTRUCTION(11 downto 5) = CONSTANT_72_10940) or (INSTRUCTION(11 downto 4) = CONSTANT_146_10944))) else
		CONSTANT_0_10184;
	cs_69 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_288_10952)) else
		CONSTANT_0_10184;
	cs_7 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_10_10959)) else
		CONSTANT_0_10184;
	cs_70 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_289_10966)) else
		CONSTANT_0_10184;
	cs_71 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_290_10973)) else
		CONSTANT_0_10184;
	cs_72 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_291_10980)) else
		CONSTANT_0_10184;
	cs_73 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_292_10987)) else
		CONSTANT_0_10184;
	cs_74 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_293_10994)) else
		CONSTANT_0_10184;
	cs_75 <= CONSTANT_1_10183 when (((INSTRUCTION(11 downto 4) = CONSTANT_152_10242) or (INSTRUCTION(11 downto 3) = CONSTANT_306_10247))) else
		CONSTANT_0_10184;
	cs_76 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_304_11013)) else
		CONSTANT_0_10184;
	cs_77 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_305_11020)) else
		CONSTANT_0_10184;
	cs_78 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_306_10247)) else
		CONSTANT_0_10184;
	cs_79 <= CONSTANT_1_10183 when (((INSTRUCTION(11 downto 4) = CONSTANT_165_11034) or (INSTRUCTION(11 downto 3) = CONSTANT_332_10273))) else
		CONSTANT_0_10184;
	cs_8 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_8_11046)) else
		CONSTANT_0_10184;
	cs_80 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_330_11053)) else
		CONSTANT_0_10184;
	cs_81 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_331_10268)) else
		CONSTANT_0_10184;
	cs_82 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_332_10273)) else
		CONSTANT_0_10184;
	cs_83 <= CONSTANT_1_10183 when ((((INSTRUCTION(11 downto 3) = CONSTANT_336_11074) or (INSTRUCTION(11 downto 3) = CONSTANT_341_11078)) or (INSTRUCTION(11 downto 3) = CONSTANT_342_10278))) else
		CONSTANT_0_10184;
	cs_84 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_336_11074)) else
		CONSTANT_0_10184;
	cs_85 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_341_11078)) else
		CONSTANT_0_10184;
	cs_86 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_342_10278)) else
		CONSTANT_0_10184;
	cs_87 <= CONSTANT_1_10183 when (((INSTRUCTION(11 downto 3) = CONSTANT_339_11112) or (INSTRUCTION(11 downto 3) = CONSTANT_344_11116))) else
		CONSTANT_0_10184;
	cs_88 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_339_11112)) else
		CONSTANT_0_10184;
	cs_89 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_344_11116)) else
		CONSTANT_0_10184;
	cs_9 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 6) = CONSTANT_2_11138)) else
		CONSTANT_0_10184;
	cs_90 <= CONSTANT_1_10183 when ((((INSTRUCTION(11 downto 3) = CONSTANT_326_11145) or (INSTRUCTION(11 downto 5) & INSTRUCTION(3 downto 3) = CONSTANT_163_11152)) or (INSTRUCTION(11 downto 4) = CONSTANT_164_11157))) else
		CONSTANT_0_10184;
	cs_91 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_326_11145)) else
		CONSTANT_0_10184;
	cs_92 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_325_11172)) else
		CONSTANT_0_10184;
	cs_93 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_327_11179)) else
		CONSTANT_0_10184;
	cs_94 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_328_11186)) else
		CONSTANT_0_10184;
	cs_95 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_329_11193)) else
		CONSTANT_0_10184;
	cs_96 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 3) = CONSTANT_343_11200)) else
		CONSTANT_0_10184;
	cs_97 <= CONSTANT_1_10183 when ((INSTRUCTION(11 downto 9) = CONSTANT_7_10334)) else
		CONSTANT_0_10184;
	s_invalid_instruction <= CONSTANT_0_10184 when ((vs_0 /= 0)) else
		CONSTANT_1_10183;
	vs_0 <= CONSTANT_1_10183 when (((INSTRUCTION(11 downto 9) = CONSTANT_7_10334) or ((INSTRUCTION(11 downto 3) = CONSTANT_343_11200) or ((((INSTRUCTION(11 downto 3) = CONSTANT_326_11145) or (INSTRUCTION(11 downto 5) & INSTRUCTION(3 downto 3) = CONSTANT_163_11152)) or (INSTRUCTION(11 downto 4) = CONSTANT_164_11157)) or (((INSTRUCTION(11 downto 3) = CONSTANT_339_11112) or (INSTRUCTION(11 downto 3) = CONSTANT_344_11116)) or ((((INSTRUCTION(11 downto 3) = CONSTANT_336_11074) or (INSTRUCTION(11 downto 3) = CONSTANT_341_11078)) or (INSTRUCTION(11 downto 3) = CONSTANT_342_10278)) or (((INSTRUCTION(11 downto 4) = CONSTANT_165_11034) or (INSTRUCTION(11 downto 3) = CONSTANT_332_10273)) or (((INSTRUCTION(11 downto 4) = CONSTANT_152_10242) or (INSTRUCTION(11 downto 3) = CONSTANT_306_10247)) or (((((((((INSTRUCTION(11 downto 3) = CONSTANT_262_10737) or (INSTRUCTION(11 downto 4) = CONSTANT_132_10741)) or (INSTRUCTION(11 downto 3) = CONSTANT_266_10746)) or (INSTRUCTION(11 downto 3) = CONSTANT_275_10751)) or (INSTRUCTION(11 downto 5) & INSTRUCTION(3 downto 3) = CONSTANT_136_10232)) or (INSTRUCTION(11 downto 3) = CONSTANT_276_10237)) or (INSTRUCTION(11 downto 9) & INSTRUCTION(7 downto 5) = CONSTANT_32_10255)) or (INSTRUCTION(11 downto 9) & INSTRUCTION(7 downto 4) = CONSTANT_66_10263)) or (((INSTRUCTION(11 downto 7) = CONSTANT_13_10697) or (INSTRUCTION(11 downto 6) = CONSTANT_28_10216)) or ((((INSTRUCTION(11 downto 6) = CONSTANT_22_10642) or (INSTRUCTION(11 downto 8) & INSTRUCTION(6 downto 6) = CONSTANT_11_10649)) or (INSTRUCTION(11 downto 7) = CONSTANT_12_10654)) or (((INSTRUCTION(11 downto 7) = CONSTANT_8_10201) or (INSTRUCTION(11 downto 6) = CONSTANT_19_10206)) or ((((INSTRUCTION(11 downto 6) = CONSTANT_11_10409) or (INSTRUCTION(11 downto 7) = CONSTANT_6_10191)) or (INSTRUCTION(11 downto 6) = CONSTANT_20_10418)) or (((INSTRUCTION(11 downto 9) = CONSTANT_0_10187) or (INSTRUCTION(11 downto 7) = CONSTANT_4_10346)) or (INSTRUCTION(11 downto 9) & INSTRUCTION(7 downto 6) = CONSTANT_6_10191))))))))))))))) else
		CONSTANT_0_10184;
	main_imm1_srcB_op_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) or ((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183))))) else
		CONSTANT_0_10184(0);
	main_imm1_srcC_op_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_imm3_srcB_am_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) or ((cs_0 = CONSTANT_1_10183) and (cs_79 = CONSTANT_1_10183))) or ((cs_0 = CONSTANT_1_10183) and (cs_90 = CONSTANT_1_10183))))) else
		CONSTANT_0_10184(0);
	main_instr_hw_alu_imm_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_1 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_instr_hw_alu_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_16 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_75 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_41 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_90 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_instr_hw_move_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_47 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_79 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_instr_hw_system_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_83 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_instr_hw_system_rd_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_87 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_instr_hw_system_wr_instr_hw_instr_hw_0_semantics_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_96 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_add_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_52 = CONSTANT_1_10183)) and (cs_57 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_addadd_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_68 = CONSTANT_1_10183)) and (cs_69 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_addi_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_1 = CONSTANT_1_10183)) and (cs_11 = CONSTANT_1_10183)) and (cs_12 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_addmul_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_68 = CONSTANT_1_10183)) and (cs_73 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_addsub_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_68 = CONSTANT_1_10183)) and (cs_71 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_and_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_52 = CONSTANT_1_10183)) and (cs_53 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_andi_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_1 = CONSTANT_1_10183)) and (cs_2 = CONSTANT_1_10183)) and (cs_10 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_ashr_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_52 = CONSTANT_1_10183)) and (cs_61 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_ashri_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_1 = CONSTANT_1_10183)) and (cs_2 = CONSTANT_1_10183)) and (cs_5 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_binand_cond_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_35 = CONSTANT_1_10183)) or (((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183)) and (cs_35 = CONSTANT_1_10183))))) else
		CONSTANT_0_10184(0);
	main_op_binnand_cond_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_36 = CONSTANT_1_10183)) or (((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183)) and (cs_36 = CONSTANT_1_10183))))) else
		CONSTANT_0_10184(0);
	main_op_call_exc_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_16 = CONSTANT_1_10183)) and (cs_19 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_call_int_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_16 = CONSTANT_1_10183)) and (cs_18 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_call_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_16 = CONSTANT_1_10183)) and (cs_17 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_call_reg_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_75 = CONSTANT_1_10183)) and (cs_78 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_ctlz_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_63 = CONSTANT_1_10183)) and (cs_65 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_cttz_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_63 = CONSTANT_1_10183)) and (cs_66 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_eq_cond_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_25 = CONSTANT_1_10183)) or (((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183)) and (cs_25 = CONSTANT_1_10183))))) else
		CONSTANT_0_10184(0);
	main_op_get_status_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_96 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_halt_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_83 = CONSTANT_1_10183)) and (cs_84 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_int_dis_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_83 = CONSTANT_1_10183)) and (cs_86 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_int_en_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_83 = CONSTANT_1_10183)) and (cs_85 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_jump_ie_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_75 = CONSTANT_1_10183)) and (cs_77 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_jump_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_16 = CONSTANT_1_10183)) and (cs_20 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_jump_reg_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_75 = CONSTANT_1_10183)) and (cs_76 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_ld_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_41 = CONSTANT_1_10183)) and (cs_46 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_ldbs_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_41 = CONSTANT_1_10183)) and (cs_42 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_ldbsx_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_90 = CONSTANT_1_10183)) and (cs_91 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_ldbu_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_41 = CONSTANT_1_10183)) and (cs_43 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_ldbux_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_90 = CONSTANT_1_10183)) and (cs_92 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_ldhs_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_41 = CONSTANT_1_10183)) and (cs_45 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_ldhsx_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_90 = CONSTANT_1_10183)) and (cs_94 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_ldhu_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_41 = CONSTANT_1_10183)) and (cs_44 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_ldhux_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_90 = CONSTANT_1_10183)) and (cs_93 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_ldx_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_90 = CONSTANT_1_10183)) and (cs_95 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_logand_cond_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_37 = CONSTANT_1_10183)) or (((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183)) and (cs_37 = CONSTANT_1_10183))))) else
		CONSTANT_0_10184(0);
	main_op_lognand_cond_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_38 = CONSTANT_1_10183)) or (((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183)) and (cs_38 = CONSTANT_1_10183))))) else
		CONSTANT_0_10184(0);
	main_op_lognor_cond_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_40 = CONSTANT_1_10183)) or (((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183)) and (cs_40 = CONSTANT_1_10183))))) else
		CONSTANT_0_10184(0);
	main_op_logor_cond_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_39 = CONSTANT_1_10183)) or (((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183)) and (cs_39 = CONSTANT_1_10183))))) else
		CONSTANT_0_10184(0);
	main_op_lshr_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_52 = CONSTANT_1_10183)) and (cs_62 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_lshri_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_1 = CONSTANT_1_10183)) and (cs_2 = CONSTANT_1_10183)) and (cs_7 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_lui_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_1 = CONSTANT_1_10183)) and (cs_15 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_move_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_22 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_mul_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_52 = CONSTANT_1_10183)) and (cs_59 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_mulsi_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_1 = CONSTANT_1_10183)) and (cs_11 = CONSTANT_1_10183)) and (cs_14 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_mului_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_1 = CONSTANT_1_10183)) and (cs_2 = CONSTANT_1_10183)) and (cs_3 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_ne_cond_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_26 = CONSTANT_1_10183)) or (((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183)) and (cs_26 = CONSTANT_1_10183))))) else
		CONSTANT_0_10184(0);
	main_op_nor_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_52 = CONSTANT_1_10183)) and (cs_55 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_nori_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_1 = CONSTANT_1_10183)) and (cs_2 = CONSTANT_1_10183)) and (cs_9 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_or_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_52 = CONSTANT_1_10183)) and (cs_54 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_ori_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_1 = CONSTANT_1_10183)) and (cs_2 = CONSTANT_1_10183)) and (cs_6 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_printreg_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_87 = CONSTANT_1_10183)) and (cs_88 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_select_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_24 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_set_status_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_87 = CONSTANT_1_10183)) and (cs_89 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_sext16_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_63 = CONSTANT_1_10183)) and (cs_67 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_sext8_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_63 = CONSTANT_1_10183)) and (cs_64 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_sge_cond_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_28 = CONSTANT_1_10183)) or (((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183)) and (cs_28 = CONSTANT_1_10183))))) else
		CONSTANT_0_10184(0);
	main_op_sgt_cond_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_30 = CONSTANT_1_10183)) or (((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183)) and (cs_30 = CONSTANT_1_10183))))) else
		CONSTANT_0_10184(0);
	main_op_shl_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_52 = CONSTANT_1_10183)) and (cs_60 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_shli_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_1 = CONSTANT_1_10183)) and (cs_2 = CONSTANT_1_10183)) and (cs_8 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_sle_cond_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_29 = CONSTANT_1_10183)) or (((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183)) and (cs_29 = CONSTANT_1_10183))))) else
		CONSTANT_0_10184(0);
	main_op_slt_cond_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_27 = CONSTANT_1_10183)) or (((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183)) and (cs_27 = CONSTANT_1_10183))))) else
		CONSTANT_0_10184(0);
	main_op_st_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_47 = CONSTANT_1_10183)) and (cs_50 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_stb_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_47 = CONSTANT_1_10183)) and (cs_48 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_stbx_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_79 = CONSTANT_1_10183)) and (cs_80 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_sth_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_47 = CONSTANT_1_10183)) and (cs_49 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_sthx_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_79 = CONSTANT_1_10183)) and (cs_81 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_stx_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_79 = CONSTANT_1_10183)) and (cs_82 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_sub_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_52 = CONSTANT_1_10183)) and (cs_58 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_subadd_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_68 = CONSTANT_1_10183)) and (cs_70 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_subi_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_1 = CONSTANT_1_10183)) and (cs_11 = CONSTANT_1_10183)) and (cs_13 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_submul_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_68 = CONSTANT_1_10183)) and (cs_74 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_subsub_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_68 = CONSTANT_1_10183)) and (cs_72 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_test_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and (((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_23 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_uge_cond_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_32 = CONSTANT_1_10183)) or (((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183)) and (cs_32 = CONSTANT_1_10183))))) else
		CONSTANT_0_10184(0);
	main_op_ugt_cond_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_34 = CONSTANT_1_10183)) or (((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183)) and (cs_34 = CONSTANT_1_10183))))) else
		CONSTANT_0_10184(0);
	main_op_ule_cond_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_33 = CONSTANT_1_10183)) or (((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183)) and (cs_33 = CONSTANT_1_10183))))) else
		CONSTANT_0_10184(0);
	main_op_ult_cond_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)) and (cs_31 = CONSTANT_1_10183)) or (((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183)) and (cs_31 = CONSTANT_1_10183))))) else
		CONSTANT_0_10184(0);
	main_op_xor_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)) and (cs_52 = CONSTANT_1_10183)) and (cs_56 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	main_op_xori_operation_instr_hw_0_return_ACT <= CONSTANT_1_10183(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((((cs_0 = CONSTANT_1_10183) and (cs_1 = CONSTANT_1_10183)) and (cs_2 = CONSTANT_1_10183)) and (cs_4 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	codasip_attribute_L_main_instr_hw_srcB_am_imm3_val_0_D0 <= std_logic_vector(INSTRUCTION(2 downto 0)) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_51 = CONSTANT_1_10183)))) else 
		std_logic_vector(INSTRUCTION(2 downto 0)) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_79 = CONSTANT_1_10183)))) else 
		std_logic_vector(INSTRUCTION(2 downto 0)) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_90 = CONSTANT_1_10183)))) else
		std_logic_vector(CONSTANT_0_10187);
	codasip_attribute_L_main_instr_hw_srcB_op_imm1_val_0_D0 <= tmp_conv_sign_14591(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)))) else 
		tmp_conv_sign_14592(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_97 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);
	codasip_attribute_L_main_instr_hw_srcC_op_imm1_val_0_D0 <= tmp_conv_sign_14593(0) when ((((s_invalid_instruction = CONSTANT_0_10184) and (ACT = CONSTANT_1_10183(0))) and ((cs_0 = CONSTANT_1_10183) and (cs_21 = CONSTANT_1_10183)))) else
		CONSTANT_0_10184(0);

end architecture RTL;


