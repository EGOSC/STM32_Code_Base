# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 11 "main.c"
int MODER_Size =2;

int ODR_Size;




int main(void)
{
  int i;
  ODR_Size = 1;
  *(unsigned int *) 0x40023830 |= 0x1 << 2;
  *((unsigned int *)0x40020800) |= 0x1 << (13*MODER_Size);
  *((unsigned int *)0x40020814) |= 0x1 << (13*ODR_Size);

  while (1)
  {

   *((unsigned int *)0x40020814) |= 0x1 << (13*ODR_Size);
   for(i=0; i< 1000000;)
   {
    i++;
   }
   *((unsigned int *)0x40020814) &= ~(0x1 << (13*ODR_Size));
   for(i=0; i< 1000000;)
   {
    i++;
   }
  }
}

void _exit(int status) {
    while (1);
}
