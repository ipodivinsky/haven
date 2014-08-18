/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Wed Jun 18 14:16:23 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_ca_core_main_instr_hw_instr_hw_t_coverage'.
 */

// This class collects instruction coverage.
class codix_risc_ca_core_main_instr_hw_instr_hw_t_coverage extends uvm_subscriber #(codix_risc_ca_core_main_instr_hw_instr_hw_t_transaction);

	// registration of component tools
	`uvm_component_utils( codix_risc_ca_core_main_instr_hw_instr_hw_t_coverage )

	// member attributes
	// holds current values of interface pins
	local codix_risc_ca_core_main_instr_hw_instr_hw_t_transaction m_transaction_h;

	// Covergroup definition
	covergroup FunctionalCoverage;

		cvp_instructions : coverpoint m_transaction_h.m_instruction;
		// display raw data of invalid instructions, useful for debug
		cvp_invalid_instructions : coverpoint m_transaction_h.id_instr_Q0 iff( m_transaction_h.m_instruction == m_transaction_h.m_instruction.last() ) {
			bins raw_data[] = default;
			option.weight = 0;
		}
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
	function void write( codix_risc_ca_core_main_instr_hw_instr_hw_t_transaction t );
		// skip invalid transactions
		if ( t.is_valid() && (t.ACT == 1) ) begin
			m_transaction_h = t;
			FunctionalCoverage.sample();
		end
	endfunction: write

endclass: codix_risc_ca_core_main_instr_hw_instr_hw_t_coverage

