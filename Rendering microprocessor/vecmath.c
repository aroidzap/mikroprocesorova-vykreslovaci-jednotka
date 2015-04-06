/*
*	Copyright (c) 2015 Tomáš Pazdiora
*	See the file "LICENSE.txt" for the full license governing this code.
*/

#include "vecmath.h"

vec3 add(vec3 a, vec3 b)
{
	vec3 result;
	result.r = a.r+b.r;
	result.g = a.g+b.g;
	result.b = a.b+b.b;
	return result;
}
vec3 add_value(vec3 a, unsigned char v)
{
	vec3 result;
	result.r = a.r+v;
	result.g = a.g+v;
	result.b = a.b+v;
	return result;
}
vec3 mul_value(vec3 a, float v)
{
	vec3 result;
	result.r = a.r*v;
	result.g = a.g*v;
	result.b = a.b*v;
	return result;
}
vec3 average(vec3 a, vec3 b)
{
	vec3 result;
	result.r = ( (unsigned int)a.r + (unsigned int)b.r ) / 2 ;
	result.g = ( (unsigned int)a.g + (unsigned int)b.g ) / 2 ;
	result.b = ( (unsigned int)a.b + (unsigned int)b.b ) / 2 ;
	return result;
}
vec3 mix(vec3 a, vec3 b,unsigned char alpha)
{
	vec3 result;
	result.r = ( (255-(unsigned int)alpha)*(unsigned int)a.r + (unsigned int)alpha*(unsigned int)b.r ) / 255 ;
	result.g = ( (255-(unsigned int)alpha)*(unsigned int)a.g + (unsigned int)alpha*(unsigned int)b.g ) / 255 ;
	result.b = ( (255-(unsigned int)alpha)*(unsigned int)a.b + (unsigned int)alpha*(unsigned int)b.b ) / 255 ;
	return result;
}

unsigned char clamp(int x)
{
	if (x>255){
		return 255;
	}
	if (x<0){
		return 0;
	}
	return (unsigned char)x;
}

float absolute(float x)
{
	if (x<0){
		return -x;
	}
	else{
		return x;
	}
}