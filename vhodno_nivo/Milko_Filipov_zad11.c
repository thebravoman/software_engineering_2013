#include <stdio.h>

int main(){
   int x = 0;
   int N = 3;
   int p = 4;
   
   while((x<0) || (x>1)){
      printf("Vuvedi x:");
      scanf("%d", &x );
      };
      
   while((4/N)>x){
      p=p-4/N;
      N=N+2;
      p=p+4/N;
      };
      printf("%d,p");
      
