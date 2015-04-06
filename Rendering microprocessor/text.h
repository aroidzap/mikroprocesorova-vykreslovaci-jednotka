#ifndef ZOBRAZOVANI_H_
#define ZOBRAZOVANI_H_

#include <avr/io.h>
#include <avr/pgmspace.h>
#include "font.h"

#define text_width 250		// default 250
#define text_height 480		// default 480
#define row_height 12		// default 12

extern PROGMEM char const pozdrav[];

unsigned char zobrazeni_textu(char *text,int fixed,int input_x,int input_y);
unsigned char zobrazeni_pgm_textu(const char *text,int fixed,int input_x,int input_y);

void dec_to_bin(char *buffer,unsigned char bin);
int strl(char *buffer);

#endif /* ZOBRAZOVANI_H_ */