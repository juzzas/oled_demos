SECTION code_user

PUBLIC _pixel_test

EXTERN asm_oled_cmd
EXTERN asm_oled_data


_pixel_test:
    push bc
    push hl
    call asm_pixel_test
    pop hl
    pop bc
    ret

asm_pixel_test:
    ld a, 0xb0           ; select top row
    call asm_oled_cmd
    ld a, 0x10           ; select colum command
    call asm_oled_cmd
    ld a, 0x04           ; select left-most column
    call asm_oled_cmd

    xor a
    
rowloop:
    call asm_oled_data
    inc a
    cp 0x80
    ret z
    
    jr rowloop
