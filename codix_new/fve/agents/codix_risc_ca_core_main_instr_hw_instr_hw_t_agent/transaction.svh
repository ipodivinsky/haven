/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Wed Jun 18 14:16:23 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_ca_core_main_instr_hw_instr_hw_t_transaction'.
 */

// This class represents transaction which contains values of output signals for 'codix_risc_ca_core_main_instr_hw_instr_hw_t_decoder'.
class codix_risc_ca_core_main_instr_hw_instr_hw_t_transaction extends uvm_sequence_item;

	// registration of object tools
	`uvm_object_utils( codix_risc_ca_core_main_instr_hw_instr_hw_t_transaction )

	// Member attributes, equivalent with interface pins
	// make input attributes random
	rand logic ACT;
	rand logic [11:0] id_instr_Q0;
	// enumeration code of the instruction
	codix_risc_ca_core_main_instr_hw_instr_hw_t_decoder::operation_codes_e m_instruction;
	// value of global reset
	logic RST;

	// Constructor - creates new instance of this class
	function new( string name = "codix_risc_ca_core_main_instr_hw_instr_hw_t_transaction" );
		super.new( name );
	endfunction: new

	// Indicates if the transaction is valid for the subscriber or not.
	function bit is_valid();
		return ( (!$isunknown(RST)) && (RST != 0) );
	endfunction: is_valid

	// common UVM functions

	// Properly copy all transaction attributes.
	function void do_copy( uvm_object rhs );
		codix_risc_ca_core_main_instr_hw_instr_hw_t_transaction rhs_;

		if( !$cast(rhs_, rhs) ) begin
			`uvm_fatal( "do_copy:", "Failed to cast transaction object." )
			return;
		end
		// now copy all attributes
		super.do_copy( rhs );
		ACT = rhs_.ACT;
		id_instr_Q0 = rhs_.id_instr_Q0;
		m_instruction = rhs_.m_instruction;
		RST = rhs_.RST;
	endfunction: do_copy

	// Properly compare all transaction attributes representing output pins.
	function bit do_compare( uvm_object rhs, uvm_comparer comparer );
		codix_risc_ca_core_main_instr_hw_instr_hw_t_transaction rhs_;

		if( !$cast(rhs_, rhs) ) begin
			`uvm_error( "do_compare:", "Failed to cast transaction object." )
			return 0;
		end
		// now compare all output attributes
`ifdef FORCE_USE_OF_UVM_COMPARISON_POLICY
		// using UVM comparison policy (slower, but more understandable error message)
		return ( super.do_compare(rhs, comparer) );
`else
		// using simple equivalence operator (faster)
		return ( super.do_compare(rhs, comparer) );
`endif
	endfunction: do_compare

	// Convert transaction into human readable form.
	function string convert2string();
		string s;
		s = $sformatf( "%s\n\tACT: 'h%0h\n\tid_instr_Q0: 'h%0h\n\tRST: 'h%0h",
			super.convert2string(),
			ACT,
			id_instr_Q0,
			RST );
		return s;
	endfunction: convert2string

	// Customize what gets printed or sprinted, use the uvm_printer policy classes.
	function void do_print( uvm_printer printer );
		super.do_print( printer );
		if ( printer != null ) begin
			printer.print_int( "ACT", ACT, $bits(ACT) );
			printer.print_int( "id_instr_Q0", id_instr_Q0, $bits(id_instr_Q0) );
			printer.print_int( "m_instruction", m_instruction, $bits(m_instruction) );
			printer.print_int( "RST", RST, $bits(RST) );
		end
	endfunction: do_print

	// Support the viewing of data objects as transactions in a waveform GUI.
	function void do_record( uvm_recorder recorder );
		super.do_record( recorder );
		`uvm_record_field( "ACT", ACT )
		`uvm_record_field( "id_instr_Q0", id_instr_Q0 )
		`uvm_record_field( "m_instruction", m_instruction )
		`uvm_record_field( "RST", RST )
	endfunction: do_record

endclass: codix_risc_ca_core_main_instr_hw_instr_hw_t_transaction

