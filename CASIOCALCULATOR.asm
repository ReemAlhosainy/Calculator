
_add:

;CASIOCALCULATOR.c,10 :: 		u64 add(u16 a,u16 b){return (u64) a+b;}
	MOVF        FARG_add_a+0, 0 
	MOVWF       R0 
	MOVF        FARG_add_a+1, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVWF       R3 
	MOVF        FARG_add_b+0, 0 
	ADDWF       R0, 1 
	MOVF        FARG_add_b+1, 0 
	ADDWFC      R1, 1 
	MOVLW       0
	ADDWFC      R2, 1 
	ADDWFC      R3, 1 
L_end_add:
	RETURN      0
; end of _add

_mul:

;CASIOCALCULATOR.c,11 :: 		u64 mul(u16 a,u16 b){return (u64) a*b;}
	MOVF        FARG_mul_a+0, 0 
	MOVWF       R0 
	MOVF        FARG_mul_a+1, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVWF       R3 
	MOVF        FARG_mul_b+0, 0 
	MOVWF       R4 
	MOVF        FARG_mul_b+1, 0 
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
L_end_mul:
	RETURN      0
; end of _mul

_sub:

;CASIOCALCULATOR.c,12 :: 		u64 sub(u16 a,u16 b){return  (u64) a-b;}
	MOVF        FARG_sub_a+0, 0 
	MOVWF       R0 
	MOVF        FARG_sub_a+1, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVWF       R3 
	MOVF        FARG_sub_b+0, 0 
	SUBWF       R0, 1 
	MOVF        FARG_sub_b+1, 0 
	SUBWFB      R1, 1 
	MOVLW       0
	SUBWFB      R2, 1 
	SUBWFB      R3, 1 
L_end_sub:
	RETURN      0
; end of _sub

_dive:

;CASIOCALCULATOR.c,13 :: 		u64 dive(u16 a,u16 b){return (u64) a/b;}
	MOVF        FARG_dive_a+0, 0 
	MOVWF       R0 
	MOVF        FARG_dive_a+1, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVWF       R3 
	MOVF        FARG_dive_b+0, 0 
	MOVWF       R4 
	MOVF        FARG_dive_b+1, 0 
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_U+0, 0
L_end_dive:
	RETURN      0
; end of _dive

_main:

