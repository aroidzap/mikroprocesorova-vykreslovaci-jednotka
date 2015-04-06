/*
*	Copyright (c) 2015 Tomáš Pazdiora
*	See the file "LICENSE.txt" for the full license governing this code.
*/

#ifndef SPI_H_
#define SPI_H_

#include <avr/io.h>
#include "settings.h"

void SPI_init();
void SPI_set_speed(int speed);

unsigned char SPI_transfer(unsigned char data_in);

#endif /* SPI_H_ */