; Copyright 2022 Justin Skists
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

EXTERN bdos_handler
EXTERN old_bdos

EXTERN asm_oled_init
EXTERN asm_oled_clear
EXTERN asm_oled_blit_init

jump_table:
    jp driver_init
    jp bdos_handler


driver_init:
    ;; install our bdos, thereby reducing tpa.
    ld hl, 0x0005
    ld de, old_bdos
    ld bc, 3
    ldir

    ;; install our bdos
    ld a, 0xc3
    ld hl, jump_table + 3
    ld (0x0005), a
    ld (0x0006), hl

    CALL asm_oled_init
    CALL asm_oled_blit_init

    ret

