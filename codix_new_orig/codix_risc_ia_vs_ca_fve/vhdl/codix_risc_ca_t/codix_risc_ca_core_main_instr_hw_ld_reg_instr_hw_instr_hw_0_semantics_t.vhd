--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_instr_hw_operation_opr_ld_reg_0_Q0 : in std_logic_vector(8 downto 0);
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
end entity codix_risc_ca_core_main_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(8 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_6396 : unsigned(5 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_6411 : unsigned(8 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_6420 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_6442 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_6460 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_6478 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_6496 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_6514 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_6553 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_6568 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_6583 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_6598 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_6613 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_6628 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_6643 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_6540: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_6563: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_6608: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_6435: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_6578: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_6406: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_6425: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_2_6447: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_20_6398: unsigned(4 downto 0) := to_unsigned(20, 5);
	constant CONSTANT_3_6483: unsigned(1 downto 0) := to_unsigned(3, 2);
	constant CONSTANT_325_6423: unsigned(8 downto 0) := to_unsigned(325, 9);
	constant CONSTANT_326_6445: unsigned(8 downto 0) := to_unsigned(326, 9);
	constant CONSTANT_327_6481: unsigned(8 downto 0) := to_unsigned(327, 9);
	constant CONSTANT_328_6463: unsigned(8 downto 0) := to_unsigned(328, 9);
	constant CONSTANT_329_6499: unsigned(8 downto 0) := to_unsigned(329, 9);
	constant CONSTANT_4_6465: unsigned(2 downto 0) := to_unsigned(4, 3);
	constant CONSTANT_5_6501: unsigned(2 downto 0) := to_unsigned(5, 3);

begin
	-- child instances inside 'main_instr_hw_ld_reg_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1198: rd_alu_op.write(20)
	rd_alu_op_STATEMENT_AST_6396 <= resize(CONSTANT_20_6398, 6);
	-- codix_risc_ca.acdl:1214: codasip_tmp_var_1=codasip_instance_main_instr_h ...
	codasip_tmp_var_1_STATEMENT_AST_6411 <= unsigned(codasip_instance_main_instr_hw_operation_opr_ld_reg_0_Q0);
	-- codix_risc_ca.acdl:1202: rd_mem_rw.write(1)
	rd_mem_rw_STATEMENT_AST_6420 <= resize(CONSTANT_1_6425, 4);
	-- codix_risc_ca.acdl:1204: rd_mem_rw.write(2)
	rd_mem_rw_STATEMENT_AST_6442 <= resize(CONSTANT_2_6447, 4);
	-- codix_risc_ca.acdl:1208: rd_mem_rw.write(4)
	rd_mem_rw_STATEMENT_AST_6460 <= resize(CONSTANT_4_6465, 4);
	-- codix_risc_ca.acdl:1206: rd_mem_rw.write(3)
	rd_mem_rw_STATEMENT_AST_6478 <= resize(CONSTANT_3_6483, 4);
	-- codix_risc_ca.acdl:1210: rd_mem_rw.write(5)
	rd_mem_rw_STATEMENT_AST_6496 <= resize(CONSTANT_5_6501, 4);
	-- codix_risc_ca.acdl:1212: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_6514 <= resize(CONSTANT_0_6540, 4);
	-- codix_risc_ca.acdl:1216: rd_dest_en_mux.write(1)
	rd_dest_en_mux_STATEMENT_AST_6553 <= resize(CONSTANT_1_6425, 2);
	-- codix_risc_ca.acdl:1217: rd_cond.write(0)
	rd_cond_STATEMENT_AST_6568 <= resize(CONSTANT_0_6540, 5);
	-- codix_risc_ca.acdl:1218: rd_ie_flag.write(0)
	rd_ie_flag_STATEMENT_AST_6583 <= resize(CONSTANT_0_6540, 2);
	-- codix_risc_ca.acdl:1221: rd_amB.write(codasip_instance_main_instr_hw_src ...
	rd_amB_STATEMENT_AST_6598 <= unsigned(codasip_instance_main_instr_hw_srcB_am_imm3_0_Q0);
	-- codix_risc_ca.acdl:1222: rd_amC.write(0)
	rd_amC_STATEMENT_AST_6613 <= CONSTANT_0_6540;
	-- codix_risc_ca.acdl:1224: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_6628 <= CONSTANT_0_6540;
	-- codix_risc_ca.acdl:1225: rd_aluB_mux.write(0)
	rd_aluB_mux_STATEMENT_AST_6643 <= resize(CONSTANT_0_6540, 3);
	rd_alu_op_WE0 <= CONSTANT_1_6425(0) when ((ACT = CONSTANT_1_6425(0))) else
		CONSTANT_0_6540(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_6396) when ((ACT = CONSTANT_1_6425(0))) else
		std_logic_vector(CONSTANT_0_6406);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_6411;
	rd_mem_rw_WE0 <= CONSTANT_1_6425(0) when (((ACT = CONSTANT_1_6425(0)) and (CONSTANT_325_6423 = codasip_tmp_var_1))) else 
		CONSTANT_1_6425(0) when (((ACT = CONSTANT_1_6425(0)) and (CONSTANT_326_6445 = codasip_tmp_var_1))) else 
		CONSTANT_1_6425(0) when (((ACT = CONSTANT_1_6425(0)) and (CONSTANT_328_6463 = codasip_tmp_var_1))) else 
		CONSTANT_1_6425(0) when (((ACT = CONSTANT_1_6425(0)) and (CONSTANT_327_6481 = codasip_tmp_var_1))) else 
		CONSTANT_1_6425(0) when (((ACT = CONSTANT_1_6425(0)) and (CONSTANT_329_6499 = codasip_tmp_var_1))) else 
		CONSTANT_1_6425(0) when (((ACT = CONSTANT_1_6425(0)) and ((((not((CONSTANT_325_6423 = codasip_tmp_var_1)) and not((CONSTANT_326_6445 = codasip_tmp_var_1))) and not((CONSTANT_327_6481 = codasip_tmp_var_1))) and not((CONSTANT_328_6463 = codasip_tmp_var_1))) and not((CONSTANT_329_6499 = codasip_tmp_var_1))))) else
		CONSTANT_0_6540(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_6420) when (((ACT = CONSTANT_1_6425(0)) and (CONSTANT_325_6423 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_6442) when (((ACT = CONSTANT_1_6425(0)) and (CONSTANT_326_6445 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_6460) when (((ACT = CONSTANT_1_6425(0)) and (CONSTANT_328_6463 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_6478) when (((ACT = CONSTANT_1_6425(0)) and (CONSTANT_327_6481 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_6496) when (((ACT = CONSTANT_1_6425(0)) and (CONSTANT_329_6499 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_6514) when (((ACT = CONSTANT_1_6425(0)) and ((((not((CONSTANT_325_6423 = codasip_tmp_var_1)) and not((CONSTANT_326_6445 = codasip_tmp_var_1))) and not((CONSTANT_327_6481 = codasip_tmp_var_1))) and not((CONSTANT_328_6463 = codasip_tmp_var_1))) and not((CONSTANT_329_6499 = codasip_tmp_var_1))))) else
		std_logic_vector(CONSTANT_0_6435);
	rd_dest_en_mux_WE0 <= CONSTANT_1_6425(0) when ((ACT = CONSTANT_1_6425(0))) else
		CONSTANT_0_6540(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_6553) when ((ACT = CONSTANT_1_6425(0))) else
		std_logic_vector(CONSTANT_0_6563);
	rd_cond_WE0 <= CONSTANT_1_6425(0) when ((ACT = CONSTANT_1_6425(0))) else
		CONSTANT_0_6540(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_6568) when ((ACT = CONSTANT_1_6425(0))) else
		std_logic_vector(CONSTANT_0_6578);
	rd_ie_flag_WE0 <= CONSTANT_1_6425(0) when ((ACT = CONSTANT_1_6425(0))) else
		CONSTANT_0_6540(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_6583) when ((ACT = CONSTANT_1_6425(0))) else
		std_logic_vector(CONSTANT_0_6563);
	rd_amB_WE0 <= CONSTANT_1_6425(0) when ((ACT = CONSTANT_1_6425(0))) else
		CONSTANT_0_6540(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_6598) when ((ACT = CONSTANT_1_6425(0))) else
		std_logic_vector(CONSTANT_0_6608);
	rd_amC_WE0 <= CONSTANT_1_6425(0) when ((ACT = CONSTANT_1_6425(0))) else
		CONSTANT_0_6540(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_6613(0) when ((ACT = CONSTANT_1_6425(0))) else
		CONSTANT_0_6540(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_6425(0) when ((ACT = CONSTANT_1_6425(0))) else
		CONSTANT_0_6540(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_6628(0) when ((ACT = CONSTANT_1_6425(0))) else
		CONSTANT_0_6540(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_6425(0) when ((ACT = CONSTANT_1_6425(0))) else
		CONSTANT_0_6540(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_6643) when ((ACT = CONSTANT_1_6425(0))) else
		std_logic_vector(CONSTANT_0_6608);

end architecture RTL;


