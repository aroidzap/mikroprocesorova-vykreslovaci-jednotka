#ifndef COMMANDS_H_
#define COMMANDS_H_

//---------------- Requests ----------------

#define COPY_REQUEST_CMD(n)		(0b00000000|(n%120)) //copy "n"th 4 lines (n = 0-119)
#define VIDEO_DISABLE			0b01111000
#define VIDEO_ENABLE			0b01111001
#define SWAP_STATE_CMD(state)	(0b01111010|(state&1)) //set swap state (state = 0,1)

#define copy_to_video			1
#define copy_to_data			0
#define COPY_DIR_CMD(dir)		(0b01111100|(dir&1)) //set copy dir (dir==1 -> copy to video; dir==0 -> copy to data;)

#define SWAP_REQUEST_CMD		0b01111110
#define DRIVER_READY_REQ_CMD	0b01111111

//---------------- Responses ----------------

#define DRIVER_DONE_CMD			0b11000000
#define DRIVER_READY_RESP_CMD	0b11000001
#define DRIVER_TRANSMIT_ERROR	0b11000010
#define DRIVER_ILLEGAL_CMD		0b11111111


#endif /* COMMANDS_H_ */