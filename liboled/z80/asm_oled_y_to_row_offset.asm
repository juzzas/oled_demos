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
PUBLIC asm_oled_y_to_row_offset

DEFC OLED_PIXEL_HEIGHT = 32

;; ENTRY
;;        A = Y-coordinate
;;
;; Note: XY coordinates origin bottom right
;;
;; EXIT
;;        H = row
;;        L = offset

asm_oled_y_to_row_offset:
        ; invert Y-axis
        LD H, A

        LD A, OLED_PIXEL_HEIGHT
        SUB H

        LD A, H

        ; find offset
        AND 0x07
        LD L, A

        ; find row
        SRL H
        SRL H
        SRL H

        RET

