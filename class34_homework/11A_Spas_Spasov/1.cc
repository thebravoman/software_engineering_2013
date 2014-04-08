#include <iostream>
#include <stdlib.h>
#include <time.h>
#include <stdio.h>
using namespace std;
int main ()
{
  srand ( time(NULL) ); //initialize the random seed
 
 
  const int arrayNum[66] = {131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509};
 
  int RandIndex = rand() % 66; //generates a random number between 0 and 3
 // cout << arrayNum[RandIndex]<<endl;
int p,q,n,fn,e;
  p= arrayNum[rand() % 66];
  q= arrayNum[rand() % 66];
  n=p*q;
  fn = (p-1) * (q-1);
 
   e = rand() / (RAND_MAX / fn + 1);
       
        int  gcd;
        for(int i=1;i<=e&&i<=fn;i++){
 
 
     if(e%i==0 && fn%i == 0 ){
 
                     gcd=i;
 
        if(gcd!=1){
       
     e = rand() / (RAND_MAX / fn + 1);
     i=1;
        }
       
   }
 
}
 
int d = 1;
  while(1){
    if(d*e % fn == 1) {
      break;
    }
    d++;
  }
   pub[]= {'n','e'};
   priv[]= {'n','d'};
  cout <<"p="<< p <<" "<<"q="<< q <<" "<<"n="<< n <<" " << "fn=" << fn<<" "<<"e="<<e<<" "<<"d="<<" "<<d<<endl;
  printf("Public: %s\n", pub);
  printf("Private: %s\n", priv);
}
