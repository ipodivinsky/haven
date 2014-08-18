--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
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
		wb_stall_Q0 : in std_logic	);
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
	signal lv_bb_11_instr_lat_1_STATEMENT_AST_9281 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_10_instr_jumps_STATEMENT_AST_9320 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_9_instr_lat_2_STATEMENT_AST_9343 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_8_instr_mul_STATEMENT_AST_9398 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_7_instr_lat_3_STATEMENT_AST_9409 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_6_instr_memory_STATEMENT_AST_9440 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_5_instr_lat_1_regs_en_STATEMENT_AST_9451 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_4_instr_lat_2_regs_en_STATEMENT_AST_9464 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_3_instr_lat_3_regs_en_STATEMENT_AST_9481 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_2_instr_lat_m_regs_en_STATEMENT_AST_9496 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_wb_regs_mux_STATEMENT_AST_9511 : unsigned(2 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_3_STATEMENT_AST_9537 : unsigned(2 downto 0);
	-- signal (inner)
	signal wb_regs_W_STATEMENT_AST_9546 : unsigned(31 downto 0);
	-- signal (inner)
	signal wb_regs_addrW_STATEMENT_AST_9590 : unsigned(4 downto 0);
	-- signal (inner)
	signal wb_regs_W_STATEMENT_AST_9634 : unsigned(31 downto 0);
	-- signal (inner)
	signal wb_regs_addrW_STATEMENT_AST_9646 : unsigned(4 downto 0);
	-- signal (inner)
	signal wb_regs_W_STATEMENT_AST_9658 : unsigned(31 downto 0);
	-- signal (inner)
	signal wb_regs_addrW_STATEMENT_AST_9670 : unsigned(4 downto 0);
	-- signal (inner)
	signal wb_regs_W_STATEMENT_AST_9686 : unsigned(31 downto 0);
	-- signal (inner)
	signal wb_regs_addrW_STATEMENT_AST_9698 : unsigned(4 downto 0);
	-- signal (inner)
	signal wb_regs_W_STATEMENT_AST_9714 : unsigned(31 downto 0);
	-- signal (inner)
	signal wb_regs_W_STATEMENT_AST_9726 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_hazard_stall_STATEMENT_AST_9738 : unsigned(0 downto 0);
	-- signal (inner)
	signal ex2_hazard_stall_STATEMENT_AST_9755 : unsigned(0 downto 0);
	-- signal (inner)
	signal wb_stall_STATEMENT_AST_9768 : unsigned(0 downto 0);
	-- signal (inner)
	signal wb_clear_STATEMENT_AST_9777 : unsigned(0 downto 0);
	-- signal (inner)
	signal ex2_stall_STATEMENT_AST_9793 : unsigned(0 downto 0);
	-- signal (inner)
	signal ex2_clear_STATEMENT_AST_9810 : unsigned(0 downto 0);
	-- signal (inner)
	signal ex_stall_STATEMENT_AST_9819 : unsigned(0 downto 0);
	-- signal (inner)
	signal wb_regs_we_STATEMENT_AST_9830 : unsigned(0 downto 0);
	-- signal (inner)
	signal regs_STATEMENT_AST_9854 : unsigned(31 downto 0);
	-- signal (inner)
	signal wb_pc_we_STATEMENT_AST_9882 : unsigned(0 downto 0);
	-- signal (inner)
	signal wb_pc_W_STATEMENT_AST_9896 : unsigned(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2_STATEMENT_AST_9910 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_9921 : unsigned(0 downto 0);
	-- signal (inner)
	signal port_out_STATEMENT_AST_9935 : unsigned(31 downto 0);
	-- signal (inner)
	signal port_out_en_STATEMENT_AST_9947 : unsigned(0 downto 0);
	-- signal (inner)
	signal port_out_STATEMENT_AST_9959 : unsigned(31 downto 0);
	-- signal (inner)
	signal port_out_en_STATEMENT_AST_9970 : unsigned(0 downto 0);
	-- signal (inner)
	signal port_halt_STATEMENT_AST_9981 : unsigned(0 downto 0);

		-- datapath signals and constants
	signal wb_regs_W_D0_9584_select_14589: std_logic_vector(2 downto 0);
	signal wb_regs_addrW_D0_9628_select_14590: std_logic_vector(2 downto 0);
	signal TERNARY_9861: std_logic_vector(4 downto 0);
	constant CONSTANT_0_9312: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_9940: unsigned(31 downto 0) := to_unsigned(0, 32);
	constant CONSTANT_1_9309: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_10_9367: unsigned(3 downto 0) := to_unsigned(10, 4);
	constant CONSTANT_11_9375: unsigned(3 downto 0) := to_unsigned(11, 4);
	constant CONSTANT_12_9371: unsigned(3 downto 0) := to_unsigned(12, 4);
	constant CONSTANT_13_9297: unsigned(3 downto 0) := to_unsigned(13, 4);
	constant CONSTANT_14_9293: unsigned(3 downto 0) := to_unsigned(14, 4);
	constant CONSTANT_15_9289: unsigned(3 downto 0) := to_unsigned(15, 4);
	constant CONSTANT_17_9363: unsigned(4 downto 0) := to_unsigned(17, 5);
	constant CONSTANT_18_9390: unsigned(4 downto 0) := to_unsigned(18, 5);
	constant CONSTANT_19_9387: unsigned(4 downto 0) := to_unsigned(19, 5);
	constant CONSTANT_2_9305: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_20_9443: unsigned(4 downto 0) := to_unsigned(20, 5);
	constant CONSTANT_22_9332: unsigned(4 downto 0) := to_unsigned(22, 5);
	constant CONSTANT_23_9335: unsigned(4 downto 0) := to_unsigned(23, 5);
	constant CONSTANT_24_9328: unsigned(4 downto 0) := to_unsigned(24, 5);
	constant CONSTANT_25_9324: unsigned(4 downto 0) := to_unsigned(25, 5);
	constant CONSTANT_28_9927: unsigned(4 downto 0) := to_unsigned(28, 5);
	constant CONSTANT_3_9301: unsigned(1 downto 0) := to_unsigned(3, 2);
	constant CONSTANT_30_9285: unsigned(4 downto 0) := to_unsigned(30, 5);
	constant CONSTANT_31_9988: unsigned(4 downto 0) := to_unsigned(31, 5);
	constant CONSTANT_4_9529: unsigned(2 downto 0) := to_unsigned(4, 3);
	constant CONSTANT_48_9432: unsigned(5 downto 0) := to_unsigned(48, 6);
	constant CONSTANT_49_9429: unsigned(5 downto 0) := to_unsigned(49, 6);
	constant CONSTANT_5_9383: unsigned(2 downto 0) := to_unsigned(5, 3);
	constant CONSTANT_50_9425: unsigned(5 downto 0) := to_unsigned(50, 6);
	constant CONSTANT_51_9421: unsigned(5 downto 0) := to_unsigned(51, 6);
	constant CONSTANT_52_9417: unsigned(5 downto 0) := to_unsigned(52, 6);
	constant CONSTANT_53_9413: unsigned(5 downto 0) := to_unsigned(53, 6);
	constant CONSTANT_6_9379: unsigned(2 downto 0) := to_unsigned(6, 3);
	constant CONSTANT_7_9401: unsigned(2 downto 0) := to_unsigned(7, 3);
	constant CONSTANT_8_9359: unsigned(3 downto 0) := to_unsigned(8, 4);
	constant CONSTANT_9_9355: unsigned(3 downto 0) := to_unsigned(9, 4);

begin
	-- child instances inside 'main_wb_output_wb_output_fu_semantics' functional unit:

		-- conversions for datapath
	wb_regs_W_D0_9584_select_14589 <= std_logic_vector(codasip_tmp_var_3);
	wb_regs_addrW_D0_9628_select_14590 <= std_logic_vector(codasip_tmp_var_3);

		-- Datapath code
	-- codix_risc_ca.acdl:2424: lv_bb_11_instr_lat_1=(ex_alu_op.read()==0)||(ex ...
	lv_bb_11_instr_lat_1_STATEMENT_AST_9281 <= "1" when (((((((((unsigned(ex_alu_op_Q0) = CONSTANT_0_9312) or (unsigned(ex_alu_op_Q0) = CONSTANT_1_9309)) or (unsigned(ex_alu_op_Q0) = CONSTANT_2_9305)) or (unsigned(ex_alu_op_Q0) = CONSTANT_3_9301)) or (unsigned(ex_alu_op_Q0) = CONSTANT_13_9297)) or (unsigned(ex_alu_op_Q0) = CONSTANT_14_9293)) or (unsigned(ex_alu_op_Q0) = CONSTANT_15_9289)) or (unsigned(ex_alu_op_Q0) = CONSTANT_30_9285))) else "0";
	-- codix_risc_ca.acdl:2427: lv_bb_10_instr_jumps=(ex_alu_op.read()==23)||(e ...
	lv_bb_10_instr_jumps_STATEMENT_AST_9320 <= "1" when (((((unsigned(ex_alu_op_Q0) = CONSTANT_23_9335) or (unsigned(ex_alu_op_Q0) = CONSTANT_22_9332)) or (unsigned(ex_alu_op_Q0) = CONSTANT_24_9328)) or (unsigned(ex_alu_op_Q0) = CONSTANT_25_9324))) else "0";
	-- codix_risc_ca.acdl:2436: lv_bb_9_instr_lat_2=(ex2_alu_op.read()==18)||(e ...
	lv_bb_9_instr_lat_2_STATEMENT_AST_9343 <= "1" when (((((((((((((unsigned(ex2_alu_op_Q0) = CONSTANT_18_9390) or (unsigned(ex2_alu_op_Q0) = CONSTANT_19_9387)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_5_9383)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_6_9379)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_11_9375)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_12_9371)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_10_9367)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_17_9363)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_8_9359)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_9_9355)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_24_9328)) or (unsigned(ex2_alu_op_Q0) = CONSTANT_25_9324))) else "0";
	-- codix_risc_ca.acdl:2438: lv_bb_8_instr_mul=(ex2_alu_op.read()==7)
	lv_bb_8_instr_mul_STATEMENT_AST_9398 <= "1" when ((unsigned(ex2_alu_op_Q0) = CONSTANT_7_9401)) else "0";
	-- codix_risc_ca.acdl:2442: lv_bb_7_instr_lat_3=(wb_alu_op.read()==48)||(wb ...
	lv_bb_7_instr_lat_3_STATEMENT_AST_9409 <= "1" when (((((((unsigned(wb_alu_op_Q0) = CONSTANT_48_9432) or (unsigned(wb_alu_op_Q0) = CONSTANT_49_9429)) or (unsigned(wb_alu_op_Q0) = CONSTANT_50_9425)) or (unsigned(wb_alu_op_Q0) = CONSTANT_51_9421)) or (unsigned(wb_alu_op_Q0) = CONSTANT_52_9417)) or (unsigned(wb_alu_op_Q0) = CONSTANT_53_9413))) else "0";
	-- codix_risc_ca.acdl:2444: lv_bb_6_instr_memory=(wb_alu_op.read()==20)
	lv_bb_6_instr_memory_STATEMENT_AST_9440 <= "1" when ((unsigned(wb_alu_op_Q0) = CONSTANT_20_9443)) else "0";
	-- codix_risc_ca.acdl:2448: lv_bb_5_instr_lat_1_regs_en=((ex_rW.read())!=0) ...
	lv_bb_5_instr_lat_1_regs_en_STATEMENT_AST_9451 <= "1" when (((unsigned(ex_rW_Q0) /= CONSTANT_0_9312) and (lv_bb_11_instr_lat_1 /= 0))) else "0";
	-- codix_risc_ca.acdl:2449: lv_bb_4_instr_lat_2_regs_en=ex2_dest_en.read()& ...
	lv_bb_4_instr_lat_2_regs_en_STATEMENT_AST_9464 <= "1" when ((((ex2_dest_en_Q0 /= '0') and (unsigned(ex2_rW_Q0) /= CONSTANT_0_9312)) and ((lv_bb_9_instr_lat_2 /= 0) or (lv_bb_8_instr_mul /= 0)))) else "0";
	-- codix_risc_ca.acdl:2450: lv_bb_3_instr_lat_3_regs_en=wb_dest_en.read()&& ...
	lv_bb_3_instr_lat_3_regs_en_STATEMENT_AST_9481 <= "1" when ((((wb_dest_en_Q0 /= '0') and (unsigned(wb_rW_Q0) /= CONSTANT_0_9312)) and (lv_bb_7_instr_lat_3 /= 0))) else "0";
	-- codix_risc_ca.acdl:2451: lv_bb_2_instr_lat_m_regs_en=wb_dest_en.read()&& ...
	lv_bb_2_instr_lat_m_regs_en_STATEMENT_AST_9496 <= "1" when ((((wb_dest_en_Q0 /= '0') and (unsigned(wb_rW_Q0) /= CONSTANT_0_9312)) and (lv_bb_6_instr_memory /= 0))) else "0";
	-- codix_risc_ca.acdl:2460: lv_bb_1_wb_regs_mux=(lv_bb_2_instr_lat_m_regs_e ...
	lv_bb_1_wb_regs_mux_STATEMENT_AST_9511 <= 
		CONSTANT_5_9383 when ((lv_bb_2_instr_lat_m_regs_en /= 0)) else
		CONSTANT_4_9529 when ((lv_bb_3_instr_lat_3_regs_en /= 0)) else
		resize(CONSTANT_3_9301, 3) when (((lv_bb_4_instr_lat_2_regs_en /= 0) and (lv_bb_8_instr_mul /= 0))) else
		resize(CONSTANT_2_9305, 3) when ((lv_bb_4_instr_lat_2_regs_en /= 0)) else
		resize(CONSTANT_1_9309, 3) when ((lv_bb_5_instr_lat_1_regs_en /= 0)) else
		resize(CONSTANT_0_9312, 3);
	-- codix_risc_ca.acdl:2492: codasip_tmp_var_3=lv_bb_1_wb_regs_mux
	codasip_tmp_var_3_STATEMENT_AST_9537 <= lv_bb_1_wb_regs_mux;
	-- codix_risc_ca.acdl:2465: wb_regs_W.write(0)
	wb_regs_W_STATEMENT_AST_9546 <= resize(CONSTANT_0_9312, 32);
	-- codix_risc_ca.acdl:2466: wb_regs_addrW.write(0)
	wb_regs_addrW_STATEMENT_AST_9590 <= resize(CONSTANT_0_9312, 5);
	-- codix_risc_ca.acdl:2469: wb_regs_W.write(ex_alu_logic.read())
	wb_regs_W_STATEMENT_AST_9634 <= unsigned(ex_alu_logic_Q0);
	-- codix_risc_ca.acdl:2470: wb_regs_addrW.write(ex_rW.read())
	wb_regs_addrW_STATEMENT_AST_9646 <= unsigned(ex_rW_Q0);
	-- codix_risc_ca.acdl:2473: wb_regs_W.write(ex2_alu_wb.read())
	wb_regs_W_STATEMENT_AST_9658 <= unsigned(ex2_alu_wb_Q0);
	-- codix_risc_ca.acdl:2474: wb_regs_addrW.write(ex2_rW.read())
	wb_regs_addrW_STATEMENT_AST_9670 <= unsigned(ex2_rW_Q0);
	-- codix_risc_ca.acdl:2481: wb_regs_W.write(wb_alu.read())
	wb_regs_W_STATEMENT_AST_9686 <= unsigned(wb_alu_Q0);
	-- codix_risc_ca.acdl:2482: wb_regs_addrW.write(wb_rW.read())
	wb_regs_addrW_STATEMENT_AST_9698 <= unsigned(wb_rW_Q0);
	-- codix_risc_ca.acdl:2477: wb_regs_W.write(ex2_mul.read())
	wb_regs_W_STATEMENT_AST_9714 <= unsigned(ex2_mul_Q0);
	-- codix_risc_ca.acdl:2485: wb_regs_W.write(wb_mem.read())
	wb_regs_W_STATEMENT_AST_9726 <= unsigned(wb_mem_Q0);
	-- codix_risc_ca.acdl:2499: ex_hazard_stall.write((lv_bb_5_instr_lat_1_regs ...
	ex_hazard_stall_STATEMENT_AST_9738 <= "1" when ((((lv_bb_5_instr_lat_1_regs_en /= 0) and (lv_bb_4_instr_lat_2_regs_en /= 0)) or ((lv_bb_5_instr_lat_1_regs_en /= 0) and ((lv_bb_3_instr_lat_3_regs_en /= 0) or (lv_bb_2_instr_lat_m_regs_en /= 0))))) else "0";
	-- codix_risc_ca.acdl:2502: ex2_hazard_stall.write(lv_bb_4_instr_lat_2_regs ...
	ex2_hazard_stall_STATEMENT_AST_9755 <= "1" when (((lv_bb_4_instr_lat_2_regs_en /= 0) and ((lv_bb_3_instr_lat_3_regs_en /= 0) or (lv_bb_2_instr_lat_m_regs_en /= 0)))) else "0";
	-- codix_risc_ca.acdl:2508: wb_stall.write(d_mem_fr_stall.read())
	wb_stall_STATEMENT_AST_9768(0) <= d_mem_fr_stall_Q0;
	-- codix_risc_ca.acdl:2509: wb_clear.write((d_mem_rq_stall.read()||d_mem_fw ...
	wb_clear_STATEMENT_AST_9777 <= "1" when (((((d_mem_rq_stall_Q0 /= '0') or (d_mem_fw_stall_Q0 /= '0')) or (i_mem_rq_inv_stall_Q0 /= '0')) and not((wb_stall_Q0 /= '0')))) else "0";
	-- codix_risc_ca.acdl:2512: ex2_stall.write(wb_stall.read()||d_mem_rq_stall ...
	ex2_stall_STATEMENT_AST_9793 <= "1" when ((((((wb_stall_Q0 /= '0') or (d_mem_rq_stall_Q0 /= '0')) or (d_mem_fw_stall_Q0 /= '0')) or (i_mem_rq_inv_stall_Q0 /= '0')) or (ex2_hazard_stall_Q0 /= '0'))) else "0";
	-- codix_risc_ca.acdl:2513: ex2_clear.write(0)
	ex2_clear_STATEMENT_AST_9810 <= CONSTANT_0_9312;
	-- codix_risc_ca.acdl:2516: ex_stall.write(ex2_stall.read()||ex_hazard_stal ...
	ex_stall_STATEMENT_AST_9819 <= "1" when (((ex2_stall_Q0 /= '0') or (ex_hazard_stall_Q0 /= '0'))) else "0";
	-- codix_risc_ca.acdl:2523: wb_regs_we.write((lv_bb_5_instr_lat_1_regs_en&& ...
	wb_regs_we_STATEMENT_AST_9830 <= "1" when (((((lv_bb_5_instr_lat_1_regs_en /= 0) and not((ex_stall_Q0 /= '0'))) or ((lv_bb_4_instr_lat_2_regs_en /= 0) and not((ex2_stall_Q0 /= '0')))) or (((lv_bb_2_instr_lat_m_regs_en /= 0) or (lv_bb_3_instr_lat_3_regs_en /= 0)) and not((wb_stall_Q0 /= '0'))))) else "0";
	-- codix_risc_ca.acdl:2525: regs.write(wb_regs_we.read() ? (unsigned int )( ...
	regs_STATEMENT_AST_9854 <= 
		unsigned(wb_regs_W_Q0) when ((wb_regs_we_Q0 /= '0')) else
		resize(CONSTANT_0_9312, 32);
	-- codix_risc_ca.acdl:2538: wb_pc_we.write(ex_dest_en.read()&&lv_bb_10_inst ...
	wb_pc_we_STATEMENT_AST_9882 <= "1" when ((((ex_dest_en_Q0 /= '0') and (lv_bb_10_instr_jumps /= 0)) and not((ex_stall_Q0 /= '0')))) else "0";
	-- codix_risc_ca.acdl:2541: wb_pc_W.write((ex_alu_op.read()==22) ? (unsigne ...
	wb_pc_W_STATEMENT_AST_9896 <= 
		unsigned(ex_alu_add_Q0) when ((unsigned(ex_alu_op_Q0) = CONSTANT_22_9332)) else
		unsigned(ex_aluB_Q0);
	-- codix_risc_ca.acdl:2548: codasip_tmp_var_2=(wb_pc_we.read())!=0
	codasip_tmp_var_2_STATEMENT_AST_9910 <= "1" when ((wb_pc_we_Q0 /= CONSTANT_0_9312(0))) else "0";
	-- codix_risc_ca.acdl:2558: codasip_tmp_var_1=((ex_alu_op.read()==28)&&(!ex ...
	codasip_tmp_var_1_STATEMENT_AST_9921 <= "1" when (((unsigned(ex_alu_op_Q0) = CONSTANT_28_9927) and not((ex_stall_Q0 /= '0')))) else "0";
	-- codix_risc_ca.acdl:2549: port_out.write(ex_aluB.read())
	port_out_STATEMENT_AST_9935 <= unsigned(ex_aluB_Q0);
	-- codix_risc_ca.acdl:2550: port_out_en.write(1)
	port_out_en_STATEMENT_AST_9947 <= CONSTANT_1_9309;
	-- codix_risc_ca.acdl:2556: port_out.write(0)
	port_out_STATEMENT_AST_9959 <= resize(CONSTANT_0_9312, 32);
	-- codix_risc_ca.acdl:2557: port_out_en.write(0)
	port_out_en_STATEMENT_AST_9970 <= CONSTANT_0_9312;
	-- codix_risc_ca.acdl:2561: port_halt.write(((ex_alu_op.read()==31)&&(!ex_s ...
	port_halt_STATEMENT_AST_9981 <= 
		CONSTANT_1_9309 when (((unsigned(ex_alu_op_Q0) = CONSTANT_31_9988) and not((ex_stall_Q0 /= '0')))) else
		CONSTANT_0_9312;
	lv_bb_11_instr_lat_1 <= lv_bb_11_instr_lat_1_STATEMENT_AST_9281;
	lv_bb_10_instr_jumps <= lv_bb_10_instr_jumps_STATEMENT_AST_9320;
	lv_bb_9_instr_lat_2 <= lv_bb_9_instr_lat_2_STATEMENT_AST_9343;
	lv_bb_8_instr_mul <= lv_bb_8_instr_mul_STATEMENT_AST_9398;
	lv_bb_7_instr_lat_3 <= lv_bb_7_instr_lat_3_STATEMENT_AST_9409;
	lv_bb_6_instr_memory <= lv_bb_6_instr_memory_STATEMENT_AST_9440;
	lv_bb_5_instr_lat_1_regs_en <= lv_bb_5_instr_lat_1_regs_en_STATEMENT_AST_9451;
	lv_bb_4_instr_lat_2_regs_en <= lv_bb_4_instr_lat_2_regs_en_STATEMENT_AST_9464;
	lv_bb_3_instr_lat_3_regs_en <= lv_bb_3_instr_lat_3_regs_en_STATEMENT_AST_9481;
	lv_bb_2_instr_lat_m_regs_en <= lv_bb_2_instr_lat_m_regs_en_STATEMENT_AST_9496;
	lv_bb_1_wb_regs_mux <= lv_bb_1_wb_regs_mux_STATEMENT_AST_9511;
	codasip_tmp_var_3 <= codasip_tmp_var_3_STATEMENT_AST_9537;
	with wb_regs_W_D0_9584_select_14589 select
		wb_regs_W_D0 <= 
			std_logic_vector(wb_regs_W_STATEMENT_AST_9634) when "001", 
			std_logic_vector(wb_regs_W_STATEMENT_AST_9658) when "010", 
			std_logic_vector(wb_regs_W_STATEMENT_AST_9714) when "011", 
			std_logic_vector(wb_regs_W_STATEMENT_AST_9686) when "100", 
			std_logic_vector(wb_regs_W_STATEMENT_AST_9726) when "101", 
			std_logic_vector(wb_regs_W_STATEMENT_AST_9546) when others;
	with wb_regs_addrW_D0_9628_select_14590 select
		wb_regs_addrW_D0 <= 
			std_logic_vector(wb_regs_addrW_STATEMENT_AST_9646) when "001", 
			std_logic_vector(wb_regs_addrW_STATEMENT_AST_9670) when "010", 
			std_logic_vector(wb_regs_addrW_STATEMENT_AST_9670) when "011", 
			std_logic_vector(wb_regs_addrW_STATEMENT_AST_9698) when "100", 
			std_logic_vector(wb_regs_addrW_STATEMENT_AST_9698) when "101", 
			std_logic_vector(wb_regs_addrW_STATEMENT_AST_9590) when others;
	ex_hazard_stall_D0 <= ex_hazard_stall_STATEMENT_AST_9738(0);
	ex2_hazard_stall_D0 <= ex2_hazard_stall_STATEMENT_AST_9755(0);
	wb_stall_D0 <= wb_stall_STATEMENT_AST_9768(0);
	wb_clear_D0 <= wb_clear_STATEMENT_AST_9777(0);
	ex2_stall_D0 <= ex2_stall_STATEMENT_AST_9793(0);
	ex2_clear_D0 <= ex2_clear_STATEMENT_AST_9810(0);
	ex_stall_D0 <= ex_stall_STATEMENT_AST_9819(0);
	wb_regs_we_D0 <= wb_regs_we_STATEMENT_AST_9830(0);
	regs_WE0 <= CONSTANT_1_9309(0) when ((ACT = CONSTANT_1_9309(0))) else
		CONSTANT_0_9312(0);
	TERNARY_9861 <=
		wb_regs_addrW_Q0 when ((wb_regs_we_Q0 /= '0')) else
		std_logic_vector(resize(CONSTANT_0_9312, 5));
	regs_WA0 <= TERNARY_9861;
	regs_D0 <= std_logic_vector(regs_STATEMENT_AST_9854);
	wb_pc_we_D0 <= wb_pc_we_STATEMENT_AST_9882(0);
	wb_pc_W_D0 <= std_logic_vector(wb_pc_W_STATEMENT_AST_9896);
	codasip_tmp_var_2 <= codasip_tmp_var_2_STATEMENT_AST_9910;
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_9921;
	port_out_D0 <= std_logic_vector(port_out_STATEMENT_AST_9935) when (((ACT = CONSTANT_1_9309(0)) and (codasip_tmp_var_1 /= 0))) else 
		std_logic_vector(port_out_STATEMENT_AST_9959) when (((ACT = CONSTANT_1_9309(0)) and not((codasip_tmp_var_1 /= 0)))) else
		std_logic_vector(CONSTANT_0_9940);
	port_out_en_D0 <= port_out_en_STATEMENT_AST_9947(0) when (((ACT = CONSTANT_1_9309(0)) and (codasip_tmp_var_1 /= 0))) else 
		port_out_en_STATEMENT_AST_9970(0) when (((ACT = CONSTANT_1_9309(0)) and not((codasip_tmp_var_1 /= 0)))) else
		CONSTANT_0_9312(0);
	port_halt_D0 <= port_halt_STATEMENT_AST_9981(0);

end architecture RTL;


