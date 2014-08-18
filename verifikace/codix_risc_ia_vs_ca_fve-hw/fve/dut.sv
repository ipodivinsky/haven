/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Contains interconnection between design under test in HDL and SystemVerilog environment.
 */

// Module declaration
module DUT( input logic CLK, input logic RST );
/*
	// Instantiate DUT interface
	icodix_risc_platform_ca codix_risc_platform_ca_if( CLK, RST );

	// Black box signals mapping (from top module ENTITY)
	codix_risc_platform_ca_configuration HDL_DUT_U(
		.RST(RST),
		.CLK(CLK),
		.irq(codix_risc_platform_ca_if.irq),
		.port_out(codix_risc_platform_ca_if.port_out),
		.port_out_en(codix_risc_platform_ca_if.port_out_en),
		.port_halt(codix_risc_platform_ca_if.port_halt),
		.port_error(codix_risc_platform_ca_if.port_error) );

	// White box signals mapping, internal probes
	icodix_risc_platform_ca_codix_risc_core_regs codix_risc_platform_ca_codix_risc_core_regs_if(
		.CLK(CLK),
		.RST(RST),
		.Q0(HDL_DUT_U.codix_risc.core.regs.Q0),
		.RA0(HDL_DUT_U.codix_risc.core.regs.RA0),
		.RE0(HDL_DUT_U.codix_risc.core.regs.RE0),
		.Q1(HDL_DUT_U.codix_risc.core.regs.Q1),
		.RA1(HDL_DUT_U.codix_risc.core.regs.RA1),
		.RE1(HDL_DUT_U.codix_risc.core.regs.RE1),
		.Q2(HDL_DUT_U.codix_risc.core.regs.Q2),
		.RA2(HDL_DUT_U.codix_risc.core.regs.RA2),
		.RE2(HDL_DUT_U.codix_risc.core.regs.RE2),
		.D0(HDL_DUT_U.codix_risc.core.regs.D0),
		.WA0(HDL_DUT_U.codix_risc.core.regs.WA0),
		.WE0(HDL_DUT_U.codix_risc.core.regs.WE0) );

	icodix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw codix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw_if(
		.CLK(CLK),
		.RST(RST),
		.ACT(HDL_DUT_U.codix_risc.core.main_instr_hw_instr_hw.ACT),
		.id_instr_Q0(HDL_DUT_U.codix_risc.core.main_instr_hw_instr_hw.id_instr_Q0) );

	icodix_risc_platform_ca_codix_risc codix_risc_platform_ca_codix_risc_if(
		.CLK(CLK),
		.RST(RST),
		.irq(HDL_DUT_U.codix_risc.irq),
		.port_halt(HDL_DUT_U.codix_risc.port_halt),
		.port_out(HDL_DUT_U.codix_risc.port_out),
		.port_out_en(HDL_DUT_U.codix_risc.port_out_en),
		.port_error(HDL_DUT_U.codix_risc.port_error),
		.ibus_A0(HDL_DUT_U.codix_risc.ibus_A0),
		.ibus_SI0(HDL_DUT_U.codix_risc.ibus_SI0),
		.ibus_SC0(HDL_DUT_U.codix_risc.ibus_SC0),
		.ibus_REQCMD0(HDL_DUT_U.codix_risc.ibus_REQCMD0),
		.ibus_REQRESP0(HDL_DUT_U.codix_risc.ibus_REQRESP0),
		.ibus_Q0(HDL_DUT_U.codix_risc.ibus_Q0),
		.ibus_IFCMD0(HDL_DUT_U.codix_risc.ibus_IFCMD0),
		.ibus_IFRESP0(HDL_DUT_U.codix_risc.ibus_IFRESP0),
		.dbus_A0(HDL_DUT_U.codix_risc.dbus_A0),
		.dbus_SI0(HDL_DUT_U.codix_risc.dbus_SI0),
		.dbus_SC0(HDL_DUT_U.codix_risc.dbus_SC0),
		.dbus_REQCMD0(HDL_DUT_U.codix_risc.dbus_REQCMD0),
		.dbus_REQRESP0(HDL_DUT_U.codix_risc.dbus_REQRESP0),
		.dbus_Q0(HDL_DUT_U.codix_risc.dbus_Q0),
		.dbus_IFCMD0(HDL_DUT_U.codix_risc.dbus_IFCMD0),
		.dbus_IFRESP0(HDL_DUT_U.codix_risc.dbus_IFRESP0),
		.dbus_D0(HDL_DUT_U.codix_risc.dbus_D0),
		.dbus_OFCMD0(HDL_DUT_U.codix_risc.dbus_OFCMD0),
		.dbus_OFRESP0(HDL_DUT_U.codix_risc.dbus_OFRESP0) );

	icodix_risc_platform_ca_mem codix_risc_platform_ca_mem_if(
		.CLK(CLK),
		.RST(RST),
		.read_only_A0(HDL_DUT_U.mem.read_only_A0),
		.read_only_SI0(HDL_DUT_U.mem.read_only_SI0),
		.read_only_SC0(HDL_DUT_U.mem.read_only_SC0),
		.read_only_REQCMD0(HDL_DUT_U.mem.read_only_REQCMD0),
		.read_only_REQRESP0(HDL_DUT_U.mem.read_only_REQRESP0),
		.read_only_Q0(HDL_DUT_U.mem.read_only_Q0),
		.read_only_IFCMD0(HDL_DUT_U.mem.read_only_IFCMD0),
		.read_only_IFRESP0(HDL_DUT_U.mem.read_only_IFRESP0),
		.read_write_A0(HDL_DUT_U.mem.read_write_A0),
		.read_write_SI0(HDL_DUT_U.mem.read_write_SI0),
		.read_write_SC0(HDL_DUT_U.mem.read_write_SC0),
		.read_write_REQCMD0(HDL_DUT_U.mem.read_write_REQCMD0),
		.read_write_REQRESP0(HDL_DUT_U.mem.read_write_REQRESP0),
		.read_write_Q0(HDL_DUT_U.mem.read_write_Q0),
		.read_write_IFCMD0(HDL_DUT_U.mem.read_write_IFCMD0),
		.read_write_IFRESP0(HDL_DUT_U.mem.read_write_IFRESP0),
		.read_write_D0(HDL_DUT_U.mem.read_write_D0),
		.read_write_OFCMD0(HDL_DUT_U.mem.read_write_OFCMD0),
		.read_write_OFRESP0(HDL_DUT_U.mem.read_write_OFRESP0) );
*/
	ihalt ihalt_if(
		.CLK(CLK),
		.RST(RST),
		.codix_risc_platform_ca_codix_risc_core_main_controller_main_halt_halt_fu_semantics_ACT(CLK) );

endmodule: DUT
