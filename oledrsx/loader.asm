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

;------------------------------------------------------------------------
PUBLIC _driver_code           ; extern uint8_t* driver_code
PUBLIC _driver_code_size      ; extern uint16_t driver_code_size
PUBLIC _reloc_info            ; extern uint16_t* reloc_info
PUBLIC _reloc_info_size       ; extern uint16_t reloc_info_size
PUBLIC _driver_code_init

SECTION rodata_user

_driver_code:
    DEFW start_driver_code

_driver_code_size:
    DEFW (end_driver_code - start_driver_code)

_reloc_info:
    DEFW start_reloc_info

_reloc_info_size:
    DEFW ((end_reloc_info - start_reloc_info) / 2)

_driver_code_init:
    jp (hl)
    ret



start_driver_code:
    INCBIN "oledrsx_driver.bin"
end_driver_code:

;; array of 16bit address values that need to be patched (read, add start address, write)
start_reloc_info:
    INCBIN "oledrsx_driver.reloc"
end_reloc_info:

