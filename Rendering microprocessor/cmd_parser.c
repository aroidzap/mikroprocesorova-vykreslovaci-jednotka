#include "cmd_parser.h"

unsigned long file_last_EOF = 0;
unsigned long repeat_position = 0;

void process_command(char *cmd, char *arg)
{	
	// wait for button
	
	if(cmd_compare(cmd,"draw_bmp")) // draw_bmp(file_path);
	{
		get_argument_str(arg);
		BMP_render(FAT_find_file_cluster(arg));
	}
	
	else if(cmd_compare(cmd,"draw_bmp_from_folder")) // draw_bmp_from_folder(folder);
	{
		get_argument_str(arg);
		BMP_render(FAT_file_by_extension_cluster(arg,"bmp"));
	}
	
	else if(cmd_compare(cmd,"draw_pal"))
	{
		render(draw_pal,get_argument_i(arg,0),get_argument_i(arg,1)); // draw_pal(swap,copy);
	}
	
	else if(cmd_compare(cmd,"draw_hsv_pal")) // draw_hsv_pal(swap,copy);
	{
		render(draw_hsv_pal,get_argument_i(arg,0),get_argument_i(arg,1));
	}
	
	else if(cmd_compare(cmd,"draw_test")) // draw_test(test_number,swap,copy);
	{
		unsigned char test_n = get_argument_i(arg,0);
		if (test_n==0){
			render(draw0,get_argument_i(arg,1),get_argument_i(arg,2));
		}
		else if (test_n==1){
			render(draw1,get_argument_i(arg,1),get_argument_i(arg,2));
		}
		else if (test_n==2){
			render(draw2,get_argument_i(arg,1),get_argument_i(arg,2));
		}
		else if (test_n==3){
			render(draw3,get_argument_i(arg,1),get_argument_i(arg,2));
		}
	}
	
	else if(cmd_compare(cmd,"clear_color")) // clear_color(r,g,b);
	{
		vec3 px;
		px.r=get_argument_i(arg,0);
		px.g=get_argument_i(arg,1);
		px.b=get_argument_i(arg,2);
		if (get_color_mode()==RGB){
			clear_color(compose_rgb24(px),1);
		}
		else{
			clear_color(rgb_to_bw_value(px),1);
		}
	}
	
	else if(cmd_compare(cmd,"delay")) // delay(seconds);
	{
		delay(get_argument_i(arg,0));
	}
	
	else if(cmd_compare(cmd,"bmp_config")) // bmp_config(enable_scaling);
	{
		bmp_2to1_scaling = get_argument_i(arg,0);
	}
	
	else if(cmd_compare(cmd,"processing_config")) // processing_config(enable_dithering);
	{
		dither_enable = get_argument_i(arg,0);
	}
	
	else if(cmd_compare(cmd,"set_color_mode")) // set_color_mode(mode); //mode=RGB,BW
	{
		get_argument_enum(arg);
		if((arg[0]=='R')&&(arg[1]=='G')&&(arg[2]=='B'))
		{
			set_color_mode(RGB);
		}
		else
		{
			set_color_mode(BW);
		}
	}
	
	else if(cmd_compare(cmd,"swap_buffers")) // swap_buffers();
	{
		driver_command(SWAP_REQUEST_CMD);
	}
	
	else if(cmd_compare(cmd,"copy_buffers")) // copy_buffers(direction); // data to video == 1, video to data == 0
	{
		driver_command(COPY_DIR_CMD(get_argument_i(arg,0)));
		for(unsigned char i=0;i<120;i++)
		{
			driver_command(COPY_REQUEST_CMD(i));
		}
		driver_command(COPY_DIR_CMD(copy_to_video));
	}
	
	// repeat_from_here() //in load_commands function
	// repeat() //in load_commands function
	
}

