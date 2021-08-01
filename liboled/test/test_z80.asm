SECTION code_user


PUBLIC _main
PUBLIC test_glyph8
PUBLIC test_buffer

EXTERN test_out_glyph8
EXTERN test_out_glyph8_span
EXTERN test_out_glyph8_putc
EXTERN test_out_glyph8_puts

DEFC BUFFER_SIZE=512

_main:
    LD A, 0
    CALL memset_buffer
    CALL test_out_glyph8

    LD A, 0
    CALL memset_buffer
    CALL test_out_glyph8_span

    LD A, 0xA5
    CALL memset_buffer
    CALL test_out_glyph8_span

    LD A, 0
    CALL memset_buffer
    CALL test_out_glyph8_putc

    LD A, 0
    CALL memset_buffer
    CALL test_out_glyph8_puts

    RET

; entry: A= data to set buffer
memset_buffer:
        LD HL, test_buffer
        LD (HL), A
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