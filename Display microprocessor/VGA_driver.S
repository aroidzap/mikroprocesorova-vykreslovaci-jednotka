; 
;	Copyright (c) 2015 Tomáš Pazdiora
;	See the file "LICENSE.txt" for the full license governing this code.
;

; do not use : GPIOR0,GPIOR1,r20,r21,r22,r23
; r2 - command ; r3 - copy step
; do not use : interrupts

.include "VGA_driver_settings.h"


.equ line_count_h = GPIOR1 ;MSB -> 0 = jump to Horizontal_SyncPulse; 1 = jump to Horizontal_BackPorch
.equ line_count_l = GPIOR0

.equ	sync_port = VGAPORT
.equ	sync_ddr = VGADDR
.equ	sync_pin = VGAPIN

.equ	rxd_bit = RXD
.equ	txd_bit = TXD

.equ	video_enable_low_bit = VIDEO_ENABLE
.equ	horizontal_sync_bit = HSYNC
.equ	vertical_sync_bit = VSYNC

.equ	copy_dir_bit = COPY_DIR

.equ	sync_port2 = VGAPORT2
.equ	sync_ddr2 = VGADDR2
.equ	sync_pin2 = VGAPIN2

.equ	clk_x_bit = CLK_X
.equ	adr_x_bit = ADR_X
.equ	res_x_bit = RES_X
.equ	clk_y_bit = CLK_Y
.equ	adr_y_bit = ADR_Y

.equ	copy_we_bit = COPY_WRITE_ENABLE
.equ	copy_high_bit = COPY_HIGH

.equ	swap_out_bit = SWAP_OUT


.org 0x0000
	RJMP main
.org 0x0005
	RJMP TIMER1_OVF_vect

UART_init:
	; Set baud rate 4,8kbit/s @ 20MHz (double speed)
	LDI r19,0x02
	OUT UBRRH, r19
	LDI r19,0x08
	OUT UBRRL, r19

	; Double speed
	LDI r19, (1<<U2X)
	OUT UCSRA,r19

	; Enable receiver and transmitter
	LDI r19, (1<<RXEN)|(1<<TXEN)
	OUT UCSRB,r19

	; Set frame format: 8data, 1stop bit, odd parity
	LDI r19, (1<<UCSZ1)|(1<<UCSZ0)|(1<<UPM1)|(1<<UPM0)
	OUT UCSRC,r19

	RET

VGA_driver_init:
	CLI								;1 ;Called VGA_driver_init act as interrupt

	PUSH r18
	PUSH r19
	PUSH ZH
	PUSH ZL
	IN	r18,SREG
	
	IN	r19,sync_ddr
	ORI	r19,(1<<horizontal_sync_bit)|(1<<vertical_sync_bit)|(1<<txd_bit)|(1<<copy_dir_bit)|(1<<video_enable_low_bit)
	ANDI r19, ~(1<<rxd_bit)
	OUT sync_ddr,r19

	IN	r19,sync_port
	ORI	r19,(1<<horizontal_sync_bit)|(1<<vertical_sync_bit)|(1<<video_enable_low_bit)|(1<<copy_dir_bit)|(1<<rxd_bit) ;RX pull-up
	OUT sync_port,r19

	IN	r19,sync_ddr2
	ORI	r19,(1<<swap_out_bit)|(1<<clk_x_bit)|(1<<adr_x_bit)|(1<<res_x_bit)|(1<<clk_y_bit)|(1<<adr_y_bit)|(1<<copy_we_bit)|(1<<copy_high_bit)
	OUT sync_ddr2,r19

	IN	r19,sync_port2
	ORI	r19,(1<<copy_we_bit)
	OUT sync_port2,r19

	IN	r19,TIMSK
	ORI	r19,(1<<TOIE1)
	OUT TIMSK,r19

	IN	r19,TCCR1B
	ORI	r19,(1<<CS10)
	OUT TCCR1B,r19

	RCALL UART_init

	; clear "copy step"
	CLR r3

	RJMP Horizontal_VisibleArea	


