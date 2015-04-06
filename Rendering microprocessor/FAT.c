/*
*	Copyright (c) 2015 Tomáš Pazdiora
*	See the file "LICENSE.txt" for the full license governing this code.
*/

#include "FAT.h"

unsigned int fat_sector_offset=0;
unsigned long first_cluster_offset=0;

unsigned char sectors_per_cluster=0;
unsigned long root_cluster=0;

unsigned long directory_cluster=0;

unsigned long current_cluster=0;
unsigned char _EOC=0;
unsigned long _EOF=0;

unsigned int next_file_id=0;
unsigned int next_file_last_dir_cluster=0;

// ----------------- Low functions ------------------

void FAT_init()
{
	// find partition
	// no MBR if (0xEB 0x58 0x90)
	unsigned long partition_offset=0;
	// ------------------------------
	
	/*
		sectors_per_cluster
		fat_sector_offset
		number_of_fats
		sectors_per_fat
		root_cluster
	*/
	
	unsigned char number_of_fats;
	unsigned long sectors_per_fat;

	SD_read_start(partition_offset,1);
	SD_read_skip(13);
	
	sectors_per_cluster=SD_read_next();
	
	fat_sector_offset=SD_next_ui();
	
	number_of_fats=SD_read_next();
	
	SD_read_skip(19);
	
	sectors_per_fat=SD_next_ul();
	
	SD_read_skip(4);
	
	root_cluster=SD_next_ul();
	
	first_cluster_offset=fat_sector_offset+number_of_fats*sectors_per_fat;
	
	SD_read_stop();
}
unsigned long cluster_to_lba(unsigned long cluster)
{
	return (first_cluster_offset+(cluster-2)*((unsigned long)sectors_per_cluster));
}
int FAT_get_new_cluster()
{
	unsigned long new_cluster[2]={0,0};
	unsigned char i=0;
	
	do 
	{
		SD_read_start(fat_sector_offset+current_cluster/128UL,1);
		SD_read_skip(4*((unsigned int)(current_cluster%128UL)));
		new_cluster[i]=SD_next_ul();
		i^=1;
	} while (new_cluster[0]!=new_cluster[1]);

	current_cluster = new_cluster[0]; // error elimination by reading 2x
	
	if ((current_cluster==0UL)||(current_cluster>=0x0FFFFFFFUL)) // EoC
	{
		_EOC=1;
		return 1;
	}
	else
	{
		return 0;
	}
}

void FAT_read_start(unsigned long cluster)
{
	current_cluster=cluster;
	_EOC=0;
	SD_read_start(cluster_to_lba(current_cluster),sectors_per_cluster);
}

unsigned char FAT_read_next()
{
	if (_EOC==0){
		if ((SD_remaining_blocks==0)&&(SD_actual_byte==0))
		{
			if(FAT_get_new_cluster()!=0){return 0;}
			SD_read_start(cluster_to_lba(current_cluster),sectors_per_cluster);
		}
		if (_EOF>0)
		{
			_EOF--;
		}
		return SD_read_next();
	}
	else
	{
		return 0;
	}
}

unsigned long FAT_next_ul()
{
	unsigned long variable=0;
	variable|=((unsigned long)FAT_read_next())<<0;
	variable|=((unsigned long)FAT_read_next())<<8;
	variable|=((unsigned long)FAT_read_next())<<16;
	variable|=((unsigned long)FAT_read_next())<<24;
	return variable;
}
unsigned int FAT_next_ui()
{
	unsigned int variable=0;
	variable|=((unsigned int)FAT_read_next())<<0;
	variable|=((unsigned int)FAT_read_next())<<8;
	return variable;
}

void FAT_read_skip(int bytes_to_skip)
{
	for (;bytes_to_skip>0;bytes_to_skip--)
	{
		FAT_read_next();
	}
}

// --------------------------------------------------

