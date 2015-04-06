#include "drawing.h"

unsigned long time = 0;


void clear_color(unsigned char color, unsigned char swap)
{
	for(unsigned int y=0;y<height;y++)
	{
		set_Y(y);
		reset_X();
		
		for(unsigned char x=0;x<width;x++)
		{
			RAM_write(color);
			inc_X();
		}
	}
	if (swap!=0)
	{
		driver_command(SWAP_REQUEST_CMD);
	}
}

void render_loading_bar(unsigned int input_y)
{
	if((input_y%2==0)&&(input_y<(height-4)))
	{
		unsigned char loading_ratio=(width*(input_y/2))/(height/2);
		for (unsigned char i=0;i<4;i++)
		{
			set_Y(height-4+i);
			reset_X();
			
			if ((i==0)||(i==3))
			{
				for(unsigned char x=0;x<width;x++)
				{
					DATA_PORT=0x00; //black
					
					CTRL_PORT&=~_BV(WE);
					CTRL_PORT|=_BV(WE);
					
					inc_X();
				}
			}
			else
			{
				for(unsigned char x=0;x<width;x++)
				{
					if (x<=loading_ratio)
					{
						DATA_PORT=informative_color();
					}
					else
					{
						DATA_PORT=0x00; //black
					}

					CTRL_PORT&=~_BV(WE);
					CTRL_PORT|=_BV(WE);
					
					inc_X();
				}
			}
		}
		
		driver_command(COPY_REQUEST_CMD((height-4)/4));
	}
}

void render(unsigned char (*compute_pixel)(int,int), unsigned char swap, unsigned char copy)
{
	for(unsigned int y=0;y<height;y++)
	{
		set_Y(y);
		reset_X();
		
		for(unsigned char x=0;x<width;x++)
		{
			RAM_write(compute_pixel(x,y));
			inc_X();
		}
		if ((copy!=0)&&(y%4==3))
		{
			driver_command(COPY_REQUEST_CMD(y/4));
		}
		if (swap!=0)
		{
			render_loading_bar(y);
		}
	}
	if (swap!=0)
	{
		driver_command(SWAP_REQUEST_CMD);
	}
	
	time++;
}

unsigned char draw_pal(int input_x,int input_y)
{
	float X = input_x/((float)width);
	float Y = (input_y/((float)height))*2;
	
	vec3 pixel;
	pixel.r=0;pixel.g=0;pixel.b=0;
	
	if ((int)Y==0)
	{
		pixel.r = ((unsigned char)(X*255));
		pixel.g = ((unsigned char)(Y*255));
		pixel.b = (((unsigned char)(X*512*255))%255);
	}
	else
	{
		if ((((int)(Y*4))-4)==0){
			pixel.r = ((unsigned char)(X*255));
		}
		if ((((int)(Y*4))-4)==1){
			pixel.g = ((unsigned char)(X*255));
		}
		if ((((int)(Y*4))-4)==2){
			pixel.b = ((unsigned char)(X*255));
		}
		if ((((int)(Y*4))-4)==3){
			pixel.r = ((unsigned char)(X*255));
			pixel.g = ((unsigned char)(X*255));
			pixel.b = ((unsigned char)(X*255));
		}
	}
	
	if (get_color_mode()==RGB){
		if (dither_enable!=0)
		{
			return compose_rgb8(dither_rgb(pixel,input_x,input_y));
		}
		else
		{
			return compose_rgb24(pixel);
		}
	}
	else
	{
		return rgb_to_bw_value(pixel);		
	}
	
}

unsigned char draw_hsv_pal(int input_x,int input_y)
{
	float c=input_x/((float)width);
	vec3 pixel;
	
	pixel.r=clamp(((absolute(c-0.5)*6.0)-1.0)*255.0);
	pixel.g=clamp(((-absolute(c-(1.0/3.0))*6.0)+2.0)*255.0);
	pixel.b=clamp(((-absolute(c-(2.0/3.0))*6.0)+2.0)*255.0);
	
	pixel=mul_value(pixel,1.0-input_y/((float)height));
	
	if (get_color_mode()==RGB){
		if (dither_enable!=0)
		{
			return compose_rgb8(dither_rgb(pixel,input_x,input_y));
		}
		else
		{
			return compose_rgb24(pixel);
		}
	}
	else
	{
		return rgb_to_bw_value(pixel);
	}
}

void delay(unsigned int seconds)
{
	for (unsigned int s=seconds;s>0;s--)
	{
		_delay_ms(1000);
	}
}