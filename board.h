/*******************************************************************************
 * file name: board.h
 * author: Darren
 * version V1.0.0
 * date    2019-04-16   
 ******************************************************************************
 * @attention

 ******************************************************************************/
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef	__BOARD_H__
#define __BOARD_H__

/* Includes ------------------------------------------------------------------*/
#include "SYSCFG.h"

/* Exported types ------------------------------------------------------------*/
typedef unsigned char 							uint8_t;
typedef unsigned int 							uint16_t;

typedef volatile union{
	struct{
		unsigned bit0:1;
		unsigned bit1:1;
		unsigned bit2:1;
		unsigned bit3:1;
		unsigned bit4:1;
		unsigned bit5:1;
		unsigned bit6:1;
		unsigned bit7:1;
	};
	uint8_t byte;
}_BitTypeDef;

/* Exported constants --------------------------------------------------------*/

/* Exported macros -----------------------------------------------------------*/
#define ON										1
#define OFF										0

#define __DEBUG_MODE							// 调试模式
#define __USING_TIMER0							// 启用timer0
#define __USING_TIMER1							// 启用timer1
#define __USING_TIMER2							// 启用timer2
#define __USING_PWM3							// 启用PWM3
#define __USING_PWM4							// 启用PWM4
#define __USING_PWM5							// 启用PWM5
#define __USING_INT 							// 启用外部中断INT
//#define __USING_PAINT							// 启用PA端口中断
#define __USING_ADC								// 启用ADC
//#define __USING_COMP							// 启用比较器
#define __USING_WDT								// 启用WDT

//PWM引脚输入输出控制
#define  PWM3Dir  								TRISC4
#define  PWM4Dir  								TRISC3
#define  PWM5Dir  								TRISC2

#define clr_wdt()    	 						asm("clrwdt"); 			   	// clear WDT
#define	nop()	 	 	 						asm("nop"); 	    
#define halt()									asm("sleep");		 		// 待机

#define LedInit()								PORTA&=0x3f;TRISA&=0x3f;
#define led1On()								PA6=1
#define led1Off()								PA6=0
#define led2On()								PA7=1
#define led2Off()								PA7=0

#define ChargeInit()							PA3 = 1;TRISA3=1;WPUA|=0x08

#define IRInit()								PC4=0;TRISC4=0
#define IROn()									PC4=0
#define IROff()									PC4=1

/* Private macros ------------------------------------------------------------*/
#define OSC_16M  								0X70
#define OSC_8M   								0X60
#define OSC_4M   								0X50
#define OSC_2M   								0X40
#define OSC_1M  	 							0X30
#define OSC_500K 								0X20
#define OSC_250K 								0X10
#define OSC_32K  								0X00
#define OSC_HRC									0x01

#define WDT_256K 								0X80
#define WDT_32K  								0X00


/* Exported functions ------------------------------------------------------- */
void BoardInit(void);
void ClockInit(void);

#ifdef __USING_TIMER0
void Timer0Init(void);
#endif	// __USING_TIMER0

#ifdef __USING_TIMER1
void Timer1Init(void);
void Timer1DeInit(void);
#endif	// __USING_TIMER1

#ifdef __USING_TIMER2
void Timer2Init(void);
void Timer2DeInit(void);
#endif	// __USING_TIMER2

#ifdef __USING_PWM3
void Pwm3Init(void);
void Pwm3DeInit(void);
#endif	// __USING_PWM3

#ifdef __USING_PWM4
void Pwm4Init(void);
void Pwm4DeInit(void);
#endif	// __USING_PWM4

#ifdef __USING_PWM5
void Pwm5Init(void);
void Pwm5DeInit(void);
#endif	// __USING_PWM5

#ifdef __USING_INT
void INTInit(void);
#endif	// __USING_INT

#ifdef __USING_PAINT
void PAINTInit(void);
#endif	// __USING_PAINT

#ifdef __USING_ADC
void ADCInit(void);
uint16_t GET_ADC_DATA (uint8_t AN_CH);
#endif	// __USING_ADC

#ifdef __USING_COMP
void CompInit(void);
#endif	// __USING_COMP

#ifdef __USING_WDT
void WDTinit(void);
#endif	// __USING_WDT

void DelayUs(uint8_t Time);

/* Private functions -------------------------------------------------------- */

#endif	// __BOARD_H__

/********************************  END OF FILE  *******************************/
