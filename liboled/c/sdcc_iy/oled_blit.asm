;
; void oled_blit(uint8_t *buffer) __z88dk_fastcall;


SECTION code_user

PUBLIC _oled_blit

EXTERN asm_oled_blit

_oled_blit:
    push bc
    push hl
    push de
    call asm_oled_blit
    pop de
    pop hl
    pop bc
    ret
