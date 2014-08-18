/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  UVM top module of the verification environment
 */

// The topmost encapsulation level of the verification
module top;

	import uvm_pkg::*;
	import sv_param_pkg::*;
	import sv_codix_risc_ca_core_regs_t_agent_pkg::*;
	import sv_codix_risc_ca_core_main_instr_hw_instr_hw_t_agent_pkg::*;
	import sv_codix_risc_ca_t_agent_pkg::*;
	import sv_codasip_memory_mem_t_agent_pkg::*;
	import sv_codix_risc_platform_ca_t_agent_pkg::*;
	import sv_codix_risc_platform_ca_t_env_pkg::*;
	import sv_codix_risc_platform_ca_t_test_pkg::*;
	// Reset and clock signals
	logic CLK;
	logic RST;
	// DUT instance
	DUT dut( CLK, RST );

	// clock generation
	initial begin
		CLK <= 'b0;
		#(CLK_PERIOD/2) forever #(CLK_PERIOD/2) CLK = ~CLK;
	end

	// reset at the start of the simulation
	initial begin
		RST <= 'b0;
		@( posedge CLK );
		@( negedge CLK );
		RST <= ~RST;
	end

	// customize the default printer
	initial begin
		automatic uvm_table_printer printer = new;
		printer.knobs.begin_elements = -1;
		printer.knobs.value_width = -1;
		uvm_default_printer = printer;
		$timeformat(-9, 3, " ns", 8);
	end

	// set interfaces in configuration space and run default test
	initial begin
		uvm_config_db #( codix_risc_ca_core_regs_t_itf_wrapper_base )::set( null,
			"uvm_test_top",
			"codix_risc_platform_ca_codix_risc_core_regs_if",
			dut.codix_risc_platform_ca_codix_risc_core_regs_if.m_vif_wrapper_h );
		uvm_config_db #( codix_risc_ca_core_main_instr_hw_instr_hw_t_itf_wrapper_base )::set( null,
			"uvm_test_top",
			"codix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw_if",
			dut.codix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw_if.m_vif_wrapper_h );
		uvm_config_db #( codix_risc_ca_t_itf_wrapper_base )::set( null,
			"uvm_test_top",
			"codix_risc_platform_ca_codix_risc_if",
			dut.codix_risc_platform_ca_codix_risc_if.m_vif_wrapper_h );
		uvm_config_db #( codasip_memory_mem_t_itf_wrapper_base )::set( null,
			"uvm_test_top",
			"codix_risc_platform_ca_mem_if",
			dut.codix_risc_platform_ca_mem_if.m_vif_wrapper_h );
		uvm_config_db #( ihalt_itf_wrapper_base )::set( null,
			"uvm_test_top",
			"ihalt_if",
			dut.ihalt_if.m_vif_wrapper_h );
		uvm_config_db #( codix_risc_platform_ca_t_itf_wrapper_base )::set( null,
			"uvm_test_top",
			"codix_risc_platform_ca_if",
			dut.codix_risc_platform_ca_if.m_vif_wrapper_h );
		// start of the simulation
		run_test( "codix_risc_platform_ca_t_test" );
	end
endmodule: top
