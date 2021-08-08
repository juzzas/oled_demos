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
#include <cpu.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <arch/hbios.h>

#include "oled.h"
#include "oled_clock24x32.h"


extern void pixel_test(void);
#define OLED_IMAGE_SIZE  512

static uint8_t L_image_buffer[OLED_IMAGE_SIZE];


void put_sprite_char32(uint8_t *buffer, char chr, uint8_t column, uint8_t *font)
{
	uint8_t x, y;
	int index;
	uint8_t *font_index;
	uint8_t font_width;
	uint8_t row;

	       
	// note: 0123456789:./- (with symbols 16x32 - 4 rows of OLED display), add 512 to get to the next 8-bit row
	switch (chr)
	{
	case '0':
		font_index = font+0;
		font_width = 24;
		break;

	case '1':
		font_index = font+24;
		font_width = 24;
		break;

	case '2':
		font_index = font+48;
		font_width = 24;
		break;

	case '3':
		font_index = font+72;
		font_width = 24;
		break;

	case '4':
		font_index = font+96;
		font_width = 24;
		break;

	case '5':
		font_index = font+120;
		font_width = 24;
		break;

	case '6':
		font_index = font+144;
		font_width = 24;
		break;

	case '7':
		font_index = font+168;
		font_width = 24;
		break;

	case '8':
		font_index = font+192;
		font_width = 24;
		break;

	case '9':
		font_index = font+216;
		font_width = 24;
		break;

	case ':':
		font_index = font+240;
		font_width = 16;
		break;

	case '.':
		font_index = font+256;
		font_width = 16;
		break;

	case '/':
		font_index = font+272;
		font_width = 16;
		break;

    case '-':
        font_index = font+288;
        font_width = 16;
        break;

    case ' ':
        font_index = font+304;
        font_width = 16;
        break;

	default:
		return;
	}


	for (row = 0; row < 4; row++)
	{
		uint8_t *tmp_font_index = font_index;

		for (x = column; x < column + font_width; x++)
		{
			index = (row * 128) + x;
			buffer[index] = *tmp_font_index;
			tmp_font_index++;
		}

		font_index += 512;
	}
}

void output_clock(uint8_t bcd_hours, uint8_t bcd_mins, uint8_t bcd_seconds, bool divider)
{
    put_sprite_char32(L_image_buffer, ((bcd_hours & 0xf0) >> 4) + '0', 0, oled_clock24x32_bin);
    put_sprite_char32(L_image_buffer, (bcd_hours & 0xf) + '0', 24, oled_clock24x32_bin);
    if (divider)
    {
        put_sprite_char32(L_image_buffer, ':', 48, oled_clock24x32_bin);
    }
    else
    {
        put_sprite_char32(L_image_buffer, ' ', 48, oled_clock24x32_bin);
    }
    put_sprite_char32(L_image_buffer, ((bcd_mins & 0xf0) >> 4) + '0', 64, oled_clock24x32_bin);
    put_sprite_char32(L_image_buffer, (bcd_mins & 0xf) + '0', 88, oled_clock24x32_bin);
}


int main(void)
{
	int sprite_index = 0;
	uint8_t *sprite = NULL;
    uint8_t counter = 0;

	printf("Quazar OLED FONT clock test\r\n");
	oled_init();
	printf("Quazar OLED done init\r\n");
	oled_clear();
	printf("Quazar OLED done clear\r\n");

	oled_blit_init();

	printf("Quazar OLED test run...\r\n");

	memset(L_image_buffer, 0, OLED_IMAGE_SIZE);


	while (1)
    {
	    // if HBIOS!
        uint8_t rtc[6];

        hbios_a_de_hl(BF_RTCGETTIM << 8, 0, rtc);

        output_clock(rtc[3], rtc[4], rtc[5], counter & 0x01);

        cpu_delay_ms(500);  // very approximate 2Hz

        oled_blit(L_image_buffer);
        counter++;
    }

	return 0;
}
