SECTION code_user

PUBLIC asm_oled_reset
DEFC   OLED_BASE = 0x50


asm_oled_reset:
    ld c, OLED_BASE      ; base I/O address
    ld b, 6              ; RESET high, /CS high

    out (c),a            ; output command byte
    
    nop                  ; delay
    nop
    nop
    nop
    
    res 2, b             ; RESET low
    out (c),a            
    
    nop                  ; delay
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

    ret
