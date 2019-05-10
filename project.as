opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F685
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_BoardInit
	FNCALL	_main,_Task_Idle
	FNCALL	_main,_Task_IRSend
	FNCALL	_main,_Task_Key
	FNCALL	_main,_Task_SoftPwm
	FNCALL	_main,_Task_LowBat
	FNCALL	_Task_LowBat,_GET_ADC_DATA
	FNCALL	_GET_ADC_DATA,_DelayUs
	FNCALL	_Task_IRSend,_DelayUs
	FNCALL	_Task_Idle,_Timer2Init
	FNCALL	_Task_Idle,_DelayUs
	FNCALL	_BoardInit,_ClockInit
	FNCALL	_BoardInit,_Timer0Init
	FNCALL	_BoardInit,_Timer1Init
	FNCALL	_BoardInit,_INTInit
	FNCALL	_BoardInit,_Pwm4Init
	FNCALL	_BoardInit,_Pwm5Init
	FNCALL	_BoardInit,_ADCInit
	FNROOT	_main
	FNCALL	_ISR,_Timer1DeInit
	FNCALL	_ISR,_Timer2DeInit
	FNCALL	_ISR,i1_Timer1Init
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_adcVal
	global	_tim1val
	global	_ReadAPin
	global	Task_Key@key_press_time
	global	_cct
	global	_sys_status
	global	_task_ready
	global	_ticks
	global	_PSTRCON
psect	text494,local,class=CODE,delta=2
global __ptext494
__ptext494:
_PSTRCON	set	413
	DABS	1,413,1	;_PSTRCON

	global	_SRCON
_SRCON	set	414
	DABS	1,414,1	;_SRCON

	global	_C1SEN
_C1SEN	set	3317
	DABS	1,414,1	;_C1SEN

	global	_C2REN
_C2REN	set	3316
	DABS	1,414,1	;_C2REN

	global	_EEPGD
_EEPGD	set	3175
	DABS	1,396,1	;_EEPGD

	global	_PULSR
_PULSR	set	3314
	DABS	1,414,1	;_PULSR

	global	_PULSS
_PULSS	set	3315
	DABS	1,414,1	;_PULSS

	global	_SR0
_SR0	set	3318
	DABS	1,414,1	;_SR0

	global	_SR1
_SR1	set	3319
	DABS	1,414,1	;_SR1

	global	_STRA
_STRA	set	3304
	DABS	1,413,1	;_STRA

	global	_STRB
_STRB	set	3305
	DABS	1,413,1	;_STRB

	global	_STRC
_STRC	set	3306
	DABS	1,413,1	;_STRC

	global	_STRD
_STRD	set	3307
	DABS	1,413,1	;_STRD

	global	_STRSYNC
_STRSYNC	set	3308
	DABS	1,413,1	;_STRSYNC

	global	_WREN
_WREN	set	3170
	DABS	1,396,1	;_WREN

	global	_brightCW
psect	nvBANK0,class=BANK0,space=1
global __pnvBANK0
__pnvBANK0:
_brightCW:
       ds      1

	global	_brightWW
_brightWW:
       ds      1

	global	_bright
psect	nvCOMMON,class=COMMON,space=1
global __pnvCOMMON
__pnvCOMMON:
_bright:
       ds      1

	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_CMCON0
_CMCON0	set	25
	global	_INTCON
_INTCON	set	11
	global	_MSCKCON
_MSCKCON	set	27
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_T1CON
_T1CON	set	16
	global	_T2CON
_T2CON	set	18
	global	_TMR0
_TMR0	set	1
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_TMR2
_TMR2	set	17
	global	_GIE
_GIE	set	95
	global	_GO_DONE
_GO_DONE	set	249
	global	_INTE
_INTE	set	92
	global	_INTF
_INTF	set	89
	global	_PA3
_PA3	set	43
	global	_PA6
_PA6	set	46
	global	_PA7
_PA7	set	47
	global	_PC4
_PC4	set	60
	global	_PEIE
_PEIE	set	94
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR1ON
_TMR1ON	set	128
	global	_TMR2IF
_TMR2IF	set	97
	global	_TMR2ON
_TMR2ON	set	146
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_ANSEL
_ANSEL	set	145
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_PR2
_PR2	set	146
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WPUA
_WPUA	set	149
	global	_WPUC
_WPUC	set	136
	global	_INTEDG
_INTEDG	set	1038
	global	_TMR1IE
_TMR1IE	set	1120
	global	_TMR2IE
_TMR2IE	set	1121
	global	_TRISA3
_TRISA3	set	1067
	global	_TRISC1
_TRISC1	set	1081
	global	_TRISC2
_TRISC2	set	1082
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
	global	_PR4L
_PR4L	set	276
	global	_PR5L
_PR5L	set	282
	global	_PWM4CR0
_PWM4CR0	set	277
	global	_PWM4CR1
_PWM4CR1	set	278
	global	_PWM5CR0
_PWM5CR0	set	283
	global	_PWM5CR1
_PWM5CR1	set	284
	global	_T4CKDIV
_T4CKDIV	set	279
	global	_T5CKDIV
_T5CKDIV	set	285
	global	_TMR4H
_TMR4H	set	275
	global	_TMR5H
_TMR5H	set	281
	global	_TMR4ON
_TMR4ON	set	2226
	global	_TMR5ON
_TMR5ON	set	2274
	file	"project.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
Task_Key@key_press_time:
       ds      1

_cct:
       ds      1

_sys_status:
       ds      1

_task_ready:
       ds      1

_ticks:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_adcVal:
       ds      2

_tim1val:
       ds      2

_ReadAPin:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_BoardInit
?_BoardInit:	; 0 bytes @ 0x0
	global	?_Task_Idle
?_Task_Idle:	; 0 bytes @ 0x0
	global	?_Task_IRSend
?_Task_IRSend:	; 0 bytes @ 0x0
	global	?_Task_Key
?_Task_Key:	; 0 bytes @ 0x0
	global	?_Task_SoftPwm
?_Task_SoftPwm:	; 0 bytes @ 0x0
	global	?_Task_LowBat
?_Task_LowBat:	; 0 bytes @ 0x0
	global	?_Timer1DeInit
?_Timer1DeInit:	; 0 bytes @ 0x0
	global	??_Timer1DeInit
??_Timer1DeInit:	; 0 bytes @ 0x0
	global	?_Timer2DeInit
?_Timer2DeInit:	; 0 bytes @ 0x0
	global	??_Timer2DeInit
??_Timer2DeInit:	; 0 bytes @ 0x0
	global	?_Timer1Init
?_Timer1Init:	; 0 bytes @ 0x0
	global	?_DelayUs
?_DelayUs:	; 0 bytes @ 0x0
	global	?_Timer2Init
?_Timer2Init:	; 0 bytes @ 0x0
	global	?_ClockInit
?_ClockInit:	; 0 bytes @ 0x0
	global	?_Timer0Init
?_Timer0Init:	; 0 bytes @ 0x0
	global	?_INTInit
?_INTInit:	; 0 bytes @ 0x0
	global	?_Pwm4Init
?_Pwm4Init:	; 0 bytes @ 0x0
	global	?_Pwm5Init
?_Pwm5Init:	; 0 bytes @ 0x0
	global	?_ADCInit
?_ADCInit:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?i1_Timer1Init
?i1_Timer1Init:	; 0 bytes @ 0x0
	global	??i1_Timer1Init
??i1_Timer1Init:	; 0 bytes @ 0x0
	ds	2
	global	??_BoardInit
??_BoardInit:	; 0 bytes @ 0x2
	global	??_Task_Key
??_Task_Key:	; 0 bytes @ 0x2
	global	??_Task_SoftPwm