TIMER1_OVF_vect:
	;jump from code to interrupt address - 4 cycles

	;jump from interrupt address to RENDER_exit - 5 cycles
	;jump from interrupt address to Horizontal_SyncPulse - 26 cycles
	;jump from interrupt address to Horizontal_BackPorch - 27 cycles

	SBIS sync_port,video_enable_low_bit	;1/2 (2 if skip) ;skip if video_enable_low_bit == 1 (0 = enabled, 1 = disabled)
	RJMP RENDER_exit				;2 ;Stop image rendering

	PUSH r18						;2
	PUSH r19						;2
	PUSH ZH							;2
	PUSH ZL							;2
	IN	r18,SREG					;1

;****Interrupt wasted cycles compensation****; - 12 cycles
	IN r19,TCNT1L					;1
	LDI ZH,high(PC+7)				;1 (PC+7) - address of first NOP
	LDI	ZL,low(PC+6)				;1 (PC+6) - address of first NOP (same as above, but PC has increased by 1)
	SUBI r19,17						;1 number of cycles since interrupt to first instruction in compensation "IN r19,TCNT1L" (including 4 cycle jump from code to interrupt address)
	ADD ZL,r19						;1
	CLR r19							;1
	ADC ZH,r19						;1
	IJMP							;2
	NOP	;1 Clock					;1
	NOP ;2 Clock					;1
	NOP ;3 Clock					;1
		;4 Clock
;********************************************;

	SBIS line_count_h,7				;1/2 (2 if skip)	;line_count_h MSB affects jumping
	RJMP Horizontal_SyncPulse		;2					;line_count_h MSB == 0
	RJMP Horizontal_BackPorch		;2					;line_count_h MSB == 1
	
Horizontal_VisibleArea: ;14 to RENDER_video ; 6 to no_active_video
	;test line number to know if rendering will occur
	IN r19,line_count_l				;1
	SUBI r19,0xE0					;1
	IN r19,line_count_h				;1
	SBCI r19,0x01					;1 ;line_count-480

	BRSH no_active_video			;1/2 (2 if branch) ;branch if line_count>=480
	;*******************************************************

	LDI r19,0xFE					;1
	OUT TCNT1H,r19					;1
	LDI r19,0x09					;1 
	OUT TCNT1L,r19					;1 ;set timer for next interrupt
	SEI								;1 ;allow interrupt inside interrupt

	RJMP ENABLE_video				;2 ;jump to ENABLE_video

;-----------------------------no_active_video------------------------------------
no_active_video:
	TST r3							;1 check if copy not in progress
	BREQ get_cmd					;1/2 ;get_cmd takes various times

	LDI  R19, 0x04					;1
	DEC  R19						;1
    BRNE PC-1						;1/2 ;(12 cycle delay)
copy: ;copy takes always same time
	LDI r19,0x00					;1
	OUT TCNT1H,r19					;1
	LDI r19,0x00					;1 
	OUT TCNT1L,r19					;1 ;increase timer to avoid hit

	SBI sync_port2,copy_high_bit	;2 ;enable copy

	RJMP copy_set_y					;2

copy_set_return:
	;62 from tst, 5 to part0, 6 to part1, 6 to part2, 7 to part3

	SBRC r3,1						;1/2;choose part
	RJMP PC+4						;2
	SBRS r3,0						;1/2
	RJMP part0						;2
	RJMP part1						;2
	SBRS r3,0						;1/2
	RJMP part2						;2
	RJMP part3						;2
part_return:
	CBI sync_port2,copy_high_bit	;2 ;disable copy

	INC r3							;1
	SBRS r3,4						;1/2 ;if step>15 => reset and done
	RJMP PC+3						;2 ;else delay + continue
	CLR r3							;1
	RJMP copy_done					;2
	LPM r19,Z						;3 (3 cycle delay)
	RJMP continue					;2 continue
copy_done:
	;takes 3 cycles in both cases
	LDI r19,0b11000000				;1 ;transmit "driver done"
	SBIC UCSRA,UDRE					;1/2 ;transmit only if buffer is empty
	OUT UDR,r19						;1
continue:
	LDI  R19, 0x04					;1
	DEC  R19						;1
    BRNE PC-1						;1/2 (15 cycle delay)
	NOP

	RJMP Horizontal_SyncPulse		;2

