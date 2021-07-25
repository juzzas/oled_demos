//
// Created by justin on 13/03/2021.
//
#include <stdint.h>

#ifndef OLED_GFX_FONT8_H
#define OLED_GFX_FONT8_H

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

extern void oled_font8_init(struct oled_gfx_font8_context *context, uint8_t *buffer, uint8_t *font, uint8_t font_width) __z88dk_callee;

extern void oled_font8_set_font(struct oled_font8_context *context, uint8_t *font, uint8_t font_width) __z88dk_callee;

extern void oled_font8_set_rc(struct oled_font8_context *context, uint8_t row, uint8_t column) __z88dk_callee;
extern void oled_font8_set_xy(struct oled_font8_context *context, uint8_t x, uint8_t y) __z88dk_callee;

extern void oled_font8_putc(struct oled_font8_context *context, uint16_t ch)  __z88dk_callee;
extern void oled_font8_puts(struct oled_font8_context *context, const char *str) __z88dk_callee;

#endif //OLED_GFX_FONT8X8_H
