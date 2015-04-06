#ifndef SPI_H_
#define SPI_H_

#include <avr/io.h>
#include "settings.h"

void SPI_init();
void SPI_set_speed(int speed);

unsigned char SPI_transfer(unsigned char data_in);

#endif /* SPI_H_ */