get_cmd:
	;MSB of line_count_h is clear to jump to Horizontal_SyncPulse
	LDI r19,0xFE					;1
	OUT TCNT1H,r19					;1
	LDI r19,0x16					;1 
	OUT TCNT1L,r19					;1 ;set timer for next interrupt

	SBIS UCSRA,UDRE					;1/2 ;skip all if transmitting
	RJMP no_cmd						;2
	;load command
	SBIS UCSRA,RXC					;1/2 ;load if receive is complete
	RJMP no_cmd						;2
	SBIC UCSRA,UPE					;1/2 ;parity error
	RJMP driver_transmit_error		;2
	SBIC UCSRA,FE					;1/2 ;framing error
	RJMP driver_transmit_error		;2
	SBIC UCSRA,DOR					;1/2 ;data overrun
	RJMP driver_transmit_error		;2

	IN r2,UDR						;1

	MOV r19,r2						;1

	SUBI r19,0b01111000				;1 ; 0b01111000
	BRLO copy						;1/2 ;copy command -> jump to copy (0b00000000-0b01110111)

	;next instructions are cycles independent (in range up to interrupt)
	BRNE PC+3						;1/2		
	CBI sync_ddr,video_enable_low_bit;2 ;video disable
	RJMP get_cmd_done				;2

	SUBI r19,1						;1 ; 0b01111001
	BRNE PC+3						;1/2
	SBI sync_ddr,video_enable_low_bit;2 ;video enable
	RJMP get_cmd_done				;2

	SUBI r19,1						;1 ; 0b01111010
	BRNE PC+3						;1/2
	CBI sync_port2,swap_out_bit		;2 ; swap state = 0
	RJMP get_cmd_done				;2
	SUBI r19,1						;1 ; 0b01111011
	BRNE PC+3						;1/2
	SBI sync_port2,swap_out_bit		;2 ; swap state = 1
	RJMP get_cmd_done				;2

	SUBI r19,1						;1 ; 0b01111100
	BRNE PC+3						;1/2
	CBI sync_port,copy_dir_bit		;2 ;copy dir = 0
	RJMP get_cmd_done				;2
	SUBI r19,1						;1 ; 0b01111101
	BRNE PC+3						;1/2
	SBI sync_port,copy_dir_bit		;2 ;copy dir = 1
	RJMP get_cmd_done				;2

	SUBI r19,1						;1 ; 0b01111110
	BRNE PC+3						;1/2
	SBI sync_pin2,swap_out_bit		;2 ; (writing pin to 1 toggles the value of port) RAM SWAPPING on request
	RJMP get_cmd_done				;2

	SUBI r19,1						;1 ; 0b01111111
	BRNE driver_illegal_cmd			;1/2 ;illegal command
	RJMP driver_ready				;2
	;driver is ready :)


driver_ready:
	LDI r19,0b11000001				;1 ;transmit "driver ready response"
	RJMP PC+6						;2
driver_transmit_error:
	LDI r19,0b11000010				;1 ;transmit "driver parity error"
	RJMP PC+4						;2
driver_illegal_cmd:
	LDI r19,0b11111111				;1 ;transmit "driver illegal cmd"
	RJMP PC+2						;2
get_cmd_done:
	;takes 3 cycles in both cases
	LDI r19,0b11000000				;1 ;transmit "driver done"
	SBIC UCSRA,UDRE					;1/2 ;transmit only if buffer is empty
	OUT UDR,r19						;1

no_cmd:
	OUT	SREG,r18					;1
	POP	ZL							;2
	POP ZH							;2
	POP	r19							;2
	POP r18							;2

	RETI							;4
;--------------------------------------------------------------------------------


RENDER_exit:
;****Interrupt wasted cycles compensation****; - 12 cycles
	IN r19,TCNT1L					;1
	LDI ZH,high(PC+7)				;1 (PC+7) - address of first NOP
	LDI	ZL,low(PC+6)				;1 (PC+6) - address of first NOP (same as above, but PC has increased by 1)
	SUBI r19,9						;1 number of cycles since interrupt to first instruction in compensation "IN r19,TCNT1L" (including 4 cycle jump from code to interrupt address)
	ADD ZL,r19						;1
	CLR r19							;1
	ADC ZH,r19						;1
	IJMP							;2
	NOP	;1 Clock					;1
	NOP ;2 Clock					;1
	NOP ;3 Clock					;1
		;4 Clock
