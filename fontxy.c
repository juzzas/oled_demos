#include <stdio.h>
#include <math.h>
#include <z80.h>
#include <stdlib.h>
#include <string.h>

#include "oled.h"
#include "oled_font8x8.h"
#include "oled_font6x8.h"
#include "oled_font4x8.h"

#define OLED_IMAGE_SIZE  512

static uint8_t L_image_buffer[OLED_IMAGE_SIZE];


void put_sprite_char_xy(uint8_t *buffer, uint8_t chr, uint8_t x, uint8_t y, uint8_t *font, uint8_t font_width)
{
	uint8_t xi, yi;
	uint16_t span;
	uint16_t bits, mask;
	int index;
	uint8_t *font_index = font + (chr * font_width);

	for (xi = x; xi < x + font_width; xi++)
	{
		index = ((y / 8) * 128) + xi;

		span = buffer[index] | (buffer[index + 128] << 8);

		mask = 0xff << (y % 8);

		bits = (uint8_t)*font_index;
		bits = bits << (y % 8);

		span &= ~mask;
		span |= bits;

		buffer[index] = span & 0xff;
		buffer[index + 128] = (span & 0xff00) >> 8;

		font_index++;
	}
}


void put_sprite_string_xy(uint8_t *buffer, char *string, uint8_t x, uint8_t y, uint8_t *font, uint8_t font_width)
{
	while (*string)
	{
		put_sprite_char_xy(buffer, *string, x, y, font, font_width);
		x += font_width;
		string++;
	}
}


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

	put_sprite_string_xy(L_image_buffer, "Howdy, twitter-sphere!", 16, 4, oled_font4x8_bin, 4);
	put_sprite_string_xy(L_image_buffer, "#RC2014", 64, 20, oled_font6x8_bin, 6);
	put_sprite_string_xy(L_image_buffer, "#QUAZAR", 8, 22, oled_font6x8_bin, 6);

	oled_blit(L_image_buffer);

	return 0;
}
