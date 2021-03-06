#include<stdio.h>

int gcd (int x, int y) {
  int m,i;
  if(x>y)
       m=y;
  else
       m=x;

  for(i=m;i>=1;i--){
    if(x%i==0&&y%i==0){
       break;
    }
  }
  return i;
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
  int e = (rand() % fn-2) + 2;
  while (gcd(e, fn) != 1) {
    e = (rand() % fn-2) + 2;  
  }
  
  int d = 1;
  while(1){
    if(d*e % fn == 1) {
      break;
    }
    d++;
  }
  printf("p = %d\n",p);
  printf("q = %d\n",q);
  printf("n = %d\n",n);
  printf("fn = %d\n",fn);
  printf("e = %d\n",e);
  printf("d = %d\n",d);
  printf("publickey = %d, %d\n",n, e);
  printf("privatekey = %d, %d\n",n, d);
  return 0;
}
