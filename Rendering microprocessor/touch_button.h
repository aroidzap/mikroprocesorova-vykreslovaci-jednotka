#ifndef TOUCH_BUTTON_H_
#define TOUCH_BUTTON_H_

#include <avr/io.h>
#include "settings.h"

void init_touch();
void wait_for_touch();

#endif /* TOUCH_BUTTON_H_ */