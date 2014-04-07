#include <iostream>
#include <stdlib.h>
#include <time.h>
#include <limits.h>
using namespace std;


bool isPrime(unsigned short num){
	for(int i = 2; i < num; ++i){
		if(!(num%i))return false;
	}
	return true;
}

unsigned GCD(unsigned u, unsigned v) {
    while ( v != 0) {
        unsigned r = u % v;
        u = v;
        v = r;
    }
    return u;
}

int main(){
	srand(time(NULL));
	unsigned short p, q;
	A:
	do{
		p = rand()%384;
		p += 128;
	}while(!isPrime(p));
	do{
		q = rand()%384;
		q += 128;
	}while(!isPrime(q));
	if(p==q)goto A;
	int n = p*q;
	int fn = (p-1)*(q-1);
	unsigned int e;
	do{
		e = rand()%(fn-1);
		e++;
	}while(GCD(e, fn)!=1);

	unsigned int d;
	for(int i = 1; i < INT_MAX; ++i){
		if(!((fn*i + 1)%e)){
			d = (fn*i + 1)/e;
			break;
		}
	}
	cout << "public: " << n << " " << e << endl;
	cout << "private: " << n << " " << d << endl;

	return 0;
}
