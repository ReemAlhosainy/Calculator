
_keypad_init:

;keypad.c,14 :: 		void keypad_init(void)
;keypad.c,16 :: 		KEYPAD_INIT_PORT();
	MOVLW       15
	MOVWF       TRISB+0 
	MOVLW       15
	MOVWF       PORTB+0 
;keypad.c,17 :: 		}
L_end_keypad_init:
	RETURN      0
; end of _keypad_init

_keypad_scan:

;keypad.c,18 :: 		u8 keypad_scan(void)
;keypad.c,20 :: 		K4(0);         K5(1);  K6(1);   K7(1);
	BCF         PORTB+0, 4 
L_keypad_scan1:
L_keypad_scan2:
	BSF         PORTB+0, 5 
L_keypad_scan4:
	BSF         PORTB+0, 6 
L_keypad_scan6:
	BSF         PORTB+0, 7 
;keypad.c,21 :: 		if(K0() == 0)  return keypad_matrix[0];
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	MOVLW       1
	ANDWF       R0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_keypad_scan8
	MOVF        _keypad_matrix+0, 0 
	MOVWF       R0 
	GOTO        L_end_keypad_scan
L_keypad_scan8:
;keypad.c,22 :: 		if(K1() == 0)  return keypad_matrix[1];
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       1
	ANDWF       R0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_keypad_scan9
	MOVF        _keypad_matrix+1, 0 
	MOVWF       R0 
	GOTO        L_end_keypad_scan
L_keypad_scan9:
;keypad.c,23 :: 		if(K2() == 0)  return keypad_matrix[2];
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       1
	ANDWF       R0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_keypad_scan10
	MOVF        _keypad_matrix+2, 0 
	MOVWF       R0 
	GOTO        L_end_keypad_scan
L_keypad_scan10:
;keypad.c,24 :: 		if(K3() == 0)  return keypad_matrix[3];
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       1
	ANDWF       R0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_keypad_scan11
	MOVF        _keypad_matrix+3, 0 
	MOVWF       R0 
	GOTO        L_end_keypad_scan
L_keypad_scan11:
;keypad.c,25 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_keypad_scan12:
	DECFSZ      R13, 1, 1
	BRA         L_keypad_scan12
	DECFSZ      R12, 1, 1
	BRA         L_keypad_scan12
	NOP
	NOP
;keypad.c,27 :: 		K4(1);         K5(0);  K6(1);   K7(1);
L_keypad_scan13:
	BSF         PORTB+0, 4 
	BCF         PORTB+0, 5 
L_keypad_scan16:
L_keypad_scan17:
	BSF         PORTB+0, 6 
L_keypad_scan19:
	BSF         PORTB+0, 7 
;keypad.c,28 :: 		if(K0() == 0)  return keypad_matrix[4];
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	MOVLW       1
	ANDWF       R0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_keypad_scan21
	MOVF        _keypad_matrix+4, 0 
	MOVWF       R0 
	GOTO        L_end_keypad_scan
L_keypad_scan21:
;keypad.c,29 :: 		if(K1() == 0)  return keypad_matrix[5];
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       1
	ANDWF       R0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_keypad_scan22
	MOVF        _keypad_matrix+5, 0 
	MOVWF       R0 
	GOTO        L_end_keypad_scan
L_keypad_scan22:
;keypad.c,30 :: 		if(K2() == 0)  return keypad_matrix[6];
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       1
	ANDWF       R0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_keypad_scan23
	MOVF        _keypad_matrix+6, 0 
	MOVWF       R0 
	GOTO        L_end_keypad_scan
L_keypad_scan23:
;keypad.c,31 :: 		if(K3() == 0)  return keypad_matrix[7];
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       1
	ANDWF       R0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_keypad_scan24
	MOVF        _keypad_matrix+7, 0 
	MOVWF       R0 
	GOTO        L_end_keypad_scan