;CASIOCALCULATOR.c,18 :: 		void main() {  u8 key;
;CASIOCALCULATOR.c,22 :: 		u64 (*result[])(u16 ,u16) ={mul,add,0,sub,0,dive};
	MOVLW       _mul+0
	MOVWF       main_result_L0+0 
	MOVLW       hi_addr(_mul+0)
	MOVWF       main_result_L0+1 
	MOVLW       FARG_mul_a+0
	MOVWF       main_result_L0+2 
	MOVLW       hi_addr(FARG_mul_a+0)
	MOVWF       main_result_L0+3 
	MOVLW       _add+0
	MOVWF       main_result_L0+4 
	MOVLW       hi_addr(_add+0)
	MOVWF       main_result_L0+5 
	MOVLW       FARG_add_a+0
	MOVWF       main_result_L0+6 
	MOVLW       hi_addr(FARG_add_a+0)
	MOVWF       main_result_L0+7 
	CLRF        main_result_L0+8 
	CLRF        main_result_L0+9 
	CLRF        main_result_L0+10 
	CLRF        main_result_L0+11 
	MOVLW       _sub+0
	MOVWF       main_result_L0+12 
	MOVLW       hi_addr(_sub+0)
	MOVWF       main_result_L0+13 
	MOVLW       FARG_sub_a+0
	MOVWF       main_result_L0+14 
	MOVLW       hi_addr(FARG_sub_a+0)
	MOVWF       main_result_L0+15 
	CLRF        main_result_L0+16 
	CLRF        main_result_L0+17 
	CLRF        main_result_L0+18 
	CLRF        main_result_L0+19 
	MOVLW       _dive+0
	MOVWF       main_result_L0+20 
	MOVLW       hi_addr(_dive+0)
	MOVWF       main_result_L0+21 
	MOVLW       FARG_dive_a+0
	MOVWF       main_result_L0+22 
	MOVLW       hi_addr(FARG_dive_a+0)
	MOVWF       main_result_L0+23 
;CASIOCALCULATOR.c,23 :: 		u8 input_arr[3][4]={0},i=0 ;u8 j=0;
	CLRF        main_input_arr_L0+0 
	CLRF        main_input_arr_L0+1 
	CLRF        main_input_arr_L0+2 
	CLRF        main_input_arr_L0+3 
	CLRF        main_input_arr_L0+4 
	CLRF        main_input_arr_L0+5 
	CLRF        main_input_arr_L0+6 
	CLRF        main_input_arr_L0+7 
	CLRF        main_input_arr_L0+8 
	CLRF        main_input_arr_L0+9 
	CLRF        main_input_arr_L0+10 
	CLRF        main_input_arr_L0+11 
	CLRF        main_i_L0+0 
	CLRF        main_j_L0+0 
	MOVLW       255
	MOVWF       main_size_L0+0 
	MOVLW       255
	MOVWF       main_size_L0+1 
	MOVLW       255
	MOVWF       main_size_L0+2 
	MOVLW       255
	MOVWF       main_size_L0+3 
;CASIOCALCULATOR.c,26 :: 		INTCON2=0;  ADCON1=6;   trisc=0;
	CLRF        INTCON2+0 
	MOVLW       6
	MOVWF       ADCON1+0 
	CLRF        TRISC+0 
;CASIOCALCULATOR.c,28 :: 		LCD_init();
	CALL        _Lcd_Init+0, 0
;CASIOCALCULATOR.c,29 :: 		keypad_init();
	CALL        _keypad_init+0, 0
;CASIOCALCULATOR.c,30 :: 		while(1)
L_main0:
;CASIOCALCULATOR.c,32 :: 		key=keypad_scan();
	CALL        _keypad_scan+0, 0
	MOVF        R0, 0 
	MOVWF       main_key_L0+0 
;CASIOCALCULATOR.c,34 :: 		if(key!=0 )
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main2
;CASIOCALCULATOR.c,36 :: 		if(i==0&&j==0 ||key=='c'){Lcd_Cmd(_LCD_CLEAR);  size[0]=0;size[1]=0;  }
	MOVF        main_i_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__main30
	MOVF        main_j_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__main30
	GOTO        L__main29
L__main30:
	MOVF        main_key_L0+0, 0 
	XORLW       99
	BTFSC       STATUS+0, 2 
	GOTO        L__main29
	GOTO        L_main7
L__main29:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	CLRF        main_size_L0+0 
	CLRF        main_size_L0+1 
	CLRF        main_size_L0+2 
	CLRF        main_size_L0+3 
L_main7:
;CASIOCALCULATOR.c,37 :: 		if(key>='0' && key <='9')
	MOVLW       48
	SUBWF       main_key_L0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main10
	MOVF        main_key_L0+0, 0 
	SUBLW       57
	BTFSS       STATUS+0, 0 
	GOTO        L_main10
L__main28:
;CASIOCALCULATOR.c,39 :: 		input_arr[i][j]=key; j++;
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_input_arr_L0+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(main_input_arr_L0+0)
	ADDWFC      R1, 1 
	MOVF        main_j_L0+0, 0 
	ADDWF       R0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1L+1 
	MOVF        main_key_L0+0, 0 
	MOVWF       POSTINC1+0 
	INCF        main_j_L0+0, 1 
;CASIOCALCULATOR.c,40 :: 		}
	GOTO        L_main11
