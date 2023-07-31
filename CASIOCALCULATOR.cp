#line 1 "E:/Faculty Material/Embedded Systems/Labs/InterfacingCode/CASIO/CASIOCALCULATOR.c"
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
#line 1 "e:/faculty material/embedded systems/labs/interfacingcode/casio/keypad.h"
#line 1 "e:/faculty material/embedded systems/labs/interfacingcode/casio/std_types.h"
#line 1 "e:/faculty material/embedded systems/labs/interfacingcode/casio/std_macros.h"
#line 1 "e:/faculty material/embedded systems/labs/interfacingcode/casio/std_types.h"
#line 31 "e:/faculty material/embedded systems/labs/interfacingcode/casio/keypad.h"
void keypad_init(void);

u8 keypad_scan(void);
#line 3 "E:/Faculty Material/Embedded Systems/Labs/InterfacingCode/CASIO/CASIOCALCULATOR.c"
sbit LCD_EN at RD1_bit; sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_RS at RD0_bit; sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_D4 at RD4_bit; sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5 at RD5_bit; sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6 at RD6_bit; sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7 at RD7_bit; sbit LCD_D7_Direction at TRISD7_bit;

u64 add(u16 a,u16 b){return (u64) a+b;}
u64 mul(u16 a,u16 b){return (u64) a*b;}
u64 sub(u16 a,u16 b){return (u64) a-b;}
u64 dive(u16 a,u16 b){return (u64) a/b;}
void LCD_vid_num_to_str(u64 u64NumCopy);
u64 chars_to_int(u8 arr[4],u8 size ) ;
u8 str[7];

void main() { u8 key;
 u16 num1,num2;


 u64 (*result[])(u16 ,u16) ={mul,add,0,sub,0,dive};
 u8 input_arr[3][4]={0},i=0 ;u8 j=0;
 u16 size[2]={-1,-1};
 u64 res; u8 op=0;
 INTCON2=0; ADCON1=6; trisc=0;

 LCD_init();
 keypad_init();
 while(1)
 {
 key=keypad_scan();

 if(key!=0 )
 {
 if(i==0&&j==0 ||key=='c'){Lcd_Cmd(_LCD_CLEAR); size[0]=0;size[1]=0; }
 if(key>='0' && key <='9')
 {
 input_arr[i][j]=key; j++;
 }
 else if(key<48 && key>41)
 { size[0]=j;
 j=0; i++;
 input_arr[i++][j]=key;
 }
 if(key!='c')
 Lcd_Chr_Cp(key);



 if(key=='=')
 { size[1]=j;
 i=0; j=0;
 num1=chars_to_int(input_arr[0],size[0]);
 num2= chars_to_int(input_arr[2],size[1]);
 res=result[input_arr[1][0]-42](num1,num2);


 LCD_vid_num_to_str(res);

 }
 while(keypad_scan());
 }
 }

}
u64 chars_to_int(u8* arr,u8 size )
{ u16 counter=0;
 u64 sum=0;
 for(counter=0;counter<size;counter++)
 {
 sum += ( (arr[counter]-48) * (u16)(pow(10,size-counter-1)+0.5) );

 }
 return sum;
}
void LCD_vid_num_to_str(u64 u64NumCopy)
{
 u32 i,rem,len=0,n;
 u8 str[30]={0};
 n=u64NumCopy;
 while(n != 0)
 {
 len++;
 n/=10;
 }
 for(i=0;i<len;i++)
 {
 rem=u64NumCopy %10;
 u64NumCopy=u64NumCopy/10;
 str[len-(i+1)]=rem +'0';
 }
 str[len]='\0';
 Lcd_out_CP(str);
}
