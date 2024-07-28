;00_test_Bitshift.asm
; turns onboard LED on using the bitshift notation

.include "../m328Pdef.inc"

	ldi r16, (1 << PB5)
	; PB5 = 5 => (1 << 5) => shift 00000001 5 to left => 00100000

	out DDRB, r16 ; sets PB5 to output

	out PortB, r16 ; sets PB5 high
Start:
	rjmp Start
