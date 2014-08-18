/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_platform_ca_t_test'.
 */

// This is the default UVM test class for codix_risc_platform_ca
class codix_risc_platform_ca_t_test extends codix_risc_platform_ca_t_test_base;

	// registration of component tools
	`uvm_component_utils( codix_risc_platform_ca_t_test )

	// Constructor - creates new instance of this class
	function new( string name = "codix_risc_platform_ca_t_test", uvm_component parent = null );
		super.new( name, parent );
	endfunction: new

	// Build - instantiates child components
	function void build_phase( uvm_phase phase );
		super.build_phase( phase );
	endfunction: build_phase

	// Run - start processing sequences
	task run_phase( uvm_phase phase );
		// prevent the phase from immediate termination
		phase.raise_objection( this );
		fork
			// test is done when halt instruction is detected or
			begin
				m_env_config_h.wait_for_halt();
				// wait one clock for halt unit to end
				m_env_config_h.wait_for_clock();
			end
			// all sequence items have been consumed (time-out)
			// run 'codix_risc_platform_ca' agent
			begin
				if ( (m_env_config_h.has_codix_risc_platform_ca_t_agent) && (
					m_env_config_h.m_codix_risc_platform_ca_t_agent_config_h.active == UVM_ACTIVE) ) begin
					// agent is present and active, can access sequencer
					codix_risc_platform_ca_t_sequence seq;
					seq = codix_risc_platform_ca_t_sequence::type_id::create( "seq" );
					seq.start( m_env_h.m_codix_risc_platform_ca_t_agent_h.m_sequencer_h );
				end else begin
					// agent is not present or is passive, set simulation time limit
					m_env_config_h.wait_for_clock( ITERATION_COUNT_LIMIT );
				end
				// store flag that timeout has been reached
				set_timeout( 1 );
			end
			// run 'codix_risc_platform_ca_codix_risc' agent
			begin
				if ( (m_env_config_h.has_m_codix_risc_env_h) && (
					m_env_config_h.m_codix_risc_env_config_h.has_codix_risc_ca_t_agent) && (
					m_env_config_h.m_codix_risc_env_config_h.m_codix_risc_ca_t_agent_config_h.active == UVM_ACTIVE) ) begin
					// agent is present and active, can access sequencer
					codix_risc_ca_t_sequence seq;
					seq = codix_risc_ca_t_sequence::type_id::create( "seq" );
					seq.start( m_env_h.m_codix_risc_env_h.m_codix_risc_ca_t_agent_h.m_sequencer_h );
				end else begin
					// agent is not present or is passive, set simulation time limit
					m_env_config_h.wait_for_clock( ITERATION_COUNT_LIMIT );
				end
				// store flag that timeout has been reached
				set_timeout( 1 );
			end
		join_any
		// test is done, move to next phase
		phase.drop_objection( this );
	endtask: run_phase

endclass: codix_risc_platform_ca_t_test

