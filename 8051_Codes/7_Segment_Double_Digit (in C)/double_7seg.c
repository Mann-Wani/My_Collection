#include <reg51.h>

void delay();

unsigned char code seg_code[] = {
    0x3F,  // 0
    0x06,  // 1
    0x5B,  // 2
    0x4F,  // 3
    0x66,  // 4
    0x6D,  // 5
    0x7D,  // 6
    0x07,  // 7
    0x7F,  // 8
    0x6F   // 9
};

void main()
{
    unsigned char tens, units;
    unsigned char num;

    while(1)
    {
        for(num = 0; num < 100; num++)
        {
            tens  = num / 10;
            units = num % 10;

            P2 = seg_code[tens];   // Tens digit
            P3 = seg_code[units];  // Units digit

            delay();
        }
    }
}

void delay()
{
    unsigned int i,j;
    for(i = 0; i < 5; i++)
        for(j = 0; j < 1275; j++);
}
