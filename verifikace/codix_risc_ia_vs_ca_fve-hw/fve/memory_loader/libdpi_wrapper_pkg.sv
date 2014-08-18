package libdpi_wrapper_pkg;
	import "DPI-C" context function void codasip_dpi_open_dma();
	import "DPI-C" context function void codasip_dpi_close_dma();
	import "DPI-C" context function void codasip_dpi_send_all();
	import "DPI-C" context function void codasip_dpi_receive_all();
	import "DPI-C" context function void codasip_dpi_send_start();
	import "DPI-C" context function void codasip_dpi_send_stop();
	import "DPI-C" context function void codasip_dpi_mem_init( input string file, input string addressSpace );
	import "DPI-C" context function int unsigned codasip_dpi_mem_read( input int unsigned addr );
	import "DPI-C" context function int unsigned codasip_dpi_regs_read( input int unsigned addr );
endpackage
