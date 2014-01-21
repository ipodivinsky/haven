/* *****************************************************************************
 * Project Name: Genetic Algorithm for ALU
 * File Name:    alu_driver.svh
 * Description:  Driver Class for ALU
 * Authors:      Marcela Simkova <isimkova@fit.vutbr.cz> 
 * Date:         21.1.2014
 * ************************************************************************** */

/*!
 * \brief AluDriver
 * 
 * This class drives the input interface of ALU and supplies transactions from 
 * sequencer to this interface.
 */

 class AluDriver;

  /*! 
   * Virtual interfaces for DUT
   */ 
   
   virtual iAluIn dut_alu_in_if;
  
  /*! 
   * Channels
   */ 
   mailbox #(AluInputTransaction) inputMbx; 
   
   
  /*!
   * Data Members
   */ 
   
  
      
  /*!
   * Methods
   */
   
   // User-defined methods
   extern function void create_structure();
   extern task run();
   extern task waitForAluRdy();
   
 endclass: AluDriver



/*! 
 * Constructor - create and configure
 */ 
 function void AluDriver::create_structure();
   // create analysis port
   
 endfunction: create_structure



/*! 
 * Run - starts driver processing.
 */  
 task AluDriver::run();
   AluInputTransaction alu_in_trans;
   
   $write("\n\n########## DRIVER ##########\n\n");
   
   // synchronise with CLK 
   @(dut_alu_in_if.cb); 
   
   forever begin
     inputMbx.get(alu_in_trans);
     
     // wait for readiness of ALU to process data
     waitForAluRdy();
            
     alu_in_trans.rst = dut_alu_in_if.RST;
     
     // display the content of transaction 
     alu_in_trans.print("DRIVER: ALU_TRANSACTION");
       
     // set input signals of DUT
     // sends values from transaction on the virtual interface
     dut_alu_in_if.cb.ACT   <= alu_in_trans.act;        
     dut_alu_in_if.cb.OP    <= alu_in_trans.op;
     dut_alu_in_if.cb.MOVI  <= alu_in_trans.movi;
     dut_alu_in_if.cb.REG_A <= alu_in_trans.reg_a;
     dut_alu_in_if.cb.REG_B <= alu_in_trans.reg_b;
     dut_alu_in_if.cb.MEM   <= alu_in_trans.mem;
     dut_alu_in_if.cb.IMM   <= alu_in_trans.imm;
     
     // sends generated transaction to the scoreboard, subscriber etc.
     //if (alu_in_trans.act) aport_alu_in_if.write(alu_in_trans);
              
     // synchronise with CLK 
     @(dut_alu_in_if.cb); 
     
   end  
 endtask: run
 
 
 
/*!
 * Wait for ALU_RDY
 */
 task AluDriver::waitForAluRdy();
   while (!dut_alu_in_if.cb.ALU_RDY || dut_alu_in_if.RST) 
     @(dut_alu_in_if.cb); 
 endtask: waitForAluRdy  