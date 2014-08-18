--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_id_id_controller_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_id_id_controller_semantics_t is
	port (
		ACT : in std_logic;
		ex_alu_op_Q0 : in std_logic_vector(5 downto 0);
		ex_clear_D0 : out std_logic;
		ex_ie_flag_Q0 : in std_logic_vector(1 downto 0);
		ex_stall_Q0 : in std_logic;
		i_mem_fr_stall_D0 : out std_logic;
		ibus_IFCMD0 : out std_logic_vector(2 downto 0);
		ibus_IFRESP0 : in std_logic_vector(2 downto 0);
		ibus_Q0 : in std_logic_vector(31 downto 0);
		id_clear_D0 : out std_logic;
		id_clear_reg_Q0 : in std_logic;
		id_instr_D0 : out std_logic_vector(11 downto 0);
		id_pc_Q0 : in std_logic_vector(31 downto 0);
		id_stall_D0 : out std_logic;
		int_enabled_Q0 : in std_logic;
		irq_Q0 : in std_logic;
		port_error_D0 : out std_logic_vector(31 downto 0);
		rd_alu_op_Q0 : in std_logic_vector(5 downto 0);
		rd_clear_D0 : out std_logic;
		rd_ie_flag_Q0 : in std_logic_vector(1 downto 0);
		rd_mem_D0 : out std_logic_vector(31 downto 0);
		rd_mem_WE0 : out std_logic;
		rd_pc_D0 : out std_logic_vector(31 downto 0);
		rd_pc_WE0 : out std_logic;
		rd_stall_D0 : out std_logic;
		rd_stall_Q0 : in std_logic;
		wb_pc_we_Q0 : in std_logic	);
end entity codix_risc_ca_core_main_id_id_controller_semantics_t;

architecture RTL of codix_risc_ca_core_main_id_id_controller_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_irq_ready : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_2_id_finish_rc : signed(31 downto 0);
	-- signal (inner)
	signal lv_bb_3_id_mem : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_4_code : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_5_irq_code : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_6_irq_mux : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_irq_ready_STATEMENT_AST_4226 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_5_irq_code_STATEMENT_AST_4253 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_6_irq_mux_STATEMENT_AST_4262 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_3_id_mem_STATEMENT_ifinish_4277 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_2_id_finish_rc_STATEMENT_AST_4275 : signed(31 downto 0);
	-- signal (inner)
	signal i_mem_fr_stall_STATEMENT_AST_4299 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_4313 : unsigned(0 downto 0);
	-- signal (inner)
	signal port_error_STATEMENT_AST_4328 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_4_code_STATEMENT_AST_4343 : unsigned(31 downto 0);
	-- signal (inner)
	signal id_instr_STATEMENT_AST_4364 : unsigned(11 downto 0);
	-- signal (inner)
	signal rd_mem_STATEMENT_AST_4377 : unsigned(31 downto 0);
	-- signal (inner)
	signal rd_pc_STATEMENT_AST_4392 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_clear_STATEMENT_AST_4407 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_stall_STATEMENT_AST_4416 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_clear_STATEMENT_AST_4425 : unsigned(0 downto 0);
	-- signal (inner)
	signal id_stall_STATEMENT_AST_4434 : unsigned(0 downto 0);
	-- signal (inner)
	signal id_clear_STATEMENT_AST_4443 : unsigned(0 downto 0);

		-- datapath signals and constants
	signal TERNARY_4349: unsigned(31 downto 0);
	constant CONSTANT_0_4303: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_4281: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_4336: unsigned(31 downto 0) := to_unsigned(0, 32);
	constant CONSTANT_1_4306: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_2_4238: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_20_4369: unsigned(4 downto 0) := to_unsigned(20, 5);
	constant CONSTANT_29_4245: unsigned(4 downto 0) := to_unsigned(29, 5);
	constant CONSTANT_32_4334: unsigned(5 downto 0) := to_unsigned(32, 6);
	constant CONSTANT_4095_4367: unsigned(11 downto 0) := to_unsigned(4095, 12);
	constant CONSTANT_805306400_4255: unsigned(29 downto 0) := to_unsigned(805306400, 30);

