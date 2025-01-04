//User Defined Macros
#define GPIOC_BASE 	(unsigned int *)0x40020800
#define GPIOC_ODR 	(unsigned int *)0x40020814
#define RCC_BASE	(unsigned int *) 0x40023800
#define RCC_AHBENR	(unsigned int *) 0x40023830
#define	GPIOCEN		2
#define LED_PIN		13

//Global Variables 
//.data section
int MODER_Size =2;
//.bss section
int ODR_Size;
/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  int i;
  ODR_Size = 1;
  *RCC_AHBENR	|= 0x1 << GPIOCEN;
  *(GPIOC_BASE) |= 0x1 << (LED_PIN*MODER_Size);
  *(GPIOC_ODR) |= 0x1 << (LED_PIN*ODR_Size);

  while (1)
  {

	  *(GPIOC_ODR) |= 0x1 << (LED_PIN*ODR_Size);
	  for(i=0; i< 1000000;)
	  {
		  i++;
	  }
	  *(GPIOC_ODR) &= ~(0x1 << (LED_PIN*ODR_Size));
	  for(i=0; i< 1000000;)
	  {
		  i++;
	  }
  }
}

void _exit(int status) {
    while (1);  // Loop indefinitely or perform a reset
}