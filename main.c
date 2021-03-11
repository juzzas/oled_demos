#include <stdio.h>
#include <math.h>
#include <z80.h>
#include <stdlib.h>
#include <string.h>

#include "oled.h"


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


int main(void)
{
    printf("Quazar OLED test\r\n");
    oled_init();
    printf("Quazar OLED done init\r\n");
    oled_clear();
    printf("Quazar OLED done clear\r\n");

    oled_blit_init();
    
    memset(L_image_buffer, 0xa5, OLED_IMAGE_SIZE);
    oled_blit(L_image_buffer);
    
    z80_delay_ms(250);
    
    oled_blit(0);

    printf("Quazar OLED done test\r\n");
    z80_delay_ms(250);
    
    
    while(1)
    {
        set_image_buffer_random();
        oled_blit(L_image_buffer);
        z80_delay_ms(25);
    }
        
    return 0;
}
