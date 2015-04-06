#ifndef DRAW_TEST_H_
#define DRAW_TEST_H_

#include "settings.h"
#include <math.h>

#include "RAM.h"
#include "UART.h"
#include "commands.h"

#include "vecmath.h"
#include "color_process.h"

unsigned char draw0(int input_x,int input_y);
unsigned char draw1(int input_x,int input_y);
unsigned char draw2(int input_x,int input_y);
unsigned char draw3(int input_x,int input_y);

#endif /* DRAW_TEST_H_ */