SECTION code_user


PUBLIC _main
PUBLIC clear_buffer
PUBLIC test_glyph8
PUBLIC test_buffer

EXTERN test_out_glyph8
EXTERN test_out_glyph8_span
DEFC BUFFER_SIZE=512

_main:
    CALL test_out_glyph8
    CALL test_out_glyph8_span
    RET

clear_buffer:
        LD A, 0
        LD HL, test_buffer
        LD (HL), 0x00
        LD DE, HL
        INC DE
        LD BC, BUFFER_SIZE-1
        LDIR
        RET


SECTION data_user

test_glyph8:
        DEFB 0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88

test_buffer:
        DEFS BUFFER_SIZE