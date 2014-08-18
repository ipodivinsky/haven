/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Wed Jun 18 14:16:23 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_platform_ca_t_gm'.
 */

// Represents the golden model of the processor used to predict results of the DUT.
class codix_risc_platform_ca_t_gm extends uvm_component;

	// registration of component tools
	`uvm_component_utils( codix_risc_platform_ca_t_gm )

	// return codes from the golden reference model
	typedef enum 
	{
		SIM_OK,
		SIM_HALT,
		SIM_FAIL,
		DSM_OK,
		DSM_DONE,
		ASM_DONE,
		ASM_OK,
		CSIM_OK,
		CSIM_DONE,
		CSIM_FAIL,
		TSIM_OK,
		TSIM_DONE,
		TSIM_FAIL,
		INSTPARSER_OK,
		INSTPARSER_DONE,
		INSTPARSER_INVALIDCODE,
		INSTPARSER_INSTRTOOSHORT,
		INSTGENERATOR_DONE,
		INSTGENERATOR_OK,
		INSTGENERATOR_FAIL,
		DEBUNDLE_OK,
		DEBUNDLE_DONE,
		DEBUNDLE_FAIL,
		DEBUNDLE_NOTENOUGHDATA
	} sim_codes_e;

	// analysis port(s) to send GM outputs to the scoreboard(s)
	uvm_analysis_port #(codix_risc_ca_t_transaction) codix_risc_ca_t_analysis_port;
	uvm_analysis_port #(codix_risc_platform_ca_t_transaction) codix_risc_platform_ca_t_analysis_port;
	// analysis export(s) to receive input transactions from driver(s)
	uvm_analysis_export #(codix_risc_ca_t_transaction) codix_risc_ca_t_analysis_export;
	uvm_analysis_export #(codix_risc_platform_ca_t_transaction) codix_risc_platform_ca_t_analysis_export;

	// private members

	// analysis queue(s) to store transactions from the driver(s)
	local uvm_tlm_analysis_fifo #(codix_risc_ca_t_transaction) m_codix_risc_ca_t_fifo_h;
	local uvm_tlm_analysis_fifo #(codix_risc_platform_ca_t_transaction) m_codix_risc_platform_ca_t_fifo_h;
	// indications whether there is an agent or not
	local bit m_has_codix_risc_ca_t_agent = 0;
	local bit m_has_codix_risc_platform_ca_t_agent = 0;
	// active/passive configuration for every needed agent
	local uvm_active_passive_enum m_codix_risc_ca_t_agent_active = UVM_PASSIVE;
	local uvm_active_passive_enum m_codix_risc_platform_ca_t_agent_active = UVM_PASSIVE;

	// handle used to control the simulator
	local int m_sim_handler;
	// return value of the golden reference model (IA simulator)
	local sim_codes_e m_sim_code;
	// number of cycles needed to finish program
	local longint unsigned m_cycle_count;

	// standard UVM interface

	// Constructor - creates new instance of this class
	function new( string name = "m_codix_risc_platform_ca_t_gm_h", uvm_component parent = null );
		super.new( name, parent );
		m_sim_code = SIM_OK;
		m_cycle_count = 0;
		// create the golden reference model (simulator)
		m_sim_handler = codix_risc_platform_ia_constructor();
		// reset the golden reference model
		codix_risc_platform_ia_reset( m_sim_handler );
	endfunction: new

	// Build - instantiates child components
	function void build_phase( uvm_phase phase );
		super.build_phase( phase );
		codix_risc_ca_t_analysis_port = new( "codix_risc_ca_t_analysis_port", this );
		codix_risc_ca_t_analysis_export = new( "codix_risc_ca_t_analysis_export", this );
		m_codix_risc_ca_t_fifo_h = new( "m_codix_risc_ca_t_fifo_h", this );
		codix_risc_platform_ca_t_analysis_port = new( "codix_risc_platform_ca_t_analysis_port", this );
		codix_risc_platform_ca_t_analysis_export = new( "codix_risc_platform_ca_t_analysis_export", this );
		m_codix_risc_platform_ca_t_fifo_h = new( "m_codix_risc_platform_ca_t_fifo_h", this );
	endfunction: build_phase

	// Connect - create interconnection between child components
	function void connect_phase( uvm_phase phase );
		super.connect_phase( phase );
		codix_risc_ca_t_analysis_export.connect( m_codix_risc_ca_t_fifo_h.analysis_export );
		codix_risc_platform_ca_t_analysis_export.connect( m_codix_risc_platform_ca_t_fifo_h.analysis_export );
	endfunction: connect_phase

	// Elaboration - detect agent configuration to known its state (active/passive)
	// the configuration could have been added after the connect phase of the golden model
	function void end_of_elaboration_phase( uvm_phase phase );
		uvm_port_list port_list;
		super.end_of_elaboration_phase( phase );
		// configuration for 'codix_risc_platform_ca_codix_risc'
		codix_risc_ca_t_analysis_export.get_provided_to( port_list );
		m_has_codix_risc_ca_t_agent = port_list.size() || codix_risc_ca_t_analysis_port.size();
		m_codix_risc_ca_t_agent_active = ( port_list.size()
			? UVM_ACTIVE
			: UVM_PASSIVE );
		// configuration for 'codix_risc_platform_ca'
		codix_risc_platform_ca_t_analysis_export.get_provided_to( port_list );
		m_has_codix_risc_platform_ca_t_agent = port_list.size() || codix_risc_platform_ca_t_analysis_port.size();
		m_codix_risc_platform_ca_t_agent_active = ( port_list.size()
			? UVM_ACTIVE
			: UVM_PASSIVE );
	endfunction: end_of_elaboration_phase

	// Run - start the simulator
	task run_phase( uvm_phase phase );
		// declare local transactions
		codix_risc_ca_t_transaction codix_risc_platform_ca_codix_risc_h = new;
		codix_risc_platform_ca_t_transaction codix_risc_platform_ca_h = new;
		// load executables for every ASIP instance
		$cast( m_sim_code, codix_risc_platform_ia_codix_risc_load_executable( m_sim_handler,
			codasip_get_executable_path("codix_risc")) );
		if ( m_sim_code != SIM_OK ) begin
			`uvm_fatal( "gold:", "Failed to load executable for ASIP instance: 'codix_risc'" )
		end
		// now start the simulator
		while ( m_sim_code == SIM_OK ) begin
			// previous step finished without error/halt, can make another step
			// process inputs for the 'codix_risc_platform_ca_codix_risc'
			if ( (m_has_codix_risc_ca_t_agent) && (m_codix_risc_ca_t_agent_active == UVM_ACTIVE) ) begin
				// make request for a new input stimuli
				m_codix_risc_ca_t_fifo_h.get( codix_risc_platform_ca_codix_risc_h );
				// set all unconnected input/inout ports
				codix_risc_platform_ia_codix_risc_set_irq( m_sim_handler, codix_risc_platform_ca_codix_risc_h.irq );
			end
			// 'codix_risc_platform_ca' does not contain any input ports
			// no transaction requests will be made
			// make one step with the golden reference model
			$cast( m_sim_code, codix_risc_platform_ia_clock_cycle(m_sim_handler) );
			++m_cycle_count;
			// process results from 'codix_risc_platform_ca_codix_risc'
			if ( m_has_codix_risc_ca_t_agent ) begin
				// create deep copy to store outputs
				codix_risc_ca_t_transaction cloned_item;
				if ( !$cast(cloned_item, codix_risc_platform_ca_codix_risc_h.clone()) ) begin
					`uvm_fatal( {get_type_name(), ":run_phase"}, "Failed to clone transaction!" )
				end
				cloned_item.set_name( "gold_codix_risc_platform_ca_codix_risc" );
				// pickup values on output/inout ports
				codix_risc_platform_ia_codix_risc_get_port_halt( m_sim_handler, cloned_item.port_halt );
				codix_risc_platform_ia_codix_risc_get_port_out( m_sim_handler, cloned_item.port_out );
				codix_risc_platform_ia_codix_risc_get_port_out_en( m_sim_handler, cloned_item.port_out_en );
				codix_risc_platform_ia_codix_risc_get_port_error( m_sim_handler, cloned_item.port_error );
				// and send them to the scoreboard
				codix_risc_ca_t_analysis_port.write( cloned_item );
			end
			// 'codix_risc_platform_ca' does not contain any output ports
			// no results will be send to the scoreboard
		end
		`uvm_info( "gold:", $sformatf("Golden model finished after %0d cycles with exit code: %s.", m_cycle_count, m_sim_code.name()), UVM_MEDIUM )
	endtask: run_phase

	// Report - generate final report (success/failure)
	function void report_phase( uvm_phase phase );
		`uvm_info( CODASIP_REPORT_GOLD_STATUS, $sformatf("%0d", m_sim_code == SIM_HALT), UVM_NONE )
		`uvm_info( CODASIP_REPORT_GOLD_CYCLES, $sformatf("%0d", m_cycle_count), UVM_NONE )
	endfunction: report_phase

	// Final - destroy created golden reference model (simulator)
	function void final_phase( uvm_phase phase );
		codix_risc_platform_ia_destructor( m_sim_handler );
	endfunction: final_phase

	// additional function definitions

	// Peek - immediately read value of one register file element
	// \param addr address to the register file
	function automatic logic [31:0] codix_risc_ca_core_regs_t_peek( input logic [4:0] addr );
		logic [31:0] value;
		// read value from the golden model
		codix_risc_platform_ia_codix_risc_get_regs( m_sim_handler, value, addr );
		return value;
	endfunction: codix_risc_ca_core_regs_t_peek

	// Peek - immediately read the whole word from memory
	// \param addr the address must be aligned
	function automatic logic [31:0] codasip_memory_mem_t_peek( input logic [18:0] addr );
		logic [31:0] value;
		// read value from the golden model
		codix_risc_platform_ia_get_mem( m_sim_handler, value, addr );
		return value;
	endfunction: codasip_memory_mem_t_peek

	// Get - access return code of the simulator
	function automatic sim_codes_e get_sim_code();
		return m_sim_code;
	endfunction: get_sim_code

	// Get - return number of executed cycles
	function longint unsigned get_cycle_count();
		return m_cycle_count;
	endfunction: get_cycle_count

endclass: codix_risc_platform_ca_t_gm
