/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Wed Jun 18 14:16:23 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_ca_t_transaction'.
 */

// This class represents transaction which contains values of output signals for 'codix_risc_platform_ca_codix_risc'.
class codix_risc_ca_t_transaction extends uvm_sequence_item;

	// registration of object tools
	`uvm_object_utils( codix_risc_ca_t_transaction )

	// Member attributes, equivalent with interface pins
	// make input attributes random
	rand logic irq;
	rand logic [2:0] ibus_REQRESP0;
	rand logic [31:0] ibus_Q0;
	rand logic [2:0] ibus_IFRESP0;
	rand logic [2:0] dbus_REQRESP0;
	rand logic [31:0] dbus_Q0;
	rand logic [2:0] dbus_IFRESP0;
	rand logic [2:0] dbus_OFRESP0;
	logic port_halt;
	logic [31:0] port_out;
	logic port_out_en;
	logic [31:0] port_error;
	logic [31:0] ibus_A0;
	logic [1:0] ibus_SI0;
	logic [2:0] ibus_SC0;
	logic [2:0] ibus_REQCMD0;
	logic [2:0] ibus_IFCMD0;
	logic [31:0] dbus_A0;
	logic [1:0] dbus_SI0;
	logic [2:0] dbus_SC0;
	logic [2:0] dbus_REQCMD0;
	logic [2:0] dbus_IFCMD0;
	logic [31:0] dbus_D0;
	logic [2:0] dbus_OFCMD0;
	// value of global reset
	logic RST;

	// Constructor - creates new instance of this class
	function new( string name = "codix_risc_ca_t_transaction" );
		super.new( name );
	endfunction: new

	// Indicates if the transaction is valid for the subscriber or not.
	function bit is_valid();
		return ( (!$isunknown(RST)) && (RST != 0) );
	endfunction: is_valid

	// common UVM functions

	// Properly copy all transaction attributes.
	function void do_copy( uvm_object rhs );
		codix_risc_ca_t_transaction rhs_;

		if( !$cast(rhs_, rhs) ) begin
			`uvm_fatal( "do_copy:", "Failed to cast transaction object." )
			return;
		end
		// now copy all attributes
		super.do_copy( rhs );
		irq = rhs_.irq;
		port_halt = rhs_.port_halt;
		port_out = rhs_.port_out;
		port_out_en = rhs_.port_out_en;
		port_error = rhs_.port_error;
		ibus_A0 = rhs_.ibus_A0;
		ibus_SI0 = rhs_.ibus_SI0;
		ibus_SC0 = rhs_.ibus_SC0;
		ibus_REQCMD0 = rhs_.ibus_REQCMD0;
		ibus_REQRESP0 = rhs_.ibus_REQRESP0;
		ibus_Q0 = rhs_.ibus_Q0;
		ibus_IFCMD0 = rhs_.ibus_IFCMD0;
		ibus_IFRESP0 = rhs_.ibus_IFRESP0;
		dbus_A0 = rhs_.dbus_A0;
		dbus_SI0 = rhs_.dbus_SI0;
		dbus_SC0 = rhs_.dbus_SC0;
		dbus_REQCMD0 = rhs_.dbus_REQCMD0;
		dbus_REQRESP0 = rhs_.dbus_REQRESP0;
		dbus_Q0 = rhs_.dbus_Q0;
		dbus_IFCMD0 = rhs_.dbus_IFCMD0;
		dbus_IFRESP0 = rhs_.dbus_IFRESP0;
		dbus_D0 = rhs_.dbus_D0;
		dbus_OFCMD0 = rhs_.dbus_OFCMD0;
		dbus_OFRESP0 = rhs_.dbus_OFRESP0;
		RST = rhs_.RST;
	endfunction: do_copy

	// Properly compare all transaction attributes representing output pins.
	function bit do_compare( uvm_object rhs, uvm_comparer comparer );
		codix_risc_ca_t_transaction rhs_;

		if( !$cast(rhs_, rhs) ) begin
			`uvm_error( "do_compare:", "Failed to cast transaction object." )
			return 0;
		end
		// now compare all output attributes
`ifdef FORCE_USE_OF_UVM_COMPARISON_POLICY
		// using UVM comparison policy (slower, but more understandable error message)
		return ( super.do_compare(rhs, comparer) &&
			comparer.compare_field("port_halt", port_halt, rhs_.port_halt, $bits(port_halt)) &&
			comparer.compare_field("port_out", port_out, rhs_.port_out, $bits(port_out)) &&
			comparer.compare_field("port_out_en", port_out_en, rhs_.port_out_en, $bits(port_out_en)) &&
			comparer.compare_field("port_error", port_error, rhs_.port_error, $bits(port_error)) &&
			comparer.compare_field("ibus_A0", ibus_A0, rhs_.ibus_A0, $bits(ibus_A0)) &&
			comparer.compare_field("ibus_SI0", ibus_SI0, rhs_.ibus_SI0, $bits(ibus_SI0)) &&
			comparer.compare_field("ibus_SC0", ibus_SC0, rhs_.ibus_SC0, $bits(ibus_SC0)) &&
			comparer.compare_field("ibus_REQCMD0", ibus_REQCMD0, rhs_.ibus_REQCMD0, $bits(ibus_REQCMD0)) &&
			comparer.compare_field("ibus_IFCMD0", ibus_IFCMD0, rhs_.ibus_IFCMD0, $bits(ibus_IFCMD0)) &&
			comparer.compare_field("dbus_A0", dbus_A0, rhs_.dbus_A0, $bits(dbus_A0)) &&
			comparer.compare_field("dbus_SI0", dbus_SI0, rhs_.dbus_SI0, $bits(dbus_SI0)) &&
			comparer.compare_field("dbus_SC0", dbus_SC0, rhs_.dbus_SC0, $bits(dbus_SC0)) &&
			comparer.compare_field("dbus_REQCMD0", dbus_REQCMD0, rhs_.dbus_REQCMD0, $bits(dbus_REQCMD0)) &&
			comparer.compare_field("dbus_IFCMD0", dbus_IFCMD0, rhs_.dbus_IFCMD0, $bits(dbus_IFCMD0)) &&
			comparer.compare_field("dbus_D0", dbus_D0, rhs_.dbus_D0, $bits(dbus_D0)) &&
			comparer.compare_field("dbus_OFCMD0", dbus_OFCMD0, rhs_.dbus_OFCMD0, $bits(dbus_OFCMD0)) );
