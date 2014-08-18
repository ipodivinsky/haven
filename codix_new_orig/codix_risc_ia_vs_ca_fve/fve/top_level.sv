/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Wed Jun 18 14:16:23 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  UVM top module of the verification environment
 */

// The topmost encapsulation level of the verification
module top;

	import uvm_pkg::*;
	import sv_param_pkg::*;
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
		uvm_config_db #( virtual icodix_risc_ca_core_regs_t )::set( null,
			"uvm_test_top",
			"codix_risc_platform_ca_codix_risc_core_regs_if",
			dut.codix_risc_platform_ca_codix_risc_core_regs_if );
		uvm_config_db #( virtual icodix_risc_ca_core_main_instr_hw_instr_hw_t )::set( null,
			"uvm_test_top",
			"codix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw_if",
			dut.codix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw_if );
		uvm_config_db #( virtual icodix_risc_ca_t )::set( null,
			"uvm_test_top",
			"codix_risc_platform_ca_codix_risc_if",
			dut.codix_risc_platform_ca_codix_risc_if );
		uvm_config_db #( virtual icodasip_memory_mem_t )::set( null,
			"uvm_test_top",
			"codix_risc_platform_ca_mem_if",
			dut.codix_risc_platform_ca_mem_if );
		uvm_config_db #( virtual ihalt )::set( null,
			"uvm_test_top",
			"ihalt_if",
			dut.ihalt_if );
		uvm_config_db #( virtual icodix_risc_platform_ca_t )::set( null,
			"uvm_test_top",
			"codix_risc_platform_ca_if",
			dut.codix_risc_platform_ca_if );
		// start of the simulation
		run_test( "codix_risc_platform_ca_t_test" );
	end
endmodule: top
