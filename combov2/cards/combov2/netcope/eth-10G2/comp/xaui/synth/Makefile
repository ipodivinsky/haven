# Makefile: Makefile to compile XAUI Module
# Copyright (C) 2010 CESNET
# Author: Viktor Pus <pus@liberouter.org>
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in
#    the documentation and/or other materials provided with the
#    distribution.
# 3. Neither the name of the Company nor the names of its contributors
#    may be used to endorse or promote products derived from this
#    software without specific prior written permission.
#
# This software is provided ``as is'', and any express or implied
# warranties, including, but not limited to, the implied warranties of
# merchantability and fitness for a particular purpose are disclaimed.
# In no event shall the company or contributors be liable for any
# direct, indirect, incidental, special, exemplary, or consequential
# damages (including, but not limited to, procurement of substitute
# goods or services; loss of use, data, or profits; or business
# interruption) however caused and on any theory of liability, whether
# in contract, strict liability, or tort (including negligence or
# otherwise) arising in any way out of the use of this software, even
# if advised of the possibility of such damage.
#
# $Id: Makefile 13736 2010-05-13 07:42:51Z pus $
#
# makefile to synthesize component

# Call this Makefile with target combov2_xaui.ngc of combov2_xaui_fxt.ngc

MODULE=combov2_xaui

MAIN=Makefile.main
.PHONY: all doc xst precision clean
XAUI_PATH=../../../../../../../comp/external/ip_cores/xaui

# Default: XST
xst: $(MODULE).ngc

precision: $(MODULE).edf

%.ngc: FORCE
	echo "Building XAUI core first..."
	cd $(XAUI_PATH)$(shell echo $@ | grep -o _fxt) && $(MAKE)
	$(MAKE) -f $(MAIN) $@ SYNTH=xst
	touch $@

%.edf: FORCE
	$(MAKE) -f $(MAIN) $@ SYNTH=precision SYNTHFLAGS="-shell -file" SYNTHFILES=Precision.tcl

FORCE:

clean:
	$(MAKE) -f $(MAIN) $@

doc:
	$(MAKE) -f $(MAIN) vhdocl
