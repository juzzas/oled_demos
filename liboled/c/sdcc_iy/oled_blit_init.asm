;
; void oled_blit(uint8_t *buffer) __z88dk_fastcall;


SECTION code_user

PUBLIC _oled_blit_init

EXTERN asm_oled_blit_init

_oled_blit_init:
    push bc
    push hl
    call asm_oled_blit_init
    pop hl
    pop bc
    ret
