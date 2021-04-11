#include <stdio.h>
#include <math.h>
#include <z80.h>
#include <stdlib.h>
#include <string.h>

#include "oled.h"
#include "oled_font8x8.h"
#include "oled_font6x8.h"
#include "oled_font4x8.h"


extern void pixel_test(void);
#define OLED_IMAGE_SIZE  512

static uint8_t L_image_buffer[OLED_IMAGE_SIZE];


void put_sprite_char(uint8_t *buffer, uint8_t chr, uint8_t row, uint8_t column, uint8_t *font, uint8_t font_width)
{
	uint8_t x, y;
	int index;
	uint8_t *font_index = font + (chr * font_width);

	for (x = column; x < column + font_width; x++)
	{
		index = (row * 128) + x;
		buffer[index] = *font_index;
		font_index++;
	}
}

void put_sprite_string(uint8_t *buffer, char *string, uint8_t row, uint8_t column, uint8_t *font, uint8_t font_width)
{
	while (*string)
	{
		put_sprite_char(buffer, *string, row, column, font, font_width);
		column += font_width;
		string++;
	}
}


int main(void)
{
	int sprite_index = 0;
	uint8_t *sprite = NULL;
	uint16_t counter = 0;

	printf("Quazar OLED FONT 8x8 test\r\n");
	oled_init();
	printf("Quazar OLED done init\r\n");
	oled_clear();
	printf("Quazar OLED done clear\r\n");

	oled_blit_init();

	printf("Quazar OLED test run...\r\n");

	memset(L_image_buffer, 0xa5, OLED_IMAGE_SIZE);

	put_sprite_string(L_image_buffer, "Hello world!", 1, 16, oled_font8x8_bin, 8);
	put_sprite_string(L_image_buffer, "Hello world!", 2, 16, oled_font6x8_bin, 6);
	put_sprite_string(L_image_buffer, "Hello world!", 3, 16, oled_font4x8_bin, 4);

	oled_blit(L_image_buffer);

	return 0;
}