??_Task_SoftPwm:	; 0 bytes @ 0x2
	global	??_Timer1Init
??_Timer1Init:	; 0 bytes @ 0x2
	global	??_DelayUs
??_DelayUs:	; 0 bytes @ 0x2
	global	??_Timer2Init
??_Timer2Init:	; 0 bytes @ 0x2
	global	??_ClockInit
??_ClockInit:	; 0 bytes @ 0x2
	global	??_Timer0Init
??_Timer0Init:	; 0 bytes @ 0x2
	global	??_INTInit
??_INTInit:	; 0 bytes @ 0x2
	global	??_Pwm4Init
??_Pwm4Init:	; 0 bytes @ 0x2
	global	??_Pwm5Init
??_Pwm5Init:	; 0 bytes @ 0x2
	global	??_ADCInit
??_ADCInit:	; 0 bytes @ 0x2
	global	DelayUs@Time
DelayUs@Time:	; 1 bytes @ 0x2
	ds	1
	global	DelayUs@a
DelayUs@a:	; 1 bytes @ 0x3
	ds	1
	global	??_Task_Idle
??_Task_Idle:	; 0 bytes @ 0x4
	global	??_Task_IRSend
??_Task_IRSend:	; 0 bytes @ 0x4
	global	?_GET_ADC_DATA
?_GET_ADC_DATA:	; 2 bytes @ 0x4
	ds	2
	global	??_Task_LowBat
??_Task_LowBat:	; 0 bytes @ 0x6
	global	??_GET_ADC_DATA
??_GET_ADC_DATA:	; 0 bytes @ 0x6
	global	??_main
??_main:	; 0 bytes @ 0x6
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	GET_ADC_DATA@tBuffer
GET_ADC_DATA@tBuffer:	; 2 bytes @ 0x0
	ds	2
	global	GET_ADC_DATA@AN_CH
GET_ADC_DATA@AN_CH:	; 1 bytes @ 0x2
	ds	1
	global	GET_ADC_DATA@ADC_DATA
GET_ADC_DATA@ADC_DATA:	; 2 bytes @ 0x3
	ds	2
	global	GET_ADC_DATA@ADCON0Buff
GET_ADC_DATA@ADCON0Buff:	; 1 bytes @ 0x5
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 10, persistent 3 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      12
;; BANK0           80      6      13
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; ?_GET_ADC_DATA	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _Task_LowBat->_GET_ADC_DATA
;;   _GET_ADC_DATA->_DelayUs
;;   _Task_IRSend->_DelayUs
;;   _Task_Idle->_DelayUs
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _Task_LowBat->_GET_ADC_DATA
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0     236
;;                          _BoardInit
;;                          _Task_Idle
;;                        _Task_IRSend
;;                           _Task_Key
;;                       _Task_SoftPwm
;;                        _Task_LowBat
;; ---------------------------------------------------------------------------------
;; (1) _Task_LowBat                                          0     0      0     144
;;                       _GET_ADC_DATA
;; ---------------------------------------------------------------------------------
;; (2) _GET_ADC_DATA                                         9     7      2     144
;;                                              4 COMMON     2     0      2
;;                                              0 BANK0      6     6      0
;;                            _DelayUs
;; ---------------------------------------------------------------------------------
;; (1) _Task_IRSend                                          0     0      0      46
;;                            _DelayUs
;; ---------------------------------------------------------------------------------
;; (1) _Task_Idle                                            0     0      0      46
;;                         _Timer2Init
;;                            _DelayUs
;; ---------------------------------------------------------------------------------
;; (3) _DelayUs                                              2     2      0      46
;;                                              2 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _BoardInit                                            0     0      0       0
;;                          _ClockInit
;;                         _Timer0Init
;;                         _Timer1Init
;;                            _INTInit
;;                           _Pwm4Init
;;                           _Pwm5Init
;;                            _ADCInit
;; ---------------------------------------------------------------------------------
;; (2) _ADCInit                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _Pwm5Init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _Pwm4Init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _INTInit                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _Timer0Init                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _ClockInit                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _Timer2Init                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _Timer1Init                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _Task_SoftPwm                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _Task_Key                                             1     1      0       0
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _ISR                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;;                       _Timer1DeInit
;;                       _Timer2DeInit
;;                       i1_Timer1Init
;; ---------------------------------------------------------------------------------
;; (5) i1_Timer1Init                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (5) _Timer2DeInit                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (5) _Timer1DeInit                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _BoardInit
;;     _ClockInit
;;     _Timer0Init
;;     _Timer1Init
;;     _INTInit
;;     _Pwm4Init
;;     _Pwm5Init
;;     _ADCInit
;;   _Task_Idle
;;     _Timer2Init
;;     _DelayUs
;;   _Task_IRSend
;;     _DelayUs
;;   _Task_Key
;;   _Task_SoftPwm
;;   _Task_LowBat
;;     _GET_ADC_DATA
;;       _DelayUs
;;
;; _ISR (ROOT)
;;   _Timer1DeInit
;;   _Timer2DeInit
;;   i1_Timer1Init
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      6       C       1       85.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       7       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50      6       D       4       16.3%
;;BITBANK1            20      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BANK1               20      0       0       6        0.0%
;;ABS                  0      0      19       7        0.0%
;;DATA                 0      0      20       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 49 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_BoardInit
;;		_Task_Idle
;;		_Task_IRSend
;;		_Task_Key
;;		_Task_SoftPwm
;;		_Task_LowBat
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"main.c"
	line	49
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	51
	
l4024:	
;main.c: 51: BoardInit( );
	fcall	_BoardInit
	line	52
	
l4026:	
;main.c: 52: bright = 255;
	movlw	(0FFh)
	movwf	(_bright)
	line	53
	
l4028:	
;main.c: 53: brightWW = bright;
	movf	(_bright),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_brightWW)
	line	54
	
l4030:	
;main.c: 54: brightCW = bright;
	movf	(_bright),w
	movwf	(_brightCW)
	line	55
	
l4032:	
;main.c: 55: cct = 0;
	clrf	(_cct)
	line	56
	
l4034:	
;main.c: 56: TMR4ON = 1;
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2226/8)^0100h,(2226)&7
	line	57
	
l4036:	
;main.c: 57: TRISC3 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1083/8)^080h,(1083)&7
	line	58
	
l4038:	
;main.c: 58: TMR5ON = 1;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2274/8)^0100h,(2274)&7
	line	59
	
l4040:	
;main.c: 59: TRISC2 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1082/8)^080h,(1082)&7
	line	67
	
l4042:	
;main.c: 67: sys_status.bit0 = 1;
	bsf	(_sys_status),0	;volatile
	line	72
	
