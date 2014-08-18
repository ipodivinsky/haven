/* *****************************************************************************
 * Project Name: Hardware - Software Framework for Functional Verification 
 * File Name:    C Wrapper
 * Description: 
 * Author:       Marcela Simkova <isimkova@fit.vutbr.cz> 
 * Date:         11.7.2014 
 * ************************************************************************** */


#include "objectfile.h"
#include "isacctypes.h"
#include "isacexceptions.h"
#include "number_cast.h"
#include <stdint.h>
#include <cstdlib>
#include <cstring>
#include <mti.h>

// library does not count with C++ compiler
#ifdef __cplusplus
extern "C" {
#endif

#include <libsze2.h>

#ifdef __cplusplus
}   // extern "C"
#endif

#ifndef CHECK_CONDITION
#define CHECK_CONDITION(a, b) \
    if (!(a)) throw codasip::exceptions::CGeneralError((b));
#endif


namespace codasip {
namespace foreign {
namespace {

enum
{   /// size of memory 'mem'
    MEM_SIZE = 524288,
    /// size of register file 'regs'
    REGS_SIZE = 32,
    BYTES_PER_WORD = 4,
    PACKET_SIZE = 16,
    HEADER_SIZE = 8,
    HEADER_TRANS_TYPE_INDEX = 0,
    REGS_DATA = 2,
    MEM_DATA = 3,
    MAX_RECEIVED_DATA_SIZE = 4096
};

/// context data for libsze
static struct szedata*  g_SZE = NULL;
/// memory buffer
static unsigned char    g_mem[MEM_SIZE];
/// register file buffer
static uint32_t         g_regs[REGS_SIZE];

/**
 *  \internal
 *  \brief  Sets error message to the TCL global variable and indicates fatal
 *          error.
 *  \param  e exception holding source error message.
 */
inline void HandleException( const std::string& msg )
{
    if ( g_SZE )
    {
        szedata_close( g_SZE );
        g_SZE = NULL;
    }
    const std::string cmd1 = std::string("global MTI_ERROR_MSG");
    const std::string cmd2 = std::string("set MTI_ERROR_MSG \"") + msg + '"';
    mti_Command( const_cast<char*>(cmd1.c_str()) );
    mti_Command( const_cast<char*>(cmd2.c_str()) );
    mti_FatalError();
}
/**
 *  \internal
 *  \brief  Indicates whether given section should be loaded or not. Currently
 *          debug and info section should not be loaded.
 *  \param  section section to check
 *  \param  forceHeapAndStack indicates whether default heap and stack section
 *          is forced to be loaded or not.
 */
inline bool IsLoadable( const ObjectFile::CSection& section,
    const bool forceHeapAndStack )
{
    if ( (section.GetType() != ObjectFile::CSection::DEBUG) &&
        (section.GetType() != ObjectFile::CSection::INFO) )
    {
        if ( section.IsStack(forceHeapAndStack) ||
            section.IsHeap(forceHeapAndStack) )
        {
            return forceHeapAndStack;
        }
        return true;
    }
    return false;
}
/**
 *  \internal
 *  \brief  Indicates whether given section should be loaded or not.
 *  \param  ads address space identifier which must match the one stored in
 *          given section
 *  \copydetails IsLoadable(const ObjectFile::CSection&, const bool)
 */
inline bool IsLoadable( const ObjectFile::CSection& section,
    const std::string& ads,
    const bool forceHeapAndStack )
{
    return IsLoadable(section, forceHeapAndStack) &&
        (section.GetAddressSpace() == ads);
}
/**
 *  \internal
 *  \brief  Data transport through DMA channel - transaction is sent to hardware.
 */
void SendData( const uint8_t* data, const unsigned int pktSize )
{
    uint8_t* test_data;
    unsigned int len;
    unsigned short ifc  = 0;
    // prepare packet for transfer to hardware
    test_data = szedata_prepare_packet( g_SZE, NULL, 0, data, pktSize, &len );
    // szewrite - send data to hardware
    CHECK_CONDITION( szedata_try_write_next(g_SZE, test_data, len, ifc) == 0,
        "Failed to send packet data to hardware." );
}
/**
 *  \internal
 *  \brief  Data transport through DMA channel - transaction is received from
 *          hardware.
 */
unsigned int ReceiveData( uint8_t* outData )
{
    unsigned int len;
    uint8_t* data;

    // read next data from the buffer
    data = szedata_read_next( g_SZE, &len );

    if (data)
    {
//        unsigned short print_options = SZE2_PRINT_OPTION_SW |
//            SZE2_PRINT_OPTION_HW |
//            SZE2_PRINT_OPTION_ALL;
//        szedata_print_packet(data, print_options);
        // in case the length read is smaller than expected
        // (i.e. there is not complete header or any data)
        CHECK_CONDITION( len > HEADER_SIZE,
            "Received data too small: " + IntToStr(len) );
        // in case the length read is bigger than expected
        // (i.e. there is some other problem)
        CHECK_CONDITION( len < MAX_RECEIVED_DATA_SIZE,
            "Received data too large: " + IntToStr(len) );

        // in case something was read, copy it to the SystemVerilog array
        // omit the first 8 bytes so that we can omit the NetCOPE header

        // !!!!!!!!!!!!!!!!!! ATTENTION !!!!!!!!!!!!!!!!!!!!!!!!!!
        // the following is ONLY for debugging purposes, so that the wrapper would
        // work with FL_HW_MONITOR_SMART without changes to the SystemVerilog
        // code! After the SystemVerilog code is changed to reflect this, delete
        // the following two lines and uncomment the other ones.
        //data += 16;
        //len -= 16;

        data += HEADER_SIZE;
        len -= HEADER_SIZE;
        // copy to the SystemVerilog array without the NetCOPE header
        memcpy( outData, data, len );

        return len;
    }
    else
    {
        return 0;
    }
}

}   // anonymous namespace
}   // namespace codasip::foreign
}   // namespace codasip


