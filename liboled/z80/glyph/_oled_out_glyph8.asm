;; Output a glyph 8bits high (1 row) on a row boundary.
SECTION code_user

PUBLIC oled_out_glyph8


INCLUDE "../_oled_config.asm"

;; entry:
;;        DE = destination address
;;        HL = source address
;;        BC = glyph width
oled_out_glyph8:
        LDIR

        RET