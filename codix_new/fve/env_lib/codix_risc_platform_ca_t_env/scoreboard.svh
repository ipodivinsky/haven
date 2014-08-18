/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Wed Jun 18 14:16:23 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_platform_ca_t_scoreboard'.
 */

import "DPI-C" pure function int c_openDMAChannel();
import "DPI-C" pure function int c_closeDMAChannel(); 
import "DPI-C" context function int c_receiveData(output int unsigned size, inout byte unsigned outhwpkt[]);
 
// analysis implementations to support input from many places
`uvm_analysis_imp_decl( _dut )
`uvm_analysis_imp_decl( _gold )

// This class receives transactions from the driver and performs transformation of these transactions into the form of expected responses according to the specification. Afterwards, it receives transactions from the monitor and automatically compares these real responses with the expected ones.
class codix_risc_platform_ca_t_scoreboard extends uvm_scoreboard;

	// registration of component tools
	`uvm_component_utils( codix_risc_platform_ca_t_scoreboard )

	// analysis components
	uvm_analysis_imp_dut #(codix_risc_platform_ca_t_transaction, codix_risc_platform_ca_t_scoreboard) dut_analysis_export;
	uvm_analysis_imp_gold #(codix_risc_platform_ca_t_transaction, codix_risc_platform_ca_t_scoreboard) gold_analysis_export;
	// local queues to store all transactions
	local codix_risc_platform_ca_t_transaction m_dut_fifo[$];
	local codix_risc_platform_ca_t_transaction m_gold_fifo[$];
	// DUT agent references used to access DUT resources
	// these agent handles have to be assigned by the parent component
	codix_risc_ca_core_regs_t_agent m_codix_risc_ca_core_regs_t_agent_h;
	codasip_memory_mem_t_agent m_codasip_memory_mem_t_agent_h;
	// golden reference model handle also assigned by parent component
	codix_risc_platform_ca_t_gm m_gold_h;
	// stores the final report message
	local string m_report_msg;

	// standard UVM interface

	// Constructor - creates new instance of this class
	function new( string name = "m_scoreboard_h", uvm_component parent = null );
		super.new( name, parent );
	endfunction: new

	// Build - instantiates child components
	function void build_phase( uvm_phase phase );
		super.build_phase( phase );
		dut_analysis_export = new( "dut_analysis_export", this );
		gold_analysis_export = new( "gold_analysis_export", this );
	endfunction: build_phase

	// Write - store all transactions from DUT ports
	function void write_dut( codix_risc_platform_ca_t_transaction t );
		// TODO uncomment when check function is implemented
		// m_dut_fifo.push_back( t );
	endfunction: write_dut

	// Write - store all transaction from golden reference model ports
	function void write_gold( codix_risc_platform_ca_t_transaction t );
		// TODO uncomment when check function is implemented
		// m_gold_fifo.push_back( t );
	endfunction: write_gold

	// Check - compare DUT and golden reference model
	function void check_phase( uvm_phase phase );
      
      // TODO insert your code here to compare output ports
		// the function may look like this
		/*int unsigned miscompares = 0;
		if ( m_gold_fifo.size() != m_dut_fifo.size() ) begin
			`uvm_fatal( "check:", $sformatf("Different number of output transactions: DUT=%0d, gold=%0d.",
				m_dut_fifo.size(),
				m_gold_fifo.size()) )
		end
		foreach ( m_gold_fifo[ii] ) begin
			// generate error message for miscompare
			if ( !m_gold_fifo[ii].compare(m_dut_fifo[ii]) ) begin
				string msg;
`ifdef FORCE_USE_OF_UVM_COMPARISON_POLICY
				msg = uvm_default_comparer.miscompares.substr( 0, 
					uvm_default_comparer.miscompares.len() -2 );
`else
				msg = $sformatf( "Miscompare for the gold and DUT ports!\ngolden reference model:\n%s\nDUT:\n%s\n",
					m_gold_fifo[ii].sprint(),
					m_dut_fifo[ii].sprint() );
