SECTION code_user

PUBLIC _oled_init

EXTERN asm_oled_reset
EXTERN asm_oled_cmd

_oled_init:
    push bc
    push hl
    call asm_oled_init
    pop hl
    pop bc
    ret


asm_oled_init:
    call asm_oled_reset
    
    ld hl, sequence
    
initloop:
    ld a, (hl)
    cp 0xff
    ret z
    
    call asm_oled_cmd
    inc hl
    jr initloop
    
sequence:
    DEFB 0xae, 0xd5, 0xa0, 0xa8
    DEFB 0x1f, 0xd3, 0x00, 0xad
    DEFB 0x8e, 0xd8, 0x05, 0xa1
    DEFB 0xc8, 0xda, 0x12, 0x91
    DEFB 0x3f, 0x3f, 0x3f, 0x3f
    DEFB 0x81, 0x80, 0xd9, 0xd2
    DEFB 0xdb, 0x34, 0xa6, 0xa4
    DEFB 0xaf
    
    DEFB 0xff  ; end marker
    