unsigned long FAT_find_entry_cluster(char *name ,unsigned char is_directory) // case-sensitive
{
	unsigned char entry_data[32];
	unsigned char lfn_count;
	unsigned char compare;
	
	if(directory_cluster==0)
	{
		FAT_read_start(root_cluster);
	}
	else
	{
		FAT_read_start(directory_cluster);
	}
	
	while(_EOC==0)
	{
		for(unsigned char i=0;i<32;i++)
		{
			entry_data[i]=FAT_read_next();
		}
		
		if(entry_data[11]==0x0F)
		{
			//Long Filename
			if((entry_data[0]&0x80)!=0) // file deleted
			{
				continue;
			}
			
			if((entry_data[0]&0x40)!=0) // last lfn
			{
				lfn_count=(entry_data[0]&0x3F);
			}
			else
			{
				continue;
			}
			
			compare=1;
			for(;lfn_count>0;lfn_count--)
			{
				unsigned char filename_segment[13];
				unsigned char segment_index=0;

				for(unsigned char i=0x01;i<0x20;i+=2)
				{
					if(i==0x0B){i=0x0E;}
					if(i==0x1A){i=0x1C;}
					
					if(entry_data[i+1]!=0){
						filename_segment[segment_index]=0;
						segment_index++;
					}
					else{
						filename_segment[segment_index]=entry_data[i];
						segment_index++;
					}
				}
				
				unsigned char compare_offset=((lfn_count-1)*13);
				for(unsigned char i=0;i<13;i++)
				{
					if (filename_segment[i]!=0){
						if (name[compare_offset+i]!=filename_segment[i])
						{
							compare=0;
						}
					}
				}
				
				for(unsigned char i=0;i<32;i++)
				{
					entry_data[i]=FAT_read_next();
				}
			}
			
			if (compare==0)
			{
				continue;
			}
			
			if((is_directory&1)!=((entry_data[11]>>4)&1)) // returns zero if directory flag is not same as is_directory
			{
				continue;
			}
			
			_EOF = ((unsigned long)entry_data[28]<<0)|((unsigned long)entry_data[29]<<8)|((unsigned long)entry_data[30]<<16)|((unsigned long)entry_data[31]<<24);
			unsigned long file_cluster=((unsigned long)entry_data[20]<<16)|((unsigned long)entry_data[21]<<24)|((unsigned long)entry_data[26]<<0)|((unsigned long)entry_data[27]<<8);
			
			return file_cluster;
			
		}
		else
		{
			//Short Filename
			
			if(entry_data[0]==0xE5) // file deleted
			{
				continue;
			}
			
			if(entry_data[0]==0x05) // filename starts with 0xE5
			{
				entry_data[0]=0xE5;
			}
			
			if((is_directory&1)!=((entry_data[11]>>4)&1)) // returns zero if directory flag is not same as is_directory
			{
				continue;
			}
			
			// get extension from given name
			char extension[3];
			unsigned char last_dot_position=0;
			
			if (is_directory==0)
			{
				unsigned char ix=0;
				while(name[ix]!=0)
				{
					if (name[ix]=='.')
					{
						last_dot_position=ix;
					}
					ix++;
				}
				for (unsigned char i=0;i<3;i++)
				{
					extension[i]=name[last_dot_position+i+1];
				}
			}
			else
			{
				unsigned char ix=0;
				while(name[ix]!=0)
				{
					ix++;
				}
				last_dot_position=ix;
			}
			
			
			compare=1;
			for (unsigned char i=0;i<8;i++)
			{
				if(i>=last_dot_position)
				{
					if(entry_data[i]!=0x20)
					{
						compare = 0;
					}
				}
				else
				{
					if(((entry_data[12]&0x08)!=0)&&(entry_data[i]>=65)&&(entry_data[i]<=90)) //lower case filename
					{
						if((entry_data[i]+32)!=name[i]){
							compare = 0;
						}
					}
					else
					{
						if(entry_data[i]!=name[i]){
							compare = 0;
						}
					}
				}
			}
			
			if (is_directory==0)
			{
				unsigned char name_was_zero=0;
				for (unsigned char i=0;i<3;i++)
				{
					if(name[last_dot_position+i+1]==0)
					{
						name_was_zero=1;
					}
					if(name_was_zero==1)
					{
						if(entry_data[8+i]!=0x20)
						{
							compare = 0;
						}
					}
					else
					{
						if(((entry_data[12]&0x10)!=0)&&(entry_data[8+i]>=65)&&(entry_data[8+i]<=90)) //lower case extension
						{
							if((entry_data[8+i]+32)!=extension[i]){
								compare = 0;
							}
						}
						else
						{
							if(entry_data[8+i]!=extension[i]){
								compare = 0;
							}
						}
					}
				}
			}
			
			if (compare==0)
			{
				continue;
			}
			
			_EOF = ((unsigned long)entry_data[28]<<0)|((unsigned long)entry_data[29]<<8)|((unsigned long)entry_data[30]<<16)|((unsigned long)entry_data[31]<<24);
			unsigned long file_cluster=((unsigned long)entry_data[20]<<16)|((unsigned long)entry_data[21]<<24)|((unsigned long)entry_data[26]<<0)|((unsigned long)entry_data[27]<<8);
			
			return file_cluster;
		}
	}
	return 0;
}

