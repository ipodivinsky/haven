/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Wed Jun 18 14:16:23 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_platform_ca_t_sequence'.
 */

// This class represents UVM sequence of random input transactions for DUT/DUV.
class codix_risc_platform_ca_t_sequence extends uvm_sequence #(codix_risc_platform_ca_t_transaction);

	// registration of object tools
	`uvm_object_utils( codix_risc_platform_ca_t_sequence )

	// member attributes, equivalent with interface ports

	// default constrains for each input interface port

	// Constructor - creates new instance of this class
	function new( string name = "codix_risc_platform_ca_t_sequence" );
		super.new( name );
	endfunction: new

	// body - implements behavior of the sequence (unidirectional)
	task body();
		codix_risc_platform_ca_t_transaction item;
		// initialize PRNG
		this.srandom( SEED );
		repeat ( TRANSACTION_COUNT ) begin
			if ( !this.randomize() ) begin
				`uvm_error( "body:", "Failed to randomize!" )
			end
			// create item using the factory
			item = codix_risc_platform_ca_t_transaction::type_id::create( "item" );
			// blocks until the sequencer grants the sequence access to the driver
			start_item( item );
			// prepare item to be used (assign randomized data)
			// block until the driver has completed its side of the transfer protocol
			finish_item( item );
		end
	endtask: body

endclass: codix_risc_platform_ca_t_sequence

