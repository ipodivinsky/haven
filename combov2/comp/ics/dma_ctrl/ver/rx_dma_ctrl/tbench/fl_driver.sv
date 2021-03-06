/*
 * fl_driver.sv: FrameLink Driver
 * Copyright (C) 2008 CESNET
 * Author(s): Marek Santa <xsanta06@stud.fit.vutbr.cz>
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 * 3. Neither the name of the Company nor the names of its contributors
 *    may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 * This software is provided ``as is'', and any express or implied
 * warranties, including, but not limited to, the implied warranties of
 * merchantability and fitness for a particular purpose are disclaimed.
 * In no event shall the company or contributors be liable for any
 * direct, indirect, incidental, special, exemplary, or consequential
 * damages (including, but not limited to, procurement of substitute
 * goods or services; loss of use, data, or profits; or business
 * interruption) however caused and on any theory of liability, whether
 * in contract, strict liability, or tort (including negligence or
 * otherwise) arising in any way out of the use of this software, even
 * if advised of the possibility of such damage.
 *
 * $Id: fl_driver.sv 8583 2009-06-01 14:33:57Z xsimko03 $
 *
 * TODO:
 *
 */
 
  // --------------------------------------------------------------------------
  // -- Frame Lik Driver Class
  // --------------------------------------------------------------------------
  /* This class is responsible for generating signals to FrameLink
   * interface. Transactions are received by 'transMbx'(Mailbox) property.
   * Unit must be enabled by "setEnable()" function call. Generation can be
   * stoped by "setDisable()" function call. You can send your custom
   * transaction by calling "sendTransaction" function.
   */
  class FrameLinkDriver #(int pDataWidth=32, int pDremWidth=2, int pFlows = 2, int pPageSize = 4092, int pPageCount = 3);

    // -- Private Class Atributes --
    string    inst;                             // Driver identification
    int       ifcNo;
    bit       enabled;                          // Driver is enabled
    tTransMbx transMbx;                         // Transaction mailbox
    DriverCbs cbs[$];                           // Callbacks list
    virtual iFrameLinkRx.tb #(pDataWidth,pDremWidth) fl;
    tTransInfoMbx transInfoMbx;

    // ----
    rand bit enRxDelay;   // Enable/Disable delays between transactions
      // Enable/Disable delays between transaction (weights)
      int rxDelayEn_wt             = 1; 
      int rxDelayDisable_wt        = 3;

    rand integer rxDelay; // Delay between transactions
      // Delay between transactions limits
      int rxDelayLow          = 0;
      int rxDelayHigh         = 3;
    // ----

    // ----
    rand bit enInsideRxDelay;     // Enable/Disable delays inside transaction
      // Enable/Disable delays inside transaction weights
      int insideRxDelayEn_wt       = 1; 
      int insideRxDelayDisable_wt  = 3;
      // Minimal/Maximal delay between transaction words
      int insideRxDelayLow         = 0;
      int insideRxDelayHigh        = 3;
    // ----
    
    // -- Constrains --
    constraint cDelays {
      enRxDelay dist { 1'b1 := rxDelayEn_wt,
                       1'b0 := rxDelayDisable_wt
                     };

      rxDelay inside {
                      [rxDelayLow:rxDelayHigh]
                     };

      enInsideRxDelay dist { 1'b1 := insideRxDelayEn_wt,
                             1'b0 := insideRxDelayDisable_wt
                     };
      }
    
    
    // -- Public Class Methods --

    // -- Constructor ---------------------------------------------------------
    // Create driver object 
    function new ( string inst, 
                   int ifcNo,      
                   tTransMbx transMbx, 
                   virtual iFrameLinkRx.tb #(pDataWidth,pDremWidth) fl,
                   tTransInfoMbx transInfoMbx
                         );
      this.enabled     = 0;            // Driver is disabled by default
      this.ifcNo       = ifcNo;        // Store number of connected interface
      this.fl          = fl;           // Store pointer interface 
      this.transMbx    = transMbx;     // Store pointer to mailbox
      this.inst        = inst;         // Store driver identifier
      this.transInfoMbx = transInfoMbx;    // Mailbox to share header length

      this.fl.cb.DATA      <= 0;
      this.fl.cb.DREM      <= 0;
      this.fl.cb.SOF_N     <= 1;
      this.fl.cb.EOF_N     <= 1;
      this.fl.cb.SOP_N     <= 1;
      this.fl.cb.EOP_N     <= 1;
      this.fl.cb.SRC_RDY_N <= 1;
    endfunction: new  
    
    
    // -- Set Callbacks -------------------------------------------------------
    // Put callback object into List 
    function void setCallbacks(DriverCbs cbs);
      this.cbs.push_back(cbs);
    endfunction : setCallbacks
    
    // -- Enable Driver -------------------------------------------------------
    // Enable driver and runs driver process
    task setEnabled();
      enabled = 1; // Driver Enabling
      fork         
        run();     // Creating driver subprocess
      join_none;   // Don't wait for ending
    endtask : setEnabled
        
    // -- Disable Driver ------------------------------------------------------
    // Disable generator
    task setDisabled();
      enabled = 0; // Disable driver, after sending last transaction it ends
    endtask : setDisabled
    
    // -- Send Transaction ----------------------------------------------------
    // Send transaction to Frame Link interface
    task sendTransaction( FrameLinkTransaction transaction );
      tTransInfo info;
      Transaction tr;
      $cast(tr, transaction);
      
      // Call transaction preprocesing, if is available
      foreach (cbs[i]) cbs[i].pre_tx(tr, inst);

      // Wait before sending transaction
      if (enRxDelay) repeat (rxDelay) @(fl.cb);
      
      // Set correct number of connected interface
      transaction.ifcNo = ifcNo;
      
      // Send transaction
      sendData(transaction);
      
      // Set not ready 
      fl.cb.SOF_N     <= 1;
      fl.cb.EOF_N     <= 1;
      fl.cb.SOP_N     <= 1;
      fl.cb.EOP_N     <= 1;
      fl.cb.SRC_RDY_N <= 1;
    
      // Send the header and body size to mailbox
      info.headerLen = transaction.data[0].size;
      info.bodyLen   = transaction.data[1].size;
      info.ifcNo     = ifcNo;
      transInfoMbx.put(info); 
      
      // Call transaction postprocesing, if is available
      foreach (cbs[i]) cbs[i].post_tx(tr, inst);
    endtask : sendTransaction
    
    // -- Private Class Methods --
    
    // -- Run Driver ----------------------------------------------------------
    // Take transactions from mailbox and generate them to interface
    task run();
      FrameLinkTransaction transaction;
      Transaction to;
      @(fl.cb);                        // Wait for clock
      while (enabled) begin            // Repeat while enabled
        transMbx.get(to);              // Get transaction from mailbox
        $cast(transaction,to);
        assert(randomize());
        //transaction.display("DRIVER");
        sendTransaction(transaction);  // Send Transaction
      end
    endtask : run
    

    // -- Wait for accept -----------------------------------------------------
    // Wait for accepting of general bits word of transaction
    task waitForAccept();
      while (fl.cb.DST_RDY_N) begin
        @(fl.cb);
      end;
    endtask : waitForAccept

    //-- Random intertransaction wait -----------------------------------------
    function integer getRandomWait();
       if (enInsideRxDelay)
         return $urandom_range(insideRxDelayLow, insideRxDelayHigh);
       else
         return 0;
    endfunction : getRandomWait
        
    // -- Random wait ---------------------------------------------------------
    // Random wait during sending transaction (Set SRC_RDY_N to 1)
    task randomWait();
      repeat (getRandomWait()) begin
        fl.cb.SRC_RDY_N <= 1;
        @(fl.cb); // Wait for send
      end;
      fl.cb.SRC_RDY_N <= 0;
    endtask : randomWait
       

    // -- Send transaction data -----------------------------------------------
    // Send transaction data
    task sendData(FrameLinkTransaction tr);
      integer m;
      logic[pDataWidth-1:0] dataToSend = 0;
    
      // Allign data from transaction to fl.DATA
      fl.cb.SOF_N     <= 0;    // Set Start of frame        
      fl.cb.SRC_RDY_N <= 0;    // Source is ready to send data
      fl.cb.DATA      <= 0;    // Null the fl.DATA
      
      // -- Pro vsechny pakety --
      for (integer i=0; i < tr.packetCount; i++) begin

        m=0;//pDataWidth;               

        // -- Pro vsechny bajty v paketu --
        for (integer j=0; j < tr.data[i].size; j++) begin 
 
          // -- Nastaveni SOP a SOF
          if (j<pDataWidth/8) begin
            fl.cb.SOP_N <= 0;                      //Set Start of Packet
            if (i!=0) fl.cb.SOF_N <=1;            //Disable Start of Frame 
          end
          else begin
            fl.cb.SOF_N<=1;       
            fl.cb.SOP_N<=1;
          end
  
          // Nastav jeden byte dat
          for (integer k=0; k < 8; k++)
            dataToSend[m++] = tr.data[i][j][k];
          //$display("DATA: %x, m=%d", dataToSend, m);
  

          // Posledni byte v paketu
          if (j==tr.data[i].size-1) begin          //Last byte of packet
            //$write("nastavuje sa posledny byte v pakete cislo %d\n",i); 
            fl.cb.EOP_N<=0;                             //Set End Of Packet
            if (i==tr.packetCount-1) begin               //Last byte of Frame
              //write("nastavuje sa posledny byte vo frame.\n");
              fl.cb.EOF_N<=0;                           //Set End of Frame
            end            
                        
            // FIXME for 1 byte ?
            if (tr.data[i].size%(pDataWidth/8) == 0)
              fl.cb.DREM <= (pDataWidth/8)-1;
            else begin
              fl.cb.DREM <= (tr.data[i].size%(pDataWidth/8))-1;
            end

          m=pDataWidth;
          end
           // Neni posledni byte v paketu
           else
             fl.cb.EOP_N<=1;


          // When is data ready to send
          if (m==pDataWidth) begin
            fl.cb.DATA <= dataToSend;
            randomWait();     // Create not ready
            @(fl.cb);         // Send data
            waitForAccept();  // Wait until oposit side set ready
            fl.cb.DATA<=0; // Null the fl.DATA
            dataToSend = 0;
            m=0; // Init constant for sending next paket
          end

        end
      end

    endtask : sendData
     
  endclass : FrameLinkDriver 