l4044:	
;main.c: 71: {
;main.c: 72: if ( !sys_status.bit0 ){
	btfsc	(_sys_status),0	;volatile
	goto	u761
	goto	u760
u761:
	goto	l4048
u760:
	line	73
	
l4046:	
;main.c: 73: Task_Idle();
	fcall	_Task_Idle
	line	74
;main.c: 74: }
	goto	l4044
	line	76
	
l4048:	
;main.c: 75: else {
;main.c: 76: Task_IRSend();
	fcall	_Task_IRSend
	line	77
;main.c: 77: Task_Key();
	fcall	_Task_Key
	line	78
;main.c: 78: Task_SoftPwm();
	fcall	_Task_SoftPwm
	line	79
;main.c: 79: Task_LowBat();
	fcall	_Task_LowBat
	goto	l4044
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	84
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_Task_LowBat
psect	text495,local,class=CODE,delta=2
global __ptext495
__ptext495:

;; *************** function _Task_LowBat *****************
;; Defined at:
;;		line 306 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_GET_ADC_DATA
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text495
	file	"main.c"
	line	306
	global	__size_of_Task_LowBat
	__size_of_Task_LowBat	equ	__end_of_Task_LowBat-_Task_LowBat
	
_Task_LowBat:	
	opt	stack 3
; Regs used in _Task_LowBat: [wreg+status,2+status,0+pclath+cstack]
	line	307
	
l4008:	
;main.c: 307: if ( sys_status.bit6 ){
	btfss	(_sys_status),6	;volatile
	goto	u711
	goto	u710
u711:
	goto	l1177
u710:
	line	308
	
l4010:	
;main.c: 308: adcVal = GET_ADC_DATA(2);
	movlw	(02h)
	fcall	_GET_ADC_DATA
	movf	(1+(?_GET_ADC_DATA)),w
	movwf	(_adcVal+1)
	movf	(0+(?_GET_ADC_DATA)),w
	movwf	(_adcVal)
	line	309
	
l4012:	
;main.c: 309: if ( !PA3 )
	btfsc	(43/8),(43)&7
	goto	u721
	goto	u720
u721:
	goto	l1170
u720:
	line	310
	
l4014:	
;main.c: 310: sys_status.bit4 = 1;
	bsf	(_sys_status),4	;volatile
	goto	l1171
	line	311
	
l1170:	
	line	312
;main.c: 311: else
;main.c: 312: sys_status.bit4 = 0;
	bcf	(_sys_status),4	;volatile
	
l1171:	
	line	313
;main.c: 313: if ( sys_status.bit4 ){
	btfss	(_sys_status),4	;volatile
	goto	u731
	goto	u730
u731:
	goto	l1172
u730:
	line	314
	
l4016:	
;main.c: 314: PA6=1;
	bsf	(46/8),(46)&7
	line	315
;main.c: 315: PA7=0;
	bcf	(47/8),(47)&7
	line	316
;main.c: 316: }
	goto	l1173
	line	317
	
l1172:	
	line	318
;main.c: 317: else {
;main.c: 318: PA6=0;
	bcf	(46/8),(46)&7
	line	319
	
l4018:	
;main.c: 319: if ( cct ){
	movf	(_cct),w
	skipz
	goto	u740
	goto	l1174
u740:
	line	320
	
l4020:	
;main.c: 320: if ( adcVal <= 0x22D ){
	movlw	high(022Eh)
	subwf	(_adcVal+1),w
	movlw	low(022Eh)
	skipnz
	subwf	(_adcVal),w
	skipnc
	goto	u751
	goto	u750
u751:
	goto	l1173
u750:
	line	321
	
l4022:	
;main.c: 321: PA7=1;
	bsf	(47/8),(47)&7
	goto	l1173
	line	324
	
l1174:	
	line	325
;main.c: 324: else
;main.c: 325: PA7=0;
	bcf	(47/8),(47)&7
	line	326
	
l1173:	
	line	327
;main.c: 326: }
;main.c: 327: sys_status.bit6 = 0;
	bcf	(_sys_status),6	;volatile
	line	329
	
l1177:	
	return
	opt stack 0
GLOBAL	__end_of_Task_LowBat
	__end_of_Task_LowBat:
;; =============== function _Task_LowBat ends ============

	signat	_Task_LowBat,88
	global	_GET_ADC_DATA
psect	text496,local,class=CODE,delta=2
global __ptext496
__ptext496:

;; *************** function _GET_ADC_DATA *****************
;; Defined at:
;;		line 372 in file "board.c"
;; Parameters:    Size  Location     Type
;;  AN_CH           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  AN_CH           1    2[BANK0 ] unsigned char 
;;  ADC_DATA        2    3[BANK0 ] unsigned int 
;;  tBuffer         2    0[BANK0 ] unsigned int 
;;  ADCON0Buff      1    5[BANK0 ] unsigned char 
;;  i               1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  2    4[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         0       6       0
;;      Temps:          0       0       0
;;      Totals:         2       6       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_DelayUs
;; This function is called by:
;;		_Task_LowBat
;; This function uses a non-reentrant model
;;
psect	text496
	file	"board.c"
	line	372
	global	__size_of_GET_ADC_DATA
	__size_of_GET_ADC_DATA	equ	__end_of_GET_ADC_DATA-_GET_ADC_DATA
	
_GET_ADC_DATA:	
	opt	stack 3
; Regs used in _GET_ADC_DATA: [wreg+status,2+status,0+pclath+cstack]
;GET_ADC_DATA@AN_CH stored from wreg
	line	376
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(GET_ADC_DATA@AN_CH)
	line	375
	
l3988:	
	line	376
;board.c: 376: uint16_t ADC_DATA=0;
	clrf	(GET_ADC_DATA@ADC_DATA)
	clrf	(GET_ADC_DATA@ADC_DATA+1)
	line	378
	
l3990:	
;board.c: 378: ADCON0Buff = ADCON0 & 0B11100011;
	movf	(31),w
	movwf	(GET_ADC_DATA@ADCON0Buff)
	
l3992:	
	movlw	(0E3h)
	andwf	(GET_ADC_DATA@ADCON0Buff),f
	line	380
	
l3994:	
;board.c: 380: AN_CH <<=2;
	clrc
	rlf	(GET_ADC_DATA@AN_CH),f
	clrc
	rlf	(GET_ADC_DATA@AN_CH),f
	line	381
	
l3996:	
;board.c: 381: ADCON0Buff |= AN_CH;
	movf	(GET_ADC_DATA@AN_CH),w
	iorwf	(GET_ADC_DATA@ADCON0Buff),f
	line	383
	
l3998:	
;board.c: 383: ADCON0 = ADCON0Buff;
	movf	(GET_ADC_DATA@ADCON0Buff),w
	movwf	(31)	;volatile
	line	384
	
l4000:	
;board.c: 384: DelayUs(20);
	movlw	(014h)
	fcall	_DelayUs
	line	385
	
l4002:	
;board.c: 385: GO_DONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	386
;board.c: 386: while( GO_DONE==1 );
	
l2301:	
	btfsc	(249/8),(249)&7
	goto	u701
	goto	u700
u701:
	goto	l2301
u700:
	line	388
	
l4004:	
;board.c: 388: ADC_DATA = ADRESH;
	movf	(30),w	;volatile
	movwf	(GET_ADC_DATA@ADC_DATA)
	clrf	(GET_ADC_DATA@ADC_DATA+1)
	line	389
;board.c: 389: ADC_DATA <<=8;
	movf	(GET_ADC_DATA@ADC_DATA),w
	movwf	(GET_ADC_DATA@ADC_DATA+1)
	clrf	(GET_ADC_DATA@ADC_DATA)
	line	390
;board.c: 390: ADC_DATA |= ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	iorwf	(GET_ADC_DATA@ADC_DATA),f
	line	391
;board.c: 391: tBuffer = ADC_DATA;
	movf	(GET_ADC_DATA@ADC_DATA+1),w
	movwf	(GET_ADC_DATA@tBuffer+1)
	movf	(GET_ADC_DATA@ADC_DATA),w
	movwf	(GET_ADC_DATA@tBuffer)
	line	392
;board.c: 392: return tBuffer;
	movf	(GET_ADC_DATA@tBuffer+1),w
	movwf	(?_GET_ADC_DATA+1)
	movf	(GET_ADC_DATA@tBuffer),w
	movwf	(?_GET_ADC_DATA)
	line	393
	
l2304:	
	return
	opt stack 0
GLOBAL	__end_of_GET_ADC_DATA
	__end_of_GET_ADC_DATA:
;; =============== function _GET_ADC_DATA ends ============

	signat	_GET_ADC_DATA,4218
	global	_Task_IRSend
psect	text497,local,class=CODE,delta=2
global __ptext497
__ptext497:

;; *************** function _Task_IRSend *****************
;; Defined at:
;;		line 290 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_DelayUs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text497
	file	"main.c"
	line	290
	global	__size_of_Task_IRSend
	__size_of_Task_IRSend	equ	__end_of_Task_IRSend-_Task_IRSend
	
_Task_IRSend:	
	opt	stack 4
; Regs used in _Task_IRSend: [wreg+status,2+status,0+pclath+cstack]
	line	291
	
l3978:	
;main.c: 291: if ( task_ready.bit2 ){
	btfss	(_task_ready),2	;volatile
	goto	u691
	goto	u690
u691:
	goto	l1166
u690:
	line	292
	
l3980:	
;main.c: 292: PC4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	293
	
l3982:	
;main.c: 293: DelayUs(200);
	movlw	(0C8h)
	fcall	_DelayUs
	line	294
	
l3984:	
;main.c: 294: PC4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	line	295
	
l3986:	
;main.c: 295: task_ready.bit2 = 0;
	bcf	(_task_ready),2	;volatile
	line	297
	
l1166:	
	return
	opt stack 0
GLOBAL	__end_of_Task_IRSend
	__end_of_Task_IRSend:
;; =============== function _Task_IRSend ends ============

	signat	_Task_IRSend,88
	global	_Task_Idle
psect	text498,local,class=CODE,delta=2
global __ptext498
__ptext498:

;; *************** function _Task_Idle *****************
;; Defined at:
;;		line 338 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_Timer2Init
;;		_DelayUs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text498
	file	"main.c"
	line	338
	global	__size_of_Task_Idle
	__size_of_Task_Idle	equ	__end_of_Task_Idle-_Task_Idle
	
_Task_Idle:	
	opt	stack 4
; Regs used in _Task_Idle: [wreg+status,2+status,0+pclath+cstack]
	line	339
	
l3970:	
# 339 "main.c"
sleep ;#
	line	340
# 340 "main.c"
clrwdt ;#
psect	text498
	line	341
	
l3972:	
;main.c: 341: Timer2Init();
	fcall	_Timer2Init
	line	342
;main.c: 342: DelayUs(100);
	movlw	(064h)
	fcall	_DelayUs
	line	343
	
l3974:	
;main.c: 343: PC4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	344
;main.c: 344: DelayUs(100);
	movlw	(064h)
	fcall	_DelayUs
	line	345
	
l3976:	
;main.c: 345: PC4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	line	346
	
l1180:	
	return
	opt stack 0
GLOBAL	__end_of_Task_Idle
	__end_of_Task_Idle:
;; =============== function _Task_Idle ends ============

	signat	_Task_Idle,88
	global	_DelayUs
psect	text499,local,class=CODE,delta=2
global __ptext499
__ptext499:

;; *************** function _DelayUs *****************
;; Defined at:
;;		line 458 in file "board.c"
;; Parameters:    Size  Location     Type
;;  Time            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Time            1    2[COMMON] unsigned char 
;;  a               1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Task_IRSend
;;		_Task_Idle
;;		_GET_ADC_DATA
;; This function uses a non-reentrant model
;;
psect	text499
	file	"board.c"
	line	458
	global	__size_of_DelayUs
	__size_of_DelayUs	equ	__end_of_DelayUs-_DelayUs
	
_DelayUs:	
	opt	stack 3
; Regs used in _DelayUs: [wreg+status,2+status,0]
;DelayUs@Time stored from wreg
	line	460
	movwf	(DelayUs@Time)
	
l3964:	
;board.c: 459: uint8_t a;
;board.c: 460: for(a=0;a<Time;a++)
	clrf	(DelayUs@a)
	goto	l3968
	line	461
	
l2311:	
	line	462
;board.c: 461: {
;board.c: 462: _nop();
	nop
	line	460
	
l3966:	
	incf	(DelayUs@a),f
	
l3968:	
	movf	(DelayUs@Time),w
	subwf	(DelayUs@a),w
	skipc
	goto	u681
	goto	u680
u681:
	goto	l2311
u680:
	line	464
	
l2313:	
	return
	opt stack 0
GLOBAL	__end_of_DelayUs
	__end_of_DelayUs:
;; =============== function _DelayUs ends ============

	signat	_DelayUs,4216
	global	_BoardInit
psect	text500,local,class=CODE,delta=2
global __ptext500
__ptext500:

;; *************** function _BoardInit *****************
;; Defined at:
;;		line 31 in file "board.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_ClockInit
;;		_Timer0Init
;;		_Timer1Init
;;		_INTInit
;;		_Pwm4Init
;;		_Pwm5Init
;;		_ADCInit
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text500
	file	"board.c"
	line	31
	global	__size_of_BoardInit
	__size_of_BoardInit	equ	__end_of_BoardInit-_BoardInit
	
_BoardInit:	
	opt	stack 4
; Regs used in _BoardInit: [wreg+status,2+status,0+pclath+cstack]
	line	33
	
l3946:	
;board.c: 33: ClockInit();
	fcall	_ClockInit
	line	34
;board.c: 34: Timer0Init();
	fcall	_Timer0Init
	line	35
;board.c: 35: Timer1Init();
	fcall	_Timer1Init
	line	37
;board.c: 37: INTInit();
	fcall	_INTInit
	line	40
;board.c: 40: Pwm4Init();
	fcall	_Pwm4Init
	line	41
;board.c: 41: Pwm5Init();
	fcall	_Pwm5Init
	line	42
;board.c: 42: ADCInit();
	fcall	_ADCInit
	line	45
	
l3948:	
;board.c: 45: PORTA&=0x3f;TRISA&=0x3f;;
	movlw	(03Fh)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(5),f	;volatile
	
l3950:	
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	andwf	(133)^080h,f	;volatile
	line	46
	
l3952:	
;board.c: 46: PC4=0;TRISC4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(60/8),(60)&7
	
l3954:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1084/8)^080h,(1084)&7
	line	47
	
l3956:	
;board.c: 47: PA3 = 1;TRISA3=1;WPUA|=0x08;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(43/8),(43)&7
	
l3958:	
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1067/8)^080h,(1067)&7
	
l3960:	
	bsf	(149)^080h+(3/8),(3)&7	;volatile
	line	53
	
l3962:	
;board.c: 53: GIE = 1;
	bsf	(95/8),(95)&7
	line	54
	
l2265:	
	return
	opt stack 0
GLOBAL	__end_of_BoardInit
	__end_of_BoardInit:
;; =============== function _BoardInit ends ============

	signat	_BoardInit,88
	global	_ADCInit
psect	text501,local,class=CODE,delta=2
global __ptext501
__ptext501:

;; *************** function _ADCInit *****************
;; Defined at:
;;		line 348 in file "board.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_BoardInit
;; This function uses a non-reentrant model
;;
psect	text501
	file	"board.c"
	line	348
	global	__size_of_ADCInit
	__size_of_ADCInit	equ	__end_of_ADCInit-_ADCInit
	
_ADCInit:	
	opt	stack 4
; Regs used in _ADCInit: [wreg]
	line	353
	
l3936:	
;board.c: 353: ADCON1 = 0B01100000;
	movlw	(060h)
	movwf	(159)^080h	;volatile
	line	355
;board.c: 355: ADCON0 = 0B10111101;
	movlw	(0BDh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	362
;board.c: 362: ANSEL = 0B00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	363
	
l2298:	
	return
	opt stack 0
GLOBAL	__end_of_ADCInit
	__end_of_ADCInit:
;; =============== function _ADCInit ends ============

	signat	_ADCInit,88
	global	_Pwm5Init
psect	text502,local,class=CODE,delta=2
global __ptext502
__ptext502:

;; *************** function _Pwm5Init *****************
;; Defined at:
;;		line 314 in file "board.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_BoardInit
;; This function uses a non-reentrant model
;;
psect	text502
	file	"board.c"
	line	314
	global	__size_of_Pwm5Init
	__size_of_Pwm5Init	equ	__end_of_Pwm5Init-_Pwm5Init
	
_Pwm5Init:	
	opt	stack 4
; Regs used in _Pwm5Init: [wreg+status,2]
	line	316
	
l3924:	
;board.c: 316: TRISC2 = 1;
	bsf	(1082/8)^080h,(1082)&7
	line	317
	
l3926:	
;board.c: 317: PWM5CR0 = 0B00110010;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(283)^0100h	;volatile
	line	323
;board.c: 323: PWM5CR1 = 0B10000000;
	movlw	(080h)
	movwf	(284)^0100h	;volatile
	line	331
;board.c: 331: T5CKDIV = 14;
	movlw	(0Eh)
	movwf	(285)^0100h	;volatile
	line	333
	
l3928:	
;board.c: 333: TMR5H = 0;
	clrf	(281)^0100h	;volatile
	line	334
	
l3930:	
;board.c: 334: PR5L = 0;
	clrf	(282)^0100h	;volatile
	line	335
	
l3932:	
;board.c: 335: TMR5ON = 1;
	bsf	(2274/8)^0100h,(2274)&7
	line	336
	
l3934:	
;board.c: 336: TRISC2 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1082/8)^080h,(1082)&7
	line	337
	
l2295:	
	return
	opt stack 0
GLOBAL	__end_of_Pwm5Init
	__end_of_Pwm5Init:
;; =============== function _Pwm5Init ends ============

	signat	_Pwm5Init,88
	global	_Pwm4Init
psect	text503,local,class=CODE,delta=2
global __ptext503
__ptext503:

;; *************** function _Pwm4Init *****************
;; Defined at:
;;		line 280 in file "board.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_BoardInit
;; This function uses a non-reentrant model
;;
psect	text503
	file	"board.c"
	line	280
	global	__size_of_Pwm4Init
	__size_of_Pwm4Init	equ	__end_of_Pwm4Init-_Pwm4Init
	
_Pwm4Init:	
	opt	stack 4
; Regs used in _Pwm4Init: [wreg+status,2]
	line	282
	
l3912:	
;board.c: 282: TRISC3 = 1;
	bsf	(1083/8)^080h,(1083)&7
	line	283
	
l3914:	
;board.c: 283: PWM4CR0 = 0B00110010;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(277)^0100h	;volatile
	line	289
;board.c: 289: PWM4CR1 = 0B10000000;
	movlw	(080h)
	movwf	(278)^0100h	;volatile
	line	297
;board.c: 297: T4CKDIV = 14;
	movlw	(0Eh)
	movwf	(279)^0100h	;volatile
	line	299
	
l3916:	
;board.c: 299: TMR4H = 0;
	clrf	(275)^0100h	;volatile
	line	300
	
l3918:	
;board.c: 300: PR4L = 0;
	clrf	(276)^0100h	;volatile
	line	301
	
l3920:	
;board.c: 301: TMR4ON = 1;
	bsf	(2226/8)^0100h,(2226)&7
	line	302
	
l3922:	
;board.c: 302: TRISC3 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1083/8)^080h,(1083)&7
	line	303
	
l2292:	
	return
	opt stack 0
GLOBAL	__end_of_Pwm4Init
	__end_of_Pwm4Init:
;; =============== function _Pwm4Init ends ============

	signat	_Pwm4Init,88
	global	_INTInit
psect	text504,local,class=CODE,delta=2
global __ptext504
__ptext504:

;; *************** function _INTInit *****************
;; Defined at:
;;		line 209 in file "board.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_BoardInit
;; This function uses a non-reentrant model
;;
psect	text504
	file	"board.c"
	line	209
	global	__size_of_INTInit
	__size_of_INTInit	equ	__end_of_INTInit-_INTInit
	
_INTInit:	
	opt	stack 4
; Regs used in _INTInit: [wreg]
	line	210
	
l3902:	
;board.c: 210: TRISC1 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1081/8)^080h,(1081)&7
	line	211
	
l3904:	
;board.c: 211: ANSEL = 0B11011111;
	movlw	(0DFh)
	movwf	(145)^080h	;volatile
	line	213
	
l3906:	
;board.c: 213: INTEDG = 0;
	bcf	(1038/8)^080h,(1038)&7
	line	214
	
l3908:	
;board.c: 214: INTF = 0;
	bcf	(89/8),(89)&7
	line	215
	
l3910:	
;board.c: 215: INTE = 1;
	bsf	(92/8),(92)&7
	line	216
	
l2286:	
	return
	opt stack 0
GLOBAL	__end_of_INTInit
	__end_of_INTInit:
;; =============== function _INTInit ends ============

	signat	_INTInit,88
	global	_Timer0Init
psect	text505,local,class=CODE,delta=2
global __ptext505
__ptext505:

;; *************** function _Timer0Init *****************
;; Defined at:
;;		line 104 in file "board.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_BoardInit
;; This function uses a non-reentrant model
;;
psect	text505
	file	"board.c"
	line	104
	global	__size_of_Timer0Init
	__size_of_Timer0Init	equ	__end_of_Timer0Init-_Timer0Init
	
_Timer0Init:	
	opt	stack 4
; Regs used in _Timer0Init: [wreg]
	line	105
	
l3896:	
;board.c: 105: OPTION = 0B00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(129)^080h	;volatile
	line	111
	
l3898:	
;board.c: 111: T0IF = 0;
	bcf	(90/8),(90)&7
	line	112
	
l3900:	
;board.c: 112: T0IE = 1;
	bsf	(93/8),(93)&7
	line	113
	
l2271:	
	return
	opt stack 0
GLOBAL	__end_of_Timer0Init
	__end_of_Timer0Init:
;; =============== function _Timer0Init ends ============

	signat	_Timer0Init,88
	global	_ClockInit
psect	text506,local,class=CODE,delta=2
global __ptext506
__ptext506:

;; *************** function _ClockInit *****************
;; Defined at:
;;		line 63 in file "board.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_BoardInit
;; This function uses a non-reentrant model
;;
psect	text506
	file	"board.c"
	line	63
	global	__size_of_ClockInit
	__size_of_ClockInit	equ	__end_of_ClockInit-_ClockInit
	
_ClockInit:	
	opt	stack 4
; Regs used in _ClockInit: [wreg+status,2]
	line	64
	
l3878:	
;board.c: 64: OSCCON = 0X00|0X70|0x01;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	69
	
l3880:	
;board.c: 69: INTCON = 0;
	clrf	(11)	;volatile
	line	72
	
l3882:	
;board.c: 72: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	73
;board.c: 73: TRISA = 0B11111111;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	74
	
l3884:	
;board.c: 74: WPUA = 0B00000000;
	clrf	(149)^080h	;volatile
	line	76
	
l3886:	
;board.c: 76: PORTC = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	77
;board.c: 77: TRISC = 0B11111111;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	78
	
l3888:	
;board.c: 78: WPUC = 0B00000000;
	clrf	(136)^080h	;volatile
	line	80
	
l3890:	
;board.c: 80: OPTION = 0B00000000;
	clrf	(129)^080h	;volatile
	line	88
	
l3892:	
;board.c: 88: MSCKCON = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(27)	;volatile
	line	92
	
l3894:	
;board.c: 92: CMCON0 = 0B00000111;
	movlw	(07h)
	movwf	(25)	;volatile
	line	94
	
l2268:	
	return
	opt stack 0
GLOBAL	__end_of_ClockInit
	__end_of_ClockInit:
;; =============== function _ClockInit ends ============

	signat	_ClockInit,88
	global	_Timer2Init
psect	text507,local,class=CODE,delta=2
global __ptext507
__ptext507:

;; *************** function _Timer2Init *****************
;; Defined at:
;;		line 168 in file "board.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Task_Idle
;; This function uses a non-reentrant model
;;
psect	text507
	file	"board.c"
	line	168
	global	__size_of_Timer2Init
	__size_of_Timer2Init	equ	__end_of_Timer2Init-_Timer2Init
	
_Timer2Init:	
	opt	stack 4
; Regs used in _Timer2Init: [wreg+status,2]
	line	169
	
l3864:	
;board.c: 169: T2CON = 0B00010110;
	movlw	(016h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(18)	;volatile
	line	172
	
l3866:	
;board.c: 172: TMR2 = 0;
	clrf	(17)	;volatile
	line	173
	
l3868:	
;board.c: 173: PR2 = 200;
	movlw	(0C8h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	175
	
l3870:	
;board.c: 175: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(97/8),(97)&7
	line	176
	
l3872:	
;board.c: 176: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	177
	
l3874:	
;board.c: 177: TMR2ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(146/8),(146)&7
	line	178
	
l3876:	
;board.c: 178: PEIE=1;
	bsf	(94/8),(94)&7
	line	179
	
l2280:	
	return
	opt stack 0
GLOBAL	__end_of_Timer2Init
	__end_of_Timer2Init:
;; =============== function _Timer2Init ends ============

	signat	_Timer2Init,88
	global	_Timer1Init
psect	text508,local,class=CODE,delta=2
global __ptext508
__ptext508:

;; *************** function _Timer1Init *****************
;; Defined at:
;;		line 124 in file "board.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_BoardInit
;; This function uses a non-reentrant model
;;
psect	text508
	file	"board.c"
	line	124
	global	__size_of_Timer1Init
	__size_of_Timer1Init	equ	__end_of_Timer1Init-_Timer1Init
	
_Timer1Init:	
	opt	stack 4
; Regs used in _Timer1Init: [wreg]
	line	126
	
l3856:	
;board.c: 126: T1CON = 0B00110000;
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(16)	;volatile
	line	129
;board.c: 129: TMR1L = 0XE0;
	movlw	(0E0h)
	movwf	(14)	;volatile
	line	131
;board.c: 131: TMR1H = 0XB1;
	movlw	(0B1h)
	movwf	(15)	;volatile
	line	133
	
l3858:	
;board.c: 133: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	134
	
l3860:	
;board.c: 134: TMR1ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(128/8),(128)&7
	line	135
	
l3862:	
;board.c: 135: PEIE=1;
	bsf	(94/8),(94)&7
	line	136
	
l2274:	
	return
	opt stack 0
GLOBAL	__end_of_Timer1Init
	__end_of_Timer1Init:
;; =============== function _Timer1Init ends ============

	signat	_Timer1Init,88
	global	_Task_SoftPwm
psect	text509,local,class=CODE,delta=2
global __ptext509
__ptext509:

;; *************** function _Task_SoftPwm *****************
;; Defined at:
;;		line 196 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text509
	file	"main.c"
	line	196
	global	__size_of_Task_SoftPwm
	__size_of_Task_SoftPwm	equ	__end_of_Task_SoftPwm-_Task_SoftPwm
	
_Task_SoftPwm:	
	opt	stack 5
; Regs used in _Task_SoftPwm: [wreg+status,2+status,0]
	line	197
	
l3740:	
;main.c: 197: if ( cct ){
	movf	(_cct),w
	skipz
	goto	u480
	goto	l3758
u480:
	line	198
	
l3742:	
;main.c: 198: if ( cct == 1 ){
	decf	(_cct),w
	skipz
	goto	u491
	goto	u490
u491:
	goto	l3748
u490:
	line	199
	
l3744:	
;main.c: 199: brightCW = bright;
	movf	(_bright),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_brightCW)
	line	200
	
l3746:	
;main.c: 200: brightWW = 0;
	clrf	(_brightWW)
	line	201
;main.c: 201: }
	goto	l3760
	line	202
	
l3748:	
;main.c: 202: else if ( cct == 2 ){
	movf	(_cct),w
	xorlw	02h
	skipz
	goto	u501
	goto	u500
u501:
	goto	l3754
u500:
	line	203
	
l3750:	
;main.c: 203: brightCW = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_brightCW)
	line	204
	
l3752:	
;main.c: 204: brightWW = bright;
	movf	(_bright),w
	movwf	(_brightWW)
	line	205
;main.c: 205: }
	goto	l3760
	line	206
	
l3754:	
;main.c: 206: else if ( cct == 3 ){
	movf	(_cct),w
	xorlw	03h
	skipz
	goto	u511
	goto	u510
u511:
	goto	l1132
u510:
	line	207
	
l3756:	
;main.c: 207: brightCW = bright;
	movf	(_bright),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_brightCW)
	line	208
;main.c: 208: brightWW = bright;
	movf	(_bright),w
	movwf	(_brightWW)
	goto	l3760
	line	210
	
l1132:	
;main.c: 209: }
;main.c: 210: }
	goto	l3760
	line	212
	
l3758:	
;main.c: 211: else {
;main.c: 212: brightCW = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_brightCW)
	line	213
;main.c: 213: brightWW = 0;
	clrf	(_brightWW)
	line	215
	
l3760:	
;main.c: 214: }
;main.c: 215: if ( task_ready.bit0 ){
	btfss	(_task_ready),0	;volatile
	goto	u521
	goto	u520
u521:
	goto	l1144
u520:
	line	218
	
l3762:	
;main.c: 218: if ( brightWW != PR4L ){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_brightWW),w
	bsf	status, 6	;RP1=1, select bank2
	xorwf	(276)^0100h,w	;volatile
	skipnz
	goto	u531
	goto	u530
u531:
	goto	l3770
u530:
	line	219
	
l3764:	
;main.c: 219: if ( brightWW > PR4L )
	bcf	status, 6	;RP1=0, select bank0
	movf	(_brightWW),w
	bsf	status, 6	;RP1=1, select bank2
	subwf	(276)^0100h,w	;volatile
	skipnc
	goto	u541
	goto	u540
u541:
	goto	l3768
u540:
	line	220
	
l3766:	
;main.c: 220: PR4L++;
	incf	(276)^0100h,f	;volatile
	goto	l3770
	line	222
	
l3768:	
;main.c: 221: else
;main.c: 222: PR4L--;
	decf	(276)^0100h,f	;volatile
	line	227
	
l3770:	
;main.c: 223: }
;main.c: 227: if ( brightCW != PR5L ){
	bcf	status, 6	;RP1=0, select bank0
	movf	(_brightCW),w
	bsf	status, 6	;RP1=1, select bank2
	xorwf	(282)^0100h,w	;volatile
	skipnz
	goto	u551
	goto	u550
u551:
	goto	l3778
u550:
	line	228
	
l3772:	
;main.c: 228: if ( brightCW > PR5L )
	bcf	status, 6	;RP1=0, select bank0
	movf	(_brightCW),w
	bsf	status, 6	;RP1=1, select bank2
	subwf	(282)^0100h,w	;volatile
	skipnc
	goto	u561
	goto	u560
u561:
	goto	l3776
u560:
	line	229
	
l3774:	
;main.c: 229: PR5L++;
	incf	(282)^0100h,f	;volatile
	goto	l3778
	line	231
	
l3776:	
;main.c: 230: else
;main.c: 231: PR5L--;
	decf	(282)^0100h,f	;volatile
	line	235
	
l3778:	
;main.c: 232: }
;main.c: 235: task_ready.bit0 = 0;
	bcf	(_task_ready),0	;volatile
	line	237
	
l1144:	
	return
	opt stack 0
GLOBAL	__end_of_Task_SoftPwm
	__end_of_Task_SoftPwm:
;; =============== function _Task_SoftPwm ends ============

	signat	_Task_SoftPwm,88
	global	_Task_Key
psect	text510,local,class=CODE,delta=2
global __ptext510
__ptext510:

;; *************** function _Task_Key *****************
;; Defined at:
;;		line 246 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/20
;;		Unchanged: FFFFF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          1       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text510
	file	"main.c"
	line	246
	global	__size_of_Task_Key
	__size_of_Task_Key	equ	__end_of_Task_Key-_Task_Key
	
_Task_Key:	
	opt	stack 5
; Regs used in _Task_Key: [wreg+status,2+status,0]
	line	249
	
l3704:	
;main.c: 247: static uint8_t key_press_time = 0;
;main.c: 249: if ( task_ready.bit1 ){
	btfss	(_task_ready),1	;volatile
	goto	u391
	goto	u390
u391:
	goto	l1162
u390:
	line	250
	
l3706:	
;main.c: 250: if ( sys_status.bit1 ){
	btfss	(_sys_status),1	;volatile
	goto	u401
	goto	u400
u401:
	goto	l3720
u400:
	line	251
	
l3708:	
;main.c: 251: if ( key_press_time < 100 )
	movlw	(064h)
	subwf	(Task_Key@key_press_time),w
	skipnc
	goto	u411
	goto	u410
u411:
	goto	l1151
u410:
	line	252
	
l3710:	
;main.c: 252: key_press_time++;
	incf	(Task_Key@key_press_time),f
	goto	l3738
	line	253
	
l1151:	
	line	254
;main.c: 253: else {
;main.c: 254: sys_status.bit2 = 1;
	bsf	(_sys_status),2	;volatile
	line	255
;main.c: 255: if ( sys_status.bit5 ){
	btfss	(_sys_status),5	;volatile
	goto	u421
	goto	u420
u421:
	goto	l3716
u420:
	line	256
	
l3712:	
;main.c: 256: if ( bright > 25 )
	movlw	(01Ah)
	subwf	(_bright),w
	skipc
	goto	u431
	goto	u430
u431:
	goto	l1152
u430:
	line	257
	
l3714:	
;main.c: 257: bright--;
	decf	(_bright),f
	goto	l3738
	line	260
	
l3716:	
;main.c: 259: else {
;main.c: 260: if ( bright < 255 )
	movf	(_bright),w
	xorlw	0FFh
	skipnz
	goto	u441
	goto	u440
u441:
	goto	l1152
u440:
	line	261
	
l3718:	
;main.c: 261: bright++;
	incf	(_bright),f
	goto	l3738
	line	263
	
l1152:	
	line	264
;main.c: 262: }
;main.c: 263: }
;main.c: 264: }
	goto	l3738
	line	265
	
l3720:	
;main.c: 265: else if ( key_press_time ){
	movf	(Task_Key@key_press_time),w
	skipz
	goto	u450
	goto	l3738
u450:
	line	266
	
l3722:	
;main.c: 266: key_press_time = 0;
	clrf	(Task_Key@key_press_time)
	line	267
	
l3724:	
;main.c: 267: if ( !sys_status.bit2 ){
	btfsc	(_sys_status),2	;volatile
	goto	u461
	goto	u460
u461:
	goto	l3734
u460:
	line	268
	
l3726:	
;main.c: 268: if ( ++cct > 3 ){
	movlw	(04h)
	incf	(_cct),f
	subwf	((_cct)),w
	skipc
	goto	u471
	goto	u470
u471:
	goto	l3736
u470:
	line	269
	
l3728:	
;main.c: 269: cct = 0;
	clrf	(_cct)
	line	270
	
l3730:	
;main.c: 270: bright = 255;
	movlw	(0FFh)
	movwf	(_bright)
	line	271
	
l3732:	
;main.c: 271: sys_status.bit5 = 1;
	bsf	(_sys_status),5	;volatile
	goto	l3736
	line	275
	
l3734:	
;main.c: 274: else {
;main.c: 275: sys_status.bit5 = !sys_status.bit5;
	movlw	0
	btfss	(_sys_status),5	;volatile
	movlw	1
	movwf	(??_Task_Key+0)+0
	swapf	(??_Task_Key+0)+0,f
	rlf	(??_Task_Key+0)+0,f
	movf	(_sys_status),w	;volatile
	xorwf	(??_Task_Key+0)+0,w
	andlw	not (((1<<1)-1)<<5)
	xorwf	(??_Task_Key+0)+0,w
	movwf	(_sys_status)	;volatile
	line	277
	
l3736:	
;main.c: 276: }
;main.c: 277: sys_status.bit2 = 0;
	bcf	(_sys_status),2	;volatile
	line	279
	
l3738:	
;main.c: 278: }
;main.c: 279: task_ready.bit1 = 0;
	bcf	(_task_ready),1	;volatile
	line	281
	
l1162:	
	return
	opt stack 0
GLOBAL	__end_of_Task_Key
	__end_of_Task_Key:
;; =============== function _Task_Key ends ============

	signat	_Task_Key,88
	global	_ISR
psect	text511,local,class=CODE,delta=2
global __ptext511
__ptext511:

;; *************** function _ISR *****************
;; Defined at:
;;		line 94 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_Timer1DeInit
;;		_Timer2DeInit
;;		i1_Timer1Init
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text511
	file	"main.c"
	line	94
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 3
; Regs used in _ISR: [wreg+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text511
	line	97
	
i1l3780:	
;main.c: 97: if(T0IE && T0IF){
	btfss	(93/8),(93)&7
	goto	u57_21
	goto	u57_20
u57_21:
	goto	i1l3800
u57_20:
	
i1l3782:	
	btfss	(90/8),(90)&7
	goto	u58_21
	goto	u58_20
u58_21:
	goto	i1l3800
u58_20:
	line	98
	
i1l3784:	
;main.c: 98: TMR0 = 155;
	movlw	(09Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	99
	
i1l3786:	
;main.c: 99: if ( ++ticks >= 50 ){
	movlw	(032h)
	incf	(_ticks),f
	subwf	((_ticks)),w
	skipc
	goto	u59_21
	goto	u59_20
u59_21:
	goto	i1l3798
u59_20:
	line	100
	
i1l3788:	
;main.c: 100: ticks = 0;
	clrf	(_ticks)
	line	102
	
i1l3790:	
;main.c: 102: task_ready.bit2 = 1;
	bsf	(_task_ready),2	;volatile
	line	103
	
i1l3792:	
;main.c: 103: task_ready.bit0 = 1;
	bsf	(_task_ready),0	;volatile
	line	104
	
i1l3794:	
;main.c: 104: task_ready.bit1 = 1;
	bsf	(_task_ready),1	;volatile
	line	105
	
i1l3796:	
;main.c: 105: sys_status.bit6 = 1;
	bsf	(_sys_status),6	;volatile
	line	108
	
i1l3798:	
;main.c: 107: }
;main.c: 108: T0IF = 0;
	bcf	(90/8),(90)&7
	line	113
	
i1l3800:	
;main.c: 109: }
;main.c: 113: if ( TMR1IF ){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7
	goto	u60_21
	goto	u60_20
u60_21:
	goto	i1l3812
u60_20:
	line	114
	
i1l3802:	
;main.c: 114: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	115
	
i1l3804:	
;main.c: 115: Timer1DeInit();
	fcall	_Timer1DeInit
	line	116
	
i1l3806:	
;main.c: 116: TMR1L = 0XE0;
	movlw	(0E0h)
	movwf	(14)	;volatile
	line	118
	
i1l3808:	
;main.c: 118: TMR1H = 0XB1;
	movlw	(0B1h)
	movwf	(15)	;volatile
	line	119
	
i1l3810:	
;main.c: 119: sys_status.bit1 = 0;
	bcf	(_sys_status),1	;volatile
	line	125
	
i1l3812:	
;main.c: 120: }
;main.c: 125: if ( TMR2IE && TMR2IF ){
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1121/8)^080h,(1121)&7
	goto	u61_21
	goto	u61_20
u61_21:
	goto	i1l3822
u61_20:
	
i1l3814:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u62_21
	goto	u62_20
u62_21:
	goto	i1l3822
u62_20:
	line	126
	
i1l3816:	
;main.c: 126: Timer2DeInit();
	fcall	_Timer2DeInit
	line	127
	
i1l3818:	
;main.c: 127: sys_status.bit1 = 0;
	bcf	(_sys_status),1	;volatile
	line	128
	
i1l3820:	
;main.c: 128: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	133
	
i1l3822:	
;main.c: 129: }
;main.c: 133: if(INTE && INTF)
	btfss	(92/8),(92)&7
	goto	u63_21
	goto	u63_20
u63_21:
	goto	i1l1127
u63_20:
	
i1l3824:	
	btfss	(89/8),(89)&7
	goto	u64_21
	goto	u64_20
u64_21:
	goto	i1l1127
u64_20:
	line	135
	
i1l3826:	
;main.c: 134: {
;main.c: 135: INTF = 0;
	bcf	(89/8),(89)&7
	line	137
;main.c: 137: if ( TMR1ON ){
	bcf	status, 5	;RP0=0, select bank0
	btfss	(128/8),(128)&7
	goto	u65_21
	goto	u65_20
u65_21:
	goto	i1l3834
u65_20:
	line	138
	
i1l3828:	
;main.c: 138: tim1val = (uint16_t)TMR1H<<8|TMR1L;
	movf	(15),w	;volatile
	movwf	(_tim1val+1)
	clrf	(_tim1val)
	movf	(14),w	;volatile
	iorwf	(_tim1val),f
	line	139
;main.c: 139: if ( ( tim1val <= 51000 ) && ( tim1val >= 50000 ) ){
	movlw	high(0C739h)
	subwf	(_tim1val+1),w
	movlw	low(0C739h)
	skipnz
	subwf	(_tim1val),w
	skipnc
	goto	u66_21
	goto	u66_20
u66_21:
	goto	i1l1125
u66_20:
	
i1l3830:	
	movlw	high(0C350h)
	subwf	(_tim1val+1),w
	movlw	low(0C350h)
	skipnz
	subwf	(_tim1val),w
	skipc
	goto	u67_21
	goto	u67_20
u67_21:
	goto	i1l1125
u67_20:
	line	140
	
i1l3832:	
;main.c: 140: sys_status.bit1 = 1;
	bsf	(_sys_status),1	;volatile
	line	141
;main.c: 141: }
	goto	i1l3834
	line	142
	
i1l1125:	
	line	143
;main.c: 142: else
;main.c: 143: sys_status.bit1 = 0;
	bcf	(_sys_status),1	;volatile
	line	145
	
i1l3834:	
;main.c: 144: }
;main.c: 145: Timer1Init();
	fcall	i1_Timer1Init
	line	187
	
i1l1127:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
	global	i1_Timer1Init
psect	text512,local,class=CODE,delta=2
global __ptext512
__ptext512:

;; *************** function i1_Timer1Init *****************
;; Defined at:
;;		line 124 in file "board.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text512
	file	"board.c"
	line	124
	global	__size_ofi1_Timer1Init
	__size_ofi1_Timer1Init	equ	__end_ofi1_Timer1Init-i1_Timer1Init
	
i1_Timer1Init:	
	opt	stack 3
; Regs used in i1_Timer1Init: [wreg]
	line	126
	
i1l3938:	
;board.c: 126: T1CON = 0B00110000;
	movlw	(030h)
	movwf	(16)	;volatile
	line	129
;board.c: 129: TMR1L = 0XE0;
	movlw	(0E0h)
	movwf	(14)	;volatile
	line	131
;board.c: 131: TMR1H = 0XB1;
	movlw	(0B1h)
	movwf	(15)	;volatile
	line	133
	
i1l3940:	
;board.c: 133: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	134
	
i1l3942:	
;board.c: 134: TMR1ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(128/8),(128)&7
	line	135
	
i1l3944:	
;board.c: 135: PEIE=1;
	bsf	(94/8),(94)&7
	line	136
	
i1l2274:	
	return
	opt stack 0
GLOBAL	__end_ofi1_Timer1Init
	__end_ofi1_Timer1Init:
;; =============== function i1_Timer1Init ends ============

	signat	i1_Timer1Init,88
	global	_Timer2DeInit
psect	text513,local,class=CODE,delta=2
global __ptext513
__ptext513:

;; *************** function _Timer2DeInit *****************
;; Defined at:
;;		line 188 in file "board.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text513
	file	"board.c"
	line	188
	global	__size_of_Timer2DeInit
	__size_of_Timer2DeInit	equ	__end_of_Timer2DeInit-_Timer2DeInit
	
_Timer2DeInit:	
	opt	stack 3
; Regs used in _Timer2DeInit: [wreg+status,2]
	line	189
	
i1l3844:	
;board.c: 189: T2CON = 0B00011010;
	movlw	(01Ah)
	movwf	(18)	;volatile
	line	192
	
i1l3846:	
;board.c: 192: TMR2 = 0;
	clrf	(17)	;volatile
	line	193
	
i1l3848:	
;board.c: 193: PR2 = 200;
	movlw	(0C8h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	195
	
i1l3850:	
;board.c: 195: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(97/8),(97)&7
	line	196
	
i1l3852:	
;board.c: 196: TMR2IE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1121/8)^080h,(1121)&7
	line	197
	
i1l3854:	
;board.c: 197: TMR2ON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	198
	
i1l2283:	
	return
	opt stack 0
GLOBAL	__end_of_Timer2DeInit
	__end_of_Timer2DeInit:
;; =============== function _Timer2DeInit ends ============

	signat	_Timer2DeInit,88
	global	_Timer1DeInit
psect	text514,local,class=CODE,delta=2
global __ptext514
__ptext514:

;; *************** function _Timer1DeInit *****************
;; Defined at:
;;		line 145 in file "board.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text514
	file	"board.c"
	line	145
	global	__size_of_Timer1DeInit
	__size_of_Timer1DeInit	equ	__end_of_Timer1DeInit-_Timer1DeInit
	
_Timer1DeInit:	
	opt	stack 3
; Regs used in _Timer1DeInit: [wreg]
	line	147
	
i1l3836:	
;board.c: 147: T1CON = 0B00110000;
	movlw	(030h)
	movwf	(16)	;volatile
	line	150
;board.c: 150: TMR1L = 0XE0;
	movlw	(0E0h)
	movwf	(14)	;volatile
	line	152
;board.c: 152: TMR1H = 0XB1;
	movlw	(0B1h)
	movwf	(15)	;volatile
	line	154
	
i1l3838:	
;board.c: 154: TMR1IE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1120/8)^080h,(1120)&7
	line	155
	
i1l3840:	
;board.c: 155: TMR1ON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(128/8),(128)&7
	line	156
	
i1l3842:	
;board.c: 156: PEIE=1;
	bsf	(94/8),(94)&7
	line	157
	
i1l2277:	
	return
	opt stack 0
GLOBAL	__end_of_Timer1DeInit
	__end_of_Timer1DeInit:
;; =============== function _Timer1DeInit ends ============

	signat	_Timer1DeInit,88
psect	text515,local,class=CODE,delta=2
global __ptext515
__ptext515:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
