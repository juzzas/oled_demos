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

        CALL asm_oled_glyph8_putc

        POP BC
        POP HL

        JR asm_oled_glyph8_puts
