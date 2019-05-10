//Deviec:FT61F02X
//-----------------------Variable---------------------------------
		_ISR		EQU		2CF0E8H
		_ReadAPin		EQU		2AH
		_ticks		EQU		7AH
		_brightWW		EQU		2CH
		_brightCW		EQU		2BH
		_cct		EQU		77H
		_bright		EQU		7BH
		_adcVal		EQU		26H
		_tim1val		EQU		28H
		_sys_status		EQU		78H
		_task_ready		EQU		79H
		_ISR		EQU		2CF0E8H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	0BH 			//0009 	380B
		LJUMP 	1BDH 			//000A 	39BD

		//;main.c: 97: if(T0IE && T0IF){
		BTSC 	INTCON,5 		//000B 	168B
		ORG		000CH
		BTSS 	INTCON,2 		//000C 	1D0B
		LJUMP 	1DH 			//000D 	381D

		//;main.c: 98: TMR0 = 155;
		LDWI 	9BH 			//000E 	2A9B
		BCR 	STATUS,5 		//000F 	1283
		BCR 	STATUS,6 		//0010 	1303
		STR 	1H 			//0011 	0181

		//;main.c: 99: if ( ++ticks >= 50 ){
		LDWI 	32H 			//0012 	2A32
		INCR	7AH,1 			//0013 	09FA
		ORG		0014H
		SUBWR 	7AH,0 			//0014 	0C7A
		BTSS 	STATUS,0 		//0015 	1C03
		LJUMP 	1CH 			//0016 	381C

		//;main.c: 100: ticks = 0;
		CLRR 	7AH 			//0017 	017A

		//;main.c: 102: task_ready.bit2 = 1;
		BSR 	79H,2 			//0018 	1979

		//;main.c: 103: task_ready.bit0 = 1;
		BSR 	79H,0 			//0019 	1879

		//;main.c: 104: task_ready.bit1 = 1;
		BSR 	79H,1 			//001A 	18F9

		//;main.c: 105: sys_status.bit6 = 1;
		BSR 	78H,6 			//001B 	1B78
		ORG		001CH

		//;main.c: 107: }
		//;main.c: 108: T0IF = 0;
		BCR 	INTCON,2 		//001C 	110B

		//;main.c: 109: }
		//;main.c: 113: if ( TMR1IF ){
		BCR 	STATUS,5 		//001D 	1283
		BCR 	STATUS,6 		//001E 	1303
		BTSS 	CH,0 			//001F 	1C0C
		LJUMP 	28H 			//0020 	3828

		//;main.c: 114: TMR1IF = 0;
		BCR 	CH,0 			//0021 	100C

		//;main.c: 115: Timer1DeInit();
		LCALL 	1E1H 			//0022 	31E1

		//;main.c: 116: TMR1L = 0XE0;
		LDWI 	E0H 			//0023 	2AE0
		ORG		0024H
		STR 	EH 			//0024 	018E

		//;main.c: 118: TMR1H = 0XB1;
		LDWI 	B1H 			//0025 	2AB1
		STR 	FH 			//0026 	018F

		//;main.c: 119: sys_status.bit1 = 0;
		BCR 	78H,1 			//0027 	10F8

		//;main.c: 120: }
		//;main.c: 125: if ( TMR2IE && TMR2IF ){
		BSR 	STATUS,5 		//0028 	1A83
		BTSS 	CH,1 			//0029 	1C8C
		LJUMP 	31H 			//002A 	3831
		BCR 	STATUS,5 		//002B 	1283
		ORG		002CH
		BTSS 	CH,1 			//002C 	1C8C
		LJUMP 	31H 			//002D 	3831

		//;main.c: 126: Timer2DeInit();
		LCALL 	1B0H 			//002E 	31B0

		//;main.c: 127: sys_status.bit1 = 0;
		BCR 	78H,1 			//002F 	10F8

		//;main.c: 128: TMR2IF = 0;
		BCR 	CH,1 			//0030 	108C

		//;main.c: 129: }
		//;main.c: 133: if(INTE && INTF)
		BTSC 	INTCON,4 		//0031 	160B
		BTSS 	INTCON,1 		//0032 	1C8B
		LJUMP 	4FH 			//0033 	384F
		ORG		0034H

		//;main.c: 134: {
		//;main.c: 135: INTF = 0;
		BCR 	INTCON,1 		//0034 	108B

		//;main.c: 137: if ( TMR1ON ){
		BCR 	STATUS,5 		//0035 	1283
		BTSS 	10H,0 			//0036 	1C10
		LJUMP 	4EH 			//0037 	384E

		//;main.c: 138: tim1val = (uint16_t)TMR1H<<8|TMR1L;
		LDR 	FH,0 			//0038 	080F
		STR 	29H 			//0039 	01A9
		CLRR 	28H 			//003A 	0128
		LDR 	EH,0 			//003B 	080E
		ORG		003CH
		IORWR 	28H,1 			//003C 	03A8

		//;main.c: 139: if ( ( tim1val <= 51000 ) && ( tim1val >= 50000 ) ){
		LDWI 	C7H 			//003D 	2AC7
		SUBWR 	29H,0 			//003E 	0C29
		LDWI 	39H 			//003F 	2A39
		BTSC 	STATUS,2 		//0040 	1503
		SUBWR 	28H,0 			//0041 	0C28
		BTSC 	STATUS,0 		//0042 	1403
		LJUMP 	4DH 			//0043 	384D
		ORG		0044H
		LDWI 	C3H 			//0044 	2AC3
		SUBWR 	29H,0 			//0045 	0C29
		LDWI 	50H 			//0046 	2A50
		BTSC 	STATUS,2 		//0047 	1503
		SUBWR 	28H,0 			//0048 	0C28
		BTSS 	STATUS,0 		//0049 	1C03
		LJUMP 	4DH 			//004A 	384D

		//;main.c: 140: sys_status.bit1 = 1;
		BSR 	78H,1 			//004B 	18F8
		ORG		004CH

		//;main.c: 141: }
		LJUMP 	4EH 			//004C 	384E

		//;main.c: 142: else
		//;main.c: 143: sys_status.bit1 = 0;
		BCR 	78H,1 			//004D 	10F8

		//;main.c: 144: }
		//;main.c: 145: Timer1Init();
		LCALL 	1D5H 			//004E 	31D5
		LDR 	71H,0 			//004F 	0871
		STR 	PCLATH 			//0050 	018A
		SWAPR 	70H,0 			//0051 	0770
		STR 	STATUS 			//0052 	0183
		SWAPR 	7EH,1 			//0053 	07FE
		ORG		0054H
		SWAPR 	7EH,0 			//0054 	077E
		RETI		 			//0055 	0009

		//;main.c: 197: if ( cct ){
		LDR 	77H,0 			//0056 	0877
		BTSC 	STATUS,2 		//0057 	1503
		LJUMP 	73H 			//0058 	3873

		//;main.c: 198: if ( cct == 1 ){
		DECRSZ 	77H,0 		//0059 	0E77
		LJUMP 	60H 			//005A 	3860

		//;main.c: 199: brightCW = bright;
		LDR 	7BH,0 			//005B 	087B
		ORG		005CH
		BCR 	STATUS,5 		//005C 	1283
		BCR 	STATUS,6 		//005D 	1303
		STR 	2BH 			//005E 	01AB
		LJUMP 	76H 			//005F 	3876

		//;main.c: 201: }
		//;main.c: 200: brightWW = 0;
		//;main.c: 202: else if ( cct == 2 ){
		LDR 	77H,0 			//0060 	0877
		XORWI 	2H 			//0061 	2602
		BTSS 	STATUS,2 		//0062 	1D03
		LJUMP 	68H 			//0063 	3868
		ORG		0064H

		//;main.c: 203: brightCW = 0;
		BCR 	STATUS,5 		//0064 	1283
		BCR 	STATUS,6 		//0065 	1303
		CLRR 	2BH 			//0066 	012B
		LJUMP 	70H 			//0067 	3870

		//;main.c: 205: }
		//;main.c: 204: brightWW = bright;
		//;main.c: 206: else if ( cct == 3 ){
		LDR 	77H,0 			//0068 	0877
		XORWI 	3H 			//0069 	2603
		BTSS 	STATUS,2 		//006A 	1D03
		LJUMP 	77H 			//006B 	3877
		ORG		006CH

		//;main.c: 207: brightCW = bright;
		LDR 	7BH,0 			//006C 	087B
		BCR 	STATUS,5 		//006D 	1283
		BCR 	STATUS,6 		//006E 	1303
		STR 	2BH 			//006F 	01AB

		//;main.c: 208: brightWW = bright;
		LDR 	7BH,0 			//0070 	087B
		STR 	2CH 			//0071 	01AC
		LJUMP 	77H 			//0072 	3877

		//;main.c: 209: }
		//;main.c: 210: }
		//;main.c: 211: else {
		//;main.c: 212: brightCW = 0;
		BCR 	STATUS,5 		//0073 	1283
		ORG		0074H
		BCR 	STATUS,6 		//0074 	1303
		CLRR 	2BH 			//0075 	012B

		//;main.c: 213: brightWW = 0;
		CLRR 	2CH 			//0076 	012C

		//;main.c: 214: }
		//;main.c: 215: if ( task_ready.bit0 ){
		BTSS 	79H,0 			//0077 	1C79
		RET		 					//0078 	0004

		//;main.c: 218: if ( brightWW != PR4L ){
		BCR 	STATUS,5 		//0079 	1283
		BCR 	STATUS,6 		//007A 	1303
		LDR 	2CH,0 			//007B 	082C
		ORG		007CH
		BSR 	STATUS,6 		//007C 	1B03
		XORWR 	14H,0 			//007D 	0414

		//;main.c: 219: if ( brightWW > PR4L )
		BCR 	STATUS,6 		//007E 	1303
		BTSC 	STATUS,2 		//007F 	1503
		LJUMP 	8AH 			//0080 	388A
		LDR 	2CH,0 			//0081 	082C
		BSR 	STATUS,6 		//0082 	1B03
		SUBWR 	14H,0 			//0083 	0C14
		ORG		0084H
		BTSC 	STATUS,0 		//0084 	1403
		LJUMP 	88H 			//0085 	3888

		//;main.c: 220: PR4L++;
		INCR	14H,1 			//0086 	0994
		LJUMP 	89H 			//0087 	3889

		//;main.c: 221: else
		//;main.c: 222: PR4L--;
		DECR 	14H,1 			//0088 	0D94

		//;main.c: 223: }
		//;main.c: 227: if ( brightCW != PR5L ){
		BCR 	STATUS,6 		//0089 	1303
		LDR 	2BH,0 			//008A 	082B
		BSR 	STATUS,6 		//008B 	1B03
		ORG		008CH
		XORWR 	1AH,0 			//008C 	041A
		BTSC 	STATUS,2 		//008D 	1503
		LJUMP 	98H 			//008E 	3898

		//;main.c: 228: if ( brightCW > PR5L )
		BCR 	STATUS,6 		//008F 	1303
		LDR 	2BH,0 			//0090 	082B
		BSR 	STATUS,6 		//0091 	1B03
		SUBWR 	1AH,0 			//0092 	0C1A
		BTSC 	STATUS,0 		//0093 	1403
		ORG		0094H
		LJUMP 	97H 			//0094 	3897

		//;main.c: 229: PR5L++;
		INCR	1AH,1 			//0095 	099A
		LJUMP 	98H 			//0096 	3898

		//;main.c: 230: else
		//;main.c: 231: PR5L--;
		DECR 	1AH,1 			//0097 	0D9A

		//;main.c: 232: }
		//;main.c: 235: task_ready.bit0 = 0;
		BCR 	79H,0 			//0098 	1079
		RET		 					//0099 	0004

		//;main.c: 247: static uint8_t key_press_time = 0;
		//;main.c: 249: if ( task_ready.bit1 ){
		BTSS 	79H,1 			//009A 	1CF9
		RET		 					//009B 	0004
		ORG		009CH

		//;main.c: 250: if ( sys_status.bit1 ){
		BTSS 	78H,1 			//009C 	1CF8
		LJUMP 	B3H 			//009D 	38B3

		//;main.c: 251: if ( key_press_time < 100 )
		LDWI 	64H 			//009E 	2A64
		SUBWR 	76H,0 			//009F 	0C76
		BTSC 	STATUS,0 		//00A0 	1403
		LJUMP 	A4H 			//00A1 	38A4

		//;main.c: 252: key_press_time++;
		INCR	76H,1 			//00A2 	09F6
		LJUMP 	CFH 			//00A3 	38CF
		ORG		00A4H

		//;main.c: 253: else {
		//;main.c: 254: sys_status.bit2 = 1;
		BSR 	78H,2 			//00A4 	1978

		//;main.c: 255: if ( sys_status.bit5 ){
		BTSS 	78H,5 			//00A5 	1EF8
		LJUMP 	ADH 			//00A6 	38AD

		//;main.c: 256: if ( bright > 25 )
		LDWI 	1AH 			//00A7 	2A1A
		SUBWR 	7BH,0 			//00A8 	0C7B
		BTSS 	STATUS,0 		//00A9 	1C03
		LJUMP 	CFH 			//00AA 	38CF

		//;main.c: 257: bright--;
		DECR 	7BH,1 			//00AB 	0DFB
		ORG		00ACH
		LJUMP 	CFH 			//00AC 	38CF

		//;main.c: 259: else {
		//;main.c: 260: if ( bright < 255 )
		LDR 	7BH,0 			//00AD 	087B
		XORWI 	FFH 			//00AE 	26FF
		BTSC 	STATUS,2 		//00AF 	1503
		LJUMP 	CFH 			//00B0 	38CF

		//;main.c: 261: bright++;
		INCR	7BH,1 			//00B1 	09FB
		LJUMP 	CFH 			//00B2 	38CF

		//;main.c: 262: }
		//;main.c: 263: }
		//;main.c: 264: }
		//;main.c: 265: else if ( key_press_time ){
		LDR 	76H,0 			//00B3 	0876
		ORG		00B4H
		BTSC 	STATUS,2 		//00B4 	1503
		LJUMP 	CFH 			//00B5 	38CF

		//;main.c: 266: key_press_time = 0;
		CLRR 	76H 			//00B6 	0176

		//;main.c: 267: if ( !sys_status.bit2 ){
		BTSC 	78H,2 			//00B7 	1578
		LJUMP 	C3H 			//00B8 	38C3

		//;main.c: 268: if ( ++cct > 3 ){
		LDWI 	4H 			//00B9 	2A04
		INCR	77H,1 			//00BA 	09F7
		SUBWR 	77H,0 			//00BB 	0C77
		ORG		00BCH
		BTSS 	STATUS,0 		//00BC 	1C03
		LJUMP 	CEH 			//00BD 	38CE
		LDWI 	FFH 			//00BE 	2AFF

		//;main.c: 269: cct = 0;
		CLRR 	77H 			//00BF 	0177

		//;main.c: 270: bright = 255;
		STR 	7BH 			//00C0 	01FB

		//;main.c: 271: sys_status.bit5 = 1;
		BSR 	78H,5 			//00C1 	1AF8
		LJUMP 	CEH 			//00C2 	38CE

		//;main.c: 274: else {
		//;main.c: 275: sys_status.bit5 = !sys_status.bit5;
		LDWI 	0H 			//00C3 	2A00
		ORG		00C4H
		BTSS 	78H,5 			//00C4 	1EF8
		LDWI 	1H 			//00C5 	2A01
		STR 	72H 			//00C6 	01F2
		SWAPR 	72H,1 			//00C7 	07F2
		RLR 	72H,1 			//00C8 	05F2
		LDR 	78H,0 			//00C9 	0878
		XORWR 	72H,0 			//00CA 	0472
		ANDWI 	DFH 			//00CB 	24DF
		ORG		00CCH
		XORWR 	72H,0 			//00CC 	0472
		STR 	78H 			//00CD 	01F8

		//;main.c: 276: }
		//;main.c: 277: sys_status.bit2 = 0;
		BCR 	78H,2 			//00CE 	1178

		//;main.c: 278: }
		//;main.c: 279: task_ready.bit1 = 0;
		BCR 	79H,1 			//00CF 	10F9
		RET		 					//00D0 	0004
		BCR 	STATUS,5 		//00D1 	1283
		BCR 	STATUS,6 		//00D2 	1303
		STR 	22H 			//00D3 	01A2
		ORG		00D4H

		//;board.c: 376: uint16_t ADC_DATA=0;
		CLRR 	23H 			//00D4 	0123
		CLRR 	24H 			//00D5 	0124

		//;board.c: 378: ADCON0Buff = ADCON0 & 0B11100011;
		LDR 	1FH,0 			//00D6 	081F
		STR 	25H 			//00D7 	01A5
		LDWI 	E3H 			//00D8 	2AE3
		ANDWR 	25H,1 			//00D9 	02A5

		//;board.c: 380: AN_CH <<=2;
		BCR 	STATUS,0 		//00DA 	1003
		RLR 	22H,1 			//00DB 	05A2
		ORG		00DCH
		BCR 	STATUS,0 		//00DC 	1003
		RLR 	22H,1 			//00DD 	05A2

		//;board.c: 381: ADCON0Buff |= AN_CH;
		LDR 	22H,0 			//00DE 	0822
		IORWR 	25H,1 			//00DF 	03A5

		//;board.c: 383: ADCON0 = ADCON0Buff;
		LDR 	25H,0 			//00E0 	0825
		STR 	1FH 			//00E1 	019F

		//;board.c: 384: DelayUs(20);
		LDWI 	14H 			//00E2 	2A14
		LCALL 	1EDH 			//00E3 	31ED
		ORG		00E4H

		//;board.c: 385: GO_DONE = 1;
		BCR 	STATUS,5 		//00E4 	1283
		BCR 	STATUS,6 		//00E5 	1303
		BSR 	1FH,1 			//00E6 	189F

		//;board.c: 386: while( GO_DONE==1 );
		BTSC 	1FH,1 			//00E7 	149F
		LJUMP 	E7H 			//00E8 	38E7

		//;board.c: 388: ADC_DATA = ADRESH;
		LDR 	1EH,0 			//00E9 	081E
		STR 	23H 			//00EA 	01A3
		CLRR 	24H 			//00EB 	0124
		ORG		00ECH

		//;board.c: 389: ADC_DATA <<=8;
		STR 	24H 			//00EC 	01A4
		CLRR 	23H 			//00ED 	0123

		//;board.c: 390: ADC_DATA |= ADRESL;
		BSR 	STATUS,5 		//00EE 	1A83
		LDR 	1EH,0 			//00EF 	081E
		BCR 	STATUS,5 		//00F0 	1283
		IORWR 	23H,1 			//00F1 	03A3

		//;board.c: 391: tBuffer = ADC_DATA;
		LDR 	24H,0 			//00F2 	0824
		STR 	21H 			//00F3 	01A1
		ORG		00F4H
		LDR 	23H,0 			//00F4 	0823
		STR 	20H 			//00F5 	01A0

		//;board.c: 392: return tBuffer;
		LDR 	21H,0 			//00F6 	0821
		STR 	75H 			//00F7 	01F5
		LDR 	20H,0 			//00F8 	0820
		STR 	74H 			//00F9 	01F4
		RET		 					//00FA 	0004

		//;main.c: 307: if ( sys_status.bit6 ){
		BTSS 	78H,6 			//00FB 	1F78
		ORG		00FCH
		RET		 					//00FC 	0004

		//;main.c: 308: adcVal = GET_ADC_DATA(2);
		LDWI 	2H 			//00FD 	2A02
		LCALL 	D1H 			//00FE 	30D1
		LDR 	75H,0 			//00FF 	0875
		STR 	27H 			//0100 	01A7
		LDR 	74H,0 			//0101 	0874
		STR 	26H 			//0102 	01A6

		//;main.c: 309: if ( !PA3 )
		BTSC 	5H,3 			//0103 	1585
		ORG		0104H
		LJUMP 	107H 			//0104 	3907

		//;main.c: 310: sys_status.bit4 = 1;
		BSR 	78H,4 			//0105 	1A78
		LJUMP 	108H 			//0106 	3908

		//;main.c: 311: else
		//;main.c: 312: sys_status.bit4 = 0;
		BCR 	78H,4 			//0107 	1278

		//;main.c: 313: if ( sys_status.bit4 ){
		BTSS 	78H,4 			//0108 	1E78
		LJUMP 	10CH 			//0109 	390C

		//;main.c: 314: PA6=1;
		BSR 	5H,6 			//010A 	1B05
		LJUMP 	119H 			//010B 	3919
		ORG		010CH

		//;main.c: 316: }
		//;main.c: 315: PA7=0;
		//;main.c: 317: else {
		//;main.c: 318: PA6=0;
		BCR 	5H,6 			//010C 	1305

		//;main.c: 319: if ( cct ){
		LDR 	77H,0 			//010D 	0877
		BTSC 	STATUS,2 		//010E 	1503
		LJUMP 	119H 			//010F 	3919

		//;main.c: 320: if ( adcVal <= 0x22D ){
		LDWI 	2H 			//0110 	2A02
		SUBWR 	27H,0 			//0111 	0C27
		LDWI 	2EH 			//0112 	2A2E
		BTSC 	STATUS,2 		//0113 	1503
		ORG		0114H
		SUBWR 	26H,0 			//0114 	0C26
		BTSC 	STATUS,0 		//0115 	1403
		LJUMP 	11AH 			//0116 	391A

		//;main.c: 321: PA7=1;
		BSR 	5H,7 			//0117 	1B85
		LJUMP 	11AH 			//0118 	391A

		//;main.c: 324: else
		//;main.c: 325: PA7=0;
		BCR 	5H,7 			//0119 	1385

		//;main.c: 326: }
		//;main.c: 327: sys_status.bit6 = 0;
		BCR 	78H,6 			//011A 	1378
		RET		 					//011B 	0004
		ORG		011CH

		//;main.c: 51: BoardInit( );
		LCALL 	139H 			//011C 	3139

		//;main.c: 52: bright = 255;
		LDWI 	FFH 			//011D 	2AFF
		STR 	7BH 			//011E 	01FB

		//;main.c: 53: brightWW = bright;
		BCR 	STATUS,5 		//011F 	1283
		STR 	2CH 			//0120 	01AC

		//;main.c: 54: brightCW = bright;
		LDR 	7BH,0 			//0121 	087B
		STR 	2BH 			//0122 	01AB

		//;main.c: 55: cct = 0;
		CLRR 	77H 			//0123 	0177
		ORG		0124H

		//;main.c: 56: TMR4ON = 1;
		BSR 	STATUS,6 		//0124 	1B03
		BSR 	16H,2 			//0125 	1916

		//;main.c: 57: TRISC3 = 0;
		BSR 	STATUS,5 		//0126 	1A83
		BCR 	STATUS,6 		//0127 	1303
		BCR 	7H,3 			//0128 	1187

		//;main.c: 58: TMR5ON = 1;
		BCR 	STATUS,5 		//0129 	1283
		BSR 	STATUS,6 		//012A 	1B03
		BSR 	1CH,2 			//012B 	191C
		ORG		012CH

		//;main.c: 59: TRISC2 = 0;
		BSR 	STATUS,5 		//012C 	1A83
		BCR 	STATUS,6 		//012D 	1303
		BCR 	7H,2 			//012E 	1107

		//;main.c: 67: sys_status.bit0 = 1;
		BSR 	78H,0 			//012F 	1878
		LJUMP 	132H 			//0130 	3932

		//;main.c: 73: Task_Idle();
		LCALL 	195H 			//0131 	3195

		//;main.c: 74: }
		//;main.c: 71: {
		//;main.c: 72: if ( !sys_status.bit0 ){
		BTSS 	78H,0 			//0132 	1C78
		LJUMP 	131H 			//0133 	3931
		ORG		0134H

		//;main.c: 75: else {
		//;main.c: 76: Task_IRSend();
		LCALL 	1C9H 			//0134 	31C9

		//;main.c: 77: Task_Key();
		LCALL 	9AH 			//0135 	309A

		//;main.c: 78: Task_SoftPwm();
		LCALL 	56H 			//0136 	3056

		//;main.c: 79: Task_LowBat();
		LCALL 	FBH 			//0137 	30FB
		LJUMP 	132H 			//0138 	3932

		//;board.c: 33: ClockInit();
		LCALL 	150H 			//0139 	3150

		//;board.c: 34: Timer0Init();
		LCALL 	207H 			//013A 	3207

		//;board.c: 35: Timer1Init();
		LCALL 	1A3H 			//013B 	31A3
		ORG		013CH

		//;board.c: 37: INTInit();
		LCALL 	1FFH 			//013C 	31FF

		//;board.c: 40: Pwm4Init();
		LCALL 	175H 			//013D 	3175

		//;board.c: 41: Pwm5Init();
		LCALL 	165H 			//013E 	3165

		//;board.c: 42: ADCInit();
		LCALL 	1F6H 			//013F 	31F6

		//;board.c: 45: PORTA&=0x3f;TRISA&=0x3f;;
		LDWI 	3FH 			//0140 	2A3F
		BCR 	STATUS,5 		//0141 	1283
		ANDWR 	5H,1 			//0142 	0285
		BSR 	STATUS,5 		//0143 	1A83
		ORG		0144H
		ANDWR 	5H,1 			//0144 	0285

		//;board.c: 46: PC4=0;TRISC4=0;
		BCR 	STATUS,5 		//0145 	1283
		BCR 	7H,4 			//0146 	1207
		BSR 	STATUS,5 		//0147 	1A83
		BCR 	7H,4 			//0148 	1207

		//;board.c: 47: PA3 = 1;TRISA3=1;WPUA|=0x08;
		BCR 	STATUS,5 		//0149 	1283
		BSR 	5H,3 			//014A 	1985
		BSR 	STATUS,5 		//014B 	1A83
		ORG		014CH
		BSR 	5H,3 			//014C 	1985
		BSR 	15H,3 			//014D 	1995

		//;board.c: 53: GIE = 1;
		BSR 	INTCON,7 		//014E 	1B8B
		RET		 					//014F 	0004

		//;board.c: 64: OSCCON = 0X00|0X70|0x01;
		LDWI 	71H 			//0150 	2A71
		BSR 	STATUS,5 		//0151 	1A83
		STR 	FH 			//0152 	018F

		//;board.c: 69: INTCON = 0;
		CLRR 	INTCON 			//0153 	010B
		ORG		0154H

		//;board.c: 72: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0154 	1283
		CLRR 	5H 			//0155 	0105

		//;board.c: 73: TRISA = 0B11111111;
		LDWI 	FFH 			//0156 	2AFF
		BSR 	STATUS,5 		//0157 	1A83
		STR 	5H 			//0158 	0185

		//;board.c: 74: WPUA = 0B00000000;
		CLRR 	15H 			//0159 	0115

		//;board.c: 76: PORTC = 0B00000000;
		BCR 	STATUS,5 		//015A 	1283
		CLRR 	7H 			//015B 	0107
		ORG		015CH

		//;board.c: 77: TRISC = 0B11111111;
		BSR 	STATUS,5 		//015C 	1A83
		STR 	7H 			//015D 	0187

		//;board.c: 78: WPUC = 0B00000000;
		CLRR 	8H 			//015E 	0108

		//;board.c: 80: OPTION = 0B00000000;
		CLRR 	1H 			//015F 	0101

		//;board.c: 88: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//0160 	1283
		CLRR 	1BH 			//0161 	011B

		//;board.c: 92: CMCON0 = 0B00000111;
		LDWI 	7H 			//0162 	2A07
		STR 	19H 			//0163 	0199
		ORG		0164H
		RET		 					//0164 	0004
		LDWI 	32H 			//0165 	2A32

		//;board.c: 316: TRISC2 = 1;
		BSR 	7H,2 			//0166 	1907

		//;board.c: 317: PWM5CR0 = 0B00110010;
		BCR 	STATUS,5 		//0167 	1283
		BSR 	STATUS,6 		//0168 	1B03
		STR 	1BH 			//0169 	019B

		//;board.c: 323: PWM5CR1 = 0B10000000;
		LDWI 	80H 			//016A 	2A80
		STR 	1CH 			//016B 	019C
		ORG		016CH

		//;board.c: 331: T5CKDIV = 14;
		LDWI 	EH 			//016C 	2A0E
		STR 	1DH 			//016D 	019D

		//;board.c: 333: TMR5H = 0;
		CLRR 	19H 			//016E 	0119

		//;board.c: 334: PR5L = 0;
		CLRR 	1AH 			//016F 	011A

		//;board.c: 335: TMR5ON = 1;
		BSR 	1CH,2 			//0170 	191C

		//;board.c: 336: TRISC2 = 0;
		BSR 	STATUS,5 		//0171 	1A83
		BCR 	STATUS,6 		//0172 	1303
		BCR 	7H,2 			//0173 	1107
		ORG		0174H
		RET		 					//0174 	0004
		LDWI 	32H 			//0175 	2A32

		//;board.c: 282: TRISC3 = 1;
		BSR 	7H,3 			//0176 	1987

		//;board.c: 283: PWM4CR0 = 0B00110010;
		BCR 	STATUS,5 		//0177 	1283
		BSR 	STATUS,6 		//0178 	1B03
		STR 	15H 			//0179 	0195

		//;board.c: 289: PWM4CR1 = 0B10000000;
		LDWI 	80H 			//017A 	2A80
		STR 	16H 			//017B 	0196
		ORG		017CH

		//;board.c: 297: T4CKDIV = 14;
		LDWI 	EH 			//017C 	2A0E
		STR 	17H 			//017D 	0197

		//;board.c: 299: TMR4H = 0;
		CLRR 	13H 			//017E 	0113

		//;board.c: 300: PR4L = 0;
		CLRR 	14H 			//017F 	0114

		//;board.c: 301: TMR4ON = 1;
		BSR 	16H,2 			//0180 	1916

		//;board.c: 302: TRISC3 = 0;
		BSR 	STATUS,5 		//0181 	1A83
		BCR 	STATUS,6 		//0182 	1303
		BCR 	7H,3 			//0183 	1187
		ORG		0184H
		RET		 					//0184 	0004

		//;board.c: 169: T2CON = 0B00010110;
		LDWI 	16H 			//0185 	2A16
		BCR 	STATUS,5 		//0186 	1283
		BCR 	STATUS,6 		//0187 	1303
		STR 	12H 			//0188 	0192

		//;board.c: 172: TMR2 = 0;
		CLRR 	11H 			//0189 	0111

		//;board.c: 173: PR2 = 200;
		LDWI 	C8H 			//018A 	2AC8
		BSR 	STATUS,5 		//018B 	1A83
		ORG		018CH
		STR 	12H 			//018C 	0192

		//;board.c: 175: TMR2IF = 0;
		BCR 	STATUS,5 		//018D 	1283
		BCR 	CH,1 			//018E 	108C

		//;board.c: 176: TMR2IE = 1;
		BSR 	STATUS,5 		//018F 	1A83
		BSR 	CH,1 			//0190 	188C

		//;board.c: 177: TMR2ON = 1;
		BCR 	STATUS,5 		//0191 	1283
		BSR 	12H,2 			//0192 	1912

		//;board.c: 178: PEIE=1;
		BSR 	INTCON,6 		//0193 	1B0B
		ORG		0194H
		RET		 					//0194 	0004
		SLEEP	 			//0195 	0002
		CLRWDT	 			//0196 	0001

		//;main.c: 341: Timer2Init();
		LCALL 	185H 			//0197 	3185

		//;main.c: 342: DelayUs(100);
		LDWI 	64H 			//0198 	2A64
		LCALL 	1EDH 			//0199 	31ED
		LDWI 	64H 			//019A 	2A64

		//;main.c: 343: PC4=0;
		BCR 	STATUS,5 		//019B 	1283
		ORG		019CH
		BCR 	STATUS,6 		//019C 	1303
		BCR 	7H,4 			//019D 	1207

		//;main.c: 344: DelayUs(100);
		LCALL 	1EDH 			//019E 	31ED

		//;main.c: 345: PC4=1;
		BCR 	STATUS,5 		//019F 	1283
		BCR 	STATUS,6 		//01A0 	1303
		BSR 	7H,4 			//01A1 	1A07
		RET		 					//01A2 	0004

		//;board.c: 126: T1CON = 0B00110000;
		LDWI 	30H 			//01A3 	2A30
		ORG		01A4H
		BCR 	STATUS,5 		//01A4 	1283
		STR 	10H 			//01A5 	0190

		//;board.c: 129: TMR1L = 0XE0;
		LDWI 	E0H 			//01A6 	2AE0
		STR 	EH 			//01A7 	018E

		//;board.c: 131: TMR1H = 0XB1;
		LDWI 	B1H 			//01A8 	2AB1
		STR 	FH 			//01A9 	018F

		//;board.c: 133: TMR1IE = 1;
		BSR 	STATUS,5 		//01AA 	1A83
		BSR 	CH,0 			//01AB 	180C
		ORG		01ACH

		//;board.c: 134: TMR1ON = 1;
		BCR 	STATUS,5 		//01AC 	1283
		BSR 	10H,0 			//01AD 	1810

		//;board.c: 135: PEIE=1;
		BSR 	INTCON,6 		//01AE 	1B0B
		RET		 					//01AF 	0004

		//;board.c: 189: T2CON = 0B00011010;
		LDWI 	1AH 			//01B0 	2A1A
		STR 	12H 			//01B1 	0192

		//;board.c: 192: TMR2 = 0;
		CLRR 	11H 			//01B2 	0111

		//;board.c: 193: PR2 = 200;
		LDWI 	C8H 			//01B3 	2AC8
		ORG		01B4H
		BSR 	STATUS,5 		//01B4 	1A83
		STR 	12H 			//01B5 	0192

		//;board.c: 195: TMR2IF = 0;
		BCR 	STATUS,5 		//01B6 	1283
		BCR 	CH,1 			//01B7 	108C

		//;board.c: 196: TMR2IE = 0;
		BSR 	STATUS,5 		//01B8 	1A83
		BCR 	CH,1 			//01B9 	108C

		//;board.c: 197: TMR2ON = 0;
		BCR 	STATUS,5 		//01BA 	1283
		BCR 	12H,2 			//01BB 	1112
		ORG		01BCH
		RET		 					//01BC 	0004
		CLRR 	76H 			//01BD 	0176
		CLRR 	77H 			//01BE 	0177
		CLRR 	78H 			//01BF 	0178
		CLRR 	79H 			//01C0 	0179
		CLRR 	7AH 			//01C1 	017A
		CLRR 	26H 			//01C2 	0126
		CLRR 	27H 			//01C3 	0127
		ORG		01C4H
		CLRR 	28H 			//01C4 	0128
		CLRR 	29H 			//01C5 	0129
		CLRR 	2AH 			//01C6 	012A
		CLRR 	STATUS 			//01C7 	0103
		LJUMP 	11CH 			//01C8 	391C

		//;main.c: 291: if ( task_ready.bit2 ){
		BTSS 	79H,2 			//01C9 	1D79
		RET		 					//01CA 	0004
		LDWI 	C8H 			//01CB 	2AC8
		ORG		01CCH

		//;main.c: 292: PC4=0;
		BCR 	STATUS,5 		//01CC 	1283
		BCR 	STATUS,6 		//01CD 	1303
		BCR 	7H,4 			//01CE 	1207

		//;main.c: 293: DelayUs(200);
		LCALL 	1EDH 			//01CF 	31ED

		//;main.c: 294: PC4=1;
		BCR 	STATUS,5 		//01D0 	1283
		BCR 	STATUS,6 		//01D1 	1303
		BSR 	7H,4 			//01D2 	1A07

		//;main.c: 295: task_ready.bit2 = 0;
		BCR 	79H,2 			//01D3 	1179
		ORG		01D4H
		RET		 					//01D4 	0004

		//;board.c: 126: T1CON = 0B00110000;
		LDWI 	30H 			//01D5 	2A30
		STR 	10H 			//01D6 	0190

		//;board.c: 129: TMR1L = 0XE0;
		LDWI 	E0H 			//01D7 	2AE0
		STR 	EH 			//01D8 	018E

		//;board.c: 131: TMR1H = 0XB1;
		LDWI 	B1H 			//01D9 	2AB1
		STR 	FH 			//01DA 	018F

		//;board.c: 133: TMR1IE = 1;
		BSR 	STATUS,5 		//01DB 	1A83
		ORG		01DCH
		BSR 	CH,0 			//01DC 	180C

		//;board.c: 134: TMR1ON = 1;
		BCR 	STATUS,5 		//01DD 	1283
		BSR 	10H,0 			//01DE 	1810

		//;board.c: 135: PEIE=1;
		BSR 	INTCON,6 		//01DF 	1B0B
		RET		 					//01E0 	0004

		//;board.c: 147: T1CON = 0B00110000;
		LDWI 	30H 			//01E1 	2A30
		STR 	10H 			//01E2 	0190

		//;board.c: 150: TMR1L = 0XE0;
		LDWI 	E0H 			//01E3 	2AE0
		ORG		01E4H
		STR 	EH 			//01E4 	018E

		//;board.c: 152: TMR1H = 0XB1;
		LDWI 	B1H 			//01E5 	2AB1
		STR 	FH 			//01E6 	018F

		//;board.c: 154: TMR1IE = 0;
		BSR 	STATUS,5 		//01E7 	1A83
		BCR 	CH,0 			//01E8 	100C

		//;board.c: 155: TMR1ON = 0;
		BCR 	STATUS,5 		//01E9 	1283
		BCR 	10H,0 			//01EA 	1010

		//;board.c: 156: PEIE=1;
		BSR 	INTCON,6 		//01EB 	1B0B
		ORG		01ECH
		RET		 					//01EC 	0004
		STR 	72H 			//01ED 	01F2

		//;board.c: 459: uint8_t a;
		//;board.c: 460: for(a=0;a<Time;a++)
		CLRR 	73H 			//01EE 	0173
		LDR 	72H,0 			//01EF 	0872
		SUBWR 	73H,0 			//01F0 	0C73
		BTSC 	STATUS,0 		//01F1 	1403
		RET		 					//01F2 	0004

		//;board.c: 461: {
		//;board.c: 462: _nop();
		NOP		 					//01F3 	0000
		ORG		01F4H
		INCR	73H,1 			//01F4 	09F3
		LJUMP 	1EFH 			//01F5 	39EF

		//;board.c: 353: ADCON1 = 0B01100000;
		LDWI 	60H 			//01F6 	2A60
		STR 	1FH 			//01F7 	019F

		//;board.c: 355: ADCON0 = 0B10111101;
		LDWI 	BDH 			//01F8 	2ABD
		BCR 	STATUS,5 		//01F9 	1283
		STR 	1FH 			//01FA 	019F

		//;board.c: 362: ANSEL = 0B00000100;
		LDWI 	4H 			//01FB 	2A04
		ORG		01FCH
		BSR 	STATUS,5 		//01FC 	1A83
		STR 	11H 			//01FD 	0191
		RET		 					//01FE 	0004
		LDWI 	DFH 			//01FF 	2ADF

		//;board.c: 210: TRISC1 = 1;
		BSR 	STATUS,5 		//0200 	1A83
		BSR 	7H,1 			//0201 	1887

		//;board.c: 211: ANSEL = 0B11011111;
		STR 	11H 			//0202 	0191

		//;board.c: 213: INTEDG = 0;
		BCR 	1H,6 			//0203 	1301
		ORG		0204H

		//;board.c: 214: INTF = 0;
		BCR 	INTCON,1 		//0204 	108B

		//;board.c: 215: INTE = 1;
		BSR 	INTCON,4 		//0205 	1A0B
		RET		 					//0206 	0004

		//;board.c: 105: OPTION = 0B00000010;
		LDWI 	2H 			//0207 	2A02
		BSR 	STATUS,5 		//0208 	1A83
		STR 	1H 			//0209 	0181

		//;board.c: 111: T0IF = 0;
		BCR 	INTCON,2 		//020A 	110B

		//;board.c: 112: T0IE = 1;
		BSR 	INTCON,5 		//020B 	1A8B
		ORG		020CH
		RET		 					//020C 	0004
			END
