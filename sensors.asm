;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Jul  5 2014) (Linux)
; This file was generated Thu Mar 30 10:26:56 2017
;--------------------------------------------------------
	.module sensors
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _segmentMap
	.globl _main
	.globl _tm1637DisplayDecimal
	.globl _tm1637Init
	.globl _InitializeUART
	.globl _InitializeI2C
	.globl _i2c_read_register
	.globl _print_byte_hex
	.globl _i2c_set_start_ack
	.globl _i2c_send_address
	.globl _UARTPrintF
	.globl _i2c_send_reg
	.globl _i2c_set_stop
	.globl _i2c_set_nak
	.globl _i2c_read
	.globl _delay
	.globl _InitializeSystemClock
	.globl _delayTenMicro
	.globl _tm1637SetBrightness
	.globl __tm1637Start
	.globl __tm1637Stop
	.globl __tm1637ReadResult
	.globl __tm1637WriteByte
	.globl __tm1637ClkHigh
	.globl __tm1637ClkLow
	.globl __tm1637DioHigh
	.globl __tm1637DioLow
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int 0x0000 ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	sensors.c: 16: void delayTenMicro (void) {
;	-----------------------------------------
;	 function delayTenMicro
;	-----------------------------------------
_delayTenMicro:
;	sensors.c: 18: for (a = 0; a < 50; ++a)
	ld	a, #0x32
00104$:
;	sensors.c: 19: __asm__("nop");
	nop
	dec	a
;	sensors.c: 18: for (a = 0; a < 50; ++a)
	tnz	a
	jrne	00104$
	ret
;	sensors.c: 22: void InitializeSystemClock() {
;	-----------------------------------------
;	 function InitializeSystemClock
;	-----------------------------------------
_InitializeSystemClock:
;	sensors.c: 23: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
	ldw	x, #0x50c0
	clr	(x)
;	sensors.c: 24: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
	ldw	x, #0x50c0
	ld	a, #0x01
	ld	(x), a
;	sensors.c: 25: CLK_ECKR = 0;                       //  Disable the external clock.
	ldw	x, #0x50c1
	clr	(x)
;	sensors.c: 26: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
00101$:
	ldw	x, #0x50c0
	ld	a, (x)
	bcp	a, #0x02
	jreq	00101$
;	sensors.c: 27: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
	ldw	x, #0x50c6
	clr	(x)
;	sensors.c: 28: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
	ldw	x, #0x50c7
	ld	a, #0xff
	ld	(x), a
;	sensors.c: 29: CLK_PCKENR2 = 0xff;                 //  Ditto.
	ldw	x, #0x50ca
	ld	a, #0xff
	ld	(x), a
;	sensors.c: 30: CLK_CCOR = 0;                       //  Turn off CCO.
	ldw	x, #0x50c9
	clr	(x)
;	sensors.c: 31: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
	ldw	x, #0x50cc
	clr	(x)
;	sensors.c: 32: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
	ldw	x, #0x50cd
	clr	(x)
;	sensors.c: 33: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
	ldw	x, #0x50c4
	ld	a, #0xe1
	ld	(x), a
;	sensors.c: 34: CLK_SWCR = 0;                       //  Reset the clock switch control register.
	ldw	x, #0x50c5
	clr	(x)
;	sensors.c: 35: CLK_SWCR = CLK_SWEN;                //  Enable switching.
	ldw	x, #0x50c5
	ld	a, #0x02
	ld	(x), a
;	sensors.c: 36: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
00104$:
	ldw	x, #0x50c5
	ld	a, (x)
	srl	a
	jrc	00104$
	ret
;	sensors.c: 38: void delay (int time_ms) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	sub	sp, #10
;	sensors.c: 40: for (x = 0; x < 1036*time_ms; ++x)
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
	ldw	x, (0x0d, sp)
	pushw	x
	push	#0x0c
	push	#0x04
	call	__mulint
	addw	sp, #4
	ldw	(0x09, sp), x
00103$:
	ldw	y, (0x09, sp)
	ldw	(0x07, sp), y
	ld	a, (0x07, sp)
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x06, sp), a
	ld	(0x05, sp), a
	ldw	x, (0x03, sp)
	cpw	x, (0x07, sp)
	ld	a, (0x02, sp)
	sbc	a, (0x06, sp)
	ld	a, (0x01, sp)
	sbc	a, (0x05, sp)
	jrsge	00105$
;	sensors.c: 41: __asm__("nop");
	nop
;	sensors.c: 40: for (x = 0; x < 1036*time_ms; ++x)
	ldw	y, (0x03, sp)
	addw	y, #0x0001
	ld	a, (0x02, sp)
	adc	a, #0x00
	ld	xl, a
	ld	a, (0x01, sp)
	adc	a, #0x00
	ld	xh, a
	ldw	(0x03, sp), y
	ldw	(0x01, sp), x
	jra	00103$
00105$:
	addw	sp, #10
	ret
;	sensors.c: 43: void i2c_read (unsigned char *x) {
;	-----------------------------------------
;	 function i2c_read
;	-----------------------------------------
_i2c_read:
;	sensors.c: 44: while ((I2C_SR1 & I2C_RXNE) == 0);
00101$:
	ldw	x, #0x5217
	ld	a, (x)
	bcp	a, #0x40
	jreq	00101$
;	sensors.c: 45: *x = I2C_DR;
	ldw	y, (0x03, sp)
	ldw	x, #0x5216
	ld	a, (x)
	ld	(y), a
	ret
;	sensors.c: 47: void i2c_set_nak (void) {
;	-----------------------------------------
;	 function i2c_set_nak
;	-----------------------------------------
_i2c_set_nak:
;	sensors.c: 48: I2C_CR2 &= ~I2C_ACK;
	ldw	x, #0x5211
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
	ret
;	sensors.c: 50: void i2c_set_stop (void) {
;	-----------------------------------------
;	 function i2c_set_stop
;	-----------------------------------------
_i2c_set_stop:
;	sensors.c: 51: I2C_CR2 |= I2C_STOP;
	ldw	x, #0x5211
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
	ret
;	sensors.c: 53: void i2c_send_reg (UCHAR addr) {
;	-----------------------------------------
;	 function i2c_send_reg
;	-----------------------------------------
_i2c_send_reg:
	sub	sp, #2
;	sensors.c: 55: reg = I2C_SR1;
	ldw	x, #0x5217
	ld	a, (x)
	clrw	x
	ld	xl, a
	ldw	(0x01, sp), x
;	sensors.c: 56: reg = I2C_SR3;
	ldw	x, #0x5219
	ld	a, (x)
	clrw	x
	ld	xl, a
	ldw	(0x01, sp), x
;	sensors.c: 57: I2C_DR = addr;
	ldw	x, #0x5216
	ld	a, (0x05, sp)
	ld	(x), a
;	sensors.c: 58: while ((I2C_SR1 & I2C_TXE) == 0);
00101$:
	ldw	x, #0x5217
	ld	a, (x)
	sll	a
	jrnc	00101$
	addw	sp, #2
	ret
;	sensors.c: 62: void UARTPrintF (char *message) {
;	-----------------------------------------
;	 function UARTPrintF
;	-----------------------------------------
_UARTPrintF:
;	sensors.c: 63: char *ch = message;
	ldw	y, (0x03, sp)
;	sensors.c: 64: while (*ch) {
00104$:
	ld	a, (y)
	tnz	a
	jreq	00107$
;	sensors.c: 65: UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
	ldw	x, #0x5231
	ld	(x), a
;	sensors.c: 66: while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
00101$:
	ldw	x, #0x5230
	ld	a, (x)
	sll	a
	jrnc	00101$
;	sensors.c: 67: ch++;                               //  Grab the next character.
	incw	y
	jra	00104$
00107$:
	ret
;	sensors.c: 73: void i2c_send_address (UCHAR addr, UCHAR mode) {
;	-----------------------------------------
;	 function i2c_send_address
;	-----------------------------------------
_i2c_send_address:
	sub	sp, #3
;	sensors.c: 75: reg = I2C_SR1;
	ldw	x, #0x5217
	ld	a, (x)
	clrw	x
	ld	xl, a
	ldw	(0x01, sp), x
;	sensors.c: 76: I2C_DR = (addr << 1) | mode;
	ld	a, (0x06, sp)
	sll	a
	or	a, (0x07, sp)
	ldw	x, #0x5216
	ld	(x), a
;	sensors.c: 77: if (mode == I2C_READ) {
	ld	a, (0x07, sp)
	cp	a, #0x01
	jrne	00127$
	ld	a, #0x01
	ld	(0x03, sp), a
	jra	00128$
00127$:
	clr	(0x03, sp)
00128$:
	tnz	(0x03, sp)
	jreq	00103$
;	sensors.c: 78: I2C_OARL = 0;
	ldw	x, #0x5213
	clr	(x)
;	sensors.c: 79: I2C_OARH = 0;
	ldw	x, #0x5214
	clr	(x)
;	sensors.c: 82: while ((I2C_SR1 & I2C_ADDR) == 0);
00103$:
;	sensors.c: 75: reg = I2C_SR1;
	ldw	x, #0x5217
	ld	a, (x)
;	sensors.c: 82: while ((I2C_SR1 & I2C_ADDR) == 0);
	bcp	a, #0x02
	jreq	00103$
;	sensors.c: 83: if (mode == I2C_READ)
	tnz	(0x03, sp)
	jreq	00108$
;	sensors.c: 84: UNSET (I2C_SR1, I2C_ADDR);
	and	a, #0xfd
	ldw	x, #0x5217
	ld	(x), a
00108$:
	addw	sp, #3
	ret
;	sensors.c: 87: void i2c_set_start_ack (void) {
;	-----------------------------------------
;	 function i2c_set_start_ack
;	-----------------------------------------
_i2c_set_start_ack:
;	sensors.c: 88: I2C_CR2 = I2C_ACK | I2C_START;
	ldw	x, #0x5211
	ld	a, #0x05
	ld	(x), a
;	sensors.c: 89: while ((I2C_SR1 & I2C_SB) == 0);
00101$:
	ldw	x, #0x5217
	ld	a, (x)
	srl	a
	jrnc	00101$
	ret
;	sensors.c: 96: void print_byte_hex (unsigned char buffer) {
;	-----------------------------------------
;	 function print_byte_hex
;	-----------------------------------------
_print_byte_hex:
	sub	sp, #12
;	sensors.c: 99: a = (buffer >> 4);
	ld	a, (0x0f, sp)
	swap	a
	and	a, #0x0f
	clrw	x
	ld	xl, a
;	sensors.c: 100: if (a > 9)
	cpw	x, #0x0009
	jrsle	00102$
;	sensors.c: 101: a = a + 'a' - 10;
	addw	x, #0x0057
	ldw	(0x0b, sp), x
	jra	00103$
00102$:
;	sensors.c: 103: a += '0'; 
	addw	x, #0x0030
	ldw	(0x0b, sp), x
00103$:
;	sensors.c: 104: b = buffer & 0x0f;
	ld	a, (0x0f, sp)
	and	a, #0x0f
	clrw	x
	ld	xl, a
;	sensors.c: 105: if (b > 9)
	cpw	x, #0x0009
	jrsle	00105$
;	sensors.c: 106: b = b + 'a' - 10;
	addw	x, #0x0057
	ldw	(0x09, sp), x
	jra	00106$
00105$:
;	sensors.c: 108: b += '0'; 
	addw	x, #0x0030
	ldw	(0x09, sp), x
00106$:
;	sensors.c: 109: message[0] = a;
	ldw	y, sp
	incw	y
	ld	a, (0x0c, sp)
	ld	(y), a
;	sensors.c: 110: message[1] = b;
	ldw	x, y
	incw	x
	ld	a, (0x0a, sp)
	ld	(x), a
;	sensors.c: 111: message[2] = 0;
	ldw	x, y
	incw	x
	incw	x
	clr	(x)
;	sensors.c: 112: UARTPrintF (message);
	pushw	y
	call	_UARTPrintF
	addw	sp, #2
	addw	sp, #12
	ret
;	sensors.c: 116: unsigned char i2c_read_register (UCHAR addr, UCHAR rg) {
;	-----------------------------------------
;	 function i2c_read_register
;	-----------------------------------------
_i2c_read_register:
	sub	sp, #2
;	sensors.c: 119: i2c_set_start_ack ();
	call	_i2c_set_start_ack
;	sensors.c: 120: i2c_send_address (addr, I2C_WRITE);
	push	#0x00
	ld	a, (0x06, sp)
	push	a
	call	_i2c_send_address
	addw	sp, #2
;	sensors.c: 121: i2c_send_reg (rg);
	ld	a, (0x06, sp)
	push	a
	call	_i2c_send_reg
	pop	a
;	sensors.c: 122: i2c_set_start_ack ();
	call	_i2c_set_start_ack
;	sensors.c: 123: i2c_send_address (addr, I2C_READ);
	push	#0x01
	ld	a, (0x06, sp)
	push	a
	call	_i2c_send_address
	addw	sp, #2
;	sensors.c: 124: reg = I2C_SR1;
	ldw	x, #0x5217
	ld	a, (x)
	ld	(0x01, sp), a
;	sensors.c: 125: reg = I2C_SR3;
	ldw	x, #0x5219
	ld	a, (x)
	ld	(0x01, sp), a
;	sensors.c: 126: i2c_set_nak ();
	call	_i2c_set_nak
;	sensors.c: 127: i2c_set_stop ();
	call	_i2c_set_stop
;	sensors.c: 128: i2c_read (&x);
	ldw	x, sp
	incw	x
	incw	x
	pushw	x
	call	_i2c_read
	addw	sp, #2
;	sensors.c: 129: return (x);
	ld	a, (0x02, sp)
	addw	sp, #2
	ret
;	sensors.c: 132: void InitializeI2C (void) {
;	-----------------------------------------
;	 function InitializeI2C
;	-----------------------------------------
_InitializeI2C:
;	sensors.c: 133: I2C_CR1 = 0;   //  Disable I2C before configuration starts. PE bit is bit 0
	ldw	x, #0x5210
	clr	(x)
;	sensors.c: 137: I2C_FREQR = 16;                     //  Set the internal clock frequency (MHz).
	ldw	x, #0x5212
	ld	a, #0x10
	ld	(x), a
;	sensors.c: 138: UNSET (I2C_CCRH, I2C_FS);           //  I2C running is standard mode.
	bres	0x521c, #7
;	sensors.c: 140: I2C_CCRL = 0xa0;                    //  SCL clock speed is 50 kHz.
	ldw	x, #0x521b
	ld	a, #0xa0
	ld	(x), a
;	sensors.c: 142: I2C_CCRH &= 0x00;	// Clears lower 4 bits "CCR"
	ldw	x, #0x521c
	clr	(x)
;	sensors.c: 146: UNSET (I2C_OARH, I2C_ADDMODE);      //  7 bit address mode.
	bres	0x5214, #7
;	sensors.c: 147: SET (I2C_OARH, I2C_ADDCONF);        //  Docs say this must always be 1.
	ldw	x, #0x5214
	ld	a, (x)
	or	a, #0x40
	ld	(x), a
;	sensors.c: 151: I2C_TRISER = 17;
	ldw	x, #0x521d
	ld	a, #0x11
	ld	(x), a
;	sensors.c: 159: I2C_CR1 = I2C_PE;	// Enables port
	ldw	x, #0x5210
	ld	a, #0x01
	ld	(x), a
	ret
;	sensors.c: 165: void InitializeUART() {
;	-----------------------------------------
;	 function InitializeUART
;	-----------------------------------------
_InitializeUART:
;	sensors.c: 175: UART1_CR1 = 0;
	ldw	x, #0x5234
	clr	(x)
;	sensors.c: 176: UART1_CR2 = 0;
	ldw	x, #0x5235
	clr	(x)
;	sensors.c: 177: UART1_CR4 = 0;
	ldw	x, #0x5237
	clr	(x)
;	sensors.c: 178: UART1_CR3 = 0;
	ldw	x, #0x5236
	clr	(x)
;	sensors.c: 179: UART1_CR5 = 0;
	ldw	x, #0x5238
	clr	(x)
;	sensors.c: 180: UART1_GTR = 0;
	ldw	x, #0x5239
	clr	(x)
;	sensors.c: 181: UART1_PSCR = 0;
	ldw	x, #0x523a
	clr	(x)
;	sensors.c: 185: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	sensors.c: 186: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	sensors.c: 187: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
;	sensors.c: 188: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	sensors.c: 189: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
	ldw	x, #0x5233
	ld	a, #0x0a
	ld	(x), a
;	sensors.c: 190: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
	ldw	x, #0x5232
	ld	a, #0x08
	ld	(x), a
;	sensors.c: 194: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	sensors.c: 195: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	sensors.c: 199: SET (UART1_CR3, CR3_CPOL);
	ldw	x, #0x5236
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	sensors.c: 200: SET (UART1_CR3, CR3_CPHA);
	ldw	x, #0x5236
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	sensors.c: 201: SET (UART1_CR3, CR3_LBCL);
	bset	0x5236, #0
;	sensors.c: 205: SET (UART1_CR2, CR2_TEN);
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	sensors.c: 206: SET (UART1_CR2, CR2_REN);
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	sensors.c: 207: UART1_CR3 = CR3_CLKEN;
	ldw	x, #0x5236
	ld	a, #0x08
	ld	(x), a
	ret
;	sensors.c: 235: void tm1637Init(void)
;	-----------------------------------------
;	 function tm1637Init
;	-----------------------------------------
_tm1637Init:
;	sensors.c: 237: tm1637SetBrightness(8);
	push	#0x08
	call	_tm1637SetBrightness
	pop	a
	ret
;	sensors.c: 242: void tm1637DisplayDecimal(long TT,unsigned int displaySeparator)
;	-----------------------------------------
;	 function tm1637DisplayDecimal
;	-----------------------------------------
_tm1637DisplayDecimal:
	sub	sp, #19
;	sensors.c: 244: unsigned int v = TT & 0x0000FFFF;
	ld	a, (0x19, sp)
	ld	xl, a
	ld	a, (0x18, sp)
	ld	xh, a
	clr	(0x0d, sp)
	clr	a
	ldw	(0x07, sp), x
;	sensors.c: 250: for (ii = 0; ii < 4; ++ii) {
	ldw	x, sp
	incw	x
	ldw	(0x10, sp), x
	ldw	x, #_segmentMap+0
	ldw	(0x12, sp), x
	clrw	y
00106$:
;	sensors.c: 251: digitArr[ii] = segmentMap[v % 10];
	ldw	x, y
	addw	x, (0x10, sp)
	ldw	(0x09, sp), x
	pushw	y
	ldw	x, (0x09, sp)
	ldw	y, #0x000a
	divw	x, y
	ldw	x, y
	popw	y
	addw	x, (0x12, sp)
	ld	a, (x)
	ldw	x, (0x09, sp)
	ld	(x), a
;	sensors.c: 252: if (ii == 2 && displaySeparator) {
	cpw	y, #0x0002
	jrne	00102$
	ldw	x, (0x1a, sp)
	jreq	00102$
;	sensors.c: 253: digitArr[ii] |= 1 << 7;
	ldw	x, (0x09, sp)
	ld	a, (x)
	or	a, #0x80
	ldw	x, (0x09, sp)
	ld	(x), a
00102$:
;	sensors.c: 255: v /= 10;
	pushw	y
	ldw	x, (0x09, sp)
	ldw	y, #0x000a
	divw	x, y
	popw	y
	ldw	(0x07, sp), x
;	sensors.c: 250: for (ii = 0; ii < 4; ++ii) {
	incw	y
	cpw	y, #0x0004
	jrc	00106$
;	sensors.c: 258: _tm1637Start();
	call	__tm1637Start
;	sensors.c: 259: _tm1637WriteByte(0x40);
	push	#0x40
	call	__tm1637WriteByte
	pop	a
;	sensors.c: 260: _tm1637ReadResult();
	call	__tm1637ReadResult
;	sensors.c: 261: _tm1637Stop();
	call	__tm1637Stop
;	sensors.c: 263: _tm1637Start();
	call	__tm1637Start
;	sensors.c: 264: _tm1637WriteByte(0xc0);
	push	#0xc0
	call	__tm1637WriteByte
	pop	a
;	sensors.c: 265: _tm1637ReadResult();
	call	__tm1637ReadResult
;	sensors.c: 267: for (ii = 0; ii < 4; ++ii) {
	clrw	x
	ldw	(0x05, sp), x
00108$:
;	sensors.c: 268: _tm1637WriteByte(digitArr[3 - ii]);
	ld	a, (0x06, sp)
	ld	(0x0b, sp), a
	ld	a, #0x03
	sub	a, (0x0b, sp)
	clrw	x
	ld	xl, a
	addw	x, (0x10, sp)
	ld	a, (x)
	push	a
	call	__tm1637WriteByte
	pop	a
;	sensors.c: 269: _tm1637ReadResult();
	call	__tm1637ReadResult
;	sensors.c: 267: for (ii = 0; ii < 4; ++ii) {
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x05, sp), x
	ldw	x, (0x05, sp)
	cpw	x, #0x0004
	jrc	00108$
;	sensors.c: 272: _tm1637Stop();
	call	__tm1637Stop
	addw	sp, #19
	ret
;	sensors.c: 277: void tm1637SetBrightness(char brightness)
;	-----------------------------------------
;	 function tm1637SetBrightness
;	-----------------------------------------
_tm1637SetBrightness:
;	sensors.c: 284: _tm1637Start();
	call	__tm1637Start
;	sensors.c: 285: _tm1637WriteByte(0x87 + brightness);
	ld	a, (0x03, sp)
	add	a, #0x87
	push	a
	call	__tm1637WriteByte
	pop	a
;	sensors.c: 286: _tm1637ReadResult();
	call	__tm1637ReadResult
;	sensors.c: 287: _tm1637Stop();
	jp	__tm1637Stop
;	sensors.c: 290: void _tm1637Start(void)
;	-----------------------------------------
;	 function _tm1637Start
;	-----------------------------------------
__tm1637Start:
;	sensors.c: 292: _tm1637ClkHigh();
	call	__tm1637ClkHigh
;	sensors.c: 293: _tm1637DioHigh();
	call	__tm1637DioHigh
;	sensors.c: 294: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	sensors.c: 295: _tm1637DioLow();
	jp	__tm1637DioLow
;	sensors.c: 298: void _tm1637Stop(void)
;	-----------------------------------------
;	 function _tm1637Stop
;	-----------------------------------------
__tm1637Stop:
;	sensors.c: 300: _tm1637ClkLow();
	call	__tm1637ClkLow
;	sensors.c: 301: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	sensors.c: 302: _tm1637DioLow();
	call	__tm1637DioLow
;	sensors.c: 303: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	sensors.c: 304: _tm1637ClkHigh();
	call	__tm1637ClkHigh
;	sensors.c: 305: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	sensors.c: 306: _tm1637DioHigh();
	jp	__tm1637DioHigh
;	sensors.c: 309: void _tm1637ReadResult(void)
;	-----------------------------------------
;	 function _tm1637ReadResult
;	-----------------------------------------
__tm1637ReadResult:
;	sensors.c: 311: _tm1637ClkLow();
	call	__tm1637ClkLow
;	sensors.c: 312: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	sensors.c: 314: _tm1637ClkHigh();
	call	__tm1637ClkHigh
;	sensors.c: 315: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	sensors.c: 316: _tm1637ClkLow();
	jp	__tm1637ClkLow
;	sensors.c: 319: void _tm1637WriteByte(unsigned char b)
;	-----------------------------------------
;	 function _tm1637WriteByte
;	-----------------------------------------
__tm1637WriteByte:
	sub	sp, #2
;	sensors.c: 321: for (ii = 0; ii < 8; ++ii) {
	clrw	x
	ldw	(0x01, sp), x
00105$:
;	sensors.c: 322: _tm1637ClkLow();
	call	__tm1637ClkLow
;	sensors.c: 323: if (b & 0x01) {
	ld	a, (0x05, sp)
	srl	a
	jrnc	00102$
;	sensors.c: 324: _tm1637DioHigh();
	call	__tm1637DioHigh
	jra	00103$
00102$:
;	sensors.c: 327: _tm1637DioLow();
	call	__tm1637DioLow
00103$:
;	sensors.c: 329: delay(15);
	push	#0x0f
	push	#0x00
	call	_delay
	addw	sp, #2
;	sensors.c: 330: b >>= 1;
	ld	a, (0x05, sp)
	srl	a
	ld	(0x05, sp), a
;	sensors.c: 331: _tm1637ClkHigh();
	call	__tm1637ClkHigh
;	sensors.c: 332: delay(15);
	push	#0x0f
	push	#0x00
	call	_delay
	addw	sp, #2
;	sensors.c: 321: for (ii = 0; ii < 8; ++ii) {
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	cpw	x, #0x0008
	jrslt	00105$
	addw	sp, #2
	ret
;	sensors.c: 338: void _tm1637ClkHigh(void)
;	-----------------------------------------
;	 function _tm1637ClkHigh
;	-----------------------------------------
__tm1637ClkHigh:
;	sensors.c: 343: PD_ODR |= 1 << 2;
	ldw	x, #0x500f
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
	ret
;	sensors.c: 346: void _tm1637ClkLow(void)
;	-----------------------------------------
;	 function _tm1637ClkLow
;	-----------------------------------------
__tm1637ClkLow:
;	sensors.c: 350: PD_ODR &= ~(1 << 2);
	ldw	x, #0x500f
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
	ret
;	sensors.c: 356: void _tm1637DioHigh(void)
;	-----------------------------------------
;	 function _tm1637DioHigh
;	-----------------------------------------
__tm1637DioHigh:
;	sensors.c: 360: PD_ODR |= 1 << 3;
	ldw	x, #0x500f
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
	ret
;	sensors.c: 364: void _tm1637DioLow(void)
;	-----------------------------------------
;	 function _tm1637DioLow
;	-----------------------------------------
__tm1637DioLow:
;	sensors.c: 366: PD_ODR &= ~(1 << 3);
	ldw	x, #0x500f
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
	ret
;	sensors.c: 380: int main () {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #28
;	sensors.c: 387: InitializeSystemClock();
	call	_InitializeSystemClock
;	sensors.c: 390: PD_DDR = (1 << 3) | (1 << 2); // output mode
	ldw	x, #0x5011
	ld	a, #0x0c
	ld	(x), a
;	sensors.c: 391: PD_CR1 = (1 << 3) | (1 << 2); // push-pull
	ldw	x, #0x5012
	ld	a, #0x0c
	ld	(x), a
;	sensors.c: 392: PD_CR2 = (1 << 3) | (1 << 2); // up to 10MHz speed
	ldw	x, #0x5013
	ld	a, #0x0c
	ld	(x), a
;	sensors.c: 393: tm1637Init();
	call	_tm1637Init
;	sensors.c: 395: InitializeUART();
	call	_InitializeUART
;	sensors.c: 396: InitializeI2C();
	call	_InitializeI2C
;	sensors.c: 399: while (1) {
00114$:
;	sensors.c: 401: i2c_set_start_ack ();
	call	_i2c_set_start_ack
;	sensors.c: 402: i2c_send_address (MLX90614_ADDR, I2C_WRITE);
	push	#0x00
	push	#0x5a
	call	_i2c_send_address
	addw	sp, #2
;	sensors.c: 403: i2c_send_reg(0x07); // object temperature		
	push	#0x07
	call	_i2c_send_reg
	pop	a
;	sensors.c: 405: i2c_set_start_ack ();
	call	_i2c_set_start_ack
;	sensors.c: 406: i2c_send_address (MLX90614_ADDR, I2C_READ);
	push	#0x01
	push	#0x5a
	call	_i2c_send_address
	addw	sp, #2
;	sensors.c: 407: reg = I2C_SR1;
	ldw	x, #0x5217
	ld	a, (x)
	clrw	x
	ld	xl, a
	ldw	(0x0c, sp), x
;	sensors.c: 408: reg = I2C_SR3;
	ldw	x, #0x5219
	ld	a, (x)
	clrw	x
	ld	xl, a
	ldw	(0x0c, sp), x
;	sensors.c: 410: i2c_set_nak();
	call	_i2c_set_nak
;	sensors.c: 412: i2c_read (&x);
	ldw	x, sp
	addw	x, #14
	ldw	y, x
	pushw	x
	pushw	y
	call	_i2c_read
	addw	sp, #2
	popw	x
;	sensors.c: 413: p1=x;
	ld	a, (0x0e, sp)
	ld	(0x0b, sp), a
;	sensors.c: 414: i2c_read (&x);
	pushw	x
	call	_i2c_read
	addw	sp, #2
;	sensors.c: 415: p2=x;
	ld	a, (0x0e, sp)
;	sensors.c: 416: i2c_set_stop ();
	push	a
	call	_i2c_set_stop
	pop	a
;	sensors.c: 418: objTemp = ((((p2&0x007f)<<8)+p1)*2)-27315; //subtract kelvin for celcius
	and	a, #0x7f
	clrw	x
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ld	a, (0x0b, sp)
	ld	(0x16, sp), a
	ld	a, (0x16, sp)
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x15, sp), a
	addw	x, (0x15, sp)
	sllw	x
	subw	x, #0x6ab3
	pushw	x
	call	___sint2fs
	addw	sp, #2
	ldw	(0x09, sp), x
	ldw	(0x07, sp), y
;	sensors.c: 421: while (objTemp > 1000) {
	clrw	x
	ldw	(0x01, sp), x
00101$:
	clrw	x
	pushw	x
	push	#0x7a
	push	#0x44
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	call	___fsgt
	addw	sp, #8
	tnz	a
	jreq	00127$
;	sensors.c: 422: vierde+=1;
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
;	sensors.c: 423: objTemp-=1000;
	clrw	x
	pushw	x
	push	#0x7a
	push	#0x44
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x09, sp), x
	ldw	(0x07, sp), y
	jra	00101$
;	sensors.c: 425: while (objTemp > 100) {
00127$:
	ldw	y, (0x01, sp)
	ldw	(0x13, sp), y
	clrw	x
	ldw	(0x03, sp), x
00104$:
	clrw	x
	pushw	x
	push	#0xc8
	push	#0x42
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	call	___fsgt
	addw	sp, #8
	tnz	a
	jreq	00128$
;	sensors.c: 426: derde+=1;
	ldw	x, (0x03, sp)
	incw	x
	ldw	(0x03, sp), x
;	sensors.c: 427: objTemp-=100;
	clrw	x
	pushw	x
	push	#0xc8
	push	#0x42
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x09, sp), x
	ldw	(0x07, sp), y
	jra	00104$
;	sensors.c: 429: while (objTemp > 10) {
00128$:
	ldw	y, (0x03, sp)
	ldw	(0x11, sp), y
	clrw	x
	ldw	(0x05, sp), x
00107$:
	clrw	x
	pushw	x
	push	#0x20
	push	#0x41
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	call	___fsgt
	addw	sp, #8
	tnz	a
	jreq	00129$
;	sensors.c: 430: tweede+=1;
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x05, sp), x
;	sensors.c: 431: objTemp-=10;
	clrw	x
	pushw	x
	push	#0x20
	push	#0x41
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x09, sp), x
	ldw	(0x07, sp), y
	jra	00107$
;	sensors.c: 433: while (objTemp > 0)
00129$:
	ldw	y, (0x05, sp)
	ldw	(0x1b, sp), y
	clrw	x
	ldw	(0x0f, sp), x
00110$:
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	call	___fsgt
	addw	sp, #8
	tnz	a
	jreq	00112$
;	sensors.c: 435: eerste+=1;
	ldw	x, (0x0f, sp)
	incw	x
	ldw	(0x0f, sp), x
;	sensors.c: 436: objTemp-=1;
	clrw	x
	pushw	x
	push	#0x80
	push	#0x3f
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x0d, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x09, sp), x
	ldw	(0x07, sp), y
	jra	00110$
00112$:
;	sensors.c: 439: utemp=vierde*1000+derde*100+tweede*10+eerste;
	ldw	x, (0x13, sp)
	pushw	x
	push	#0xe8
	push	#0x03
	call	__mulint
	addw	sp, #4
	ldw	(0x19, sp), x
	ldw	x, (0x11, sp)
	pushw	x
	push	#0x64
	push	#0x00
	call	__mulint
	addw	sp, #4
	addw	x, (0x19, sp)
	ldw	(0x17, sp), x
	ldw	x, (0x1b, sp)
	pushw	x
	push	#0x0a
	push	#0x00
	call	__mulint
	addw	sp, #4
	addw	x, (0x17, sp)
	addw	x, (0x0f, sp)
	clrw	y
	tnzw	x
	jrpl	00162$
	decw	y
00162$:
;	sensors.c: 442: tm1637DisplayDecimal(utemp, 1); // eg 37:12
	push	#0x01
	push	#0x00
	pushw	x
	pushw	y
	call	_tm1637DisplayDecimal
	addw	sp, #6
;	sensors.c: 445: delayTenMicro();
	call	_delayTenMicro
	jp	00114$
	addw	sp, #28
	ret
	.area CODE
_segmentMap:
	.db #0x3F	;  63
	.db #0x06	;  6
	.db #0x5B	;  91
	.db #0x4F	;  79	'O'
	.db #0x66	;  102	'f'
	.db #0x6D	;  109	'm'
	.db #0x7D	;  125
	.db #0x07	;  7
	.db #0x7F	;  127
	.db #0x6F	;  111	'o'
	.db #0x77	;  119	'w'
	.db #0x7C	;  124
	.db #0x39	;  57	'9'
	.db #0x5E	;  94
	.db #0x79	;  121	'y'
	.db #0x71	;  113	'q'
	.db #0x00	;  0
	.area INITIALIZER
	.area CABS (ABS)
