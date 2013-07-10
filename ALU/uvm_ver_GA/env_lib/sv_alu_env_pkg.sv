/* *****************************************************************************
 * Project Name: HAVEN - Genetic Algorithm
 * File Name:    sv_alu_env_pkg.sv
 * Description:  UVM ALU Verification Environment Package.
 * Authors:      Marcela Simkova <isimkova@fit.vutbr.cz> 
 * Date:         19.4.2013
 * ************************************************************************** */

 package sv_alu_env_pkg;

   // Standard UVM import & include
   import uvm_pkg::*;
   `include "uvm_macros.svh"
  
   // Package imports
   import sv_alu_seq_pkg::*;
   
   // Includes
   `include "alu_agent_config.svh"
   `include "alu_env_config.svh"
   `include "alu_driver.svh"
   `include "alu_monitor.svh"
   `include "alu_agent.svh"
   `include "alu_env.svh"
     
 endpackage