;********************************************;

	SBI sync_port,video_enable_low_bit	;2 ;disable video_enable_low_bit

	CBI	sync_port,horizontal_sync_bit;2 ;horizontal sync low (active)

	CBI sync_port2, res_x_bit		;2 ;reset x address
	SBI sync_port2, res_x_bit		;2

	;------- Y address increment--------

	PUSH r17						;2

	IN r17, sync_port2				;1
	IN r19,line_count_h				;1

	BST r19,0						;1
	BLD r17,adr_y_bit				;1

	ANDI r17,~(1<<clk_y_bit)		;1
	OUT sync_port2,r17				;1
	ORI r17,(1<<clk_y_bit)			;1
	OUT sync_port2,r17				;1

	IN r19,line_count_l				;1
	BST r19,7						;1
	BLD r17,adr_y_bit				;1
	
	ANDI r17,~(1<<clk_y_bit)		;1
	OUT sync_port2,r17				;1
	ORI r17,(1<<clk_y_bit)			;1
	OUT sync_port2,r17				;1

	BST r19,6						;1
	BLD r17,adr_y_bit				;1
	
	ANDI r17,~(1<<clk_y_bit)		;1
	OUT sync_port2,r17				;1
	ORI r17,(1<<clk_y_bit)			;1
	OUT sync_port2,r17				;1

	BST r19,5						;1
	BLD r17,adr_y_bit				;1
	
	ANDI r17,~(1<<clk_y_bit)		;1
	OUT sync_port2,r17				;1
	ORI r17,(1<<clk_y_bit)			;1
	OUT sync_port2,r17				;1

	BST r19,4						;1
	BLD r17,adr_y_bit				;1
	
	ANDI r17,~(1<<clk_y_bit)		;1
	OUT sync_port2,r17				;1
	ORI r17,(1<<clk_y_bit)			;1
	OUT sync_port2,r17				;1

	BST r19,3						;1
	BLD r17,adr_y_bit				;1
	
	ANDI r17,~(1<<clk_y_bit)		;1
	OUT sync_port2,r17				;1
	ORI r17,(1<<clk_y_bit)			;1
	OUT sync_port2,r17				;1

	BST r19,2						;1
	BLD r17,adr_y_bit				;1
	
	ANDI r17,~(1<<clk_y_bit)		;1
	OUT sync_port2,r17				;1
	ORI r17,(1<<clk_y_bit)			;1
	OUT sync_port2,r17				;1

	BST r19,1						;1
	BLD r17,adr_y_bit				;1
	
	ANDI r17,~(1<<clk_y_bit)		;1
	OUT sync_port2,r17				;1
	ORI r17,(1<<clk_y_bit)			;1
	OUT sync_port2,r17				;1

	BST r19,0						;1
	BLD r17,adr_y_bit				;1

	OUT sync_port2,r17				;1

	POP r17							;2


	LPM r19,Z						;3
	NOP								;1 - 4 cycle delay
	;---------- 62 cycle block ---------- 

	POP r19							;2 ;stack pointer +=2 to delete interrupt inside interrupt (!still in interrupt => IE is, and must be 0!)
	POP r19							;2 ;(address in stack is 16bit, POP is 8bit)

	RJMP Horizontal_BackPorch		;2 ;line_count_h MSB == 1

Horizontal_FrontPorch:
	
Horizontal_SyncPulse: ;!!! WARNING !!! line_count_h+=0x80 between Horizontal_SyncPulse and Horizontal_BackPorch !!! WARNING !!!
	CBI	sync_port,horizontal_sync_bit;2 ;horizontal sync low (active)

	LDI r19,0xFF					;1
	OUT TCNT1H,r19					;1
	LDI r19,0xDD					;1
	OUT TCNT1L,r19					;1 ;set timer for next interrupt

	SBI line_count_h,7				;2 ;set MSB of line_count_h to jump to Horizontal_BackPorch

	OUT	SREG,r18					;1
	POP	ZL							;2
	POP ZH							;2
	POP	r19							;2
	POP r18							;2

	RETI							;4

