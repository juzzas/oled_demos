; copyright 2021 justin skists
;
; permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
; documentation files (the "software"), to deal in the software without restriction, including without limitation the
; rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the software, and to permit
; persons to whom the software is furnished to do so, subject to the following conditions:
;
; the above copyright notice and this permission notice shall be included in all copies or substantial portions of the
; software.
;
; the software is provided "as is", without warranty of any kind, express or implied, including but not limited to the
; warranties of merchantability, fitness for a particular purpose and noninfringement. in no event shall the authors or
; copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or
; otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.


; extern void oled_font8_set_rc(struct oled_font8_context *context, uint8_t row, uint8_t column) __z88dk_callee;

DEFC OLED_WIDTH = 128

SECTION code_user

PUBLIC _oled_font8_set_xy


_oled_font8_set_xy:
        POP AF ; return address
        POP IY ; arg1 - context
        POP BC ; arg2 - co-ordinates (B = Y, C = X)

        PUSH AF ; return address back on stack after clearing

        ; struct oled_font8_context

        ; row offset?
        LD A, B
        AND 0x07
        LD (IY + 4), A

        ; find row
        SRL B
        SRL B
        SRL B

        ; put buffer base ptr in HL
        LD L, (IY + 0)
        LD H, (IY + 1)

        ; add C to HL
        LD A, C

        ADD A, L    ; A = A+L
        LD L, A     ; L = A+L
        ADC A, H    ; A = A+L+H+carry
        SUB L       ; A = H+carry
        LD H, A     ; H = H+carry

        ; add 128 for each row
        LD DE, OLED_WIDTH
        LD A, B

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
