/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_ca_core_regs_t_transaction'.
 */

// This class represents transaction which contains values of output signals for 'regs'.
class codix_risc_ca_core_regs_t_transaction extends uvm_sequence_item;

	// registration of object tools
	`uvm_object_utils( codix_risc_ca_core_regs_t_transaction )

	// Member attributes, equivalent with interface pins
	// make input attributes random
	rand logic [4:0] RA0;
	rand logic RE0;
	rand logic [4:0] RA1;
	rand logic RE1;
	rand logic [4:0] RA2;
	rand logic RE2;
	rand logic [31:0] D0;
	rand logic [4:0] WA0;
	rand logic WE0;
	logic [31:0] Q0;
	logic [31:0] Q1;
	logic [31:0] Q2;
	// value of global reset
	logic RST;

	// Constructor - creates new instance of this class
	function new( string name = "codix_risc_ca_core_regs_t_transaction" );
		super.new( name );
	endfunction: new

	// Indicates if the transaction is valid for the subscriber or not.
	function bit is_valid();
		return ( (!$isunknown(RST)) && (RST != 0) );
	endfunction: is_valid

	// common UVM functions

	// Properly copy all transaction attributes.
	function void do_copy( uvm_object rhs );
		codix_risc_ca_core_regs_t_transaction rhs_;

		if( !$cast(rhs_, rhs) ) begin
			`uvm_fatal( "do_copy:", "Failed to cast transaction object." )
			return;
		end
		// now copy all attributes
		super.do_copy( rhs );
		Q0 = rhs_.Q0;
		RA0 = rhs_.RA0;
		RE0 = rhs_.RE0;
		Q1 = rhs_.Q1;
		RA1 = rhs_.RA1;
		RE1 = rhs_.RE1;
		Q2 = rhs_.Q2;
		RA2 = rhs_.RA2;
		RE2 = rhs_.RE2;
		D0 = rhs_.D0;
		WA0 = rhs_.WA0;
		WE0 = rhs_.WE0;
		RST = rhs_.RST;
	endfunction: do_copy

	// Properly compare all transaction attributes representing output pins.
	function bit do_compare( uvm_object rhs, uvm_comparer comparer );
		codix_risc_ca_core_regs_t_transaction rhs_;

		if( !$cast(rhs_, rhs) ) begin
			`uvm_error( "do_compare:", "Failed to cast transaction object." )
			return 0;
		end
		// now compare all output attributes
`ifdef FORCE_USE_OF_UVM_COMPARISON_POLICY
		// using UVM comparison policy (slower, but more understandable error message)
		return ( super.do_compare(rhs, comparer) &&
			comparer.compare_field("Q0", Q0, rhs_.Q0, $bits(Q0)) &&
			comparer.compare_field("Q1", Q1, rhs_.Q1, $bits(Q1)) &&
			comparer.compare_field("Q2", Q2, rhs_.Q2, $bits(Q2)) );
`else
		// using simple equivalence operator (faster)
		return ( super.do_compare(rhs, comparer) &&
			(Q0 == rhs_.Q0) &&
			(Q1 == rhs_.Q1) &&
			(Q2 == rhs_.Q2) );
`endif
	endfunction: do_compare

	// Convert transaction into human readable form.
	function string convert2string();
		string s;
		s = $sformatf( "%s\n\tQ0: 'h%0h\n\tRA0: 'h%0h\n\tRE0: 'h%0h\n\tQ1: 'h%0h\n\tRA1: 'h%0h\n\tRE1: 'h%0h\n\tQ2: 'h%0h\n\tRA2: 'h%0h\n\tRE2: 'h%0h\n\tD0: 'h%0h\n\tWA0: 'h%0h\n\tWE0: 'h%0h\n\tRST: 'h%0h",
			super.convert2string(),
			Q0,
			RA0,
			RE0,
			Q1,
			RA1,
			RE1,
			Q2,
			RA2,
			RE2,
			D0,
			WA0,
			WE0,
			RST );
		return s;
	endfunction: convert2string

	// Customize what gets printed or sprinted, use the uvm_printer policy classes.
	function void do_print( uvm_printer printer );
		super.do_print( printer );
		if ( printer != null ) begin
			printer.print_int( "Q0", Q0, $bits(Q0) );
			printer.print_int( "RA0", RA0, $bits(RA0) );
			printer.print_int( "RE0", RE0, $bits(RE0) );
			printer.print_int( "Q1", Q1, $bits(Q1) );
			printer.print_int( "RA1", RA1, $bits(RA1) );
			printer.print_int( "RE1", RE1, $bits(RE1) );
			printer.print_int( "Q2", Q2, $bits(Q2) );
			printer.print_int( "RA2", RA2, $bits(RA2) );
			printer.print_int( "RE2", RE2, $bits(RE2) );
			printer.print_int( "D0", D0, $bits(D0) );
			printer.print_int( "WA0", WA0, $bits(WA0) );
			printer.print_int( "WE0", WE0, $bits(WE0) );
			printer.print_int( "RST", RST, $bits(RST) );
		end
	endfunction: do_print

	// Support the viewing of data objects as transactions in a waveform GUI.
	function void do_record( uvm_recorder recorder );
		super.do_record( recorder );
		`uvm_record_field( "Q0", Q0 )
		`uvm_record_field( "RA0", RA0 )
		`uvm_record_field( "RE0", RE0 )
		`uvm_record_field( "Q1", Q1 )
		`uvm_record_field( "RA1", RA1 )
		`uvm_record_field( "RE1", RE1 )
		`uvm_record_field( "Q2", Q2 )
		`uvm_record_field( "RA2", RA2 )
		`uvm_record_field( "RE2", RE2 )
		`uvm_record_field( "D0", D0 )
		`uvm_record_field( "WA0", WA0 )
		`uvm_record_field( "WE0", WE0 )
		`uvm_record_field( "RST", RST )
	endfunction: do_record

endclass: codix_risc_ca_core_regs_t_transaction

