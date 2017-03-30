/* Define to prevent recursive inclusion ------------------------------------ */ 
#ifndef __MLX90614_H 
#define __MLX90614_H 
/* Includes ------------------------------------------------------------------*/ 
#include "stm8.h" 
/* Private typedef -----------------------------------------------------------*/ 
/* Private define ------------------------------------------------------------*/ 
#define I2C_Speed 100000 
#define I2C1_SLAVE_ADDRESS7 0x00 
#define RamAccess 0x00 
#define EepromAccess 0x20 
#define AbmTempAddr 0x06 
#define ObjTempAddr 0x07 
/********************************EEPROM*******************************/ 
#define LineObj2TempAddr 0x08 //eepom address EEPROM 
#define KeAddr 0x04 
/* Private macro -------------------------------------------------------------*/ 
/* Private variables ---------------------------------------------------------*/ 
/* Private function prototypes -----------------------------------------------*/ 
/* Private functions ---------------------------------------------------------*/ 
/* Exported macro ------------------------------------------------------------*/ 
/* Exported functions ------------------------------------------------------- */ 
void MLX90614_Init(void); 
//void ByteWrite(u8* pBuffer, u8 WriteAddr); 
void ByteWrite(unsigned char* pBuffer, unsigned char WriteAddr); 
//void I2C_EE_BufferRead(u8* pBuffer,u8 ReadAddr, u8 NumByteToRead); 
void I2C_EE_BufferRead(unsigned char* pBuffer,unsigned char ReadAddr, unsigned char NumByteToRead); 
#endif /* __MLX90614_H */ 
/************************END OF FILE****/
