#include <stdio.h>

int gcd(int a, int b) {
if (b == 0) {
return a;
} else {
return gcd(b, a % b);
}
}
int main(){
  int primes [] = {131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251};
  srand(time(NULL));
  int p = rand() % 23;
  int q = rand() % 23;
  while(p == q){
    q = rand() % 23;
  }
  p = primes[p];
  q = primes[q];
  int n = p*q;
  int fn = (p-1)*(q-1);
  int e;
    while (gcd(e, fn) != 1) {
     e = (rand() % fn-2) + 2;
   };
   int d;
   int i;
   for (i=1;; i++) {
        if ( ((i*e) % fn)==1) {
            d=i;
            break;
        }    
    }   

  printf("%d\n", p);
  printf("%d\n", q);
  printf("%d\n", n);
  printf("%d\n",fn );
  printf("%d\n",e );
  printf("Public-%d,%d\n",n, e);
  printf("Private-%d,%d\n",n, d);
  return 0;
}
