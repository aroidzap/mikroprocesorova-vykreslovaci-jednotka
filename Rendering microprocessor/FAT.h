#ifndef FAT_H_
#define FAT_H_

#include "SD.h"

extern unsigned int fat_sector_offset;
extern unsigned long first_cluster_offset;

extern unsigned char sectors_per_cluster;
extern unsigned long root_cluster;

extern unsigned long directory_cluster;

extern unsigned long current_cluster;
extern unsigned char _EOC; //end of cluster chain
extern unsigned long _EOF; //end of file (end if _EOF == 0)

extern unsigned int next_file_id;
extern unsigned int next_file_last_dir_cluster;

void FAT_init();

unsigned long cluster_to_lba(unsigned long cluster);
int FAT_get_new_cluster();

void FAT_read_start(unsigned long cluster);
unsigned char FAT_read_next();
unsigned long FAT_next_ul();
unsigned int FAT_next_ui();
void FAT_read_skip(int bytes_to_skip);

unsigned long FAT_find_entry_cluster(char *name ,unsigned char is_directory); // case-sensitive

void FAT_open_directory(char *directory_path, unsigned char name_is_file_path);

unsigned long FAT_find_file_cluster(char *file_path); // case-sensitive
unsigned long FAT_file_by_extension_cluster(char* directory_name ,char *extension); // no case-sensitivity for extension

#endif /* FAT_H_ */