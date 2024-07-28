;00_test_OFF.asm
; turns onboard LED off

.include "../m328Pdef.inc"

	ldi r16, 0b00100000
	out DDRB, r16 ; sets 5th bit to output

	ldi r17, 0b00000000
	out PortB, r17 ; sets 5th bit low
Start:
	rjmp Start
