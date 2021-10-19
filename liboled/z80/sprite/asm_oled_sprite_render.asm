; Copyright 2021 Justin Skists
;
; Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
; documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
; rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
; persons to whom the Software is furnished to do so, subject to the following conditions:
;
; The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
; Software.
;
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
; WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
; COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
; OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


PUBLIC asm_oled_sprite_render

INCLUDE "_sprite_context.asm"

;; Entry:
;;          DE = destination oled back-buffer
;;          IX = Sprite header context block

asm_oled_sprite_render:
        LD A, (IX + SPRITE_MASK)
        OR (IX + SPRITE_MASK + 1)
        JR NZ, sprite_render_mask

        LD A, (IX + SPRITE_Y)
        CALL asm_oled_y_to_row_offset

        PUSH HL  ; store row/offset

        LD B, (IX + SPRITE_X)
        LD C, H
        EX DE, HL
        CALL asm_oled_rc_to_addr ; HL holds destination address
        EX DE, HL   ; DE holds destination address

        POP BC
        LD B, (IX + SPRITE_W)
        PUSH IX

        LD L, (IX + SPRITE_DATA)
        LD H, (IX + SPRITE_DATA+1)
        PUSH HL
        POP IX

        LD B, (IX + SPRITE_H)
        LD HL, OLED_WIDTH
sprite_row_loop:
        PUSH DE
        CALL asm_oled_glyph8_output
        ; IX should be incremented!
        POP DE
        EX HL, DE
        ADD HL, DE
        EX HL, DE


        DJNZ sprite_row_loop
        RET



oled_sprite_render_mask:
        RET