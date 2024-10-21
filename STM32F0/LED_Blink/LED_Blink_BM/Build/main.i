# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"







int Pin =5;
int MODER_Size =2;
int ODR_Size = 1;




int main(void)
{
  *(unsigned int *)0x40021014 |= 0x1 << 17;
  *((unsigned int *)0x48000000) |= 0x1 << (Pin*MODER_Size);
  *((unsigned int *)0x48000014) |= 0x1 << (Pin*ODR_Size);

  while (1)
  {


   *((unsigned int *)0x48000014) |= 0x1 << (Pin*ODR_Size);
   for(int i=0; i< 1000000;)
   {
    i++;
   }
   *((unsigned int *)0x48000014) &= ~(0x1 << (Pin*ODR_Size));
   for(int i=0; i< 1000000;)
   {
    i++;
   }

  }

}

void _exit(int status) {
    while (1);
}
