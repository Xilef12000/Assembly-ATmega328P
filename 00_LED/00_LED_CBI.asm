;00_test_SBI.asm
; turns onboard LED off via setting Bit in I/O Register

.include "../m328Pdef.inc"

	sbi DDRB, PB5 ; set bit PB5 of DDRB high

	cbi PortB, PB5 ; set bit PB5 of DDRB low
Start:
	rjmp Start
