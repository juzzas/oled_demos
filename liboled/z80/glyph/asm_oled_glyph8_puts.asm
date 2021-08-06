SECTION code_user

PUBLIC asm_oled_glyph8_puts
EXTERN asm_oled_glyph8_putc


;; entry:
;;        HL = pointer to string (nul-terminated)
;;        DE = destination address
;;        IX = font base
;;        B = glyph width
;;        C = row_offset
;;
;; exit:
;;        DE = incremented destination address


asm_oled_glyph8_puts:
        LD A, (HL)
        OR A
        RET Z

        INC HL
        PUSH HL
        PUSH BC
        PUSH IX

        CALL asm_oled_glyph8_putc

        POP IX
        POP BC
        POP HL

        JR asm_oled_glyph8_puts
