#include <stdio.h> 


void main()
{

int i,j,k;

int sigma(int *a, int low, int high, int expr()) {
int sum = 0;
for (*a=low; *a<=high; (*a)++) {
//sum = sum + expr();
sum = sum + expr();
}
return sum;
}

int thunk3()
{
return (j*k-i);
}

int thunk2()
{
return ((i+j)*sigma(&k,0,4,thunk3));
}

int thunk1()
{
return (i*sigma(&j,0,4,thunk2));
}

printf("%d\n", sigma(&i, 0, 4, thunk1));

}
