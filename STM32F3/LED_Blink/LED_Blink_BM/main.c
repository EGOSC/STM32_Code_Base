#define GPIOE_BASE 	(unsigned int *)0x48001000
#define GPIOE_ODR 	(unsigned int *)0x48001014
#define RCC_BASE	(unsigned int *)0x40021000
#define RCC_AHBENR	(unsigned int *)0x40021014
#define	GPIOEEN		21
#define ODR			0x14
#define MODER 		0
int Pin =8;
int MODER_Size =2;
int ODR_Size = 1;
/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  *RCC_AHBENR	|= 0x1 << GPIOEEN;
  *(GPIOE_BASE) |= 0x1 << (Pin*MODER_Size);
  *(GPIOE_ODR) |= 0x1 << (Pin*ODR_Size);

  while (1)
  {
    /* USER CODE END WHILE */

	  *(GPIOE_ODR) |= 0x1 << (Pin*ODR_Size);
	  for(int i=0; i< 1000000;)
	  {
		  i++;
	  }
	  *(GPIOE_ODR) &= ~(0x1 << (Pin*ODR_Size));
	  for(int i=0; i< 1000000;)
	  {
		  i++;
	  }
    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

void _exit(int status) {
    while (1);  // Loop indefinitely or perform a reset
}