Horizontal_BackPorch: ;!!! WARNING !!! line_count_h+=0x80 between Horizontal_SyncPulse and Horizontal_BackPorch !!! WARNING !!!
	CBI line_count_h,7				;2 ;clear MSB of line_count_h to jump to Horizontal_SyncPulse

	;24 cycles available from here for jump to Horizontal_VisibleArea

	SBI	sync_port,horizontal_sync_bit;2 ;horizontal sync high (not active)

	IN r19,line_count_l				;1
	SUBI r19,0xFF					;1
	OUT line_count_l,r19			;1
	IN r19,line_count_h				;1
	SBCI r19,0xFF					;1
	OUT line_count_h,r19			;1 ;line_count+=1

	;16 cycles available from here for jump to Horizontal_VisibleArea

;***************************************************************
	IN r19,line_count_h				;1
	CPI r19,0x01					;1
	BREQ line256plus				;1/2 (2 if branch)
	CPI r19,0x02					;1
	BREQ line512plus				;1/2 (2 if branch)
	CPI r19,0x00					;1
	BREQ line255minus				;1/2 (2 if branch)

line255minus:
	LPM r19,Z						;3
	LPM r19,Z						;3 (6 cycle delay)

	RJMP Horizontal_VisibleArea		;2	;16-OK  ;line=<0,255>

line256plus:
	IN r19,line_count_l				;1
	CPI r19,0xEA					;1
	BREQ line490					;1/2 (2 if branch)
	CPI r19,0xEC					;1
	BREQ line492					;1/2 (2 if branch)

	LPM r19,Z						;3
	RJMP PC+1						;2 (5 cycle delay)

	RJMP Horizontal_VisibleArea		;2  ;16-OK  ;line=<256,511> - 490,492
line490:
	LPM r19,Z						;3
	NOP								;1 (4 cycle delay)

	CBI	sync_port,vertical_sync_bit	;2
	RJMP Horizontal_VisibleArea		;2  ;16-OK  ;line=line490
line492:
	RJMP PC+1						;2 (2 cycle delay)

	SBI	sync_port,vertical_sync_bit	;2
	RJMP Horizontal_VisibleArea		;2  ;16-OK  ;line=line492

line512plus:
	IN r19,line_count_l				;1
	CPI r19,0x0D					;1
	BREQ line525					;1/2 (2 if branch)
	
	LPM r19,Z						;3
	RJMP PC+1						;2 (5 cycle delay)

	RJMP Horizontal_VisibleArea		;2	;16-OK  ;line=<512;524>

line525:
	NOP								;1 (1 cycle delay)
	CLR r19							;1
	OUT line_count_h,r19			;1
	OUT line_count_l,r19			;1
	RJMP Horizontal_VisibleArea		;2	;16-OK  ;line=525


;---------------------------end----------------------------------

copy_set_y:
	;---- Set y address for copying -----

	PUSH r17						;2

	IN r17, sync_port2				;1

	BST r2,6						;1
	BLD r17,adr_y_bit				;1

	ANDI r17,~(1<<clk_y_bit)		;1
	OUT sync_port2,r17				;1
	ORI r17,(1<<clk_y_bit)			;1
	OUT sync_port2,r17				;1

	BST r2,5						;1
	BLD r17,adr_y_bit				;1
	
	ANDI r17,~(1<<clk_y_bit)		;1
	OUT sync_port2,r17				;1
	ORI r17,(1<<clk_y_bit)			;1
	OUT sync_port2,r17				;1

	BST r2,4						;1
	BLD r17,adr_y_bit				;1
	
	ANDI r17,~(1<<clk_y_bit)		;1
	OUT sync_port2,r17				;1
	ORI r17,(1<<clk_y_bit)			;1
	OUT sync_port2,r17				;1

	BST r2,3						;1
	BLD r17,adr_y_bit				;1
	
	ANDI r17,~(1<<clk_y_bit)		;1
	OUT sync_port2,r17				;1
	ORI r17,(1<<clk_y_bit)			;1
	OUT sync_port2,r17				;1

	BST r2,2						;1
	BLD r17,adr_y_bit				;1
	
	ANDI r17,~(1<<clk_y_bit)		;1
	OUT sync_port2,r17				;1
	ORI r17,(1<<clk_y_bit)			;1
	OUT sync_port2,r17				;1

	BST r2,1						;1
	BLD r17,adr_y_bit				;1
	
	ANDI r17,~(1<<clk_y_bit)		;1
	OUT sync_port2,r17				;1
	ORI r17,(1<<clk_y_bit)			;1
	OUT sync_port2,r17				;1

	BST r2,0						;1
	BLD r17,adr_y_bit				;1
	
	ANDI r17,~(1<<clk_y_bit)		;1
	OUT sync_port2,r17				;1
	ORI r17,(1<<clk_y_bit)			;1
	OUT sync_port2,r17				;1

	BST r3,3						;1
	BLD r17,adr_y_bit				;1
	
	ANDI r17,~(1<<clk_y_bit)		;1
	OUT sync_port2,r17				;1
	ORI r17,(1<<clk_y_bit)			;1
	OUT sync_port2,r17				;1

	BST r3,2						;1
	BLD r17,adr_y_bit				;1

	OUT sync_port2,r17				;1

	POP r17							;2

	RJMP copy_set_return
	;------------------------------------

