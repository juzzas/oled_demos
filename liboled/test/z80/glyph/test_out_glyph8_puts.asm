SECTION code_user

PUBLIC test_out_glyph8_puts
EXTERN asm_oled_glyph8_puts
EXTERN oled_glyph8_std_font8
EXTERN test_buffer


test_out_glyph8_puts:
        LD DE, test_buffer
        LD IX, oled_glyph8_std_font8
        LD B, 8   ; width
        LD C, 0   ; offset

        LD HL, test_message

        CALL asm_oled_glyph8_puts

        RET

test_message:
        DEFB 'H', 'i', '!', 0