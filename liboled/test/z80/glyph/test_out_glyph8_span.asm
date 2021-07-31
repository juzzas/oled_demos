SECTION code_user

DEFC BUFFER_SIZE = 512

PUBLIC test_out_glyph8_span
EXTERN oled_out_glyph8_span
EXTERN clear_buffer
EXTERN test_glyph8
EXTERN test_buffer


test_out_glyph8_span:
        call clear_buffer

        LD DE, test_buffer
        LD HL, test_glyph8
        LD B, 8
        LD C, 4   ; offset

        CALL oled_out_glyph8_span

        RET

