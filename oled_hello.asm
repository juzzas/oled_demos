SECTION code_user


PUBLIC _main

EXTERN asm_oled_init
EXTERN asm_oled_blit_init
EXTERN asm_oled_blit
EXTERN oled_glyph8_std_font8
EXTERN asm_oled_glyph8_putc

DEFC BUFFER_SIZE=512

_main:
        CALL asm_oled_init
        CALL asm_oled_blit_init

        LD A, 0
        CALL memset_buffer

        LD DE, oled_buffer+128
        LD IX, oled_glyph8_std_font8
        LD B, 8   ; width
        LD C, 0   ; offset

        LD HL, test_message

        CALL _oled_glyph8_puts

        LD HL, oled_buffer
        CALL asm_oled_blit

        RET

; entry: A= data to set buffer
memset_buffer:
        LD HL, oled_buffer
        LD (HL), A
        LD DE, HL
        INC DE
        LD BC, BUFFER_SIZE-1
        LDIR
        RET

_oled_glyph8_puts:
        LD A, (HL)
        OR A
        RET Z

        INC HL
        PUSH HL
        PUSH BC
        PUSH IX

        CALL asm_oled_glyph8_putc

        POP IX
        POP BC
        POP HL

        LD A, C
        INC A
        CP 4
        JR NZ, skip
        LD A, 0
skip:
        LD C, A

        JR _oled_glyph8_puts


SECTION rodata_user
test_message:
        DEFM "Hello, Twitter!", 0


SECTION data_user

oled_buffer:
        DEFS 512