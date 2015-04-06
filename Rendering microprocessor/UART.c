/*
*	Copyright (c) 2015 Tomáš Pazdiora
*	See the file "LICENSE.txt" for the full license governing this code.
*/

#include "UART.h"

volatile unsigned char driver_response=0;

ISR(USART_RXC_vect)
{
	if((UCSRA&((1<<FE)|(1<<DOR)|(1<<PE)))==0)
	{
		driver_response=UDR;
	}
}

void UART_init()
{
	UART_DDR|=_BV(TXD);
	UART_DDR&=~_BV(RXD);
	
	UART_PORT|=_BV(RXD); //RX pull-up
	
	// Set baud rate 4,8kbit/s @ 16MHz (double speed)
	UBRRH = 0x01;
	UBRRL = 0xA0;
	
	UCSRA |= (1<<U2X); // double speed
	
	// Enable receiver (+interrupt) and transmitter
	UCSRB |= (1<<RXCIE)|(1<<RXEN)|(1<<TXEN);
	
	// Set frame format: 8data, 1stop bit, odd parity
	UCSRC |= (1<<URSEL)|(1<<UCSZ1)|(1<<UCSZ0)|(1<<UPM1)|(1<<UPM0);
	
	sei();
}

void driver_command(unsigned char command)
{
	unsigned char error;
	while(1)
	{
		error=0;
		volatile unsigned int timeout=0;
		driver_response=0;
		while ((UCSRA&(1<<UDRE))==0){}
		UDR = command;								//send cmd
		while ((UCSRA&(1<<TXC))==0){}
		while(driver_response!=DRIVER_DONE_CMD)		//wait for driver_done
		{
			if (timeout>=40000)
			{
				error = 1;
				break;
			}
			if(driver_response==DRIVER_TRANSMIT_ERROR)
			{
				error = 1;
				break;
			}
			timeout+=1;
		}
		if (error==0)
		{
			break;
		}		
	}
}

void driver_init()
{
	unsigned char error;
	while(1)
	{
		error=0;
		volatile unsigned int timeout=0;
		driver_response=0;
		while ((UCSRA&(1<<UDRE))==0){}
		UDR = DRIVER_READY_REQ_CMD;						//send ready request command
		while (driver_response!=DRIVER_READY_RESP_CMD)	//wait for driver_ready
		{
			if (timeout>=40000)
			{
				error = 1;
				break;
			}
			if(driver_response==DRIVER_TRANSMIT_ERROR)
			{
				error = 1;
				break;
			}
			timeout+=1;
		}
		if (error==0)
		{
			break;
		}
	}
}