L_main10:
;CASIOCALCULATOR.c,41 :: 		else if(key<48 && key>41)//operators:
	MOVLW       48
	SUBWF       main_key_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
	MOVF        main_key_L0+0, 0 
	SUBLW       41
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
L__main27:
;CASIOCALCULATOR.c,42 :: 		{    size[0]=j;
	MOVF        main_j_L0+0, 0 
	MOVWF       main_size_L0+0 
	MOVLW       0
	MOVWF       main_size_L0+1 
;CASIOCALCULATOR.c,43 :: 		j=0;    i++;
	CLRF        main_j_L0+0 
	INCF        main_i_L0+0, 1 
;CASIOCALCULATOR.c,44 :: 		input_arr[i++][j]=key;
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_input_arr_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(main_input_arr_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1L+1 
	MOVF        main_key_L0+0, 0 
	MOVWF       POSTINC1+0 
	INCF        main_i_L0+0, 1 
;CASIOCALCULATOR.c,45 :: 		}
L_main14:
L_main11:
;CASIOCALCULATOR.c,46 :: 		if(key!='c')
	MOVF        main_key_L0+0, 0 
	XORLW       99
	BTFSC       STATUS+0, 2 
	GOTO        L_main15
;CASIOCALCULATOR.c,47 :: 		Lcd_Chr_Cp(key);
	MOVF        main_key_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
L_main15:
;CASIOCALCULATOR.c,51 :: 		if(key=='=')
	MOVF        main_key_L0+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_main16
;CASIOCALCULATOR.c,52 :: 		{       size[1]=j;
	MOVF        main_j_L0+0, 0 
	MOVWF       main_size_L0+2 
	MOVLW       0
	MOVWF       main_size_L0+3 
;CASIOCALCULATOR.c,53 :: 		i=0;  j=0;
	CLRF        main_i_L0+0 
	CLRF        main_j_L0+0 
;CASIOCALCULATOR.c,54 :: 		num1=chars_to_int(input_arr[0],size[0]);
	MOVLW       main_input_arr_L0+0
	MOVWF       FARG_chars_to_int_arr+0 
	MOVLW       hi_addr(main_input_arr_L0+0)
	MOVWF       FARG_chars_to_int_arr+1 
	MOVF        main_size_L0+0, 0 
	MOVWF       FARG_chars_to_int_size+0 
	CALL        _chars_to_int+0, 0
	MOVF        R0, 0 
	MOVWF       main_num1_L0+0 
	MOVF        R1, 0 
	MOVWF       main_num1_L0+1 
;CASIOCALCULATOR.c,55 :: 		num2= chars_to_int(input_arr[2],size[1]);
	MOVLW       main_input_arr_L0+8
	MOVWF       FARG_chars_to_int_arr+0 
	MOVLW       hi_addr(main_input_arr_L0+8)
	MOVWF       FARG_chars_to_int_arr+1 
	MOVF        main_size_L0+2, 0 
	MOVWF       FARG_chars_to_int_size+0 
	CALL        _chars_to_int+0, 0
	MOVF        R0, 0 
	MOVWF       main_num2_L0+0 
	MOVF        R1, 0 
	MOVWF       main_num2_L0+1 
;CASIOCALCULATOR.c,56 :: 		res=result[input_arr[1][0]-42](num1,num2);
	MOVLW       42
	SUBWF       main_input_arr_L0+4, 0 
	MOVWF       R3 
	CLRF        R4 
	MOVLW       0
	SUBWFB      R4, 1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_result_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(main_result_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R2, 0 
	MOVWF       FSR1+0 
	MOVF        R3, 0 
	MOVWF       FSR1+1 
	MOVF        main_num1_L0+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        main_num1_L0+1, 0 
	MOVWF       POSTINC1+0 
	MOVF        main_num2_L0+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        main_num2_L0+1, 0 
	MOVWF       POSTINC1+0 
	CALL        _____DoIFC+0, 0
;CASIOCALCULATOR.c,59 :: 		LCD_vid_num_to_str(res);
	MOVF        R0, 0 
	MOVWF       FARG_LCD_vid_num_to_str_u64NumCopy+0 
	MOVF        R1, 0 
	MOVWF       FARG_LCD_vid_num_to_str_u64NumCopy+1 
	MOVF        R2, 0 
	MOVWF       FARG_LCD_vid_num_to_str_u64NumCopy+2 
	MOVF        R3, 0 
	MOVWF       FARG_LCD_vid_num_to_str_u64NumCopy+3 
	CALL        _LCD_vid_num_to_str+0, 0
;CASIOCALCULATOR.c,61 :: 		}
L_main16:
;CASIOCALCULATOR.c,62 :: 		while(keypad_scan());
L_main17:
	CALL        _keypad_scan+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main18
	GOTO        L_main17
L_main18:
;CASIOCALCULATOR.c,63 :: 		}
L_main2:
;CASIOCALCULATOR.c,64 :: 		}
	GOTO        L_main0
