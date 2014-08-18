/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Wed Jun 18 14:16:23 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the 'sv_codix_risc_ca_t_env_pkg' package.
 */

package sv_codix_risc_ca_t_env_pkg;
	import uvm_pkg::*;
	import sv_param_pkg::*;
	import sv_codix_risc_ca_core_regs_t_agent_pkg::*;
	import sv_codix_risc_ca_core_main_instr_hw_instr_hw_t_agent_pkg::*;
	import sv_codix_risc_ca_t_agent_pkg::*;
	import sv_codix_risc_platform_ca_t_gm_pkg::*;

	`include "uvm_macros.svh"
	`include "config.svh"
	`include "scoreboard.svh"
	`include "env.svh"
endpackage: sv_codix_risc_ca_t_env_pkg