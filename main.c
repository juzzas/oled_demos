#include <stdio.h>
#include <math.h>
#include <z80.h>


extern void oled_init(void);
extern void oled_clear(void);
extern void pixel_test(void);



int main(void)
{
    printf("Quazar OLED test\r\n");
    oled_init();
    printf("Quazar OLED done init\r\n");
    oled_clear();
    printf("Quazar OLED done clear\r\n");
    
    pixel_test();
    printf("Quazar OLED done test\r\n");
    
    while(1);
    return 0;
}
