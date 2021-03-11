SECTION code_user

PUBLIC asm_oled_blit_init

EXTERN asm_oled_cmd
EXTERN asm_oled_data


asm_oled_blit_init:
    ld a, 0xb0           ; set pointer to start of top row
    call asm_oled_cmd
    ld a, 0x10
    call asm_oled_cmd
    ld a, 0x04
    call asm_oled_cmd

    ld a, 0x20              ; window command
    call asm_oled_cmd
    ld a, 0x00              ; horizontal wrapping
    call asm_oled_cmd

    ld a, 0x21              ; window columns
    call asm_oled_cmd
    ld a, 0x04
    call asm_oled_cmd
    ld a, 0x83
    call asm_oled_cmd

    ld a, 0x22              ; window rows
    call asm_oled_cmd
    ld a, 0x00
    call asm_oled_cmd
    ld a, 0x03
    call asm_oled_cmd
    
    ret

