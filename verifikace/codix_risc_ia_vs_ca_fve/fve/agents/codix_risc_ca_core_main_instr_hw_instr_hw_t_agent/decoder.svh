/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Declaration of instruction enum and decoding function for decoder 'codix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw'.
 */

`ifndef DECODER_SVH
`define DECODER_SVH

// Definition of the instruction decoder and disassemble function.
class codix_risc_ca_core_main_instr_hw_instr_hw_t_decoder extends uvm_object;

	// registration of object tools
	`uvm_object_utils( codix_risc_ca_core_main_instr_hw_instr_hw_t_decoder )

	// disassembled instruction
	string m_instruction_name;
	// enumeration code for every decoded instruction
	typedef enum {
		_dest_____add___srcA____imm__,
		_dest_____add___srcA___src_am__imm______srcC__,
		_dest_____add_add___srcA___src_am__imm______srcC__,
		_dest_____add_mul___srcA___src_am__imm______srcC__,
		_dest_____add_sub___srcA___src_am__imm______srcC__,
		_dest_____and___srcA____imm__,
		_dest_____and___srcA___src_am__imm______srcC__,
		_dest_____ashr___srcA____imm__,
		_dest_____ashr___srcA___src_am__imm______srcC__,
		_dest_____ctlz___srcA___src_am__imm______srcC__,
		_dest_____cttz___srcA___src_am__imm______srcC__,
		_dest_____ld_____srcA_____imm____,
		_dest_____ld_____srcA____src_am__imm_____,
		_dest_____ldbs_____srcA_____imm____,
		_dest_____ldbs_____srcA____src_am__imm_____,
		_dest_____ldbu_____srcA_____imm____,
		_dest_____ldbu_____srcA____src_am__imm_____,
		_dest_____ldhs_____srcA_____imm____,
		_dest_____ldhs_____srcA____src_am__imm_____,
		_dest_____ldhu_____srcA_____imm____,
		_dest_____ldhu_____srcA____src_am__imm_____,
		_dest_____lshr___srcA____imm__,
		_dest_____lshr___srcA___src_am__imm______srcC__,
		_dest_____lui___srcA____imm__,
		_dest_____move_binand___srcA___src_op__imm____src_op__imm__,
		_dest_____move_binnand___srcA___src_op__imm____src_op__imm__,
		_dest_____move_eq___srcA___src_op__imm____src_op__imm__,
		_dest_____move_logand___srcA___src_op__imm____src_op__imm__,
		_dest_____move_lognand___srcA___src_op__imm____src_op__imm__,
		_dest_____move_lognor___srcA___src_op__imm____src_op__imm__,
		_dest_____move_logor___srcA___src_op__imm____src_op__imm__,
		_dest_____move_ne___srcA___src_op__imm____src_op__imm__,
		_dest_____move_sge___srcA___src_op__imm____src_op__imm__,
		_dest_____move_sgt___srcA___src_op__imm____src_op__imm__,
		_dest_____move_sle___srcA___src_op__imm____src_op__imm__,
		_dest_____move_slt___srcA___src_op__imm____src_op__imm__,
		_dest_____move_uge___srcA___src_op__imm____src_op__imm__,
		_dest_____move_ugt___srcA___src_op__imm____src_op__imm__,
		_dest_____move_ule___srcA___src_op__imm____src_op__imm__,
		_dest_____move_ult___srcA___src_op__imm____src_op__imm__,
		_dest_____mul___srcA___src_am__imm______srcC__,
		_dest_____muls___srcA____imm__,
		_dest_____mulu___srcA____imm__,
		_dest_____nor___srcA____imm__,
		_dest_____nor___srcA___src_am__imm______srcC__,
		_dest_____or___srcA____imm__,
		_dest_____or___srcA___src_am__imm______srcC__,
		_dest_____select_binand___srcA___src_op__imm____src_op__imm__,
		_dest_____select_binnand___srcA___src_op__imm____src_op__imm__,
		_dest_____select_eq___srcA___src_op__imm____src_op__imm__,
		_dest_____select_logand___srcA___src_op__imm____src_op__imm__,
		_dest_____select_lognand___srcA___src_op__imm____src_op__imm__,
		_dest_____select_lognor___srcA___src_op__imm____src_op__imm__,
		_dest_____select_logor___srcA___src_op__imm____src_op__imm__,
		_dest_____select_ne___srcA___src_op__imm____src_op__imm__,
		_dest_____select_sge___srcA___src_op__imm____src_op__imm__,
		_dest_____select_sgt___srcA___src_op__imm____src_op__imm__,
		_dest_____select_sle___srcA___src_op__imm____src_op__imm__,
		_dest_____select_slt___srcA___src_op__imm____src_op__imm__,
		_dest_____select_uge___srcA___src_op__imm____src_op__imm__,
		_dest_____select_ugt___srcA___src_op__imm____src_op__imm__,
		_dest_____select_ule___srcA___src_op__imm____src_op__imm__,
		_dest_____select_ult___srcA___src_op__imm____src_op__imm__,
		_dest_____sext16___srcA___src_am__imm______srcC__,
		_dest_____sext8___srcA___src_am__imm______srcC__,
		_dest_____shl___srcA____imm__,
		_dest_____shl___srcA___src_am__imm______srcC__,
		_dest_____sub___srcA____imm__,
		_dest_____sub___srcA___src_am__imm______srcC__,
		_dest_____sub_add___srcA___src_am__imm______srcC__,
		_dest_____sub_mul___srcA___src_am__imm______srcC__,
		_dest_____sub_sub___srcA___src_am__imm______srcC__,
		_dest_____test_binand___srcA___src_op__imm____src_op__imm__,
		_dest_____test_binnand___srcA___src_op__imm____src_op__imm__,
		_dest_____test_eq___srcA___src_op__imm____src_op__imm__,
		_dest_____test_logand___srcA___src_op__imm____src_op__imm__,
		_dest_____test_lognand___srcA___src_op__imm____src_op__imm__,
		_dest_____test_lognor___srcA___src_op__imm____src_op__imm__,
		_dest_____test_logor___srcA___src_op__imm____src_op__imm__,
		_dest_____test_ne___srcA___src_op__imm____src_op__imm__,
		_dest_____test_sge___srcA___src_op__imm____src_op__imm__,
		_dest_____test_sgt___srcA___src_op__imm____src_op__imm__,
		_dest_____test_sle___srcA___src_op__imm____src_op__imm__,
		_dest_____test_slt___srcA___src_op__imm____src_op__imm__,
		_dest_____test_uge___srcA___src_op__imm____src_op__imm__,
		_dest_____test_ugt___srcA___src_op__imm____src_op__imm__,
		_dest_____test_ule___srcA___src_op__imm____src_op__imm__,
		_dest_____test_ult___srcA___src_op__imm____src_op__imm__,
		_dest_____xor___srcA____imm__,
		_dest_____xor___srcA___src_am__imm______srcC__,
		call___addr__,
		call___srcB__,
		call_exc___addr__,
		call_int___addr__,
		get_status_,
		halt_,
		int_disable_,
		int_enable_,
		jump___addr__,
		jump___srcB__,
		jump__binand___srcA___src_op__imm_____addr__,
		jump__binnand___srcA___src_op__imm_____addr__,
		jump__eq___srcA___src_op__imm_____addr__,
		jump__logand___srcA___src_op__imm_____addr__,
		jump__lognand___srcA___src_op__imm_____addr__,
		jump__lognor___srcA___src_op__imm_____addr__,
		jump__logor___srcA___src_op__imm_____addr__,
		jump__ne___srcA___src_op__imm_____addr__,
		jump__sge___srcA___src_op__imm_____addr__,
		jump__sgt___srcA___src_op__imm_____addr__,
		jump__sle___srcA___src_op__imm_____addr__,
		jump__slt___srcA___src_op__imm_____addr__,
		jump__uge___srcA___src_op__imm_____addr__,
		jump__ugt___srcA___src_op__imm_____addr__,
		jump__ule___srcA___src_op__imm_____addr__,
		jump__ult___srcA___src_op__imm_____addr__,
		jump_ie___srcB__,
		print_reg_,
		set_status_,
		st___srcC______srcA_____imm____,
		st__srcC_____srcA____src_am__imm_____,
		stb___srcC______srcA_____imm____,
		stb__srcC_____srcA____src_am__imm_____,
		sth___srcC______srcA_____imm____,
		sth__srcC_____srcA____src_am__imm_____,
		UNKNOWN
	} operation_codes_e;
	// assembler representation of every instruction
	local operation_codes_e m_decoding_map[string];

	// internal constants representing decoding state
	typedef enum {
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_binand_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_binnand_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_eq_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_logand_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_lognand_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_lognor_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_logor_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ne_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_sge_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_sgt_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_sle_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_slt_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_uge_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ugt_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ule_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ult_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_alu_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_alu_imm_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_jump_abs_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_jump_ind_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_jump_rel_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_ld_imm_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_ld_reg_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_move_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_st_imm_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_st_reg_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_system_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_system_rd_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_system_wr_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_add_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_addadd_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_addi_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_addmul_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_addsub_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_and_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_andi_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ashr_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ashri_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_call_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_call_exc_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_call_int_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_call_reg_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ctlz_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_cttz_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_get_status_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_halt_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_int_dis_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_int_en_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_jump_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_jump_ie_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_jump_reg_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ld_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldbs_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldbsx_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldbu_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldbux_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldhs_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldhsx_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldhu_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldhux_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldx_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_lshr_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_lshri_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_lui_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_move_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_mul_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_mulsi_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_mului_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_nor_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_nori_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_or_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ori_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_printreg_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_select_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_set_status_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_sext16_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_sext8_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_shl_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_shli_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_st_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_stb_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_stbx_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_sth_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_sthx_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_stx_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_sub_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_subadd_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_subi_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_submul_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_subsub_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_test_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_xor_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_xori_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_opr_alu_1op_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_opr_alu_2op_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_opr_alu_3op_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_opr_alu_simm_0,
		CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_opr_alu_uimm_0,
		CODASIP_SWITCH_UNDEF
	} codasip_parser_switch_e;
	// capture decoding state
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_cond_cond_cmp_0;
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_instr_hw_instr_hw_0;
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_operation_opr_alu_1op_0;
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_operation_opr_alu_2op_0;
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_operation_opr_alu_3op_0;
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_operation_opr_alu_imm_all_0;
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_operation_opr_alu_reg_all_0;
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_operation_opr_alu_simm_0;
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_operation_opr_alu_uimm_0;
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_operation_opr_jump_call_0;
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_operation_opr_jump_reg_0;
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_operation_opr_ld_imm_0;
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_operation_opr_ld_reg_0;
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_operation_opr_move_0;
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_operation_opr_st_imm_0;
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_operation_opr_st_reg_0;
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_operation_opr_system_0;
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_operation_opr_system_rd_0;
	local codasip_parser_switch_e codasip_switch_main_0_instr_hw_operation_opr_system_wr_0;

	// Constructor - creates new instance of this class
	function new( string name = "codix_risc_ca_core_main_instr_hw_instr_hw_t_decoder" );
		super.new( name );
		init_map();
		SwitchClean();
	endfunction: new

	// Decode binary instruction
	function automatic operation_codes_e decode( logic [11:0] fetch );
		if ( !dsm_parse(fetch) ) begin
			m_instruction_name = "UNKNOWN";
			return UNKNOWN;
		end
		m_instruction_name = dsm_generate();
		if ( m_decoding_map.exists(m_instruction_name) ) begin
			return m_decoding_map[m_instruction_name];
		end else begin
			return UNKNOWN;
		end
	endfunction: decode

	// additional function definitions

	function bit dsm_parse( logic [11:0] fetch );
		SwitchClean();
		if (dsm_parse_bs_12(fetch)) return 1;
	endfunction: dsm_parse

	function bit dsm_parse_bs_12( logic [11:0] fetch );
		if ((fetch ==? 12'b000????????? /*000XXXXXXXXX*/ ) || 
				(fetch ==? 12'b00100??????? /*00100XXXXXXX*/ ) || 
				(fetch ==? 12'b001?10?????? /*001X10XXXXXX*/ )) begin
			codasip_switch_main_0_instr_hw_instr_hw_instr_hw_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_alu_imm_0;
			if ((fetch ==? 12'b000?11?????? /*000X11*/ ) || 
					(fetch ==? 12'b00?001?????? /*00X001*/ ) || 
					(fetch ==? 12'b00?0?0?????? /*00X0X0*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_alu_imm_all_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_opr_alu_uimm_0;
				if ((fetch ==? 12'b000111?????? /*000111*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_uimm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_mului_0;
				end
				else if ((fetch ==? 12'b000011?????? /*000011*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_uimm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_xori_0;
				end
				else if ((fetch ==? 12'b001001?????? /*001001*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_uimm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ashri_0;
				end
				else if ((fetch ==? 12'b000001?????? /*000001*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_uimm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ori_0;
				end
				else if ((fetch ==? 12'b001010?????? /*001010*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_uimm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_lshri_0;
				end
				else if ((fetch ==? 12'b001000?????? /*001000*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_uimm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_shli_0;
				end
				else if ((fetch ==? 12'b000010?????? /*000010*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_uimm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_nori_0;
				end
				else if ((fetch ==? 12'b000000?????? /*000000*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_uimm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_andi_0;
				end
				else return 0;
			end
			else if ((fetch ==? 12'b00010??????? /*00010X*/ ) || 
					(fetch ==? 12'b000110?????? /*000110*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_alu_imm_all_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_opr_alu_simm_0;
				if ((fetch ==? 12'b000100?????? /*000100*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_simm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_addi_0;
				end
				else if ((fetch ==? 12'b000101?????? /*000101*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_simm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_subi_0;
				end
				else if ((fetch ==? 12'b000110?????? /*000110*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_simm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_mulsi_0;
				end
				else return 0;
			end
			else if ((fetch ==? 12'b001110?????? /*001110*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_alu_imm_all_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_lui_0;
			end
			else return 0;
		end
		else if ((fetch ==? 12'b001011?????? /*001011XXXXXX*/ ) || 
				(fetch ==? 12'b00110??????? /*00110XXXXXXX*/ ) || 
				(fetch ==? 12'b010100?????? /*010100XXXXXX*/ )) begin
			codasip_switch_main_0_instr_hw_instr_hw_instr_hw_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_jump_abs_0;
			if ((fetch ==? 12'b001011?????? /*001011*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_jump_call_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_call_0;
			end
			else if ((fetch ==? 12'b001100?????? /*001100*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_jump_call_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_call_int_0;
			end
			else if ((fetch ==? 12'b001101?????? /*001101*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_jump_call_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_call_exc_0;
			end
			else if ((fetch ==? 12'b010100?????? /*010100*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_jump_call_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_jump_0;
			end
			else return 0;
		end
		else if ((fetch ==? 12'b01000??????? /*01000XXXXXXX*/ ) || 
				(fetch ==? 12'b010011?????? /*010011XXXXXX*/ )) begin
			codasip_switch_main_0_instr_hw_instr_hw_instr_hw_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_move_0;
			if ((fetch ==? 12'b010000?????? /*010000*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_move_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_move_0;
			end
			else if ((fetch ==? 12'b010001?????? /*010001*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_move_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_test_0;
			end
			else if ((fetch ==? 12'b010011?????? /*010011*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_move_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_select_0;
			end
			else return 0;
			if (!dsm_parse_main_0_instr_hw_cond_cond_cmp_0_bc_3_2_1_0_(fetch)) return 0;
			if ((fetch ==? 12'b????????0000 /*XXXXXXXX0000*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_eq_0;
			end
			else if ((fetch ==? 12'b????????0001 /*XXXXXXXX0001*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ne_0;
			end
			else if ((fetch ==? 12'b????????0010 /*XXXXXXXX0010*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_slt_0;
			end
			else if ((fetch ==? 12'b????????0011 /*XXXXXXXX0011*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_sge_0;
			end
			else if ((fetch ==? 12'b????????0100 /*XXXXXXXX0100*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_sle_0;
			end
			else if ((fetch ==? 12'b????????0101 /*XXXXXXXX0101*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_sgt_0;
			end
			else if ((fetch ==? 12'b????????0110 /*XXXXXXXX0110*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ult_0;
			end
			else if ((fetch ==? 12'b????????0111 /*XXXXXXXX0111*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_uge_0;
			end
			else if ((fetch ==? 12'b????????1000 /*XXXXXXXX1000*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ule_0;
			end
			else if ((fetch ==? 12'b????????1001 /*XXXXXXXX1001*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ugt_0;
			end
			else if ((fetch ==? 12'b????????1010 /*XXXXXXXX1010*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_binand_0;
			end
			else if ((fetch ==? 12'b????????1011 /*XXXXXXXX1011*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_binnand_0;
			end
			else if ((fetch ==? 12'b????????1100 /*XXXXXXXX1100*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_logand_0;
			end
			else if ((fetch ==? 12'b????????1101 /*XXXXXXXX1101*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_lognand_0;
			end
			else if ((fetch ==? 12'b????????1110 /*XXXXXXXX1110*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_logor_0;
			end
			else if ((fetch ==? 12'b????????1111 /*XXXXXXXX1111*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_lognor_0;
			end
			else return 0;
		end
		else if ((fetch ==? 12'b010110?????? /*010110XXXXXX*/ ) || 
				(fetch ==? 12'b0101?1?????? /*0101X1XXXXXX*/ ) || 
				(fetch ==? 12'b01100??????? /*01100XXXXXXX*/ )) begin
			codasip_switch_main_0_instr_hw_instr_hw_instr_hw_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_ld_imm_0;
			if ((fetch ==? 12'b010110?????? /*010110*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_ld_imm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldbs_0;
			end
			else if ((fetch ==? 12'b010101?????? /*010101*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_ld_imm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldbu_0;
			end
			else if ((fetch ==? 12'b010111?????? /*010111*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_ld_imm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldhu_0;
			end
			else if ((fetch ==? 12'b011000?????? /*011000*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_ld_imm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldhs_0;
			end
			else if ((fetch ==? 12'b011001?????? /*011001*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_ld_imm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ld_0;
			end
			else return 0;
		end
		else if ((fetch ==? 12'b01101??????? /*01101XXXXXXX*/ ) || 
				(fetch ==? 12'b011100?????? /*011100XXXXXX*/ )) begin
			codasip_switch_main_0_instr_hw_instr_hw_instr_hw_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_st_imm_0;
			if ((fetch ==? 12'b011010?????? /*011010*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_st_imm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_stb_0;
			end
			else if ((fetch ==? 12'b011011?????? /*011011*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_st_imm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_sth_0;
			end
			else if ((fetch ==? 12'b011100?????? /*011100*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_st_imm_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_st_0;
			end
			else return 0;
		end
		else if ((fetch ==? 12'b100000110??? /*100000110XXX*/ ) || 
				(fetch ==? 12'b10000100???? /*10000100XXXX*/ ) || 
				(fetch ==? 12'b100001010??? /*100001010XXX*/ ) || 
				(fetch ==? 12'b100010011??? /*100010011XXX*/ ) || 
				(fetch ==? 12'b1000100?0??? /*1000100X0XXX*/ ) || 
				(fetch ==? 12'b100010100??? /*100010100XXX*/ ) || 
				(fetch ==? 12'b100?000????? /*100X000XXXXX*/ ) || 
				(fetch ==? 12'b100?0010???? /*100X0010XXXX*/ )) begin
			codasip_switch_main_0_instr_hw_instr_hw_instr_hw_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_alu_0;
			if ((fetch ==? 12'b1000000????? /*1000000XX*/ ) || 
					(fetch ==? 12'b10000010???? /*10000010X*/ ) || 
					(fetch ==? 12'b100000110??? /*100000110*/ ) || 
					(fetch ==? 12'b10000100???? /*10000100X*/ ) || 
					(fetch ==? 12'b100001010??? /*100001010*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_alu_reg_all_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_opr_alu_2op_0;
				if ((fetch ==? 12'b100000000??? /*100000000*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_2op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_and_0;
				end
				else if ((fetch ==? 12'b100000001??? /*100000001*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_2op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_or_0;
				end
				else if ((fetch ==? 12'b100000010??? /*100000010*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_2op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_nor_0;
				end
				else if ((fetch ==? 12'b100000011??? /*100000011*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_2op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_xor_0;
				end
				else if ((fetch ==? 12'b100000100??? /*100000100*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_2op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_add_0;
				end
				else if ((fetch ==? 12'b100000101??? /*100000101*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_2op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_sub_0;
				end
				else if ((fetch ==? 12'b100000110??? /*100000110*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_2op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_mul_0;
				end
				else if ((fetch ==? 12'b100001000??? /*100001000*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_2op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_shl_0;
				end
				else if ((fetch ==? 12'b100001001??? /*100001001*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_2op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ashr_0;
				end
				else if ((fetch ==? 12'b100001010??? /*100001010*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_2op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_lshr_0;
				end
				else return 0;
			end
			else if ((fetch ==? 12'b100010011??? /*100010011*/ ) || 
					(fetch ==? 12'b1000100?0??? /*1000100X0*/ ) || 
					(fetch ==? 12'b100010100??? /*100010100*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_alu_reg_all_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_opr_alu_1op_0;
				if ((fetch ==? 12'b100010011??? /*100010011*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_1op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_sext8_0;
				end
				else if ((fetch ==? 12'b100010000??? /*100010000*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_1op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ctlz_0;
				end
				else if ((fetch ==? 12'b100010010??? /*100010010*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_1op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_cttz_0;
				end
				else if ((fetch ==? 12'b100010100??? /*100010100*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_1op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_sext16_0;
				end
				else return 0;
			end
			else if ((fetch ==? 12'b1001000????? /*1001000XX*/ ) || 
					(fetch ==? 12'b10010010???? /*10010010X*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_alu_reg_all_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_opr_alu_3op_0;
				if ((fetch ==? 12'b100100000??? /*100100000*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_3op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_addadd_0;
				end
				else if ((fetch ==? 12'b100100001??? /*100100001*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_3op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_subadd_0;
				end
				else if ((fetch ==? 12'b100100010??? /*100100010*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_3op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_addsub_0;
				end
				else if ((fetch ==? 12'b100100011??? /*100100011*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_3op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_subsub_0;
				end
				else if ((fetch ==? 12'b100100100??? /*100100100*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_3op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_addmul_0;
				end
				else if ((fetch ==? 12'b100100101??? /*100100101*/ )) begin
					codasip_switch_main_0_instr_hw_operation_opr_alu_3op_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_submul_0;
				end
				else return 0;
			end
			else return 0;
		end
		else if ((fetch ==? 12'b10011000???? /*10011000XXXX*/ ) || 
				(fetch ==? 12'b100110010??? /*100110010XXX*/ )) begin
			codasip_switch_main_0_instr_hw_instr_hw_instr_hw_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_jump_ind_0;
			if ((fetch ==? 12'b100110000??? /*100110000*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_jump_reg_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_jump_reg_0;
			end
			else if ((fetch ==? 12'b100110001??? /*100110001*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_jump_reg_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_jump_ie_0;
			end
			else if ((fetch ==? 12'b100110010??? /*100110010*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_jump_reg_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_call_reg_0;
			end
			else return 0;
		end
		else if ((fetch ==? 12'b10100101???? /*10100101XXXX*/ ) || 
				(fetch ==? 12'b101001100??? /*101001100XXX*/ )) begin
			codasip_switch_main_0_instr_hw_instr_hw_instr_hw_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_st_reg_0;
			if ((fetch ==? 12'b101001010??? /*101001010*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_st_reg_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_stbx_0;
			end
			else if ((fetch ==? 12'b101001011??? /*101001011*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_st_reg_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_sthx_0;
			end
			else if ((fetch ==? 12'b101001100??? /*101001100*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_st_reg_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_stx_0;
			end
			else return 0;
		end
		else if ((fetch ==? 12'b101010000??? /*101010000XXX*/ ) || 
				(fetch ==? 12'b101010101??? /*101010101XXX*/ ) || 
				(fetch ==? 12'b101010110??? /*101010110XXX*/ )) begin
			codasip_switch_main_0_instr_hw_instr_hw_instr_hw_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_system_0;
			if ((fetch ==? 12'b101010000??? /*101010000*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_system_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_halt_0;
			end
			else if ((fetch ==? 12'b101010101??? /*101010101*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_system_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_int_en_0;
			end
			else if ((fetch ==? 12'b101010110??? /*101010110*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_system_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_int_dis_0;
			end
			else return 0;
		end
		else if ((fetch ==? 12'b101010011??? /*101010011XXX*/ ) || 
				(fetch ==? 12'b101011000??? /*101011000XXX*/ )) begin
			codasip_switch_main_0_instr_hw_instr_hw_instr_hw_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_system_rd_0;
			if ((fetch ==? 12'b101010011??? /*101010011*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_system_rd_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_printreg_0;
			end
			else if ((fetch ==? 12'b101011000??? /*101011000*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_system_rd_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_set_status_0;
			end
			else return 0;
		end
		else if ((fetch ==? 12'b101000110??? /*101000110XXX*/ ) || 
				(fetch ==? 12'b1010001?1??? /*1010001X1XXX*/ ) || 
				(fetch ==? 12'b10100100???? /*10100100XXXX*/ )) begin
			codasip_switch_main_0_instr_hw_instr_hw_instr_hw_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_ld_reg_0;
			if ((fetch ==? 12'b101000110??? /*101000110*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_ld_reg_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldbsx_0;
			end
			else if ((fetch ==? 12'b101000101??? /*101000101*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_ld_reg_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldbux_0;
			end
			else if ((fetch ==? 12'b101000111??? /*101000111*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_ld_reg_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldhux_0;
			end
			else if ((fetch ==? 12'b101001000??? /*101001000*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_ld_reg_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldhsx_0;
			end
			else if ((fetch ==? 12'b101001001??? /*101001001*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_ld_reg_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldx_0;
			end
			else return 0;
		end
		else if ((fetch ==? 12'b101010111??? /*101010111XXX*/ )) begin
			codasip_switch_main_0_instr_hw_instr_hw_instr_hw_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_system_wr_0;
			if ((fetch ==? 12'b101010111??? /*101010111*/ )) begin
				codasip_switch_main_0_instr_hw_operation_opr_system_wr_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_get_status_0;
			end
			else return 0;
		end
		else if ((fetch ==? 12'b111????????? /*111XXXXXXXXX*/ )) begin
			codasip_switch_main_0_instr_hw_instr_hw_instr_hw_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_jump_rel_0;
			if (!dsm_parse_main_0_instr_hw_cond_cond_cmp_0_bc_3_2_1_0_(fetch)) return 0;
			if ((fetch ==? 12'b????????0000 /*XXXXXXXX0000*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_eq_0;
			end
			else if ((fetch ==? 12'b????????0001 /*XXXXXXXX0001*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ne_0;
			end
			else if ((fetch ==? 12'b????????0010 /*XXXXXXXX0010*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_slt_0;
			end
			else if ((fetch ==? 12'b????????0011 /*XXXXXXXX0011*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_sge_0;
			end
			else if ((fetch ==? 12'b????????0100 /*XXXXXXXX0100*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_sle_0;
			end
			else if ((fetch ==? 12'b????????0101 /*XXXXXXXX0101*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_sgt_0;
			end
			else if ((fetch ==? 12'b????????0110 /*XXXXXXXX0110*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ult_0;
			end
			else if ((fetch ==? 12'b????????0111 /*XXXXXXXX0111*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_uge_0;
			end
			else if ((fetch ==? 12'b????????1000 /*XXXXXXXX1000*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ule_0;
			end
			else if ((fetch ==? 12'b????????1001 /*XXXXXXXX1001*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ugt_0;
			end
			else if ((fetch ==? 12'b????????1010 /*XXXXXXXX1010*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_binand_0;
			end
			else if ((fetch ==? 12'b????????1011 /*XXXXXXXX1011*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_binnand_0;
			end
			else if ((fetch ==? 12'b????????1100 /*XXXXXXXX1100*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_logand_0;
			end
			else if ((fetch ==? 12'b????????1101 /*XXXXXXXX1101*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_lognand_0;
			end
			else if ((fetch ==? 12'b????????1110 /*XXXXXXXX1110*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_logor_0;
			end
			else if ((fetch ==? 12'b????????1111 /*XXXXXXXX1111*/ )) begin
				codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_lognor_0;
			end
			else return 0;
		end
		else return 0;
		return 1;
	endfunction: dsm_parse_bs_12

	function bit dsm_parse_main_0_instr_hw_cond_cond_cmp_0_bc_3_2_1_0_( logic [11:0] fetch );
		if ((fetch ==? 12'b????????0000 /*XXXXXXXX0000*/ )) begin
			codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_eq_0;
		end
		else if ((fetch ==? 12'b????????0001 /*XXXXXXXX0001*/ )) begin
			codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ne_0;
		end
		else if ((fetch ==? 12'b????????0010 /*XXXXXXXX0010*/ )) begin
			codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_slt_0;
		end
		else if ((fetch ==? 12'b????????0011 /*XXXXXXXX0011*/ )) begin
			codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_sge_0;
		end
		else if ((fetch ==? 12'b????????0100 /*XXXXXXXX0100*/ )) begin
			codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_sle_0;
		end
		else if ((fetch ==? 12'b????????0101 /*XXXXXXXX0101*/ )) begin
			codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_sgt_0;
		end
		else if ((fetch ==? 12'b????????0110 /*XXXXXXXX0110*/ )) begin
			codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ult_0;
		end
		else if ((fetch ==? 12'b????????0111 /*XXXXXXXX0111*/ )) begin
			codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_uge_0;
		end
		else if ((fetch ==? 12'b????????1000 /*XXXXXXXX1000*/ )) begin
			codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ule_0;
		end
		else if ((fetch ==? 12'b????????1001 /*XXXXXXXX1001*/ )) begin
			codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ugt_0;
		end
		else if ((fetch ==? 12'b????????1010 /*XXXXXXXX1010*/ )) begin
			codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_binand_0;
		end
		else if ((fetch ==? 12'b????????1011 /*XXXXXXXX1011*/ )) begin
			codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_binnand_0;
		end
		else if ((fetch ==? 12'b????????1100 /*XXXXXXXX1100*/ )) begin
			codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_logand_0;
		end
		else if ((fetch ==? 12'b????????1101 /*XXXXXXXX1101*/ )) begin
			codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_lognand_0;
		end
		else if ((fetch ==? 12'b????????1110 /*XXXXXXXX1110*/ )) begin
			codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_logor_0;
		end
		else if ((fetch ==? 12'b????????1111 /*XXXXXXXX1111*/ )) begin
			codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_lognor_0;
		end
		else return 0;
		return 1;
	endfunction: dsm_parse_main_0_instr_hw_cond_cond_cmp_0_bc_3_2_1_0_

	function string dsm_generate();
		string instruction;
		instruction = "";
		case (codasip_switch_main_0_instr_hw_instr_hw_instr_hw_0)
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_alu_imm_0 : begin
				instruction = {instruction, "<dest> =  "};
				case (codasip_switch_main_0_instr_hw_operation_opr_alu_imm_all_0)
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_opr_alu_simm_0 : begin
					case (codasip_switch_main_0_instr_hw_operation_opr_alu_simm_0)
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_addi_0 : begin
							instruction = {instruction, "add "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_subi_0 : begin
							instruction = {instruction, "sub "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_mulsi_0 : begin
							instruction = {instruction, "muls "};
					end
					default : begin
						return "";
					end
					endcase
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_opr_alu_uimm_0 : begin
					case (codasip_switch_main_0_instr_hw_operation_opr_alu_uimm_0)
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_andi_0 : begin
							instruction = {instruction, "and "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ori_0 : begin
							instruction = {instruction, "or "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_nori_0 : begin
							instruction = {instruction, "nor "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_xori_0 : begin
							instruction = {instruction, "xor "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_mului_0 : begin
							instruction = {instruction, "mulu "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_shli_0 : begin
							instruction = {instruction, "shl "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ashri_0 : begin
							instruction = {instruction, "ashr "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_lshri_0 : begin
							instruction = {instruction, "lshr "};
					end
					default : begin
						return "";
					end
					endcase
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_lui_0 : begin
						instruction = {instruction, "lui "};
				end
				default : begin
					return "";
				end
				endcase
				instruction = {instruction, " <srcA>, <imm> "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_alu_0 : begin
				instruction = {instruction, "<dest> =  "};
				case (codasip_switch_main_0_instr_hw_operation_opr_alu_reg_all_0)
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_opr_alu_1op_0 : begin
					case (codasip_switch_main_0_instr_hw_operation_opr_alu_1op_0)
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ctlz_0 : begin
							instruction = {instruction, "ctlz "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_cttz_0 : begin
							instruction = {instruction, "cttz "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_sext8_0 : begin
							instruction = {instruction, "sext8 "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_sext16_0 : begin
							instruction = {instruction, "sext16 "};
					end
					default : begin
						return "";
					end
					endcase
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_opr_alu_2op_0 : begin
					case (codasip_switch_main_0_instr_hw_operation_opr_alu_2op_0)
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_and_0 : begin
							instruction = {instruction, "and "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_or_0 : begin
							instruction = {instruction, "or "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_nor_0 : begin
							instruction = {instruction, "nor "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_xor_0 : begin
							instruction = {instruction, "xor "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_add_0 : begin
							instruction = {instruction, "add "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_sub_0 : begin
							instruction = {instruction, "sub "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_mul_0 : begin
							instruction = {instruction, "mul "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_shl_0 : begin
							instruction = {instruction, "shl "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ashr_0 : begin
							instruction = {instruction, "ashr "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_lshr_0 : begin
							instruction = {instruction, "lshr "};
					end
					default : begin
						return "";
					end
					endcase
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_opr_alu_3op_0 : begin
					case (codasip_switch_main_0_instr_hw_operation_opr_alu_3op_0)
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_addadd_0 : begin
							instruction = {instruction, "add add "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_subadd_0 : begin
							instruction = {instruction, "sub add "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_addsub_0 : begin
							instruction = {instruction, "add sub "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_subsub_0 : begin
							instruction = {instruction, "sub sub "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_addmul_0 : begin
							instruction = {instruction, "add mul "};
					end
					CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_submul_0 : begin
							instruction = {instruction, "sub mul "};
					end
					default : begin
						return "";
					end
					endcase
				end
				default : begin
					return "";
				end
				endcase
				instruction = {instruction, " <srcA>, src_am_ "};
				if (instruction[instruction.len() - 1] == " ") begin instruction = instruction.substr(0, instruction.len() - 2); end
					instruction = {instruction, "<imm> "};				instruction = {instruction, " , <srcC> "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_move_0 : begin
				instruction = {instruction, "<dest> =  "};
				case (codasip_switch_main_0_instr_hw_operation_opr_move_0)
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_move_0 : begin
						instruction = {instruction, "move "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_test_0 : begin
						instruction = {instruction, "test "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_select_0 : begin
						instruction = {instruction, "select "};
				end
				default : begin
					return "";
				end
				endcase
				instruction = {instruction,dsm_generate_main_0_instr_hw_cond_cond_cmp_0()};
				instruction = {instruction, " <srcA>, src_op_ "};
				if (instruction[instruction.len() - 1] == " ") begin instruction = instruction.substr(0, instruction.len() - 2); end
					instruction = {instruction, "<imm> "};				instruction = {instruction, ", src_op_ "};
				if (instruction[instruction.len() - 1] == " ") begin instruction = instruction.substr(0, instruction.len() - 2); end
					instruction = {instruction, "<imm> "};		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_jump_abs_0 : begin
				case (codasip_switch_main_0_instr_hw_operation_opr_jump_call_0)
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_jump_0 : begin
						instruction = {instruction, "jump "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_call_0 : begin
						instruction = {instruction, "call "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_call_int_0 : begin
						instruction = {instruction, "call_int "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_call_exc_0 : begin
						instruction = {instruction, "call_exc "};
				end
				default : begin
					return "";
				end
				endcase
				instruction = {instruction, " <addr> "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_jump_ind_0 : begin
				case (codasip_switch_main_0_instr_hw_operation_opr_jump_reg_0)
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_jump_reg_0 : begin
						instruction = {instruction, "jump "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_jump_ie_0 : begin
						instruction = {instruction, "jump_ie "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_call_reg_0 : begin
						instruction = {instruction, "call "};
				end
				default : begin
					return "";
				end
				endcase
				instruction = {instruction, " <srcB> "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_jump_rel_0 : begin
				instruction = {instruction, "jump  "};
				instruction = {instruction,dsm_generate_main_0_instr_hw_cond_cond_cmp_0()};
				instruction = {instruction, " <srcA>, src_op_ "};
				if (instruction[instruction.len() - 1] == " ") begin instruction = instruction.substr(0, instruction.len() - 2); end
					instruction = {instruction, "<imm> "};				instruction = {instruction, ", <addr> "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_ld_imm_0 : begin
				instruction = {instruction, "<dest> =  "};
				case (codasip_switch_main_0_instr_hw_operation_opr_ld_imm_0)
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldbu_0 : begin
						instruction = {instruction, "ldbu "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldbs_0 : begin
						instruction = {instruction, "ldbs "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldhu_0 : begin
						instruction = {instruction, "ldhu "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldhs_0 : begin
						instruction = {instruction, "ldhs "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ld_0 : begin
						instruction = {instruction, "ld "};
				end
				default : begin
					return "";
				end
				endcase
				instruction = {instruction, " [ <srcA> + <imm> ] "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_st_imm_0 : begin
				case (codasip_switch_main_0_instr_hw_operation_opr_st_imm_0)
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_stb_0 : begin
						instruction = {instruction, "stb "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_sth_0 : begin
						instruction = {instruction, "sth "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_st_0 : begin
						instruction = {instruction, "st "};
				end
				default : begin
					return "";
				end
				endcase
				instruction = {instruction, " <srcC>, [ <srcA> + <imm> ] "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_ld_reg_0 : begin
				instruction = {instruction, "<dest> =  "};
				case (codasip_switch_main_0_instr_hw_operation_opr_ld_reg_0)
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldbux_0 : begin
						instruction = {instruction, "ldbu "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldbsx_0 : begin
						instruction = {instruction, "ldbs "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldhux_0 : begin
						instruction = {instruction, "ldhu "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldhsx_0 : begin
						instruction = {instruction, "ldhs "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_ldx_0 : begin
						instruction = {instruction, "ld "};
				end
				default : begin
					return "";
				end
				endcase
				instruction = {instruction, " [ <srcA> + src_am_ "};
				if (instruction[instruction.len() - 1] == " ") begin instruction = instruction.substr(0, instruction.len() - 2); end
					instruction = {instruction, "<imm> "};				instruction = {instruction, " ] "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_st_reg_0 : begin
				case (codasip_switch_main_0_instr_hw_operation_opr_st_reg_0)
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_stbx_0 : begin
						instruction = {instruction, "stb "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_sthx_0 : begin
						instruction = {instruction, "sth "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_stx_0 : begin
						instruction = {instruction, "st "};
				end
				default : begin
					return "";
				end
				endcase
				instruction = {instruction, " srcC, [ <srcA> + src_am_ "};
				if (instruction[instruction.len() - 1] == " ") begin instruction = instruction.substr(0, instruction.len() - 2); end
					instruction = {instruction, "<imm> "};				instruction = {instruction, " ] "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_system_0 : begin
				case (codasip_switch_main_0_instr_hw_operation_opr_system_0)
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_halt_0 : begin
						instruction = {instruction, "halt "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_int_en_0 : begin
						instruction = {instruction, "int_enable "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_int_dis_0 : begin
						instruction = {instruction, "int_disable "};
				end
				default : begin
					return "";
				end
				endcase
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_system_rd_0 : begin
				case (codasip_switch_main_0_instr_hw_operation_opr_system_rd_0)
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_printreg_0 : begin
						instruction = {instruction, "print_reg "};
				end
				CODASIP_SWITCH_VALUE_main_0_instr_hw_operation_op_set_status_0 : begin
						instruction = {instruction, "set_status "};
				end
				default : begin
					return "";
				end
				endcase
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_instr_hw_instr_hw_system_wr_0 : begin
						instruction = {instruction, "get_status "};
		end
		default : begin
			return "";
		end
		endcase
		return instruction;
	endfunction: dsm_generate

	function string dsm_generate_main_0_instr_hw_cond_cond_cmp_0();
		string instruction;
		instruction = "";
		case (codasip_switch_main_0_instr_hw_cond_cond_cmp_0)
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_eq_0 : begin
				instruction = {instruction, "eq "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ne_0 : begin
				instruction = {instruction, "ne "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_slt_0 : begin
				instruction = {instruction, "slt "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_sge_0 : begin
				instruction = {instruction, "sge "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_sle_0 : begin
				instruction = {instruction, "sle "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_sgt_0 : begin
				instruction = {instruction, "sgt "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ult_0 : begin
				instruction = {instruction, "ult "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_uge_0 : begin
				instruction = {instruction, "uge "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ule_0 : begin
				instruction = {instruction, "ule "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_ugt_0 : begin
				instruction = {instruction, "ugt "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_binand_0 : begin
				instruction = {instruction, "binand "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_binnand_0 : begin
				instruction = {instruction, "binnand "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_logand_0 : begin
				instruction = {instruction, "logand "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_lognand_0 : begin
				instruction = {instruction, "lognand "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_logor_0 : begin
				instruction = {instruction, "logor "};
		end
		CODASIP_SWITCH_VALUE_main_0_instr_hw_cond_op_lognor_0 : begin
				instruction = {instruction, "lognor "};
		end
		default : begin
			return "";
		end
		endcase
		return instruction;
	endfunction: dsm_generate_main_0_instr_hw_cond_cond_cmp_0

	local function automatic void init_map();
		m_decoding_map["<dest> =  add  <srcA>, <imm> "] = _dest_____add___srcA____imm__;
		m_decoding_map["<dest> =  add  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____add___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  add add  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____add_add___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  add mul  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____add_mul___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  add sub  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____add_sub___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  and  <srcA>, <imm> "] = _dest_____and___srcA____imm__;
		m_decoding_map["<dest> =  and  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____and___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  ashr  <srcA>, <imm> "] = _dest_____ashr___srcA____imm__;
		m_decoding_map["<dest> =  ashr  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____ashr___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  ctlz  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____ctlz___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  cttz  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____cttz___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  ld  [ <srcA> + <imm> ] "] = _dest_____ld_____srcA_____imm____;
		m_decoding_map["<dest> =  ld  [ <srcA> + src_am_<imm>  ] "] = _dest_____ld_____srcA____src_am__imm_____;
		m_decoding_map["<dest> =  ldbs  [ <srcA> + <imm> ] "] = _dest_____ldbs_____srcA_____imm____;
		m_decoding_map["<dest> =  ldbs  [ <srcA> + src_am_<imm>  ] "] = _dest_____ldbs_____srcA____src_am__imm_____;
		m_decoding_map["<dest> =  ldbu  [ <srcA> + <imm> ] "] = _dest_____ldbu_____srcA_____imm____;
		m_decoding_map["<dest> =  ldbu  [ <srcA> + src_am_<imm>  ] "] = _dest_____ldbu_____srcA____src_am__imm_____;
		m_decoding_map["<dest> =  ldhs  [ <srcA> + <imm> ] "] = _dest_____ldhs_____srcA_____imm____;
		m_decoding_map["<dest> =  ldhs  [ <srcA> + src_am_<imm>  ] "] = _dest_____ldhs_____srcA____src_am__imm_____;
		m_decoding_map["<dest> =  ldhu  [ <srcA> + <imm> ] "] = _dest_____ldhu_____srcA_____imm____;
		m_decoding_map["<dest> =  ldhu  [ <srcA> + src_am_<imm>  ] "] = _dest_____ldhu_____srcA____src_am__imm_____;
		m_decoding_map["<dest> =  lshr  <srcA>, <imm> "] = _dest_____lshr___srcA____imm__;
		m_decoding_map["<dest> =  lshr  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____lshr___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  lui  <srcA>, <imm> "] = _dest_____lui___srcA____imm__;
		m_decoding_map["<dest> =  move binand  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____move_binand___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  move binnand  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____move_binnand___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  move eq  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____move_eq___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  move logand  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____move_logand___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  move lognand  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____move_lognand___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  move lognor  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____move_lognor___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  move logor  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____move_logor___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  move ne  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____move_ne___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  move sge  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____move_sge___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  move sgt  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____move_sgt___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  move sle  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____move_sle___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  move slt  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____move_slt___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  move uge  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____move_uge___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  move ugt  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____move_ugt___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  move ule  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____move_ule___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  move ult  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____move_ult___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  mul  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____mul___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  muls  <srcA>, <imm> "] = _dest_____muls___srcA____imm__;
		m_decoding_map["<dest> =  mulu  <srcA>, <imm> "] = _dest_____mulu___srcA____imm__;
		m_decoding_map["<dest> =  nor  <srcA>, <imm> "] = _dest_____nor___srcA____imm__;
		m_decoding_map["<dest> =  nor  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____nor___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  or  <srcA>, <imm> "] = _dest_____or___srcA____imm__;
		m_decoding_map["<dest> =  or  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____or___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  select binand  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____select_binand___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  select binnand  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____select_binnand___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  select eq  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____select_eq___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  select logand  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____select_logand___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  select lognand  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____select_lognand___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  select lognor  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____select_lognor___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  select logor  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____select_logor___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  select ne  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____select_ne___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  select sge  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____select_sge___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  select sgt  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____select_sgt___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  select sle  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____select_sle___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  select slt  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____select_slt___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  select uge  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____select_uge___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  select ugt  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____select_ugt___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  select ule  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____select_ule___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  select ult  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____select_ult___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  sext16  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____sext16___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  sext8  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____sext8___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  shl  <srcA>, <imm> "] = _dest_____shl___srcA____imm__;
		m_decoding_map["<dest> =  shl  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____shl___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  sub  <srcA>, <imm> "] = _dest_____sub___srcA____imm__;
		m_decoding_map["<dest> =  sub  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____sub___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  sub add  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____sub_add___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  sub mul  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____sub_mul___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  sub sub  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____sub_sub___srcA___src_am__imm______srcC__;
		m_decoding_map["<dest> =  test binand  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____test_binand___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  test binnand  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____test_binnand___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  test eq  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____test_eq___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  test logand  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____test_logand___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  test lognand  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____test_lognand___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  test lognor  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____test_lognor___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  test logor  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____test_logor___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  test ne  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____test_ne___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  test sge  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____test_sge___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  test sgt  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____test_sgt___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  test sle  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____test_sle___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  test slt  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____test_slt___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  test uge  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____test_uge___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  test ugt  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____test_ugt___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  test ule  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____test_ule___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  test ult  <srcA>, src_op_<imm> , src_op_<imm> "] = _dest_____test_ult___srcA___src_op__imm____src_op__imm__;
		m_decoding_map["<dest> =  xor  <srcA>, <imm> "] = _dest_____xor___srcA____imm__;
		m_decoding_map["<dest> =  xor  <srcA>, src_am_<imm>  , <srcC> "] = _dest_____xor___srcA___src_am__imm______srcC__;
		m_decoding_map["call  <addr> "] = call___addr__;
		m_decoding_map["call  <srcB> "] = call___srcB__;
		m_decoding_map["call_exc  <addr> "] = call_exc___addr__;
		m_decoding_map["call_int  <addr> "] = call_int___addr__;
		m_decoding_map["get_status "] = get_status_;
		m_decoding_map["halt "] = halt_;
		m_decoding_map["int_disable "] = int_disable_;
		m_decoding_map["int_enable "] = int_enable_;
		m_decoding_map["jump  <addr> "] = jump___addr__;
		m_decoding_map["jump  <srcB> "] = jump___srcB__;
		m_decoding_map["jump  binand  <srcA>, src_op_<imm> , <addr> "] = jump__binand___srcA___src_op__imm_____addr__;
		m_decoding_map["jump  binnand  <srcA>, src_op_<imm> , <addr> "] = jump__binnand___srcA___src_op__imm_____addr__;
		m_decoding_map["jump  eq  <srcA>, src_op_<imm> , <addr> "] = jump__eq___srcA___src_op__imm_____addr__;
		m_decoding_map["jump  logand  <srcA>, src_op_<imm> , <addr> "] = jump__logand___srcA___src_op__imm_____addr__;
		m_decoding_map["jump  lognand  <srcA>, src_op_<imm> , <addr> "] = jump__lognand___srcA___src_op__imm_____addr__;
		m_decoding_map["jump  lognor  <srcA>, src_op_<imm> , <addr> "] = jump__lognor___srcA___src_op__imm_____addr__;
		m_decoding_map["jump  logor  <srcA>, src_op_<imm> , <addr> "] = jump__logor___srcA___src_op__imm_____addr__;
		m_decoding_map["jump  ne  <srcA>, src_op_<imm> , <addr> "] = jump__ne___srcA___src_op__imm_____addr__;
		m_decoding_map["jump  sge  <srcA>, src_op_<imm> , <addr> "] = jump__sge___srcA___src_op__imm_____addr__;
		m_decoding_map["jump  sgt  <srcA>, src_op_<imm> , <addr> "] = jump__sgt___srcA___src_op__imm_____addr__;
		m_decoding_map["jump  sle  <srcA>, src_op_<imm> , <addr> "] = jump__sle___srcA___src_op__imm_____addr__;
		m_decoding_map["jump  slt  <srcA>, src_op_<imm> , <addr> "] = jump__slt___srcA___src_op__imm_____addr__;
		m_decoding_map["jump  uge  <srcA>, src_op_<imm> , <addr> "] = jump__uge___srcA___src_op__imm_____addr__;
		m_decoding_map["jump  ugt  <srcA>, src_op_<imm> , <addr> "] = jump__ugt___srcA___src_op__imm_____addr__;
		m_decoding_map["jump  ule  <srcA>, src_op_<imm> , <addr> "] = jump__ule___srcA___src_op__imm_____addr__;
		m_decoding_map["jump  ult  <srcA>, src_op_<imm> , <addr> "] = jump__ult___srcA___src_op__imm_____addr__;
		m_decoding_map["jump_ie  <srcB> "] = jump_ie___srcB__;
		m_decoding_map["print_reg "] = print_reg_;
		m_decoding_map["set_status "] = set_status_;
		m_decoding_map["st  <srcC>, [ <srcA> + <imm> ] "] = st___srcC______srcA_____imm____;
		m_decoding_map["st  srcC, [ <srcA> + src_am_<imm>  ] "] = st__srcC_____srcA____src_am__imm_____;
		m_decoding_map["stb  <srcC>, [ <srcA> + <imm> ] "] = stb___srcC______srcA_____imm____;
		m_decoding_map["stb  srcC, [ <srcA> + src_am_<imm>  ] "] = stb__srcC_____srcA____src_am__imm_____;
		m_decoding_map["sth  <srcC>, [ <srcA> + <imm> ] "] = sth___srcC______srcA_____imm____;
		m_decoding_map["sth  srcC, [ <srcA> + src_am_<imm>  ] "] = sth__srcC_____srcA____src_am__imm_____;
	endfunction: init_map

	local function automatic void SwitchClean();
		codasip_switch_main_0_instr_hw_cond_cond_cmp_0 = CODASIP_SWITCH_UNDEF;
		codasip_switch_main_0_instr_hw_instr_hw_instr_hw_0 = CODASIP_SWITCH_UNDEF;
		codasip_switch_main_0_instr_hw_operation_opr_alu_1op_0 = CODASIP_SWITCH_UNDEF;
		codasip_switch_main_0_instr_hw_operation_opr_alu_2op_0 = CODASIP_SWITCH_UNDEF;
		codasip_switch_main_0_instr_hw_operation_opr_alu_3op_0 = CODASIP_SWITCH_UNDEF;
		codasip_switch_main_0_instr_hw_operation_opr_alu_imm_all_0 = CODASIP_SWITCH_UNDEF;
		codasip_switch_main_0_instr_hw_operation_opr_alu_reg_all_0 = CODASIP_SWITCH_UNDEF;
		codasip_switch_main_0_instr_hw_operation_opr_alu_simm_0 = CODASIP_SWITCH_UNDEF;
		codasip_switch_main_0_instr_hw_operation_opr_alu_uimm_0 = CODASIP_SWITCH_UNDEF;
		codasip_switch_main_0_instr_hw_operation_opr_jump_call_0 = CODASIP_SWITCH_UNDEF;
		codasip_switch_main_0_instr_hw_operation_opr_jump_reg_0 = CODASIP_SWITCH_UNDEF;
		codasip_switch_main_0_instr_hw_operation_opr_ld_imm_0 = CODASIP_SWITCH_UNDEF;
		codasip_switch_main_0_instr_hw_operation_opr_ld_reg_0 = CODASIP_SWITCH_UNDEF;
		codasip_switch_main_0_instr_hw_operation_opr_move_0 = CODASIP_SWITCH_UNDEF;
		codasip_switch_main_0_instr_hw_operation_opr_st_imm_0 = CODASIP_SWITCH_UNDEF;
		codasip_switch_main_0_instr_hw_operation_opr_st_reg_0 = CODASIP_SWITCH_UNDEF;
		codasip_switch_main_0_instr_hw_operation_opr_system_0 = CODASIP_SWITCH_UNDEF;
		codasip_switch_main_0_instr_hw_operation_opr_system_rd_0 = CODASIP_SWITCH_UNDEF;
		codasip_switch_main_0_instr_hw_operation_opr_system_wr_0 = CODASIP_SWITCH_UNDEF;
	endfunction: SwitchClean;
endclass: codix_risc_ca_core_main_instr_hw_instr_hw_t_decoder

`endif
