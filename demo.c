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
#include "oled_gfx_font8x8.h"

#include "jskists_sprite.h"
#include "rc2014_sprite.h"
#include "quazar_sprite.h"


extern void pixel_test(void);
#define OLED_IMAGE_SIZE  512

static uint8_t L_image_buffer[OLED_IMAGE_SIZE];

void set_image_buffer_random(void)
{
    int i;
    
    for (i = 0; i < OLED_IMAGE_SIZE; i++)
    {
        uint8_t val = (uint8_t)(rand() & 0xff);
        
        L_image_buffer[i] = val;
    }
}


void put_sprite_rc(uint8_t *buffer, uint8_t *sprite, uint8_t row, uint8_t column, uint8_t h, uint8_t w)
{
    uint8_t x, y;
    int index;

    for (y = row; y < row + h; y++)
    {
        for (x = column; x < column + w; x++)
        {
            index = (y * 128) + x;
            buffer[index] = *sprite;
            sprite++;
        }
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
    
    while(1)
    {
        if ((counter % 64 == 63))
        {
            switch (sprite_index)
            {
                case 0:
                    sprite = jskists_bin;
                    sprite_index++;
                    break;
                    
                case 1:
                    sprite = rc2014_bin;
                    sprite_index++;
                    break;
                    
                case 2:
                default:
                    sprite = quazar_bin;
                    sprite_index = 0;
                    break;
            }
        }
            
        set_image_buffer_random();
        
        if (sprite)
        {
            put_sprite_rc(L_image_buffer, sprite, 1, 32, 2, 64);
        }

        oled_blit(L_image_buffer);

        z80_delay_ms(25);
        
        counter++;
    }
        
    return 0;
}
