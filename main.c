/*******************************************************************************
 * file name: main.c
 * author: Darren
 * version V1.0.0
 * date    2019-04-16  
 ******************************************************************************
 * @attention
 * 
 ******************************************************************************/

/* Includes ------------------------------------------------------------------*/
#include "main.h"  	   	

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
 
uint8_t ticks;
uint8_t ticks1;
uint8_t ticks2;

uint8_t brightWW;
uint8_t brightCW;
uint8_t cct;
uint8_t bright;

uint16_t adcVal;
uint16_t tim1val;

extern volatile uint8_t ReadAPin;

/* Private function prototypes -----------------------------------------------*/
void Task_SoftPwm(void);
void Task_Key(void);
void Task_IRSend(void);
void Task_LowBat(void);
void Task_Idle(void);
/* Private functions ---------------------------------------------------------*/

/*******************************************************************************
 * name: main
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
void main(void)
{
	/* system initalization */
	BoardInit( );
	bright = 255;
	brightWW = bright;
	brightCW = bright;
	cct = 0;
	TMR4ON = 1;
	PWM4Dir = 0; 			// PWM4 PIN设为输出模式允许PWM输出
	TMR5ON = 1;
	PWM5Dir = 0; 			// PWM4 PIN设为输出模式允许PWM输出
	/*sys_std_Power = 0;		// 默认关机状态
	for ( cct=0; cct<100; cct++ ){
		led1Off();
		DelayUs(200);
		led1On();
		DelayUs(200);
	}  */
	sys_std_Power = 1;		// 正常功耗运行
	//WDTinit();				// 开启WDT,睡眠溢出唤醒,正常溢出复位
	/* interface loop */
	while(1)
	{
		if ( !sys_std_Power ){			// 低功耗进程
			Task_Idle();
		}
		else {							// 正常进程
			Task_IRSend();				
			Task_Key();
			Task_SoftPwm();
			Task_LowBat();
			//clr_wdt();
		}
	}

}


/*******************************************************************************
 * brief: 中断入口
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
void interrupt ISR(void)	//PIC_HI-TECH使用
{
  	//T0 Handle
  	#ifdef __USING_TIMER0
	if(T0IE && T0IF){
		TMR0 = 155; 		//注意:对TMR0重新赋值TMR0在两个周期内不变化			
		if ( ++ticks >= 50 ){   	   	  
   	   	   	ticks = 0;
   	   	   	// 5ms周期
   	   	   	task_ready_IRSend = 1;
			task_ready_SofPwm = 1;
   	   	   	task_ready_Key = 1;
			sys_std_LowBat = 1;

		}
		T0IF = 0;
	}	
	#endif	// __USING_TIMER0
	
	#ifdef __USING_TIMER1
	if ( TMR1IF ){
		TMR1IF = 0;
		Timer1DeInit();			// 超时20ms关闭定时器2计时
		TMR1L = 0XE0;  			// 定时20000US=>TMR1=20000*1US=20ms
				  				// 初值=65536-20000=45536=>0XB1E0
		TMR1H = 0XB1;  			// 赋初值=>TMR1H=0XB1;TMR1L=0XE0 
		sys_std_KeyHold = 0; 
	}
	#endif	// __USING_TIMER1

	// T2 Handle
	#ifdef __USING_TIMER2
	if ( TMR2IE && TMR2IF ){
		Timer2DeInit();			// 超时400us关闭定时器2计时
		sys_std_KeyHold = 0;
		TMR2IF = 0;
	}
	#endif	// __USING_TIMER2
	
	#ifdef __USING_INT
	if(INTE && INTF)		
	{                   	
		INTF = 0;  				//清PC1 INT 标志位
		//INTE = 0;  			//暂先禁止INT中断
		if ( TMR1ON ){
			tim1val = (uint16_t)TMR1H<<8|TMR1L;
			if ( ( tim1val <= WAVE_MAX ) && ( tim1val >= WAVE_MIN ) ){
				sys_std_KeyHold = 1;
			}
			else 
				sys_std_KeyHold = 0;
		}
	 	Timer1Init();		//启动定时器2计时
		 
	}
	#endif	// __USING_INT

	//PAINT  Handle
	#ifdef __USING_PAINT
	if(PAIE && PAIF)		
    {
		ReadAPin = PORTA; 	//读取PORTA数据清PAIF标志
		PAIF = 0;  			//清PAIF标志位
		PAIE = 0;  			//暂先禁止PA3中断
		IOCA3 =0;  			//禁止PA3电平变化中断
		if ( TMR2ON ){
			if ( ( TMR2 <= WAVE_MAX ) && ( TMR2 >= WAVE_MIN ) ){
				sys_std_KeyHold = 1;
			}
			else 
				sys_std_KeyHold = 0;
		}
	 	Timer2Init();		//启动定时器2计时
	 	IOCA3 = 1;			//使能PA3电平变化中断
		PAIE = 1;			//使能PA INT中断
    }
    #endif	// __USING_PAINT
    
    #ifdef __USING_COMP
    if(C2IF)							
	{		 
		//Cbuff = CMCON0;  				//读CMCON0结束失配条件
		if ( TMR2ON ){
			if ( ( TMR2 <= WAVE_MAX ) && ( TMR2 >= WAVE_MIN ) ){
				sys_std_KeyHold = 1;
			}
			else 
				sys_std_KeyHold = 0;
		}
	 	Timer2Init();		//启动定时器2计时
		C2IF = 0;						//清中断标志	
		
	}
	#endif	// __USING_COMP
}

/*******************************************************************************
 * brief: soft PWM 
 * param: none
 * retval: none
 * remark: 10ms
 ******************************************************************************/
