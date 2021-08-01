SECTION code_user

PUBLIC asm_oled_glyph8_putc
EXTERN asm_oled_glyph8_output


;; entry:
;;        A = character
;;        DE = destination address
;;        IX = font base
;;        B = glyph width
;;        C = row_offset
;;
;; exit:
;;        DE = incremented destination address


asm_oled_glyph8_putc:
        PUSH DE                 ; push destination address
        PUSH IX                 ; push font base
        PUSH BC                 ; push width/offset

        ; find offset of the first byte of the character in font data (0 based)
        LD HL, 0
        LD D, 0
        LD E, A

mult_width_loop:
        ADD HL, DE              ; multiply character by font_width
        DJNZ mult_width_loop

        ; HL now points to font's character offset

        POP BC                  ; retreive width/offset

        POP DE      ; retrieve font base from stack
        ADD HL, DE  ; HL points to font data for specified character

        POP DE      ; retrieve destination address

        JP asm_oled_glyph8_output

