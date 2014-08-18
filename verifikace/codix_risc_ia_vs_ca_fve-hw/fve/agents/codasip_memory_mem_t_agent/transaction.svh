/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codasip_memory_mem_t_transaction'.
 */

// This class represents transaction which contains values of output signals for 'mem'.
class codasip_memory_mem_t_transaction extends uvm_sequence_item;

	// registration of object tools
	`uvm_object_utils( codasip_memory_mem_t_transaction )

	// Member attributes, equivalent with interface pins
	// make input attributes random
	rand logic [31:0] read_only_A0;
	rand logic [1:0] read_only_SI0;
	rand logic [2:0] read_only_SC0;
	rand logic [2:0] read_only_REQCMD0;
	rand logic [2:0] read_only_IFCMD0;
	rand logic [31:0] read_write_A0;
	rand logic [1:0] read_write_SI0;
	rand logic [2:0] read_write_SC0;
	rand logic [2:0] read_write_REQCMD0;
	rand logic [2:0] read_write_IFCMD0;
	rand logic [31:0] read_write_D0;
	rand logic [2:0] read_write_OFCMD0;
	logic [2:0] read_only_REQRESP0;
	logic [31:0] read_only_Q0;
	logic [2:0] read_only_IFRESP0;
	logic [2:0] read_write_REQRESP0;
	logic [31:0] read_write_Q0;
	logic [2:0] read_write_IFRESP0;
	logic [2:0] read_write_OFRESP0;
	// value of global reset
	logic RST;

	// Constructor - creates new instance of this class
	function new( string name = "codasip_memory_mem_t_transaction" );
		super.new( name );
	endfunction: new

	// Indicates if the transaction is valid for the subscriber or not.
	function bit is_valid();
		return ( (!$isunknown(RST)) && (RST != 0) );
	endfunction: is_valid

	// common UVM functions

	// Properly copy all transaction attributes.
	function void do_copy( uvm_object rhs );
		codasip_memory_mem_t_transaction rhs_;

		if( !$cast(rhs_, rhs) ) begin
			`uvm_fatal( "do_copy:", "Failed to cast transaction object." )
			return;
		end
		// now copy all attributes
		super.do_copy( rhs );
		read_only_A0 = rhs_.read_only_A0;
		read_only_SI0 = rhs_.read_only_SI0;
		read_only_SC0 = rhs_.read_only_SC0;
		read_only_REQCMD0 = rhs_.read_only_REQCMD0;
		read_only_REQRESP0 = rhs_.read_only_REQRESP0;
		read_only_Q0 = rhs_.read_only_Q0;
		read_only_IFCMD0 = rhs_.read_only_IFCMD0;
		read_only_IFRESP0 = rhs_.read_only_IFRESP0;
		read_write_A0 = rhs_.read_write_A0;
		read_write_SI0 = rhs_.read_write_SI0;
		read_write_SC0 = rhs_.read_write_SC0;
		read_write_REQCMD0 = rhs_.read_write_REQCMD0;
		read_write_REQRESP0 = rhs_.read_write_REQRESP0;
		read_write_Q0 = rhs_.read_write_Q0;
		read_write_IFCMD0 = rhs_.read_write_IFCMD0;
		read_write_IFRESP0 = rhs_.read_write_IFRESP0;
		read_write_D0 = rhs_.read_write_D0;
		read_write_OFCMD0 = rhs_.read_write_OFCMD0;
		read_write_OFRESP0 = rhs_.read_write_OFRESP0;
		RST = rhs_.RST;
	endfunction: do_copy

	// Properly compare all transaction attributes representing output pins.
	function bit do_compare( uvm_object rhs, uvm_comparer comparer );
		codasip_memory_mem_t_transaction rhs_;

		if( !$cast(rhs_, rhs) ) begin
			`uvm_error( "do_compare:", "Failed to cast transaction object." )
			return 0;
		end
		// now compare all output attributes
`ifdef FORCE_USE_OF_UVM_COMPARISON_POLICY
		// using UVM comparison policy (slower, but more understandable error message)
		return ( super.do_compare(rhs, comparer) &&
			comparer.compare_field("read_only_REQRESP0", read_only_REQRESP0, rhs_.read_only_REQRESP0, $bits(read_only_REQRESP0)) &&
			comparer.compare_field("read_only_Q0", read_only_Q0, rhs_.read_only_Q0, $bits(read_only_Q0)) &&
			comparer.compare_field("read_only_IFRESP0", read_only_IFRESP0, rhs_.read_only_IFRESP0, $bits(read_only_IFRESP0)) &&
			comparer.compare_field("read_write_REQRESP0", read_write_REQRESP0, rhs_.read_write_REQRESP0, $bits(read_write_REQRESP0)) &&
			comparer.compare_field("read_write_Q0", read_write_Q0, rhs_.read_write_Q0, $bits(read_write_Q0)) &&
			comparer.compare_field("read_write_IFRESP0", read_write_IFRESP0, rhs_.read_write_IFRESP0, $bits(read_write_IFRESP0)) &&
			comparer.compare_field("read_write_OFRESP0", read_write_OFRESP0, rhs_.read_write_OFRESP0, $bits(read_write_OFRESP0)) );
