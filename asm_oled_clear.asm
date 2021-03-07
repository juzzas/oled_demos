SECTION code_user

PUBLIC asm_oled_clear
DEFC   OLED_BASE = 0x50

EXTERN asm_oled_cmd
EXTERN asm_oled_data


asm_oled_clear:
    ld a, 0xb0
    call asm_oled_cmd
    call asm_oled_clear_row
    
    ld a, 0xb1
    call asm_oled_cmd
    call asm_oled_clear_row
    
    ld a, 0xb2
    call asm_oled_cmd
    call asm_oled_clear_row
    
    ld a, 0xb3
    call asm_oled_cmd
    call asm_oled_clear_row
    
    ret 

    
asm_oled_clear_row:
    ld a, 0x10
    call asm_oled_cmd
    
    ld a, 0x04
    call asm_oled_cmd
    
    xor a
    ld d, 0x80
    
clearloop:
    call asm_oled_data
    dec d
    jr nz, clearloop
    ret
    