void FAT_open_directory(char *directory_path, unsigned char name_is_file_path)
{
	int i=0,x=0;
	directory_cluster=0; //open root
	
	while(directory_path[i]!=0)
	{
		if(((directory_path[i]=='/')||(directory_path[i]=='\\'))&&(i!=0))
		{
			directory_path[x]=0;
			directory_cluster=FAT_find_entry_cluster(directory_path,1);
			x=0;
		}
		else
		{
			directory_path[x]=directory_path[i];
			x++;
		}
		i++;
	}
	directory_path[x]=0;
	if (name_is_file_path==0){
		directory_cluster=FAT_find_entry_cluster(directory_path,1);
	}
}

unsigned long FAT_find_file_cluster(char *file_path) // case-sensitive
{
	FAT_open_directory(file_path,1);
	return FAT_find_entry_cluster(file_path,0);
}

unsigned long FAT_file_by_extension_cluster(char* directory_name, char *extension) // no case-sensitivity for extension
{
	int current_file_id=0;
	unsigned char entry_data[32];
	unsigned char compare;
	
	FAT_open_directory(directory_name,0);
	
	while(1)
	{
		if(directory_cluster==0)
		{
			FAT_read_start(root_cluster);
		}
		else
		{
			FAT_read_start(directory_cluster);
		}
		
		while(_EOC==0)
		{
			for(unsigned char i=0;i<32;i++)
			{
				entry_data[i]=FAT_read_next();
			}
			
			if(entry_data[11]!=0x0F)
			{
				//Short Filename
				
				if(entry_data[0]==0xE5) // file deleted
				{
					continue;
				}
				
				if((entry_data[11]&0x10)!=0) // returns zero if directory flag is not same as is_directory
				{
					continue;
				}
				
				compare=1;
				unsigned char extension_was_zero=0;
				for (unsigned char i=0;i<3;i++)
				{
					if(extension[i]==0)
					{
						extension_was_zero=1;
					}
					if(extension_was_zero==1)
					{
						if(entry_data[8+i]!=0x20)
						{
							compare = 0;
						}
					}
					else
					{
						if((extension[i]>=97)&&(extension[i]<=122))
						{
							if((entry_data[8+i]+32)!=extension[i]){
								compare = 0;
							}
						}
						else
						{
							if(entry_data[8+i]!=extension[i]){
								compare = 0;
							}
						}
					}
				}
				
				if (compare==0)
				{
					continue;
				}
				else
				{
					if (next_file_id>current_file_id)
					{
						current_file_id++;
					}
					else
					{
						next_file_id++;
						_EOF = ((unsigned long)entry_data[28]<<0)|((unsigned long)entry_data[29]<<8)|((unsigned long)entry_data[30]<<16)|((unsigned long)entry_data[31]<<24);
						unsigned long file_cluster=((unsigned long)entry_data[20]<<16)|((unsigned long)entry_data[21]<<24)|((unsigned long)entry_data[26]<<0)|((unsigned long)entry_data[27]<<8);
						
						return file_cluster;
					}
				}
			}
		}
		
		if (next_file_id>=current_file_id)
		{
			next_file_id=0;
		}
		else
		{
			break;
		}
		
	}
	return 0;
}