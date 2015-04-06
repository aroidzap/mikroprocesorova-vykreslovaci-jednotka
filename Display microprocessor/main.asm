; 
;	Copyright (c) 2015 Tomáš Pazdiora
;	See the file "LICENSE.txt" for the full license governing this code.
;

.include "tn4313def.inc" ;attiny 4313
.include "VGA_driver.S"

main:
	RCALL VGA_driver_init


end:
	RJMP end
