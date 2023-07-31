#include "STD_Types.h"
#include"keypad.h"
sbit LCD_EN at RD1_bit;      sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_RS at RD0_bit;      sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_D4 at RD4_bit;      sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5 at RD5_bit;      sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6 at RD6_bit;      sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7 at RD7_bit;      sbit LCD_D7_Direction at TRISD7_bit;

u64 add(u16 a,u16 b){return (u64) a+b;}
u64 mul(u16 a,u16 b){return (u64) a*b;}
u64 sub(u16 a,u16 b){return  (u64) a-b;}
u64 dive(u16 a,u16 b){return (u64) a/b;}
void LCD_vid_num_to_str(u64 u64NumCopy);
u64 chars_to_int(u8 arr[4],u8 size ) ;
u8 str[7];

void main() {  u8 key; 
     u16 num1,num2;
     //pointers to array of functions  .They return u16 and take u8,u8
     //                        42  43     45    47
     u64 (*result[])(u16 ,u16) ={mul,add,0,sub,0,dive};
     u8 input_arr[3][4]={0},i=0 ;u8 j=0;
     u16 size[2]={-1,-1};
     u64 res;  u8 op=0;
          INTCON2=0;  ADCON1=6;   trisc=0;

     LCD_init();
     keypad_init();
     while(1)
     {
              key=keypad_scan();

             if(key!=0 )
             {
                 if(i==0&&j==0 ||key=='c'){Lcd_Cmd(_LCD_CLEAR);  size[0]=0;size[1]=0;  }
                       if(key>='0' && key <='9')
                       {
                            input_arr[i][j]=key; j++;
                       }
                       else if(key<48 && key>41)//operators:
                       {    size[0]=j;
                            j=0;    i++;
                            input_arr[i++][j]=key;
                       }
                        if(key!='c')
                         Lcd_Chr_Cp(key);

                         //he pressed 132.   do arr[0]=1 arr[1]=2  arr[2]=3 arr[3]=0    .
                          //he pressed 1320.   do arr[0]=1 arr[1]=2  arr[2]=3 arr[3]=0    .
             if(key=='=')
             {       size[1]=j;
                      i=0;  j=0;
                      num1=chars_to_int(input_arr[0],size[0]);
                      num2= chars_to_int(input_arr[2],size[1]);
                      res=result[input_arr[1][0]-42](num1,num2);
                     // res=result[input_arr[1][0]-42](input_arr[0][0]-'0',input_arr[2][0]-'0');
                   // IntTostr(res,str); Lcd_out_Cp(str);
                     LCD_vid_num_to_str(res);
                     
             }
              while(keypad_scan());
             }
     }
                  //arr[0]=1    arr[1]=9    if he pressed 19     size=2.
}
u64 chars_to_int(u8* arr,u8 size )
{  u16 counter=0;
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