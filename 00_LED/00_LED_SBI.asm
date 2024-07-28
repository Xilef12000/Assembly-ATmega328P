;00_test_SBI.asm
; turns onboard LED on via setting Bit in I/O Register

.include "../m328Pdef.inc"

	sbi DDRB, PB5 ; set bit PB5 of DDRB high

	sbi PortB, PB5 ; set bit PB5 of DDRB high
Start:
	rjmp Start
