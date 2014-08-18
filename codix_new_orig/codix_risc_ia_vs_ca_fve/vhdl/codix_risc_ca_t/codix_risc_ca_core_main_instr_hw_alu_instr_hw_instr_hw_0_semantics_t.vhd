--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_instr_hw_alu_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_instr_hw_alu_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_instr_hw_operation_opr_alu_reg_all_0_Q0 : in std_logic_vector(8 downto 0);
		codasip_instance_main_instr_hw_srcB_am_imm3_0_Q0 : in std_logic_vector(2 downto 0);
		rd_aluA_mux_D0 : out std_logic;
		rd_aluA_mux_WE0 : out std_logic;
		rd_aluB_mux_D0 : out std_logic_vector(2 downto 0);
		rd_aluB_mux_WE0 : out std_logic;
		rd_alu_op_D0 : out std_logic_vector(5 downto 0);
		rd_alu_op_WE0 : out std_logic;
		rd_amB_D0 : out std_logic_vector(2 downto 0);
		rd_amB_WE0 : out std_logic;
		rd_amC_D0 : out std_logic;
		rd_amC_WE0 : out std_logic;
		rd_cond_D0 : out std_logic_vector(4 downto 0);
		rd_cond_WE0 : out std_logic;
		rd_dest_en_mux_D0 : out std_logic_vector(1 downto 0);
		rd_dest_en_mux_WE0 : out std_logic;
		rd_ie_flag_D0 : out std_logic_vector(1 downto 0);
		rd_ie_flag_WE0 : out std_logic;
		rd_mem_rw_D0 : out std_logic_vector(3 downto 0);
		rd_mem_rw_WE0 : out std_logic	);
