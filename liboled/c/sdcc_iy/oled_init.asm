SECTION code_user

PUBLIC _oled_init

EXTERN asm_oled_init

_oled_init:
    push bc
    push hl
    call asm_oled_init
    pop hl
    pop bc
    ret


