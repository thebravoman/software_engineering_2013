#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

bool check_if_prime(int n) {
	for(int i=2;i<n;++i) {
		if(n%i==0) {
			return false;
		}
	}
	return true;
}

int get_prime_number(int bound, int precise) {
	int n;
	
	while(true) {
		n=rand()/(RAND_MAX/bound)+precise;
		if(check_if_prime(n)) {
			break;
		}
	}
	return n;
}

int gcdr(int a, int b) {
	if (a==0) {
		return b;
	}
	return gcdr(b%a, a);
}

int main() {
	srand((unsigned)time(NULL));
	int p, q, n, fn, e, d;
	
	p=get_prime_number(384, 128);
	do {
		q=get_prime_number(384, 128);
	} while(p==q);
	
	n=p*q;
	fn=(p-1)*(q-1);
	do {
		e=get_prime_number(fn-3, 2);
	} while(gcdr(fn, e)!=1);
	
	int i=1;
	while(true) {
		if((fn*i+1)%e==0) {
			d=(fn*i+1)/e;
			break;
		}
		++i;
	}
	
	cout << n << ' ' << e << endl;
	cout << n << ' ' << d << endl;

	return 0;
}
