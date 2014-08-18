/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the 'sv_codasip_memory_mem_t_agent_pkg' package.
 */

package sv_codasip_memory_mem_t_agent_pkg;
	import uvm_pkg::*;
	import sv_param_pkg::*;
	// import DPI interface to read FLI memory
	import "DPI-C" context function void codasip_dpi_memory_read(
		input string name,
		input int unsigned addr,
		output logic [7:0] data );

	`include "uvm_macros.svh"
	`include "transaction.svh"
	`include "ifc_wrapper.svh"
	`include "config.svh"
	`include "monitor.svh"
	`include "coverage.svh"
	`include "agent.svh"
endpackage: sv_codasip_memory_mem_t_agent_pkg
