#ifndef DRAW_H_
#define DRAW_H_

#include "settings.h"
#include <util/delay.h>
#include <math.h>


#include "RAM.h"
#include "UART.h"
#include "commands.h"

#include "vecmath.h"
#include "color_process.h"


extern unsigned long time;

void clear_color(unsigned char color, unsigned char swap);
void render_loading_bar(unsigned int input_y);

void render(unsigned char (*compute_pixel)(int,int), unsigned char swap, unsigned char copy);

unsigned char draw_pal(int input_x,int input_y);
unsigned char draw_hsv_pal(int input_x,int input_y);

void delay(unsigned int seconds);


#endif /* DRAW_H_ */