--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_instr_hw_operation_opr_st_reg_0_Q0 : in std_logic_vector(8 downto 0);
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
end entity codix_risc_ca_core_main_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_instr_hw_st_reg_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(8 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_7213 : unsigned(5 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_7228 : unsigned(8 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_7237 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_7259 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_7277 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_7295 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_7324 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_7339 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_7354 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_7369 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_7384 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_7399 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_7414 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_7311: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_7334: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_7379: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_7252: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_7349: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_7223: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_7219: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_10_7282: unsigned(3 downto 0) := to_unsigned(10, 4);
	constant CONSTANT_21_7215: unsigned(4 downto 0) := to_unsigned(21, 5);
	constant CONSTANT_330_7240: unsigned(8 downto 0) := to_unsigned(330, 9);
	constant CONSTANT_331_7262: unsigned(8 downto 0) := to_unsigned(331, 9);
	constant CONSTANT_332_7280: unsigned(8 downto 0) := to_unsigned(332, 9);
	constant CONSTANT_8_7242: unsigned(3 downto 0) := to_unsigned(8, 4);
	constant CONSTANT_9_7264: unsigned(3 downto 0) := to_unsigned(9, 4);

begin
	-- child instances inside 'main_instr_hw_st_reg_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1240: rd_alu_op.write(21)
	rd_alu_op_STATEMENT_AST_7213 <= resize(CONSTANT_21_7215, 6);
	-- codix_risc_ca.acdl:1252: codasip_tmp_var_1=codasip_instance_main_instr_h ...
	codasip_tmp_var_1_STATEMENT_AST_7228 <= unsigned(codasip_instance_main_instr_hw_operation_opr_st_reg_0_Q0);
	-- codix_risc_ca.acdl:1244: rd_mem_rw.write(8)
	rd_mem_rw_STATEMENT_AST_7237 <= CONSTANT_8_7242;
	-- codix_risc_ca.acdl:1246: rd_mem_rw.write(9)
	rd_mem_rw_STATEMENT_AST_7259 <= CONSTANT_9_7264;
	-- codix_risc_ca.acdl:1248: rd_mem_rw.write(10)
	rd_mem_rw_STATEMENT_AST_7277 <= CONSTANT_10_7282;
	-- codix_risc_ca.acdl:1250: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_7295 <= resize(CONSTANT_0_7311, 4);
	-- codix_risc_ca.acdl:1254: rd_dest_en_mux.write(0)
	rd_dest_en_mux_STATEMENT_AST_7324 <= resize(CONSTANT_0_7311, 2);
	-- codix_risc_ca.acdl:1255: rd_cond.write(0)
	rd_cond_STATEMENT_AST_7339 <= resize(CONSTANT_0_7311, 5);
	-- codix_risc_ca.acdl:1256: rd_ie_flag.write(0)
	rd_ie_flag_STATEMENT_AST_7354 <= resize(CONSTANT_0_7311, 2);
	-- codix_risc_ca.acdl:1259: rd_amB.write(codasip_instance_main_instr_hw_src ...
	rd_amB_STATEMENT_AST_7369 <= unsigned(codasip_instance_main_instr_hw_srcB_am_imm3_0_Q0);
	-- codix_risc_ca.acdl:1260: rd_amC.write(0)
	rd_amC_STATEMENT_AST_7384 <= CONSTANT_0_7311;
	-- codix_risc_ca.acdl:1262: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_7399 <= CONSTANT_0_7311;
	-- codix_risc_ca.acdl:1263: rd_aluB_mux.write(0)
	rd_aluB_mux_STATEMENT_AST_7414 <= resize(CONSTANT_0_7311, 3);
	rd_alu_op_WE0 <= CONSTANT_1_7219(0) when ((ACT = CONSTANT_1_7219(0))) else
		CONSTANT_0_7311(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_7213) when ((ACT = CONSTANT_1_7219(0))) else
		std_logic_vector(CONSTANT_0_7223);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_7228;
	rd_mem_rw_WE0 <= CONSTANT_1_7219(0) when (((ACT = CONSTANT_1_7219(0)) and (CONSTANT_330_7240 = codasip_tmp_var_1))) else 
		CONSTANT_1_7219(0) when (((ACT = CONSTANT_1_7219(0)) and (CONSTANT_331_7262 = codasip_tmp_var_1))) else 
		CONSTANT_1_7219(0) when (((ACT = CONSTANT_1_7219(0)) and (CONSTANT_332_7280 = codasip_tmp_var_1))) else 
		CONSTANT_1_7219(0) when (((ACT = CONSTANT_1_7219(0)) and ((not((CONSTANT_330_7240 = codasip_tmp_var_1)) and not((CONSTANT_331_7262 = codasip_tmp_var_1))) and not((CONSTANT_332_7280 = codasip_tmp_var_1))))) else
		CONSTANT_0_7311(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_7237) when (((ACT = CONSTANT_1_7219(0)) and (CONSTANT_330_7240 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_7259) when (((ACT = CONSTANT_1_7219(0)) and (CONSTANT_331_7262 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_7277) when (((ACT = CONSTANT_1_7219(0)) and (CONSTANT_332_7280 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_mem_rw_STATEMENT_AST_7295) when (((ACT = CONSTANT_1_7219(0)) and ((not((CONSTANT_330_7240 = codasip_tmp_var_1)) and not((CONSTANT_331_7262 = codasip_tmp_var_1))) and not((CONSTANT_332_7280 = codasip_tmp_var_1))))) else
		std_logic_vector(CONSTANT_0_7252);
	rd_dest_en_mux_WE0 <= CONSTANT_1_7219(0) when ((ACT = CONSTANT_1_7219(0))) else
		CONSTANT_0_7311(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_7324) when ((ACT = CONSTANT_1_7219(0))) else
		std_logic_vector(CONSTANT_0_7334);
	rd_cond_WE0 <= CONSTANT_1_7219(0) when ((ACT = CONSTANT_1_7219(0))) else
		CONSTANT_0_7311(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_7339) when ((ACT = CONSTANT_1_7219(0))) else
		std_logic_vector(CONSTANT_0_7349);
	rd_ie_flag_WE0 <= CONSTANT_1_7219(0) when ((ACT = CONSTANT_1_7219(0))) else
		CONSTANT_0_7311(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_7354) when ((ACT = CONSTANT_1_7219(0))) else
		std_logic_vector(CONSTANT_0_7334);
	rd_amB_WE0 <= CONSTANT_1_7219(0) when ((ACT = CONSTANT_1_7219(0))) else
		CONSTANT_0_7311(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_7369) when ((ACT = CONSTANT_1_7219(0))) else
		std_logic_vector(CONSTANT_0_7379);
	rd_amC_WE0 <= CONSTANT_1_7219(0) when ((ACT = CONSTANT_1_7219(0))) else
		CONSTANT_0_7311(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_7384(0) when ((ACT = CONSTANT_1_7219(0))) else
		CONSTANT_0_7311(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_7219(0) when ((ACT = CONSTANT_1_7219(0))) else
		CONSTANT_0_7311(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_7399(0) when ((ACT = CONSTANT_1_7219(0))) else
		CONSTANT_0_7311(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_7219(0) when ((ACT = CONSTANT_1_7219(0))) else
		CONSTANT_0_7311(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_7414) when ((ACT = CONSTANT_1_7219(0))) else
		std_logic_vector(CONSTANT_0_7379);

end architecture RTL;


