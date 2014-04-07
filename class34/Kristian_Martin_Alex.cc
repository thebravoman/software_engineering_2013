#include <iostream>
#include <stdlib.h>
using namespace std;

int prime_num (int a,long int b){
	int i, i2;
	int i3=0;	
	int array[100000];
	bool prime;
	for (i=a; i<b; i++){
		prime=true;
		for (i2=2; i2<i; i2++){
			if (i%i2 == 0){ 
				prime=false;
			}
		}
		if (prime=true){
			array[i3]=i;
			i3++;
		}
	}
	i = rand() %i3;
	return array[i];
}

int main(){
	int p=prime_num(128, 256);
	int q=prime_num(128, 256);
	
	long int n=p*q;
	
	long int fn=(p-1)*(q-1);
	
	long int e=prime_num(1, fn);

	cout << "p = " << p << endl;
	cout << "q = " << q << endl;
	cout << "n = " << n << endl;
	cout << "fn = " << fn << endl;
	cout << "e = " << e << endl;
	
	int d;
	
	for(int i=1; i<100; i++){
		if (((fn+1)*n)%e==0){
			d=i;
			break;
		}
	}
	
	cout << "d = " << d << endl;
	
	int msg;
	cout >> "input num" >> endl;
	cin << msg;
		
	return 0;
}

// BMW e36 316i Sedan
