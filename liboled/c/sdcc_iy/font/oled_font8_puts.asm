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

SECTION code_user

PUBLIC _oled_font8_puts
EXTERN asm_oled_glyph8_puts

_oled_font8_puts:
    POP AF ; return address
    POP IY  ; context
    POP HL  ; string

    PUSH AF
    PUSH IX

    ; font into IX
    LD E, (IY+6)
    LD D, (IY+7)
    PUSH DE
    POP IX

    ; buffer_ptr into DE
    LD E, (IY+2)
    LD D, (IY+3)

    ; row offset
    LD C, (IY+4)

    ; font width
    LD B, (IY+5)

    call asm_oled_glyph8_puts

    LD (IY+2), E
    LD (IY+3), D

    POP IX
    RET
