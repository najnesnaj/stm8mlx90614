/******************** (C) COPYRIGHT  长江智动科技 ***************************
 * 文件名  ：mlx90614.c
 * 描述    ：I2C 总线配置读写函数库    
 * 库版本  ：V2.0.0
 |--------------------|
 |  I2C_SCL-PB4       |
 |  I2C_SDA-PB5       |
 |--------------------|

 ****************************************************************************************/

/* Includes ------------------------------------------------------------------*/
#include "mlx90614.h"


void MLX90614_Init(void)
{

	u8 Input_Clock = 0x0;
	/* Get system clock frequency */
	Input_Clock = CLK_GetClockFreq()/1000000;
	/* I2C Peripheral Enable */
	I2C_Cmd(ENABLE);
	/* Apply I2C configuration after enabling it */
	I2C_Init(I2C_Speed, I2C1_SLAVE_ADDRESS7, I2C_DUTYCYCLE_2,\
			I2C_ACK_CURR, I2C_ADDMODE_7BIT, Input_Clock);

}

void ByteWrite(u8* pBuffer, u8 WriteAddr)
{

	/* Send STRAT condition */
	I2C_GenerateSTART(ENABLE);

	/* Test on EV5 and clear it */
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_START_SENT));  

	/* Send address for write */
	I2C_Send7bitAddress(I2C1_SLAVE_ADDRESS7, I2C_DIRECTION_TX);

	/* Test on EV6 and clear it */
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_ADDRESS_ACKED));

	/* Send Address */
	I2C_SendData((WriteAddr)); /* LSB */
	/* Test on EV8 and clear it */
	while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING));

	/* Send the byte to be written */
	I2C_SendData(*pBuffer); 

	/* Test on EV8 and clear it */
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));

	/* Send STOP condition */
	I2C_GenerateSTOP(ENABLE);

}

void I2C_EE_BufferRead(u8* pBuffer, u8 ReadAddr, u8 NumByteToRead)
{

	/* While the bus is busy */
	while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY));

	/* Generate start & wait event detection */
	I2C_GenerateSTART(ENABLE);
	/* Test on EV5 and clear it */
	while (!I2C_CheckEvent(I2C_EVENT_MASTER_START_SENT));

	/* Send slave Address in write direction & wait detection event */
	I2C_Send7bitAddress(I2C1_SLAVE_ADDRESS7, I2C_DIRECTION_TX);
	/* Test on EV6 and clear it */
	while (!I2C_CheckEvent(I2C_EVENT_MASTER_ADDRESS_ACKED));
	I2C_ClearFlag(I2C_FLAG_ADDRESSSENTMATCHED);

	/* Send Address of first byte to be read & wait event detection */
	I2C_SendData(ReadAddr); /* LSB */
	/* Test on EV8 and clear it */
	while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));

	/* Send STRAT condition a second time */ 
	I2C_GenerateSTART(ENABLE);
	/* Test on EV5 and clear it */
	while (!I2C_CheckEvent(I2C_EVENT_MASTER_START_SENT));

	/* Send slave Address in read direction & wait event */
	I2C_Send7bitAddress(I2C1_SLAVE_ADDRESS7, I2C_DIRECTION_RX);
	/* Test on EV6 and clear it */
	while (!I2C_CheckEvent(I2C_EVENT_MASTER_ADDRESS_ACKED));
	I2C_ClearFlag(I2C_FLAG_ADDRESSSENTMATCHED);

	/* While there is data to be read */
	while(NumByteToRead)  
	{

		if(NumByteToRead == 1)
		{

			/* Disable Acknowledgement */
			I2C_AcknowledgeConfig(I2C_ACK_NONE);

			/* Send STOP Condition */
			I2C_GenerateSTOP(ENABLE);

		}

		/* Test on EV7 and clear it */
		if(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED))  
		{

			/* Read a byte from the EEPROM */
			*pBuffer = I2C_ReceiveData();

			/* Point to the next location where the byte read will be saved */
			pBuffer++; 

			/* Decrement the read bytes counter */
			NumByteToRead--;        

		}   

	}

	/* Enable Acknowledgement to be ready for another reception */
	I2C_AcknowledgeConfig(I2C_ACK_CURR);

}


