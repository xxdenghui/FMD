/*******************************************************************************
 * file name: board.c
 * author: Darren
 * version V1.0.0
 * date    2019-04-16   
 ******************************************************************************
 * @attention
 * 
 ******************************************************************************/

/* Includes ------------------------------------------------------------------*/
#include "board.h"  	   	

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
volatile uint8_t ReadAPin;
/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

/*******************************************************************************
 * brief: 系统初始化
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
void BoardInit(void)
{
	// chip init
 	ClockInit();
	Timer0Init();
	Timer1Init();
	//Timer2Init();
	INTInit();
	//PAINTInit();
	//Pwm3Init();
	Pwm4Init();
	Pwm5Init();
	ADCInit();
	//CompInit();
	// board init
	LedInit();
	IRInit();
	ChargeInit();
	
 	/* Init Values */

	/* Init Fuctions */

	GIE = 1;
}

/*******************************************************************************
 * brief: 时钟初始化
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
void ClockInit(void)
{
	OSCCON = WDT_32K|OSC_16M|OSC_HRC;
							//Bit6:4 IRCF=111=16MHZ/2=8MHZ,0.125US/T(16,8,4,2,1,0.5,0.25,0.032MHz)
							//Bit0=1,系统时钟为内部振荡器
							//Bit0=0,时钟源由FOSC<2：0>决定即编译选项时选择

	INTCON = 0;  			//屏蔽中断
							//bit7=GIE; bit6=PEIE; bit5=T0IE; bit4=INTE; bit3=PAIE; bit2=T0IF; bit1=INTF; bit0=PAIF
							
	PORTA = 0B00000000;		//PA初值
	TRISA = 0B11111111;		//PA输入输出 0-输出 1-输入	
	WPUA = 0B00000000;      //PA端口上拉控制 1-开上拉 0-关上拉

	PORTC = 0B00000000; 	//PC初值
	TRISC = 0B11111111;		//PC输入输出 0-输出 1-输入	
	WPUC = 0B00000000;    	//PC端口上拉控制 1-开上拉 0-关上拉

	OPTION = 0B00000000;	
							//Bit7=0 PA上拉允许
						    //Bit5 T0CS Timer0时钟源选择:1-外部引脚电平变化T0CKI 0-内部时钟(FOSC/2)
							//Bit4 T0CKI引脚触发方式 1-下降沿 0-上升沿
							//Bit3 PSA 预分频器分配位 0-Timer0 1-WDT 
							//Bit2:0 PS2 T0预分频比4T*2^(n+1) 指令周期=4T
							// 16M/4/16=250K
							
	MSCKCON = 0B00000000;	//6B->0,禁止PA4，PC5稳压输出
							//5B->0,TIMER2时钟为Fosc
							//4B->0,禁止LVR

	CMCON0 = 0B00000111; 	//关闭比较器，CxIN为数字IO口

}

/*******************************************************************************
 * brief: Timer0初始化
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
#ifdef __USING_TIMER0
void Timer0Init(void)
{
	OPTION = 0B00000010;	
						    //Bit5 T0CS Timer0时钟源选择 
							//1-外部引脚电平变化T0CKI 0-内部时钟(FOSC/2)
							//Bit4 T0CKI引脚触发方式 1-下降沿 0-上升沿
							//Bit3 PSA 预分频器分配位 0-Timer0 1-WDT 
							//Bit2:0 PS2 8个预分频比 011 - (16/4/2^(n+1))=1000KHz
	T0IF = 0;				//清空T0软件中断
	T0IE = 1;
}
#endif	// __USING_TIMER0

/*******************************************************************************
 * brief: Timer1初始化
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
#ifdef __USING_TIMER1
void Timer1Init(void) 
{
	//需要在中断里重新赋初始值
	T1CON = 0B00110000; 	//B[5:4]=00,T2时钟分频 1:8
					 		//B1=0,T1时钟源选择内部时钟
					 		//T1SYNC=16M/2T/8=1M=1US
	TMR1L = 0XE0;  			//定时20000US=>TMR1=20000*1US=20ms
				  			//初值=65536-20000=45536=>0XB1E0
	TMR1H = 0XB1;  			//赋初值=>TMR1H=0XB1;TMR1L=0XE0
 
	TMR1IE = 1;				//使能TMER1的中断
	TMR1ON = 1;				//使能TMER1启动
	PEIE=1;    				//使能外设中断
}

/*******************************************************************************
 * brief: Timer1初始化
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
void Timer1DeInit(void) 
{
	//需要在中断里重新赋初始值
	T1CON = 0B00110000; 	//B[5:4]=00,T2时钟分频 1:8
					 		//B1=0,T1时钟源选择内部时钟
					 		//T1SYNC=16M/2T/8=1M=1US
	TMR1L = 0XE0;  			//定时20000US=>TMR1=20000*1US=20ms
				  			//初值=65536-20000=45536=>0XB1E0
	TMR1H = 0XB1;  			//赋初值=>TMR1H=0XB1;TMR1L=0XE0
 
	TMR1IE = 0;				//使能TMER1的中断
	TMR1ON = 0;				//使能TMER1启动
	PEIE=1;    				//使能外设中断
}
#endif	// __USING_TIMER1

/*******************************************************************************
 * brief: Timer2初始化
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
#ifdef __USING_TIMER2
void Timer2Init(void)
{
	T2CON = 0B00010110;		// bit2=1打开TMR2	
							// bit1~0=T2预分频比(00=1,01=4,1x=16)
							// bit6~3=T2后分频比(n+1后分频比)
	TMR2 = 0;  				// TMR2赋初值
	PR2 = 200; 				// 设置TMR2输出比较值定时400us=(1/16000000)*2*16*200(PR2)
							// 16M-2T-4分频 
	TMR2IF = 0;				// 清TIMER2中断标志
	TMR2IE = 1;				// 使能TIMER2的中断
	TMR2ON = 1;				// 使能TIMER2启动
	PEIE=1;    				// 使能外设中断
}

/*******************************************************************************
 * brief: Timer2初始化
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
void Timer2DeInit(void)
{
	T2CON = 0B00011010;		// bit2=0关闭TMR2	
							// bit1~0=T2预分频比(00=1,01=4,1x=16)
							// bit6~3=T2后分频比(n+1后分频比)
	TMR2 = 0;  				// TMR2赋初值
	PR2 = 200; 				// 设置TMR2输出比较值定时200us=(1/16000000)*2*16*200(PR2)
							// 16M-2T-16分频 
	TMR2IF = 0;				// 清TIMER2中断标志
	TMR2IE = 0;				// 使能TIMER2的中断
	TMR2ON = 0;				// 使能TIMER2启动
}
#endif	// __USING_TIMER2

/*******************************************************************************
 * brief: INT初始化
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
#ifdef __USING_INT
void INTInit(void)
{
	TRISC1 = 1; 			//SET PC1 INPUT
	ANSEL = 0B11011111;		//关闭中断引脚模拟输入功能

	INTEDG = 0; 			//OPTION,INTEDG=1; PC1 INT为上升沿触发 
	INTF = 0;   			//清PC1 INT中断标志位
	INTE = 1;   			//使能PC1 INT中断
}
#endif	// __USING_INT
/*******************************************************************************
 * brief: PAINT初始化
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
#ifdef __USING_PAINT
void PAINTInit(void)
{
	ANSEL = 0B11110111;		//关闭中断引脚模拟输入功能
	TRISA3 = 1;				//SET PA6 INPUT
	ReadAPin = PORTA;		//清PA电平变化中断
	PAIF = 0;				//清PA INT中断标志位
	IOCA3 = 1;				//使能PA6电平变化中断
	PAIE = 1;				//使能PA INT中断
	//GIE =1;    			//使能全局中断
}
#endif	// __USING_PAINT

/*******************************************************************************
 * brief: PWM3初始化
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
#ifdef __USING_PWM3
void Pwm3Init(void)
{
	// PWM3 config
	PWM3Dir = 1; 			//PWM3输出PIN暂为输入模式
	PWM3CR0 = 0B00000010; 	//Bit7 禁止中断
							//Bit6:4 周期位选择000:4位
							//Bit3:1 时钟选择	001:内部RC快时钟/(T3CKDIV+1)
							//Bit0 PWM 输出	
											
    //PWM3CR1 = 0;
	PWM3CR1 = 0B10000000;
                   			//Bit7 =1，TMR3为PWM/BUZZER模式
	               			//Bit6 =0，PWM3为高电平有效
	               			//Bit5:3 =000，PWM3预分频比设置为1:1(2^n)
	               			//Bit2 =0,暂关TMR3
	               			//Bit1 =0,禁止TMR3中断
	               			//Bit0 =0，TMR3中断标志位	
	               			
	T3CKDIV = 25; 			//周期 = 2^0*2^4*[(T3CKDIV+1)/16000000] =(T3CKDIV+1)*1us
				  			//26*1us = 26us = 38KHz   
		
	TMR3H = 0;
	PR3L = 8;
	TMR3ON = 1;
	PWM3Dir = 0; 			//PWM3 PIN设为输出模式允许PWM输出
}
#endif	// __USING_PWM3
	
/*******************************************************************************
 * brief: PWM4初始化
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
#ifdef __USING_PWM4
void Pwm4Init(void)
{
	// PWM4 config
	PWM4Dir = 1; 			//PWM4输出PIN暂为输入模式
	PWM4CR0 = 0B00110010; 	//Bit7 禁止中断
							//Bit6:4 周期位选择011:8位
							//Bit3:1 时钟选择001:内部RC快时钟/(T3CKDIV+1)
							//Bit0	PWM 输出	
													
    //PWM4CR1 = 0;
	PWM4CR1 = 0B10000000;
                   			//Bit7 =1，TMR4为PWM/BUZZER模式
	               			//Bit6 =0，PWM4为高电平有效
	               			//Bit5:3 =000，PWM4预分频比设置为1:1
	               			//Bit2 =0,暂关TMR4
	               			//Bit1 =0,禁止TMR4中断
	               			//Bit0 =0，TMR4中断标志位只读
	               			//
	T4CKDIV = 14;			//周期 = 2^0*2^8*[(T4CKDIV+1)/16000000] =(T4CKDIV+1)*16us
				 			//15*16us = 256us ≈ 3.9KHz
    TMR4H = 0;
	PR4L = 0;
	TMR4ON = 1;
	PWM4Dir = 0; 			//PWM4 PIN设为输出模式允许PWM输出
}
#endif	// __USING_PWM4
	
/*******************************************************************************
 * brief: PWM4初始化
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
#ifdef __USING_PWM5
void Pwm5Init(void)
{
	// PWM5 config
	PWM5Dir = 1; 			//PWM5输出PIN暂为输入模式
	PWM5CR0 = 0B00110010; 	//Bit7	禁止中断
				 			//Bit6:4 周期位选择011:8位
							//Bit3:1 时钟选择001:内部RC快时钟/(T3CKDIV+1)
							//Bit0	PWM 输出
	
    //PWM5CR1 = 0;
	PWM5CR1 = 0B10000000;
                  		 	//Bit7 =1，TMR5为PWM/BUZZER模式
	              		 	//Bit6 =0，PWM5为高电平有效
	              		 	//Bit5:3 =000，PWM5预分频比设置为1:1
	              		 	//Bit2 =0,暂关TMR5
	              		 	//Bit1 =0,禁止TMR5中断
	              		 	//Bit0 =0，TMR5中断标志位只读
	              		 	
    T5CKDIV = 14;			//周期 = 2^0*2^8*[(T3CKDIV+1)/16000000] =(T3CKDIV+1)*16us
				  			//15*16us = 256us ≈ 3.9KHz
    TMR5H = 0;
	PR5L = 0;
	TMR5ON = 1;
	PWM5Dir = 0; 			//PWM5 PIN设为输出模式允许PWM输出
}
#endif	// __USING_PWM5

/*******************************************************************************
 * brief: ADC初始化
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
#ifdef __USING_ADC
void ADCInit(void)
{
	//ADCON1 = 0B00010000; 	//DIVS=0,时钟选FOSC
					   		//ADCS[2:0]=001,分频FOSC/8
	//ADCON1 = 0B01010000; 	//DIVS=0,时钟选FOSC
					   		//ADCS[2:0]=101,分频FOSC/16
	ADCON1 = 0B01100000; 	//DIVS=0,时钟选FOSC
					   		//ADCS[2:0]=110,分频FOSC/64
	ADCON0 = 0B10111101; 	//B7,ADFM=1,结果右对齐                     
					   		//B6:5,VCFG=00,参考电压VDD
					   		//B6:5,VCFG=01,参考电压内部2V
					   		//B6:5,VCFG=11,参考电压Vref
					   		//B4:2,CHS=010,选择AN2通道
					   		//B1,GO,AD转换状态位
					   		//B0,ADON=1,ADC使能
	ANSEL = 0B00000100;   	//使能AN2为模拟输入	
}

/*******************************************************************************
 * brief: 读取通道ADC值
 * param: AN_CN 通道序号
 * retval: INT类型AD值(单次采样无滤波)
 * remark: none
 ******************************************************************************/
