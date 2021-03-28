#include <stdio.h>

#include <FeatComplete_api.h>
#include <FeatPartial_api.h>

typedef struct
{
  int i;
  int array[1 + FC_ARRAY + FP_ARRAY];
} myStruct_t;

int main(int argc, char *argv[])
{
  printf("Size of myStruct_t is : %lu\n", sizeof(myStruct_t));
  FC_print();
  FP_print();

  return 0;
}
