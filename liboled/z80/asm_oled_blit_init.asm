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

