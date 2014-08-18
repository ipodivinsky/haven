--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_Q0 : in std_logic_vector(8 downto 0);
		codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0 : in std_logic_vector(2 downto 0);
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
end entity codix_risc_ca_core_main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(8 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_3224 : unsigned(5 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_3239 : unsigned(8 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_3248 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_3270 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_3288 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_3306 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_3324 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_3342 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_3381 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_3396 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_3411 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_3426 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_3441 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_3456 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_3471 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_3368: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_3391: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_3436: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_3263: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_3406: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_3234: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_3253: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_2_3275: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_20_3226: unsigned(4 downto 0) := to_unsigned(20, 5);
	constant CONSTANT_3_3293: unsigned(1 downto 0) := to_unsigned(3, 2);
	constant CONSTANT_325_3251: unsigned(8 downto 0) := to_unsigned(325, 9);
	constant CONSTANT_326_3273: unsigned(8 downto 0) := to_unsigned(326, 9);
	constant CONSTANT_327_3291: unsigned(8 downto 0) := to_unsigned(327, 9);
	constant CONSTANT_328_3309: unsigned(8 downto 0) := to_unsigned(328, 9);
	constant CONSTANT_329_3327: unsigned(8 downto 0) := to_unsigned(329, 9);
	constant CONSTANT_4_3311: unsigned(2 downto 0) := to_unsigned(4, 3);
	constant CONSTANT_5_3329: unsigned(2 downto 0) := to_unsigned(5, 3);

begin
	-- child instances inside 'main_0_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1198: rd_alu_op.write(20)
	rd_alu_op_STATEMENT_AST_3224 <= resize(CONSTANT_20_3226, 6);
	-- codix_risc_ca.acdl:1214: codasip_tmp_var_1=codasip_instance_main_0_instr ...
	codasip_tmp_var_1_STATEMENT_AST_3239 <= unsigned(codasip_instance_main_0_instr_hw_operation_opr_ld_reg_0_Q0);
	-- codix_risc_ca.acdl:1202: rd_mem_rw.write(1)
	rd_mem_rw_STATEMENT_AST_3248 <= resize(CONSTANT_1_3253, 4);
	-- codix_risc_ca.acdl:1204: rd_mem_rw.write(2)
	rd_mem_rw_STATEMENT_AST_3270 <= resize(CONSTANT_2_3275, 4);
	-- codix_risc_ca.acdl:1206: rd_mem_rw.write(3)
	rd_mem_rw_STATEMENT_AST_3288 <= resize(CONSTANT_3_3293, 4);
	-- codix_risc_ca.acdl:1208: rd_mem_rw.write(4)
	rd_mem_rw_STATEMENT_AST_3306 <= resize(CONSTANT_4_3311, 4);
	-- codix_risc_ca.acdl:1210: rd_mem_rw.write(5)
	rd_mem_rw_STATEMENT_AST_3324 <= resize(CONSTANT_5_3329, 4);
	-- codix_risc_ca.acdl:1212: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_3342 <= resize(CONSTANT_0_3368, 4);
	-- codix_risc_ca.acdl:1216: rd_dest_en_mux.write(1)
	rd_dest_en_mux_STATEMENT_AST_3381 <= resize(CONSTANT_1_3253, 2);
	-- codix_risc_ca.acdl:1217: rd_cond.write(0)
	rd_cond_STATEMENT_AST_3396 <= resize(CONSTANT_0_3368, 5);
	-- codix_risc_ca.acdl:1218: rd_ie_flag.write(0)
	rd_ie_flag_STATEMENT_AST_3411 <= resize(CONSTANT_0_3368, 2);
	-- codix_risc_ca.acdl:1221: rd_amB.write(codasip_instance_main_0_instr_hw_s ...
	rd_amB_STATEMENT_AST_3426 <= unsigned(codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0);
	-- codix_risc_ca.acdl:1222: rd_amC.write(0)
	rd_amC_STATEMENT_AST_3441 <= CONSTANT_0_3368;
	-- codix_risc_ca.acdl:1224: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_3456 <= CONSTANT_0_3368;
	-- codix_risc_ca.acdl:1225: rd_aluB_mux.write(0)
	rd_aluB_mux_STATEMENT_AST_3471 <= resize(CONSTANT_0_3368, 3);
	rd_alu_op_WE0 <= CONSTANT_1_3253(0) when ((ACT = CONSTANT_1_3253(0))) else
		CONSTANT_0_3368(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_3224) when ((ACT = CONSTANT_1_3253(0))) else
		std_logic_vector(CONSTANT_0_3234);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_3239;
	rd_mem_rw_WE0 <= CONSTANT_1_3253(0) when (((ACT = CONSTANT_1_3253(0)) and (CONSTANT_325_3251 = codasip_tmp_var_1))) else 
		CONSTANT_1_3253(0) when (((ACT = CONSTANT_1_3253(0)) and (CONSTANT_326_3273 = codasip_tmp_var_1))) else 
		CONSTANT_1_3253(0) when (((ACT = CONSTANT_1_3253(0)) and (CONSTANT_327_3291 = codasip_tmp_var_1))) else 
		CONSTANT_1_3253(0) when (((ACT = CONSTANT_1_3253(0)) and (CONSTANT_328_3309 = codasip_tmp_var_1))) else 
		CONSTANT_1_3253(0) when (((ACT = CONSTANT_1_3253(0)) and (CONSTANT_329_3327 = codasip_tmp_var_1))) else 
		CONSTANT_1_3253(0) when (((ACT = CONSTANT_1_3253(0)) and ((((not((CONSTANT_325_3251 = codasip_tmp_var_1)) and not((CONSTANT_326_3273 = codasip_tmp_var_1))) and not((CONSTANT_327_3291 = codasip_tmp_var_1))) and not((CONSTANT_328_3309 = codasip_tmp_var_1))) and not((CONSTANT_329_3327 = codasip_tmp_var_1))))) else
		CONSTANT_0_3368(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_3248) when (((ACT = CONSTANT_1_3253(0)) and (CONSTANT_325_3251 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_3270) when (((ACT = CONSTANT_1_3253(0)) and (CONSTANT_326_3273 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_3288) when (((ACT = CONSTANT_1_3253(0)) and (CONSTANT_327_3291 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_3306) when (((ACT = CONSTANT_1_3253(0)) and (CONSTANT_328_3309 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_3324) when (((ACT = CONSTANT_1_3253(0)) and (CONSTANT_329_3327 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_3342) when (((ACT = CONSTANT_1_3253(0)) and ((((not((CONSTANT_325_3251 = codasip_tmp_var_1)) and not((CONSTANT_326_3273 = codasip_tmp_var_1))) and not((CONSTANT_327_3291 = codasip_tmp_var_1))) and not((CONSTANT_328_3309 = codasip_tmp_var_1))) and not((CONSTANT_329_3327 = codasip_tmp_var_1))))) else
		std_logic_vector(CONSTANT_0_3263);
	rd_dest_en_mux_WE0 <= CONSTANT_1_3253(0) when ((ACT = CONSTANT_1_3253(0))) else
		CONSTANT_0_3368(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_3381) when ((ACT = CONSTANT_1_3253(0))) else
		std_logic_vector(CONSTANT_0_3391);
	rd_cond_WE0 <= CONSTANT_1_3253(0) when ((ACT = CONSTANT_1_3253(0))) else
		CONSTANT_0_3368(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_3396) when ((ACT = CONSTANT_1_3253(0))) else
		std_logic_vector(CONSTANT_0_3406);
	rd_ie_flag_WE0 <= CONSTANT_1_3253(0) when ((ACT = CONSTANT_1_3253(0))) else
		CONSTANT_0_3368(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_3411) when ((ACT = CONSTANT_1_3253(0))) else
		std_logic_vector(CONSTANT_0_3391);
	rd_amB_WE0 <= CONSTANT_1_3253(0) when ((ACT = CONSTANT_1_3253(0))) else
		CONSTANT_0_3368(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_3426) when ((ACT = CONSTANT_1_3253(0))) else
		std_logic_vector(CONSTANT_0_3436);
	rd_amC_WE0 <= CONSTANT_1_3253(0) when ((ACT = CONSTANT_1_3253(0))) else
		CONSTANT_0_3368(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_3441(0) when ((ACT = CONSTANT_1_3253(0))) else
		CONSTANT_0_3368(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_3253(0) when ((ACT = CONSTANT_1_3253(0))) else
		CONSTANT_0_3368(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_3456(0) when ((ACT = CONSTANT_1_3253(0))) else
		CONSTANT_0_3368(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_3253(0) when ((ACT = CONSTANT_1_3253(0))) else
		CONSTANT_0_3368(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_3471) when ((ACT = CONSTANT_1_3253(0))) else
		std_logic_vector(CONSTANT_0_3436);

end architecture RTL;


