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


;; Output a glyph 8bits high (1 row) on a row boundary.
SECTION code_user

PUBLIC oled_out_glyph8
EXTERN oled_out_glyph8_span


INCLUDE "../_oled_config.asm"

;; entry:
;;        DE = destination address
;;        IX = source address
;;        B = glyph width
;;        C = row_offset
;;
;; exit:
;;        DE = incremented destination address
;;
;; Note:
;;        IY reserved for mask source address

oled_out_glyph8:
        LD A, C
        OR A
        JP NZ, oled_out_glyph8_span

        ; we're on a row boundary, we don't need expensive calculations!
        LD C, B ; swap B and C to allow us to use LDIR
        LD B, A

        PUSH IX ; copy source ptr to HL
        POP HL

        LDIR     ; copy data

        RET