`else
		// using simple equivalence operator (faster)
		return ( super.do_compare(rhs, comparer) &&
			(read_only_REQRESP0 == rhs_.read_only_REQRESP0) &&
			(read_only_Q0 == rhs_.read_only_Q0) &&
			(read_only_IFRESP0 == rhs_.read_only_IFRESP0) &&
			(read_write_REQRESP0 == rhs_.read_write_REQRESP0) &&
			(read_write_Q0 == rhs_.read_write_Q0) &&
			(read_write_IFRESP0 == rhs_.read_write_IFRESP0) &&
			(read_write_OFRESP0 == rhs_.read_write_OFRESP0) );
`endif
	endfunction: do_compare

	// Convert transaction into human readable form.
	function string convert2string();
		string s;
		s = $sformatf( "%s\n\tread_only_A0: 'h%0h\n\tread_only_SI0: 'h%0h\n\tread_only_SC0: 'h%0h\n\tread_only_REQCMD0: 'h%0h\n\tread_only_REQRESP0: 'h%0h\n\tread_only_Q0: 'h%0h\n\tread_only_IFCMD0: 'h%0h\n\tread_only_IFRESP0: 'h%0h\n\tread_write_A0: 'h%0h\n\tread_write_SI0: 'h%0h\n\tread_write_SC0: 'h%0h\n\tread_write_REQCMD0: 'h%0h\n\tread_write_REQRESP0: 'h%0h\n\tread_write_Q0: 'h%0h\n\tread_write_IFCMD0: 'h%0h\n\tread_write_IFRESP0: 'h%0h\n\tread_write_D0: 'h%0h\n\tread_write_OFCMD0: 'h%0h\n\tread_write_OFRESP0: 'h%0h\n\tRST: 'h%0h",
			super.convert2string(),
			read_only_A0,
			read_only_SI0,
			read_only_SC0,
			read_only_REQCMD0,
			read_only_REQRESP0,
			read_only_Q0,
			read_only_IFCMD0,
			read_only_IFRESP0,
			read_write_A0,
			read_write_SI0,
			read_write_SC0,
			read_write_REQCMD0,
			read_write_REQRESP0,
			read_write_Q0,
			read_write_IFCMD0,
			read_write_IFRESP0,
			read_write_D0,
			read_write_OFCMD0,
			read_write_OFRESP0,
			RST );
		return s;
	endfunction: convert2string

	// Customize what gets printed or sprinted, use the uvm_printer policy classes.
	function void do_print( uvm_printer printer );
		super.do_print( printer );
		if ( printer != null ) begin
			printer.print_int( "read_only_A0", read_only_A0, $bits(read_only_A0) );
			printer.print_int( "read_only_SI0", read_only_SI0, $bits(read_only_SI0) );
			printer.print_int( "read_only_SC0", read_only_SC0, $bits(read_only_SC0) );
			printer.print_int( "read_only_REQCMD0", read_only_REQCMD0, $bits(read_only_REQCMD0) );
			printer.print_int( "read_only_REQRESP0", read_only_REQRESP0, $bits(read_only_REQRESP0) );
			printer.print_int( "read_only_Q0", read_only_Q0, $bits(read_only_Q0) );
			printer.print_int( "read_only_IFCMD0", read_only_IFCMD0, $bits(read_only_IFCMD0) );
			printer.print_int( "read_only_IFRESP0", read_only_IFRESP0, $bits(read_only_IFRESP0) );
			printer.print_int( "read_write_A0", read_write_A0, $bits(read_write_A0) );
			printer.print_int( "read_write_SI0", read_write_SI0, $bits(read_write_SI0) );
			printer.print_int( "read_write_SC0", read_write_SC0, $bits(read_write_SC0) );
			printer.print_int( "read_write_REQCMD0", read_write_REQCMD0, $bits(read_write_REQCMD0) );
			printer.print_int( "read_write_REQRESP0", read_write_REQRESP0, $bits(read_write_REQRESP0) );
			printer.print_int( "read_write_Q0", read_write_Q0, $bits(read_write_Q0) );
			printer.print_int( "read_write_IFCMD0", read_write_IFCMD0, $bits(read_write_IFCMD0) );
			printer.print_int( "read_write_IFRESP0", read_write_IFRESP0, $bits(read_write_IFRESP0) );
			printer.print_int( "read_write_D0", read_write_D0, $bits(read_write_D0) );
			printer.print_int( "read_write_OFCMD0", read_write_OFCMD0, $bits(read_write_OFCMD0) );
			printer.print_int( "read_write_OFRESP0", read_write_OFRESP0, $bits(read_write_OFRESP0) );
			printer.print_int( "RST", RST, $bits(RST) );
		end
	endfunction: do_print

	// Support the viewing of data objects as transactions in a waveform GUI.
	function void do_record( uvm_recorder recorder );
		super.do_record( recorder );
		`uvm_record_field( "read_only_A0", read_only_A0 )
		`uvm_record_field( "read_only_SI0", read_only_SI0 )
		`uvm_record_field( "read_only_SC0", read_only_SC0 )
		`uvm_record_field( "read_only_REQCMD0", read_only_REQCMD0 )
		`uvm_record_field( "read_only_REQRESP0", read_only_REQRESP0 )
		`uvm_record_field( "read_only_Q0", read_only_Q0 )
		`uvm_record_field( "read_only_IFCMD0", read_only_IFCMD0 )
		`uvm_record_field( "read_only_IFRESP0", read_only_IFRESP0 )
		`uvm_record_field( "read_write_A0", read_write_A0 )
		`uvm_record_field( "read_write_SI0", read_write_SI0 )
		`uvm_record_field( "read_write_SC0", read_write_SC0 )
		`uvm_record_field( "read_write_REQCMD0", read_write_REQCMD0 )
		`uvm_record_field( "read_write_REQRESP0", read_write_REQRESP0 )
		`uvm_record_field( "read_write_Q0", read_write_Q0 )
		`uvm_record_field( "read_write_IFCMD0", read_write_IFCMD0 )
		`uvm_record_field( "read_write_IFRESP0", read_write_IFRESP0 )
		`uvm_record_field( "read_write_D0", read_write_D0 )
		`uvm_record_field( "read_write_OFCMD0", read_write_OFCMD0 )
		`uvm_record_field( "read_write_OFRESP0", read_write_OFRESP0 )
		`uvm_record_field( "RST", RST )
	endfunction: do_record

endclass: codasip_memory_mem_t_transaction