L_keypad_scan24:
;keypad.c,32 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_keypad_scan25:
	DECFSZ      R13, 1, 1
	BRA         L_keypad_scan25
	DECFSZ      R12, 1, 1
	BRA         L_keypad_scan25
	NOP
	NOP
;keypad.c,34 :: 		K4(1);         K5(1);  K6(0);   K7(1);
L_keypad_scan26:
	BSF         PORTB+0, 4 
L_keypad_scan28:
	BSF         PORTB+0, 5 
	BCF         PORTB+0, 6 
L_keypad_scan31:
L_keypad_scan32:
	BSF         PORTB+0, 7 
;keypad.c,35 :: 		if(K0() == 0)  return keypad_matrix[8];
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	MOVLW       1
	ANDWF       R0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_keypad_scan34
	MOVF        _keypad_matrix+8, 0 
	MOVWF       R0 
	GOTO        L_end_keypad_scan
L_keypad_scan34:
;keypad.c,36 :: 		if(K1() == 0)  return keypad_matrix[9];
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       1
	ANDWF       R0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_keypad_scan35
	MOVF        _keypad_matrix+9, 0 
	MOVWF       R0 
	GOTO        L_end_keypad_scan
L_keypad_scan35:
;keypad.c,37 :: 		if(K2() == 0)  return keypad_matrix[10];
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       1
	ANDWF       R0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_keypad_scan36
	MOVF        _keypad_matrix+10, 0 
	MOVWF       R0 
	GOTO        L_end_keypad_scan
L_keypad_scan36:
;keypad.c,38 :: 		if(K3() == 0)  return keypad_matrix[11];
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       1
	ANDWF       R0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_keypad_scan37
	MOVF        _keypad_matrix+11, 0 
	MOVWF       R0 
	GOTO        L_end_keypad_scan
L_keypad_scan37:
;keypad.c,39 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_keypad_scan38:
	DECFSZ      R13, 1, 1
	BRA         L_keypad_scan38
	DECFSZ      R12, 1, 1
	BRA         L_keypad_scan38
	NOP
	NOP
;keypad.c,41 :: 		K4(1);         K5(1);  K6(1);   K7(0);
L_keypad_scan39:
	BSF         PORTB+0, 4 
L_keypad_scan41:
	BSF         PORTB+0, 5 
L_keypad_scan43:
	BSF         PORTB+0, 6 
	BCF         PORTB+0, 7 
L_keypad_scan46:
;keypad.c,42 :: 		if(K0() == 0)  return keypad_matrix[12];
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	MOVLW       1
	ANDWF       R0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_keypad_scan47
	MOVF        _keypad_matrix+12, 0 
	MOVWF       R0 
	GOTO        L_end_keypad_scan
L_keypad_scan47:
;keypad.c,43 :: 		if(K1() == 0)  return keypad_matrix[13];
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       1
	ANDWF       R0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_keypad_scan48
	MOVF        _keypad_matrix+13, 0 
	MOVWF       R0 
	GOTO        L_end_keypad_scan
L_keypad_scan48:
;keypad.c,44 :: 		if(K2() == 0)  return keypad_matrix[14];
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       1
	ANDWF       R0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_keypad_scan49
	MOVF        _keypad_matrix+14, 0 
	MOVWF       R0 
	GOTO        L_end_keypad_scan
L_keypad_scan49:
;keypad.c,45 :: 		if(K3() == 0)  return keypad_matrix[15];
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       1
	ANDWF       R0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_keypad_scan50
	MOVF        _keypad_matrix+15, 0 
	MOVWF       R0 
	GOTO        L_end_keypad_scan
L_keypad_scan50:
;keypad.c,46 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_keypad_scan51:
	DECFSZ      R13, 1, 1
	BRA         L_keypad_scan51
	DECFSZ      R12, 1, 1
	BRA         L_keypad_scan51
	NOP
	NOP
;keypad.c,48 :: 		return 0;
	CLRF        R0 
;keypad.c,50 :: 		}
L_end_keypad_scan:
	RETURN      0
; end of _keypad_scan
