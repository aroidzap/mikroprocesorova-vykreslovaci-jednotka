/*
*	Copyright (c) 2015 Tomáš Pazdiora
*	See the file "LICENSE.txt" for the full license governing this code.
*/

#ifndef VECMATH_H_
#define VECMATH_H_

typedef struct
{
	unsigned char r;
	unsigned char g;
	unsigned char b;
}vec3;

vec3 add(vec3 a, vec3 b);
vec3 add_value(vec3 a, unsigned char v);
vec3 mul_value(vec3 a, float v);

vec3 average(vec3 a, vec3 b);
vec3 mix(vec3 a, vec3 b,unsigned char alpha);

unsigned char clamp(int x);
float absolute(float x);

#endif /* VECMATH_H_ */