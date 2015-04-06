#ifndef SD_H_
#define SD_H_

#include <avr/io.h>
#include "settings.h"
#include "SPI.h"

#define CS_ENABLE() (SPI_PORT &= ~_BV(CS))
#define CS_DISABLE() (SPI_PORT |= _BV(CS))

extern unsigned char SD_speed;

extern unsigned int SD_actual_byte;
extern unsigned long SD_remaining_blocks;
extern unsigned char SD_HighCapacity;

extern unsigned char SD_is_reading;

extern unsigned long SD_last_address;
extern unsigned long SD_last_blocks;

extern unsigned int current_crc_16;

extern unsigned char sector_data[512];

void SD_set_speed(unsigned char speed);

int SD_init_basic();
int SD_init();

unsigned int crc16(unsigned int  old_crc, unsigned char data);
unsigned char crc7(unsigned char *message);

void SD_command(unsigned char cmd, unsigned long arg);
unsigned char SD_command_R1(unsigned char cmd, unsigned long arg, unsigned char expected_response);

void SD_read_start(unsigned long adress,unsigned long blocks);
void SD_read_stop();
unsigned char SD_read_next();
unsigned long SD_next_ul();
unsigned int SD_next_ui();
void SD_read_skip(int bytes_to_skip);


#endif /* SD_H_ */