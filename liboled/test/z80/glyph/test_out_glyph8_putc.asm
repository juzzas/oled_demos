SECTION code_user

PUBLIC test_out_glyph8_putc
EXTERN asm_oled_glyph8_putc
EXTERN oled_glyph8_std_font8
EXTERN test_buffer


test_out_glyph8_putc:
        LD DE, test_buffer
        LD HL, oled_glyph8_std_font8
        LD B, 8   ; width
        LD C, 0   ; offset

        LD A, '!'

        CALL asm_oled_glyph8_putc

        RET
