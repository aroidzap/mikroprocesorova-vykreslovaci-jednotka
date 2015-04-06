/*
*	Copyright (c) 2015 Tomáš Pazdiora
*	See the file "LICENSE.txt" for the full license governing this code.
*/

#include "SPI.h"

void SPI_init()
{
	SPI_DDR|=_BV(CS)|_BV(MOSI)|_BV(SCK);
	SPI_DDR&=~_BV(MISO);
	SPCR|=_BV(SPE)|_BV(MSTR)|_BV(SPR1)|_BV(SPR0); // low speed (fosc/128)
}

unsigned char SPI_transfer(unsigned char data_in)
{
	SPDR=data_in;
	while((SPSR&_BV(SPIF))==0){}
	return SPDR;
}

void SPI_set_speed(int speed)
{
	SPCR&=~_BV(SPR1);
	SPCR&=~_BV(SPR0);
	SPSR&=~_BV(SPI2X);
	
	if (speed==0) // 125 kbit/s
	{
		SPCR|=_BV(SPR1);
		SPCR|=_BV(SPR0);
		//SPSR|=_BV(SPI2X);
	}
	else if (speed==1) // 250 kbit/s
	{
		SPCR|=_BV(SPR1);
		//SPCR|=_BV(SPR0);
		//SPSR|=_BV(SPI2X);
	}
	else if (speed==2) // 500 kbit/s
	{
		SPCR|=_BV(SPR1);
		//SPCR|=_BV(SPR0);
		SPSR|=_BV(SPI2X);
	}
	else if (speed==3) // 1000 kbit/s
	{
		//SPCR|=_BV(SPR1);
		SPCR|=_BV(SPR0);
		//SPSR|=_BV(SPI2X);
	}
	else if (speed==4) // 2000 kbit/s
	{
		//SPCR|=_BV(SPR1);
		SPCR|=_BV(SPR0);
		SPSR|=_BV(SPI2X);
	}
	else if (speed==5) // 4000 kbit/s
	{
		//SPCR|=_BV(SPR1);
		//SPCR|=_BV(SPR0);
		//SPSR|=_BV(SPI2X);
	}
	else if (speed==6) // 8000 kbit/s
	{
		//SPCR|=_BV(SPR1);
		//SPCR|=_BV(SPR0);
		SPSR|=_BV(SPI2X);
	}
}