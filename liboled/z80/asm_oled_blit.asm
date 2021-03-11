SECTION code_user

PUBLIC asm_oled_blit

EXTERN asm_oled_cmd
EXTERN asm_oled_data

; entry:   hl = address of 512byte image


asm_oled_blit:
    ld d, 0
    
winloop:    
    ld a, (hl)
    call asm_oled_data
    inc hl
    
    ld a, (hl)
    call asm_oled_data
    inc hl
    
    dec d
    jr nz, winloop

    ret
    

