# Modules.tcl: Local include Modules tcl script
# Copyright (C) 2007 CESNET
# Author: Martin Kosek <kosek@liberouter.org>
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
#

# Set paths
set COMP_BASE        "$ENTITY_BASE/../../.."
set FL_BASE          "$ENTITY_BASE/../.."
set FL_FIFO_BASE     "$FL_BASE/storage/fifo"
set FIFO_BASE        "$COMP_BASE/base/fifo/fifo"

# Component source files
set PACKAGES   "$FL_BASE/pkg/fl_pkg.vhd"
set PACKAGES   "$PACKAGES $COMP_BASE/ics/local_bus/pkg/lb_pkg.vhd"

set MOD "$MOD $ENTITY_BASE/agregator_ent.vhd"
set MOD "$MOD $ENTITY_BASE/agregator.vhd"

# Components
set COMPONENTS [list \
   [ list "PKG_MATH"    $COMP_BASE/base/pkg     "MATH"] \
   [ list "FL_FIFO"     $FL_FIFO_BASE           "FULL"] \
   [ list "FIFO"        $FIFO_BASE              "FULL"] \
]

# covers
set MOD "$MOD $ENTITY_BASE/top/agregator_fl64.vhd"
