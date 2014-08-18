################################################################################
#       "Copyright (C) 2014, Codasip s.r.o, All Rights Reserved"
#  author: Codasip HW generator v2.2.0.internal
#  date:   Sat Jul 19 17:47:35 2014
#  brief:  Definition of signals which are displayed in simulator in GUI mode.
################################################################################
# Signals of interfaces.
proc basic { PATH } {
	add wave -noupdate -divider "Basic signals"
	add wave -noupdate -color yellow -label CLK $PATH/CLK
	add wave -noupdate -color yellow -label RST $PATH/RST
}

proc icodix_risc_platform_ca_codix_risc_core_regs { PATH ID RTL_PATH } {
	add wave -noupdate -divider "$ID interface:"
	add wave -noupdate -hex -label Q0 $PATH/Q0
	add wave -noupdate -hex -label RA0 $PATH/RA0
	add wave -noupdate -label RE0 $PATH/RE0
	add wave -noupdate -hex -label Q1 $PATH/Q1
	add wave -noupdate -hex -label RA1 $PATH/RA1
	add wave -noupdate -label RE1 $PATH/RE1
	add wave -noupdate -hex -label Q2 $PATH/Q2
	add wave -noupdate -hex -label RA2 $PATH/RA2
	add wave -noupdate -label RE2 $PATH/RE2
	add wave -noupdate -hex -label D0 $PATH/D0
	add wave -noupdate -hex -label WA0 $PATH/WA0
	add wave -noupdate -label WE0 $PATH/WE0
	add wave -noupdate -hex -label content $RTL_PATH
}

proc icodix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw { PATH ID } {
	add wave -noupdate -divider "$ID interface:"
	add wave -noupdate -label ACT $PATH/ACT
	add wave -noupdate -hex -label id_instr_Q0 $PATH/id_instr_Q0
	add wave -noupdate -label "disassembled instruction" $PATH/m_instruction_name
}

proc icodix_risc_platform_ca_codix_risc { PATH ID } {
	add wave -noupdate -divider "$ID interface:"
	add wave -noupdate -label irq $PATH/irq
	add wave -noupdate -label port_halt $PATH/port_halt
	add wave -noupdate -hex -label port_out $PATH/port_out
	add wave -noupdate -label port_out_en $PATH/port_out_en
	add wave -noupdate -hex -label port_error $PATH/port_error
	add wave -noupdate -hex -label ibus_A0 $PATH/ibus_A0
	add wave -noupdate -hex -label ibus_SI0 $PATH/ibus_SI0
	add wave -noupdate -hex -label ibus_SC0 $PATH/ibus_SC0
	add wave -noupdate -hex -label ibus_REQCMD0 $PATH/ibus_REQCMD0
	add wave -noupdate -hex -label ibus_REQRESP0 $PATH/ibus_REQRESP0
	add wave -noupdate -hex -label ibus_Q0 $PATH/ibus_Q0
	add wave -noupdate -hex -label ibus_IFCMD0 $PATH/ibus_IFCMD0
	add wave -noupdate -hex -label ibus_IFRESP0 $PATH/ibus_IFRESP0
	add wave -noupdate -hex -label dbus_A0 $PATH/dbus_A0
	add wave -noupdate -hex -label dbus_SI0 $PATH/dbus_SI0
	add wave -noupdate -hex -label dbus_SC0 $PATH/dbus_SC0
	add wave -noupdate -hex -label dbus_REQCMD0 $PATH/dbus_REQCMD0
	add wave -noupdate -hex -label dbus_REQRESP0 $PATH/dbus_REQRESP0
	add wave -noupdate -hex -label dbus_Q0 $PATH/dbus_Q0
	add wave -noupdate -hex -label dbus_IFCMD0 $PATH/dbus_IFCMD0
	add wave -noupdate -hex -label dbus_IFRESP0 $PATH/dbus_IFRESP0
	add wave -noupdate -hex -label dbus_D0 $PATH/dbus_D0
	add wave -noupdate -hex -label dbus_OFCMD0 $PATH/dbus_OFCMD0
	add wave -noupdate -hex -label dbus_OFRESP0 $PATH/dbus_OFRESP0
}

