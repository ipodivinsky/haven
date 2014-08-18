package codix_risc_platform_ia_dpi_pkg;
import "DPI-C" context function int codix_risc_platform_ia_constructor();
import "DPI-C" context function void codix_risc_platform_ia_destructor(input int h);
import "DPI-C" context function void codix_risc_platform_ia_reset(input int h);
import "DPI-C" context function int codix_risc_platform_ia_clock_cycle(input int h);
import "DPI-C" context function void codix_risc_platform_ia_get_mem(input int h, output logic [31:0] data, input int addr);
import "DPI-C" context function void codix_risc_platform_ia_set_mem(input int h, input int addr, input logic [31:0] data);
import "DPI-C" context function int codix_risc_platform_ia_codix_risc_load_executable(input int h, input string executable);
import "DPI-C" context function void codix_risc_platform_ia_codix_risc_set_irq(input int h, input logic  data);
import "DPI-C" context function void codix_risc_platform_ia_codix_risc_get_port_halt(input int h, output logic  data);
import "DPI-C" context function void codix_risc_platform_ia_codix_risc_get_port_out(input int h, output logic [31:0] data);
import "DPI-C" context function void codix_risc_platform_ia_codix_risc_get_port_out_en(input int h, output logic  data);
import "DPI-C" context function void codix_risc_platform_ia_codix_risc_get_port_error(input int h, output logic [31:0] data);
import "DPI-C" context function void codix_risc_platform_ia_codix_risc_get_regs(input int h, output logic [31:0] data, input int addr);
import "DPI-C" context function void codix_risc_platform_ia_codix_risc_set_regs(input int h, input int addr, input logic [31:0] data);
endpackage
