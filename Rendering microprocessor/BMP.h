/*
*	Copyright (c) 2015 Tomáš Pazdiora
*	See the file "LICENSE.txt" for the full license governing this code.
*/

#ifndef BMP_H_
#define BMP_H_

#include <avr/io.h>
#include "FAT.h"
#include "vecmath.h"

#include "RAM.h"
#include "settings.h"
#include "commands.h"

#include "color_process.h"
#include "drawing.h"

extern unsigned long bmp_current_pixel;
extern unsigned long bmp_current_row;
extern unsigned long bmp_width;
extern unsigned long bmp_height;
extern unsigned char bmp_padding;

extern unsigned char bmp_centering_skip;

extern unsigned char bmp_2to1_scaling;

int BMP_decode_start();
vec3 BMP_next_pixel();
void BMP_next_y();

void BMP_center_y(int input_y);
void BMP_center_x(int input_x);

void BMP_render(unsigned long starting_cluster);

#endif /* BMP_H_ */