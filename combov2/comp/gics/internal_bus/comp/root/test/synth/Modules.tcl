# 
# Modules.tcl: 
# Copyright (C) 2007 CESNET
# Author(s): Pavol Korcek <korcek@liberouter.org>
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
# $Id$

global FIRMWARE_BASE

set IB_EP_BASE       "$FIRMWARE_BASE/comp/ics/internal_bus/comp/ib_endpoint" 
set PCIE_BASE        "$FIRMWARE_BASE/cards/combov2/chips/comp/pci"
set DMA_TEST_BASE    "$FIRMWARE_BASE/comp/gics/internal_bus/comp/root/test"
set CLK_GEN_BASE     "$FIRMWARE_BASE/comp/base/misc/clk_gen"

set COMPONENTS [list \
   [list "PCIE"      $PCIE_BASE        "FULL" ] \
   [list "IB_EP"     $IB_EP_BASE       "FULL" ] \
   [list "DMA_TEST"  $DMA_TEST_BASE    "FULL" ] \
   [list "CLK_GEN"   $CLK_GEN_BASE     "FULL" ] \
]
