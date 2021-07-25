; extern void oled_gfx_font8x8_set_rc(struct oled_gfx_font8x8_context *context, uint8_t row, uint8_t column);


;  struct oled_gfx_font8x8_context
;  {
;    uint8_t column;
;    uint8_t row;
;    uint8_t row_offset;
;    uint8_t reserved;
;    void *font_8x8;
;  };

; Entry:
;     context address            IY
;     co-ordinates row           H
;                  column        L

SECTION code_user

EXTERN asm_oled_gfx_font8x8_set_rc
PUBLIC _oled_gfx_font8x8_set_rc


_oled_gfx_font8x8_set_rc:
    POP AF ; return address
    POP DE ; arg1 - context
    POP HL ; arg2 - co-ordinates

    PUSH AF
    PUSH IY
    LD IY, DE

    call asm_oled_gfx_font8x8_set_rc

    POP IY
    RET
