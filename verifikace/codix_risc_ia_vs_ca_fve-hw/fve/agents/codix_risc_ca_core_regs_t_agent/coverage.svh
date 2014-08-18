/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_ca_core_regs_t_coverage'.
 */

// This class measures exercised combinations of interface signals.
class codix_risc_ca_core_regs_t_coverage extends uvm_subscriber #(codix_risc_ca_core_regs_t_transaction);

	// registration of component tools
	`uvm_component_utils( codix_risc_ca_core_regs_t_coverage )

	// member attributes
	// holds current values of interface pins
	local codix_risc_ca_core_regs_t_transaction m_transaction_h;

	// Covergroup definition
	covergroup FunctionalCoverage;

		cvp_regs_RA0 : coverpoint m_transaction_h.RA0 {
			option.auto_bin_max = 5;
		}

		cvp_regs_RE0 : coverpoint m_transaction_h.RE0 {
			bins enabled = {1};
			ignore_bins disabled = {0};
		}

		cvp_regs_RA1 : coverpoint m_transaction_h.RA1 {
			option.auto_bin_max = 5;
		}

		cvp_regs_RE1 : coverpoint m_transaction_h.RE1 {
			bins enabled = {1};
			ignore_bins disabled = {0};
		}

		cvp_regs_RA2 : coverpoint m_transaction_h.RA2 {
			option.auto_bin_max = 5;
		}

		cvp_regs_RE2 : coverpoint m_transaction_h.RE2 {
			bins enabled = {1};
			ignore_bins disabled = {0};
		}

		cvp_regs_WA0 : coverpoint m_transaction_h.WA0 {
			option.auto_bin_max = 5;
		}

		cvp_regs_WE0 : coverpoint m_transaction_h.WE0 {
			bins enabled = {1};
			ignore_bins disabled = {0};
		}

		cvp_regs_RA0_valid: cross cvp_regs_RA0, cvp_regs_RE0;

		cvp_regs_RA1_valid: cross cvp_regs_RA1, cvp_regs_RE1;

		cvp_regs_RA2_valid: cross cvp_regs_RA2, cvp_regs_RE2;

		cvp_regs_WA0_valid: cross cvp_regs_WA0, cvp_regs_WE0;

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
	function void write( codix_risc_ca_core_regs_t_transaction t );
		// skip invalid transactions
		if ( t.is_valid() ) begin
			m_transaction_h = t;
			FunctionalCoverage.sample();
		end
	endfunction: write

endclass: codix_risc_ca_core_regs_t_coverage

