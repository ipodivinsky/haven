/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Wed Jun 18 14:16:23 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the CPU interface.
 */


// CPU port interface
interface icodix_risc_ca_t( input logic CLK, input logic RST,
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

	// import transaction class needed by the generated task
	import sv_codix_risc_ca_t_agent_pkg::codix_risc_ca_t_transaction;

	// clocking blocks

	// testbench point of view
	clocking cb @( posedge CLK );
		// connected ports are not driven, set input direction instead of output
		input ibus_REQRESP0, ibus_Q0, ibus_IFRESP0, dbus_REQRESP0, dbus_Q0, dbus_IFRESP0, dbus_OFRESP0;
		// unconnected ports are driven, set output direction
		output irq;
		input port_halt, port_out, port_out_en, port_error, ibus_A0, ibus_SI0, ibus_SC0, ibus_REQCMD0, ibus_IFCMD0, dbus_A0, dbus_SI0, dbus_SC0, dbus_REQCMD0, dbus_IFCMD0, dbus_D0, dbus_OFCMD0;
	endclocking: cb;

	// monitor point of view
	clocking cbm @( posedge CLK );
		input RST, irq, port_halt, port_out, port_out_en, port_error, ibus_A0, ibus_SI0, ibus_SC0, ibus_REQCMD0, ibus_REQRESP0, ibus_Q0, ibus_IFCMD0, ibus_IFRESP0, dbus_A0, dbus_SI0, dbus_SC0, dbus_REQCMD0, dbus_REQRESP0, dbus_Q0, dbus_IFCMD0, dbus_IFRESP0, dbus_D0, dbus_OFCMD0, dbus_OFRESP0;
	endclocking: cbm;

	// drive - drive input and inout pins
	task automatic drive( codix_risc_ca_t_transaction t );
		cb.irq <= t.irq;
	endtask: drive

	// drive - drive input and inout pins
	task automatic drive_zero();
		cb.irq <= 1'b0;
	endtask: drive_zero

	// monitor - read values on all interface pins, using monitor clocking blocks
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

	// direction modports

	// RTL point of view
	modport DUT(
		input CLK, RST, irq, ibus_REQRESP0, ibus_Q0, ibus_IFRESP0, dbus_REQRESP0, dbus_Q0, dbus_IFRESP0, dbus_OFRESP0,
		output port_halt, port_out, port_out_en, port_error, ibus_A0, ibus_SI0, ibus_SC0, ibus_REQCMD0, ibus_IFCMD0, dbus_A0, dbus_SI0, dbus_SC0, dbus_REQCMD0, dbus_IFCMD0, dbus_D0, dbus_OFCMD0,
		import task wait_for_clock( int n ),
		import task wait_for_reset_inactive() );

	// testbench point of view, synchronous
	modport SYNC_TEST( clocking cb,
		import task drive( codix_risc_ca_t_transaction t ),
		import task drive_zero(),
		import task monitor( codix_risc_ca_t_transaction t ),
		import task wait_for_clock( int n ),
		import task wait_for_reset_inactive() );

	// monitor point of view, synchronous
	modport SYNC_MONITOR( clocking cbm,
		import task monitor( codix_risc_ca_t_transaction t ),
		import task wait_for_clock( int n ),
		import task wait_for_reset_inactive() );

endinterface: icodix_risc_ca_t
