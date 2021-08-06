SECTION code_user

DEFC BUFFER_SIZE = 512

PUBLIC test_out_glyph8
EXTERN asm_oled_glyph8_output
EXTERN test_glyph8
EXTERN test_buffer


test_out_glyph8:
        LD DE, test_buffer
        LD IX, test_glyph8
        LD B, 8   ; width
        LD C, 0   ; offset

        CALL asm_oled_glyph8_output

        RET
