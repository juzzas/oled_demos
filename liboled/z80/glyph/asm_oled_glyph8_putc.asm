; Copyright 2021 Justin Skists
;
; Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
; documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
; rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
; persons to whom the Software is furnished to do so, subject to the following conditions:
;
; The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
; Software.
;
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
; WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
; COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
; OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


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

        PUSH HL
        POP IX

        JP asm_oled_glyph8_output

