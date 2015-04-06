#include "SD.h"

unsigned char SD_speed=0;

unsigned int SD_actual_byte=0;
unsigned long SD_remaining_blocks=0;
unsigned char SD_HighCapacity=0;

unsigned char SD_is_reading=0;

unsigned long SD_last_address=0;
unsigned long SD_last_blocks=0;

unsigned int current_crc_16=0;

unsigned char sector_data[512];


// ---------------------- CRC -------------------------

unsigned char crc7(unsigned char *message)
{
	unsigned const char polynomial = 0x89; //CRC-7 polynomial x^7 + x^3 + 1

	unsigned int crc = 0;
	for (unsigned char i = 0; i < 5; i++)
	{
		crc = (crc << 1) ^ message[i];

		if ((crc & 0x80) != 0)
		{
			crc ^= polynomial;
		}

		for (unsigned char b = 1; b < 8; b++)
		{
			crc = (crc << 1);
			if ((crc & 0x80) != 0)
			{
				crc ^= polynomial;
			}
		}
	}
	return ((crc<<1)|0x01);
}

unsigned int crc16(unsigned int  old_crc, unsigned char data) //CRC-16 CCITT polynomial x^16 + x^12 + x^5 + 1
{
	unsigned int crc;
	unsigned int x;

	x = ((old_crc>>8) ^ data) & 0xff;
	x ^= x>>4;

	crc = (old_crc << 8) ^ (x << 12) ^ (x <<5) ^ x;

	return crc;
}

// ----------------------------------------------------

void SD_idle()
{
	CS_DISABLE();
	for(unsigned int i=0; i<10; i++){ // idle for 10 bytes / 80 clocks (min 74clocks)
		SPI_transfer(0xFF);
	}
}

void SD_set_speed(unsigned char speed)
{
	//	speed	kbit/s
	//	0		125
	//	1		250
	//	2		500
	//	3		1000
	//	4		2000
	//	5		4000
	//	6		8000
	
	SD_speed=speed;
}

int SD_init_basic()
{
	SPI_init(); // low speed (fosc/128) for SD initialization
	
	unsigned char response;
	unsigned char error=1;
	
	while(error!=0)
	{
		SD_idle();
		
		response=0xFF;
		if(response!=1){response=SD_command_R1(0, 0x00000000, 1);error=0;}
		
		response=0xFF;
		if(response!=0){response=SD_command_R1(1, 0x00000000, 0);error=0;}
		
 		response=0xFF;
 		if(response!=0){response=SD_command_R1(59, 0x00000001, 0);error=0;} //turn on CRC7
		
		response=0xFF;
		if(response!=0){response=SD_command_R1(16, 0x00000200, 0);error=0;} //SDSC - set block length to 512B
	}
	
	SD_HighCapacity=0;
	
	SPI_set_speed(SD_speed);

	return 0;
}
int SD_init()
{
	return SD_init_basic();
}

void SD_command(unsigned char cmd, unsigned long arg)
{
	unsigned char message[5];
	message[0] = (cmd|0x40);
	message[1] = (unsigned char)(arg>>24);
	message[2] = (unsigned char)(arg>>16);
	message[3] = (unsigned char)(arg>>8);
	message[4] = (unsigned char)arg;
	
	CS_ENABLE();	
	for (unsigned char i=0;i<5;i++)
	{
		SPI_transfer(message[i]);
	}
	SPI_transfer(crc7(message));
}

unsigned char SD_command_R1(unsigned char cmd, unsigned long arg, unsigned char expected_response)
{
	unsigned char response;
	SD_command(cmd,arg);

	for(unsigned char timeout=0;timeout<200;timeout++) // waits for response (response has MSB == 0)
	{
		response=SPI_transfer(0xFF);
		if ((response&0x88)==0x08)
		{
			SD_command(cmd,arg);
			response=SPI_transfer(0xFF);
		}
		if((response&0x81)==(expected_response&0x81))
		{
			break;
		}
	}
	
	CS_DISABLE();
	
	return response;
}

