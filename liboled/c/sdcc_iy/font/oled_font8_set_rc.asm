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


; extern void oled_font8_set_rc(struct oled_font8_context *context, uint8_t row, uint8_t column) __z88dk_callee;

DEFC OLED_WIDTH = 128

SECTION code_user

PUBLIC _oled_font8_set_rc


_oled_font8_set_rc:
        POP AF ; return address
        POP IY ; arg1 - context
        POP BC ; arg2 - co-ordinates (B = column, C = row)

        PUSH AF ; return address back on stack after clearing

        ; struct oled_font8_context

        ; put buffer base ptr in HL
        LD L, (IY + 0)
        LD H, (IY + 1)

        ; clear row offset
        LD A, 0
        LD (IY + 4), A

        ; add B to HL
        LD A, B
        ADD A, L    ; A = A+L
        LD L, A     ; L = A+L
        ADC A, H    ; A = A+L+H+carry
        SUB L       ; A = H+carry
        LD H, A     ; H = H+carry

        ; add 128 for each row
        LD DE, OLED_WIDTH
        LD A, C

loop_add:
        OR A
        JR Z, skip_add

        ADD HL, DE
        DEC A
        JR loop_add

skip_add:
        LD (IY + 2), L
        LD (IY + 3), H

        RET
