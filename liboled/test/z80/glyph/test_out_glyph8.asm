SECTION code_user

DEFC BUFFER_SIZE = 512

PUBLIC test_out_glyph8
EXTERN oled_out_glyph8
EXTERN test_glyph8
EXTERN test_buffer


test_out_glyph8:
        LD DE, test_buffer
        LD HL, test_glyph8
        LD B, 8   ; width
        LD C, 0   ; offset

        CALL oled_out_glyph8

        RET
