#include <iostream>
#include <math.h>
#include <stdlib.h>
#include "InfInt.h"
using namespace std;

InfInt power(InfInt value, InfInt power){
	InfInt pow = 1;
	while (power > 0){
		if (power % 2 == 1)pow *= value;
		value *= value;
		power /= 2;
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
		InfInt dm = power(m, d)%n;
		cout << dm << endl;
	}

	return 0;
}
