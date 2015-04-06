.include "tn4313def.inc" ;attiny 4313
.include "VGA_driver.S"

main:
	RCALL VGA_driver_init


end:
	RJMP end