part0:
	RJMP PC+1						;2 (2 cycle delay)
	;----------------------part0----------------------

	;r20	adr=0 clk=0
	;r21	adr=0 clk=1
	;r22	adr=1 clk=0
	;r23	adr=1 clk=1

	IN r20,sync_port2							;1
	ANDI r20,~((1<<adr_x_bit)|(1<<clk_x_bit))	;1
	MOV r21,r20									;1
	ORI r21,(1<<clk_x_bit)						;1
	MOV r22,r20									;1
	ORI r22,(1<<adr_x_bit)						;1
	MOV r23,r22									;1
	ORI r23,(1<<clk_x_bit)						;1

	;init
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	;0
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	;32
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write
	
	RJMP part_return

part1:
	NOP								;1 (1 cycle delay)
	;----------------------part1----------------------

	;r19	out to sync_pin2 => clock toggle

	;r20	adr=0 clk=0
	;r21	adr=0 clk=1
	;r22	adr=1 clk=0
	;r23	adr=1 clk=1

	LDI r19,(1<<copy_we_bit)					;1
	IN r20,sync_port2							;1
	ANDI r20,~((1<<adr_x_bit)|(1<<clk_x_bit))	;1
	MOV r21,r20									;1
	ORI r21,(1<<clk_x_bit)						;1
	MOV r22,r20									;1
	ORI r22,(1<<adr_x_bit)						;1
	MOV r23,r22									;1
	ORI r23,(1<<clk_x_bit)						;1

	;init
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0
	OUT sync_port2,r22
	OUT sync_port2,r23 ;1
	OUT sync_port2,r22
	OUT sync_port2,r23 ;1
	OUT sync_port2,r22
	OUT sync_port2,r23 ;1
	OUT sync_port2,r22
	OUT sync_port2,r23 ;1
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	;64
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	;96
	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write
	
	RJMP part_return

part2:
	NOP								;1 (1 cycle delay)
	;----------------------part2----------------------

	;r19	out to sync_pin2 => clock toggle

	;r20	adr=0 clk=0
	;r21	adr=0 clk=1
	;r22	adr=1 clk=0
	;r23	adr=1 clk=1

	LDI r19,(1<<copy_we_bit)					;1
	IN r20,sync_port2							;1
	ANDI r20,~((1<<adr_x_bit)|(1<<clk_x_bit))	;1
	MOV r21,r20									;1
	ORI r21,(1<<clk_x_bit)						;1
	MOV r22,r20									;1
	ORI r22,(1<<adr_x_bit)						;1
	MOV r23,r22									;1
	ORI r23,(1<<clk_x_bit)						;1

	;init
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0
	OUT sync_port2,r22
	OUT sync_port2,r23 ;1
	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	;128
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	;160
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write
	
	RJMP part_return

