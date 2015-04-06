#include "color_process.h"

unsigned char dither_enable = 1;


PROGMEM unsigned const char threshold_matrix3b[4][4]= {	{2,17,6,21},
														{24,9,28,13},
														{8,23,4,19},
														{30,15,26,11}	};

PROGMEM unsigned const char threshold_matrix2b[4][4]= {	{4,34,11,41},
														{49,19,56,26},
														{15,45,8,38},
														{60,30,53,23}	};

vec3 dither_rgb(vec3 pixel24b,int x,int y)
{
	// Ordered dithering 4x4 threshold map
	
	vec3 old_pixel = pixel24b;
	
	unsigned char tm3=pgm_read_byte(&threshold_matrix3b[x%4][y%4]);
	unsigned char tm2=pgm_read_byte(&threshold_matrix2b[x%4][y%4]);
	
	old_pixel.r = clamp(old_pixel.r + tm3);
	old_pixel.g = clamp(old_pixel.g + tm3);
	old_pixel.b = clamp(old_pixel.b + tm2);
	
	vec3 new_pixel = truncate_rgb(old_pixel);
	
	return new_pixel;
}

vec3 rgb_to_bw(vec3 pixel24b)
{
	// Converts RGB pixel to BW pixel
	
	// ITU-R BT.709
	// Relative luminance = 0.2126 Red + 0.7152 Green + 0.0722 Blue
	
	vec3 new_pixel = pixel24b;
	
	unsigned char val = rgb_to_bw_value(new_pixel);
	
	new_pixel.r = val;
	new_pixel.g = val;
	new_pixel.b = val;
	
	return new_pixel;
}

unsigned char rgb_to_bw_value(vec3 pixel24b)
{
	// Converts 24bit RGB to 8bit BW value
	
	// ITU-R BT.709
	// Relative luminance = 0.2126 Red + 0.7152 Green + 0.0722 Blue
	
	return ( ( (unsigned int)pixel24b.r * 54 + (unsigned int)pixel24b.g * 182 + (unsigned int)pixel24b.b * 19) / 255 );
}

vec3 truncate_rgb(vec3 pixel24b)
{
	// Truncate bits from 8 Red 8 Green 8 Blue to 3 Red 3 Green 2 Blue
	
	vec3 result;
	
	result.r=pixel24b.r/32;
	result.g=pixel24b.g/32;
	result.b=pixel24b.b/64;
	
	return result;
}

vec3 decompose_rgb8(unsigned char bbgggrrr)
{
	// Decomposes from BBGGGRRR format to pixel
	
	vec3 result;
	result.r = bbgggrrr&0b00000111;
	result.g = (bbgggrrr&0b00111000)<<1;
	result.b = (bbgggrrr&0b11000000)>>2;
	
	result.g = (result.g << 4) | (result.g >> 4);
	result.b = (result.b << 4) | (result.b >> 4);
	
	return result;
}

unsigned char compose_rgb8(vec3 pixel8b)
{
	// Composes from pixel to BBGGGRRR format
	
	unsigned char blue_swap = (pixel8b.b << 4) | (pixel8b.b >> 4);
	unsigned char green_swap = (pixel8b.g << 4) | (pixel8b.g >> 4);
	return (pixel8b.r&0b00000111)|((green_swap&0b01110000)>>1)|((blue_swap&0b00110000)<<2);
}

unsigned char compose_rgb24(vec3 pixel24b)
{
	// Truncates and composes from pixel to BBGGGRRR format
	
	unsigned char red_swap = (pixel24b.r << 4) | (pixel24b.r >> 4);
	return ((red_swap&0b00001110)>>1)|((pixel24b.g&0b11100000)>>2)|(pixel24b.b&0b11000000);
}