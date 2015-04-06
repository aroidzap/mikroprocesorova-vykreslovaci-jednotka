/*
*	Copyright (c) 2015 Tomáš Pazdiora
*	See the file "LICENSE.txt" for the full license governing this code.
*/

#include "RAM.h"

void RAM_init()
{
	// RAM init
	CTRL_DDR|=_BV(WE)|_BV(CLK_X)|_BV(ADR_X)|_BV(RES_X)|_BV(CLK_Y)|_BV(ADR_Y);
	CTRL_PORT|=_BV(WE)|_BV(RES_X);
	
	DATA_DDR=0xFF;
	
	// DAC init
	MODE_DDR|=_BV(MODE);
}

unsigned char const PROGMEM translate_x_data[33]= {
	0,127,191,62,190,61,189,60,188,59,179,
	171,163,155,147,139,131,107,99,83,75,
	67,50,178,49,48,176,42,138,74,9,8,128
};
unsigned char _x_increment_addr=0;

unsigned char translate_x(unsigned char x)
{
	unsigned char index=x/8;
	unsigned char mod=(x%8)+1;
	unsigned char a=pgm_read_byte(&translate_x_data[index])<<(mod);
	unsigned char b=pgm_read_byte(&translate_x_data[index+1])>>(8-mod);
	unsigned char result=a|b;
	return result;
}

void set_Y(uint16_t _value)
{
	//	%0 CTRL_PORT
	//	%1 CLK_Y
	//	%2 ADR_Y
	//	%A3 _value (low)
	//	%B3 _value (high)
	
	asm volatile(
	"IN r17,__SREG__		\n"
	
	"IN r16, %0				\n"
	
	"BST %B3, 0				\n"
	"BLD r16, %2			\n"
	"ANDI r16, ~(1<<%1)		\n"
	"OUT %0, r16			\n"
	"ORI r16, (1<<%1)		\n"
	"OUT %0, r16			\n"
	
	"BST %A3, 7				\n"
	"BLD r16, %2			\n"
	"ANDI r16, ~(1<<%1)		\n"
	"OUT %0, r16			\n"
	"ORI r16, (1<<%1)		\n"
	"OUT %0, r16			\n"
	
	"BST %A3, 6				\n"
	"BLD r16, %2			\n"
	"ANDI r16, ~(1<<%1)		\n"
	"OUT %0, r16			\n"
	"ORI r16, (1<<%1)		\n"
	"OUT %0, r16			\n"
	
	"BST %A3, 5				\n"
	"BLD r16, %2			\n"
	"ANDI r16, ~(1<<%1)		\n"
	"OUT %0, r16			\n"
	"ORI r16, (1<<%1)		\n"
	"OUT %0, r16			\n"
	
	"BST %A3, 4				\n"
	"BLD r16, %2			\n"
	"ANDI r16, ~(1<<%1)		\n"
	"OUT %0, r16			\n"
	"ORI r16, (1<<%1)		\n"
	"OUT %0, r16			\n"
	
	"BST %A3, 3				\n"
	"BLD r16, %2			\n"
	"ANDI r16, ~(1<<%1)		\n"
	"OUT %0, r16			\n"
	"ORI r16, (1<<%1)		\n"
	"OUT %0, r16			\n"
	
	"BST %A3, 2				\n"
	"BLD r16, %2			\n"
	"ANDI r16, ~(1<<%1)		\n"
	"OUT %0, r16			\n"
	"ORI r16, (1<<%1)		\n"
	"OUT %0, r16			\n"
	
	"BST %A3, 1				\n"
	"BLD r16, %2			\n"
	"ANDI r16, ~(1<<%1)		\n"
	"OUT %0, r16			\n"
	"ORI r16, (1<<%1)		\n"
	"OUT %0, r16			\n"
	
	"BST %A3, 0				\n"
	"BLD r16, %2			\n"
	"OUT %0, r16			\n"
	
	"OUT __SREG__,r17		\n"
	
	::"I" (_SFR_IO_ADDR(CTRL_PORT)),"I"(CLK_Y),"I"(ADR_Y),"r"(_value)
	:"r16","r17");
}

