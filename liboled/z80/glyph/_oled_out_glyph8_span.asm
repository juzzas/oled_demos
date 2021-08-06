;; Output a glyph 8bits high (1 row) on a row boundary.

;; Note: This routine does not check for overflow

SECTION code_user

INCLUDE "../_oled_config.asm"

PUBLIC oled_out_glyph8_span

;; entry:
;;        DE = destination address
;;        IX = source address
;;        B = glyph width
;;        C = row_offset
;;
;; exit:
;;        DE = incremented destination address

oled_out_glyph8_span:
        PUSH IY

        ; store destination address
        LD IY, DE

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
        LD A, 0xff

        ; entry: A = mask
        ;        B = shift
        ;
        ; exit:  HL = mask shifted by B bits, bits inverted
        LD H, 0
        LD L, A
mask_shift_loop:
        ADD HL, HL
        DJNZ mask_shift_loop

        LD A, H
        CPL
        LD H, A

        LD A, L
        CPL
        LD L, A

        PUSH HL      ; push mask on stack

        LD HL, IY

;; load column span of two rows as 16bit value
        ; load the data from two rows 16-bit value. LSB is current address, MSB is address + 128
        ; DE = pointer to current pointer
        ;
        ; exit: BC = 16 bit value
        LD A, (DE)
        LD C, A
        LD HL, OLED_WIDTH
        ADD HL, DE
        LD A, (HL)
        LD B, A
        PUSH BC

        POP HL         ; restore current data
        POP DE         ; restore mask
        POP BC         ; restore data

;; merge masked new data onto destination
        ; entry: HL = 16bit current data
        ;        DE = 16bit mask
        ;        BC = 16 bit data
        ;
        ; exit:  HL = 16bit destination data
        LD A, H
        AND D
        OR B
        LD H, A

        LD A, L
        AND E
        OR C
        LD L, A

; write data, and increment pointers
        LD DE, IY
        LD (IY+0), L
        LD BC, OLED_WIDTH
        ADD IY, BC
        LD (IY+0), H
        LD IY, DE

        INC IY
        INC IX

        ; loop for next iteration
        POP BC   ; count
        DJNZ glyph_loop

        LD DE, IY

        POP IY
        RET