proc icodix_risc_platform_ca_mem { PATH ID } {
	add wave -noupdate -divider "$ID interface:"
	add wave -noupdate -hex -label read_only_A0 $PATH/read_only_A0
	add wave -noupdate -hex -label read_only_SI0 $PATH/read_only_SI0
	add wave -noupdate -hex -label read_only_SC0 $PATH/read_only_SC0
	add wave -noupdate -hex -label read_only_REQCMD0 $PATH/read_only_REQCMD0
	add wave -noupdate -hex -label read_only_REQRESP0 $PATH/read_only_REQRESP0
	add wave -noupdate -hex -label read_only_Q0 $PATH/read_only_Q0
	add wave -noupdate -hex -label read_only_IFCMD0 $PATH/read_only_IFCMD0
	add wave -noupdate -hex -label read_only_IFRESP0 $PATH/read_only_IFRESP0
	add wave -noupdate -hex -label read_write_A0 $PATH/read_write_A0
	add wave -noupdate -hex -label read_write_SI0 $PATH/read_write_SI0
	add wave -noupdate -hex -label read_write_SC0 $PATH/read_write_SC0
	add wave -noupdate -hex -label read_write_REQCMD0 $PATH/read_write_REQCMD0
	add wave -noupdate -hex -label read_write_REQRESP0 $PATH/read_write_REQRESP0
	add wave -noupdate -hex -label read_write_Q0 $PATH/read_write_Q0
	add wave -noupdate -hex -label read_write_IFCMD0 $PATH/read_write_IFCMD0
	add wave -noupdate -hex -label read_write_IFRESP0 $PATH/read_write_IFRESP0
	add wave -noupdate -hex -label read_write_D0 $PATH/read_write_D0
	add wave -noupdate -hex -label read_write_OFCMD0 $PATH/read_write_OFCMD0
	add wave -noupdate -hex -label read_write_OFRESP0 $PATH/read_write_OFRESP0
}

proc ihalt { PATH ID } {
	add wave -noupdate -divider "$ID interface:"
	add wave -noupdate -label codix_risc_platform_ca_codix_risc_core_main_controller_main_halt_halt_fu_semantics_ACT $PATH/codix_risc_platform_ca_codix_risc_core_main_controller_main_halt_halt_fu_semantics_ACT
}

proc icodix_risc_platform_ca { PATH ID } {
	add wave -noupdate -divider "DUT input pins:"
	add wave -noupdate -label irq $PATH/irq
	add wave -noupdate -divider "DUT output pins:"
	add wave -noupdate -hex -label port_out $PATH/port_out
	add wave -noupdate -label port_out_en $PATH/port_out_en
	add wave -noupdate -label port_halt $PATH/port_halt
	add wave -noupdate -hex -label port_error $PATH/port_error
}

proc customize_gui { DUT_MODULE HDL_DUT } {
	# View simulation waves
	view wave
	# Remove all previous waves first
	delete wave *
	# Clock and reset signals
	basic /$DUT_MODULE/codix_risc_platform_ca_codix_risc_core_regs_if
	add wave -noupdate -divider "DUT interfaces"
	icodix_risc_platform_ca_codix_risc_core_regs $DUT_MODULE/codix_risc_platform_ca_codix_risc_core_regs_if codix_risc_platform_ca_codix_risc_core_regs_if /top/dut/HDL_DUT_U/codix_risc/core/regs/RAM
	icodix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw $DUT_MODULE/codix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw_if codix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw_if
	icodix_risc_platform_ca_codix_risc $DUT_MODULE/codix_risc_platform_ca_codix_risc_if codix_risc_platform_ca_codix_risc_if
	icodix_risc_platform_ca_mem $DUT_MODULE/codix_risc_platform_ca_mem_if codix_risc_platform_ca_mem_if
	ihalt $DUT_MODULE/ihalt_if ihalt_if
	icodix_risc_platform_ca $DUT_MODULE/codix_risc_platform_ca_if codix_risc_platform_ca_if

	# All signals in the processor design
	add wave -noupdate -divider "All signals in the DUT design"
	# if { [catch {add wave -noupdate -hex -r $HDL_DUT/*}] } {}

	# Additional wave configuration
	TreeUpdate [SetDefaultTree]
	configure wave -namecolwidth 200
	configure wave -valuecolwidth 100
	configure wave -justifyvalue left
	configure wave -signalnamewidth 0
	configure wave -gridoffset 0
	configure wave -gridperiod {10 ns}
	configure wave -griddelta 50
	configure wave -timeline 0
	configure wave -timelineunits ns
	WaveRestoreZoom {0 ns} {250 ns}
	update
	view structure
	view signals
	wave refresh
}
