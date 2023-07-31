/*
 * keypad.h
 *
 * Created: 7/29/2022 10:54:13 AM
 *  Author: DELL
 */ 


#ifndef KEYPAD_H_
#define KEYPAD_H_

#include "STD_Types.h"
#include "STD_MACROS.h"

#define KEYPAD_INIT_PORT() TRISB=0b00001111; PORTB=0b00001111;

//inputs:
#define K0()   READ_BIT(PORTB,0)
#define K1()   READ_BIT(PORTB,1)
#define K2()   READ_BIT(PORTB,2)
#define K3()   READ_BIT(PORTB,3)

//outputs:
#define K4(val)  if(val==0) CLR_BIT(PORTB,4); else  SET_BIT(PORTB,4)
#define K5(val)  if(val==0) CLR_BIT(PORTB,5); else  SET_BIT(PORTB,5)
#define K6(val)  if(val==0) CLR_BIT(PORTB,6); else  SET_BIT(PORTB,6)
#define K7(val)  if(val==0) CLR_BIT(PORTB,7); else  SET_BIT(PORTB,7)



void keypad_init(void);

u8 keypad_scan(void);

#endif /* KEYPAD_H_ */