/*
 * Copyright (c) 2022 Justin Skists.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <arch/cpm.h>
#include <z80.h>

#define DEBUG

#pragma output REGISTER_SP = 16384

/*
 * Exported values from loader.asm
 */
extern const uint8_t* driver_code;
extern const uint16_t driver_code_size;
extern const uint16_t* reloc_info;
extern const uint16_t reloc_info_size;

extern void driver_code_init(uint16_t init_call_addr) __z88dk_fastcall;

uint16_t load_addr;

#ifdef DEBUG
uint8_t oled_buffer[512];
#endif

void main(void) {
    uint16_t bdos_addr = z80_wpeek(0x0006);
    uint16_t driver_pages = ((driver_code_size / 256) + 1);

#ifdef DEBUG
    printf("new bdos = 0x%04x\n", z80_wpeek(0x0006));

    memset(oled_buffer, 0xa5, 512);
    cpm_bdos(0xe0, (int)oled_buffer);
#else
    cpm_bdos(0xe0, 0); // clear oled display
#endif

    puts("Quazar OLED RSX installed");
}
