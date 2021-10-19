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
PUBLIC asm_oled_row_offset_to_addr

DEFC OLED_WIDTH = 128

;; ENTRY
;;        B = column
;;        C = row
;;       HL = buffer base pointer
;;
;; EXIT
;;       HL = destination
;;
;; USES
;;       DE, A
;;
;; RETAINS
;;       BC

asm_oled_row_offset_to_addr:
        LD A, B

        ADD A, L    ; A = A+L
        LD L, A     ; L = A+L
        ADC A, H    ; A = A+L+H+carry
        SUB L       ; A = H+carry
        LD H, A     ; H = H+carry

        ; do we need to add any rows?
        LD A, C
        OR A
        JR Z, skip_add

        ; add 128 for each row
        LD DE, OLED_WIDTH

loop_add:
        ADD HL, DE
        DEC A
        OR A
        JR NZ, loop_add

skip_add:
        RET