part3:
	;----------------------part3----------------------

	;r19	out to sync_pin2 => clock toggle

	;r20	adr=0 clk=0
	;r21	adr=0 clk=1
	;r22	adr=1 clk=0
	;r23	adr=1 clk=1

	LDI r19,(1<<copy_we_bit)					;1
	IN r20,sync_port2							;1
	ANDI r20,~((1<<adr_x_bit)|(1<<clk_x_bit))	;1
	MOV r21,r20									;1
	ORI r21,(1<<clk_x_bit)						;1
	MOV r22,r20									;1
	ORI r22,(1<<adr_x_bit)						;1
	MOV r23,r22									;1
	ORI r23,(1<<clk_x_bit)						;1

	;init
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0
	OUT sync_port2,r22
	OUT sync_port2,r23 ;1
	OUT sync_port2,r22
	OUT sync_port2,r23 ;1
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0
	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	;192
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	;224
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	CBI sync_port2, copy_we_bit
	SBI sync_port2, copy_we_bit ;write
	
	RJMP part_return



;\/---------------------------RENDERING----------------------------\/

ENABLE_video:
	CBI sync_port,video_enable_low_bit	;2 ;enable video_enable_low_bit (if enabled)

RENDER_video: ;could be C function

	;r20	adr=0 clk=0
	;r21	adr=0 clk=1
	;r22	adr=1 clk=0
	;r23	adr=1 clk=1

	IN r20,sync_port2							;1
	ANDI r20,~((1<<adr_x_bit)|(1<<clk_x_bit))	;1
	MOV r21,r20									;1
	ORI r21,(1<<clk_x_bit)						;1
	MOV r22,r20									;1
	ORI r22,(1<<adr_x_bit)						;1
	MOV r23,r22									;1
	ORI r23,(1<<clk_x_bit)						;1

	;0
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	;32
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	;64
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	;96
	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	;128
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	;160
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	;192
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	;224
	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r22
	OUT sync_port2,r23 ;1

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

	OUT sync_port2,r20
	OUT sync_port2,r21 ;0

RENDER_pause:
	RJMP RENDER_pause ;2

;/\---------------------------RENDERING----------------------------/\


;********************** COMMANDS ************************
;
;	copy request			-	0b00000000|n (copy "n"th 4 lines (n = 0->119))
;	video enable/disable	-	0b0111100X (X==1 -> enable; X==0 -> disable;)
;	set swap state			-	0b0111101X (X==state)
;	copy dir				-	0b0111110X (X==1 -> to video; X==0 -> to data;)
;	swap request			-	0b01111110
;	driver ready request	-	0b01111111
;
;	driver done				-	0b11000000
;	driver ready response	-	0b11000001
;	driver transmit error	-	0b11000010
;	driver illegal cmd		-	0b11111111
;
;***************** COMPATIBILITY CHART ******************
;
;	INSTRUCTION CYCLE COUNT
;
;	ADD		-	1 cycle
;	ADC		-	1 cycle
;	SUBI	-	1 cycle
;	SBCI	-	1 cycle
;	ANDI	-	1 cycle
;	ORI		-	1 cycle
;	CLR		-	1 cycle
;	
;	RJMP	-	2 cycles
;	IJMP	-	2 cycles
;	RETI	-	4 cycles
;
;	CPI		-	1 cycle
;	SBIS	-	1/2/3 cycles
;	BREQ	-	1/2 cycles
;	BRSH	-	1/2 cycles
;	BRNE	-	1/2 cycles
;
;	TST		-	1 cycle
;
;	BST		-	1 cycle
;	BLD		-	1 cycle
;
;	LDI		-	1 cycle
;	LPM		-	3 cycles
;	IN		-	1 cycle
;	OUT		-	1 cycle
;	PUSH	-	2 cycles
;	POP		-	2 cycles
;
;	SBI		-	2 cycles
;	CBI		-	2 cycles
;	SEI		-	1 cycle
;	CLI		-	1 cycle
;	NOP		-	1 cycle
;
;	------------------------------------------
;
;	! Address in stack pointer must be 16bit !
;
;	------------------------------------------
;
;	Used timer registers:
;
;	TIMER1_OVF_vect at 0x0005
;	TCCR1B
;	TCNT1L
;	TCNT1H
;
;	-> could be any other 16bit timer (at least 9 bit)
;
;********************************************************