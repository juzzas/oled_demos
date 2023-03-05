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
#include <math.h>
#include <z80.h>
#include <stdlib.h>
#include <string.h>
#include <arch/cpm.h>

#include "oled.h"
#include "christmas.h"

uint8_t buffer[512];
uint8_t snowflake_x[16];
uint8_t snowflake_y[16];
uint8_t snowflake_speed[16];

void plot (uint8_t x, uint8_t y) {
    uint8_t* addr = buffer + (128 * (y / 8)) + x;
    uint8_t row_offset = y % 8;

    *addr = *addr | (1 << row_offset);
}

void main(void) {
    puts("Merry Christmas 2022 - @jskists");
    //cpm_bdos(0xe0, 0);
    //cpm_bdos(0xe0, (int)christmas_bin);
    oled_init();
    oled_clear();
    oled_blit_init();

    for (int n = 0; n < 16; n++) {
        snowflake_x[n] = (uint8_t)(rand() & 0x7f);
        snowflake_y[n] = (uint8_t)(rand() & 0x1f);
        snowflake_speed[n] = (uint8_t)(rand() & 3);
    }

    while (1) {
        memcpy(buffer, christmas_bin, 512);

        for (int n = 0; n < 16; n++) {
            plot(snowflake_x[n], snowflake_y[n]);

            snowflake_y[n] += snowflake_speed[n];
            if (snowflake_y[n] > 31)
                snowflake_y[n] = 0;
        }

        oled_blit(buffer);

        z80_delay_ms(100);
    }



    puts(" - done");
}
