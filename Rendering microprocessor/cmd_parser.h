#ifndef CMD_PARSER_H_
#define CMD_PARSER_H_

#include "FAT.h"
#include "BMP.h"
#include "drawing.h"

#include "draw_test.h"

extern unsigned long file_last_EOF;
extern unsigned long repeat_position;

void process_command(char *cmd, char *arg);
void load_commands(char *file_path);

unsigned char cmd_compare(char* cmd, char* text);
int get_argument_i(char *arg, unsigned char arg_number);
void get_argument_str(char *arg); //returns string back in "arg"
void get_argument_enum(char *arg); //returns upper case enum back in "arg"

#endif /* CMD_PARSER_H_ */