/*
*	Copyright (c) 2015 Tomáš Pazdiora
*	See the file "LICENSE.txt" for the full license governing this code.
*/

#include "draw_test.h"

unsigned char draw0(int input_x,int input_y) //heart
{
	float X = ((input_x-(width/2))/(width*real_width_ratio/2.0f));
	float Y = ((input_y-(height/2))/(height*real_height_ratio/2.0f));
	
	//invert y
	Y = -Y;
	
	//alignment
	Y -= 0.25f;
	Y -= 0.25f;
	
	//zoom
	X /= 1.5;
	Y /= 1.5;
	
	float a = atan2(X,Y)/3.141593;
	float r = sqrt(X*X+Y*Y);
	
	float h;
	if (a>0.0)
	{
		h = a;
	}
	else
	{
		h = -a;
	}
	
	float d = (13.0*h - 22.0*h*h + 10.0*h*h*h)/(6.0-5.0*h);
	
	if (d<r)
	{
		return 0;
	}
	else
	{
		unsigned char val = clamp(1500*(d-r));
		
		if (get_color_mode()==RGB){
			vec3 px;
			px.r=val;px.g=0;px.b=0;
			
			if (dither_enable!=0){
				return compose_rgb8(dither_rgb(px,input_x,input_y));
			}
			else{
				return compose_rgb24(px);
			}
		}
		else
		{
			return val;
		}
	}
}

//generic rotation formula
void rot(float *x,float *y,float a){
	float _sin=sin(a);
	float _cos=cos(a);
	*x=*x*_cos-*y*_sin;
	*y=*y*_cos+*x*_sin;
}
unsigned char draw1(int input_x,int input_y) // basic fractal
{
	float X = ((input_x-(width/2))/(width*real_width_ratio/2.0));
	float Y = ((input_y-(height/2))/(height*real_height_ratio/2.0));
	
	//invert y
	Y = -Y;
	
	//global rotation and zoom
	rot(&X,&Y,0.3);
	
	//mirror, rotate and scale maxIterations times...
	float s=0.3;
	for(int i=0;i<3;i++){
		X=absolute(X)-s;
		Y=absolute(Y)-s;
		rot(&X,&Y,0.2);
		s=s/2.1;
	}
	
	//draw a circle
	const float circleSize = pow((1.0/(3.0*pow(2.0,3.0))),2.0);
	unsigned char c = clamp(pow((circleSize/((X*X+Y*Y)*4.0)),0.25)*255);

	if (get_color_mode()==RGB){
		vec3 px;
		px.r=c;px.g=c/2;px.b=255-c;
		
		if (dither_enable!=0){
			return compose_rgb8(dither_rgb(px,input_x,input_y));
		}
		else{
			return compose_rgb24(px);
		}
	}
	else
	{
		return c;
	}
}

unsigned char draw2(int input_x,int input_y)
{
	unsigned char c = (int)(sin(((float)input_x)/16.0)*cos(((float)input_y)/16.0)*255.0);
	
	if (get_color_mode()==RGB){
		vec3 px;
		px.r=c;px.g=255-c;px.b=0;
		
		if (dither_enable!=0){
			return compose_rgb8(dither_rgb(px,input_x,input_y));
		}
		else{
			return compose_rgb24(px);
		}
	}
	else
	{
		return c;
	}
}

unsigned char draw3(int input_x,int input_y)
{
	float x=input_x/((float)width);
	float y=input_y/((float)height);
	vec3 pixel;
	
	pixel.r=clamp(255.0*x);
	pixel.g=clamp(255.0*y);
	pixel.b=0;
	
	if (get_color_mode()==RGB)
	{
		if (dither_enable!=0)
		{
			return compose_rgb8(dither_rgb(pixel,input_x,input_y));
		}

		return compose_rgb24(pixel);
	}
	else
	{
		return rgb_to_bw_value(pixel);
	}
}