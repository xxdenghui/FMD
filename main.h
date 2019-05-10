/*******************************************************************************
 * file name: main.h
 * author: Darren
 * version V1.0.0
 * date    2019-04-16  
 ******************************************************************************
 * @attention

 ******************************************************************************/
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef	__MAIN_H__
#define __MAIN_H__

/* Includes ------------------------------------------------------------------*/
#include "board.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros -----------------------------------------------------------*/
#define WAVE_MAX								51000
#define WAVE_MIN								50000 
/* Private macros ------------------------------------------------------------*/

/* Exported functions ------------------------------------------------------- */

/* Private functions -------------------------------------------------------- */
_BitTypeDef sys_status;
#define sys_std_Power 							sys_status.bit0
#define sys_std_KeyHold							sys_status.bit1
#define sys_std_KeyLong							sys_status.bit2
#define sys_std_IRWay							sys_status.bit3
#define sys_std_Charge							sys_status.bit4
#define sys_std_BrightWay						sys_status.bit5
#define sys_std_LowBat							sys_status.bit6

// task status mark
_BitTypeDef task_ready;
#define task_ready_SofPwm 						task_ready.bit0
#define task_ready_Key							task_ready.bit1
#define task_ready_IRSend						task_ready.bit2

#endif	// __MAIN_H__

/********************************  END OF FILE  *******************************/
