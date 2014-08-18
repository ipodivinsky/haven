--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_Q0 : in std_logic_vector(4 downto 0);
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
		rd_mem_rw_WE0 : out std_logic
	);
end entity codix_risc_ca_core_main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_2429 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_2444 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_2459 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_2474 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_2498 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_2513 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_2528 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_2543 : unsigned(2 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_2558 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2567 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2589 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2607 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2625 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2643 : unsigned(5 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_2431: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_2454: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_2508: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_2439: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_2469: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_2582: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_2446: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_11_2592: unsigned(3 downto 0) := to_unsigned(11, 4);
	constant CONSTANT_12_2482: unsigned(3 downto 0) := to_unsigned(12, 4);
	constant CONSTANT_13_2479: unsigned(3 downto 0) := to_unsigned(13, 4);
	constant CONSTANT_2_2485: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_20_2570: unsigned(4 downto 0) := to_unsigned(20, 5);
	constant CONSTANT_23_2572: unsigned(4 downto 0) := to_unsigned(23, 5);
	constant CONSTANT_24_2594: unsigned(4 downto 0) := to_unsigned(24, 5);
	constant CONSTANT_25_2612: unsigned(4 downto 0) := to_unsigned(25, 5);
	constant CONSTANT_26_2630: unsigned(4 downto 0) := to_unsigned(26, 5);
	constant CONSTANT_3_2545: unsigned(1 downto 0) := to_unsigned(3, 2);

begin
	-- child instances inside 'main_0_instr_hw_jump_abs_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1022: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_2429 <= resize(CONSTANT_0_2431, 4);
	-- codix_risc_ca.acdl:1023: rd_dest_en_mux.write(1)
	rd_dest_en_mux_STATEMENT_AST_2444 <= resize(CONSTANT_1_2446, 2);
	-- codix_risc_ca.acdl:1024: rd_cond.write(0)
	rd_cond_STATEMENT_AST_2459 <= resize(CONSTANT_0_2431, 5);
	-- codix_risc_ca.acdl:1025: rd_ie_flag.write(((codasip_instance_main_0_inst ...
	rd_ie_flag_STATEMENT_AST_2474 <= 
		CONSTANT_2_2485 when (((unsigned(codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_Q0) = CONSTANT_12_2482) or (unsigned(codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_Q0) = CONSTANT_13_2479))) else
		resize(CONSTANT_0_2431, 2);
	-- codix_risc_ca.acdl:1028: rd_amB.write(0)
	rd_amB_STATEMENT_AST_2498 <= resize(CONSTANT_0_2431, 3);
	-- codix_risc_ca.acdl:1029: rd_amC.write(0)
	rd_amC_STATEMENT_AST_2513 <= CONSTANT_0_2431;
	-- codix_risc_ca.acdl:1031: rd_aluA_mux.write(1)
	rd_aluA_mux_STATEMENT_AST_2528 <= CONSTANT_1_2446;
	-- codix_risc_ca.acdl:1032: rd_aluB_mux.write(3)
	rd_aluB_mux_STATEMENT_AST_2543 <= resize(CONSTANT_3_2545, 3);
	-- codix_risc_ca.acdl:1051: codasip_tmp_var_1=codasip_instance_main_0_instr ...
	codasip_tmp_var_1_STATEMENT_AST_2558 <= unsigned(codasip_instance_main_0_instr_hw_operation_opr_jump_call_0_Q0);
	-- codix_risc_ca.acdl:1037: rd_alu_op.write(23)
	rd_alu_op_STATEMENT_AST_2567 <= resize(CONSTANT_23_2572, 6);
	-- codix_risc_ca.acdl:1040: rd_alu_op.write(24)
	rd_alu_op_STATEMENT_AST_2589 <= resize(CONSTANT_24_2594, 6);
	-- codix_risc_ca.acdl:1043: rd_alu_op.write(25)
	rd_alu_op_STATEMENT_AST_2607 <= resize(CONSTANT_25_2612, 6);
	-- codix_risc_ca.acdl:1046: rd_alu_op.write(26)
	rd_alu_op_STATEMENT_AST_2625 <= resize(CONSTANT_26_2630, 6);
	-- codix_risc_ca.acdl:1049: rd_alu_op.write(0)
	rd_alu_op_STATEMENT_AST_2643 <= resize(CONSTANT_0_2431, 6);
	rd_mem_rw_WE0 <= CONSTANT_1_2446(0) when ((ACT = CONSTANT_1_2446(0))) else
		CONSTANT_0_2431(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_2429) when ((ACT = CONSTANT_1_2446(0))) else
		std_logic_vector(CONSTANT_0_2439);
	rd_dest_en_mux_WE0 <= CONSTANT_1_2446(0) when ((ACT = CONSTANT_1_2446(0))) else
		CONSTANT_0_2431(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_2444) when ((ACT = CONSTANT_1_2446(0))) else
		std_logic_vector(CONSTANT_0_2454);
	rd_cond_WE0 <= CONSTANT_1_2446(0) when ((ACT = CONSTANT_1_2446(0))) else
		CONSTANT_0_2431(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_2459) when ((ACT = CONSTANT_1_2446(0))) else
		std_logic_vector(CONSTANT_0_2469);
	rd_ie_flag_WE0 <= CONSTANT_1_2446(0) when ((ACT = CONSTANT_1_2446(0))) else
		CONSTANT_0_2431(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_2474) when ((ACT = CONSTANT_1_2446(0))) else
		std_logic_vector(CONSTANT_0_2454);
	rd_amB_WE0 <= CONSTANT_1_2446(0) when ((ACT = CONSTANT_1_2446(0))) else
		CONSTANT_0_2431(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_2498) when ((ACT = CONSTANT_1_2446(0))) else
		std_logic_vector(CONSTANT_0_2508);
	rd_amC_WE0 <= CONSTANT_1_2446(0) when ((ACT = CONSTANT_1_2446(0))) else
		CONSTANT_0_2431(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_2513(0) when ((ACT = CONSTANT_1_2446(0))) else
		CONSTANT_0_2431(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_2446(0) when ((ACT = CONSTANT_1_2446(0))) else
		CONSTANT_0_2431(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_2528(0) when ((ACT = CONSTANT_1_2446(0))) else
		CONSTANT_0_2431(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_2446(0) when ((ACT = CONSTANT_1_2446(0))) else
		CONSTANT_0_2431(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_2543) when ((ACT = CONSTANT_1_2446(0))) else
		std_logic_vector(CONSTANT_0_2508);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_2558;
	rd_alu_op_WE0 <= CONSTANT_1_2446(0) when (((ACT = CONSTANT_1_2446(0)) and (CONSTANT_20_2570 = codasip_tmp_var_1))) else 
		CONSTANT_1_2446(0) when (((ACT = CONSTANT_1_2446(0)) and (CONSTANT_11_2592 = codasip_tmp_var_1))) else 
		CONSTANT_1_2446(0) when (((ACT = CONSTANT_1_2446(0)) and (CONSTANT_12_2482 = codasip_tmp_var_1))) else 
		CONSTANT_1_2446(0) when (((ACT = CONSTANT_1_2446(0)) and (CONSTANT_13_2479 = codasip_tmp_var_1))) else 
		CONSTANT_1_2446(0) when (((ACT = CONSTANT_1_2446(0)) and (((not((CONSTANT_20_2570 = codasip_tmp_var_1)) and not((CONSTANT_11_2592 = codasip_tmp_var_1))) and not((CONSTANT_12_2482 = codasip_tmp_var_1))) and not((CONSTANT_13_2479 = codasip_tmp_var_1))))) else
		CONSTANT_0_2431(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_2567) when (((ACT = CONSTANT_1_2446(0)) and (CONSTANT_20_2570 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2589) when (((ACT = CONSTANT_1_2446(0)) and (CONSTANT_11_2592 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2607) when (((ACT = CONSTANT_1_2446(0)) and (CONSTANT_12_2482 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2625) when (((ACT = CONSTANT_1_2446(0)) and (CONSTANT_13_2479 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2643) when (((ACT = CONSTANT_1_2446(0)) and (((not((CONSTANT_20_2570 = codasip_tmp_var_1)) and not((CONSTANT_11_2592 = codasip_tmp_var_1))) and not((CONSTANT_12_2482 = codasip_tmp_var_1))) and not((CONSTANT_13_2479 = codasip_tmp_var_1))))) else
		std_logic_vector(CONSTANT_0_2582);

end architecture RTL;