void SD_read_start(unsigned long adress,unsigned long blocks)
{
	unsigned char timeout1,timeout2;
	unsigned char response;
	
	SD_last_address=adress;
	SD_last_blocks=blocks;
	
	if (SD_HighCapacity==0)
	{
		adress=adress*512UL;
	}
	
	if (SD_is_reading==1){SD_read_stop();}
	
	while(1)
	{
		response = 0xFF;
		timeout1 = 0;
		timeout2 = 0;
		
		SD_command(18,adress);
		
		do
		{
			response=SPI_transfer(0xFF);
			if ((response&0x88)==0x08) //crc error
			{
				SD_command(18,adress);
				response=SPI_transfer(0xFF);
			}
			timeout1++;
		}while (((response) != 0x00)&&(timeout1<250)); //ok response
	
		do
		{
			response=SPI_transfer(0xFF); //data ready
			timeout2++;
		}while ((response != 0xFE)&&(timeout2<250));
	
		if((timeout1<250)&&(timeout2<250))
		{
			SD_remaining_blocks = blocks;
			SD_actual_byte=0;
			
			SD_is_reading=1;
			
			current_crc_16=0;
			
			break;
		}
		else
		{
			SD_init();
		}
	}
}
void SD_read_stop()
{
	while(1)
	{
		SD_command(12,0);
		
		unsigned char response;
		unsigned int timeout=0;
		
		do
		{
			response=SPI_transfer(0xFF);
			if ((response&0x88)==0x08) //crc error
			{
				SD_command(12,0);
				response=SPI_transfer(0xFF);
			}
			timeout++;
		}while ((response == 0x00)&&(timeout<1024)); //wait while busy (R1b response)
		
		if(timeout<1024)
		{
			break;
		}
		else
		{
			SD_init();
		}
	}
	
	// some extra clocks (maybe not needed)???
	
	CS_DISABLE();
	
	SD_is_reading=0;
}
unsigned char SD_read_next()
{
	if ((SD_remaining_blocks>0)||(SD_actual_byte>0)){
		if (SD_actual_byte==0)
		{
			while (1)
			{
				for (int i=0;i<512;i++)
				{
					unsigned char data = SPI_transfer(0xFF);
					current_crc_16 = crc16(current_crc_16,data);
					sector_data[i] = data;
				}
			
				current_crc_16 = crc16(current_crc_16, SPI_transfer(0xFF)); //crc16 check
				current_crc_16 = crc16(current_crc_16, SPI_transfer(0xFF)); //crc16 check
			
				if(current_crc_16!=0)
				{
					SD_read_start(SD_last_address+(SD_last_blocks-SD_remaining_blocks),SD_remaining_blocks);
				}
				else
				{
					break;
				}
			}
			
			SD_remaining_blocks--;
			
			if (SD_remaining_blocks>0)
			{
				unsigned char response;
				unsigned int timeout=0;
				do
				{
					response=SPI_transfer(0xFF); //data ready
					timeout++;
				}while (((response) != 0xFE)&&(timeout<512));
			}
			else
			{
				SD_read_stop();
			}
		}
		
		unsigned char ret = sector_data[SD_actual_byte];

		SD_actual_byte++;
		if(SD_actual_byte==512){SD_actual_byte=0;}
		
		return ret;
	}
	else
	{
		return 0;
	}
}

unsigned long SD_next_ul()
{
	unsigned long variable=0;
	variable|=((unsigned long)SD_read_next())<<0;
	variable|=((unsigned long)SD_read_next())<<8;
	variable|=((unsigned long)SD_read_next())<<16;
	variable|=((unsigned long)SD_read_next())<<24;
	return variable;
}
unsigned int SD_next_ui()
{
	unsigned int variable=0;
	variable|=((unsigned int)SD_read_next())<<0;
	variable|=((unsigned int)SD_read_next())<<8;
	return variable;
}

void SD_read_skip(int bytes_to_skip)
{
	for (;bytes_to_skip>0;bytes_to_skip--)
	{
		SD_read_next();
	}
}