void Task_SoftPwm(void)
{
	if ( cct ){
		if ( cct == 1 ){
			brightCW = bright;
			brightWW = 0;
		}
		else if ( cct == 2 ){
			brightCW = 0;
			brightWW = bright;
		}
		else if ( cct == 3 ){
			brightCW = bright;
			brightWW = bright;
		}
	}
	else {
		brightCW = 0;
		brightWW = 0;
	}
   	if ( task_ready_SofPwm ){

		#ifdef __USING_PWM4
		if ( brightWW != PR4L ){
			if ( brightWW > PR4L )
				PR4L++;
			else
				PR4L--;
		}
		#endif	// __USING_PWM4
		
		#ifdef __USING_PWM5
		if ( brightCW != PR5L ){
			if ( brightCW > PR5L )
				PR5L++;
			else
				PR5L--;
		}
		#endif	// __USING_PWM5
		
   	   	task_ready_SofPwm = 0;
   	}
}

/*******************************************************************************
 * brief: key
 * param: none
 * retval: none
 * remark: 10ms
 ******************************************************************************/
void Task_Key(void)
{
	static uint8_t key_press_time = 0;

	if ( task_ready_Key ){
		if ( sys_std_KeyHold ){			// 按键维持
			if ( key_press_time < 100 )
				key_press_time++;
			else {						// 长按
				sys_std_KeyLong = 1;
				if ( sys_std_BrightWay ){	// 渐暗调光
					if ( bright > 25 )
						bright--;
				}
				else {
					if ( bright < 255 )		// 渐亮调光
						bright++;
				}
			}
		}
		else if ( key_press_time ){		// 按键释放
			key_press_time = 0;
			if ( !sys_std_KeyLong ){	// 短按释放
				if ( ++cct > 3 ){
					cct = 0;
					bright = 255;		// 关灯后重置为最高亮度
					sys_std_BrightWay = 1;
				}
			}
			else {
				sys_std_BrightWay = !sys_std_BrightWay;	// 长按释放
			}
			sys_std_KeyLong = 0;
		}
		task_ready_Key = 0;
	}
}

/*******************************************************************************
 * brief: IR send
 * param: none
 * retval: none
 * remark: 1ms
 ******************************************************************************/
void Task_IRSend(void)
{
	if ( task_ready_IRSend ){
		IROn();
		DelayUs(200);
		IROff();
		task_ready_IRSend = 0;
	}
}

/*******************************************************************************
 * brief: 低电量检测
 * param: none
 * retval: none
 * remark: ADC
 ******************************************************************************/
void Task_LowBat(void)
{
	if ( sys_std_LowBat ){
		adcVal = GET_ADC_DATA(2);
		if ( !PA3 )
			sys_std_Charge = 1;
		else 
			sys_std_Charge = 0;
		if ( sys_std_Charge ){
			led1On();
			led2Off();
		}
		else {
			led1Off();
			if ( cct ){
				if ( adcVal <= 0x22D ){		// 10%
					led2On();
				}
			}
			else 
				led2Off();
		}
		sys_std_LowBat = 0;
	}
}

/*******************************************************************************
 * brief: 低功耗
 * param: none
 * retval: none
 * remark: 
 ******************************************************************************/
void Task_Idle(void)
{
	halt();
	clr_wdt();
	Timer2Init();
	DelayUs(100);
	IROn();
	DelayUs(100);
	IROff();
}

/************************** (C) COPYRIGHT 2017 D.H ****************************/
/********************************  END OF FILE  *******************************/


