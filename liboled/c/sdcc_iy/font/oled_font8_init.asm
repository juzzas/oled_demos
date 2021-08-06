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
;

;extern void oled_font8_init(struct oled_font8_context *context, uint8_t *buffer, uint8_t *font, uint8_t font_width) __z88dk_callee;

SECTION code_user

PUBLIC _oled_font8_init


_oled_font8_init:
        POP AF ; return address
        POP BC ; arg4 - font_width
        POP HL ; arg3 - font data
        POP DE ; arg2 - buffer
        POP IY ; arg1 - context

        PUSH AF

        ; struct oled_font8_context
        LD (IY + 0), E
        LD (IY + 1), D
        LD (IY + 2), E
        LD (IY + 3), D
        LD (IY + 4), 0
        LD (IY + 5), C
        LD (IY + 6), L
        LD (IY + 7), H

        RET
