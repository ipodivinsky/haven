/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_platform_ca_t_coverage'.
 */

// This class measures exercised combinations of DUTs interface ports.
class codix_risc_platform_ca_t_coverage extends uvm_subscriber #(codix_risc_platform_ca_t_transaction);

	// registration of component tools
	`uvm_component_utils( codix_risc_platform_ca_t_coverage )

	// member attributes
	// holds current values of interface pins
	local codix_risc_platform_ca_t_transaction m_transaction_h;

	// Covergroup definition
	covergroup FunctionalCoverage;

		// per instance statistics
		option.detect_overlap = 1;
		option.per_instance = 1;
	endgroup

	// Constructor - creates new instance of this class
	function new( string name = "m_coverage_h", uvm_component parent = null );
		super.new( name, parent );
		FunctionalCoverage = new();
	endfunction: new

	// Build - instantiates child components
	function void build_phase( uvm_phase phase );
		super.build_phase( phase );
	endfunction: build_phase

	// Write - obligatory function, samples value on the interface.
	function void write( codix_risc_platform_ca_t_transaction t );
		// skip invalid transactions
		if ( t.is_valid() ) begin
			m_transaction_h = t;
			FunctionalCoverage.sample();
		end
	endfunction: write

endclass: codix_risc_platform_ca_t_coverage

