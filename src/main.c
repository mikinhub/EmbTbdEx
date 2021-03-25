#include <stdio.h>

typedef struct
{
  int i;
} myStruct_t;

int main(int argc, char *argv[])
{
  printf("Size of myStruct_t is : %d\n", sizeof(myStruct_t));
  
  return 0;
}
