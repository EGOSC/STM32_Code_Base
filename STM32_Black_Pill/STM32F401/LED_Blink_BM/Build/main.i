# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"







int Pin =13;
int MODER_Size =2;
int ODR_Size = 1;




int main(void)
{
  *(unsigned int *) 0x40023830 |= 0x1 << 2;
  *((unsigned int *)0x40020800) |= 0x1 << (Pin*MODER_Size);
  *((unsigned int *)0x40020814) |= 0x1 << (Pin*ODR_Size);

  while (1)
  {


   *((unsigned int *)0x40020814) |= 0x1 << (Pin*ODR_Size);
   for(int i=0; i< 1000000;)
   {
    i++;
   }
   *((unsigned int *)0x40020814) &= ~(0x1 << (Pin*ODR_Size));
   for(int i=0; i< 1000000;)
   {
    i++;
   }

  }

}

void _exit(int status) {
    while (1);
}
