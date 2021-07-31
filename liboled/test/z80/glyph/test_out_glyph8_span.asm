SECTION code_user

DEFC BUFFER_SIZE = 512

PUBLIC test_out_glyph8_span
EXTERN oled_out_glyph8
EXTERN test_glyph8
EXTERN test_buffer


test_out_glyph8_span:
        LD DE, test_buffer
        LD HL, test_glyph8
        LD B, 8   ; width
        LD C, 4   ; offset

        CALL oled_out_glyph8

        RET


