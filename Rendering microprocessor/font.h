#ifndef FONT_H_
#define FONT_H_

#include <avr/io.h>
#include <avr/pgmspace.h>

#define pocet_pismen 59
#define sirka_pismene 5

extern const unsigned char PROGMEM length_font[pocet_pismen];
extern const unsigned char PROGMEM data_font[pocet_pismen*sirka_pismene];

#endif /* FONT_H_ */