begin
	-- child instances inside 'main_id_id_controller_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1609: lv_bb_1_irq_ready=!((rd_alu_op.read()==29)||(ex ...
	lv_bb_1_irq_ready_STATEMENT_AST_4226 <= "1" when ((not(((((unsigned(rd_alu_op_Q0) = CONSTANT_29_4245) or (unsigned(ex_alu_op_Q0) = CONSTANT_29_4245)) or (unsigned(rd_ie_flag_Q0) = CONSTANT_2_4238)) or (unsigned(ex_ie_flag_Q0) = CONSTANT_2_4238))) and not((id_clear_reg_Q0 /= '0')))) else "0";
	-- codix_risc_ca.acdl:1611: lv_bb_5_irq_code=805306400
	lv_bb_5_irq_code_STATEMENT_AST_4253 <= resize(CONSTANT_805306400_4255, 32);
	-- codix_risc_ca.acdl:1612: lv_bb_6_irq_mux=irq.read()&&int_enabled.read()& ...
	lv_bb_6_irq_mux_STATEMENT_AST_4262 <= "1" when ((((irq_Q0 /= '0') and (int_enabled_Q0 /= '0')) and (lv_bb_1_irq_ready /= 0))) else "0";
	-- codix_risc_ca.acdl:1615: lv_bb_2_id_finish_rc=ibus.ifinish(1, lv_bb_3_id ...
	lv_bb_2_id_finish_rc_STATEMENT_AST_4275 <= signed(resize(unsigned(ibus_IFRESP0), 32));
	lv_bb_3_id_mem_STATEMENT_ifinish_4277 <= unsigned(ibus_Q0);
	-- codix_risc_ca.acdl:1619: i_mem_fr_stall.write((lv_bb_2_id_finish_rc==0)  ...
	i_mem_fr_stall_STATEMENT_AST_4299 <= 
		CONSTANT_1_4306 when ((lv_bb_2_id_finish_rc = signed(resize(CONSTANT_0_4303, 2)))) else
		CONSTANT_0_4303;
	-- codix_risc_ca.acdl:1630: codasip_tmp_var_1=((lv_bb_2_id_finish_rc!=1)&&( ...
	codasip_tmp_var_1_STATEMENT_AST_4313 <= "1" when (((lv_bb_2_id_finish_rc /= signed(resize(CONSTANT_1_4306, 2))) and (lv_bb_2_id_finish_rc /= signed(resize(CONSTANT_0_4303, 2))))) else "0";
	-- codix_risc_ca.acdl:1622: port_error.write(32|((codasip::codasip_int<4, f ...
	port_error_STATEMENT_AST_4328 <= resize((CONSTANT_32_4334 or resize(unsigned(resize(lv_bb_2_id_finish_rc, 32)(3 downto 0)), 6)), 32);
	TERNARY_4349 <=
		lv_bb_5_irq_code when ((lv_bb_6_irq_mux /= 0)) else
		lv_bb_3_id_mem when ((lv_bb_2_id_finish_rc = signed(resize(CONSTANT_1_4306, 2)))) else
		resize(CONSTANT_0_4303, 32);
	-- codix_risc_ca.acdl:1630: lv_bb_4_code=(!id_clear_reg.read()) ? (unsigned ...
	lv_bb_4_code_STATEMENT_AST_4343 <= 
		TERNARY_4349 when (not((id_clear_reg_Q0 /= '0'))) else
		resize(CONSTANT_0_4303, 32);
	-- codix_risc_ca.acdl:1657: id_instr.write((lv_bb_4_code>>20)&4095)
	id_instr_STATEMENT_AST_4364 <= (resize(shift_right(lv_bb_4_code, to_integer(CONSTANT_20_4369)), 12) and CONSTANT_4095_4367);
	-- codix_risc_ca.acdl:1660: rd_mem.write(lv_bb_4_code)
	rd_mem_STATEMENT_AST_4377 <= lv_bb_4_code;
	-- codix_risc_ca.acdl:1661: rd_pc.write(id_pc.read())
	rd_pc_STATEMENT_AST_4392 <= unsigned(id_pc_Q0);
	-- codix_risc_ca.acdl:1666: ex_clear.write(wb_pc_we.read())
	ex_clear_STATEMENT_AST_4407(0) <= wb_pc_we_Q0;
	-- codix_risc_ca.acdl:1669: rd_stall.write(ex_stall.read())
	rd_stall_STATEMENT_AST_4416(0) <= ex_stall_Q0;
	-- codix_risc_ca.acdl:1670: rd_clear.write(wb_pc_we.read())
	rd_clear_STATEMENT_AST_4425(0) <= wb_pc_we_Q0;
	-- codix_risc_ca.acdl:1673: id_stall.write(rd_stall.read())
	id_stall_STATEMENT_AST_4434(0) <= rd_stall_Q0;
	-- codix_risc_ca.acdl:1674: id_clear.write(wb_pc_we.read())
	id_clear_STATEMENT_AST_4443(0) <= wb_pc_we_Q0;
	lv_bb_1_irq_ready <= lv_bb_1_irq_ready_STATEMENT_AST_4226;
	lv_bb_5_irq_code <= lv_bb_5_irq_code_STATEMENT_AST_4253;
	lv_bb_6_irq_mux <= lv_bb_6_irq_mux_STATEMENT_AST_4262;
	ibus_IFCMD0 <= std_logic_vector(resize(CONSTANT_1_4306, 3)) when ((ACT = CONSTANT_1_4306(0))) else
		std_logic_vector(CONSTANT_0_4281);
	lv_bb_3_id_mem <= lv_bb_3_id_mem_STATEMENT_ifinish_4277;
	lv_bb_2_id_finish_rc <= lv_bb_2_id_finish_rc_STATEMENT_AST_4275;
	i_mem_fr_stall_D0 <= i_mem_fr_stall_STATEMENT_AST_4299(0);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_4313;
	port_error_D0 <= std_logic_vector(port_error_STATEMENT_AST_4328) when (((ACT = CONSTANT_1_4306(0)) and (codasip_tmp_var_1 /= 0))) else
		std_logic_vector(CONSTANT_0_4336);
	lv_bb_4_code <= lv_bb_4_code_STATEMENT_AST_4343;
	id_instr_D0 <= std_logic_vector(id_instr_STATEMENT_AST_4364);
	rd_mem_WE0 <= CONSTANT_1_4306(0) when ((ACT = CONSTANT_1_4306(0))) else
		CONSTANT_0_4303(0);
	rd_mem_D0 <= std_logic_vector(rd_mem_STATEMENT_AST_4377);
	rd_pc_WE0 <= CONSTANT_1_4306(0) when ((ACT = CONSTANT_1_4306(0))) else
		CONSTANT_0_4303(0);
	rd_pc_D0 <= std_logic_vector(rd_pc_STATEMENT_AST_4392);
	ex_clear_D0 <= ex_clear_STATEMENT_AST_4407(0);
	rd_stall_D0 <= rd_stall_STATEMENT_AST_4416(0);
	rd_clear_D0 <= rd_clear_STATEMENT_AST_4425(0);
	id_stall_D0 <= id_stall_STATEMENT_AST_4434(0);
	id_clear_D0 <= id_clear_STATEMENT_AST_4443(0);

end architecture RTL;


