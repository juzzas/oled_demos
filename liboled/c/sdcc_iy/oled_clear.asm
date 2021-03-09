SECTION code_user

PUBLIC _oled_clear

EXTERN asm_oled_clear

_oled_clear:
    push bc
    push hl
    call asm_oled_clear
    pop hl
    pop bc
    ret
