#include "BMP.h"

unsigned long bmp_current_pixel=0;
unsigned long bmp_current_row=0;
unsigned long bmp_width=0;
unsigned long bmp_height=0;
unsigned char bmp_padding=0;

unsigned char bmp_centering_skip=0;

unsigned char bmp_2to1_scaling=1;

int BMP_decode_start()
{
	char sig[2];
	sig[0]= FAT_read_next();
	sig[1]= FAT_read_next();
		
	FAT_read_skip(8);
		
	unsigned long data_offset=FAT_next_ul();
		
	FAT_read_skip(4);
		
	bmp_width=FAT_next_ul();
	bmp_height=FAT_next_ul();
		
	FAT_read_skip(2);
		
	unsigned int color_bits=FAT_next_ui();

		
	bmp_padding=(4-(((color_bits/8)*bmp_width)%4))%4;
		
	FAT_read_skip(data_offset-30);
		
	bmp_current_row=0;
	bmp_current_pixel=0;
		
	if((sig[0]!='B')||(sig[1]!='M'))
	{
		return 1;
	}
	if(color_bits!=24)
	{
		return 1;
	}
	return 0;
}
vec3 BMP_next_pixel()
{
	vec3 pixel;

	if ((bmp_current_pixel<bmp_width)&&(bmp_centering_skip==0))
	{

		pixel.b = FAT_read_next();
		pixel.g = FAT_read_next();
		pixel.r = FAT_read_next();
		
		if (bmp_current_pixel==(bmp_width-1))
		{
			FAT_read_skip(bmp_padding);
		}

		bmp_current_pixel++;
	}
	else
	{
		pixel.b = 0;
		pixel.g = 0;
		pixel.r = 0;
	}
	return pixel;
}

void BMP_next_y()
{
	if ((bmp_current_row<bmp_height)&&(bmp_centering_skip==0)){
		while(bmp_current_pixel<bmp_width)
		{
			BMP_next_pixel();
		}
		bmp_current_pixel=0;
		bmp_current_row++;
	}
}

void BMP_center_y(int input_y)
{
	if (input_y<=(height/2)){
		int compare=((height-(int)bmp_height)/2)-input_y;
		if (compare>0)
		{
			bmp_centering_skip|=2;
		}
		else if (compare==0)
		{
			bmp_centering_skip&=~2;
			bmp_current_row=0;
		}
	}
}
void BMP_center_x(int input_x)
{
	if (input_x<=(width/2)){
		int compare;
		if(bmp_2to1_scaling!=0){
			compare=((width-(int)bmp_width/2)/2)-input_x;
		}
		else{
			compare=((width-(int)bmp_width)/2)-input_x;
		}
		
		if (compare>0)
		{
			bmp_centering_skip|=1;
		}
		else if (compare==0)
		{
			bmp_centering_skip&=~1;
			bmp_current_pixel=0;
		}
	}
}

void BMP_render(unsigned long starting_cluster)
{
	FAT_read_start(starting_cluster);
	
	if (BMP_decode_start()==0)
	{
		for(unsigned int y=0;y<height;y++)
		{
			set_Y(height-1-y);
			reset_X();
				
			BMP_center_y(y);
				
			for(unsigned char x=0;x<width;x++)
			{

				BMP_center_x(x);
					
				unsigned char draw_temp;
					
				vec3 px = BMP_next_pixel();
				
				if(bmp_2to1_scaling!=0){
					px = average(px, BMP_next_pixel());
				}
				
				if (get_color_mode()==RGB){
					if (dither_enable!=0){
						draw_temp=compose_rgb8(dither_rgb(px,x,y));
					}
					else{
						draw_temp=compose_rgb24(px);
					}
				}
				else
				{
					draw_temp=rgb_to_bw_value(px);
				}
					
				RAM_write(draw_temp);
					
				inc_X();
			}
				
			BMP_next_y();
			
			render_loading_bar(y);
		}
	}
	else
	{
		clear_color(0,0);
		for(unsigned int y=100;y<(height-100);y++)
		{
			set_Y(y);
			set_X(50);
			
			for(unsigned char x=55;x<width-55;x++)
			{
				if((x==((y/2)+5))||((width-1-x)==((y/2)+5)))
				{
					RAM_write(informative_color());
				}
				
				inc_X();
			}
		}
	}
	
	driver_command(SWAP_REQUEST_CMD);
}