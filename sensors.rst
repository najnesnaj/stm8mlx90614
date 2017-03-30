                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.4.0 #8981 (Jul  5 2014) (Linux)
                                      4 ; This file was generated Thu Mar 30 10:26:56 2017
                                      5 ;--------------------------------------------------------
                                      6 	.module sensors
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _segmentMap
                                     13 	.globl _main
                                     14 	.globl _tm1637DisplayDecimal
                                     15 	.globl _tm1637Init
                                     16 	.globl _InitializeUART
                                     17 	.globl _InitializeI2C
                                     18 	.globl _i2c_read_register
                                     19 	.globl _print_byte_hex
                                     20 	.globl _i2c_set_start_ack
                                     21 	.globl _i2c_send_address
                                     22 	.globl _UARTPrintF
                                     23 	.globl _i2c_send_reg
                                     24 	.globl _i2c_set_stop
                                     25 	.globl _i2c_set_nak
                                     26 	.globl _i2c_read
                                     27 	.globl _delay
                                     28 	.globl _InitializeSystemClock
                                     29 	.globl _delayTenMicro
                                     30 	.globl _tm1637SetBrightness
                                     31 	.globl __tm1637Start
                                     32 	.globl __tm1637Stop
                                     33 	.globl __tm1637ReadResult
                                     34 	.globl __tm1637WriteByte
                                     35 	.globl __tm1637ClkHigh
                                     36 	.globl __tm1637ClkLow
                                     37 	.globl __tm1637DioHigh
                                     38 	.globl __tm1637DioLow
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area DATA
                                     43 ;--------------------------------------------------------
                                     44 ; ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area INITIALIZED
                                     47 ;--------------------------------------------------------
                                     48 ; Stack segment in internal ram 
                                     49 ;--------------------------------------------------------
                                     50 	.area	SSEG
      000000                         51 __start__stack:
      000000                         52 	.ds	1
                                     53 
                                     54 ;--------------------------------------------------------
                                     55 ; absolute external ram data
                                     56 ;--------------------------------------------------------
                                     57 	.area DABS (ABS)
                                     58 ;--------------------------------------------------------
                                     59 ; interrupt vector 
                                     60 ;--------------------------------------------------------
                                     61 	.area HOME
      008000                         62 __interrupt_vect:
      008000 82 00 80 83             63 	int s_GSINIT ;reset
      008004 82 00 00 00             64 	int 0x0000 ;trap
      008008 82 00 00 00             65 	int 0x0000 ;int0
      00800C 82 00 00 00             66 	int 0x0000 ;int1
      008010 82 00 00 00             67 	int 0x0000 ;int2
      008014 82 00 00 00             68 	int 0x0000 ;int3
      008018 82 00 00 00             69 	int 0x0000 ;int4
      00801C 82 00 00 00             70 	int 0x0000 ;int5
      008020 82 00 00 00             71 	int 0x0000 ;int6
      008024 82 00 00 00             72 	int 0x0000 ;int7
      008028 82 00 00 00             73 	int 0x0000 ;int8
      00802C 82 00 00 00             74 	int 0x0000 ;int9
      008030 82 00 00 00             75 	int 0x0000 ;int10
      008034 82 00 00 00             76 	int 0x0000 ;int11
      008038 82 00 00 00             77 	int 0x0000 ;int12
      00803C 82 00 00 00             78 	int 0x0000 ;int13
      008040 82 00 00 00             79 	int 0x0000 ;int14
      008044 82 00 00 00             80 	int 0x0000 ;int15
      008048 82 00 00 00             81 	int 0x0000 ;int16
      00804C 82 00 00 00             82 	int 0x0000 ;int17
      008050 82 00 00 00             83 	int 0x0000 ;int18
      008054 82 00 00 00             84 	int 0x0000 ;int19
      008058 82 00 00 00             85 	int 0x0000 ;int20
      00805C 82 00 00 00             86 	int 0x0000 ;int21
      008060 82 00 00 00             87 	int 0x0000 ;int22
      008064 82 00 00 00             88 	int 0x0000 ;int23
      008068 82 00 00 00             89 	int 0x0000 ;int24
      00806C 82 00 00 00             90 	int 0x0000 ;int25
      008070 82 00 00 00             91 	int 0x0000 ;int26
      008074 82 00 00 00             92 	int 0x0000 ;int27
      008078 82 00 00 00             93 	int 0x0000 ;int28
      00807C 82 00 00 00             94 	int 0x0000 ;int29
                                     95 ;--------------------------------------------------------
                                     96 ; global & static initialisations
                                     97 ;--------------------------------------------------------
                                     98 	.area HOME
                                     99 	.area GSINIT
                                    100 	.area GSFINAL
                                    101 	.area GSINIT
      008083                        102 __sdcc_gs_init_startup:
      008083                        103 __sdcc_init_data:
                                    104 ; stm8_genXINIT() start
      008083 AE 00 00         [ 2]  105 	ldw x, #l_DATA
      008086 27 07            [ 1]  106 	jreq	00002$
      008088                        107 00001$:
      008088 72 4F 00 00      [ 1]  108 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  109 	decw x
      00808D 26 F9            [ 1]  110 	jrne	00001$
      00808F                        111 00002$:
      00808F AE 00 00         [ 2]  112 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  113 	jreq	00004$
      008094                        114 00003$:
      008094 D6 8C 94         [ 1]  115 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 00         [ 1]  116 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  117 	decw	x
      00809B 26 F7            [ 1]  118 	jrne	00003$
      00809D                        119 00004$:
                                    120 ; stm8_genXINIT() end
                                    121 	.area GSFINAL
      00809D CC 80 80         [ 2]  122 	jp	__sdcc_program_startup
                                    123 ;--------------------------------------------------------
                                    124 ; Home
                                    125 ;--------------------------------------------------------
                                    126 	.area HOME
                                    127 	.area HOME
      008080                        128 __sdcc_program_startup:
      008080 CC 84 88         [ 2]  129 	jp	_main
                                    130 ;	return from main will return to caller
                                    131 ;--------------------------------------------------------
                                    132 ; code
                                    133 ;--------------------------------------------------------
                                    134 	.area CODE
                                    135 ;	sensors.c: 16: void delayTenMicro (void) {
                                    136 ;	-----------------------------------------
                                    137 ;	 function delayTenMicro
                                    138 ;	-----------------------------------------
      0080A0                        139 _delayTenMicro:
                                    140 ;	sensors.c: 18: for (a = 0; a < 50; ++a)
      0080A0 A6 32            [ 1]  141 	ld	a, #0x32
      0080A2                        142 00104$:
                                    143 ;	sensors.c: 19: __asm__("nop");
      0080A2 9D               [ 1]  144 	nop
      0080A3 4A               [ 1]  145 	dec	a
                                    146 ;	sensors.c: 18: for (a = 0; a < 50; ++a)
      0080A4 4D               [ 1]  147 	tnz	a
      0080A5 26 FB            [ 1]  148 	jrne	00104$
      0080A7 81               [ 4]  149 	ret
                                    150 ;	sensors.c: 22: void InitializeSystemClock() {
                                    151 ;	-----------------------------------------
                                    152 ;	 function InitializeSystemClock
                                    153 ;	-----------------------------------------
      0080A8                        154 _InitializeSystemClock:
                                    155 ;	sensors.c: 23: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
      0080A8 AE 50 C0         [ 2]  156 	ldw	x, #0x50c0
      0080AB 7F               [ 1]  157 	clr	(x)
                                    158 ;	sensors.c: 24: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
      0080AC AE 50 C0         [ 2]  159 	ldw	x, #0x50c0
      0080AF A6 01            [ 1]  160 	ld	a, #0x01
      0080B1 F7               [ 1]  161 	ld	(x), a
                                    162 ;	sensors.c: 25: CLK_ECKR = 0;                       //  Disable the external clock.
      0080B2 AE 50 C1         [ 2]  163 	ldw	x, #0x50c1
      0080B5 7F               [ 1]  164 	clr	(x)
                                    165 ;	sensors.c: 26: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
      0080B6                        166 00101$:
      0080B6 AE 50 C0         [ 2]  167 	ldw	x, #0x50c0
      0080B9 F6               [ 1]  168 	ld	a, (x)
      0080BA A5 02            [ 1]  169 	bcp	a, #0x02
      0080BC 27 F8            [ 1]  170 	jreq	00101$
                                    171 ;	sensors.c: 27: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
      0080BE AE 50 C6         [ 2]  172 	ldw	x, #0x50c6
      0080C1 7F               [ 1]  173 	clr	(x)
                                    174 ;	sensors.c: 28: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
      0080C2 AE 50 C7         [ 2]  175 	ldw	x, #0x50c7
      0080C5 A6 FF            [ 1]  176 	ld	a, #0xff
      0080C7 F7               [ 1]  177 	ld	(x), a
                                    178 ;	sensors.c: 29: CLK_PCKENR2 = 0xff;                 //  Ditto.
      0080C8 AE 50 CA         [ 2]  179 	ldw	x, #0x50ca
      0080CB A6 FF            [ 1]  180 	ld	a, #0xff
      0080CD F7               [ 1]  181 	ld	(x), a
                                    182 ;	sensors.c: 30: CLK_CCOR = 0;                       //  Turn off CCO.
      0080CE AE 50 C9         [ 2]  183 	ldw	x, #0x50c9
      0080D1 7F               [ 1]  184 	clr	(x)
                                    185 ;	sensors.c: 31: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
      0080D2 AE 50 CC         [ 2]  186 	ldw	x, #0x50cc
      0080D5 7F               [ 1]  187 	clr	(x)
                                    188 ;	sensors.c: 32: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
      0080D6 AE 50 CD         [ 2]  189 	ldw	x, #0x50cd
      0080D9 7F               [ 1]  190 	clr	(x)
                                    191 ;	sensors.c: 33: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
      0080DA AE 50 C4         [ 2]  192 	ldw	x, #0x50c4
      0080DD A6 E1            [ 1]  193 	ld	a, #0xe1
      0080DF F7               [ 1]  194 	ld	(x), a
                                    195 ;	sensors.c: 34: CLK_SWCR = 0;                       //  Reset the clock switch control register.
      0080E0 AE 50 C5         [ 2]  196 	ldw	x, #0x50c5
      0080E3 7F               [ 1]  197 	clr	(x)
                                    198 ;	sensors.c: 35: CLK_SWCR = CLK_SWEN;                //  Enable switching.
      0080E4 AE 50 C5         [ 2]  199 	ldw	x, #0x50c5
      0080E7 A6 02            [ 1]  200 	ld	a, #0x02
      0080E9 F7               [ 1]  201 	ld	(x), a
                                    202 ;	sensors.c: 36: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
      0080EA                        203 00104$:
      0080EA AE 50 C5         [ 2]  204 	ldw	x, #0x50c5
      0080ED F6               [ 1]  205 	ld	a, (x)
      0080EE 44               [ 1]  206 	srl	a
      0080EF 25 F9            [ 1]  207 	jrc	00104$
      0080F1 81               [ 4]  208 	ret
                                    209 ;	sensors.c: 38: void delay (int time_ms) {
                                    210 ;	-----------------------------------------
                                    211 ;	 function delay
                                    212 ;	-----------------------------------------
      0080F2                        213 _delay:
      0080F2 52 0A            [ 2]  214 	sub	sp, #10
                                    215 ;	sensors.c: 40: for (x = 0; x < 1036*time_ms; ++x)
      0080F4 5F               [ 1]  216 	clrw	x
      0080F5 1F 03            [ 2]  217 	ldw	(0x03, sp), x
      0080F7 1F 01            [ 2]  218 	ldw	(0x01, sp), x
      0080F9 1E 0D            [ 2]  219 	ldw	x, (0x0d, sp)
      0080FB 89               [ 2]  220 	pushw	x
      0080FC 4B 0C            [ 1]  221 	push	#0x0c
      0080FE 4B 04            [ 1]  222 	push	#0x04
      008100 CD 87 85         [ 4]  223 	call	__mulint
      008103 5B 04            [ 2]  224 	addw	sp, #4
      008105 1F 09            [ 2]  225 	ldw	(0x09, sp), x
      008107                        226 00103$:
      008107 16 09            [ 2]  227 	ldw	y, (0x09, sp)
      008109 17 07            [ 2]  228 	ldw	(0x07, sp), y
      00810B 7B 07            [ 1]  229 	ld	a, (0x07, sp)
      00810D 49               [ 1]  230 	rlc	a
      00810E 4F               [ 1]  231 	clr	a
      00810F A2 00            [ 1]  232 	sbc	a, #0x00
      008111 6B 06            [ 1]  233 	ld	(0x06, sp), a
      008113 6B 05            [ 1]  234 	ld	(0x05, sp), a
      008115 1E 03            [ 2]  235 	ldw	x, (0x03, sp)
      008117 13 07            [ 2]  236 	cpw	x, (0x07, sp)
      008119 7B 02            [ 1]  237 	ld	a, (0x02, sp)
      00811B 12 06            [ 1]  238 	sbc	a, (0x06, sp)
      00811D 7B 01            [ 1]  239 	ld	a, (0x01, sp)
      00811F 12 05            [ 1]  240 	sbc	a, (0x05, sp)
      008121 2E 17            [ 1]  241 	jrsge	00105$
                                    242 ;	sensors.c: 41: __asm__("nop");
      008123 9D               [ 1]  243 	nop
                                    244 ;	sensors.c: 40: for (x = 0; x < 1036*time_ms; ++x)
      008124 16 03            [ 2]  245 	ldw	y, (0x03, sp)
      008126 72 A9 00 01      [ 2]  246 	addw	y, #0x0001
      00812A 7B 02            [ 1]  247 	ld	a, (0x02, sp)
      00812C A9 00            [ 1]  248 	adc	a, #0x00
      00812E 97               [ 1]  249 	ld	xl, a
      00812F 7B 01            [ 1]  250 	ld	a, (0x01, sp)
      008131 A9 00            [ 1]  251 	adc	a, #0x00
      008133 95               [ 1]  252 	ld	xh, a
      008134 17 03            [ 2]  253 	ldw	(0x03, sp), y
      008136 1F 01            [ 2]  254 	ldw	(0x01, sp), x
      008138 20 CD            [ 2]  255 	jra	00103$
      00813A                        256 00105$:
      00813A 5B 0A            [ 2]  257 	addw	sp, #10
      00813C 81               [ 4]  258 	ret
                                    259 ;	sensors.c: 43: void i2c_read (unsigned char *x) {
                                    260 ;	-----------------------------------------
                                    261 ;	 function i2c_read
                                    262 ;	-----------------------------------------
      00813D                        263 _i2c_read:
                                    264 ;	sensors.c: 44: while ((I2C_SR1 & I2C_RXNE) == 0);
      00813D                        265 00101$:
      00813D AE 52 17         [ 2]  266 	ldw	x, #0x5217
      008140 F6               [ 1]  267 	ld	a, (x)
      008141 A5 40            [ 1]  268 	bcp	a, #0x40
      008143 27 F8            [ 1]  269 	jreq	00101$
                                    270 ;	sensors.c: 45: *x = I2C_DR;
      008145 16 03            [ 2]  271 	ldw	y, (0x03, sp)
      008147 AE 52 16         [ 2]  272 	ldw	x, #0x5216
      00814A F6               [ 1]  273 	ld	a, (x)
      00814B 90 F7            [ 1]  274 	ld	(y), a
      00814D 81               [ 4]  275 	ret
                                    276 ;	sensors.c: 47: void i2c_set_nak (void) {
                                    277 ;	-----------------------------------------
                                    278 ;	 function i2c_set_nak
                                    279 ;	-----------------------------------------
      00814E                        280 _i2c_set_nak:
                                    281 ;	sensors.c: 48: I2C_CR2 &= ~I2C_ACK;
      00814E AE 52 11         [ 2]  282 	ldw	x, #0x5211
      008151 F6               [ 1]  283 	ld	a, (x)
      008152 A4 FB            [ 1]  284 	and	a, #0xfb
      008154 F7               [ 1]  285 	ld	(x), a
      008155 81               [ 4]  286 	ret
                                    287 ;	sensors.c: 50: void i2c_set_stop (void) {
                                    288 ;	-----------------------------------------
                                    289 ;	 function i2c_set_stop
                                    290 ;	-----------------------------------------
      008156                        291 _i2c_set_stop:
                                    292 ;	sensors.c: 51: I2C_CR2 |= I2C_STOP;
      008156 AE 52 11         [ 2]  293 	ldw	x, #0x5211
      008159 F6               [ 1]  294 	ld	a, (x)
      00815A AA 02            [ 1]  295 	or	a, #0x02
      00815C F7               [ 1]  296 	ld	(x), a
      00815D 81               [ 4]  297 	ret
                                    298 ;	sensors.c: 53: void i2c_send_reg (UCHAR addr) {
                                    299 ;	-----------------------------------------
                                    300 ;	 function i2c_send_reg
                                    301 ;	-----------------------------------------
      00815E                        302 _i2c_send_reg:
      00815E 52 02            [ 2]  303 	sub	sp, #2
                                    304 ;	sensors.c: 55: reg = I2C_SR1;
      008160 AE 52 17         [ 2]  305 	ldw	x, #0x5217
      008163 F6               [ 1]  306 	ld	a, (x)
      008164 5F               [ 1]  307 	clrw	x
      008165 97               [ 1]  308 	ld	xl, a
      008166 1F 01            [ 2]  309 	ldw	(0x01, sp), x
                                    310 ;	sensors.c: 56: reg = I2C_SR3;
      008168 AE 52 19         [ 2]  311 	ldw	x, #0x5219
      00816B F6               [ 1]  312 	ld	a, (x)
      00816C 5F               [ 1]  313 	clrw	x
      00816D 97               [ 1]  314 	ld	xl, a
      00816E 1F 01            [ 2]  315 	ldw	(0x01, sp), x
                                    316 ;	sensors.c: 57: I2C_DR = addr;
      008170 AE 52 16         [ 2]  317 	ldw	x, #0x5216
      008173 7B 05            [ 1]  318 	ld	a, (0x05, sp)
      008175 F7               [ 1]  319 	ld	(x), a
                                    320 ;	sensors.c: 58: while ((I2C_SR1 & I2C_TXE) == 0);
      008176                        321 00101$:
      008176 AE 52 17         [ 2]  322 	ldw	x, #0x5217
      008179 F6               [ 1]  323 	ld	a, (x)
      00817A 48               [ 1]  324 	sll	a
      00817B 24 F9            [ 1]  325 	jrnc	00101$
      00817D 5B 02            [ 2]  326 	addw	sp, #2
      00817F 81               [ 4]  327 	ret
                                    328 ;	sensors.c: 62: void UARTPrintF (char *message) {
                                    329 ;	-----------------------------------------
                                    330 ;	 function UARTPrintF
                                    331 ;	-----------------------------------------
      008180                        332 _UARTPrintF:
                                    333 ;	sensors.c: 63: char *ch = message;
      008180 16 03            [ 2]  334 	ldw	y, (0x03, sp)
                                    335 ;	sensors.c: 64: while (*ch) {
      008182                        336 00104$:
      008182 90 F6            [ 1]  337 	ld	a, (y)
      008184 4D               [ 1]  338 	tnz	a
      008185 27 0F            [ 1]  339 	jreq	00107$
                                    340 ;	sensors.c: 65: UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
      008187 AE 52 31         [ 2]  341 	ldw	x, #0x5231
      00818A F7               [ 1]  342 	ld	(x), a
                                    343 ;	sensors.c: 66: while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
      00818B                        344 00101$:
      00818B AE 52 30         [ 2]  345 	ldw	x, #0x5230
      00818E F6               [ 1]  346 	ld	a, (x)
      00818F 48               [ 1]  347 	sll	a
      008190 24 F9            [ 1]  348 	jrnc	00101$
                                    349 ;	sensors.c: 67: ch++;                               //  Grab the next character.
      008192 90 5C            [ 2]  350 	incw	y
      008194 20 EC            [ 2]  351 	jra	00104$
      008196                        352 00107$:
      008196 81               [ 4]  353 	ret
                                    354 ;	sensors.c: 73: void i2c_send_address (UCHAR addr, UCHAR mode) {
                                    355 ;	-----------------------------------------
                                    356 ;	 function i2c_send_address
                                    357 ;	-----------------------------------------
      008197                        358 _i2c_send_address:
      008197 52 03            [ 2]  359 	sub	sp, #3
                                    360 ;	sensors.c: 75: reg = I2C_SR1;
      008199 AE 52 17         [ 2]  361 	ldw	x, #0x5217
      00819C F6               [ 1]  362 	ld	a, (x)
      00819D 5F               [ 1]  363 	clrw	x
      00819E 97               [ 1]  364 	ld	xl, a
      00819F 1F 01            [ 2]  365 	ldw	(0x01, sp), x
                                    366 ;	sensors.c: 76: I2C_DR = (addr << 1) | mode;
      0081A1 7B 06            [ 1]  367 	ld	a, (0x06, sp)
      0081A3 48               [ 1]  368 	sll	a
      0081A4 1A 07            [ 1]  369 	or	a, (0x07, sp)
      0081A6 AE 52 16         [ 2]  370 	ldw	x, #0x5216
      0081A9 F7               [ 1]  371 	ld	(x), a
                                    372 ;	sensors.c: 77: if (mode == I2C_READ) {
      0081AA 7B 07            [ 1]  373 	ld	a, (0x07, sp)
      0081AC A1 01            [ 1]  374 	cp	a, #0x01
      0081AE 26 06            [ 1]  375 	jrne	00127$
      0081B0 A6 01            [ 1]  376 	ld	a, #0x01
      0081B2 6B 03            [ 1]  377 	ld	(0x03, sp), a
      0081B4 20 02            [ 2]  378 	jra	00128$
      0081B6                        379 00127$:
      0081B6 0F 03            [ 1]  380 	clr	(0x03, sp)
      0081B8                        381 00128$:
      0081B8 0D 03            [ 1]  382 	tnz	(0x03, sp)
      0081BA 27 08            [ 1]  383 	jreq	00103$
                                    384 ;	sensors.c: 78: I2C_OARL = 0;
      0081BC AE 52 13         [ 2]  385 	ldw	x, #0x5213
      0081BF 7F               [ 1]  386 	clr	(x)
                                    387 ;	sensors.c: 79: I2C_OARH = 0;
      0081C0 AE 52 14         [ 2]  388 	ldw	x, #0x5214
      0081C3 7F               [ 1]  389 	clr	(x)
                                    390 ;	sensors.c: 82: while ((I2C_SR1 & I2C_ADDR) == 0);
      0081C4                        391 00103$:
                                    392 ;	sensors.c: 75: reg = I2C_SR1;
      0081C4 AE 52 17         [ 2]  393 	ldw	x, #0x5217
      0081C7 F6               [ 1]  394 	ld	a, (x)
                                    395 ;	sensors.c: 82: while ((I2C_SR1 & I2C_ADDR) == 0);
      0081C8 A5 02            [ 1]  396 	bcp	a, #0x02
      0081CA 27 F8            [ 1]  397 	jreq	00103$
                                    398 ;	sensors.c: 83: if (mode == I2C_READ)
      0081CC 0D 03            [ 1]  399 	tnz	(0x03, sp)
      0081CE 27 06            [ 1]  400 	jreq	00108$
                                    401 ;	sensors.c: 84: UNSET (I2C_SR1, I2C_ADDR);
      0081D0 A4 FD            [ 1]  402 	and	a, #0xfd
      0081D2 AE 52 17         [ 2]  403 	ldw	x, #0x5217
      0081D5 F7               [ 1]  404 	ld	(x), a
      0081D6                        405 00108$:
      0081D6 5B 03            [ 2]  406 	addw	sp, #3
      0081D8 81               [ 4]  407 	ret
                                    408 ;	sensors.c: 87: void i2c_set_start_ack (void) {
                                    409 ;	-----------------------------------------
                                    410 ;	 function i2c_set_start_ack
                                    411 ;	-----------------------------------------
      0081D9                        412 _i2c_set_start_ack:
                                    413 ;	sensors.c: 88: I2C_CR2 = I2C_ACK | I2C_START;
      0081D9 AE 52 11         [ 2]  414 	ldw	x, #0x5211
      0081DC A6 05            [ 1]  415 	ld	a, #0x05
      0081DE F7               [ 1]  416 	ld	(x), a
                                    417 ;	sensors.c: 89: while ((I2C_SR1 & I2C_SB) == 0);
      0081DF                        418 00101$:
      0081DF AE 52 17         [ 2]  419 	ldw	x, #0x5217
      0081E2 F6               [ 1]  420 	ld	a, (x)
      0081E3 44               [ 1]  421 	srl	a
      0081E4 24 F9            [ 1]  422 	jrnc	00101$
      0081E6 81               [ 4]  423 	ret
                                    424 ;	sensors.c: 96: void print_byte_hex (unsigned char buffer) {
                                    425 ;	-----------------------------------------
                                    426 ;	 function print_byte_hex
                                    427 ;	-----------------------------------------
      0081E7                        428 _print_byte_hex:
      0081E7 52 0C            [ 2]  429 	sub	sp, #12
                                    430 ;	sensors.c: 99: a = (buffer >> 4);
      0081E9 7B 0F            [ 1]  431 	ld	a, (0x0f, sp)
      0081EB 4E               [ 1]  432 	swap	a
      0081EC A4 0F            [ 1]  433 	and	a, #0x0f
      0081EE 5F               [ 1]  434 	clrw	x
      0081EF 97               [ 1]  435 	ld	xl, a
                                    436 ;	sensors.c: 100: if (a > 9)
      0081F0 A3 00 09         [ 2]  437 	cpw	x, #0x0009
      0081F3 2D 07            [ 1]  438 	jrsle	00102$
                                    439 ;	sensors.c: 101: a = a + 'a' - 10;
      0081F5 1C 00 57         [ 2]  440 	addw	x, #0x0057
      0081F8 1F 0B            [ 2]  441 	ldw	(0x0b, sp), x
      0081FA 20 05            [ 2]  442 	jra	00103$
      0081FC                        443 00102$:
                                    444 ;	sensors.c: 103: a += '0'; 
      0081FC 1C 00 30         [ 2]  445 	addw	x, #0x0030
      0081FF 1F 0B            [ 2]  446 	ldw	(0x0b, sp), x
      008201                        447 00103$:
                                    448 ;	sensors.c: 104: b = buffer & 0x0f;
      008201 7B 0F            [ 1]  449 	ld	a, (0x0f, sp)
      008203 A4 0F            [ 1]  450 	and	a, #0x0f
      008205 5F               [ 1]  451 	clrw	x
      008206 97               [ 1]  452 	ld	xl, a
                                    453 ;	sensors.c: 105: if (b > 9)
      008207 A3 00 09         [ 2]  454 	cpw	x, #0x0009
      00820A 2D 07            [ 1]  455 	jrsle	00105$
                                    456 ;	sensors.c: 106: b = b + 'a' - 10;
      00820C 1C 00 57         [ 2]  457 	addw	x, #0x0057
      00820F 1F 09            [ 2]  458 	ldw	(0x09, sp), x
      008211 20 05            [ 2]  459 	jra	00106$
      008213                        460 00105$:
                                    461 ;	sensors.c: 108: b += '0'; 
      008213 1C 00 30         [ 2]  462 	addw	x, #0x0030
      008216 1F 09            [ 2]  463 	ldw	(0x09, sp), x
      008218                        464 00106$:
                                    465 ;	sensors.c: 109: message[0] = a;
      008218 90 96            [ 1]  466 	ldw	y, sp
      00821A 90 5C            [ 2]  467 	incw	y
      00821C 7B 0C            [ 1]  468 	ld	a, (0x0c, sp)
      00821E 90 F7            [ 1]  469 	ld	(y), a
                                    470 ;	sensors.c: 110: message[1] = b;
      008220 93               [ 1]  471 	ldw	x, y
      008221 5C               [ 2]  472 	incw	x
      008222 7B 0A            [ 1]  473 	ld	a, (0x0a, sp)
      008224 F7               [ 1]  474 	ld	(x), a
                                    475 ;	sensors.c: 111: message[2] = 0;
      008225 93               [ 1]  476 	ldw	x, y
      008226 5C               [ 2]  477 	incw	x
      008227 5C               [ 2]  478 	incw	x
      008228 7F               [ 1]  479 	clr	(x)
                                    480 ;	sensors.c: 112: UARTPrintF (message);
      008229 90 89            [ 2]  481 	pushw	y
      00822B CD 81 80         [ 4]  482 	call	_UARTPrintF
      00822E 5B 02            [ 2]  483 	addw	sp, #2
      008230 5B 0C            [ 2]  484 	addw	sp, #12
      008232 81               [ 4]  485 	ret
                                    486 ;	sensors.c: 116: unsigned char i2c_read_register (UCHAR addr, UCHAR rg) {
                                    487 ;	-----------------------------------------
                                    488 ;	 function i2c_read_register
                                    489 ;	-----------------------------------------
      008233                        490 _i2c_read_register:
      008233 52 02            [ 2]  491 	sub	sp, #2
                                    492 ;	sensors.c: 119: i2c_set_start_ack ();
      008235 CD 81 D9         [ 4]  493 	call	_i2c_set_start_ack
                                    494 ;	sensors.c: 120: i2c_send_address (addr, I2C_WRITE);
      008238 4B 00            [ 1]  495 	push	#0x00
      00823A 7B 06            [ 1]  496 	ld	a, (0x06, sp)
      00823C 88               [ 1]  497 	push	a
      00823D CD 81 97         [ 4]  498 	call	_i2c_send_address
      008240 5B 02            [ 2]  499 	addw	sp, #2
                                    500 ;	sensors.c: 121: i2c_send_reg (rg);
      008242 7B 06            [ 1]  501 	ld	a, (0x06, sp)
      008244 88               [ 1]  502 	push	a
      008245 CD 81 5E         [ 4]  503 	call	_i2c_send_reg
      008248 84               [ 1]  504 	pop	a
                                    505 ;	sensors.c: 122: i2c_set_start_ack ();
      008249 CD 81 D9         [ 4]  506 	call	_i2c_set_start_ack
                                    507 ;	sensors.c: 123: i2c_send_address (addr, I2C_READ);
      00824C 4B 01            [ 1]  508 	push	#0x01
      00824E 7B 06            [ 1]  509 	ld	a, (0x06, sp)
      008250 88               [ 1]  510 	push	a
      008251 CD 81 97         [ 4]  511 	call	_i2c_send_address
      008254 5B 02            [ 2]  512 	addw	sp, #2
                                    513 ;	sensors.c: 124: reg = I2C_SR1;
      008256 AE 52 17         [ 2]  514 	ldw	x, #0x5217
      008259 F6               [ 1]  515 	ld	a, (x)
      00825A 6B 01            [ 1]  516 	ld	(0x01, sp), a
                                    517 ;	sensors.c: 125: reg = I2C_SR3;
      00825C AE 52 19         [ 2]  518 	ldw	x, #0x5219
      00825F F6               [ 1]  519 	ld	a, (x)
      008260 6B 01            [ 1]  520 	ld	(0x01, sp), a
                                    521 ;	sensors.c: 126: i2c_set_nak ();
      008262 CD 81 4E         [ 4]  522 	call	_i2c_set_nak
                                    523 ;	sensors.c: 127: i2c_set_stop ();
      008265 CD 81 56         [ 4]  524 	call	_i2c_set_stop
                                    525 ;	sensors.c: 128: i2c_read (&x);
      008268 96               [ 1]  526 	ldw	x, sp
      008269 5C               [ 2]  527 	incw	x
      00826A 5C               [ 2]  528 	incw	x
      00826B 89               [ 2]  529 	pushw	x
      00826C CD 81 3D         [ 4]  530 	call	_i2c_read
      00826F 5B 02            [ 2]  531 	addw	sp, #2
                                    532 ;	sensors.c: 129: return (x);
      008271 7B 02            [ 1]  533 	ld	a, (0x02, sp)
      008273 5B 02            [ 2]  534 	addw	sp, #2
      008275 81               [ 4]  535 	ret
                                    536 ;	sensors.c: 132: void InitializeI2C (void) {
                                    537 ;	-----------------------------------------
                                    538 ;	 function InitializeI2C
                                    539 ;	-----------------------------------------
      008276                        540 _InitializeI2C:
                                    541 ;	sensors.c: 133: I2C_CR1 = 0;   //  Disable I2C before configuration starts. PE bit is bit 0
      008276 AE 52 10         [ 2]  542 	ldw	x, #0x5210
      008279 7F               [ 1]  543 	clr	(x)
                                    544 ;	sensors.c: 137: I2C_FREQR = 16;                     //  Set the internal clock frequency (MHz).
      00827A AE 52 12         [ 2]  545 	ldw	x, #0x5212
      00827D A6 10            [ 1]  546 	ld	a, #0x10
      00827F F7               [ 1]  547 	ld	(x), a
                                    548 ;	sensors.c: 138: UNSET (I2C_CCRH, I2C_FS);           //  I2C running is standard mode.
      008280 72 17 52 1C      [ 1]  549 	bres	0x521c, #7
                                    550 ;	sensors.c: 140: I2C_CCRL = 0xa0;                    //  SCL clock speed is 50 kHz.
      008284 AE 52 1B         [ 2]  551 	ldw	x, #0x521b
      008287 A6 A0            [ 1]  552 	ld	a, #0xa0
      008289 F7               [ 1]  553 	ld	(x), a
                                    554 ;	sensors.c: 142: I2C_CCRH &= 0x00;	// Clears lower 4 bits "CCR"
      00828A AE 52 1C         [ 2]  555 	ldw	x, #0x521c
      00828D 7F               [ 1]  556 	clr	(x)
                                    557 ;	sensors.c: 146: UNSET (I2C_OARH, I2C_ADDMODE);      //  7 bit address mode.
      00828E 72 17 52 14      [ 1]  558 	bres	0x5214, #7
                                    559 ;	sensors.c: 147: SET (I2C_OARH, I2C_ADDCONF);        //  Docs say this must always be 1.
      008292 AE 52 14         [ 2]  560 	ldw	x, #0x5214
      008295 F6               [ 1]  561 	ld	a, (x)
      008296 AA 40            [ 1]  562 	or	a, #0x40
      008298 F7               [ 1]  563 	ld	(x), a
                                    564 ;	sensors.c: 151: I2C_TRISER = 17;
      008299 AE 52 1D         [ 2]  565 	ldw	x, #0x521d
      00829C A6 11            [ 1]  566 	ld	a, #0x11
      00829E F7               [ 1]  567 	ld	(x), a
                                    568 ;	sensors.c: 159: I2C_CR1 = I2C_PE;	// Enables port
      00829F AE 52 10         [ 2]  569 	ldw	x, #0x5210
      0082A2 A6 01            [ 1]  570 	ld	a, #0x01
      0082A4 F7               [ 1]  571 	ld	(x), a
      0082A5 81               [ 4]  572 	ret
                                    573 ;	sensors.c: 165: void InitializeUART() {
                                    574 ;	-----------------------------------------
                                    575 ;	 function InitializeUART
                                    576 ;	-----------------------------------------
      0082A6                        577 _InitializeUART:
                                    578 ;	sensors.c: 175: UART1_CR1 = 0;
      0082A6 AE 52 34         [ 2]  579 	ldw	x, #0x5234
      0082A9 7F               [ 1]  580 	clr	(x)
                                    581 ;	sensors.c: 176: UART1_CR2 = 0;
      0082AA AE 52 35         [ 2]  582 	ldw	x, #0x5235
      0082AD 7F               [ 1]  583 	clr	(x)
                                    584 ;	sensors.c: 177: UART1_CR4 = 0;
      0082AE AE 52 37         [ 2]  585 	ldw	x, #0x5237
      0082B1 7F               [ 1]  586 	clr	(x)
                                    587 ;	sensors.c: 178: UART1_CR3 = 0;
      0082B2 AE 52 36         [ 2]  588 	ldw	x, #0x5236
      0082B5 7F               [ 1]  589 	clr	(x)
                                    590 ;	sensors.c: 179: UART1_CR5 = 0;
      0082B6 AE 52 38         [ 2]  591 	ldw	x, #0x5238
      0082B9 7F               [ 1]  592 	clr	(x)
                                    593 ;	sensors.c: 180: UART1_GTR = 0;
      0082BA AE 52 39         [ 2]  594 	ldw	x, #0x5239
      0082BD 7F               [ 1]  595 	clr	(x)
                                    596 ;	sensors.c: 181: UART1_PSCR = 0;
      0082BE AE 52 3A         [ 2]  597 	ldw	x, #0x523a
      0082C1 7F               [ 1]  598 	clr	(x)
                                    599 ;	sensors.c: 185: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
      0082C2 AE 52 34         [ 2]  600 	ldw	x, #0x5234
      0082C5 F6               [ 1]  601 	ld	a, (x)
      0082C6 A4 EF            [ 1]  602 	and	a, #0xef
      0082C8 F7               [ 1]  603 	ld	(x), a
                                    604 ;	sensors.c: 186: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
      0082C9 AE 52 34         [ 2]  605 	ldw	x, #0x5234
      0082CC F6               [ 1]  606 	ld	a, (x)
      0082CD A4 FB            [ 1]  607 	and	a, #0xfb
      0082CF F7               [ 1]  608 	ld	(x), a
                                    609 ;	sensors.c: 187: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
      0082D0 AE 52 36         [ 2]  610 	ldw	x, #0x5236
      0082D3 F6               [ 1]  611 	ld	a, (x)
      0082D4 A4 DF            [ 1]  612 	and	a, #0xdf
      0082D6 F7               [ 1]  613 	ld	(x), a
                                    614 ;	sensors.c: 188: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
      0082D7 AE 52 36         [ 2]  615 	ldw	x, #0x5236
      0082DA F6               [ 1]  616 	ld	a, (x)
      0082DB A4 EF            [ 1]  617 	and	a, #0xef
      0082DD F7               [ 1]  618 	ld	(x), a
                                    619 ;	sensors.c: 189: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
      0082DE AE 52 33         [ 2]  620 	ldw	x, #0x5233
      0082E1 A6 0A            [ 1]  621 	ld	a, #0x0a
      0082E3 F7               [ 1]  622 	ld	(x), a
                                    623 ;	sensors.c: 190: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
      0082E4 AE 52 32         [ 2]  624 	ldw	x, #0x5232
      0082E7 A6 08            [ 1]  625 	ld	a, #0x08
      0082E9 F7               [ 1]  626 	ld	(x), a
                                    627 ;	sensors.c: 194: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
      0082EA AE 52 35         [ 2]  628 	ldw	x, #0x5235
      0082ED F6               [ 1]  629 	ld	a, (x)
      0082EE A4 F7            [ 1]  630 	and	a, #0xf7
      0082F0 F7               [ 1]  631 	ld	(x), a
                                    632 ;	sensors.c: 195: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
      0082F1 AE 52 35         [ 2]  633 	ldw	x, #0x5235
      0082F4 F6               [ 1]  634 	ld	a, (x)
      0082F5 A4 FB            [ 1]  635 	and	a, #0xfb
      0082F7 F7               [ 1]  636 	ld	(x), a
                                    637 ;	sensors.c: 199: SET (UART1_CR3, CR3_CPOL);
      0082F8 AE 52 36         [ 2]  638 	ldw	x, #0x5236
      0082FB F6               [ 1]  639 	ld	a, (x)
      0082FC AA 04            [ 1]  640 	or	a, #0x04
      0082FE F7               [ 1]  641 	ld	(x), a
                                    642 ;	sensors.c: 200: SET (UART1_CR3, CR3_CPHA);
      0082FF AE 52 36         [ 2]  643 	ldw	x, #0x5236
      008302 F6               [ 1]  644 	ld	a, (x)
      008303 AA 02            [ 1]  645 	or	a, #0x02
      008305 F7               [ 1]  646 	ld	(x), a
                                    647 ;	sensors.c: 201: SET (UART1_CR3, CR3_LBCL);
      008306 72 10 52 36      [ 1]  648 	bset	0x5236, #0
                                    649 ;	sensors.c: 205: SET (UART1_CR2, CR2_TEN);
      00830A AE 52 35         [ 2]  650 	ldw	x, #0x5235
      00830D F6               [ 1]  651 	ld	a, (x)
      00830E AA 08            [ 1]  652 	or	a, #0x08
      008310 F7               [ 1]  653 	ld	(x), a
                                    654 ;	sensors.c: 206: SET (UART1_CR2, CR2_REN);
      008311 AE 52 35         [ 2]  655 	ldw	x, #0x5235
      008314 F6               [ 1]  656 	ld	a, (x)
      008315 AA 04            [ 1]  657 	or	a, #0x04
      008317 F7               [ 1]  658 	ld	(x), a
                                    659 ;	sensors.c: 207: UART1_CR3 = CR3_CLKEN;
      008318 AE 52 36         [ 2]  660 	ldw	x, #0x5236
      00831B A6 08            [ 1]  661 	ld	a, #0x08
      00831D F7               [ 1]  662 	ld	(x), a
      00831E 81               [ 4]  663 	ret
                                    664 ;	sensors.c: 235: void tm1637Init(void)
                                    665 ;	-----------------------------------------
                                    666 ;	 function tm1637Init
                                    667 ;	-----------------------------------------
      00831F                        668 _tm1637Init:
                                    669 ;	sensors.c: 237: tm1637SetBrightness(8);
      00831F 4B 08            [ 1]  670 	push	#0x08
      008321 CD 83 C4         [ 4]  671 	call	_tm1637SetBrightness
      008324 84               [ 1]  672 	pop	a
      008325 81               [ 4]  673 	ret
                                    674 ;	sensors.c: 242: void tm1637DisplayDecimal(long TT,unsigned int displaySeparator)
                                    675 ;	-----------------------------------------
                                    676 ;	 function tm1637DisplayDecimal
                                    677 ;	-----------------------------------------
      008326                        678 _tm1637DisplayDecimal:
      008326 52 13            [ 2]  679 	sub	sp, #19
                                    680 ;	sensors.c: 244: unsigned int v = TT & 0x0000FFFF;
      008328 7B 19            [ 1]  681 	ld	a, (0x19, sp)
      00832A 97               [ 1]  682 	ld	xl, a
      00832B 7B 18            [ 1]  683 	ld	a, (0x18, sp)
      00832D 95               [ 1]  684 	ld	xh, a
      00832E 0F 0D            [ 1]  685 	clr	(0x0d, sp)
      008330 4F               [ 1]  686 	clr	a
      008331 1F 07            [ 2]  687 	ldw	(0x07, sp), x
                                    688 ;	sensors.c: 250: for (ii = 0; ii < 4; ++ii) {
      008333 96               [ 1]  689 	ldw	x, sp
      008334 5C               [ 2]  690 	incw	x
      008335 1F 10            [ 2]  691 	ldw	(0x10, sp), x
      008337 AE 86 45         [ 2]  692 	ldw	x, #_segmentMap+0
      00833A 1F 12            [ 2]  693 	ldw	(0x12, sp), x
      00833C 90 5F            [ 1]  694 	clrw	y
      00833E                        695 00106$:
                                    696 ;	sensors.c: 251: digitArr[ii] = segmentMap[v % 10];
      00833E 93               [ 1]  697 	ldw	x, y
      00833F 72 FB 10         [ 2]  698 	addw	x, (0x10, sp)
      008342 1F 09            [ 2]  699 	ldw	(0x09, sp), x
      008344 90 89            [ 2]  700 	pushw	y
      008346 1E 09            [ 2]  701 	ldw	x, (0x09, sp)
      008348 90 AE 00 0A      [ 2]  702 	ldw	y, #0x000a
      00834C 65               [ 2]  703 	divw	x, y
      00834D 93               [ 1]  704 	ldw	x, y
      00834E 90 85            [ 2]  705 	popw	y
      008350 72 FB 12         [ 2]  706 	addw	x, (0x12, sp)
      008353 F6               [ 1]  707 	ld	a, (x)
      008354 1E 09            [ 2]  708 	ldw	x, (0x09, sp)
      008356 F7               [ 1]  709 	ld	(x), a
                                    710 ;	sensors.c: 252: if (ii == 2 && displaySeparator) {
      008357 90 A3 00 02      [ 2]  711 	cpw	y, #0x0002
      00835B 26 0C            [ 1]  712 	jrne	00102$
      00835D 1E 1A            [ 2]  713 	ldw	x, (0x1a, sp)
      00835F 27 08            [ 1]  714 	jreq	00102$
                                    715 ;	sensors.c: 253: digitArr[ii] |= 1 << 7;
      008361 1E 09            [ 2]  716 	ldw	x, (0x09, sp)
      008363 F6               [ 1]  717 	ld	a, (x)
      008364 AA 80            [ 1]  718 	or	a, #0x80
      008366 1E 09            [ 2]  719 	ldw	x, (0x09, sp)
      008368 F7               [ 1]  720 	ld	(x), a
      008369                        721 00102$:
                                    722 ;	sensors.c: 255: v /= 10;
      008369 90 89            [ 2]  723 	pushw	y
      00836B 1E 09            [ 2]  724 	ldw	x, (0x09, sp)
      00836D 90 AE 00 0A      [ 2]  725 	ldw	y, #0x000a
      008371 65               [ 2]  726 	divw	x, y
      008372 90 85            [ 2]  727 	popw	y
      008374 1F 07            [ 2]  728 	ldw	(0x07, sp), x
                                    729 ;	sensors.c: 250: for (ii = 0; ii < 4; ++ii) {
      008376 90 5C            [ 2]  730 	incw	y
      008378 90 A3 00 04      [ 2]  731 	cpw	y, #0x0004
      00837C 25 C0            [ 1]  732 	jrc	00106$
                                    733 ;	sensors.c: 258: _tm1637Start();
      00837E CD 83 D6         [ 4]  734 	call	__tm1637Start
                                    735 ;	sensors.c: 259: _tm1637WriteByte(0x40);
      008381 4B 40            [ 1]  736 	push	#0x40
      008383 CD 84 2A         [ 4]  737 	call	__tm1637WriteByte
      008386 84               [ 1]  738 	pop	a
                                    739 ;	sensors.c: 260: _tm1637ReadResult();
      008387 CD 84 0F         [ 4]  740 	call	__tm1637ReadResult
                                    741 ;	sensors.c: 261: _tm1637Stop();
      00838A CD 83 E8         [ 4]  742 	call	__tm1637Stop
                                    743 ;	sensors.c: 263: _tm1637Start();
      00838D CD 83 D6         [ 4]  744 	call	__tm1637Start
                                    745 ;	sensors.c: 264: _tm1637WriteByte(0xc0);
      008390 4B C0            [ 1]  746 	push	#0xc0
      008392 CD 84 2A         [ 4]  747 	call	__tm1637WriteByte
      008395 84               [ 1]  748 	pop	a
                                    749 ;	sensors.c: 265: _tm1637ReadResult();
      008396 CD 84 0F         [ 4]  750 	call	__tm1637ReadResult
                                    751 ;	sensors.c: 267: for (ii = 0; ii < 4; ++ii) {
      008399 5F               [ 1]  752 	clrw	x
      00839A 1F 05            [ 2]  753 	ldw	(0x05, sp), x
      00839C                        754 00108$:
                                    755 ;	sensors.c: 268: _tm1637WriteByte(digitArr[3 - ii]);
      00839C 7B 06            [ 1]  756 	ld	a, (0x06, sp)
      00839E 6B 0B            [ 1]  757 	ld	(0x0b, sp), a
      0083A0 A6 03            [ 1]  758 	ld	a, #0x03
      0083A2 10 0B            [ 1]  759 	sub	a, (0x0b, sp)
      0083A4 5F               [ 1]  760 	clrw	x
      0083A5 97               [ 1]  761 	ld	xl, a
      0083A6 72 FB 10         [ 2]  762 	addw	x, (0x10, sp)
      0083A9 F6               [ 1]  763 	ld	a, (x)
      0083AA 88               [ 1]  764 	push	a
      0083AB CD 84 2A         [ 4]  765 	call	__tm1637WriteByte
      0083AE 84               [ 1]  766 	pop	a
                                    767 ;	sensors.c: 269: _tm1637ReadResult();
      0083AF CD 84 0F         [ 4]  768 	call	__tm1637ReadResult
                                    769 ;	sensors.c: 267: for (ii = 0; ii < 4; ++ii) {
      0083B2 1E 05            [ 2]  770 	ldw	x, (0x05, sp)
      0083B4 5C               [ 2]  771 	incw	x
      0083B5 1F 05            [ 2]  772 	ldw	(0x05, sp), x
      0083B7 1E 05            [ 2]  773 	ldw	x, (0x05, sp)
      0083B9 A3 00 04         [ 2]  774 	cpw	x, #0x0004
      0083BC 25 DE            [ 1]  775 	jrc	00108$
                                    776 ;	sensors.c: 272: _tm1637Stop();
      0083BE CD 83 E8         [ 4]  777 	call	__tm1637Stop
      0083C1 5B 13            [ 2]  778 	addw	sp, #19
      0083C3 81               [ 4]  779 	ret
                                    780 ;	sensors.c: 277: void tm1637SetBrightness(char brightness)
                                    781 ;	-----------------------------------------
                                    782 ;	 function tm1637SetBrightness
                                    783 ;	-----------------------------------------
      0083C4                        784 _tm1637SetBrightness:
                                    785 ;	sensors.c: 284: _tm1637Start();
      0083C4 CD 83 D6         [ 4]  786 	call	__tm1637Start
                                    787 ;	sensors.c: 285: _tm1637WriteByte(0x87 + brightness);
      0083C7 7B 03            [ 1]  788 	ld	a, (0x03, sp)
      0083C9 AB 87            [ 1]  789 	add	a, #0x87
      0083CB 88               [ 1]  790 	push	a
      0083CC CD 84 2A         [ 4]  791 	call	__tm1637WriteByte
      0083CF 84               [ 1]  792 	pop	a
                                    793 ;	sensors.c: 286: _tm1637ReadResult();
      0083D0 CD 84 0F         [ 4]  794 	call	__tm1637ReadResult
                                    795 ;	sensors.c: 287: _tm1637Stop();
      0083D3 CC 83 E8         [ 2]  796 	jp	__tm1637Stop
                                    797 ;	sensors.c: 290: void _tm1637Start(void)
                                    798 ;	-----------------------------------------
                                    799 ;	 function _tm1637Start
                                    800 ;	-----------------------------------------
      0083D6                        801 __tm1637Start:
                                    802 ;	sensors.c: 292: _tm1637ClkHigh();
      0083D6 CD 84 68         [ 4]  803 	call	__tm1637ClkHigh
                                    804 ;	sensors.c: 293: _tm1637DioHigh();
      0083D9 CD 84 78         [ 4]  805 	call	__tm1637DioHigh
                                    806 ;	sensors.c: 294: delay(5);
      0083DC 4B 05            [ 1]  807 	push	#0x05
      0083DE 4B 00            [ 1]  808 	push	#0x00
      0083E0 CD 80 F2         [ 4]  809 	call	_delay
      0083E3 5B 02            [ 2]  810 	addw	sp, #2
                                    811 ;	sensors.c: 295: _tm1637DioLow();
      0083E5 CC 84 80         [ 2]  812 	jp	__tm1637DioLow
                                    813 ;	sensors.c: 298: void _tm1637Stop(void)
                                    814 ;	-----------------------------------------
                                    815 ;	 function _tm1637Stop
                                    816 ;	-----------------------------------------
      0083E8                        817 __tm1637Stop:
                                    818 ;	sensors.c: 300: _tm1637ClkLow();
      0083E8 CD 84 70         [ 4]  819 	call	__tm1637ClkLow
                                    820 ;	sensors.c: 301: delay(5);
      0083EB 4B 05            [ 1]  821 	push	#0x05
      0083ED 4B 00            [ 1]  822 	push	#0x00
      0083EF CD 80 F2         [ 4]  823 	call	_delay
      0083F2 5B 02            [ 2]  824 	addw	sp, #2
                                    825 ;	sensors.c: 302: _tm1637DioLow();
      0083F4 CD 84 80         [ 4]  826 	call	__tm1637DioLow
                                    827 ;	sensors.c: 303: delay(5);
      0083F7 4B 05            [ 1]  828 	push	#0x05
      0083F9 4B 00            [ 1]  829 	push	#0x00
      0083FB CD 80 F2         [ 4]  830 	call	_delay
      0083FE 5B 02            [ 2]  831 	addw	sp, #2
                                    832 ;	sensors.c: 304: _tm1637ClkHigh();
      008400 CD 84 68         [ 4]  833 	call	__tm1637ClkHigh
                                    834 ;	sensors.c: 305: delay(5);
      008403 4B 05            [ 1]  835 	push	#0x05
      008405 4B 00            [ 1]  836 	push	#0x00
      008407 CD 80 F2         [ 4]  837 	call	_delay
      00840A 5B 02            [ 2]  838 	addw	sp, #2
                                    839 ;	sensors.c: 306: _tm1637DioHigh();
      00840C CC 84 78         [ 2]  840 	jp	__tm1637DioHigh
                                    841 ;	sensors.c: 309: void _tm1637ReadResult(void)
                                    842 ;	-----------------------------------------
                                    843 ;	 function _tm1637ReadResult
                                    844 ;	-----------------------------------------
      00840F                        845 __tm1637ReadResult:
                                    846 ;	sensors.c: 311: _tm1637ClkLow();
      00840F CD 84 70         [ 4]  847 	call	__tm1637ClkLow
                                    848 ;	sensors.c: 312: delay(5);
      008412 4B 05            [ 1]  849 	push	#0x05
      008414 4B 00            [ 1]  850 	push	#0x00
      008416 CD 80 F2         [ 4]  851 	call	_delay
      008419 5B 02            [ 2]  852 	addw	sp, #2
                                    853 ;	sensors.c: 314: _tm1637ClkHigh();
      00841B CD 84 68         [ 4]  854 	call	__tm1637ClkHigh
                                    855 ;	sensors.c: 315: delay(5);
      00841E 4B 05            [ 1]  856 	push	#0x05
      008420 4B 00            [ 1]  857 	push	#0x00
      008422 CD 80 F2         [ 4]  858 	call	_delay
      008425 5B 02            [ 2]  859 	addw	sp, #2
                                    860 ;	sensors.c: 316: _tm1637ClkLow();
      008427 CC 84 70         [ 2]  861 	jp	__tm1637ClkLow
                                    862 ;	sensors.c: 319: void _tm1637WriteByte(unsigned char b)
                                    863 ;	-----------------------------------------
                                    864 ;	 function _tm1637WriteByte
                                    865 ;	-----------------------------------------
      00842A                        866 __tm1637WriteByte:
      00842A 52 02            [ 2]  867 	sub	sp, #2
                                    868 ;	sensors.c: 321: for (ii = 0; ii < 8; ++ii) {
      00842C 5F               [ 1]  869 	clrw	x
      00842D 1F 01            [ 2]  870 	ldw	(0x01, sp), x
      00842F                        871 00105$:
                                    872 ;	sensors.c: 322: _tm1637ClkLow();
      00842F CD 84 70         [ 4]  873 	call	__tm1637ClkLow
                                    874 ;	sensors.c: 323: if (b & 0x01) {
      008432 7B 05            [ 1]  875 	ld	a, (0x05, sp)
      008434 44               [ 1]  876 	srl	a
      008435 24 05            [ 1]  877 	jrnc	00102$
                                    878 ;	sensors.c: 324: _tm1637DioHigh();
      008437 CD 84 78         [ 4]  879 	call	__tm1637DioHigh
      00843A 20 03            [ 2]  880 	jra	00103$
      00843C                        881 00102$:
                                    882 ;	sensors.c: 327: _tm1637DioLow();
      00843C CD 84 80         [ 4]  883 	call	__tm1637DioLow
      00843F                        884 00103$:
                                    885 ;	sensors.c: 329: delay(15);
      00843F 4B 0F            [ 1]  886 	push	#0x0f
      008441 4B 00            [ 1]  887 	push	#0x00
      008443 CD 80 F2         [ 4]  888 	call	_delay
      008446 5B 02            [ 2]  889 	addw	sp, #2
                                    890 ;	sensors.c: 330: b >>= 1;
      008448 7B 05            [ 1]  891 	ld	a, (0x05, sp)
      00844A 44               [ 1]  892 	srl	a
      00844B 6B 05            [ 1]  893 	ld	(0x05, sp), a
                                    894 ;	sensors.c: 331: _tm1637ClkHigh();
      00844D CD 84 68         [ 4]  895 	call	__tm1637ClkHigh
                                    896 ;	sensors.c: 332: delay(15);
      008450 4B 0F            [ 1]  897 	push	#0x0f
      008452 4B 00            [ 1]  898 	push	#0x00
      008454 CD 80 F2         [ 4]  899 	call	_delay
      008457 5B 02            [ 2]  900 	addw	sp, #2
                                    901 ;	sensors.c: 321: for (ii = 0; ii < 8; ++ii) {
      008459 1E 01            [ 2]  902 	ldw	x, (0x01, sp)
      00845B 5C               [ 2]  903 	incw	x
      00845C 1F 01            [ 2]  904 	ldw	(0x01, sp), x
      00845E 1E 01            [ 2]  905 	ldw	x, (0x01, sp)
      008460 A3 00 08         [ 2]  906 	cpw	x, #0x0008
      008463 2F CA            [ 1]  907 	jrslt	00105$
      008465 5B 02            [ 2]  908 	addw	sp, #2
      008467 81               [ 4]  909 	ret
                                    910 ;	sensors.c: 338: void _tm1637ClkHigh(void)
                                    911 ;	-----------------------------------------
                                    912 ;	 function _tm1637ClkHigh
                                    913 ;	-----------------------------------------
      008468                        914 __tm1637ClkHigh:
                                    915 ;	sensors.c: 343: PD_ODR |= 1 << 2;
      008468 AE 50 0F         [ 2]  916 	ldw	x, #0x500f
      00846B F6               [ 1]  917 	ld	a, (x)
      00846C AA 04            [ 1]  918 	or	a, #0x04
      00846E F7               [ 1]  919 	ld	(x), a
      00846F 81               [ 4]  920 	ret
                                    921 ;	sensors.c: 346: void _tm1637ClkLow(void)
                                    922 ;	-----------------------------------------
                                    923 ;	 function _tm1637ClkLow
                                    924 ;	-----------------------------------------
      008470                        925 __tm1637ClkLow:
                                    926 ;	sensors.c: 350: PD_ODR &= ~(1 << 2);
      008470 AE 50 0F         [ 2]  927 	ldw	x, #0x500f
      008473 F6               [ 1]  928 	ld	a, (x)
      008474 A4 FB            [ 1]  929 	and	a, #0xfb
      008476 F7               [ 1]  930 	ld	(x), a
      008477 81               [ 4]  931 	ret
                                    932 ;	sensors.c: 356: void _tm1637DioHigh(void)
                                    933 ;	-----------------------------------------
                                    934 ;	 function _tm1637DioHigh
                                    935 ;	-----------------------------------------
      008478                        936 __tm1637DioHigh:
                                    937 ;	sensors.c: 360: PD_ODR |= 1 << 3;
      008478 AE 50 0F         [ 2]  938 	ldw	x, #0x500f
      00847B F6               [ 1]  939 	ld	a, (x)
      00847C AA 08            [ 1]  940 	or	a, #0x08
      00847E F7               [ 1]  941 	ld	(x), a
      00847F 81               [ 4]  942 	ret
                                    943 ;	sensors.c: 364: void _tm1637DioLow(void)
                                    944 ;	-----------------------------------------
                                    945 ;	 function _tm1637DioLow
                                    946 ;	-----------------------------------------
      008480                        947 __tm1637DioLow:
                                    948 ;	sensors.c: 366: PD_ODR &= ~(1 << 3);
      008480 AE 50 0F         [ 2]  949 	ldw	x, #0x500f
      008483 F6               [ 1]  950 	ld	a, (x)
      008484 A4 F7            [ 1]  951 	and	a, #0xf7
      008486 F7               [ 1]  952 	ld	(x), a
      008487 81               [ 4]  953 	ret
                                    954 ;	sensors.c: 380: int main () {
                                    955 ;	-----------------------------------------
                                    956 ;	 function main
                                    957 ;	-----------------------------------------
      008488                        958 _main:
      008488 52 1C            [ 2]  959 	sub	sp, #28
                                    960 ;	sensors.c: 387: InitializeSystemClock();
      00848A CD 80 A8         [ 4]  961 	call	_InitializeSystemClock
                                    962 ;	sensors.c: 390: PD_DDR = (1 << 3) | (1 << 2); // output mode
      00848D AE 50 11         [ 2]  963 	ldw	x, #0x5011
      008490 A6 0C            [ 1]  964 	ld	a, #0x0c
      008492 F7               [ 1]  965 	ld	(x), a
                                    966 ;	sensors.c: 391: PD_CR1 = (1 << 3) | (1 << 2); // push-pull
      008493 AE 50 12         [ 2]  967 	ldw	x, #0x5012
      008496 A6 0C            [ 1]  968 	ld	a, #0x0c
      008498 F7               [ 1]  969 	ld	(x), a
                                    970 ;	sensors.c: 392: PD_CR2 = (1 << 3) | (1 << 2); // up to 10MHz speed
      008499 AE 50 13         [ 2]  971 	ldw	x, #0x5013
      00849C A6 0C            [ 1]  972 	ld	a, #0x0c
      00849E F7               [ 1]  973 	ld	(x), a
                                    974 ;	sensors.c: 393: tm1637Init();
      00849F CD 83 1F         [ 4]  975 	call	_tm1637Init
                                    976 ;	sensors.c: 395: InitializeUART();
      0084A2 CD 82 A6         [ 4]  977 	call	_InitializeUART
                                    978 ;	sensors.c: 396: InitializeI2C();
      0084A5 CD 82 76         [ 4]  979 	call	_InitializeI2C
                                    980 ;	sensors.c: 399: while (1) {
      0084A8                        981 00114$:
                                    982 ;	sensors.c: 401: i2c_set_start_ack ();
      0084A8 CD 81 D9         [ 4]  983 	call	_i2c_set_start_ack
                                    984 ;	sensors.c: 402: i2c_send_address (MLX90614_ADDR, I2C_WRITE);
      0084AB 4B 00            [ 1]  985 	push	#0x00
      0084AD 4B 5A            [ 1]  986 	push	#0x5a
      0084AF CD 81 97         [ 4]  987 	call	_i2c_send_address
      0084B2 5B 02            [ 2]  988 	addw	sp, #2
                                    989 ;	sensors.c: 403: i2c_send_reg(0x07); // object temperature		
      0084B4 4B 07            [ 1]  990 	push	#0x07
      0084B6 CD 81 5E         [ 4]  991 	call	_i2c_send_reg
      0084B9 84               [ 1]  992 	pop	a
                                    993 ;	sensors.c: 405: i2c_set_start_ack ();
      0084BA CD 81 D9         [ 4]  994 	call	_i2c_set_start_ack
                                    995 ;	sensors.c: 406: i2c_send_address (MLX90614_ADDR, I2C_READ);
      0084BD 4B 01            [ 1]  996 	push	#0x01
      0084BF 4B 5A            [ 1]  997 	push	#0x5a
      0084C1 CD 81 97         [ 4]  998 	call	_i2c_send_address
      0084C4 5B 02            [ 2]  999 	addw	sp, #2
                                   1000 ;	sensors.c: 407: reg = I2C_SR1;
      0084C6 AE 52 17         [ 2] 1001 	ldw	x, #0x5217
      0084C9 F6               [ 1] 1002 	ld	a, (x)
      0084CA 5F               [ 1] 1003 	clrw	x
      0084CB 97               [ 1] 1004 	ld	xl, a
      0084CC 1F 0C            [ 2] 1005 	ldw	(0x0c, sp), x
                                   1006 ;	sensors.c: 408: reg = I2C_SR3;
      0084CE AE 52 19         [ 2] 1007 	ldw	x, #0x5219
      0084D1 F6               [ 1] 1008 	ld	a, (x)
      0084D2 5F               [ 1] 1009 	clrw	x
      0084D3 97               [ 1] 1010 	ld	xl, a
      0084D4 1F 0C            [ 2] 1011 	ldw	(0x0c, sp), x
                                   1012 ;	sensors.c: 410: i2c_set_nak();
      0084D6 CD 81 4E         [ 4] 1013 	call	_i2c_set_nak
                                   1014 ;	sensors.c: 412: i2c_read (&x);
      0084D9 96               [ 1] 1015 	ldw	x, sp
      0084DA 1C 00 0E         [ 2] 1016 	addw	x, #14
      0084DD 90 93            [ 1] 1017 	ldw	y, x
      0084DF 89               [ 2] 1018 	pushw	x
      0084E0 90 89            [ 2] 1019 	pushw	y
      0084E2 CD 81 3D         [ 4] 1020 	call	_i2c_read
      0084E5 5B 02            [ 2] 1021 	addw	sp, #2
      0084E7 85               [ 2] 1022 	popw	x
                                   1023 ;	sensors.c: 413: p1=x;
      0084E8 7B 0E            [ 1] 1024 	ld	a, (0x0e, sp)
      0084EA 6B 0B            [ 1] 1025 	ld	(0x0b, sp), a
                                   1026 ;	sensors.c: 414: i2c_read (&x);
      0084EC 89               [ 2] 1027 	pushw	x
      0084ED CD 81 3D         [ 4] 1028 	call	_i2c_read
      0084F0 5B 02            [ 2] 1029 	addw	sp, #2
                                   1030 ;	sensors.c: 415: p2=x;
      0084F2 7B 0E            [ 1] 1031 	ld	a, (0x0e, sp)
                                   1032 ;	sensors.c: 416: i2c_set_stop ();
      0084F4 88               [ 1] 1033 	push	a
      0084F5 CD 81 56         [ 4] 1034 	call	_i2c_set_stop
      0084F8 84               [ 1] 1035 	pop	a
                                   1036 ;	sensors.c: 418: objTemp = ((((p2&0x007f)<<8)+p1)*2)-27315; //subtract kelvin for celcius
      0084F9 A4 7F            [ 1] 1037 	and	a, #0x7f
      0084FB 5F               [ 1] 1038 	clrw	x
      0084FC 97               [ 1] 1039 	ld	xl, a
      0084FD 58               [ 2] 1040 	sllw	x
      0084FE 58               [ 2] 1041 	sllw	x
      0084FF 58               [ 2] 1042 	sllw	x
      008500 58               [ 2] 1043 	sllw	x
      008501 58               [ 2] 1044 	sllw	x
      008502 58               [ 2] 1045 	sllw	x
      008503 58               [ 2] 1046 	sllw	x
      008504 58               [ 2] 1047 	sllw	x
      008505 7B 0B            [ 1] 1048 	ld	a, (0x0b, sp)
      008507 6B 16            [ 1] 1049 	ld	(0x16, sp), a
      008509 7B 16            [ 1] 1050 	ld	a, (0x16, sp)
      00850B 49               [ 1] 1051 	rlc	a
      00850C 4F               [ 1] 1052 	clr	a
      00850D A2 00            [ 1] 1053 	sbc	a, #0x00
      00850F 6B 15            [ 1] 1054 	ld	(0x15, sp), a
      008511 72 FB 15         [ 2] 1055 	addw	x, (0x15, sp)
      008514 58               [ 2] 1056 	sllw	x
      008515 1D 6A B3         [ 2] 1057 	subw	x, #0x6ab3
      008518 89               [ 2] 1058 	pushw	x
      008519 CD 8B 67         [ 4] 1059 	call	___sint2fs
      00851C 5B 02            [ 2] 1060 	addw	sp, #2
      00851E 1F 09            [ 2] 1061 	ldw	(0x09, sp), x
      008520 17 07            [ 2] 1062 	ldw	(0x07, sp), y
                                   1063 ;	sensors.c: 421: while (objTemp > 1000) {
      008522 5F               [ 1] 1064 	clrw	x
      008523 1F 01            [ 2] 1065 	ldw	(0x01, sp), x
      008525                       1066 00101$:
      008525 5F               [ 1] 1067 	clrw	x
      008526 89               [ 2] 1068 	pushw	x
      008527 4B 7A            [ 1] 1069 	push	#0x7a
      008529 4B 44            [ 1] 1070 	push	#0x44
      00852B 1E 0D            [ 2] 1071 	ldw	x, (0x0d, sp)
      00852D 89               [ 2] 1072 	pushw	x
      00852E 1E 0D            [ 2] 1073 	ldw	x, (0x0d, sp)
      008530 89               [ 2] 1074 	pushw	x
      008531 CD 86 7E         [ 4] 1075 	call	___fsgt
      008534 5B 08            [ 2] 1076 	addw	sp, #8
      008536 4D               [ 1] 1077 	tnz	a
      008537 27 1C            [ 1] 1078 	jreq	00127$
                                   1079 ;	sensors.c: 422: vierde+=1;
      008539 1E 01            [ 2] 1080 	ldw	x, (0x01, sp)
      00853B 5C               [ 2] 1081 	incw	x
      00853C 1F 01            [ 2] 1082 	ldw	(0x01, sp), x
                                   1083 ;	sensors.c: 423: objTemp-=1000;
      00853E 5F               [ 1] 1084 	clrw	x
      00853F 89               [ 2] 1085 	pushw	x
      008540 4B 7A            [ 1] 1086 	push	#0x7a
      008542 4B 44            [ 1] 1087 	push	#0x44
      008544 1E 0D            [ 2] 1088 	ldw	x, (0x0d, sp)
      008546 89               [ 2] 1089 	pushw	x
      008547 1E 0D            [ 2] 1090 	ldw	x, (0x0d, sp)
      008549 89               [ 2] 1091 	pushw	x
      00854A CD 86 56         [ 4] 1092 	call	___fssub
      00854D 5B 08            [ 2] 1093 	addw	sp, #8
      00854F 1F 09            [ 2] 1094 	ldw	(0x09, sp), x
      008551 17 07            [ 2] 1095 	ldw	(0x07, sp), y
      008553 20 D0            [ 2] 1096 	jra	00101$
                                   1097 ;	sensors.c: 425: while (objTemp > 100) {
      008555                       1098 00127$:
      008555 16 01            [ 2] 1099 	ldw	y, (0x01, sp)
      008557 17 13            [ 2] 1100 	ldw	(0x13, sp), y
      008559 5F               [ 1] 1101 	clrw	x
      00855A 1F 03            [ 2] 1102 	ldw	(0x03, sp), x
      00855C                       1103 00104$:
      00855C 5F               [ 1] 1104 	clrw	x
      00855D 89               [ 2] 1105 	pushw	x
      00855E 4B C8            [ 1] 1106 	push	#0xc8
      008560 4B 42            [ 1] 1107 	push	#0x42
      008562 1E 0D            [ 2] 1108 	ldw	x, (0x0d, sp)
      008564 89               [ 2] 1109 	pushw	x
      008565 1E 0D            [ 2] 1110 	ldw	x, (0x0d, sp)
      008567 89               [ 2] 1111 	pushw	x
      008568 CD 86 7E         [ 4] 1112 	call	___fsgt
      00856B 5B 08            [ 2] 1113 	addw	sp, #8
      00856D 4D               [ 1] 1114 	tnz	a
      00856E 27 1C            [ 1] 1115 	jreq	00128$
                                   1116 ;	sensors.c: 426: derde+=1;
      008570 1E 03            [ 2] 1117 	ldw	x, (0x03, sp)
      008572 5C               [ 2] 1118 	incw	x
      008573 1F 03            [ 2] 1119 	ldw	(0x03, sp), x
                                   1120 ;	sensors.c: 427: objTemp-=100;
      008575 5F               [ 1] 1121 	clrw	x
      008576 89               [ 2] 1122 	pushw	x
      008577 4B C8            [ 1] 1123 	push	#0xc8
      008579 4B 42            [ 1] 1124 	push	#0x42
      00857B 1E 0D            [ 2] 1125 	ldw	x, (0x0d, sp)
      00857D 89               [ 2] 1126 	pushw	x
      00857E 1E 0D            [ 2] 1127 	ldw	x, (0x0d, sp)
      008580 89               [ 2] 1128 	pushw	x
      008581 CD 86 56         [ 4] 1129 	call	___fssub
      008584 5B 08            [ 2] 1130 	addw	sp, #8
      008586 1F 09            [ 2] 1131 	ldw	(0x09, sp), x
      008588 17 07            [ 2] 1132 	ldw	(0x07, sp), y
      00858A 20 D0            [ 2] 1133 	jra	00104$
                                   1134 ;	sensors.c: 429: while (objTemp > 10) {
      00858C                       1135 00128$:
      00858C 16 03            [ 2] 1136 	ldw	y, (0x03, sp)
      00858E 17 11            [ 2] 1137 	ldw	(0x11, sp), y
      008590 5F               [ 1] 1138 	clrw	x
      008591 1F 05            [ 2] 1139 	ldw	(0x05, sp), x
      008593                       1140 00107$:
      008593 5F               [ 1] 1141 	clrw	x
      008594 89               [ 2] 1142 	pushw	x
      008595 4B 20            [ 1] 1143 	push	#0x20
      008597 4B 41            [ 1] 1144 	push	#0x41
      008599 1E 0D            [ 2] 1145 	ldw	x, (0x0d, sp)
      00859B 89               [ 2] 1146 	pushw	x
      00859C 1E 0D            [ 2] 1147 	ldw	x, (0x0d, sp)
      00859E 89               [ 2] 1148 	pushw	x
      00859F CD 86 7E         [ 4] 1149 	call	___fsgt
      0085A2 5B 08            [ 2] 1150 	addw	sp, #8
      0085A4 4D               [ 1] 1151 	tnz	a
      0085A5 27 1C            [ 1] 1152 	jreq	00129$
                                   1153 ;	sensors.c: 430: tweede+=1;
      0085A7 1E 05            [ 2] 1154 	ldw	x, (0x05, sp)
      0085A9 5C               [ 2] 1155 	incw	x
      0085AA 1F 05            [ 2] 1156 	ldw	(0x05, sp), x
                                   1157 ;	sensors.c: 431: objTemp-=10;
      0085AC 5F               [ 1] 1158 	clrw	x
      0085AD 89               [ 2] 1159 	pushw	x
      0085AE 4B 20            [ 1] 1160 	push	#0x20
      0085B0 4B 41            [ 1] 1161 	push	#0x41
      0085B2 1E 0D            [ 2] 1162 	ldw	x, (0x0d, sp)
      0085B4 89               [ 2] 1163 	pushw	x
      0085B5 1E 0D            [ 2] 1164 	ldw	x, (0x0d, sp)
      0085B7 89               [ 2] 1165 	pushw	x
      0085B8 CD 86 56         [ 4] 1166 	call	___fssub
      0085BB 5B 08            [ 2] 1167 	addw	sp, #8
      0085BD 1F 09            [ 2] 1168 	ldw	(0x09, sp), x
      0085BF 17 07            [ 2] 1169 	ldw	(0x07, sp), y
      0085C1 20 D0            [ 2] 1170 	jra	00107$
                                   1171 ;	sensors.c: 433: while (objTemp > 0)
      0085C3                       1172 00129$:
      0085C3 16 05            [ 2] 1173 	ldw	y, (0x05, sp)
      0085C5 17 1B            [ 2] 1174 	ldw	(0x1b, sp), y
      0085C7 5F               [ 1] 1175 	clrw	x
      0085C8 1F 0F            [ 2] 1176 	ldw	(0x0f, sp), x
      0085CA                       1177 00110$:
      0085CA 5F               [ 1] 1178 	clrw	x
      0085CB 89               [ 2] 1179 	pushw	x
      0085CC 5F               [ 1] 1180 	clrw	x
      0085CD 89               [ 2] 1181 	pushw	x
      0085CE 1E 0D            [ 2] 1182 	ldw	x, (0x0d, sp)
      0085D0 89               [ 2] 1183 	pushw	x
      0085D1 1E 0D            [ 2] 1184 	ldw	x, (0x0d, sp)
      0085D3 89               [ 2] 1185 	pushw	x
      0085D4 CD 86 7E         [ 4] 1186 	call	___fsgt
      0085D7 5B 08            [ 2] 1187 	addw	sp, #8
      0085D9 4D               [ 1] 1188 	tnz	a
      0085DA 27 1C            [ 1] 1189 	jreq	00112$
                                   1190 ;	sensors.c: 435: eerste+=1;
      0085DC 1E 0F            [ 2] 1191 	ldw	x, (0x0f, sp)
      0085DE 5C               [ 2] 1192 	incw	x
      0085DF 1F 0F            [ 2] 1193 	ldw	(0x0f, sp), x
                                   1194 ;	sensors.c: 436: objTemp-=1;
      0085E1 5F               [ 1] 1195 	clrw	x
      0085E2 89               [ 2] 1196 	pushw	x
      0085E3 4B 80            [ 1] 1197 	push	#0x80
      0085E5 4B 3F            [ 1] 1198 	push	#0x3f
      0085E7 1E 0D            [ 2] 1199 	ldw	x, (0x0d, sp)
      0085E9 89               [ 2] 1200 	pushw	x
      0085EA 1E 0D            [ 2] 1201 	ldw	x, (0x0d, sp)
      0085EC 89               [ 2] 1202 	pushw	x
      0085ED CD 86 56         [ 4] 1203 	call	___fssub
      0085F0 5B 08            [ 2] 1204 	addw	sp, #8
      0085F2 1F 09            [ 2] 1205 	ldw	(0x09, sp), x
      0085F4 17 07            [ 2] 1206 	ldw	(0x07, sp), y
      0085F6 20 D2            [ 2] 1207 	jra	00110$
      0085F8                       1208 00112$:
                                   1209 ;	sensors.c: 439: utemp=vierde*1000+derde*100+tweede*10+eerste;
      0085F8 1E 13            [ 2] 1210 	ldw	x, (0x13, sp)
      0085FA 89               [ 2] 1211 	pushw	x
      0085FB 4B E8            [ 1] 1212 	push	#0xe8
      0085FD 4B 03            [ 1] 1213 	push	#0x03
      0085FF CD 87 85         [ 4] 1214 	call	__mulint
      008602 5B 04            [ 2] 1215 	addw	sp, #4
      008604 1F 19            [ 2] 1216 	ldw	(0x19, sp), x
      008606 1E 11            [ 2] 1217 	ldw	x, (0x11, sp)
      008608 89               [ 2] 1218 	pushw	x
      008609 4B 64            [ 1] 1219 	push	#0x64
      00860B 4B 00            [ 1] 1220 	push	#0x00
      00860D CD 87 85         [ 4] 1221 	call	__mulint
      008610 5B 04            [ 2] 1222 	addw	sp, #4
      008612 72 FB 19         [ 2] 1223 	addw	x, (0x19, sp)
      008615 1F 17            [ 2] 1224 	ldw	(0x17, sp), x
      008617 1E 1B            [ 2] 1225 	ldw	x, (0x1b, sp)
      008619 89               [ 2] 1226 	pushw	x
      00861A 4B 0A            [ 1] 1227 	push	#0x0a
      00861C 4B 00            [ 1] 1228 	push	#0x00
      00861E CD 87 85         [ 4] 1229 	call	__mulint
      008621 5B 04            [ 2] 1230 	addw	sp, #4
      008623 72 FB 17         [ 2] 1231 	addw	x, (0x17, sp)
      008626 72 FB 0F         [ 2] 1232 	addw	x, (0x0f, sp)
      008629 90 5F            [ 1] 1233 	clrw	y
      00862B 5D               [ 2] 1234 	tnzw	x
      00862C 2A 02            [ 1] 1235 	jrpl	00162$
      00862E 90 5A            [ 2] 1236 	decw	y
      008630                       1237 00162$:
                                   1238 ;	sensors.c: 442: tm1637DisplayDecimal(utemp, 1); // eg 37:12
      008630 4B 01            [ 1] 1239 	push	#0x01
      008632 4B 00            [ 1] 1240 	push	#0x00
      008634 89               [ 2] 1241 	pushw	x
      008635 90 89            [ 2] 1242 	pushw	y
      008637 CD 83 26         [ 4] 1243 	call	_tm1637DisplayDecimal
      00863A 5B 06            [ 2] 1244 	addw	sp, #6
                                   1245 ;	sensors.c: 445: delayTenMicro();
      00863C CD 80 A0         [ 4] 1246 	call	_delayTenMicro
      00863F CC 84 A8         [ 2] 1247 	jp	00114$
      008642 5B 1C            [ 2] 1248 	addw	sp, #28
      008644 81               [ 4] 1249 	ret
                                   1250 	.area CODE
      008645                       1251 _segmentMap:
      008645 3F                    1252 	.db #0x3F	;  63
      008646 06                    1253 	.db #0x06	;  6
      008647 5B                    1254 	.db #0x5B	;  91
      008648 4F                    1255 	.db #0x4F	;  79	'O'
      008649 66                    1256 	.db #0x66	;  102	'f'
      00864A 6D                    1257 	.db #0x6D	;  109	'm'
      00864B 7D                    1258 	.db #0x7D	;  125
      00864C 07                    1259 	.db #0x07	;  7
      00864D 7F                    1260 	.db #0x7F	;  127
      00864E 6F                    1261 	.db #0x6F	;  111	'o'
      00864F 77                    1262 	.db #0x77	;  119	'w'
      008650 7C                    1263 	.db #0x7C	;  124
      008651 39                    1264 	.db #0x39	;  57	'9'
      008652 5E                    1265 	.db #0x5E	;  94
      008653 79                    1266 	.db #0x79	;  121	'y'
      008654 71                    1267 	.db #0x71	;  113	'q'
      008655 00                    1268 	.db #0x00	;  0
                                   1269 	.area INITIALIZER
                                   1270 	.area CABS (ABS)
