/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_platform_ca_t_transaction'.
 */

// This class represents transaction which contains values of output signals for 'codix_risc_platform_ca'.
class codix_risc_platform_ca_t_transaction extends uvm_sequence_item;

	// registration of object tools
	`uvm_object_utils( codix_risc_platform_ca_t_transaction )

	// Member attributes, equivalent with interface pins
	// make input attributes random
	rand logic irq;
	logic [31:0] port_out;
	logic port_out_en;
	logic port_halt;
	logic [31:0] port_error;
	// value of global reset
	logic RST;

	// Constructor - creates new instance of this class
	function new( string name = "codix_risc_platform_ca_t_transaction" );
		super.new( name );
	endfunction: new

	// Indicates if the transaction is valid for the subscriber or not.
	function bit is_valid();
		return ( (!$isunknown(RST)) && (RST != 0) );
	endfunction: is_valid

	// common UVM functions

	// Properly copy all transaction attributes.
	function void do_copy( uvm_object rhs );
		codix_risc_platform_ca_t_transaction rhs_;

		if( !$cast(rhs_, rhs) ) begin
			`uvm_fatal( "do_copy:", "Failed to cast transaction object." )
			return;
		end
		// now copy all attributes
		super.do_copy( rhs );
		irq = rhs_.irq;
		port_out = rhs_.port_out;
		port_out_en = rhs_.port_out_en;
		port_halt = rhs_.port_halt;
		port_error = rhs_.port_error;
		RST = rhs_.RST;
	endfunction: do_copy

	// Properly compare all transaction attributes representing output pins.
	function bit do_compare( uvm_object rhs, uvm_comparer comparer );
		codix_risc_platform_ca_t_transaction rhs_;

		if( !$cast(rhs_, rhs) ) begin
			`uvm_error( "do_compare:", "Failed to cast transaction object." )
			return 0;
		end
		// now compare all output attributes
`ifdef FORCE_USE_OF_UVM_COMPARISON_POLICY
		// using UVM comparison policy (slower, but more understandable error message)
		return ( super.do_compare(rhs, comparer) &&
			comparer.compare_field("port_out", port_out, rhs_.port_out, $bits(port_out)) &&
			comparer.compare_field("port_out_en", port_out_en, rhs_.port_out_en, $bits(port_out_en)) &&
			comparer.compare_field("port_halt", port_halt, rhs_.port_halt, $bits(port_halt)) &&
			comparer.compare_field("port_error", port_error, rhs_.port_error, $bits(port_error)) );
`else
		// using simple equivalence operator (faster)
		return ( super.do_compare(rhs, comparer) &&
			(port_out == rhs_.port_out) &&
			(port_out_en == rhs_.port_out_en) &&
			(port_halt == rhs_.port_halt) &&
			(port_error == rhs_.port_error) );
`endif
	endfunction: do_compare

	// Convert transaction into human readable form.
	function string convert2string();
		string s;
		s = $sformatf( "%s\n\tirq: 'h%0h\n\tport_out: 'h%0h\n\tport_out_en: 'h%0h\n\tport_halt: 'h%0h\n\tport_error: 'h%0h\n\tRST: 'h%0h",
			super.convert2string(),
			irq,
			port_out,
			port_out_en,
			port_halt,
			port_error,
			RST );
		return s;
	endfunction: convert2string

	// Customize what gets printed or sprinted, use the uvm_printer policy classes.
	function void do_print( uvm_printer printer );
		super.do_print( printer );
		if ( printer != null ) begin
			printer.print_int( "irq", irq, $bits(irq) );
			printer.print_int( "port_out", port_out, $bits(port_out) );
			printer.print_int( "port_out_en", port_out_en, $bits(port_out_en) );
			printer.print_int( "port_halt", port_halt, $bits(port_halt) );
			printer.print_int( "port_error", port_error, $bits(port_error) );
			printer.print_int( "RST", RST, $bits(RST) );
		end
	endfunction: do_print

	// Support the viewing of data objects as transactions in a waveform GUI.
	function void do_record( uvm_recorder recorder );
		super.do_record( recorder );
		`uvm_record_field( "irq", irq )
		`uvm_record_field( "port_out", port_out )
		`uvm_record_field( "port_out_en", port_out_en )
		`uvm_record_field( "port_halt", port_halt )
		`uvm_record_field( "port_error", port_error )
		`uvm_record_field( "RST", RST )
	endfunction: do_record

endclass: codix_risc_platform_ca_t_transaction

