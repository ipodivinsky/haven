#*******************************************************************************
#*      "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
#*******************************************************************************

# project
project("DPI wrapper for communication with HW on FPGA")
cmake_minimum_required(VERSION 2.6 FATAL_ERROR)

# set(CMAKE_CXX_COMPILER g++34)
set(TARGET_NAME dpi_wrapper_pkg)
set(TOOLS_DIR /home/potesil/codasip)
set(SZE_DIR /usr/local/liberouter)

# include checks and basic variables
include(${TOOLS_DIR}/cmake/foreign.cmake)

include_directories(${MODELSIM_DIR}/include)
include_directories(${TOOLS_DIR}/include)
include_directories(${SZE_DIR}/include)
link_directories(${TOOLS_DIR}/lib)
link_directories(${SZE_DIR}/lib)

if(WIN32)
    link_directories(${MODELSIM_DIR}/win32)
    set(FOREIGN_LINK "-l mtipli")
endif()

# we are using dpi
add_definitions(-DUSE_DPI)

set(CMAKE_POSITION_INDEPENDENT_CODE ON)

add_library(dpi_wrapper_pkg SHARED libdpi_wrapper_pkg.cpp)

# link libraries
target_link_libraries(${TARGET_NAME} sze2 objfilelib elfconvl -Wl,--start-group  -Wl,--end-group ${FOREIGN_LINK})

install(TARGETS ${TARGET_NAME} DESTINATION ${CMAKE_SOURCE_DIR})
