SECTION code_user

DEFC BUFFER_SIZE = 512

PUBLIC test_out_glyph8_span
EXTERN oled_out_glyph8_span

test_out_glyph8_span_init:
        LD A, 0
        LD HL, test_out_glyph8_span_buffer
        LD (HL), 0x00
        LD DE, HL
        INC DE
        LD BC, BUFFER_SIZE-1
        LDIR
        RET

test_out_glyph8_span:
        call test_out_glyph8_span_init

        LD DE, test_out_glyph8_span_buffer
        LD HL, test_out_glyph8_span_8
        LD B, 8
        LD C, 4   ; offset

        CALL oled_out_glyph8_span

        RET

SECTION data_user

test_out_glyph8_span_8:
        DEFB 81,82,83,84,85,86,87,88

test_out_glyph8_span_4:
        DEFB 41,42,43,44

test_out_glyph8_span_buffer:
        DEFS BUFFER_SIZE