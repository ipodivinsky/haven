--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_wb_output_wb_output_fu_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_wb_output_wb_output_fu_semantics_t is
	port (
		ACT : in std_logic;
		d_mem_fr_stall_Q0 : in std_logic;
		d_mem_fw_stall_Q0 : in std_logic;
		d_mem_rq_stall_Q0 : in std_logic;
		ex2_alu_op_Q0 : in std_logic_vector(5 downto 0);
		ex2_alu_wb_Q0 : in std_logic_vector(31 downto 0);
		ex2_clear_D0 : out std_logic;
		ex2_dest_en_Q0 : in std_logic;
		ex2_hazard_stall_D0 : out std_logic;
		ex2_hazard_stall_Q0 : in std_logic;
		ex2_mul_Q0 : in std_logic_vector(31 downto 0);
		ex2_rW_Q0 : in std_logic_vector(4 downto 0);
		ex2_stall_D0 : out std_logic;
		ex2_stall_Q0 : in std_logic;
		ex_aluB_Q0 : in std_logic_vector(31 downto 0);
		ex_alu_add_Q0 : in std_logic_vector(31 downto 0);
		ex_alu_logic_Q0 : in std_logic_vector(31 downto 0);
		ex_alu_op_Q0 : in std_logic_vector(5 downto 0);
		ex_dest_en_Q0 : in std_logic;
		ex_hazard_stall_D0 : out std_logic;
		ex_hazard_stall_Q0 : in std_logic;
		ex_rW_Q0 : in std_logic_vector(4 downto 0);
		ex_stall_D0 : out std_logic;
		ex_stall_Q0 : in std_logic;
		i_mem_rq_inv_stall_Q0 : in std_logic;
		port_halt_D0 : out std_logic;
		port_out_D0 : out std_logic_vector(31 downto 0);
		port_out_en_D0 : out std_logic;
		regs_D0 : out std_logic_vector(31 downto 0);
		regs_WA0 : out std_logic_vector(4 downto 0);
		regs_WE0 : out std_logic;
		wb_alu_Q0 : in std_logic_vector(31 downto 0);
		wb_alu_op_Q0 : in std_logic_vector(5 downto 0);
		wb_clear_D0 : out std_logic;
		wb_dest_en_Q0 : in std_logic;
		wb_mem_Q0 : in std_logic_vector(31 downto 0);
		wb_pc_W_D0 : out std_logic_vector(31 downto 0);
		wb_pc_we_D0 : out std_logic;
		wb_pc_we_Q0 : in std_logic;
		wb_rW_Q0 : in std_logic_vector(4 downto 0);
		wb_regs_W_D0 : out std_logic_vector(31 downto 0);
		wb_regs_W_Q0 : in std_logic_vector(31 downto 0);
		wb_regs_addrW_D0 : out std_logic_vector(4 downto 0);
		wb_regs_addrW_Q0 : in std_logic_vector(4 downto 0);
		wb_regs_we_D0 : out std_logic;
		wb_regs_we_Q0 : in std_logic;
		wb_stall_D0 : out std_logic;
		wb_stall_Q0 : in std_logic
	);
end entity codix_risc_ca_core_main_wb_output_wb_output_fu_semantics_t;

