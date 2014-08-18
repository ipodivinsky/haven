/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Wed Jun 18 14:16:23 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_platform_ca_t_env'.
 */

// DPI interface used to initialize memory content
// \param hdl full hierarchical path to the memory storage
// \param executable path to binary (executable) file, source data for the initialization
// \param address_space name of the address space
// \param base memory base address
// \param low lowest address of the memory range to initialize
// \param high highest address of the memory range to initialize
// \param sbi sub-block index of given memory storage instance, default value is zero
// \param sbc number of sub-blocks of the memory, default value is one
/*import "DPI-C" context function void codasip_dpi_memory_init( input string hdl,
	input string executable,
	input string addressSpace,
	input int unsigned base,
	input int unsigned low,
	input int unsigned high,
	input int unsigned sbi,
	input int unsigned sbc );*/
   
   
//import "DPI-C" pure function int c_openDMAChannel();
//import "DPI-C" pure function int c_closeDMAChannel(); 
import "DPI-C" context function int c_sendData(input byte unsigned inhwpkt[]);


// This class represents the main parts of the verification environment.
class codix_risc_platform_ca_t_env extends uvm_env;

	// registration of component tools
	`uvm_component_utils( codix_risc_platform_ca_t_env )

	// environment configuration
	codix_risc_platform_ca_t_env_config m_cfg_h;
	// main sub-components
	// used to collect memory coverage (how extensive was the memory used).
	codasip_memory_mem_t_agent m_codasip_memory_mem_t_agent_h;
	// verification environment for the 'codix_risc_platform_ca_codix_risc'
	codix_risc_ca_t_env m_codix_risc_ca_t_env_h;
	codix_risc_platform_ca_t_agent m_codix_risc_platform_ca_t_agent_h;
	codix_risc_platform_ca_t_scoreboard m_scoreboard_h;
	codix_risc_platform_ca_t_gm m_gold_h;

	// Constructor - creates new instance of this class
	function new( string name = "m_env_h", uvm_component parent = null );
		super.new( name, parent );
	endfunction: new

	// Build - instantiates child components
	function void build_phase( uvm_phase phase );
		super.build_phase( phase );
		// environment configuration first
		if ( !uvm_config_db #(codix_risc_platform_ca_t_env_config)::get(this,
			"",
			"codix_risc_platform_ca_t_env_config",
			m_cfg_h) ) begin
			`uvm_fatal( "configuration:", "Cannot find 'codix_risc_platform_ca_t_env_config' inside uvm_config_db, probably not set!" )
		end
		// 'codasip_memory_mem_t_agent' agent configuration visible to the agent only
		if ( m_cfg_h.has_codasip_memory_mem_t_agent ) begin
			uvm_config_db #( codasip_memory_mem_t_agent_config )::set( this,
				"m_codasip_memory_mem_t_agent_h*",
				"codasip_memory_mem_t_agent_config",
				m_cfg_h.m_codasip_memory_mem_t_agent_config_h );
			m_codasip_memory_mem_t_agent_h = codasip_memory_mem_t_agent::type_id::create( "m_codasip_memory_mem_t_agent_h", this );
		end
		// configuration for the 'codix_risc_platform_ca_codix_risc' environment
		if ( m_cfg_h.has_m_codix_risc_ca_t_env_h ) begin
			uvm_config_db #( codix_risc_ca_t_env_config )::set( this,
				"m_codix_risc_ca_t_env_h*",
				"codix_risc_ca_t_env_config",
				m_cfg_h.m_codix_risc_ca_t_env_config_h );
			m_codix_risc_ca_t_env_h = codix_risc_ca_t_env::type_id::create( "m_codix_risc_ca_t_env_h", this );
		end
		// initialize memories visible from ASIP address space(s)
		codix_risc_as_all_load();
		// 'codix_risc_platform_ca_t_agent' agent configuration visible to the agent only
		if ( m_cfg_h.has_codix_risc_platform_ca_t_agent ) begin
			uvm_config_db #( codix_risc_platform_ca_t_agent_config )::set( this,
				"m_codix_risc_platform_ca_t_agent_h*",
				"codix_risc_platform_ca_t_agent_config",
				m_cfg_h.m_codix_risc_platform_ca_t_agent_config_h );
			m_codix_risc_platform_ca_t_agent_h = codix_risc_platform_ca_t_agent::type_id::create( "m_codix_risc_platform_ca_t_agent_h", this );
		end
		m_scoreboard_h = codix_risc_platform_ca_t_scoreboard::type_id::create( "m_scoreboard_h", this );
		m_gold_h = codix_risc_platform_ca_t_gm::type_id::create( "m_gold_h", this );
		// provide access to the golden reference model
		if ( m_cfg_h.has_m_codix_risc_ca_t_env_h ) begin
			m_codix_risc_ca_t_env_h.m_gold_h = m_gold_h;
		end
	endfunction: build_phase

	// Connect - create interconnection between child components
	function void connect_phase( uvm_phase phase );
		super.connect_phase( phase );
		if ( m_cfg_h.has_codix_risc_platform_ca_t_agent ) begin
			if ( m_cfg_h.m_codix_risc_platform_ca_t_agent_config_h.active == UVM_ACTIVE ) begin
				// agent monitor => golden reference model (same inputs as for DUT)
				m_codix_risc_platform_ca_t_agent_h.stim_analysis_port.connect( m_gold_h.codix_risc_platform_ca_t_analysis_export );
			end
			// agent monitor => scoreboard (DUT outputs)
			m_codix_risc_platform_ca_t_agent_h.analysis_port.connect( m_scoreboard_h.dut_analysis_export );
		end
		// golden reference model => scoreboard (GM outputs)
		m_gold_h.codix_risc_platform_ca_t_analysis_port.connect( m_scoreboard_h.gold_analysis_export );
		// now initialize scoreboard attributes
		if ( m_cfg_h.has_m_codix_risc_ca_t_env_h ) begin
			if ( m_codix_risc_ca_t_env_h.m_cfg_h.has_codix_risc_ca_core_regs_t_agent ) begin
				m_scoreboard_h.m_codix_risc_ca_core_regs_t_agent_h = m_codix_risc_ca_t_env_h.m_codix_risc_ca_core_regs_t_agent_h;
			end
		end
		m_scoreboard_h.m_codasip_memory_mem_t_agent_h = m_codasip_memory_mem_t_agent_h;
		m_scoreboard_h.m_gold_h = m_gold_h;
	endfunction: connect_phase

	// Load - initialize memories and components accessible from the address space
	// 'as_all' inside 'codix_risc' ASIP instance
	virtual function void codix_risc_as_all_load();
      byte unsigned read;            // byte of data read from application file
      byte unsigned sze_packet[16];  // packet of data that are send to hardware
      int read_flag;                 // read data flag  
      int file_des;                  // file descriptor
      byte unsigned temp;
      int end_pos;                     
      
      // HAVEN constants - if needed move to test_paremeters
      int HEADER_SIZE = 8;
      int PACKET_SIZE = 16;
      int DATA_SIZE = 8;
      int INST_SIZE = 4;
      
      automatic string executable = codasip_get_executable_path("codix_risc");
		automatic string address_space = "as_all";
      /*
       \inputs: FrameLink protocol, 3 packets of 8 bytes:
             1st = start packet:  00000001 00000000 - start header

             2nd =  data packets: 00000000 00000000 - header               
                                   inst 1   inst 0  - instructions
                                   inst 3   inst 2  - instructions
                                     .        .     - instructions
                                     .        .     - instructions
                                     .        .     - instructions
             bits significance:  [31]..[0] [31]..[0]   
       
             3rd = stop packet:   00000004 00000000 - stop header
            bytes significance:  [7].............[0]
      */
      // open DMA channel
      c_openDMAChannel();
      
      // send start packet
      sze_packet[0] = 0;    // endpointID
      sze_packet[1] = 0;    // endpointProtocol
      sze_packet[2] = 0; 
      sze_packet[3] = 0;
      sze_packet[4] = 1;    // transType = START 
      sze_packet[5] = 0;
      sze_packet[6] = 0;    // ifcProtocol = FrameLink
      sze_packet[7] = 0;    // ifcInfo
      c_sendData(sze_packet);
    
      //=================================================
      

      //preparing one packet = reading two instructions
      file_des = $fopen("../../../xexes_hw/sha.c.xexe.hex", "r"); 
      if (file_des == 0) begin
         $display("ERROR : CAN NOT OPEN THE FILE");
      end
      
      
      
      read_flag = $fscanf(file_des,"%02x", read);
      while (read_flag > 0) begin 
         //packet inicialization
         for(int i = 0; i < PACKET_SIZE; i++) begin
           sze_packet[i] = 0;
         end
         
         //header
         sze_packet[4] = 0;
         
         //read first instruction
         for(int i = DATA_SIZE; i < DATA_SIZE + INST_SIZE; i++) begin
            sze_packet[i] = read;
            read_flag = $fscanf(file_des,"%02x", read);
         end
         
         //read second instruction
         if (read_flag > 0) begin
            for(int i = DATA_SIZE + INST_SIZE; i < PACKET_SIZE; i++) begin
               sze_packet[i] = read;
               read_flag = $fscanf(file_des,"%02x", read);
            end
         end
         
         //reverse data part of packet per instructions
         for(int j = DATA_SIZE; j < PACKET_SIZE; j += INST_SIZE) begin
            end_pos = INST_SIZE-1 + j;
            for (int i = 0 + j; i < INST_SIZE/2 + j; i++) begin
               temp = sze_packet[i];
               sze_packet[i] = sze_packet[end_pos];
               sze_packet[end_pos] = temp;
          
               end_pos--;
           end
         end
         /*
         //print packet
         for(j = 0; j < PACKET_SIZE; j += byte_size)
         {
            for (i = byte_size + j -1; i >= 0 + j; i--) 
               printf("%02x ", *(packet + i));
            printf("  ");
         }
         printf("\n");
         */
         //send packet
         c_sendData(sze_packet);
      end
         
         
      //================================================
      // send end packet
      sze_packet[0] = 0;    // endpointID
      sze_packet[1] = 0;    // endpointProtocol
      sze_packet[2] = 0; 
      sze_packet[3] = 0;
      sze_packet[4] = 4;    // transType = STOP 
      sze_packet[5] = 0;
      sze_packet[6] = 0;    // ifcProtocol = FrameLink
      sze_packet[7] = 0;    // ifcInfo
      c_sendData(sze_packet);
      
      // close DMA channel
      c_closeDMAChannel();
      
		/*codasip_dpi_memory_init( "top.dut.HDL_DUT_U.mem.storage.subblock[0].data.RAM",
			executable,
			address_space,
			32'd0,
			32'd0,
			32'd524287,
			0, 
			4 );
		codasip_dpi_memory_init( "top.dut.HDL_DUT_U.mem.storage.subblock[1].data.RAM",
			executable,
			address_space,
			32'd0,
			32'd0,
			32'd524287,
			1, 
			4 );
		codasip_dpi_memory_init( "top.dut.HDL_DUT_U.mem.storage.subblock[2].data.RAM",
			executable,
			address_space,
			32'd0,
			32'd0,
			32'd524287,
			2, 
			4 );
		codasip_dpi_memory_init( "top.dut.HDL_DUT_U.mem.storage.subblock[3].data.RAM",
			executable,
			address_space,
			32'd0,
			32'd0,
			32'd524287,
			3, 
			4 );*/
	endfunction: codix_risc_as_all_load

endclass: codix_risc_platform_ca_t_env

