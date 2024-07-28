;00_test.asm
; turns onboard LED on

.include "../m328Pdef.inc"

	ldi r16, 0b00100000

	out DDRB, r16 ; sets 5th bit to output

	out PortB, r16 ; sets 5th bit high
Start:
	rjmp Start
