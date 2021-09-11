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
#include "oled_font6x8.h"
#include "oled_font4x8.h"

#define OLED_IMAGE_SIZE  512

static uint8_t L_image_buffer[OLED_IMAGE_SIZE];
static struct oled_font8_context L_font_context;


int main(void)
{
	int sprite_index = 0;
	uint8_t *sprite = NULL;
	uint16_t counter = 0;

	printf("Quazar OLED FONT XY test\r\n");
	oled_init();
	printf("Quazar OLED done init\r\n");
	oled_clear();
	printf("Quazar OLED done clear\r\n");

	oled_blit_init();

	printf("Quazar OLED test run...\r\n");

	memset(L_image_buffer, 0xa5, OLED_IMAGE_SIZE);

    oled_blit_init();

    oled_font8_init(&L_font_context, L_image_buffer, oled_font4x8_bin, 4);

    oled_font8_set_xy(&L_font_context, 16, 4);
    oled_font8_puts(&L_font_context, "Howdy, twitter-sphere!");

    oled_font8_set_font(&L_font_context, oled_font6x8_bin, 6);

    oled_font8_set_xy(&L_font_context, 64, 20);
    oled_font8_puts(&L_font_context, "#RC2014");

    oled_font8_set_xy(&L_font_context, 8, 22);
    oled_font8_puts(&L_font_context, "#QUAZAR");

    oled_blit(L_image_buffer);

	return 0;
}