`endif
				miscompares += 1;
				if ( miscompares <= MAX_ERROR_COUNT ) begin
					$sformat( m_report_msg, "%s\n%t: %s", m_report_msg, $time, msg );
				end
			end
		end
		if ( miscompares == 0 ) begin
			`uvm_info( "check:", $sformatf("The result for '%s' is OK, %0d/%0d miscompared output transactions!",
				codasip_get_codal_name(this),
				miscompares,
				m_dut_fifo.size()),
				UVM_MEDIUM )
		end else begin
			`uvm_info( "check:", $sformatf("The result for '%s' is WRONG!", codasip_get_codal_name(this)), UVM_MEDIUM )
		end
		// check resources as well
		if ( (m_codix_risc_ca_core_regs_t_agent_h != null) && (m_gold_h != null) ) begin
			check_codix_risc_platform_ca_codix_risc_core_regs();
		end
		if ( (m_codasip_memory_mem_t_agent_h != null) && (m_gold_h != null) ) begin
			check_codix_risc_platform_ca_mem();
		end*/
      
      // check resources in case of hardware acceleration (regs and memory)
      if (m_gold_h != null) begin
        check_resources();
      end
      
   endfunction: check_phase
   
   // Read values of register and memory fields from hardware and compare them to golden model values
   function void check_resources();
     //=====================================================
      // insert code to read values from HW
      // push values from output port to FIFO - not neccessary, actualy not implemented
      // store regiter values in array[32], each value is logic(31:0)
      // store memory values in array[524288/4], each value is logic(31:0)
      
      byte unsigned sze_packet[1000];// = 0; // max size of packets to 808B, over-approximation to 1000
      bit memory_flag = 0;    // memory field reading flag (0 = not read, 1 = already read)
      int mem_addr = 0;       // counter of memory blocks, if last address achieved, all data were read
      bit reg_flag = 0;       // register field reading flag (0 = not read, 1 = already read)
      int read_result = 0;    // result of read operation from hardware through libsze 
      int size = 0;

      // open DMA channel
      c_openDMAChannel();
      
      while (reg_flag == 0 && memory_flag == 0) begin
         read_result = c_receiveData(size, sze_packet);
         
         //131072
         
         // reading from hardware failed
         if (read_result == 1) begin
            //error with data receiving
            `uvm_fatal(CODASIP_REPORT_STATUS, "RECEIVING OF DATA from hardware FAILED!");
         end
         // reading from hardware successful
         else begin
            // if size > 0 process received data
            if (size > 0) begin
               
               // HEADER TRANS_TYPE == 1 means recieving data from output ports
               if (sze_packet[0] == 1) begin
                  `uvm_info(CODASIP_REPORT_STATUS, "RECEIVING DATA from hardware OUTPUT_PORTS!", UVM_NONE);
                  for (int i=12; i<16; i++)
                    $write("%x ", sze_packet[i]);
                  $write("\n");  
               end
               
               // HEADER TRANS_TYPE == 2 means recieving data from registers
               else if (sze_packet[0] == 2) begin
                 /* REGISTER ARRAY FORM
                   sze_packet[7:0] = header
                   sze_packet[11:8] = reg0
                   sze_packet[15:12] = reg1
                   sze_packet[19:16] = reg2
                      ...
                   sze_packet[135:132] = reg31
                 */  
               
                  logic[31:0] hw_reg;
                  logic[31:0] gm_reg;
                  
                  for (int i=0; i<32; i++) begin
                    
                    for (int j=0; j<4; j++) 
                      for (int k=0; k<8; k++) 
                        hw_reg[j*k] = sze_packet[i*4+8+j][k];  //i*4+11):(i*4+8)];  // read register field from hardware
                    
                    
                    gm_reg = m_gold_h.codix_risc_ca_core_regs_t_peek(i);
                   
                    // compare elements
                    if ( hw_reg !== gm_reg ) 
                      `uvm_fatal("check:", "COMPARISON of DUT and GM REGS FAILED!");
				      end
               
                  /*hw_regs[0] = sze_packet[11:8]
                   hw_regs[1] = sze_packet[15:12]
                   hw_regs[2] = sze_packet[19:16]*/
                  
                  // if registers are read set flag     
                  reg_flag = 1; 
               end
          
               
               // HEADER TRANS_TYPE == 3 means recieving data from memory
               else if (sze_packet[0] == 3) begin
                 /* MEMORY ARRAY FORM
                   in one packet is 200 x 4B memory item
                   1st packet: 
                   sze_packet[7:0] = header
                   sze_packet[11:8] = mem(0)
                   sze_packet[15:12] = mem(4)
                   sze_packet[19:16] = mem(8)
                     ...
                   sze_packet[807:804] = mem(796)
               
                   2nd packet: 
                   sze_packet[7:0] = header
                   sze_packet[11:8] = mem(800)
                   sze_packet[15:12] = mem(804)
                   sze_packet[19:16] = mem(806)
                     ...
                   sze_packet[807:804] = mem(1596)
               
                   last packet: 
                   sze_packet[7:0] = header
                   sze_packet[11:8] = mem(524000)
                   sze_packet[15:12] = mem(524004)
                   sze_packet[19:16] = mem(524008)
                     ...
                   sze_packet[295:291] = mem(524284)
                  */
                
                  logic[31:0] hw_mem;
                  logic[31:0] gm_mem;
               
                  for (int i=0; i<((size-8)/4); i++) begin
                    //hw_mem = sze_packet[(i*4+11):(i*4+8)];  // read memory field from hardware
                    for (int j=0; j<4; j++) 
                      for (int k=0; k<8; k++) 
                        hw_mem[j*k] = sze_packet[i*4+8+j][k];
                        
                    gm_mem = m_gold_h.codasip_memory_mem_t_peek(mem_addr);
                    mem_addr += 4;
                  
                    // compare elements
                    if ( hw_mem !== gm_mem ) 
                      `uvm_fatal("check:", "COMPARISON of DUT and GM MEMORY FAILED!");
				        
                    // if last address is achieved set flag                    
                    if (mem_addr == 524288) memory_flag = 1;
                    
                  end  
               end
            end
				else begin
               //wait before next reading
					//#10ns;
				end
			end
            
      
      end
      
      // close DMA channel
      c_closeDMAChannel();
   endfunction: check_resources
   
   
   

	// Report - generate final report (success/failure)
	function void report_phase( uvm_phase phase );
		`uvm_info( CODASIP_REPORT_STATUS, m_report_msg, UVM_NONE )
	endfunction: report_phase

	// additional function definitions

	// Peek - immediately read value of one register file element
	// \param addr address to the register file
	function automatic logic [31:0] dut_codix_risc_ca_core_regs_t_peek( input logic [4:0] addr );
		return $root.top.dut.HDL_DUT_U.codix_risc.core.regs.RAM[addr];
	endfunction: dut_codix_risc_ca_core_regs_t_peek

	// Check - compare content of the register file inside DUT and golden reference model
	local function automatic void check_codix_risc_platform_ca_codix_risc_core_regs();
		logic [31:0] dut;
		logic [31:0] gold;
		int unsigned miscompares;
		string msg;
		miscompares = 0;
		msg = "miscompare(s) for 'codix_risc.regs':";
		// compare the whole resource
		for ( int unsigned addr = 0; addr < 32; addr += 1 ) begin
         //===================================================
         //read values from HW array instead this function
			dut = dut_codix_risc_ca_core_regs_t_peek( addr );
         //===================================================
			gold = m_gold_h.codix_risc_ca_core_regs_t_peek( addr );
			// compare elements, some fields may contain X/U in DUT, but golden model (IA simulator) returns all zeros
			if ( gold !== dut ) begin
				if ( !($isunknown(dut) && (gold == 0)) ) begin
					$sformat( msg, "%s\n    on index %0d: gold='h%0h vs. DUT='h%0h", msg, addr, gold, dut );
					miscompares += 1;
				end
			end
		end
		if ( miscompares == 0 ) begin
			`uvm_info( "check:", "The result for 'codix_risc.regs' is OK!", UVM_MEDIUM )
		end else begin
			`uvm_info( "check:", "The result for 'codix_risc.regs' is WRONG!", UVM_MEDIUM )
			$sformat( m_report_msg, "%s%0d %s\n", m_report_msg, miscompares, msg );
		end
	endfunction: check_codix_risc_platform_ca_codix_risc_core_regs

	// Peek - immediately read the whole word from memory
	// \param addr the address must be aligned
	function automatic logic [31:0] dut_codasip_memory_mem_t_peek( input logic [18:0] addr );
		logic [7:0] sb_0;
		logic [7:0] sb_1;
		logic [7:0] sb_2;
		logic [7:0] sb_3;
		// read values from FLI memory
		sv_codasip_memory_mem_t_agent_pkg::codasip_dpi_memory_read( "top_dut_HDL_DUT_U_mem_storage_subblock_0__data", addr / 4, sb_0 );
		sv_codasip_memory_mem_t_agent_pkg::codasip_dpi_memory_read( "top_dut_HDL_DUT_U_mem_storage_subblock_1__data", addr / 4, sb_1 );
		sv_codasip_memory_mem_t_agent_pkg::codasip_dpi_memory_read( "top_dut_HDL_DUT_U_mem_storage_subblock_2__data", addr / 4, sb_2 );
		sv_codasip_memory_mem_t_agent_pkg::codasip_dpi_memory_read( "top_dut_HDL_DUT_U_mem_storage_subblock_3__data", addr / 4, sb_3 );
		// return the whole word in big endian
		return { sb_3, sb_2, sb_1, sb_0 };
	endfunction: dut_codasip_memory_mem_t_peek

	// Check - compare content of the memory inside DUT and golden reference model
	local function automatic void check_codix_risc_platform_ca_mem();
		logic [31:0] dut;
		logic [31:0] gold;
		int unsigned miscompares;
		string msg;
		miscompares = 0;
		msg = "miscompare(s) for 'mem':";
		// compare the whole resource
		for ( int unsigned addr = 0; addr < 524288; addr += 4 ) begin
         //===================================================
         //read values from HW array instead this function
			dut = dut_codasip_memory_mem_t_peek( addr );
         //===================================================
			gold = m_gold_h.codasip_memory_mem_t_peek( addr );
			// compare elements, some fields may contain X/U in DUT, but golden model (IA simulator) returns all zeros
			if ( gold !== dut ) begin
				// compare byte by byte because single byte could be written
				if ( (!($isunknown(dut[7:0]) && (gold[7:0] == 0))) &&
					(!($isunknown(dut[15:8]) && (gold[15:8] == 0))) &&
					(!($isunknown(dut[23:16]) && (gold[23:16] == 0))) &&
					(!($isunknown(dut[31:24]) && (gold[31:24] == 0))) ) begin
					$sformat( msg, "%s\n    on index %0d: gold='h%0h vs. DUT='h%0h", msg, addr, gold, dut );
					miscompares += 1;
				end
			end
		end
		if ( miscompares == 0 ) begin
			`uvm_info( "check:", "The result for 'mem' is OK!", UVM_MEDIUM )
		end else begin
			`uvm_info( "check:", "The result for 'mem' is WRONG!", UVM_MEDIUM )
			$sformat( m_report_msg, "%s%0d %s\n", m_report_msg, miscompares, msg );
		end
	endfunction: check_codix_risc_platform_ca_mem

endclass: codix_risc_platform_ca_t_scoreboard

