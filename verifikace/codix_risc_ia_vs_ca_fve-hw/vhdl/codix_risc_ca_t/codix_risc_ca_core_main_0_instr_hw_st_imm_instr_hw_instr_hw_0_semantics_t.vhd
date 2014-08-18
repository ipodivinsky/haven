--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_Q0 : in std_logic_vector(4 downto 0);
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
end entity codix_risc_ca_core_main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_3825 : unsigned(5 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_3840 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_3849 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_3871 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_3889 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_3907 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_3936 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_3951 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_3966 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_3981 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_3996 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_4011 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_4026 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_3923: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_3946: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_3991: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_3864: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_3961: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_3835: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_3831: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_10_3894: unsigned(3 downto 0) := to_unsigned(10, 4);
	constant CONSTANT_21_3827: unsigned(4 downto 0) := to_unsigned(21, 5);
	constant CONSTANT_26_3852: unsigned(4 downto 0) := to_unsigned(26, 5);
	constant CONSTANT_27_3874: unsigned(4 downto 0) := to_unsigned(27, 5);
	constant CONSTANT_28_3892: unsigned(4 downto 0) := to_unsigned(28, 5);
	constant CONSTANT_5_4028: unsigned(2 downto 0) := to_unsigned(5, 3);
	constant CONSTANT_8_3854: unsigned(3 downto 0) := to_unsigned(8, 4);
	constant CONSTANT_9_3876: unsigned(3 downto 0) := to_unsigned(9, 4);

begin
	-- child instances inside 'main_0_instr_hw_st_imm_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1158: rd_alu_op.write(21)
	rd_alu_op_STATEMENT_AST_3825 <= resize(CONSTANT_21_3827, 6);
	-- codix_risc_ca.acdl:1170: codasip_tmp_var_1=codasip_instance_main_0_instr ...
	codasip_tmp_var_1_STATEMENT_AST_3840 <= unsigned(codasip_instance_main_0_instr_hw_operation_opr_st_imm_0_Q0);
	-- codix_risc_ca.acdl:1162: rd_mem_rw.write(8)
	rd_mem_rw_STATEMENT_AST_3849 <= CONSTANT_8_3854;
	-- codix_risc_ca.acdl:1164: rd_mem_rw.write(9)
	rd_mem_rw_STATEMENT_AST_3871 <= CONSTANT_9_3876;
	-- codix_risc_ca.acdl:1166: rd_mem_rw.write(10)
	rd_mem_rw_STATEMENT_AST_3889 <= CONSTANT_10_3894;
	-- codix_risc_ca.acdl:1168: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_3907 <= resize(CONSTANT_0_3923, 4);
	-- codix_risc_ca.acdl:1172: rd_dest_en_mux.write(0)
	rd_dest_en_mux_STATEMENT_AST_3936 <= resize(CONSTANT_0_3923, 2);
	-- codix_risc_ca.acdl:1173: rd_cond.write(0)
	rd_cond_STATEMENT_AST_3951 <= resize(CONSTANT_0_3923, 5);
	-- codix_risc_ca.acdl:1174: rd_ie_flag.write(0)
	rd_ie_flag_STATEMENT_AST_3966 <= resize(CONSTANT_0_3923, 2);
	-- codix_risc_ca.acdl:1177: rd_amB.write(0)
	rd_amB_STATEMENT_AST_3981 <= resize(CONSTANT_0_3923, 3);
	-- codix_risc_ca.acdl:1178: rd_amC.write(0)
	rd_amC_STATEMENT_AST_3996 <= CONSTANT_0_3923;
	-- codix_risc_ca.acdl:1180: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_4011 <= CONSTANT_0_3923;
	-- codix_risc_ca.acdl:1181: rd_aluB_mux.write(5)
	rd_aluB_mux_STATEMENT_AST_4026 <= CONSTANT_5_4028;
	rd_alu_op_WE0 <= CONSTANT_1_3831(0) when ((ACT = CONSTANT_1_3831(0))) else
		CONSTANT_0_3923(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_3825) when ((ACT = CONSTANT_1_3831(0))) else
		std_logic_vector(CONSTANT_0_3835);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_3840;
	rd_mem_rw_WE0 <= CONSTANT_1_3831(0) when (((ACT = CONSTANT_1_3831(0)) and (CONSTANT_26_3852 = codasip_tmp_var_1))) else 
		CONSTANT_1_3831(0) when (((ACT = CONSTANT_1_3831(0)) and (CONSTANT_27_3874 = codasip_tmp_var_1))) else 
		CONSTANT_1_3831(0) when (((ACT = CONSTANT_1_3831(0)) and (CONSTANT_28_3892 = codasip_tmp_var_1))) else 
		CONSTANT_1_3831(0) when (((ACT = CONSTANT_1_3831(0)) and ((not((CONSTANT_26_3852 = codasip_tmp_var_1)) and not((CONSTANT_27_3874 = codasip_tmp_var_1))) and not((CONSTANT_28_3892 = codasip_tmp_var_1))))) else
		CONSTANT_0_3923(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_3849) when (((ACT = CONSTANT_1_3831(0)) and (CONSTANT_26_3852 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_3871) when (((ACT = CONSTANT_1_3831(0)) and (CONSTANT_27_3874 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_3889) when (((ACT = CONSTANT_1_3831(0)) and (CONSTANT_28_3892 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_3907) when (((ACT = CONSTANT_1_3831(0)) and ((not((CONSTANT_26_3852 = codasip_tmp_var_1)) and not((CONSTANT_27_3874 = codasip_tmp_var_1))) and not((CONSTANT_28_3892 = codasip_tmp_var_1))))) else
		std_logic_vector(CONSTANT_0_3864);
	rd_dest_en_mux_WE0 <= CONSTANT_1_3831(0) when ((ACT = CONSTANT_1_3831(0))) else
		CONSTANT_0_3923(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_3936) when ((ACT = CONSTANT_1_3831(0))) else
		std_logic_vector(CONSTANT_0_3946);
	rd_cond_WE0 <= CONSTANT_1_3831(0) when ((ACT = CONSTANT_1_3831(0))) else
		CONSTANT_0_3923(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_3951) when ((ACT = CONSTANT_1_3831(0))) else
		std_logic_vector(CONSTANT_0_3961);
	rd_ie_flag_WE0 <= CONSTANT_1_3831(0) when ((ACT = CONSTANT_1_3831(0))) else
		CONSTANT_0_3923(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_3966) when ((ACT = CONSTANT_1_3831(0))) else
		std_logic_vector(CONSTANT_0_3946);
	rd_amB_WE0 <= CONSTANT_1_3831(0) when ((ACT = CONSTANT_1_3831(0))) else
		CONSTANT_0_3923(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_3981) when ((ACT = CONSTANT_1_3831(0))) else
		std_logic_vector(CONSTANT_0_3991);
	rd_amC_WE0 <= CONSTANT_1_3831(0) when ((ACT = CONSTANT_1_3831(0))) else
		CONSTANT_0_3923(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_3996(0) when ((ACT = CONSTANT_1_3831(0))) else
		CONSTANT_0_3923(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_3831(0) when ((ACT = CONSTANT_1_3831(0))) else
		CONSTANT_0_3923(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_4011(0) when ((ACT = CONSTANT_1_3831(0))) else
		CONSTANT_0_3923(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_3831(0) when ((ACT = CONSTANT_1_3831(0))) else
		CONSTANT_0_3923(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_4026) when ((ACT = CONSTANT_1_3831(0))) else
		std_logic_vector(CONSTANT_0_3991);

end architecture RTL;