architecture RTL of codix_risc_ca_core_main_wb_output_wb_output_fu_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_3 : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_10_instr_jumps : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_11_instr_lat_1 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_wb_regs_mux : unsigned(2 downto 0);
	-- signal (inner)
	signal lv_bb_2_instr_lat_m_regs_en : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_3_instr_lat_3_regs_en : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_4_instr_lat_2_regs_en : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_5_instr_lat_1_regs_en : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_6_instr_memory : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_7_instr_lat_3 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_8_instr_mul : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_9_instr_lat_2 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_11_instr_lat_1_STATEMENT_AST_9843 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_10_instr_jumps_STATEMENT_AST_9882 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_9_instr_lat_2_STATEMENT_AST_9905 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_8_instr_mul_STATEMENT_AST_9960 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_7_instr_lat_3_STATEMENT_AST_9971 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_6_instr_memory_STATEMENT_AST_10002 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_5_instr_lat_1_regs_en_STATEMENT_AST_10013 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_4_instr_lat_2_regs_en_STATEMENT_AST_10026 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_3_instr_lat_3_regs_en_STATEMENT_AST_10043 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_2_instr_lat_m_regs_en_STATEMENT_AST_10058 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_wb_regs_mux_STATEMENT_AST_10073 : unsigned(2 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_3_STATEMENT_AST_10099 : unsigned(2 downto 0);
	-- signal (inner)
	signal wb_regs_W_STATEMENT_AST_10108 : unsigned(31 downto 0);
	-- signal (inner)
	signal wb_regs_addrW_STATEMENT_AST_10152 : unsigned(4 downto 0);
	-- signal (inner)
	signal wb_regs_W_STATEMENT_AST_10196 : unsigned(31 downto 0);
	-- signal (inner)
	signal wb_regs_addrW_STATEMENT_AST_10208 : unsigned(4 downto 0);
	-- signal (inner)
	signal wb_regs_W_STATEMENT_AST_10220 : unsigned(31 downto 0);
	-- signal (inner)
	signal wb_regs_addrW_STATEMENT_AST_10232 : unsigned(4 downto 0);
	-- signal (inner)
	signal wb_regs_W_STATEMENT_AST_10248 : unsigned(31 downto 0);
	-- signal (inner)
	signal wb_regs_W_STATEMENT_AST_10260 : unsigned(31 downto 0);
	-- signal (inner)
	signal wb_regs_addrW_STATEMENT_AST_10272 : unsigned(4 downto 0);
	-- signal (inner)
	signal wb_regs_W_STATEMENT_AST_10288 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_hazard_stall_STATEMENT_AST_10300 : unsigned(0 downto 0);
	-- signal (inner)
	signal ex2_hazard_stall_STATEMENT_AST_10317 : unsigned(0 downto 0);
	-- signal (inner)
	signal wb_stall_STATEMENT_AST_10330 : unsigned(0 downto 0);
	-- signal (inner)
	signal wb_clear_STATEMENT_AST_10339 : unsigned(0 downto 0);
	-- signal (inner)
	signal ex2_stall_STATEMENT_AST_10355 : unsigned(0 downto 0);
	-- signal (inner)
	signal ex2_clear_STATEMENT_AST_10372 : unsigned(0 downto 0);
	-- signal (inner)
	signal ex_stall_STATEMENT_AST_10381 : unsigned(0 downto 0);
	-- signal (inner)
	signal wb_regs_we_STATEMENT_AST_10392 : unsigned(0 downto 0);
	-- signal (inner)
	signal regs_STATEMENT_AST_10416 : unsigned(31 downto 0);
	-- signal (inner)
	signal wb_pc_we_STATEMENT_AST_10444 : unsigned(0 downto 0);
	-- signal (inner)
	signal wb_pc_W_STATEMENT_AST_10458 : unsigned(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2_STATEMENT_AST_10472 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_10483 : unsigned(0 downto 0);
	-- signal (inner)
	signal port_out_STATEMENT_AST_10497 : unsigned(31 downto 0);
	-- signal (inner)
	signal port_out_en_STATEMENT_AST_10509 : unsigned(0 downto 0);
	-- signal (inner)
	signal port_out_STATEMENT_AST_10521 : unsigned(31 downto 0);
	-- signal (inner)
	signal port_out_en_STATEMENT_AST_10532 : unsigned(0 downto 0);
	-- signal (inner)
	signal port_halt_STATEMENT_AST_10543 : unsigned(0 downto 0);

		-- datapath signals and constants
	signal wb_regs_W_D0_10146_select_15157: std_logic_vector(2 downto 0);
	signal wb_regs_addrW_D0_10190_select_15158: std_logic_vector(2 downto 0);
	signal TERNARY_10423: std_logic_vector(4 downto 0);
	constant CONSTANT_0_9874: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_10502: unsigned(31 downto 0) := to_unsigned(0, 32);
	constant CONSTANT_1_9871: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_10_9929: unsigned(3 downto 0) := to_unsigned(10, 4);
	constant CONSTANT_11_9937: unsigned(3 downto 0) := to_unsigned(11, 4);
	constant CONSTANT_12_9933: unsigned(3 downto 0) := to_unsigned(12, 4);
	constant CONSTANT_13_9859: unsigned(3 downto 0) := to_unsigned(13, 4);
	constant CONSTANT_14_9855: unsigned(3 downto 0) := to_unsigned(14, 4);
	constant CONSTANT_15_9851: unsigned(3 downto 0) := to_unsigned(15, 4);
	constant CONSTANT_17_9925: unsigned(4 downto 0) := to_unsigned(17, 5);
	constant CONSTANT_18_9952: unsigned(4 downto 0) := to_unsigned(18, 5);
	constant CONSTANT_19_9949: unsigned(4 downto 0) := to_unsigned(19, 5);
	constant CONSTANT_2_9867: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_20_10005: unsigned(4 downto 0) := to_unsigned(20, 5);
	constant CONSTANT_22_9894: unsigned(4 downto 0) := to_unsigned(22, 5);
	constant CONSTANT_23_9897: unsigned(4 downto 0) := to_unsigned(23, 5);
	constant CONSTANT_24_9890: unsigned(4 downto 0) := to_unsigned(24, 5);
	constant CONSTANT_25_9886: unsigned(4 downto 0) := to_unsigned(25, 5);
	constant CONSTANT_28_10489: unsigned(4 downto 0) := to_unsigned(28, 5);
	constant CONSTANT_3_9863: unsigned(1 downto 0) := to_unsigned(3, 2);
	constant CONSTANT_30_9847: unsigned(4 downto 0) := to_unsigned(30, 5);
	constant CONSTANT_31_10550: unsigned(4 downto 0) := to_unsigned(31, 5);
	constant CONSTANT_4_10091: unsigned(2 downto 0) := to_unsigned(4, 3);
	constant CONSTANT_48_9994: unsigned(5 downto 0) := to_unsigned(48, 6);
	constant CONSTANT_49_9991: unsigned(5 downto 0) := to_unsigned(49, 6);
	constant CONSTANT_5_9945: unsigned(2 downto 0) := to_unsigned(5, 3);
	constant CONSTANT_50_9987: unsigned(5 downto 0) := to_unsigned(50, 6);
	constant CONSTANT_51_9983: unsigned(5 downto 0) := to_unsigned(51, 6);
	constant CONSTANT_52_9979: unsigned(5 downto 0) := to_unsigned(52, 6);
	constant CONSTANT_53_9975: unsigned(5 downto 0) := to_unsigned(53, 6);
	constant CONSTANT_6_9941: unsigned(2 downto 0) := to_unsigned(6, 3);
	constant CONSTANT_7_9963: unsigned(2 downto 0) := to_unsigned(7, 3);
	constant CONSTANT_8_9921: unsigned(3 downto 0) := to_unsigned(8, 4);
	constant CONSTANT_9_9917: unsigned(3 downto 0) := to_unsigned(9, 4);

begin
	-- child instances inside 'main_wb_output_wb_output_fu_semantics' functional unit:

		-- conversions for datapath
	wb_regs_W_D0_10146_select_15157 <= std_logic_vector(codasip_tmp_var_3);
	wb_regs_addrW_D0_10190_select_15158 <= std_logic_vector(codasip_tmp_var_3);

		-- Datapath code
	-- codix_risc_ca.acdl:2418: lv_bb_11_instr_lat_1=(ex_alu_op.read()==0)||(ex ...
	lv_bb_11_instr_lat_1_STATEMENT_AST_9843 <= "1" when (((((((((unsigned(ex_alu_op_Q0) = CONSTANT_0_9874) or (unsigned(ex_alu_op_Q0) = CONSTANT_1_9871)) or (unsigned(ex_alu_op_Q0) = CONSTANT_2_9867)) or (unsigned(ex_alu_op_Q0) = CONSTANT_3_9863)) or (unsigned(ex_alu_op_Q0) = CONSTANT_13_9859)) or (unsigned(ex_alu_op_Q0) = CONSTANT_14_9855)) or (unsigned(ex_alu_op_Q0) = CONSTANT_15_9851)) or (unsigned(ex_alu_op_Q0) = CONSTANT_30_9847))) else "0";
	-- codix_risc_ca.acdl:2421: lv_bb_10_instr_jumps=(ex_alu_op.read()==23)||(e ...
	lv_bb_10_instr_jumps_STATEMENT_AST_9882 <= "1" when (((((unsigned(ex_alu_op_Q0) = CONSTANT_23_9897) or (unsigned(ex_alu_op_Q0) = CONSTANT_22_9894)) or (unsigned(ex_alu_op_Q0) = CONSTANT_24_9890)) or (unsigned(ex_alu_op_Q0) = CONSTANT_25_9886))) else "0";
	-- codix_risc_ca.acdl:2430: lv_bb_9_instr_lat_2=(ex2_alu_op.read()==18)||(e ...
	lv_bb_9_instr_lat_2_STATEMENT_AST_9905 <= "1" when (((((((((((((unsigned(ex2_alu_op_Q0) = CONSTANT_18_9952) or (unsigned(ex2_alu_op_Q0) = CONSTANT_19_9949)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_5_9945)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_6_9941)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_11_9937)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_12_9933)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_10_9929)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_17_9925)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_8_9921)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_9_9917)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_24_9890)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_25_9886))) else "0";
	-- codix_risc_ca.acdl:2432: lv_bb_8_instr_mul=(ex2_alu_op.read()==7)
	lv_bb_8_instr_mul_STATEMENT_AST_9960 <= "1" when ((unsigned(ex2_alu_op_Q0) = CONSTANT_7_9963)) else "0";
	-- codix_risc_ca.acdl:2436: lv_bb_7_instr_lat_3=(wb_alu_op.read()==48)||(wb ...
	lv_bb_7_instr_lat_3_STATEMENT_AST_9971 <= "1" when (((((((unsigned(wb_alu_op_Q0) = CONSTANT_48_9994) or (unsigned(wb_alu_op_Q0) = CONSTANT_49_9991)) or (unsigned(wb_alu_op_Q0) = CONSTANT_50_9987)) or (unsigned(wb_alu_op_Q0) = CONSTANT_51_9983)) or (unsigned(wb_alu_op_Q0) = CONSTANT_52_9979)) or (unsigned(wb_alu_op_Q0) = CONSTANT_53_9975))) else "0";
	-- codix_risc_ca.acdl:2438: lv_bb_6_instr_memory=(wb_alu_op.read()==20)
	lv_bb_6_instr_memory_STATEMENT_AST_10002 <= "1" when ((unsigned(wb_alu_op_Q0) = CONSTANT_20_10005)) else "0";
	-- codix_risc_ca.acdl:2442: lv_bb_5_instr_lat_1_regs_en=((ex_rW.read())!=0) ...
	lv_bb_5_instr_lat_1_regs_en_STATEMENT_AST_10013 <= "1" when (((unsigned(ex_rW_Q0) /= CONSTANT_0_9874) and (lv_bb_11_instr_lat_1 /= 0))) else "0";
	-- codix_risc_ca.acdl:2443: lv_bb_4_instr_lat_2_regs_en=ex2_dest_en.read()& ...
	lv_bb_4_instr_lat_2_regs_en_STATEMENT_AST_10026 <= "1" when ((((ex2_dest_en_Q0 /= '0') and (unsigned(ex2_rW_Q0) /= CONSTANT_0_9874)) and ((lv_bb_9_instr_lat_2 /= 0) or (lv_bb_8_instr_mul /= 0)))) else "0";
	-- codix_risc_ca.acdl:2444: lv_bb_3_instr_lat_3_regs_en=wb_dest_en.read()&& ...
	lv_bb_3_instr_lat_3_regs_en_STATEMENT_AST_10043 <= "1" when ((((wb_dest_en_Q0 /= '0') and (unsigned(wb_rW_Q0) /= CONSTANT_0_9874)) and (lv_bb_7_instr_lat_3 /= 0))) else "0";
	-- codix_risc_ca.acdl:2445: lv_bb_2_instr_lat_m_regs_en=wb_dest_en.read()&& ...
	lv_bb_2_instr_lat_m_regs_en_STATEMENT_AST_10058 <= "1" when ((((wb_dest_en_Q0 /= '0') and (unsigned(wb_rW_Q0) /= CONSTANT_0_9874)) and (lv_bb_6_instr_memory /= 0))) else "0";
	-- codix_risc_ca.acdl:2454: lv_bb_1_wb_regs_mux=(lv_bb_2_instr_lat_m_regs_e ...
	lv_bb_1_wb_regs_mux_STATEMENT_AST_10073 <= 
		CONSTANT_5_9945 when ((lv_bb_2_instr_lat_m_regs_en /= 0)) else
		CONSTANT_4_10091 when ((lv_bb_3_instr_lat_3_regs_en /= 0)) else
		resize(CONSTANT_3_9863, 3) when (((lv_bb_4_instr_lat_2_regs_en /= 0) and (lv_bb_8_instr_mul /= 0))) else
		resize(CONSTANT_2_9867, 3) when ((lv_bb_4_instr_lat_2_regs_en /= 0)) else
		resize(CONSTANT_1_9871, 3) when ((lv_bb_5_instr_lat_1_regs_en /= 0)) else
		resize(CONSTANT_0_9874, 3);
	-- codix_risc_ca.acdl:2486: codasip_tmp_var_3=lv_bb_1_wb_regs_mux
	codasip_tmp_var_3_STATEMENT_AST_10099 <= lv_bb_1_wb_regs_mux;
	-- codix_risc_ca.acdl:2459: wb_regs_W.write(0)
	wb_regs_W_STATEMENT_AST_10108 <= resize(CONSTANT_0_9874, 32);
	-- codix_risc_ca.acdl:2460: wb_regs_addrW.write(0)
	wb_regs_addrW_STATEMENT_AST_10152 <= resize(CONSTANT_0_9874, 5);
	-- codix_risc_ca.acdl:2463: wb_regs_W.write(ex_alu_logic.read())
	wb_regs_W_STATEMENT_AST_10196 <= unsigned(ex_alu_logic_Q0);
	-- codix_risc_ca.acdl:2464: wb_regs_addrW.write(ex_rW.read())
	wb_regs_addrW_STATEMENT_AST_10208 <= unsigned(ex_rW_Q0);
	-- codix_risc_ca.acdl:2467: wb_regs_W.write(ex2_alu_wb.read())
	wb_regs_W_STATEMENT_AST_10220 <= unsigned(ex2_alu_wb_Q0);
	-- codix_risc_ca.acdl:2468: wb_regs_addrW.write(ex2_rW.read())
	wb_regs_addrW_STATEMENT_AST_10232 <= unsigned(ex2_rW_Q0);
	-- codix_risc_ca.acdl:2471: wb_regs_W.write(ex2_mul.read())
	wb_regs_W_STATEMENT_AST_10248 <= unsigned(ex2_mul_Q0);
	-- codix_risc_ca.acdl:2475: wb_regs_W.write(wb_alu.read())
	wb_regs_W_STATEMENT_AST_10260 <= unsigned(wb_alu_Q0);
	-- codix_risc_ca.acdl:2476: wb_regs_addrW.write(wb_rW.read())
	wb_regs_addrW_STATEMENT_AST_10272 <= unsigned(wb_rW_Q0);
	-- codix_risc_ca.acdl:2479: wb_regs_W.write(wb_mem.read())
	wb_regs_W_STATEMENT_AST_10288 <= unsigned(wb_mem_Q0);
	-- codix_risc_ca.acdl:2493: ex_hazard_stall.write((lv_bb_5_instr_lat_1_regs ...
	ex_hazard_stall_STATEMENT_AST_10300 <= "1" when ((((lv_bb_5_instr_lat_1_regs_en /= 0) and (lv_bb_4_instr_lat_2_regs_en /= 0)) or ((lv_bb_5_instr_lat_1_regs_en /= 0) and ((lv_bb_3_instr_lat_3_regs_en /= 0) or (lv_bb_2_instr_lat_m_regs_en /= 0))))) else "0";
	-- codix_risc_ca.acdl:2496: ex2_hazard_stall.write(lv_bb_4_instr_lat_2_regs ...
	ex2_hazard_stall_STATEMENT_AST_10317 <= "1" when (((lv_bb_4_instr_lat_2_regs_en /= 0) and ((lv_bb_3_instr_lat_3_regs_en /= 0) or (lv_bb_2_instr_lat_m_regs_en /= 0)))) else "0";
	-- codix_risc_ca.acdl:2502: wb_stall.write(d_mem_fr_stall.read())
	wb_stall_STATEMENT_AST_10330(0) <= d_mem_fr_stall_Q0;
	-- codix_risc_ca.acdl:2503: wb_clear.write((d_mem_rq_stall.read()||d_mem_fw ...
	wb_clear_STATEMENT_AST_10339 <= "1" when (((((d_mem_rq_stall_Q0 /= '0') or (d_mem_fw_stall_Q0 /= '0')) or (i_mem_rq_inv_stall_Q0 /= '0')) and not((wb_stall_Q0 /= '0')))) else "0";
	-- codix_risc_ca.acdl:2506: ex2_stall.write(wb_stall.read()||d_mem_rq_stall ...
	ex2_stall_STATEMENT_AST_10355 <= "1" when ((((((wb_stall_Q0 /= '0') or (d_mem_rq_stall_Q0 /= '0')) or (d_mem_fw_stall_Q0 /= '0')) or (i_mem_rq_inv_stall_Q0 /= '0')) or (ex2_hazard_stall_Q0 /= '0'))) else "0";
	-- codix_risc_ca.acdl:2507: ex2_clear.write(0)
	ex2_clear_STATEMENT_AST_10372 <= CONSTANT_0_9874;
	-- codix_risc_ca.acdl:2510: ex_stall.write(ex2_stall.read()||ex_hazard_stal ...
	ex_stall_STATEMENT_AST_10381 <= "1" when (((ex2_stall_Q0 /= '0') or (ex_hazard_stall_Q0 /= '0'))) else "0";
	-- codix_risc_ca.acdl:2517: wb_regs_we.write((lv_bb_5_instr_lat_1_regs_en&& ...
	wb_regs_we_STATEMENT_AST_10392 <= "1" when (((((lv_bb_5_instr_lat_1_regs_en /= 0) and not((ex_stall_Q0 /= '0'))) or ((lv_bb_4_instr_lat_2_regs_en /= 0) and not((ex2_stall_Q0 /= '0')))) or (((lv_bb_2_instr_lat_m_regs_en /= 0) or (lv_bb_3_instr_lat_3_regs_en /= 0)) and not((wb_stall_Q0 /= '0'))))) else "0";
	-- codix_risc_ca.acdl:2519: regs.write(wb_regs_we.read() ? (unsigned int )( ...
	regs_STATEMENT_AST_10416 <= 
		unsigned(wb_regs_W_Q0) when ((wb_regs_we_Q0 /= '0')) else
		resize(CONSTANT_0_9874, 32);
	-- codix_risc_ca.acdl:2532: wb_pc_we.write(ex_dest_en.read()&&lv_bb_10_inst ...
	wb_pc_we_STATEMENT_AST_10444 <= "1" when ((((ex_dest_en_Q0 /= '0') and (lv_bb_10_instr_jumps /= 0)) and not((ex_stall_Q0 /= '0')))) else "0";
	-- codix_risc_ca.acdl:2535: wb_pc_W.write((ex_alu_op.read()==22) ? (unsigne ...
	wb_pc_W_STATEMENT_AST_10458 <= 
		unsigned(ex_alu_add_Q0) when ((unsigned(ex_alu_op_Q0) = CONSTANT_22_9894)) else
		unsigned(ex_aluB_Q0);
	-- codix_risc_ca.acdl:2542: codasip_tmp_var_2=(wb_pc_we.read())!=0
	codasip_tmp_var_2_STATEMENT_AST_10472 <= "1" when ((wb_pc_we_Q0 /= CONSTANT_0_9874(0))) else "0";
	-- codix_risc_ca.acdl:2552: codasip_tmp_var_1=((ex_alu_op.read()==28)&&(!ex ...
	codasip_tmp_var_1_STATEMENT_AST_10483 <= "1" when (((unsigned(ex_alu_op_Q0) = CONSTANT_28_10489) and not((ex_stall_Q0 /= '0')))) else "0";
	-- codix_risc_ca.acdl:2543: port_out.write(ex_aluB.read())
	port_out_STATEMENT_AST_10497 <= unsigned(ex_aluB_Q0);
	-- codix_risc_ca.acdl:2544: port_out_en.write(1)
	port_out_en_STATEMENT_AST_10509 <= CONSTANT_1_9871;
	-- codix_risc_ca.acdl:2550: port_out.write(0)
	port_out_STATEMENT_AST_10521 <= resize(CONSTANT_0_9874, 32);
	-- codix_risc_ca.acdl:2551: port_out_en.write(0)
	port_out_en_STATEMENT_AST_10532 <= CONSTANT_0_9874;
	-- codix_risc_ca.acdl:2555: port_halt.write(((ex_alu_op.read()==31)&&(!ex_s ...
	port_halt_STATEMENT_AST_10543 <= 
		CONSTANT_1_9871 when (((unsigned(ex_alu_op_Q0) = CONSTANT_31_10550) and not((ex_stall_Q0 /= '0')))) else
		CONSTANT_0_9874;
	lv_bb_11_instr_lat_1 <= lv_bb_11_instr_lat_1_STATEMENT_AST_9843;
	lv_bb_10_instr_jumps <= lv_bb_10_instr_jumps_STATEMENT_AST_9882;
	lv_bb_9_instr_lat_2 <= lv_bb_9_instr_lat_2_STATEMENT_AST_9905;
	lv_bb_8_instr_mul <= lv_bb_8_instr_mul_STATEMENT_AST_9960;
	lv_bb_7_instr_lat_3 <= lv_bb_7_instr_lat_3_STATEMENT_AST_9971;
	lv_bb_6_instr_memory <= lv_bb_6_instr_memory_STATEMENT_AST_10002;
	lv_bb_5_instr_lat_1_regs_en <= lv_bb_5_instr_lat_1_regs_en_STATEMENT_AST_10013;
	lv_bb_4_instr_lat_2_regs_en <= lv_bb_4_instr_lat_2_regs_en_STATEMENT_AST_10026;
	lv_bb_3_instr_lat_3_regs_en <= lv_bb_3_instr_lat_3_regs_en_STATEMENT_AST_10043;
	lv_bb_2_instr_lat_m_regs_en <= lv_bb_2_instr_lat_m_regs_en_STATEMENT_AST_10058;
	lv_bb_1_wb_regs_mux <= lv_bb_1_wb_regs_mux_STATEMENT_AST_10073;
	codasip_tmp_var_3 <= codasip_tmp_var_3_STATEMENT_AST_10099;
	with wb_regs_W_D0_10146_select_15157 select
		wb_regs_W_D0 <= 
			std_logic_vector(wb_regs_W_STATEMENT_AST_10196) when "001", 
			std_logic_vector(wb_regs_W_STATEMENT_AST_10220) when "010", 
			std_logic_vector(wb_regs_W_STATEMENT_AST_10248) when "011", 
			std_logic_vector(wb_regs_W_STATEMENT_AST_10260) when "100", 
			std_logic_vector(wb_regs_W_STATEMENT_AST_10288) when "101", 
			std_logic_vector(wb_regs_W_STATEMENT_AST_10108) when others;
	with wb_regs_addrW_D0_10190_select_15158 select
		wb_regs_addrW_D0 <= 
			std_logic_vector(wb_regs_addrW_STATEMENT_AST_10208) when "001", 
			std_logic_vector(wb_regs_addrW_STATEMENT_AST_10232) when "010", 
			std_logic_vector(wb_regs_addrW_STATEMENT_AST_10232) when "011", 
			std_logic_vector(wb_regs_addrW_STATEMENT_AST_10272) when "100", 
			std_logic_vector(wb_regs_addrW_STATEMENT_AST_10272) when "101", 
			std_logic_vector(wb_regs_addrW_STATEMENT_AST_10152) when others;
	ex_hazard_stall_D0 <= ex_hazard_stall_STATEMENT_AST_10300(0);
	ex2_hazard_stall_D0 <= ex2_hazard_stall_STATEMENT_AST_10317(0);
	wb_stall_D0 <= wb_stall_STATEMENT_AST_10330(0);
	wb_clear_D0 <= wb_clear_STATEMENT_AST_10339(0);
	ex2_stall_D0 <= ex2_stall_STATEMENT_AST_10355(0);
	ex2_clear_D0 <= ex2_clear_STATEMENT_AST_10372(0);
	ex_stall_D0 <= ex_stall_STATEMENT_AST_10381(0);
	wb_regs_we_D0 <= wb_regs_we_STATEMENT_AST_10392(0);
	regs_WE0 <= CONSTANT_1_9871(0) when ((ACT = CONSTANT_1_9871(0))) else
		CONSTANT_0_9874(0);
	TERNARY_10423 <=
		wb_regs_addrW_Q0 when ((wb_regs_we_Q0 /= '0')) else
		std_logic_vector(resize(CONSTANT_0_9874, 5));
	regs_WA0 <= TERNARY_10423;
	regs_D0 <= std_logic_vector(regs_STATEMENT_AST_10416);
	wb_pc_we_D0 <= wb_pc_we_STATEMENT_AST_10444(0);
	wb_pc_W_D0 <= std_logic_vector(wb_pc_W_STATEMENT_AST_10458);
	codasip_tmp_var_2 <= codasip_tmp_var_2_STATEMENT_AST_10472;
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_10483;
	port_out_D0 <= std_logic_vector(port_out_STATEMENT_AST_10497) when (((ACT = CONSTANT_1_9871(0)) and (codasip_tmp_var_1 /= 0))) else 
		std_logic_vector(port_out_STATEMENT_AST_10521) when (((ACT = CONSTANT_1_9871(0)) and not((codasip_tmp_var_1 /= 0)))) else
		std_logic_vector(CONSTANT_0_10502);
	port_out_en_D0 <= port_out_en_STATEMENT_AST_10509(0) when (((ACT = CONSTANT_1_9871(0)) and (codasip_tmp_var_1 /= 0))) else 
		port_out_en_STATEMENT_AST_10532(0) when (((ACT = CONSTANT_1_9871(0)) and not((codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_9874(0);
	port_halt_D0 <= port_halt_STATEMENT_AST_10543(0);

end architecture RTL;


