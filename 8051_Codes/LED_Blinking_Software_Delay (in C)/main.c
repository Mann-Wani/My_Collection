#include <reg51.h>

sbit LED = P2^0;

void delay (int time)
{
	int i=0;
	int j=0;
	for ( i=0; i< time; i++ )
		for ( j=0; j<100; j++ );
}

void main (void)
{
	while (1)
	{
		LED = 1;
		delay (500);
		LED = 0;
		delay (500);
	}
}