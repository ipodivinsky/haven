/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Wed Jun 18 14:16:23 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_ca_t_scoreboard'.
 */

// analysis implementations to support input from many places
`uvm_analysis_imp_decl( _dut )
`uvm_analysis_imp_decl( _gold )

// This class receives transactions from the driver and performs transformation of these transactions into the form of expected responses according to the specification. Afterwards, it receives transactions from the monitor and automatically compares these real responses with the expected ones.
class codix_risc_ca_t_scoreboard extends uvm_scoreboard;

	// registration of component tools
	`uvm_component_utils( codix_risc_ca_t_scoreboard )

	// analysis components
	uvm_analysis_imp_dut #(codix_risc_ca_t_transaction, codix_risc_ca_t_scoreboard) dut_analysis_export;
	uvm_analysis_imp_gold #(codix_risc_ca_t_transaction, codix_risc_ca_t_scoreboard) gold_analysis_export;
	// local queues to store all transactions
	local codix_risc_ca_t_transaction m_dut_fifo[$];
	local codix_risc_ca_t_transaction m_gold_fifo[$];
	// golden reference model handle also assigned by parent component
	codix_risc_platform_ca_t_gm m_gold_h;
	// stores the final report message
	local string m_report_msg;

	// standard UVM interface

	// Constructor - creates new instance of this class
	function new( string name = "m_scoreboard_h", uvm_component parent = null );
		super.new( name, parent );
	endfunction: new

	// Build - instantiates child components
	function void build_phase( uvm_phase phase );
		super.build_phase( phase );
		dut_analysis_export = new( "dut_analysis_export", this );
		gold_analysis_export = new( "gold_analysis_export", this );
	endfunction: build_phase

	// Write - store all transactions from DUT ports
	function void write_dut( codix_risc_ca_t_transaction t );
		// TODO uncomment when check function is implemented
		// m_dut_fifo.push_back( t );
	endfunction: write_dut

	// Write - store all transaction from golden reference model ports
	function void write_gold( codix_risc_ca_t_transaction t );
		// TODO uncomment when check function is implemented
		// m_gold_fifo.push_back( t );
	endfunction: write_gold

	// Check - compare DUT and golden reference model
	function void check_phase( uvm_phase phase );
		// TODO insert your code here to compare output ports
		// the function may look like this
		int unsigned miscompares = 0;
		if ( m_gold_fifo.size() != m_dut_fifo.size() ) begin
			`uvm_fatal( "check:", $sformatf("Different number of output transactions: DUT=%0d, gold=%0d.",
				m_dut_fifo.size(),
				m_gold_fifo.size()) )
		end
		foreach ( m_gold_fifo[ii] ) begin
			// generate error message for miscompare
			if ( !m_gold_fifo[ii].compare(m_dut_fifo[ii]) ) begin
				string msg;
`ifdef FORCE_USE_OF_UVM_COMPARISON_POLICY
				msg = uvm_default_comparer.miscompares.substr( 0, 
					uvm_default_comparer.miscompares.len() -2 );
`else
				msg = $sformatf( "Miscompare for the gold and DUT ports!\ngolden reference model:\n%s\nDUT:\n%s\n",
					m_gold_fifo[ii].sprint(),
					m_dut_fifo[ii].sprint() );
`endif
				miscompares += 1;
				if ( miscompares <= MAX_ERROR_COUNT ) begin
					$sformat( m_report_msg, "%s\n%t: %s", m_report_msg, $time, msg );
				end
			end
		end
		if ( miscompares == 0 ) begin
			`uvm_info( "check:", $sformatf("The result for '%s' is OK, %0d/%0d miscompared output transactions!",
				codasip_get_codal_name(this),
				miscompares,
				m_dut_fifo.size()),
				UVM_MEDIUM )
		end else begin
			`uvm_info( "check:", $sformatf("The result for '%s' is WRONG!", codasip_get_codal_name(this)), UVM_MEDIUM )
		end
	endfunction: check_phase

	// Report - generate final report (success/failure)
	function void report_phase( uvm_phase phase );
		`uvm_info( CODASIP_REPORT_STATUS, m_report_msg, UVM_NONE )
	endfunction: report_phase

endclass: codix_risc_ca_t_scoreboard

