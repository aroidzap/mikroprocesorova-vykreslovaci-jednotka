#include "text.h"

PROGMEM char const pozdrav[] =	"AHOJ FILIPE !\n"
								"JAK SE MAS?\n"
								"JA SE MAM VYBORNE :)\n"
								"\n"
								"JEDE MI TEXT NA VIC RADKU, TAKZE SE\n"
								"ZITRA MUZU VRHNOUT NA TU SD KARTU\n"
								"... VLASTNE UZ DNES :D\n"
								"\n"
								"TAK JESTE JEDNOU DIKY ZA PUJCENI ZOBRAZOVANI ;)\n"
								"S POZDRAVEM PROMAK :*\n";

unsigned char zobrazeni_textu(char *text,int fixed,int input_x,int input_y)
{
	if (((input_x)<text_width)&&((input_y)<text_height))
	{
		input_y/=2;
		input_x-=1;
		
		int n=0;
	
		int index=0;
		int posun=input_x;
	
		if((input_x<0)||(input_y<0))
		{
			return 0x00;
		}
		
		while (text[index]!=0)	// 0 - je braná jako ukonèovací znak v ASCII kódu na konci øetìzce
		{
			if ((input_y/row_height)!=n)
			{
				if(text[index]==0x0A) // if new line character
				{
					n+=1;
				}
				index++;
			}
			else
			{
				if(text[index]==0x0A) // if new line character
				{
					return 0x00;	
				}
				
				int pozice=(((int)text[index])-32);		//prevod z pismena na pozici ve fontu
		
				if ((pozice>=pocet_pismen)||(pozice<0)) //pokud je pozice mimo rozsah fontu, zobraz vykricnik
				{
					pozice=1; // 1 == vykricnik
				}
		
				int adresa=sirka_pismene*pozice;		//prevod z pismena na adresu ve fontu
			
				int length = pgm_read_byte(&length_font[pozice]);
		
				int e=0;
				if (fixed==1)
				{
					if (text[index]=='1')
					{
						e=e-2;
					}
					if (text[index]==' ')
					{
						e=e-4;
					}
				}
				for (;e<(length+1);e=e+1)
				{
					if (posun>0)
					{
						posun=posun-1;
					}
					else
					{
						if (input_x<text_width)
						{
							if (e<(length))
							{
								if(e<0)
								{
									return 0x00; //udelat mezeru (pokud se vleze)
								}
								else
								{
									if (input_y%row_height<row_height-7)
									{
										return 0x00;
									}
									if(((pgm_read_byte(&data_font[adresa+e])>>(row_height-1-(input_y%row_height)))&1)==0)
									{
										return 0xFF;
									}
									else
									{	
										return 0x00;
									}
								}
							}
							else
							{
								return 0x00; //udelat mezeru (pokud se vleze)
							}
						}
					}
				}

				index++;
			}
		}
	}
	return 0x00;
}

unsigned char zobrazeni_pgm_textu(const char *text,int fixed,int input_x,int input_y)
{
	if ((input_x)<text_width)
	{
		input_y/=2;
		input_x-=1;
		
		int n=0;
		
		int index=0;
		int posun=input_x;
		
		if((input_x<0)||(input_y<0))
		{
			return 0x00;
		}
		
		while (pgm_read_byte(&text[index])!=0)	// 0 - je braná jako ukonèovací znak v ASCII kódu na konci øetìzce
		{
			if ((input_y/row_height)!=n)
			{
				if(pgm_read_byte(&text[index])==0x0A) // if new line character
				{
					n+=1;
				}
				index++;
			}
			else
			{
				if(pgm_read_byte(&text[index])==0x0A) // if new line character
				{
					return 0x00;
				}
				
				int pozice=(((int)pgm_read_byte(&text[index]))-32);		//prevod z pismena na pozici ve fontu
				
				if ((pozice>=pocet_pismen)||(pozice<0)) //pokud je pozice mimo rozsah fontu, zobraz vykricnik
				{
					pozice=1; // 1 == vykricnik
				}
				
				int adresa=sirka_pismene*pozice;		//prevod z pismena na adresu ve fontu
				
				int length = pgm_read_byte(&length_font[pozice]);
				
				int e=0;
				if (fixed==1)
				{
					if (pgm_read_byte(&text[index])=='1')
					{
						e=e-2;
					}
					if (pgm_read_byte(&text[index])==' ')
					{
						e=e-4;
					}
				}
				for (;e<(length+1);e=e+1)
				{
					if (posun>0)
					{
						posun=posun-1;
					}
					else
					{
						if (input_x<text_width)
						{
							if (e<(length))
							{
								if(e<0)
								{
									return 0x00; //udelat mezeru (pokud se vleze)
								}
								else
								{
									if (input_y%row_height<row_height-7)
									{
										return 0x00;
									}
									if(((pgm_read_byte(&data_font[adresa+e])>>(row_height-1-(input_y%row_height)))&1)==0)
									{
										return 0xFF;
									}
									else
									{
										return 0x00;
									}
								}
							}
							else
							{
								return 0x00; //udelat mezeru (pokud se vleze)
							}
						}
					}
				}

				index++;
			}
		}
	}
	return 0x00;
}

void dec_to_bin(char *buffer,unsigned char bin)
{
	for (int i=0;i<8;i++)
	{
		buffer[i]='0';
	}
	buffer[8]=0;
	if((bin&0b00000001)!=0)
	{
		buffer[7]='1';
	}
	if((bin&0b00000010)!=0)
	{
		buffer[6]='1';
	}
	if((bin&0b00000100)!=0)
	{
		buffer[5]='1';
	}
	if((bin&0b00001000)!=0)
	{
		buffer[4]='1';
	}
	if((bin&0b00010000)!=0)
	{
		buffer[3]='1';
	}
	if((bin&0b00100000)!=0)
	{
		buffer[2]='1';
	}
	if((bin&0b01000000)!=0)
	{
		buffer[1]='1';
	}
	if((bin&0b10000000)!=0)
	{
		buffer[0]='1';
	}
}

int strl(char *buffer)
{
	int l=0;
	while(buffer[l]!=0)
	{
		l++;
	}
	return l;
}
