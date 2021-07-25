;extern void oled_font8_init(struct oled_gfx_font8_context *context, uint8_t *buffer, uint8_t *font, uint8_t font_width) __z88dk_callee;

SECTION code_user

PUBLIC _oled_font8_init


_oled_font8_init:
        POP AF ; return address
        POP BC ; arg4 - font_width
        POP HL ; arg3 - font data
        POP DE ; arg2 - buffer
        POP IY ; arg1 - context

        PUSH AF

        LD (IY + 0), E
        LD (IY + 1), D
        LD (IY + 2), E
        LD (IY + 3), D
        LD (IY + 4), 0
        LD (IY + 5), C
        LD (IY + 6), L
        LD (IY + 7), H

        RET
