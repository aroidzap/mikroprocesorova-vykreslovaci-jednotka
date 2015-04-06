#ifndef SETTINGS_H_
#define SETTINGS_H_

#include <avr/io.h>

//------------------Software------------------

#define width 250				//default 250
#define height 480				//default 480

#define real_width_ratio 0.75	//default 0.75
#define real_height_ratio 1		//default 1

//------------------Hardware------------------

#define F_CPU 16000000

#define CTRL_DDR DDRC
#define CTRL_PORT PORTC

#define WE 0
#define CLK_Y 1
#define ADR_Y 2
#define RES_X 3
#define CLK_X 4
#define ADR_X 5

#define DATA_DDR DDRA
#define DATA_PORT PORTA
#define DATA_PIN PINA

#define MODE_DDR DDRD
#define MODE_PORT PORTD
#define MODE_PIN PIND

#define MODE 2

#define UART_DDR DDRD
#define UART_PORT PORTD
#define UART_PIN PIND

#define RXD 0
#define TXD 1

#define SPI_DDR DDRB
#define SPI_PORT PORTB
#define SPI_PIN PINB

#define MISO 6
#define MOSI 5
#define SCK 7
#define CS 4

#define TOUCH_DDR DDRD
#define TOUCH_PORT PORTD
#define TOUCH_PIN PIND

#define TOUCH_SUPPLY 5
#define TOUCH_INPUT 6

//------------------Functions-----------------

#define RGB 1
#define BW 0

void set_color_mode(unsigned char color_mode);
unsigned char get_color_mode();
unsigned char informative_color();

//--------------------------------------------
#endif /* SETTINGS_H_ */