#include <stdio.h>
#include <math.h>
#include <z80.h>
#include <string.h>

#include "oled.h"


extern void pixel_test(void);
#define OLED_IMAGE_SIZE  512

static uint8_t L_image_buffer[OLED_IMAGE_SIZE];

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
    
    
    while(1);
    return 0;
}
