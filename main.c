/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "stm8s_clk.h"
#include "intrinsics.h"
#include "stm8s_uart1.h"
#include "uart.h"
#include "mlx90614.h"
#include <stdio.h>
 
 
 
u16 tempData;
float objTemp[3];
/* Private variables ---------------------------------------------------------*/
 
#define PUTCHAR_PROTOTYPE int putchar (int c)
#define GETCHAR_PROTOTYPE int getchar (void)
 
u8 tBuffer[2];
u8 re_buffer;
u8 Buffer;
int i = 0;
int len;
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
void Delay_ms(u32 nCount);
void Delay_us(u32 nCount);
void usart_re(void);
 
 
 
int main(void)
{
 
    /* Infinite loop */
  /*设置内部时钟16M为主时钟*/
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
    asm("sim"); // 关全局中断
  /*!<Set High speed internal clock  */
    I2C_DeInit();
     Uart_Init();
    /* Initialize the I2C */
     asm("rim");//开中断，sim为关中断
     Delay_ms(200);
     
     MLX90614_Init();
   
     
     
    
   /// __enable_interrupt();
  ///  asm("rim"); // 开全局中断
 //   UART1_SendString("STM8_MLX90614 test!",sizeof("STM8_MLX90614 test!"));
   // UART1_SendByte('\n');
    len = 0;
    while (1)
    {
 
      
     /// usart_re();
     /// RxBuffer[0] = UART1_ReceiveData8();
      if(RxBuffer[0] == 0x55)
      {
 
        RxBuffer[0] = 0;
        for(i=0;i<3;i++)
        {
 
          I2C_EE_BufferRead(tBuffer, ObjTempAddr, 2);
          Delay_ms(50);
         
}
         
          
         //I2C_EE_BufferRead(tBuffer, ObjTempAddr, 2);
      //UART1_SendString("STM8_MLX90614 test!",sizeof("STM8_MLX90614 test!"));
         tempData = tBuffer[1] << 8 | tBuffer[0];
      //T=(Data)*0.02-273.15
          if(tempData >= 0x27AD && tempData <= 0x7FFF)
         {
    
            objTemp[0] = tempData*0.02-273.15;
           
}
          else
          printf("Data read error!\n");
          I2C_EE_BufferRead(tBuffer, AbmTempAddr, 2);
      //UART1_SendString("STM8_MLX90614 test!",sizeof("STM8_MLX90614 test!"));
          tempData = tBuffer[1] << 8 | tBuffer[0];
      //T=(Data)*0.02-273.15
         if(tempData >= 0x27AD && tempData <= 0x7FFF)
         {
 
            objTemp[2] = tempData*0.02-273.15;
            //len++;
           
}
           else
              printf("Data read error!\n");
         
          /// printf("Data read error!\n");
          /// UART1_SendString(objTemp[])
         printf("%.2f %.2f",objTemp[0],objTemp[2]);
        
       
        /// Delay_ms(300);
       
}
      
     
}
 
}
 
void Delay_ms(u32 nCount)
{
 
  /* Decrement nCount value */
  while (nCount != 0)
  {
 
    u16 timeCnt;
    for(timeCnt = 0;timeCnt <2000;timeCnt++);
    nCount--;
   
}
 
}
void usart_re(void)
{
 
  re_buffer = UART1_ReceiveByte();
 
}
void Delay_us(u32 nCount)
{
 
  /* Decrement nCount value */
  while (nCount != 0)
  {
 
    nCount--;
   
}
 
}
INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
{
 
    UART1_ClearITPendingBit(UART1_IT_RXNE); 
     ///if(UART1_GetITStatus(UART1_IT_RXNE )!= RESET)  /*接收中断(接收到的数据必须是0x0d 0x0a结尾)*/
    //{
 
UART1_ClearFlag(UART1_FLAG_OR); //清除ORE
           Buffer = UART1_ReceiveData8();
          if(Buffer == 0x55)
           {
 
             RxBuffer[0] = Buffer;
            
} 
     ///
}
     
   ////USART_ClearFlag(UART1,USART_FLAG_ORE); //清除ORE
 
}
 
/*********************************************************************************************************
* 函 数 名: putchar
* 功能说明: 重定义 putchar 函数， 这样可以使用printf函数从串口1打印输出
* 形    参: 等待发送的字符
* 返 回 值: 返回已发送的字符
*********************************************************************************************************
*/
PUTCHAR_PROTOTYPE
{
 
 /* 发送一个字符 c 到UART1 */
 UART1_SendData8(c);
 /* 等待发送完毕 */
 while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
 return (c);
 
}
/*
*********************************************************************************************************
* 函 数 名: getchar
* 功能说明: 重定义C库中的 getchar 函数,这样可以使用scanff函数从串口1输入数据
* 形    参: 无
* 返 回 值: 返回已读到的字符
*********************************************************************************************************
*/
GETCHAR_PROTOTYPE
{
 
  int c = 0;
 /* 等待新数据到达  */
 while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
 /* 读取数据寄存器 */
 c = UART1_ReceiveData8();
 return (c);
 
}
 
#ifdef USE_FULL_ASSERT
 
/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(u8* file, u32 line)
{
  
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
 
  /* Infinite loop */
  while (1)
  {
 
   
}
 
}
#endif
 
/******************* (C) COPYRIGHT 长江智动科技 *****END OF FILE****/

