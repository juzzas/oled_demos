; Enter with: A = Graphic data

SECTION code_user

PUBLIC asm_oled_data
DEFC   OLED_BASE = 0x50


asm_oled_data:
    ld c, OLED_BASE      ; base I/O address
    ld b, 1              ; RESET low, /CS low, /COMMAND high

    out (c),a            ; output command byte
    
    nop                  ; delay
    nop
    nop
    nop
    
    set 1, b             ; /CS high
    out (c),a            
    
    nop                  ; short delay
    nop

    ret
