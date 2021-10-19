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


;; Output a glyph 8bits high (1 row) over a row boundary.

;; Note: This routine does not check for overflow

SECTION code_user

INCLUDE "../_oled_config.asm"

PUBLIC oled_out_glyph8_span_mask

;; entry:
;;        DE = destination address
;;        IX = source address
;;        IY = mask source address
;;        B = glyph width
;;        C = row_offset
;;
;; exit:
;;        DE = incremented destination address
;;        IX = incremented source address
;;        IY = incremented mask source address

oled_out_glyph8_span_mask:
        PUSH DE      ; store destination address in DE'
        EXX
        POP DE
        EXX

glyph_loop:
        ; loop for each width
        PUSH BC      ; store width and row offset

;; shift data
        LD B, C      ; temp row offset

        ; entry: IX = pointer source glyph data
        ;        B = shift
        ;
        ; exit:  HL = data shifted by B bits
        LD H, 0
        LD L, (IX+0)
data_shift_loop:
        ADD HL, HL
        DJNZ data_shift_loop
        PUSH HL      ; push data on stack

;; shift mask
        LD B, C      ; temp row offset
        LD A, (IY+0)

        ; entry: A = mask
        ;        B = shift
        LD H, 0
        LD L, A
mask_shift_loop:
        ADD HL, HL
        DJNZ mask_shift_loop
        ; exit:  HL = mask shifted by B bits, bits inverted

        ; invert mask
        LD A, H
        CPL
        LD H, A

        LD A, L
        CPL
        LD L, A

        PUSH HL      ; push mask on stack

;; load column span of two rows as 16bit value
        ; load the data from two rows 16-bit value. LSB is current address, MSB is address + 128
        ; DE = pointer to current pointer
        ;
        LD A, (DE)
        LD C, A
        LD HL, OLED_WIDTH
        ADD HL, DE
        LD A, (HL)
        LD B, A
        ; exit: BC = 16 bit value

        LD HL, BC      ; restore current data
        POP DE         ; restore mask
        POP BC         ; restore data

;; merge masked new data onto destination
        ; entry: HL = 16bit current data
        ;        DE = 16bit mask
        ;        BC = 16bit data
        LD A, H
        AND D
        OR B
        LD H, A

        LD A, L
        AND E
        OR C
        LD L, A
        ; exit:  HL = 16bit destination data

; write data, and increment pointers
        EXX       ; 4
        PUSH DE   ; 11
        PUSH DE   ; 11
        INC DE    ; increment destination for next time
        EXX       ; 4
        POP DE    ; 10

        EX DE, HL
        LD (HL), E
        LD BC, OLED_WIDTH
        ADD HL, BC
        LD (HL), D
        POP DE

        INC IX
        INC IY

        ; loop for next iteration
        POP BC   ; count
        DJNZ glyph_loop

        EXX    ; let DE' be the exit condition

        RET