;CASIOCALCULATOR.c,66 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_chars_to_int:

;CASIOCALCULATOR.c,67 :: 		u64 chars_to_int(u8* arr,u8 size )
;CASIOCALCULATOR.c,68 :: 		{  u16 counter=0;
	CLRF        chars_to_int_counter_L0+0 
	CLRF        chars_to_int_counter_L0+1 
	CLRF        chars_to_int_sum_L0+0 
	CLRF        chars_to_int_sum_L0+1 
	CLRF        chars_to_int_sum_L0+2 
	CLRF        chars_to_int_sum_L0+3 
;CASIOCALCULATOR.c,70 :: 		for(counter=0;counter<size;counter++)
	CLRF        chars_to_int_counter_L0+0 
	CLRF        chars_to_int_counter_L0+1 
L_chars_to_int19:
	MOVLW       0
	SUBWF       chars_to_int_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__chars_to_int37
	MOVF        FARG_chars_to_int_size+0, 0 
	SUBWF       chars_to_int_counter_L0+0, 0 
L__chars_to_int37:
	BTFSC       STATUS+0, 0 
	GOTO        L_chars_to_int20
;CASIOCALCULATOR.c,72 :: 		sum += ( (arr[counter]-48) * (u16)(pow(10,size-counter-1)+0.5) );
	MOVF        chars_to_int_counter_L0+0, 0 
	ADDWF       FARG_chars_to_int_arr+0, 0 
	MOVWF       FSR0L+0 
	MOVF        chars_to_int_counter_L0+1, 0 
	ADDWFC      FARG_chars_to_int_arr+1, 0 
	MOVWF       FSR0L+1 
	MOVLW       48
	SUBWF       POSTINC0+0, 0 
	MOVWF       FLOC__chars_to_int+0 
	CLRF        FLOC__chars_to_int+1 
	MOVLW       0
	SUBWFB      FLOC__chars_to_int+1, 1 
	MOVLW       0
	MOVWF       FARG_pow_x+0 
	MOVLW       0
	MOVWF       FARG_pow_x+1 
	MOVLW       32
	MOVWF       FARG_pow_x+2 
	MOVLW       130
	MOVWF       FARG_pow_x+3 
	MOVF        chars_to_int_counter_L0+0, 0 
	SUBWF       FARG_chars_to_int_size+0, 0 
	MOVWF       R0 
	MOVF        chars_to_int_counter_L0+1, 0 
	MOVWF       R1 
	MOVLW       0
	SUBFWB      R1, 1 
	MOVLW       1
	SUBWF       R0, 1 
	MOVLW       0
	SUBWFB      R1, 1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_pow_y+0 
	MOVF        R1, 0 
	MOVWF       FARG_pow_y+1 
	MOVF        R2, 0 
	MOVWF       FARG_pow_y+2 
	MOVF        R3, 0 
	MOVWF       FARG_pow_y+3 
	CALL        _pow+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        FLOC__chars_to_int+0, 0 
	MOVWF       R4 
	MOVF        FLOC__chars_to_int+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	ADDWF       chars_to_int_sum_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      chars_to_int_sum_L0+1, 1 
	MOVLW       0
	ADDWFC      chars_to_int_sum_L0+2, 1 
	ADDWFC      chars_to_int_sum_L0+3, 1 
;CASIOCALCULATOR.c,70 :: 		for(counter=0;counter<size;counter++)
	INFSNZ      chars_to_int_counter_L0+0, 1 
	INCF        chars_to_int_counter_L0+1, 1 
;CASIOCALCULATOR.c,74 :: 		}
	GOTO        L_chars_to_int19
