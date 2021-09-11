/*
 * Copyright (c) 2021 Justin Skists.
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

#include "oled.h"
#include "oled_font8.h"
#include "oled_font8x8.h"

#include "jskists_sprite.h"
#include "rc2014_sprite.h"
#include "quazar_sprite.h"


#define OLED_IMAGE_SIZE  512
#define OLED_WIDTH       128

static uint8_t L_image_buffer[OLED_IMAGE_SIZE];
static struct oled_font8_context L_font_context;
static int L_direction = 1;
static int L_offset;


static char *L_message = "I \03 my #RC2014!";

void set_image_buffer_random(uint8_t row)
{
    int i;
    int start = (row * OLED_WIDTH);

    for (i = start; i < (start + OLED_WIDTH); i++)
    {
        uint8_t val = (uint8_t)(rand() & 0xff);
        
        L_image_buffer[i] = val;
    }
}

void print_message(void)
{
    int i;

    if (L_direction == 1)
    {
        L_offset++;
        if (L_offset == 7)
            L_direction = -1;
    }
    else
    {
        L_offset--;
        if (L_offset == 0)
            L_direction = 1;
    }

    for (i = 0; i < strlen(L_message); i++)
    {
        oled_font8_set_xy(&L_font_context, 4 + (i * 8), 8+L_offset);
        oled_font8_putc(&L_font_context, L_message[i]);
    }
}

int main(void)
{
    int sprite_index = 0;
    uint8_t *sprite = NULL;
    uint16_t counter = 0;
    
    printf("Quazar OLED test\r\n");
    oled_init();
    printf("Quazar OLED done init\r\n");
    oled_clear();
    printf("Quazar OLED done clear\r\n");

    oled_blit_init();
    
    printf("Quazar OLED test run...\r\n");

    oled_font8_init(&L_font_context, L_image_buffer, oled_font8x8_bin, 8);

    while(1)
    {
        memset(L_image_buffer, 0, OLED_IMAGE_SIZE);

        set_image_buffer_random(0);
        set_image_buffer_random(3);

        print_message();
        
        oled_blit(L_image_buffer);

        z80_delay_ms(25);
        
        counter++;
    }
        
    return 0;
}
