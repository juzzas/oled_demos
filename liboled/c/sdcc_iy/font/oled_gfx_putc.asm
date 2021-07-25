; extern void oled_gfx_font8x8_putc(struct oled_gfx_font8x8_context *context, uint16_t ch);

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
;     character                  HL

SECTION code_user

EXTERN asm_oled_gfx_font8x8_putc

PUBLIC _oled_gfx_font8x8_putc

_oled_gfx_font8x8_putc:
    POP AF ; return address
    POP DE  ; context
    POP HL  ; character

    PUSH AF
    PUSH IY

    LD IY, DE

    call asm_oled_gfx_font8x8_putc

    POP IY
    RET