void set_X(unsigned char _value)
{
	//	%0 CTRL_PORT
	//	%1 CLK_X
	//	%2 ADR_X
	//	%3 _value
	
	asm volatile(
	"IN r17,__SREG__		\n"
	
	"IN r16, %0				\n"
	
	"BST %3, 7				\n"
	"BLD r16, %2			\n"
	"ANDI r16, ~(1<<%1)		\n"
	"OUT %0, r16			\n"
	"ORI r16, (1<<%1)		\n"
	"OUT %0, r16			\n"
	
	"BST %3, 6				\n"
	"BLD r16, %2			\n"
	"ANDI r16, ~(1<<%1)		\n"
	"OUT %0, r16			\n"
	"ORI r16, (1<<%1)		\n"
	"OUT %0, r16			\n"
	
	"BST %3, 5				\n"
	"BLD r16, %2			\n"
	"ANDI r16, ~(1<<%1)		\n"
	"OUT %0, r16			\n"
	"ORI r16, (1<<%1)		\n"
	"OUT %0, r16			\n"
	
	"BST %3, 4				\n"
	"BLD r16, %2			\n"
	"ANDI r16, ~(1<<%1)		\n"
	"OUT %0, r16			\n"
	"ORI r16, (1<<%1)		\n"
	"OUT %0, r16			\n"
	
	"BST %3, 3				\n"
	"BLD r16, %2			\n"
	"ANDI r16, ~(1<<%1)		\n"
	"OUT %0, r16			\n"
	"ORI r16, (1<<%1)		\n"
	"OUT %0, r16			\n"
	
	"BST %3, 2				\n"
	"BLD r16, %2			\n"
	"ANDI r16, ~(1<<%1)		\n"
	"OUT %0, r16			\n"
	"ORI r16, (1<<%1)		\n"
	"OUT %0, r16			\n"
	
	"BST %3, 1				\n"
	"BLD r16, %2			\n"
	"ANDI r16, ~(1<<%1)		\n"
	"OUT %0, r16			\n"
	"ORI r16, (1<<%1)		\n"
	"OUT %0, r16			\n"
	
	"BST %3, 0				\n"
	"BLD r16, %2			\n"
	"ANDI r16, ~(1<<%1)		\n"
	"OUT %0, r16			\n"
	"ORI r16, (1<<%1)		\n"
	"OUT %0, r16			\n"
	
	"OUT __SREG__,r17		\n"
	
	::"I" (_SFR_IO_ADDR(CTRL_PORT)),"I"(CLK_X),"I"(ADR_X),"r"(translate_x(_value))
	:"r16","r17");
	_x_increment_addr = _value + 1;
}
void reset_X()
{
	//	%0 CTRL_PORT
	//	%1 RES_X

	asm volatile(
	"IN r17,__SREG__		\n"
	
	"IN r16, %0				\n"
	
	"ANDI r16, ~(1<<%1)		\n"
	"OUT %0, r16			\n"
	"ORI r16, (1<<%1)		\n"
	"OUT %0, r16			\n"
	
	"OUT __SREG__,r17		\n"
	
	::"I" (_SFR_IO_ADDR(CTRL_PORT)),"I"(RES_X)
	:"r16","r17");
	_x_increment_addr = 0;
}
void inc_X()
{
	//	%0 CTRL_PORT
	//	%1 CLK_X
	//	%2 ADR_X
	//	%3 actual increment
	
	asm volatile(
	"IN r17,__SREG__		\n"
	
	"LPM r16, Z				\n"
	
	"LDI r31, hi8(pm(jump_table)) 	\n"
	"LDI r30, lo8(pm(jump_table)) 	\n"
	
	"ADD r30, %3			\n"
	"ADD r30, %3			\n"
	"ADC r31,__zero_reg__	\n"
	
	"IJMP					\n"
	
	"jump_table:			\n"
	"BST r16, 7				\n"
	"RJMP jump_out			\n"
	"BST r16, 6				\n"
	"RJMP jump_out			\n"
	"BST r16, 5				\n"
	"RJMP jump_out			\n"
	"BST r16, 4				\n"
	"RJMP jump_out			\n"
	"BST r16, 3				\n"
	"RJMP jump_out			\n"
	"BST r16, 2				\n"
	"RJMP jump_out			\n"
	"BST r16, 1				\n"
	"RJMP jump_out			\n"
	"BST r16, 0				\n"
	
	"jump_out:				\n"
	"IN r16, %0				\n"
	"BLD r16, %2			\n"
	"ANDI r16, ~(1<<%1)		\n"
	"OUT %0, r16			\n"
	"ORI r16, (1<<%1)		\n"
	"OUT %0, r16			\n"
	
	"OUT __SREG__,r17		\n"
	
	::"I" (_SFR_IO_ADDR(CTRL_PORT)),"I"(CLK_X),"I"(ADR_X),"r"(_x_increment_addr&0x07),"z"(&translate_x_data[(_x_increment_addr>>3)+1])
	:"r16","r17");
	_x_increment_addr++;
}

unsigned char RAM_read()
{
	DATA_DDR=0x00;
	DATA_PORT=0x00;
	for (unsigned char i=0;i<100;i++)
	{
		asm volatile("nop"); //delay
	}
	unsigned char result = DATA_PIN;
	DATA_DDR=0xFF;
	return result;
}

void RAM_write(unsigned char data)
{
	DATA_PORT=data;
	
	CTRL_PORT&=~_BV(WE);
	CTRL_PORT|=_BV(WE);
}