SECTION code_user

PUBLIC asm_oled_gfx_font8x_putc

;  struct oled_gfx_font8_context
;  {
;    void *buffer_ptr;
;    uint8_t row_offset;
;    uint8_t font_width;
;    void *font;
;  };


; Entry:
;     buffer                     DE
;     font                       HL
;     row_offset                 C
;     font width                 B
;     character                  A
;
; Uses A, BC, DE, HL


; find address of the first byte in font data
; find image address for first column of oled
;
; for each column in font data (font_width times)
;      copy
;      restore font address, and increment
;      restore screen address, add 128bytes
; repeat


asm_oled_gfx_font8_putc:
        PUSH DE ; store buffer_ptr on stack
        PUSH HL ; store font base on stack
        PUSH BC ; store row offset and font width on stack

        ; let HL = address of of the first byte of the character in font data
        SUB 0x20                ; so adjust our index as data starts from 32
        LD H, 0
        LD L, A

mult_width_loop:
        ADD HL, HL              ; multiply character by font_width
        DJNZ mult_width_loop

        POP DE      ; retrieve font base from stack
        ADD HL, DE  ; HL points to font data for specified character

        POP DE

        ;; Do we need to span rows?
        LD A, (IY + 2)
        OR A                    ; is the row offset 0?
        JP NZ, output_span_character

;; entry:
;;        DE = destination address
;;        HL = source address
;;        BC = font width
output_character:
        LDIR

        ; save updated buffer address
        LD (IY + 0), E
        LD (IY + 1), D

        RET




output_span_character:
        ; TO BE DONE!
        RET