#define GPIO_ODR			0x14
#define GPIO_MODER			0x0
#define GPIOA_BASE			(int *)0x48000000
#define GPIO_OUTPUT			0x1
#define LED0_PIN			5
#define GPIOA5_MODER(x)		*(GPIOA_BASE+GPIO_MODER) |= (x << 10)
#define RCC_AHBENR			*(unsigned int *)0x40021014
#define SET_GPIOA5			*(GPIOA_BASE+GPIO_ODR)	|= 1 << 5 
#define RESET_GPIOA5		*(GPIOA_BASE+GPIO_ODR)	&= (~(1 << 5))
#define	GPIOAEN				17
int i = 0;
int main(void)
{
  RCC_AHBENR	|= 0x1 << GPIOAEN;
  GPIOA5_MODER(GPIO_OUTPUT);
  while (1)
  {
	SET_GPIOA5;
	for(i = 0;i<10000;)
	{
		i++;
	}
	RESET_GPIOA5;
	for(i = 0;i<10000;)
	{
		i++;
	}
  }
  
}

void _exit(int status) {
    // Infinite loop to halt the program
    while (1) {
        // Optionally, you can add code here to handle the exit status
    }
}