`else
		// using simple equivalence operator (faster)
		return ( super.do_compare(rhs, comparer) &&
			(port_halt == rhs_.port_halt) &&
			(port_out == rhs_.port_out) &&
			(port_out_en == rhs_.port_out_en) &&
			(port_error == rhs_.port_error) &&
			(ibus_A0 == rhs_.ibus_A0) &&
			(ibus_SI0 == rhs_.ibus_SI0) &&
			(ibus_SC0 == rhs_.ibus_SC0) &&
			(ibus_REQCMD0 == rhs_.ibus_REQCMD0) &&
			(ibus_IFCMD0 == rhs_.ibus_IFCMD0) &&
			(dbus_A0 == rhs_.dbus_A0) &&
			(dbus_SI0 == rhs_.dbus_SI0) &&
			(dbus_SC0 == rhs_.dbus_SC0) &&
			(dbus_REQCMD0 == rhs_.dbus_REQCMD0) &&
			(dbus_IFCMD0 == rhs_.dbus_IFCMD0) &&
			(dbus_D0 == rhs_.dbus_D0) &&
			(dbus_OFCMD0 == rhs_.dbus_OFCMD0) );
`endif
	endfunction: do_compare

	// Convert transaction into human readable form.
	function string convert2string();
		string s;
		s = $sformatf( "%s\n\tirq: 'h%0h\n\tport_halt: 'h%0h\n\tport_out: 'h%0h\n\tport_out_en: 'h%0h\n\tport_error: 'h%0h\n\tibus_A0: 'h%0h\n\tibus_SI0: 'h%0h\n\tibus_SC0: 'h%0h\n\tibus_REQCMD0: 'h%0h\n\tibus_REQRESP0: 'h%0h\n\tibus_Q0: 'h%0h\n\tibus_IFCMD0: 'h%0h\n\tibus_IFRESP0: 'h%0h\n\tdbus_A0: 'h%0h\n\tdbus_SI0: 'h%0h\n\tdbus_SC0: 'h%0h\n\tdbus_REQCMD0: 'h%0h\n\tdbus_REQRESP0: 'h%0h\n\tdbus_Q0: 'h%0h\n\tdbus_IFCMD0: 'h%0h\n\tdbus_IFRESP0: 'h%0h\n\tdbus_D0: 'h%0h\n\tdbus_OFCMD0: 'h%0h\n\tdbus_OFRESP0: 'h%0h\n\tRST: 'h%0h",
			super.convert2string(),
			irq,
			port_halt,
			port_out,
			port_out_en,
			port_error,
			ibus_A0,
			ibus_SI0,
			ibus_SC0,
			ibus_REQCMD0,
			ibus_REQRESP0,
			ibus_Q0,
			ibus_IFCMD0,
			ibus_IFRESP0,
			dbus_A0,
			dbus_SI0,
			dbus_SC0,
			dbus_REQCMD0,
			dbus_REQRESP0,
			dbus_Q0,
			dbus_IFCMD0,
			dbus_IFRESP0,
			dbus_D0,
			dbus_OFCMD0,
			dbus_OFRESP0,
			RST );
		return s;
	endfunction: convert2string

	// Customize what gets printed or sprinted, use the uvm_printer policy classes.
	function void do_print( uvm_printer printer );
		super.do_print( printer );
		if ( printer != null ) begin
			printer.print_int( "irq", irq, $bits(irq) );
			printer.print_int( "port_halt", port_halt, $bits(port_halt) );
			printer.print_int( "port_out", port_out, $bits(port_out) );
			printer.print_int( "port_out_en", port_out_en, $bits(port_out_en) );
			printer.print_int( "port_error", port_error, $bits(port_error) );
			printer.print_int( "ibus_A0", ibus_A0, $bits(ibus_A0) );
			printer.print_int( "ibus_SI0", ibus_SI0, $bits(ibus_SI0) );
			printer.print_int( "ibus_SC0", ibus_SC0, $bits(ibus_SC0) );
			printer.print_int( "ibus_REQCMD0", ibus_REQCMD0, $bits(ibus_REQCMD0) );
			printer.print_int( "ibus_REQRESP0", ibus_REQRESP0, $bits(ibus_REQRESP0) );
			printer.print_int( "ibus_Q0", ibus_Q0, $bits(ibus_Q0) );
			printer.print_int( "ibus_IFCMD0", ibus_IFCMD0, $bits(ibus_IFCMD0) );
			printer.print_int( "ibus_IFRESP0", ibus_IFRESP0, $bits(ibus_IFRESP0) );
			printer.print_int( "dbus_A0", dbus_A0, $bits(dbus_A0) );
			printer.print_int( "dbus_SI0", dbus_SI0, $bits(dbus_SI0) );
			printer.print_int( "dbus_SC0", dbus_SC0, $bits(dbus_SC0) );
			printer.print_int( "dbus_REQCMD0", dbus_REQCMD0, $bits(dbus_REQCMD0) );
			printer.print_int( "dbus_REQRESP0", dbus_REQRESP0, $bits(dbus_REQRESP0) );
			printer.print_int( "dbus_Q0", dbus_Q0, $bits(dbus_Q0) );
			printer.print_int( "dbus_IFCMD0", dbus_IFCMD0, $bits(dbus_IFCMD0) );
			printer.print_int( "dbus_IFRESP0", dbus_IFRESP0, $bits(dbus_IFRESP0) );
			printer.print_int( "dbus_D0", dbus_D0, $bits(dbus_D0) );
			printer.print_int( "dbus_OFCMD0", dbus_OFCMD0, $bits(dbus_OFCMD0) );
			printer.print_int( "dbus_OFRESP0", dbus_OFRESP0, $bits(dbus_OFRESP0) );
			printer.print_int( "RST", RST, $bits(RST) );
		end
	endfunction: do_print

	// Support the viewing of data objects as transactions in a waveform GUI.
	function void do_record( uvm_recorder recorder );
		super.do_record( recorder );
		`uvm_record_field( "irq", irq )
		`uvm_record_field( "port_halt", port_halt )
		`uvm_record_field( "port_out", port_out )
		`uvm_record_field( "port_out_en", port_out_en )
		`uvm_record_field( "port_error", port_error )
		`uvm_record_field( "ibus_A0", ibus_A0 )
		`uvm_record_field( "ibus_SI0", ibus_SI0 )
		`uvm_record_field( "ibus_SC0", ibus_SC0 )
		`uvm_record_field( "ibus_REQCMD0", ibus_REQCMD0 )
		`uvm_record_field( "ibus_REQRESP0", ibus_REQRESP0 )
		`uvm_record_field( "ibus_Q0", ibus_Q0 )
		`uvm_record_field( "ibus_IFCMD0", ibus_IFCMD0 )
		`uvm_record_field( "ibus_IFRESP0", ibus_IFRESP0 )
		`uvm_record_field( "dbus_A0", dbus_A0 )
		`uvm_record_field( "dbus_SI0", dbus_SI0 )
		`uvm_record_field( "dbus_SC0", dbus_SC0 )
		`uvm_record_field( "dbus_REQCMD0", dbus_REQCMD0 )
		`uvm_record_field( "dbus_REQRESP0", dbus_REQRESP0 )
		`uvm_record_field( "dbus_Q0", dbus_Q0 )
		`uvm_record_field( "dbus_IFCMD0", dbus_IFCMD0 )
		`uvm_record_field( "dbus_IFRESP0", dbus_IFRESP0 )
		`uvm_record_field( "dbus_D0", dbus_D0 )
		`uvm_record_field( "dbus_OFCMD0", dbus_OFCMD0 )
		`uvm_record_field( "dbus_OFRESP0", dbus_OFRESP0 )
		`uvm_record_field( "RST", RST )
	endfunction: do_record

endclass: codix_risc_ca_t_transaction

