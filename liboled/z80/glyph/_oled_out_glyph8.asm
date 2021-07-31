;; Output a glyph 8bits high (1 row) on a row boundary.
SECTION code_user

PUBLIC oled_out_glyph8


INCLUDE "../_oled_config.asm"

;; entry:
;;        DE = destination address
;;        HL = source address
;;        B = glyph width
;;        C = row_offset (must be 0)
oled_out_glyph8:
        LD A, C  ; swap B and C to allow us to use LDIR
        LD C, B
        LD B, A

        LDIR     ; copy data

        RET