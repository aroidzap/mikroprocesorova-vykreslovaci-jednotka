#include "touch_button.h"

void init_touch()
{
	TOUCH_DDR|=_BV(TOUCH_SUPPLY);
	TOUCH_DDR&=~_BV(TOUCH_INPUT);
	
	TOUCH_PORT|=_BV(TOUCH_SUPPLY)|_BV(TOUCH_INPUT);
}

void wait_for_touch()
{
	while((TOUCH_PIN&_BV(TOUCH_INPUT))!=0){}
}