L_chars_to_int20:
;CASIOCALCULATOR.c,75 :: 		return sum;
	MOVF        chars_to_int_sum_L0+0, 0 
	MOVWF       R0 
	MOVF        chars_to_int_sum_L0+1, 0 
	MOVWF       R1 
	MOVF        chars_to_int_sum_L0+2, 0 
	MOVWF       R2 
	MOVF        chars_to_int_sum_L0+3, 0 
	MOVWF       R3 
;CASIOCALCULATOR.c,76 :: 		}
L_end_chars_to_int:
	RETURN      0
; end of _chars_to_int

_LCD_vid_num_to_str:

;CASIOCALCULATOR.c,77 :: 		void LCD_vid_num_to_str(u64 u64NumCopy)
;CASIOCALCULATOR.c,79 :: 		u32 i,rem,len=0,n;
	CLRF        LCD_vid_num_to_str_len_L0+0 
	CLRF        LCD_vid_num_to_str_len_L0+1 
	CLRF        LCD_vid_num_to_str_len_L0+2 
	CLRF        LCD_vid_num_to_str_len_L0+3 
	CLRF        LCD_vid_num_to_str_str_L0+0 
	CLRF        LCD_vid_num_to_str_str_L0+1 
	CLRF        LCD_vid_num_to_str_str_L0+2 
	CLRF        LCD_vid_num_to_str_str_L0+3 
	CLRF        LCD_vid_num_to_str_str_L0+4 
	CLRF        LCD_vid_num_to_str_str_L0+5 
	CLRF        LCD_vid_num_to_str_str_L0+6 
	CLRF        LCD_vid_num_to_str_str_L0+7 
	CLRF        LCD_vid_num_to_str_str_L0+8 
	CLRF        LCD_vid_num_to_str_str_L0+9 
	CLRF        LCD_vid_num_to_str_str_L0+10 
	CLRF        LCD_vid_num_to_str_str_L0+11 
	CLRF        LCD_vid_num_to_str_str_L0+12 
	CLRF        LCD_vid_num_to_str_str_L0+13 
	CLRF        LCD_vid_num_to_str_str_L0+14 
	CLRF        LCD_vid_num_to_str_str_L0+15 
	CLRF        LCD_vid_num_to_str_str_L0+16 
	CLRF        LCD_vid_num_to_str_str_L0+17 
	CLRF        LCD_vid_num_to_str_str_L0+18 
	CLRF        LCD_vid_num_to_str_str_L0+19 
	CLRF        LCD_vid_num_to_str_str_L0+20 
	CLRF        LCD_vid_num_to_str_str_L0+21 
	CLRF        LCD_vid_num_to_str_str_L0+22 
	CLRF        LCD_vid_num_to_str_str_L0+23 
	CLRF        LCD_vid_num_to_str_str_L0+24 
	CLRF        LCD_vid_num_to_str_str_L0+25 
	CLRF        LCD_vid_num_to_str_str_L0+26 
	CLRF        LCD_vid_num_to_str_str_L0+27 
	CLRF        LCD_vid_num_to_str_str_L0+28 
	CLRF        LCD_vid_num_to_str_str_L0+29 
;CASIOCALCULATOR.c,81 :: 		n=u64NumCopy;
	MOVF        FARG_LCD_vid_num_to_str_u64NumCopy+0, 0 
	MOVWF       LCD_vid_num_to_str_n_L0+0 
	MOVF        FARG_LCD_vid_num_to_str_u64NumCopy+1, 0 
	MOVWF       LCD_vid_num_to_str_n_L0+1 
	MOVF        FARG_LCD_vid_num_to_str_u64NumCopy+2, 0 
	MOVWF       LCD_vid_num_to_str_n_L0+2 
	MOVF        FARG_LCD_vid_num_to_str_u64NumCopy+3, 0 
	MOVWF       LCD_vid_num_to_str_n_L0+3 
