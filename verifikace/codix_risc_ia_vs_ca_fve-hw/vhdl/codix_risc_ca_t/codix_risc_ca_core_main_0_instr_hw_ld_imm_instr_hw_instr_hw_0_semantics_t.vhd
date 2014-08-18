--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_Q0 : in std_logic_vector(4 downto 0);
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
end entity codix_risc_ca_core_main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2962 : unsigned(5 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_2977 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_2986 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_3008 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_3026 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_3044 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_3062 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_3080 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_3119 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_3134 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_3149 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_3164 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_3179 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_3194 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_3209 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_3106: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_3129: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_3174: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_3001: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_3144: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_2972: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_2991: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_2_3013: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_20_2964: unsigned(4 downto 0) := to_unsigned(20, 5);
	constant CONSTANT_21_2989: unsigned(4 downto 0) := to_unsigned(21, 5);
	constant CONSTANT_22_3011: unsigned(4 downto 0) := to_unsigned(22, 5);
	constant CONSTANT_23_3029: unsigned(4 downto 0) := to_unsigned(23, 5);
	constant CONSTANT_24_3047: unsigned(4 downto 0) := to_unsigned(24, 5);
	constant CONSTANT_25_3065: unsigned(4 downto 0) := to_unsigned(25, 5);
	constant CONSTANT_3_3031: unsigned(1 downto 0) := to_unsigned(3, 2);
	constant CONSTANT_4_3049: unsigned(2 downto 0) := to_unsigned(4, 3);
	constant CONSTANT_5_3067: unsigned(2 downto 0) := to_unsigned(5, 3);

begin
	-- child instances inside 'main_0_instr_hw_ld_imm_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1117: rd_alu_op.write(20)
	rd_alu_op_STATEMENT_AST_2962 <= resize(CONSTANT_20_2964, 6);
	-- codix_risc_ca.acdl:1133: codasip_tmp_var_1=codasip_instance_main_0_instr ...
	codasip_tmp_var_1_STATEMENT_AST_2977 <= unsigned(codasip_instance_main_0_instr_hw_operation_opr_ld_imm_0_Q0);
	-- codix_risc_ca.acdl:1121: rd_mem_rw.write(1)
	rd_mem_rw_STATEMENT_AST_2986 <= resize(CONSTANT_1_2991, 4);
	-- codix_risc_ca.acdl:1123: rd_mem_rw.write(2)
	rd_mem_rw_STATEMENT_AST_3008 <= resize(CONSTANT_2_3013, 4);
	-- codix_risc_ca.acdl:1125: rd_mem_rw.write(3)
	rd_mem_rw_STATEMENT_AST_3026 <= resize(CONSTANT_3_3031, 4);
	-- codix_risc_ca.acdl:1127: rd_mem_rw.write(4)
	rd_mem_rw_STATEMENT_AST_3044 <= resize(CONSTANT_4_3049, 4);
	-- codix_risc_ca.acdl:1129: rd_mem_rw.write(5)
	rd_mem_rw_STATEMENT_AST_3062 <= resize(CONSTANT_5_3067, 4);
	-- codix_risc_ca.acdl:1131: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_3080 <= resize(CONSTANT_0_3106, 4);
	-- codix_risc_ca.acdl:1135: rd_dest_en_mux.write(1)
	rd_dest_en_mux_STATEMENT_AST_3119 <= resize(CONSTANT_1_2991, 2);
	-- codix_risc_ca.acdl:1136: rd_cond.write(0)
	rd_cond_STATEMENT_AST_3134 <= resize(CONSTANT_0_3106, 5);
	-- codix_risc_ca.acdl:1137: rd_ie_flag.write(0)
	rd_ie_flag_STATEMENT_AST_3149 <= resize(CONSTANT_0_3106, 2);
	-- codix_risc_ca.acdl:1140: rd_amB.write(0)
	rd_amB_STATEMENT_AST_3164 <= resize(CONSTANT_0_3106, 3);
	-- codix_risc_ca.acdl:1141: rd_amC.write(0)
	rd_amC_STATEMENT_AST_3179 <= CONSTANT_0_3106;
	-- codix_risc_ca.acdl:1143: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_3194 <= CONSTANT_0_3106;
	-- codix_risc_ca.acdl:1144: rd_aluB_mux.write(2)
	rd_aluB_mux_STATEMENT_AST_3209 <= resize(CONSTANT_2_3013, 3);
	rd_alu_op_WE0 <= CONSTANT_1_2991(0) when ((ACT = CONSTANT_1_2991(0))) else
		CONSTANT_0_3106(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_2962) when ((ACT = CONSTANT_1_2991(0))) else
		std_logic_vector(CONSTANT_0_2972);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_2977;
	rd_mem_rw_WE0 <= CONSTANT_1_2991(0) when (((ACT = CONSTANT_1_2991(0)) and (CONSTANT_21_2989 = codasip_tmp_var_1))) else 
		CONSTANT_1_2991(0) when (((ACT = CONSTANT_1_2991(0)) and (CONSTANT_22_3011 = codasip_tmp_var_1))) else 
		CONSTANT_1_2991(0) when (((ACT = CONSTANT_1_2991(0)) and (CONSTANT_23_3029 = codasip_tmp_var_1))) else 
		CONSTANT_1_2991(0) when (((ACT = CONSTANT_1_2991(0)) and (CONSTANT_24_3047 = codasip_tmp_var_1))) else 
		CONSTANT_1_2991(0) when (((ACT = CONSTANT_1_2991(0)) and (CONSTANT_25_3065 = codasip_tmp_var_1))) else 
		CONSTANT_1_2991(0) when (((ACT = CONSTANT_1_2991(0)) and ((((not((CONSTANT_21_2989 = codasip_tmp_var_1)) and not((CONSTANT_22_3011 = codasip_tmp_var_1))) and not((CONSTANT_23_3029 = codasip_tmp_var_1))) and not((CONSTANT_24_3047 = codasip_tmp_var_1))) and not((CONSTANT_25_3065 = codasip_tmp_var_1))))) else
		CONSTANT_0_3106(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_2986) when (((ACT = CONSTANT_1_2991(0)) and (CONSTANT_21_2989 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_3008) when (((ACT = CONSTANT_1_2991(0)) and (CONSTANT_22_3011 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_3026) when (((ACT = CONSTANT_1_2991(0)) and (CONSTANT_23_3029 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_3044) when (((ACT = CONSTANT_1_2991(0)) and (CONSTANT_24_3047 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_3062) when (((ACT = CONSTANT_1_2991(0)) and (CONSTANT_25_3065 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_3080) when (((ACT = CONSTANT_1_2991(0)) and ((((not((CONSTANT_21_2989 = codasip_tmp_var_1)) and not((CONSTANT_22_3011 = codasip_tmp_var_1))) and not((CONSTANT_23_3029 = codasip_tmp_var_1))) and not((CONSTANT_24_3047 = codasip_tmp_var_1))) and not((CONSTANT_25_3065 = codasip_tmp_var_1))))) else
		std_logic_vector(CONSTANT_0_3001);
	rd_dest_en_mux_WE0 <= CONSTANT_1_2991(0) when ((ACT = CONSTANT_1_2991(0))) else
		CONSTANT_0_3106(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_3119) when ((ACT = CONSTANT_1_2991(0))) else
		std_logic_vector(CONSTANT_0_3129);
	rd_cond_WE0 <= CONSTANT_1_2991(0) when ((ACT = CONSTANT_1_2991(0))) else
		CONSTANT_0_3106(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_3134) when ((ACT = CONSTANT_1_2991(0))) else
		std_logic_vector(CONSTANT_0_3144);
	rd_ie_flag_WE0 <= CONSTANT_1_2991(0) when ((ACT = CONSTANT_1_2991(0))) else
		CONSTANT_0_3106(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_3149) when ((ACT = CONSTANT_1_2991(0))) else
		std_logic_vector(CONSTANT_0_3129);
	rd_amB_WE0 <= CONSTANT_1_2991(0) when ((ACT = CONSTANT_1_2991(0))) else
		CONSTANT_0_3106(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_3164) when ((ACT = CONSTANT_1_2991(0))) else
		std_logic_vector(CONSTANT_0_3174);
	rd_amC_WE0 <= CONSTANT_1_2991(0) when ((ACT = CONSTANT_1_2991(0))) else
		CONSTANT_0_3106(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_3179(0) when ((ACT = CONSTANT_1_2991(0))) else
		CONSTANT_0_3106(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_2991(0) when ((ACT = CONSTANT_1_2991(0))) else
		CONSTANT_0_3106(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_3194(0) when ((ACT = CONSTANT_1_2991(0))) else
		CONSTANT_0_3106(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_2991(0) when ((ACT = CONSTANT_1_2991(0))) else
		CONSTANT_0_3106(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_3209) when ((ACT = CONSTANT_1_2991(0))) else
		std_logic_vector(CONSTANT_0_3174);

end architecture RTL;