end entity codix_risc_ca_core_main_instr_hw_alu_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_instr_hw_alu_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(8 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_5008 : unsigned(8 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5017 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5039 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5057 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5075 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5193 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5211 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5229 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5247 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5265 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5283 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5301 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5319 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5337 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5355 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5373 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5391 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5409 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5427 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5445 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_5463 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_5481 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_5496 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_5511 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_5526 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_5541 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_5556 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_5571 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_5586 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_5180: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_5506: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_5551: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_5491: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_5521: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_5032: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_5216: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_10_5252: unsigned(3 downto 0) := to_unsigned(10, 4);
	constant CONSTANT_11_5306: unsigned(3 downto 0) := to_unsigned(11, 4);
	constant CONSTANT_12_5324: unsigned(3 downto 0) := to_unsigned(12, 4);
	constant CONSTANT_13_5342: unsigned(3 downto 0) := to_unsigned(13, 4);
	constant CONSTANT_14_5360: unsigned(3 downto 0) := to_unsigned(14, 4);
	constant CONSTANT_2_5062: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_256_5178: unsigned(8 downto 0) := to_unsigned(256, 9);
	constant CONSTANT_257_5171: unsigned(8 downto 0) := to_unsigned(257, 9);
	constant CONSTANT_258_5060: unsigned(8 downto 0) := to_unsigned(258, 9);
	constant CONSTANT_259_5161: unsigned(8 downto 0) := to_unsigned(259, 9);
	constant CONSTANT_260_5156: unsigned(8 downto 0) := to_unsigned(260, 9);
	constant CONSTANT_261_5042: unsigned(8 downto 0) := to_unsigned(261, 9);
	constant CONSTANT_262_5146: unsigned(8 downto 0) := to_unsigned(262, 9);
	constant CONSTANT_264_5020: unsigned(8 downto 0) := to_unsigned(264, 9);
	constant CONSTANT_265_5136: unsigned(8 downto 0) := to_unsigned(265, 9);
	constant CONSTANT_266_5131: unsigned(8 downto 0) := to_unsigned(266, 9);
	constant CONSTANT_272_5126: unsigned(8 downto 0) := to_unsigned(272, 9);
	constant CONSTANT_274_5121: unsigned(8 downto 0) := to_unsigned(274, 9);
	constant CONSTANT_275_5116: unsigned(8 downto 0) := to_unsigned(275, 9);
	constant CONSTANT_276_5111: unsigned(8 downto 0) := to_unsigned(276, 9);
	constant CONSTANT_288_5106: unsigned(8 downto 0) := to_unsigned(288, 9);
	constant CONSTANT_289_5101: unsigned(8 downto 0) := to_unsigned(289, 9);
	constant CONSTANT_290_5096: unsigned(8 downto 0) := to_unsigned(290, 9);
	constant CONSTANT_291_5091: unsigned(8 downto 0) := to_unsigned(291, 9);
	constant CONSTANT_292_5086: unsigned(8 downto 0) := to_unsigned(292, 9);
	constant CONSTANT_293_5081: unsigned(8 downto 0) := to_unsigned(293, 9);
	constant CONSTANT_3_5198: unsigned(1 downto 0) := to_unsigned(3, 2);
	constant CONSTANT_48_5378: unsigned(5 downto 0) := to_unsigned(48, 6);
	constant CONSTANT_49_5396: unsigned(5 downto 0) := to_unsigned(49, 6);
	constant CONSTANT_5_5234: unsigned(2 downto 0) := to_unsigned(5, 3);
	constant CONSTANT_50_5414: unsigned(5 downto 0) := to_unsigned(50, 6);
	constant CONSTANT_51_5432: unsigned(5 downto 0) := to_unsigned(51, 6);
	constant CONSTANT_52_5450: unsigned(5 downto 0) := to_unsigned(52, 6);
	constant CONSTANT_53_5468: unsigned(5 downto 0) := to_unsigned(53, 6);
	constant CONSTANT_6_5044: unsigned(2 downto 0) := to_unsigned(6, 3);
	constant CONSTANT_7_5270: unsigned(2 downto 0) := to_unsigned(7, 3);
	constant CONSTANT_8_5022: unsigned(3 downto 0) := to_unsigned(8, 4);
	constant CONSTANT_9_5288: unsigned(3 downto 0) := to_unsigned(9, 4);

begin
	-- child instances inside 'main_instr_hw_alu_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:944: codasip_tmp_var_1=codasip_instance_main_instr_hw ...
	codasip_tmp_var_1_STATEMENT_AST_5008 <= unsigned(codasip_instance_main_instr_hw_operation_opr_alu_reg_all_0_Q0);
	-- codix_risc_ca.acdl:908: rd_alu_op.write(8)
	rd_alu_op_STATEMENT_AST_5017 <= resize(CONSTANT_8_5022, 6);
	-- codix_risc_ca.acdl:903: rd_alu_op.write(6)
	rd_alu_op_STATEMENT_AST_5039 <= resize(CONSTANT_6_5044, 6);
	-- codix_risc_ca.acdl:896: rd_alu_op.write(2)
	rd_alu_op_STATEMENT_AST_5057 <= resize(CONSTANT_2_5062, 6);
	-- codix_risc_ca.acdl:892: rd_alu_op.write(0)
	rd_alu_op_STATEMENT_AST_5075 <= resize(CONSTANT_0_5180, 6);
	-- codix_risc_ca.acdl:898: rd_alu_op.write(3)
	rd_alu_op_STATEMENT_AST_5193 <= resize(CONSTANT_3_5198, 6);
	-- codix_risc_ca.acdl:894: rd_alu_op.write(1)
	rd_alu_op_STATEMENT_AST_5211 <= resize(CONSTANT_1_5216, 6);
	-- codix_risc_ca.acdl:901: rd_alu_op.write(5)
	rd_alu_op_STATEMENT_AST_5229 <= resize(CONSTANT_5_5234, 6);
	-- codix_risc_ca.acdl:912: rd_alu_op.write(10)
	rd_alu_op_STATEMENT_AST_5247 <= resize(CONSTANT_10_5252, 6);
	-- codix_risc_ca.acdl:905: rd_alu_op.write(7)
	rd_alu_op_STATEMENT_AST_5265 <= resize(CONSTANT_7_5270, 6);
	-- codix_risc_ca.acdl:910: rd_alu_op.write(9)
	rd_alu_op_STATEMENT_AST_5283 <= resize(CONSTANT_9_5288, 6);
	-- codix_risc_ca.acdl:916: rd_alu_op.write(11)
	rd_alu_op_STATEMENT_AST_5301 <= resize(CONSTANT_11_5306, 6);
	-- codix_risc_ca.acdl:918: rd_alu_op.write(12)
	rd_alu_op_STATEMENT_AST_5319 <= resize(CONSTANT_12_5324, 6);
	-- codix_risc_ca.acdl:922: rd_alu_op.write(13)
	rd_alu_op_STATEMENT_AST_5337 <= resize(CONSTANT_13_5342, 6);
	-- codix_risc_ca.acdl:924: rd_alu_op.write(14)
	rd_alu_op_STATEMENT_AST_5355 <= resize(CONSTANT_14_5360, 6);
	-- codix_risc_ca.acdl:927: rd_alu_op.write(48)
	rd_alu_op_STATEMENT_AST_5373 <= CONSTANT_48_5378;
	-- codix_risc_ca.acdl:929: rd_alu_op.write(49)
	rd_alu_op_STATEMENT_AST_5391 <= CONSTANT_49_5396;
	-- codix_risc_ca.acdl:932: rd_alu_op.write(50)
	rd_alu_op_STATEMENT_AST_5409 <= CONSTANT_50_5414;
	-- codix_risc_ca.acdl:934: rd_alu_op.write(51)
	rd_alu_op_STATEMENT_AST_5427 <= CONSTANT_51_5432;
	-- codix_risc_ca.acdl:937: rd_alu_op.write(52)
	rd_alu_op_STATEMENT_AST_5445 <= CONSTANT_52_5450;
	-- codix_risc_ca.acdl:939: rd_alu_op.write(53)
	rd_alu_op_STATEMENT_AST_5463 <= CONSTANT_53_5468;
	-- codix_risc_ca.acdl:946: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_5481 <= resize(CONSTANT_0_5180, 4);
	-- codix_risc_ca.acdl:947: rd_dest_en_mux.write(1)
	rd_dest_en_mux_STATEMENT_AST_5496 <= resize(CONSTANT_1_5216, 2);
	-- codix_risc_ca.acdl:948: rd_cond.write(0)
	rd_cond_STATEMENT_AST_5511 <= resize(CONSTANT_0_5180, 5);
	-- codix_risc_ca.acdl:949: rd_ie_flag.write(0)
	rd_ie_flag_STATEMENT_AST_5526 <= resize(CONSTANT_0_5180, 2);
	-- codix_risc_ca.acdl:952: rd_amB.write(codasip_instance_main_instr_hw_srcB ...
	rd_amB_STATEMENT_AST_5541 <= unsigned(codasip_instance_main_instr_hw_srcB_am_imm3_0_Q0);
	-- codix_risc_ca.acdl:953: rd_amC.write(0)
	rd_amC_STATEMENT_AST_5556 <= CONSTANT_0_5180;
	-- codix_risc_ca.acdl:955: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_5571 <= CONSTANT_0_5180;
	-- codix_risc_ca.acdl:956: rd_aluB_mux.write(0)
	rd_aluB_mux_STATEMENT_AST_5586 <= resize(CONSTANT_0_5180, 3);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_5008;
	rd_alu_op_WE0 <= CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_264_5020 = codasip_tmp_var_1))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_261_5042 = codasip_tmp_var_1))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_258_5060 = codasip_tmp_var_1))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and ((CONSTANT_256_5178 = codasip_tmp_var_1) or (((((((((((((((((((not((CONSTANT_256_5178 = codasip_tmp_var_1)) and not((CONSTANT_257_5171 = codasip_tmp_var_1))) and not((CONSTANT_258_5060 = codasip_tmp_var_1))) and not((CONSTANT_259_5161 = codasip_tmp_var_1))) and not((CONSTANT_260_5156 = codasip_tmp_var_1))) and not((CONSTANT_261_5042 = codasip_tmp_var_1))) and not((CONSTANT_262_5146 = codasip_tmp_var_1))) and not((CONSTANT_264_5020 = codasip_tmp_var_1))) and not((CONSTANT_265_5136 = codasip_tmp_var_1))) and not((CONSTANT_266_5131 = codasip_tmp_var_1))) and not((CONSTANT_272_5126 = codasip_tmp_var_1))) and not((CONSTANT_274_5121 = codasip_tmp_var_1))) and not((CONSTANT_275_5116 = codasip_tmp_var_1))) and not((CONSTANT_276_5111 = codasip_tmp_var_1))) and not((CONSTANT_288_5106 = codasip_tmp_var_1))) and not((CONSTANT_289_5101 = codasip_tmp_var_1))) and not((CONSTANT_290_5096 = codasip_tmp_var_1))) and not((CONSTANT_291_5091 = codasip_tmp_var_1))) and not((CONSTANT_292_5086 = codasip_tmp_var_1))) and not((CONSTANT_293_5081 = codasip_tmp_var_1)))))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_259_5161 = codasip_tmp_var_1))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_257_5171 = codasip_tmp_var_1))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_260_5156 = codasip_tmp_var_1))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_266_5131 = codasip_tmp_var_1))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_262_5146 = codasip_tmp_var_1))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_265_5136 = codasip_tmp_var_1))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_272_5126 = codasip_tmp_var_1))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_274_5121 = codasip_tmp_var_1))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_275_5116 = codasip_tmp_var_1))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_276_5111 = codasip_tmp_var_1))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_288_5106 = codasip_tmp_var_1))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_289_5101 = codasip_tmp_var_1))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_290_5096 = codasip_tmp_var_1))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_291_5091 = codasip_tmp_var_1))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_292_5086 = codasip_tmp_var_1))) else 
		CONSTANT_1_5216(0) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_293_5081 = codasip_tmp_var_1))) else
		CONSTANT_0_5180(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_5017) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_264_5020 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5039) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_261_5042 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5057) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_258_5060 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5075) when (((ACT = CONSTANT_1_5216(0)) and ((CONSTANT_256_5178 = codasip_tmp_var_1) or (((((((((((((((((((not((CONSTANT_256_5178 = codasip_tmp_var_1)) and not((CONSTANT_257_5171 = codasip_tmp_var_1))) and not((CONSTANT_258_5060 = codasip_tmp_var_1))) and not((CONSTANT_259_5161 = codasip_tmp_var_1))) and not((CONSTANT_260_5156 = codasip_tmp_var_1))) and not((CONSTANT_261_5042 = codasip_tmp_var_1))) and not((CONSTANT_262_5146 = codasip_tmp_var_1))) and not((CONSTANT_264_5020 = codasip_tmp_var_1))) and not((CONSTANT_265_5136 = codasip_tmp_var_1))) and not((CONSTANT_266_5131 = codasip_tmp_var_1))) and not((CONSTANT_272_5126 = codasip_tmp_var_1))) and not((CONSTANT_274_5121 = codasip_tmp_var_1))) and not((CONSTANT_275_5116 = codasip_tmp_var_1))) and not((CONSTANT_276_5111 = codasip_tmp_var_1))) and not((CONSTANT_288_5106 = codasip_tmp_var_1))) and not((CONSTANT_289_5101 = codasip_tmp_var_1))) and not((CONSTANT_290_5096 = codasip_tmp_var_1))) and not((CONSTANT_291_5091 = codasip_tmp_var_1))) and not((CONSTANT_292_5086 = codasip_tmp_var_1))) and not((CONSTANT_293_5081 = codasip_tmp_var_1)))))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5193) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_259_5161 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5211) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_257_5171 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5229) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_260_5156 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5247) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_266_5131 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5265) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_262_5146 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5283) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_265_5136 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5301) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_272_5126 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5319) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_274_5121 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5337) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_275_5116 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5355) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_276_5111 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5373) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_288_5106 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5391) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_289_5101 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5409) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_290_5096 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5427) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_291_5091 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5445) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_292_5086 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_5463) when (((ACT = CONSTANT_1_5216(0)) and (CONSTANT_293_5081 = codasip_tmp_var_1))) else
		std_logic_vector(CONSTANT_0_5032);
	rd_mem_rw_WE0 <= CONSTANT_1_5216(0) when ((ACT = CONSTANT_1_5216(0))) else
		CONSTANT_0_5180(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_5481) when ((ACT = CONSTANT_1_5216(0))) else
		std_logic_vector(CONSTANT_0_5491);
	rd_dest_en_mux_WE0 <= CONSTANT_1_5216(0) when ((ACT = CONSTANT_1_5216(0))) else
		CONSTANT_0_5180(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_5496) when ((ACT = CONSTANT_1_5216(0))) else
		std_logic_vector(CONSTANT_0_5506);
	rd_cond_WE0 <= CONSTANT_1_5216(0) when ((ACT = CONSTANT_1_5216(0))) else
		CONSTANT_0_5180(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_5511) when ((ACT = CONSTANT_1_5216(0))) else
		std_logic_vector(CONSTANT_0_5521);
	rd_ie_flag_WE0 <= CONSTANT_1_5216(0) when ((ACT = CONSTANT_1_5216(0))) else
		CONSTANT_0_5180(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_5526) when ((ACT = CONSTANT_1_5216(0))) else
		std_logic_vector(CONSTANT_0_5506);
	rd_amB_WE0 <= CONSTANT_1_5216(0) when ((ACT = CONSTANT_1_5216(0))) else
		CONSTANT_0_5180(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_5541) when ((ACT = CONSTANT_1_5216(0))) else
		std_logic_vector(CONSTANT_0_5551);
	rd_amC_WE0 <= CONSTANT_1_5216(0) when ((ACT = CONSTANT_1_5216(0))) else
		CONSTANT_0_5180(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_5556(0) when ((ACT = CONSTANT_1_5216(0))) else
		CONSTANT_0_5180(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_5216(0) when ((ACT = CONSTANT_1_5216(0))) else
		CONSTANT_0_5180(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_5571(0) when ((ACT = CONSTANT_1_5216(0))) else
		CONSTANT_0_5180(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_5216(0) when ((ACT = CONSTANT_1_5216(0))) else
		CONSTANT_0_5180(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_5586) when ((ACT = CONSTANT_1_5216(0))) else
		std_logic_vector(CONSTANT_0_5551);

end architecture RTL;