;CASIOCALCULATOR.c,82 :: 		while(n != 0)
L_LCD_vid_num_to_str22:
	MOVLW       0
	MOVWF       R0 
	XORWF       LCD_vid_num_to_str_n_L0+3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LCD_vid_num_to_str39
	MOVF        R0, 0 
	XORWF       LCD_vid_num_to_str_n_L0+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LCD_vid_num_to_str39
	MOVF        R0, 0 
	XORWF       LCD_vid_num_to_str_n_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LCD_vid_num_to_str39
	MOVF        LCD_vid_num_to_str_n_L0+0, 0 
	XORLW       0
L__LCD_vid_num_to_str39:
	BTFSC       STATUS+0, 2 
	GOTO        L_LCD_vid_num_to_str23
;CASIOCALCULATOR.c,84 :: 		len++;
	MOVLW       1
	ADDWF       LCD_vid_num_to_str_len_L0+0, 1 
	MOVLW       0
	ADDWFC      LCD_vid_num_to_str_len_L0+1, 1 
	ADDWFC      LCD_vid_num_to_str_len_L0+2, 1 
	ADDWFC      LCD_vid_num_to_str_len_L0+3, 1 
;CASIOCALCULATOR.c,85 :: 		n/=10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        LCD_vid_num_to_str_n_L0+0, 0 
	MOVWF       R0 
	MOVF        LCD_vid_num_to_str_n_L0+1, 0 
	MOVWF       R1 
	MOVF        LCD_vid_num_to_str_n_L0+2, 0 
	MOVWF       R2 
	MOVF        LCD_vid_num_to_str_n_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_U+0, 0
	MOVF        R0, 0 
	MOVWF       LCD_vid_num_to_str_n_L0+0 
	MOVF        R1, 0 
	MOVWF       LCD_vid_num_to_str_n_L0+1 
	MOVF        R2, 0 
	MOVWF       LCD_vid_num_to_str_n_L0+2 
	MOVF        R3, 0 
	MOVWF       LCD_vid_num_to_str_n_L0+3 
;CASIOCALCULATOR.c,86 :: 		}
	GOTO        L_LCD_vid_num_to_str22
L_LCD_vid_num_to_str23:
;CASIOCALCULATOR.c,87 :: 		for(i=0;i<len;i++)
	CLRF        LCD_vid_num_to_str_i_L0+0 
	CLRF        LCD_vid_num_to_str_i_L0+1 
	CLRF        LCD_vid_num_to_str_i_L0+2 
	CLRF        LCD_vid_num_to_str_i_L0+3 
L_LCD_vid_num_to_str24:
	MOVF        LCD_vid_num_to_str_len_L0+3, 0 
	SUBWF       LCD_vid_num_to_str_i_L0+3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LCD_vid_num_to_str40
	MOVF        LCD_vid_num_to_str_len_L0+2, 0 
	SUBWF       LCD_vid_num_to_str_i_L0+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LCD_vid_num_to_str40
	MOVF        LCD_vid_num_to_str_len_L0+1, 0 
	SUBWF       LCD_vid_num_to_str_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LCD_vid_num_to_str40
	MOVF        LCD_vid_num_to_str_len_L0+0, 0 
	SUBWF       LCD_vid_num_to_str_i_L0+0, 0 
L__LCD_vid_num_to_str40:
	BTFSC       STATUS+0, 0 
	GOTO        L_LCD_vid_num_to_str25
