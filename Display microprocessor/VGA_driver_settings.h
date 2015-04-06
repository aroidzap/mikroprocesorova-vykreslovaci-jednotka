/*
*	Copyright (c) 2015 Tomáš Pazdiora
*	See the file "LICENSE.txt" for the full license governing this code.
*/

#define VGADDR DDRD
#define VGAPORT PORTD
#define VGAPIN PIND

#define RXD 0 //swap_request
#define TXD 1

#define VIDEO_ENABLE 3
#define HSYNC 4
#define VSYNC 5

#define COPY_DIR 6

#define VGADDR2 DDRB
#define VGAPORT2 PORTB
#define VGAPIN2 PINB

#define ADR_Y	0
#define CLK_Y	1
#define RES_X	2
#define ADR_X	3
#define CLK_X	4

#define COPY_WRITE_ENABLE 5

#define COPY_HIGH	6

#define SWAP_OUT	7

