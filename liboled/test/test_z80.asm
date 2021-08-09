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


PUBLIC _main
PUBLIC test_glyph8
PUBLIC test_glyph4
PUBLIC test_glyph4_mask
PUBLIC test_buffer

EXTERN test_out_glyph8
EXTERN test_out_glyph8_span
EXTERN test_out_glyph8_mask
EXTERN test_out_glyph8_span_mask
EXTERN test_out_glyph8_putc
EXTERN test_out_glyph8_puts

DEFC BUFFER_SIZE=512

_main:
    LD A, 0
    CALL memset_buffer
    CALL test_out_glyph8

    LD A, 0
    CALL memset_buffer
    CALL test_out_glyph8_span

    LD A, 0xA5
    CALL memset_buffer
    CALL test_out_glyph8_span

    LD A, 0
    CALL memset_buffer
    CALL test_out_glyph8_putc

    LD A, 0
    CALL memset_buffer
    CALL test_out_glyph8_puts

    LD A, 0xFF
    CALL memset_buffer
    CALL test_out_glyph8_mask

    LD A, 0xFF
    CALL memset_buffer
    CALL test_out_glyph8_span_mask

    RET

; entry: A= data to set buffer
memset_buffer:
        LD HL, test_buffer
        LD (HL), A
        LD DE, HL
        INC DE
        LD BC, BUFFER_SIZE-1
        LDIR
        RET


SECTION data_user

test_glyph8:
        DEFB 0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88

test_glyph4:
        DEFB 0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08

test_glyph4_mask:
        DEFB 0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f

test_buffer:
        DEFS BUFFER_SIZE