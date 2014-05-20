/* *****************************************************************************
 * Project Name: Software Framework for Functional Verification 
 * File Name:    fl_gen_input_controller
 * Description:  Input Controller of Generated FrameLink Class
 * Author:       Marcela Simkova <xsimko03@stud.fit.vutbr.cz> 
 * Date:         27.2.2011 
 * ************************************************************************** */

 import dpi_mi32_wrapper_pkg::*;
 
 class FrameLinkGenInputController #(int pDataWidth=32, int pDremWidth=2, 
                                     tGenInput gen_input, 
                                     tGenOutput gen_output
                                     )
       extends GenInputController;
   
   /*
    * Public Class Atributes
    */ 
    
    //! Transaction format
    FrameLinkTransaction                       flBlueprint; 
    //! Software driver   
    FrameLinkDriver #(pDataWidth, pDremWidth)  swFlDriver;   
    //! Hardware sender                        
    FrameLinkSender #(pDataWidth)              hwFlSender; 
    
    //! FrameLink interface
    virtual iFrameLinkRx #(pDataWidth,pDremWidth) fl;
    
   /*
    * Public Class Methods
    */ 
    
   /*! 
    * Constructor 
    * 
    * \param frameParts  - count of FrameLink frame parts
    * \param partSizeMax - maximal size of FrameLink frame part        
    * \param partSizeMin - minimal size of FrameLink frame part    
    */    
    function new (string inst, tFramework framework, tTransMbx inputMbx,
                  tTransMbx genMbx,
                  int frameParts, int partSizeMax[], int partSizeMin[],
                  byte btDelayEn_wt, byte btDelayDi_wt, 
                  byte btDelayLow, byte btDelayHigh,
                  byte itDelayEn_wt, byte itDelayDi_wt, 
                  byte itDelayLow, byte itDelayHigh,
                  virtual iFrameLinkRx #(pDataWidth,pDremWidth) fl
                 ); 
      
      super.new(inst, framework, inputMbx, genMbx);
      
      this.fl       = fl;
      
      //! Create generator
      generator     = new("FrameLink Generator", gen_input, gen_output, -1, transMbx, genMbx);
          
      //! Create blueprint transaction
      flBlueprint   = new();
      
      flBlueprint.dataWidth     = pDataWidth/8;
      
      flBlueprint.frameParts    = frameParts;
      flBlueprint.partSizeMax   = partSizeMax;
      flBlueprint.partSizeMin   = partSizeMin;
      
      flBlueprint.btDelayEn_wt  = btDelayEn_wt;
      flBlueprint.btDelayDi_wt  = btDelayDi_wt;
      flBlueprint.btDelayLow    = btDelayLow;
      flBlueprint.btDelayHigh   = btDelayHigh;
            
      flBlueprint.itDelayEn_wt  = itDelayEn_wt;
      flBlueprint.itDelayDi_wt  = itDelayDi_wt;
      flBlueprint.itDelayLow    = itDelayLow;
      flBlueprint.itDelayHigh   = itDelayHigh;
            
      generator.blueprint       = flBlueprint;
      
      //! Create software driver
      swFlDriver   = new("Software FrameLink Driver", 0, transMbx, fl); 
           
      //! Create hardware sender
      hwFlSender   = new("Hardware FrameLink Sender", 0, transMbx, inputMbx); 
	  
	  $write("INPUT_CONTROLLER\n");
    endfunction: new  
    
   /*! 
    * Set Callback - callback object into List 
    */
    virtual function void setCallbacks(InputCbs cbs);
      priority case (framework)
        SW_FULL     : swFlDriver.setCallbacks(cbs); 
        SW_DES_HW_G : swFlDriver.setCallbacks(cbs);
        SW_ES_HW_GD : swFlDriver.setCallbacks(cbs);
        SW_GES_HW_D : hwFlSender.setCallbacks(cbs); 
        HW_FULL     : $write("Not possible to set callbacks in this framework version!!!\n");
      endcase
    endfunction : setCallbacks 
    
   /*!
    * Start controller's activity
    */
    task start();
      priority case (framework)
        SW_FULL     : swFlDriver.setEnabled();
        SW_DES_HW_G : swFlDriver.setEnabled();
        SW_ES_HW_GD : swFlDriver.setEnabled();
        SW_GES_HW_D : hwFlSender.sendStart();
        HW_FULL     : $write("Not possible to send start in this framework version!!!\n");
      endcase  
    endtask : start
    
   /*!
    * Stop controller's activity
    */     
    task stop();
      priority case (framework)
        SW_FULL     : swFlDriver.setDisabled();
        SW_DES_HW_G : swFlDriver.setDisabled();
        SW_ES_HW_GD : begin
                        swFlDriver.setDisabled();
                        sendStop();
                      end  
        SW_GES_HW_D : hwFlSender.sendStop();
        HW_FULL     : sendStop();
      endcase 
    endtask : stop   
   
   /*!
    * Wait for written number of clocks 
    */     
    task waitFor(input int clocks);
      priority case (framework)
        SW_FULL     : swFlDriver.sendWait(clocks);
        SW_DES_HW_G : swFlDriver.sendWait(clocks);
        SW_ES_HW_GD : $write("Not possible to send wait in this framework version!!!\n");
        SW_GES_HW_D : hwFlSender.sendWait(clocks);
        HW_FULL     : $write("Not possible to send wait in this framework version!!!\n");
      endcase 
    endtask : waitFor
    
   /*! 
    * Wait forever
    */     
    task waitForever();
      priority case (framework)
        SW_FULL     : swFlDriver.setDisabled(); 
        SW_DES_HW_G : swFlDriver.setDisabled(); 
        SW_ES_HW_GD : $write("Not possible to send wait forever in this framework version!!!\n");
        SW_GES_HW_D : hwFlSender.sendWaitForever();
        HW_FULL     : $write("Not possible to send wait forever in this framework version!!!\n");
      endcase 
    endtask : waitForever    
   
   /*!
    * Send generated transaction 
    */
    task sendGenerated(int unsigned transCount);
      //! run generator
      if (framework == HW_FULL) generator.initiateHW(transCount);
      else generator.setEnabled(transCount);
      
      if (gen_output != EXT_FILE_OUT) begin
        priority case (framework)
          SW_FULL     : swFlDriver.sendTransactions(transCount); 
          SW_DES_HW_G : swFlDriver.sendTransactions(transCount); 
          SW_ES_HW_GD : swFlDriver.sendCallbackData(transCount); 
          SW_GES_HW_D : hwFlSender.sendTransactions(transCount); 
          HW_FULL     : $write("HW FULL version is running!\n");
        endcase 
      end    
    endtask : sendGenerated 
    
   /*!
    * Send stop - send stop to HW, flush data from buffers in HW
    */
    task sendStop();
      logic [31:0] counter;
      logic [31:0] run;
      logic [31:0] hw_addr_counter = 32'h01101004;
      logic [31:0] hw_addr_stop    = 32'h01200000;
      logic [31:0] hw_addr_start   = 32'h01101000;
      
      // check if hw was initialized already
      do begin
       //$write("waiting for hw init\n");
       c_readFromRegister(hw_addr_start, run);
       @(fl.cb); 
      end while (run[0] != 1);
      
      // check if all transactions were processed in HW
      do begin
       //$write("waiting during running\n");
       c_readFromRegister(hw_addr_counter, counter);
       //$write("FL_GEN_INPUT_CTRL: stop counter: %d\n", counter);
       @(fl.cb); 
      end while (counter != 0);
      
      // flush remaining data from HW buffers
      c_writeToRegister(hw_addr_stop, 32'h00000001); 
    endtask : sendStop   
    
   /*!
    * Check scoreboard state in HW version.
    * !!! BUDE TREBA LEPSIE OSETRIT VSETKY STAVY SCOREBOARDU:
    *     - malo transakcii v scoreboarde (nie transCount)
    *     - nieco zostane visiet v scoreboarde 
    */     
    task checkScoreboard(int unsigned transCount);
      logic [31:0] hw_addr_scoreb  = 32'h01300004;
      int no_change; // change of scoreboard counter during verification run
      logic [31:0] old_counter;
      logic [31:0] counter = 0;
      
      // if the number of transactions processed in HW scoreboard is the same as
      // requested, stop computation and print the scoreboard table
      do begin
       old_counter = counter;
      
       //$write("waiting during scoreboarding\n");
       c_readFromRegister(hw_addr_scoreb, counter);
       $write("scoreboard counter: %d\n", counter);
      
       // more transaction were accepted (this could happen because HW is fast)
       if (counter > transCount) begin
         $write("1: SCOREBOARD OVERFILLED!!!\n");
         $write("END TIME: ");
         $system("date +%s.%N");
         $stop;
       end
       
       // if counter doesnt change for a long time, stop simulation
       if (counter == old_counter) no_change++;
       if (no_change > 0) begin
         $write("FEW TRANSACTIONS RECEIVED IN SCOREBOARD %d!!!\n", counter);
         $write("END TIME: ");
         $system("date +%s.%N");
         $stop;
       end
                            
       @(fl.cb); 
      end while (counter < transCount);
      
      // check if the scoreboard is not overfilled
      c_readFromRegister(hw_addr_scoreb, counter);
      if (counter > transCount) begin
        $write("2: SCOREBOARD OVERFILLED!!!\n");
        $write("END TIME: ");
        $system("date +%s.%N");
        $stop;
      end
      
      $write("------------------------------------------------------------\n");
      $write("-- TRANSACTION TABLE\n");
      $write("------------------------------------------------------------\n");
      $write("Items added: %d\n", transCount);
      $write("Items removed: %d\n", transCount);
      $write("\n");
      $write("------------------------------------------------------------\n");
    endtask : checkScoreboard
    
 endclass : FrameLinkGenInputController
  
  
 

  