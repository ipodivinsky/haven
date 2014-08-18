/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the CPU interface.
 */

`include "uvm_macros.svh"


// CPU port interface
interface icodix_risc_platform_ca_codix_risc( input logic CLK, input logic RST,
	input logic irq,
	input logic port_halt,
	input logic [31:0] port_out,
	input logic port_out_en,
	input logic [31:0] port_error,
	input logic [31:0] ibus_A0,
	input logic [1:0] ibus_SI0,
	input logic [2:0] ibus_SC0,
	input logic [2:0] ibus_REQCMD0,
	input logic [2:0] ibus_REQRESP0,
	input logic [31:0] ibus_Q0,
	input logic [2:0] ibus_IFCMD0,
	input logic [2:0] ibus_IFRESP0,
	input logic [31:0] dbus_A0,
	input logic [1:0] dbus_SI0,
	input logic [2:0] dbus_SC0,
	input logic [2:0] dbus_REQCMD0,
	input logic [2:0] dbus_REQRESP0,
	input logic [31:0] dbus_Q0,
	input logic [2:0] dbus_IFCMD0,
	input logic [2:0] dbus_IFRESP0,
	input logic [31:0] dbus_D0,
	input logic [2:0] dbus_OFCMD0,
	input logic [2:0] dbus_OFRESP0 );

	// import agent package for transaction and wrapper base classes
	import uvm_pkg::*;
	import sv_codix_risc_ca_t_agent_pkg::*;
	// clocking blocks

	// testbench point of view
	clocking cb @( posedge CLK );
		// connected ports are not driven, set input direction instead of output
		input irq, ibus_REQRESP0, ibus_Q0, ibus_IFRESP0, dbus_REQRESP0, dbus_Q0, dbus_IFRESP0, dbus_OFRESP0;
		input port_halt, port_out, port_out_en, port_error, ibus_A0, ibus_SI0, ibus_SC0, ibus_REQCMD0, ibus_IFCMD0, dbus_A0, dbus_SI0, dbus_SC0, dbus_REQCMD0, dbus_IFCMD0, dbus_D0, dbus_OFCMD0;
	endclocking: cb;

	// monitor point of view
	clocking cbm @( posedge CLK );
		input RST, irq, port_halt, port_out, port_out_en, port_error, ibus_A0, ibus_SI0, ibus_SC0, ibus_REQCMD0, ibus_REQRESP0, ibus_Q0, ibus_IFCMD0, ibus_IFRESP0, dbus_A0, dbus_SI0, dbus_SC0, dbus_REQCMD0, dbus_REQRESP0, dbus_Q0, dbus_IFCMD0, dbus_IFRESP0, dbus_D0, dbus_OFCMD0, dbus_OFRESP0;
	endclocking: cbm;

	// Unique/concrete implementation of the interface wrapper for this interface
	class icodix_risc_platform_ca_codix_risc_itf_wrapper extends codix_risc_ca_t_itf_wrapper_base;

		// registration of object tools
		`uvm_object_utils( icodix_risc_platform_ca_codix_risc_itf_wrapper )

		// Constructor - creates new instance of this class
		function new( string name = "codix_risc_platform_ca_codix_risc_if" );
			super.new( name );
		endfunction: new

		// drive - drive input and inout pins
		task automatic drive( codix_risc_ca_t_transaction t );
		endtask: drive

		// drive - drive input and inout pins
		task automatic drive_zero();
		endtask: drive_zero

		// monitor - read values on all interface pins using monitor clocking blocks
		task automatic monitor( codix_risc_ca_t_transaction t );
			t.irq = cbm.irq;
			t.port_halt = cbm.port_halt;
			t.port_out = cbm.port_out;
			t.port_out_en = cbm.port_out_en;
			t.port_error = cbm.port_error;
			t.ibus_A0 = cbm.ibus_A0;
			t.ibus_SI0 = cbm.ibus_SI0;
			t.ibus_SC0 = cbm.ibus_SC0;
			t.ibus_REQCMD0 = cbm.ibus_REQCMD0;
			t.ibus_REQRESP0 = cbm.ibus_REQRESP0;
			t.ibus_Q0 = cbm.ibus_Q0;
			t.ibus_IFCMD0 = cbm.ibus_IFCMD0;
			t.ibus_IFRESP0 = cbm.ibus_IFRESP0;
			t.dbus_A0 = cbm.dbus_A0;
			t.dbus_SI0 = cbm.dbus_SI0;
			t.dbus_SC0 = cbm.dbus_SC0;
			t.dbus_REQCMD0 = cbm.dbus_REQCMD0;
			t.dbus_REQRESP0 = cbm.dbus_REQRESP0;
			t.dbus_Q0 = cbm.dbus_Q0;
			t.dbus_IFCMD0 = cbm.dbus_IFCMD0;
			t.dbus_IFRESP0 = cbm.dbus_IFRESP0;
			t.dbus_D0 = cbm.dbus_D0;
			t.dbus_OFCMD0 = cbm.dbus_OFCMD0;
			t.dbus_OFRESP0 = cbm.dbus_OFRESP0;
			t.RST = cbm.RST;
		endtask: monitor

		// monitor - read values on all interface pins asynchronously (no clocking blocks)
		task automatic async_monitor( codix_risc_ca_t_transaction t );
			t.irq = irq;
			t.port_halt = port_halt;
			t.port_out = port_out;
			t.port_out_en = port_out_en;
			t.port_error = port_error;
			t.ibus_A0 = ibus_A0;
			t.ibus_SI0 = ibus_SI0;
			t.ibus_SC0 = ibus_SC0;
			t.ibus_REQCMD0 = ibus_REQCMD0;
			t.ibus_REQRESP0 = ibus_REQRESP0;
			t.ibus_Q0 = ibus_Q0;
			t.ibus_IFCMD0 = ibus_IFCMD0;
			t.ibus_IFRESP0 = ibus_IFRESP0;
			t.dbus_A0 = dbus_A0;
			t.dbus_SI0 = dbus_SI0;
			t.dbus_SC0 = dbus_SC0;
			t.dbus_REQCMD0 = dbus_REQCMD0;
			t.dbus_REQRESP0 = dbus_REQRESP0;
			t.dbus_Q0 = dbus_Q0;
			t.dbus_IFCMD0 = dbus_IFCMD0;
			t.dbus_IFRESP0 = dbus_IFRESP0;
			t.dbus_D0 = dbus_D0;
			t.dbus_OFCMD0 = dbus_OFCMD0;
			t.dbus_OFRESP0 = dbus_OFRESP0;
			t.RST = cbm.RST;
		endtask: async_monitor

		// wait for n clock cycles
		task automatic wait_for_clock( int n = 1 );
			repeat ( n ) begin
				@( cbm );
			end
		endtask: wait_for_clock

		// wait for reset to finish
		task automatic wait_for_reset_inactive();
			@( posedge RST );
		endtask: wait_for_reset_inactive

	endclass: icodix_risc_platform_ca_codix_risc_itf_wrapper

	// Only instance of the wrapper
	icodix_risc_platform_ca_codix_risc_itf_wrapper m_vif_wrapper_h = new;

endinterface: icodix_risc_platform_ca_codix_risc
