; extern void oled_gfx_font_puts(struct oled_gfx_font_context *context, const char *str);

;  struct oled_gfx_font_context
;  {
;      uint8_t column;
;      uint8_t row;
;      uint8_t row_offset;
;      uint8_t font_width;
;      void *font;
;  };

; Entry:
;     context address             IY
;     address of string to print  HL

SECTION code_user

PUBLIC asm_oled_gfx_font8_puts
EXTERN asm_oled_gfx_font8_putc


asm_oled_gfx_font8_puts:
    LD A, (HL)
    CP 0
    RET Z

    ; character to print is in A
    CALL asm_oled_gfx_font_putc

    INC HL

    JR asm_oled_gfx_font_puts