uint16_t GET_ADC_DATA (uint8_t AN_CH) 
{ 
	uint8_t i;
	uint8_t ADCON0Buff; 
	uint16_t tBuffer = 0;
	uint16_t ADC_DATA=0;
	 
	ADCON0Buff = ADCON0 & 0B11100011; 	//清空通道值

	AN_CH <<=2;              
	ADCON0Buff |=  AN_CH;   			//(BIT4-BIT2)CHS=010,选择AN2通道      

	ADCON0 = ADCON0Buff; 				//重新加载通道值
    DelayUs(20); 
	GO_DONE = 1;             			//启动ADC 
	while( GO_DONE==1 );    			//等待ADC转换完成

	ADC_DATA =  ADRESH;
	ADC_DATA <<=8;
	ADC_DATA |= ADRESL;      			//10Bit ADC值整合
	tBuffer =  ADC_DATA;
	return  tBuffer;
} 
#endif	// __USING_ADC

/*******************************************************************************
 * brief: 比较器初始化
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
#ifdef __USING_COMP
void CompInit(void)
{
	CMCON0 = 0B00000101; 	//四个输入共用2个比较器
				            /*BIT7 C2OUT
				              BIT6 C1OUT
				              BIT5 C2INV 比较器2输出反向 1-反向 0-不反向
				              BIT4 C1INV 比较器1输出反向 1-反向 0-不反向
				              BIT3 CIS比较器输出切换当CM[2:0] = 010 CIS = 1 C1IN+接C1VIN-  C2IN+接C2VIN-
														         CIS = 0 C1IN-接C1VIN-  C2IN-接C2VIN-
										          当CM[2:0] = 001 CIS = 1 C1IN+接C1VIN- 
														          CIS = 0 C1IN-接C1VIN-
				              BIT[2:0]	000-比较器关闭,CxIN管脚模拟I/O管脚
                                        001-三个输入共用2个比较器
							            010-四个输入共用2个比较器 
                                        011-两个共参考比较器 
                                        100-两个独立比较器
							            101-一个独立比较器 
                                        110-两个带输出供参考比较器 
							            111-比较器关闭,CxIN管脚为数字I/O管脚
				            */ 
	CMCON1 = 0B00000000;
	VRCON = 0B00001111;		/* BIT7 VREN CVREF使能位 1-CRVEF电路通电 0-CRVEF电路断电,无泄漏电流
			                   BIT5 VRR  VREF电压范围选择 1-低电平范围 0-高电平范围
			                   BIT[3:0] VR[3:0] CVREF值选择位 
						       VRR = 1时: CVREF = (VR<3:0>/24)*VDD
						       VRR = 0时: CVREF = VDD/4+(VR<3:0>/32)*VDD  	= 5/4+(15/32)*5=3.59375V(电源5V)	
			                */	
    ANSEL = 0B00110000;		//C2+,C2-(AIN4,AIN5)设置为模拟输入
}
#endif	// __USING_COMP


/*******************************************************************************
 * brief: WDTinit
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
#ifdef __USING_WDT
void WDTinit(void)
{
	clr_wdt();
	PSA = 1;				// 分频器配给WDT
	WDTCON = 0B00001011; 	// b4~b1(WDTPS):32,64,128,256,512(reset),1024,2048,8192,16384,32768,65536
							// 看门狗溢出时间=1/32KHz*WDTPS*PSA=31.25us*1024*4=128ms
}
#endif	// __USING_WDT

/*******************************************************************************
 * brief: DelayUs
 * param: Time 延时时间长度 延时时长Time Us
 * retval: INT类型AD值(单次采样无滤波)
 * remark: none
 ******************************************************************************/
void DelayUs(uint8_t Time)
{
	uint8_t a;
	for(a=0;a<Time;a++)
	{
		NOP();
	}
} 

/************************** (C) COPYRIGHT 2017 D.H ****************************/
/********************************  END OF FILE  *******************************/


