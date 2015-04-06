/*
*	Copyright (c) 2015 Tomáš Pazdiora
*	See the file "LICENSE.txt" for the full license governing this code.
*/

#include "settings.h"

void set_color_mode(unsigned char color_mode)
{
	if (color_mode==1){
		MODE_PORT|=_BV(MODE);
	}
	else{
		MODE_PORT&=~_BV(MODE);
	}
}

unsigned char get_color_mode()
{
	if ((MODE_PORT&_BV(MODE))!=0){
		return RGB;
	}
	else{
		return BW;
	}
}

unsigned char informative_color()
{
	if ((MODE_PORT&_BV(MODE))!=0){
		return 0x07;
	}
	else{
		return 0xFF;
	}
}