#ifdef __cplusplus
extern "C" {
#endif

/**
 *  \brief  Open DMA channel for data transport.
 */
void codasip_dpi_open_dma()
{
    using namespace codasip::foreign;
    try
    {   // path to hw device
        const std::string SZE_DEV = "/dev/szedataII0";
        unsigned int rx = SZE2_ALL_INTERFACES;
        unsigned int tx = SZE2_ALL_INTERFACES;

        CHECK_CONDITION( !g_SZE, "DMA channel to device '" + SZE_DEV +
            "'already initialized." );
        // create sze
        g_SZE = szedata_open( SZE_DEV.c_str() );
        CHECK_CONDITION( g_SZE, "Failed to open DMA channel to device '" +
            SZE_DEV + "'." );
        CHECK_CONDITION( szedata_subscribe3(g_SZE, &rx, &tx) == 0,
            "Failed to create subscription to device '" + SZE_DEV + "'." );
        CHECK_CONDITION( szedata_start(g_SZE) == 0,
            "Failed to start DMA channel to device '" + SZE_DEV + "'." );
    }
    catch ( std::exception& e )
    {
        HandleException( e.what() );
    }
}

/**
 *  \brief  Close DMA channel after data transport.
 */
void codasip_dpi_close_dma()
{
    using namespace codasip::foreign;
    try
    {
        CHECK_CONDITION( g_SZE, "SZE: failed to close DMA channel, wasn't opened or already closed." );
        szedata_close( g_SZE );
        g_SZE = NULL;
    }
    catch ( std::exception& e )
    {
        HandleException( e.what() );
    }
}

/**
 *  \brief  Send start packet through DMA channel.
 */
void codasip_dpi_send_start()
{
    using namespace codasip::foreign;
    try
    {
        unsigned char packet[PACKET_SIZE];
        memset( packet, 0, PACKET_SIZE );
        // signature of start packet
        packet[4] = 1;
        SendData( packet, sizeof(packet) );
    }
    catch ( std::exception& e )
    {
        HandleException( "Failed to send start packet." );
    }
}

/**
 *  \brief  Send stop packet through DMA channel.
 */
void codasip_dpi_send_stop()
{
    using namespace codasip::foreign;
    try
    {
        unsigned char packet[PACKET_SIZE];
        memset( packet, 0, PACKET_SIZE );
        // signature of stop packet
        packet[4] = 4;
        SendData( packet, sizeof(packet) );
    }
    catch ( std::exception& e )
    {
        HandleException( "Failed to send stop packet." );
    }
}

/**
 *  \brief  Send memory content (loaded from application) to HW.
 */
void codasip_dpi_send_all()
{
    using namespace codasip::foreign;
    try
    {
        uint8_t packet[PACKET_SIZE];
        memset( packet, 0, PACKET_SIZE );

        for ( int i = 0; i < MEM_SIZE; i += PACKET_SIZE - HEADER_SIZE )
        {
            memcpy( packet + HEADER_SIZE, g_mem + i, PACKET_SIZE - HEADER_SIZE );
            SendData( packet, sizeof(packet) );
        }
    }
    catch ( std::exception& e )
    {
        HandleException( e.what() );
    }
}

/**
 *  \brief  Receive all data from HW (memory and register file content).
 */
void codasip_dpi_receive_all()
{
    using namespace codasip::foreign;
    try
    {
        codasip_address_t mem_offset = 0, regs_offset = 0;
        uint8_t buffer[MAX_RECEIVED_DATA_SIZE];

        while ( (mem_offset < MEM_SIZE) || (regs_offset < REGS_SIZE) )
        {
            codasip_address_t size = ReceiveData( buffer );
            if ( size == 0 )
            {
                continue;
            }
            if ( buffer[HEADER_TRANS_TYPE_INDEX] == MEM_DATA )
            {
                const codasip_address_t length = std::min(
                    MEM_SIZE - mem_offset,
                    size - HEADER_SIZE );
                memcpy( g_mem + mem_offset,
                    buffer + HEADER_SIZE,
                    length );
                mem_offset += length;
            }
            else if ( buffer[HEADER_TRANS_TYPE_INDEX] == REGS_DATA )
            {   // registers always arrive in one block
                regs_offset = std::min<codasip_address_t>(
                    REGS_SIZE * BYTES_PER_WORD,
                    size - HEADER_SIZE );
                memcpy( g_regs,
                    buffer + HEADER_SIZE,
                    regs_offset );
            }
        }
    }
    catch ( std::exception& e )
    {
        HandleException( e.what() );
    }
}

/**
 *  \brief  DPI interface to initialize memory content from executable file.
 *  \param  file path to binary (executable) file, source data for the
 *          initialization
 *  \param  addressSpace name of the address space
 */
void codasip_dpi_mem_init( const char* file, const char* addressSpace )
{
    using namespace codasip::foreign;
    try
    {
        ObjectFile::CObjectFile executable;
        executable.LoadFile( file );
        // do not load default heap and stack sections
        const bool forceHeapAndStack = false;

        memset( g_mem, 0, MEM_SIZE );
        memset( g_regs, 0, REGS_SIZE );

        const int sectionCount = executable.SectionsCount();
        for ( int ii = 0; ii < sectionCount; ++ii )
        {   // process every section
            const ObjectFile::CSection* section = executable.GetSection( ii );
            const ObjectFile::CSectionData* data = section->GetSectionData();
            // ignore these sections
            if ( !IsLoadable(*section, addressSpace, forceHeapAndStack) )
            {
                continue;
            }
            // check, that the section is valid
            CHECK_CONDITION( section->GetMemoryByteAddressIsAbsolute(),
                "Loaded file does not contain absolute sections." );

            // some constants from the executable
            const codasip_address_t secSize = section->GetSectionDataByteCount();

            std::string byte;
            for ( codasip_address_t secIndex = 0, storageIndex = section->GetMemoryByteAddress();
                (storageIndex < MEM_SIZE) && (secIndex < secSize);
                storageIndex += 1, secIndex += 1 )
            {   // obtain one byte of data
                byte = data->GetByte( secIndex );
                // data storage has different byte order
                std::reverse( byte.begin(), byte.end() );
                g_mem[storageIndex] = strtoul( byte.c_str(), NULL, 2 );
            }
        }
    }
    catch ( std::exception& e )
    {
        HandleException( e.what() );
    }
}

/**
 *  \brief  DPI interface to read single word memory.
 *  \param  addr memory address to read. Currently it must be 32 bit long.
 *  \return word value
 */
uint32_t codasip_dpi_mem_read( const codasip_address_t addr )
{
    using namespace codasip::foreign;
    try
    {
        using codasip::IntToStr;
        CHECK_CONDITION( addr < MEM_SIZE,
            "Memory address out-of-range, maximum memory size: " +
            IntToStr<codasip_address_t>(MEM_SIZE) +
            "', requested address: " + IntToStr(addr) );
        return (g_mem[addr +3] << 24) |
            (g_mem[addr +2] << 16) |
            (g_mem[addr +1] << 8) |
            g_mem[addr];
    }
    catch ( std::exception& e )
    {
        HandleException( e.what() );
    }
    return 0;
}

/**
 *  \brief  DPI interface to read single word memory.
 *  \param  addr memory address to read. Currently it must be 32 bit long.
 *  \return word value
 */
uint32_t codasip_dpi_regs_read( const codasip_address_t addr )
{
    using namespace codasip::foreign;
    try
    {
        using codasip::IntToStr;
        CHECK_CONDITION( addr < REGS_SIZE,
            "Register file address out-of-range, maximum memory size: " +
            IntToStr<codasip_address_t>(REGS_SIZE) +
            "', requested address: " + IntToStr(addr) );
        return g_regs[addr];
    }
    catch ( std::exception& e )
    {
        HandleException( e.what() );
    }
    return 0;
}

#ifdef __cplusplus
}   // extern "C"
#endif
