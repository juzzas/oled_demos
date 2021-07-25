; extern void oled_gfx_font8x8_puts(struct oled_gfx_font8x8_context *context, const char *str);

;  struct oled_gfx_font8x8_context
;  {
;      uint8_t x;
;      uint8_t y;
;      uint8_t ink;
;      uint8_t paper;
;      void *font_8x8;
;  };

; Entry:
;     context address             IY
;     address of string to print  HL

SECTION code_user

EXTERN asm_oled_gfx_font8x8_puts

PUBLIC _oled_gfx_font8x8_puts

_oled_gfx_font8x8_puts:
    POP AF ; return address
    POP DE  ; context
    POP HL  ; string

    PUSH AF
    PUSH IY

    LD IY, DE

    call asm_oled_gfx_font8x8_puts

    POP IY
    RET
