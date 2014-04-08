#include <iostream>
#include <stdlib.h>
#include <math.h>
#include <time.h>

using namespace std;

bool check_prime(int n){
    for(int i=2;i<n;i++){
            if(n%i==0){
                return false;
            }
    }
    return true;
}

int find_prims(int* &prim,int a,int b){
     int primes_num=0;
     for(int i=a;i<b;i++){
          if(check_prime(i)){
                primes_num++;
                prim =(int*)realloc(prim,primes_num*sizeof(int));
                prim[primes_num-1]=i;
          }   
     }
     return primes_num;
}

int main(){
    
    srand (time(NULL));
    
    int* prim=(int*)malloc(0*sizeof(int));
    
    int p = prim[rand() % find_prims(prim,64,128)],
        q = prim[rand() % find_prims(prim,32,256)];
        
    int n = p*q,
        fn = (p-1)*(q-1);
    
    long int e = prim[rand() % find_prims(prim,2,fn)],d=0;

    while(1){
        if(e*d % fn ==1) break;
        d++;
    }
    
    cout<< "P: "<< p << endl << "Q: " << q << endl << "FN: "<< fn << endl << endl;
    
    cout<<"Public key is: (N = "<<n<< ", E = "<< e << " );" << endl;
    cout<<"Private key is: (N = "<<n<< ", D = "<< d << " );"<< endl;
    
    return 0;
}
