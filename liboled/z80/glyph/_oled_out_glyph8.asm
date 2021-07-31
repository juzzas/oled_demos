;; Output a glyph 8bits high (1 row) on a row boundary.
SECTION code_user

PUBLIC oled_out_glyph8
EXTERN oled_out_glyph8_span


INCLUDE "../_oled_config.asm"

;; entry:
;;        DE = destination address
;;        HL = source address
;;        B = glyph width
;;        C = row_offset
oled_out_glyph8:
        LD A, C
        OR A
        JP NZ, oled_out_glyph8_span

        ; we're on a row boundary, we don't need expensive calculations!
        LD C, B ; swap B and C to allow us to use LDIR
        LD B, A

        LDIR     ; copy data

        RET