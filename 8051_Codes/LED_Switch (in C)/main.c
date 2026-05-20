#include <reg51.h>

sbit LED1 = P2^0;
sbit LED2 = P2^1;
sbit LED3 = P2^2;
sbit LED4 = P2^3;
sbit LED5 = P2^4;
sbit LED6 = P2^5;
sbit LED7 = P2^6;
sbit LED8 = P2^7;
sbit sw1 = P0^0;
sbit sw2 = P0^1;
sbit sw3 = P0^2;
sbit sw4 = P0^3;
sbit sw5 = P0^4;
sbit sw6 = P0^5;
sbit sw7 = P0^6;
sbit sw8 = P0^7;
void main ()
{
	
	
	while (1)
	{
		if (sw1==1)
			LED1=1;
		else
			LED1=0;
		
		if (sw2==1)
			LED2=1;
		else
			LED2=0;
		
		if (sw3==1)
			LED3=1;
		else
			LED3=0;
		
		if (sw4==1)
			LED4=1;
		else
			LED4=0;
		
		if (sw5==1)
			LED5=1;
		else
			LED5=0;
		
		if (sw6==1)
			LED6=1;
		else
			LED6=0;
		
		if (sw7==1)
			LED7=1;
		else
			LED7=0;
	if (sw8==1)
			LED8=1;
		else
			LED8=0;
	
	}
}