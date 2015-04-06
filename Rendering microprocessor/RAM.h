#ifndef RAM_H_
#define RAM_H_

#include "settings.h"
#include <avr/sfr_defs.h>
#include <avr/pgmspace.h>

void RAM_init();

extern unsigned char const PROGMEM translate_x_data[33];
extern unsigned char _x_increment_addr;

void set_Y(uint16_t _value);
void set_X(unsigned char _value);
unsigned char translate_x(unsigned char x);

void inc_X();
void reset_X();

unsigned char RAM_read();
void RAM_write(unsigned char data);

#endif /* RAM_H_ */