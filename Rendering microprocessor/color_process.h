#ifndef COLOR_PROCESS_H_
#define COLOR_PROCESS_H_

#include <avr/pgmspace.h>
#include "vecmath.h"

extern unsigned char dither_enable;


extern PROGMEM unsigned const char threshold_matrix3b[4][4];
extern PROGMEM unsigned const char threshold_matrix2b[4][4];
vec3 dither_rgb(vec3 pixel,int x,int y);

vec3 rgb_to_bw(vec3 pixel24b);
unsigned char rgb_to_bw_value(vec3 pixel24b);

vec3 truncate_rgb(vec3 pixel);
unsigned char compose_rgb8(vec3 pixel);
unsigned char compose_rgb24(vec3 pixel);

vec3 decompose_rgb8(unsigned char bbgggrrr);


#endif /* COLOR_PROCESS_H_ */