;CASIOCALCULATOR.c,89 :: 		rem=u64NumCopy %10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_LCD_vid_num_to_str_u64NumCopy+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_vid_num_to_str_u64NumCopy+1, 0 
	MOVWF       R1 
	MOVF        FARG_LCD_vid_num_to_str_u64NumCopy+2, 0 
	MOVWF       R2 
	MOVF        FARG_LCD_vid_num_to_str_u64NumCopy+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	MOVWF       FLOC__LCD_vid_num_to_str+0 
	MOVF        R1, 0 
	MOVWF       FLOC__LCD_vid_num_to_str+1 
	MOVF        R2, 0 
	MOVWF       FLOC__LCD_vid_num_to_str+2 
	MOVF        R3, 0 
	MOVWF       FLOC__LCD_vid_num_to_str+3 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FARG_LCD_vid_num_to_str_u64NumCopy+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_vid_num_to_str_u64NumCopy+1, 0 
	MOVWF       R1 
	MOVF        FARG_LCD_vid_num_to_str_u64NumCopy+2, 0 
	MOVWF       R2 
	MOVF        FARG_LCD_vid_num_to_str_u64NumCopy+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_U+0, 0
;CASIOCALCULATOR.c,90 :: 		u64NumCopy=u64NumCopy/10;
	MOVF        R0, 0 
	MOVWF       FARG_LCD_vid_num_to_str_u64NumCopy+0 
	MOVF        R1, 0 
	MOVWF       FARG_LCD_vid_num_to_str_u64NumCopy+1 
	MOVF        R2, 0 
	MOVWF       FARG_LCD_vid_num_to_str_u64NumCopy+2 
	MOVF        R3, 0 
	MOVWF       FARG_LCD_vid_num_to_str_u64NumCopy+3 
;CASIOCALCULATOR.c,91 :: 		str[len-(i+1)]=rem +'0';
	MOVLW       1
	ADDWF       LCD_vid_num_to_str_i_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	ADDWFC      LCD_vid_num_to_str_i_L0+1, 0 
	MOVWF       R5 
	MOVLW       0
	ADDWFC      LCD_vid_num_to_str_i_L0+2, 0 
	MOVWF       R6 
	MOVLW       0
	ADDWFC      LCD_vid_num_to_str_i_L0+3, 0 
	MOVWF       R7 
	MOVF        LCD_vid_num_to_str_len_L0+0, 0 
	MOVWF       R0 
	MOVF        LCD_vid_num_to_str_len_L0+1, 0 
	MOVWF       R1 
	MOVF        LCD_vid_num_to_str_len_L0+2, 0 
	MOVWF       R2 
	MOVF        LCD_vid_num_to_str_len_L0+3, 0 
	MOVWF       R3 
	MOVF        R4, 0 
	SUBWF       R0, 1 
	MOVF        R5, 0 
	SUBWFB      R1, 1 
	MOVF        R6, 0 
	SUBWFB      R2, 1 
	MOVF        R7, 0 
	SUBWFB      R3, 1 
	MOVLW       LCD_vid_num_to_str_str_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(LCD_vid_num_to_str_str_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1L+1 
	MOVLW       48
	ADDWF       FLOC__LCD_vid_num_to_str+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CASIOCALCULATOR.c,87 :: 		for(i=0;i<len;i++)
	MOVLW       1
	ADDWF       LCD_vid_num_to_str_i_L0+0, 1 
	MOVLW       0
	ADDWFC      LCD_vid_num_to_str_i_L0+1, 1 
	ADDWFC      LCD_vid_num_to_str_i_L0+2, 1 
	ADDWFC      LCD_vid_num_to_str_i_L0+3, 1 
;CASIOCALCULATOR.c,92 :: 		}
	GOTO        L_LCD_vid_num_to_str24
L_LCD_vid_num_to_str25:
;CASIOCALCULATOR.c,93 :: 		str[len]='\0';
	MOVLW       LCD_vid_num_to_str_str_L0+0
	ADDWF       LCD_vid_num_to_str_len_L0+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(LCD_vid_num_to_str_str_L0+0)
	ADDWFC      LCD_vid_num_to_str_len_L0+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;CASIOCALCULATOR.c,94 :: 		Lcd_out_CP(str);
	MOVLW       LCD_vid_num_to_str_str_L0+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(LCD_vid_num_to_str_str_L0+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;CASIOCALCULATOR.c,95 :: 		}
L_end_LCD_vid_num_to_str:
	RETURN      0
; end of _LCD_vid_num_to_str
