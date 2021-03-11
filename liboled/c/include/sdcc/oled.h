// prototypes for oled c routines

#ifndef __OLED_H
#define __OLED_H

/**
 * reset and initialise the Quazar Graphic OLED
 */
extern void oled_init(void);


/**
 * clear the display
 */
extern void oled_clear(void);

/**
 * sets up the display for horizontal wrapping read for blitting
 */
extern void oled_blit_init(void);

/**
 * blit 512 byte image to display
 */
void oled_blit(uint8_t *buffer) __z88dk_fastcall;

#endif

