#include <iostream>
#include <math.h>
#include <stdlib.h>
#include "InfInt.h"
using namespace std;

InfInt power(unsigned int num, unsigned int exp){
	InfInt pow = 1;
	for(int i = 0; i < exp; ++i){
		pow *= num;
	}
	return pow;
}

int main(int argc, char** argv){
	unsigned int n, e, d, m;
	if(argc < 6)exit(0);
	n = atoi(argv[1]);
	e = atoi(argv[2]);
	d =	atoi(argv[3]);
	m = atoi(argv[4]);
	char* op = argv[5];

	if(op[0] == 'e'){
		InfInt c = power(m, e)%n;
		cout << c << endl;
	}
	else{
		cout << "DADFUQ" << endl;
		InfInt dm = power(m, d)%n;
		cout << dm << endl;
	}

	return 0;
}