void load_commands(char *file_path)
{
	unsigned char repeat=1;
	unsigned char line_comment=0, multiline_comment=0;
	
	while(1)
	{
		char cmd[32];
		char arg[256];
		
		FAT_read_start(FAT_find_file_cluster(file_path));
		
		if (repeat==0){
			FAT_read_skip(_EOF-file_last_EOF); //seek to next command	
		}
		else{
			if(repeat_position!=0)
			{
				FAT_read_skip(_EOF-repeat_position); //seek to command after repeat_from_here()
			}
			repeat=0;
		}
		
		// load command
		unsigned char last_c = 0, c = 0;
		while((_EOC==0)&&(_EOF>0))
		{
			last_c = c;
			c = FAT_read_next();
			
			if(line_comment==1)
			{
				if(c=='\n') // end of single-line comment
				{
					line_comment=0;
				}
				continue;
			}
			else if((last_c=='*')&&(c=='/')) // end of multi-line comment
			{
				multiline_comment=0;
				c=0;
				continue;
			}
			if(multiline_comment==1) // skip single-line/multi-line comment
			{
				continue;
			}
			if(c<=32){continue;} //skip special characters + space
			if(c==';'){continue;} // skip ";" character
				
			for (unsigned char i=0;i<31;i++) // load cmd
			{
				if ((c=='(')||(_EOF==0)){cmd[i]=0;break;}
				if(c!=' '){
					cmd[i]=c;
				}
				else{
					i-=1;
				}
				
				if (i!=0){
					c = FAT_read_next();
				}
				else
				{
					last_c = c;
					c = FAT_read_next();
					
					if(last_c=='/')
					{
						if(c=='/') // start of single-line comment
						{
							line_comment=1;
							break;
						}
						else if(c=='*') // start of multi-line comment
						{
							multiline_comment=1;
							c=0;
							break;
						}
					}
				}
			}
			
			if((multiline_comment==1)||(line_comment==1)) // skip single-line/multi-line comment
			{
				continue;
			}
			
			cmd[31]=0;
			for (unsigned char i=0;i<255;i++) // load arg
			{
				c = FAT_read_next();
				if ((c==')')||(_EOF==0)){arg[i]=0;break;}
				arg[i]=c;
			}
			arg[255]=0;
			
			break;
		}
		file_last_EOF=_EOF;
		
		if(cmd_compare(cmd,"repeat")){
			repeat=1;
		}
		else if(cmd_compare(cmd,"repeat_from_here")){
			repeat_position=_EOF;
		}
		else{
			process_command(cmd,arg);
		}
		
		if((file_last_EOF==0)&&(repeat==0)){
			break;
		}
	}
}

unsigned char cmd_compare(char* cmd, char* text)
{
	unsigned char compare = 1;
	for (unsigned char i = 0; i<32; i++)
	{
		if ((cmd[i]==0)&&(text[i]==0)){
			break;
		}
		if (cmd[i]!=text[i]){
			compare = 0;
			break;
		}
	}
	return compare;
}

int get_argument_i(char *arg, unsigned char arg_number)
{
	int result=0;
	
	int i=0;
	int sign=0;
	
	while (arg_number>0){ //go to wanted argument position
		while ((arg[i]!=',')&&(i<256)) //wait for "," character
		{
			i++;
		}
		i++;
		arg_number--;
	}
	
	while ((arg[i]<=32)&&(i<256)) //skip special characters + space
	{
		i++;
	}
	
	if (i>=256){return 0;}
	
	if (arg[i]=='-'){ //set sign
		sign=-1;
		i++;
	}
	else if(arg[i]=='+'){
		sign=1;
		i++;
	}
	else{
		sign=1;
	}

	while((arg[i]>=48)&&(arg[i]<=57)&&(i<256))
	{
		result*=10;
		result+=(arg[i]-48);
		i++;
	}
	return (result*sign);
}

void get_argument_str(char *arg) //returns string without quotes back in "arg"
{
	int index = 0;
	int i = 0;
	
	while (((arg[i]<=32)||(arg[i]=='"'))&&(i<255)) //skip special characters + space + " character
	{
		i++;
	}
	
	while ((index<255)&&(i<255)&&(arg[i]!='"'))
	{
		arg[index]=arg[i];
		
		index++;
		i++;
	}
	arg[index]=0;
}

void get_argument_enum(char *arg) //returns upper case enum back in "arg"
{
	int index = 0;
	int i = 0;
	
	while ((arg[i]<=32)&&(i<255)) //skip special characters + space
	{
		i++;
	}
	
	while ((index<255)&&(i<255)&&(((arg[i]>=65)&&(arg[i]<=90))||((arg[i]>=97)&&(arg[i]<=122))||(arg[i]==95)))
	{
		if((arg[i]>=97)&&(arg[i]<=122))
		{
			arg[index]=arg[i]-32;
		}
		else
		{
			arg[index]=arg[i];
		}
		
		index++;
		i++;
	}
	arg[index]=0;
}