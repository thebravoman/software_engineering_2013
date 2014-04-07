#include <stdio.h>

int main(){
  int primes [] = {131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251};
  int p = rand() % 23;
  int q = rand() % 23;
  while(p == q){
    q = rand() % 23;
  }
  p = primes[p];
  q = primes[q];
  int n = p*q;
  int fn = (p-1)*(q-1);
  printf("%d\n", p);
  printf("%d\n", q);
  printf("%d\n", n);
  printf("%d\n",fn );


  return 0;
}
