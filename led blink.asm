version2 i wan add buzer
; blink.asm - My First Git Project
; PIC16F877A - LED Blink on PORTB
; Author: EB

    LIST P=16F877A
    #INCLUDE <P16F877A.INC>
    __CONFIG _HS_OSC & _WDT_OFF & _PWRTE_ON & _LVP_OFF

    ORG 0x00
    GOTO START

DELAY:
    MOVLW D'255'
    MOVWF 0x20
    MOVWF 0x21
LOOP1:
    DECFSZ 0x20, F
    GOTO LOOP1
    DECFSZ 0x21, F
    GOTO LOOP1
    RETURN

START:
    BANKSEL TRISB
    CLRF TRISB       ; PORTB as output
    BANKSEL PORTB

MAIN:
    MOVLW 0xFF
    MOVWF PORTB      ; LEDs ON
    CALL DELAY
    CLRF PORTB       ; LEDs OFF
    CALL DELAY
    GOTO MAIN

    END