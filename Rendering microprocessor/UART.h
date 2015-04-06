/*
*	Copyright (c) 2015 Tomáš Pazdiora
*	See the file "LICENSE.txt" for the full license governing this code.
*/

#ifndef UART_H_
#define UART_H_

#include <avr/io.h>
#include <avr/interrupt.h>
#include "settings.h"
#include "commands.h"

extern volatile unsigned char driver_response;

ISR(USART_RXC_vect);

void UART_init();
void driver_init();
void driver_command(unsigned char command);

#endif /* UART_H_ */