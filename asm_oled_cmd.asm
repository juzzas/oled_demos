; Enter with: A = COMMAND

SECTION code_user

PUBLIC asm_oled_cmd
DEFC   OLED_BASE = 0x50


asm_oled_cmd:
    ld c, OLED_BASE      ; base I/O address
    ld b, 0              ; RESET low, /CS low, /COMMAND low
    
    out (c),a            ; output command byte
    
    nop                  ; delay
    nop
    nop
    nop
    
    set 1, b             ; /CS high
    out (c),a            
    
    nop                  ; long delay
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
