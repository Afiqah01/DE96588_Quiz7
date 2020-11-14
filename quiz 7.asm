#include<p18f4550.inc>

loop_cnt1	set	0x00
loop_cnt2	set 0x01

			org	0x00
			goto start
			org	0x08
			retfie
			org	0x18
			retfie

dup_nop		macro kk
			variable i
i = 0
			while i < kk
			nop
i += 1
			endw
			endm



start		CLRF	TRISD, A
			SETF	TRISB, A
			CLRF	PORTD, A

CHECK		BTFSS	PORTB, 0, A
			BRA		Onled1
			BCF		PORTD, 0, A
			BTFSS	PORTB, 1, A
			BRA		Onled2
			BCF		PORTD, 1, A
			BRA		CHECK
			
Onled1		BCF		PORTD, 0, A
			BRA		CHECK
			
Onled2		BCF		PORTD, 1, A
			BRA		CHECK
			
			END