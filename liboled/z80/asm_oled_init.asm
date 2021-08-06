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

PUBLIC asm_oled_init

EXTERN asm_oled_reset
EXTERN asm_oled_cmd

asm_oled_init:
    call asm_oled_reset
    
    ld hl, sequence
    
initloop:
    ld a, (hl)
    cp 0xff
    ret z
    
    call asm_oled_cmd
    inc hl
    jr initloop
    
sequence:
    DEFB 0xae, 0xd5, 0xa0, 0xa8
    DEFB 0x1f, 0xd3, 0x00, 0xad
    DEFB 0x8e, 0xd8, 0x05, 0xa1
    DEFB 0xc8, 0xda, 0x12, 0x91
    DEFB 0x3f, 0x3f, 0x3f, 0x3f
    DEFB 0x81, 0x80, 0xd9, 0xd2
    DEFB 0xdb, 0x34, 0xa6, 0xa4
    DEFB 0xaf
    
    DEFB 0xff  ; end marker
    
