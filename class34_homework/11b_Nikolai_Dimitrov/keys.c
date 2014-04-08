#include<stdlib.h>
#include<stdio.h>

int gcd(int a, int b) {
	if (b == 0) {
		return a;
	} else {
		return gcd(b, a % b);
	}
}
int main(){
srand(time(NULL));
int index1 = rand() % 23;
int index2 = rand() % 23;
int numbers [] = {131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251};
int p = numbers[index1];
int q = numbers[index2];
	if(p == q){
		q = numbers[index2];
	}
int n = p*q;
int fn = (p-1)*(q-1);
int e = (rand() % fn-2) + 2;
	while (gcd(e, fn) != 1) {
    	e = (rand() % fn-2) + 2;  
  	};
int d;
int i = 1;
while(i=i){
    if(d*e % fn == 1) {
      break;
    }
    d++;
  }
printf("Public key: %d, %d\n",n, e);
printf("Private key: %d ,%d\n",n, d);
return 0;
}
