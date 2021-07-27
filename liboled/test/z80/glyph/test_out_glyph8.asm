SECTION code_user

DEFC BUFFER_SIZE = 512

PUBLIC test_out_glyph8
EXTERN oled_out_glyph8

test_out_glyph8_init:
        LD A, 0
        LD HL, test_out_glyph8_buffer
        LD (HL), 0x00
        LD DE, HL
        INC DE
        LD BC, BUFFER_SIZE-1
        LDIR
        RET

test_out_glyph8:
        call test_out_glyph8_init

        LD DE, test_out_glyph8_buffer
        LD HL, test_out_glyph8_8
        LD BC, 8

        CALL oled_out_glyph8

        RET

SECTION data_user

test_out_glyph8_8:
       DEFB 0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88

test_out_glyph8_4:
        DEFB 0x41,0x42,0x43,0x44

test_out_glyph8_buffer:
        DEFS BUFFER_SIZE