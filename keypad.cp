#line 1 "E:/Faculty Material/Embedded Systems/Labs/InterfacingCode/CASIO/keypad.c"
#line 1 "e:/faculty material/embedded systems/labs/interfacingcode/casio/keypad.h"
#line 1 "e:/faculty material/embedded systems/labs/interfacingcode/casio/std_types.h"



typedef unsigned char u8;
typedef unsigned int u16;
typedef unsigned long int u32;
typedef signed char s8;
typedef signed short int s16;
typedef signed long int s32;
typedef float f32;
typedef double f64;
typedef long double f128;
typedef long long unsigned int u64;
#line 1 "e:/faculty material/embedded systems/labs/interfacingcode/casio/std_macros.h"
#line 1 "e:/faculty material/embedded systems/labs/interfacingcode/casio/std_types.h"
#line 31 "e:/faculty material/embedded systems/labs/interfacingcode/casio/keypad.h"
void keypad_init(void);

u8 keypad_scan(void);
#line 9 "E:/Faculty Material/Embedded Systems/Labs/InterfacingCode/CASIO/keypad.c"
 u8 keypad_matrix[16] ={ '7', '4', '1', 'c'
 , '8', '5', '2', '0',
 '9', '6', '3', '=',
 '/', '*', '-','+' };

void keypad_init(void)
{
  TRISB=0b00001111; PORTB=0b00001111; ;
}
u8 keypad_scan(void)
{
  if(0==0) (PORTB) &=~(1<<(4)) ; else (PORTB) |=(1<<(4)) ;  if(1==0) (PORTB) &=~(1<<(5)) ; else (PORTB) |=(1<<(5)) ;  if(1==0) (PORTB) &=~(1<<(6)) ; else (PORTB) |=(1<<(6)) ;  if(1==0) (PORTB) &=~(1<<(7)) ; else (PORTB) |=(1<<(7)) ;
 if( (((PORTB) >>(0))&1)  == 0) return keypad_matrix[0];
 if( (((PORTB) >>(1))&1)  == 0) return keypad_matrix[1];
 if( (((PORTB) >>(2))&1)  == 0) return keypad_matrix[2];
 if( (((PORTB) >>(3))&1)  == 0) return keypad_matrix[3];
 delay_ms(1);

  if(1==0) (PORTB) &=~(1<<(4)) ; else (PORTB) |=(1<<(4)) ;  if(0==0) (PORTB) &=~(1<<(5)) ; else (PORTB) |=(1<<(5)) ;  if(1==0) (PORTB) &=~(1<<(6)) ; else (PORTB) |=(1<<(6)) ;  if(1==0) (PORTB) &=~(1<<(7)) ; else (PORTB) |=(1<<(7)) ;
 if( (((PORTB) >>(0))&1)  == 0) return keypad_matrix[4];
 if( (((PORTB) >>(1))&1)  == 0) return keypad_matrix[5];
 if( (((PORTB) >>(2))&1)  == 0) return keypad_matrix[6];
 if( (((PORTB) >>(3))&1)  == 0) return keypad_matrix[7];
 delay_ms(1);

  if(1==0) (PORTB) &=~(1<<(4)) ; else (PORTB) |=(1<<(4)) ;  if(1==0) (PORTB) &=~(1<<(5)) ; else (PORTB) |=(1<<(5)) ;  if(0==0) (PORTB) &=~(1<<(6)) ; else (PORTB) |=(1<<(6)) ;  if(1==0) (PORTB) &=~(1<<(7)) ; else (PORTB) |=(1<<(7)) ;
 if( (((PORTB) >>(0))&1)  == 0) return keypad_matrix[8];
 if( (((PORTB) >>(1))&1)  == 0) return keypad_matrix[9];
 if( (((PORTB) >>(2))&1)  == 0) return keypad_matrix[10];
 if( (((PORTB) >>(3))&1)  == 0) return keypad_matrix[11];
 delay_ms(1);

  if(1==0) (PORTB) &=~(1<<(4)) ; else (PORTB) |=(1<<(4)) ;  if(1==0) (PORTB) &=~(1<<(5)) ; else (PORTB) |=(1<<(5)) ;  if(1==0) (PORTB) &=~(1<<(6)) ; else (PORTB) |=(1<<(6)) ;  if(0==0) (PORTB) &=~(1<<(7)) ; else (PORTB) |=(1<<(7)) ;
 if( (((PORTB) >>(0))&1)  == 0) return keypad_matrix[12];
 if( (((PORTB) >>(1))&1)  == 0) return keypad_matrix[13];
 if( (((PORTB) >>(2))&1)  == 0) return keypad_matrix[14];
 if( (((PORTB) >>(3))&1)  == 0) return keypad_matrix[15];
 delay_ms(1);

 return 0;

}
