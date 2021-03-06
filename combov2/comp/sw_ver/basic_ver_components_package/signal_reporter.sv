/* *****************************************************************************
 * Project Name: Software Framework for Functional Verification
 * File Name:    Signal Reporter Class
 * Description: 
 * Author:       Marcela Simkova <xsimko03@stud.fit.vutbr.cz> 
 * Date:         12.8.2011 
 * ************************************************************************** */
 
virtual class SignalReporter;
   
   /*
    * Public Class Atributes
    */ 
    tTransMbx mbx;    //! Mailbox for transactions received from Sorter
    string    inst;   //! Reporter identification
    byte      id;     //! Reporter ID number
    bit enabled;      //! Reporter enabling
    bit busy;         //! Reporter is receiving transaction

    integer fileId;   //! Output file handle

   /*
    * Public Class Methods
    */ 
    
   /*! 
    * Constructor 
    */    
    function new(string inst,
                 byte id,
                 tTransMbx mbx
                 ); 
       this.inst      = inst;      //! Store reporter identifier
       this.id        = id;        //! Store reporter ID
       this.mbx       = mbx;       //! Store pointer to mailbox
       this.enabled   = 0;         //! Reporter is disabled by default
       this.busy      = 0;         //! Reporter is not busy by default 
       this.fileId    = 0;         //! Store ``no file''
    endfunction: new
    
   /*! 
    * Enable Reporter - enable reporter and runs reporter process
    */    
    virtual task setEnabled();
      // first open the output file
      string fileName;
      string idStr;

      idStr.itoa(id);

      fileName = {"sig_rep_", idStr, ".vcd"};
      fileId = $fopen(fileName, "w");
      if (fileId == 0) begin
        $display("Could not open file %s for writing!", fileName);
      end

      writeVCDHeader(fileId);
      writeProtocolHeader(fileId);

      enabled = 1;  //! Reporter Enabling
      fork         
         run();     //! Creating reporter subprocess
      join_none;    //! Don't wait for ending
    endtask : setEnabled
        
   /*! 
    * Disable Reporter
    */
    virtual task setDisabled();
      enabled = 0;  //! Disable reporter, after receiving last transaction
      $fclose(fileId);
      fileId = 0;
    endtask : setDisabled

   /*
    * Private Class Methods
    */

   /*! 
    * Run Reporter - receives messages from hardware assertion checker and
    * prints corresponding reports .
    */ 
    virtual task run();
      NetCOPETransaction ntr;
      Transaction tr;

      while (enabled) begin 
        // receive data from mailbox
        #1ps;         // wait to enable other components some work
        busy  = 0;
        mbx.get(tr);
        busy  = 1;
        
        $cast(ntr, tr);

        writeReport(ntr, fileId);
      end
    endtask : run

    /*! Pure virtual function for writing the protocol-specific signal dump @p
     * ntr into the file assigned to @p fId.
     *
     * @param[in]  ntr  Signal dump in the form of a NetCOPE transaction
     * @param[in]  fId  ID of the output file
     */
    pure virtual function void writeReport(ref NetCOPETransaction ntr, integer fId);

    /*! Function that writes the VCD format header into given file
     *
     * @param[in]  fId  ID of the output file
     */
    virtual function void writeVCDHeader(integer fId);

      // see   http://en.wikipedia.org/wiki/Value_change_dump   for the
      // description of the VCD format

      $fwrite(fId, "$version\n");
      $fwrite(fId, "  Haven 0.1\n");
      $fwrite(fId, "$end\n");
    endfunction

    /*! Pure virtual function for writing the protocol-specific header into
     * given file.
     *
     * @param[in]  fId  ID of the output file
     */
    pure virtual function void writeProtocolHeader(integer fId);

 endclass : SignalReporter  
