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

#include <stdint.h>

#ifndef OLED_FONT8_H
#define OLED_FONT8_H

#ifdef STATIC_ANALYZE
#define __z88dk_callee
#endif

struct oled_font8_context
{
    void *buffer;
    void *buffer_ptr;
    uint8_t row_offset;
    uint8_t font_width;
    void *font;
};


/**
 * Initialise the font8 context structure
 *
 * @param context  context to initialise
 * @param buffer   back-buffer to write to, during putc
 * @param font     pointer to font. font data is expected indexed from 0
 * @param font_width  width of font
 */
extern void oled_font8_init(struct oled_font8_context *context, uint8_t *buffer, uint8_t *font, uint16_t font_width) __z88dk_callee;


/**
 * Set a font to print with.
 *
 * Fonts are expected to be 8bits per column
 *
 * @param context  valid font8 context
 * @param font     pointer to font. font data is expected indexed from 0
 * @param font_width  width of font
 */
extern void oled_font8_set_font(struct oled_font8_context *context, uint8_t *font, uint16_t font_width) __z88dk_callee;


/**
 * Set row and column position for printing
 *
 * @param context  valid font8 context
 * @param row      row number (0-3 - where 0 is the top)
 * @param column   column (0-127)
 */
extern void oled_font8_set_rc(struct oled_font8_context *context, uint8_t row, uint8_t column) __z88dk_callee;



extern void oled_font8_set_xy(struct oled_font8_context *context, uint8_t x, uint8_t y) __z88dk_callee;

extern void oled_font8_putc(struct oled_font8_context *context, uint8_t ch)  __z88dk_callee;
extern void oled_font8_puts(struct oled_font8_context *context, const char *str) __z88dk_callee;

#endif //OLED_FONT8X8_H
