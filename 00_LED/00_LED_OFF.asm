;00_test.asm
; turns onboard LED on

.include "../m328Pdef.inc"

	ldi r16, 0b00100000
	out DDRB, r16
	ldi r16, 0b00000000
	out PortB, r16
Start:
	rjmp Start
