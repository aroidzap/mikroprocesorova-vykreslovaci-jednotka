#include <avr/io.h>

#include "settings.h"
#include "RAM.h"
#include "UART.h"
#include "commands.h"
#include "SPI.h"
#include "SD.h"
#include "FAT.h"
#include "drawing.h"
#include "BMP.h"
#include "color_process.h"

#include "cmd_parser.h"

#include "draw_test.h"
#include "touch_button.h"

#include "text.h"

void InitializeDevice()
{
	RAM_init();

	UART_init();
	driver_init();

	driver_command(VIDEO_DISABLE);

	SD_set_speed(1); //250kbps (max possible)
	SD_init();

	FAT_init();

	clear_color(0,1);
	set_color_mode(RGB);
	driver_command(VIDEO_ENABLE);
}

int main(void)
{	
	InitializeDevice();
	
	
	load_commands("main.txt");
	
	return 0;
}