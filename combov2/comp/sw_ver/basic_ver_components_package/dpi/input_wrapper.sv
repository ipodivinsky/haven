/* *****************************************************************************
 * Project Name: Software Framework for Functional Verification 
 * File Name:    Input Wrapper
 * Description: 
 * Author:       Marcela Simkova <xsimko03@stud.fit.vutbr.cz> 
 * Date:         27.2.2011 
 * ************************************************************************** */

 import dpi_wrapper_pkg::*;

/*!
 * This class is responsible for taking NetCOPE transactions from input mailbox
 * and sending them to HW part of the verification environment through DPI
 * layer. Unit must be enabled by "setEnable()" function call. Unit can be 
 * stoped by "setDisable()" function call.  
 */
 class InputWrapper;
   /*
    * Public Class Atributes
    */
    string    inst;      //! Input Wrapper identification
    bit       enabled;   //! Input Wrapper enabling
    bit       busy;      //! Input Wrapper busy signal
    tTransMbx inputMbx;  //! NetCOPE transactions mailbox
        
   /*
    * Public Class Methods
    */

   /*! 
    * Constructor - creates Input Wrapper object  
    *
    * \param inst     - Input Wrapper instance name
    * \param inputMbx - transaction mailbox     
    */     
    function new (string inst, 
                  tTransMbx inputMbx);
      this.inst        = inst;      //! Store wrapper identifier
      this.enabled     = 0;         //! Input Wrapper is disabled by default
      this.busy        = 0;
      this.inputMbx    = inputMbx;  //! Store pointer to mailbox
    endfunction: new          
   
   /*! 
    * Enable Input Wrapper - eable wrapper and runs wrapper process
    */     
    virtual task setEnabled();
      int res;
      enabled = 1;                 //! Wrapper Enabling
      res = c_openDMAChannel();    //! Open DMA Channel 
      $write("OPENING CHANNEL (musi byt 0): %d\n",res);
      fork
        run();                     //! Creating wrapper subprocess
      join_none;  
    endtask : setEnabled
        
   /*! 
    * Disable Input Wrapper
    */      
    virtual task setDisabled();
      int res;
      enabled = 0;                 //! Disable Wrapper
      res = c_closeDMAChannel();   //! Close DMA Channel
      $write("CLOSING CHANNEL (musi byt 0): %d\n",res); 
    endtask : setDisabled

   /*
    * Private Class Methods
    */
   
   /*! 
    * Run Input Wrapper - receives transactions and sends them through DPI to HW
    */
    task run();
      int res;
      Transaction tr;
      NetCOPETransaction ntr;
      
			while (enabled) begin 
        wait(inputMbx.num()!=0) 
        busy = 1;
        inputMbx.get(tr);
		$write("INPUT_WRAPPER");
        //tr.display(); 
        $cast(ntr,tr);
        
        // data transfer to hardware through DMA channel
        res = c_sendData(ntr.data);
        if (res!=0) begin
					$error("SEND DATA in input wrapper failed!!!");
          $finish();
				end	      
				busy = 0;
      end
    endtask : run 
 
 endclass : InputWrapper 
